import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:navi/directionOwn.dart';
import 'dart:convert';

import 'database.dart';
import 'locationFormMultipleSelect.dart';
import 'masonLoca.dart';

class NetworkHelper {
  NetworkHelper(
      {required this.startLng,
      required this.startLat,
      required this.endLng,
      required this.endLat});

  final String url = 'https://api.openrouteservice.org/v2/directions/';
  final String apiKey =
      '5b3ce3597851110001cf62486d5cfc78392446fba599f60bfeffe0dd';
  final String journeyMode =
      'foot-walking'; // Change it if you want or make it variable
  final double startLng;
  final double startLat;
  final double endLng;
  final double endLat;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(
        '$url$journeyMode?api_key=$apiKey&start=$startLng,$startLat&end=$endLng,$endLat'));
    print(
        "$url$journeyMode?$apiKey&start=$startLng,$startLat&end=$endLng,$endLat");

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
class DrawPath extends StatefulWidget {
  final MasonLoca srcLoca;
  final MasonLoca desLoca;
 
   const DrawPath(this.srcLoca,this.desLoca, { Key? key }) : super(key: key);

  @override
  State<DrawPath> createState() => _DrawPathState();
}

class _DrawPathState extends State<DrawPath> {

 static const String route = 'polyline';

  List<MasonLoca> locations = [];


  Future<void> updateLocations()async {
    getallMasonLoca().then((locations)=>{
      this.setState(() {
        this.locations = locations;
      })
    });
  }

  @override
  void initState(){
    super.initState();
    updateLocations();

  }

  @override
  Widget build(BuildContext context) {
    final List<LatLng> polyPoints = []; // For holding Co-ordinates as LatLng
    final Set<Polyline> polyLines = {}; // For holding instance of Polyline
    final List<Marker> markers = []; // For holding instance of Marker
    var data;
    List<dynamic> summary = [];
    
    // Dummy Start and Destination Points
    double startLat = widget.srcLoca.locaLong;
    double startLng = widget.srcLoca.locaLati;
    double endLat = widget.desLoca.locaLong;
    double endLng =widget.desLoca.locaLati;
    markers.add(
                      Marker(
                        width: 150.0,
                        height: 150.0,
                        point: LatLng(startLat,startLng),
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 35.0,
                        ),
                      ),
                    );
                    markers.add(
                      Marker(
                        width: 150.0,
                        height: 150.0,
                        point: LatLng(endLat,endLng),
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.green,
                          size: 35.0,
                        ),
                      ),
                    );
    var points = <LatLng>[];

    var pointsGradient = <LatLng>[
      LatLng(startLat, startLng),
      LatLng(endLat, endLng),
    ];

    void getJsonData() async {
      // Create an instance of Class NetworkHelper which uses http package
      // for requesting data to the server and receiving response as JSON format

      NetworkHelper network = NetworkHelper(
        startLat: startLat,
        startLng: startLng,
        endLat: endLat,
        endLng: endLng,
      );

      try {
        // getData() returns a json Decoded data
        data = await network.getData();

        // We can reach to our desired JSON data manually as following
        LineString ls =
            LineString(data['features'][0]['geometry']['coordinates']);

        summary = (data['features'][0]['properties']['segments'][0]['steps']);
        for (int i = 0; i < ls.lineString.length; i++) {
          polyPoints.add(LatLng(ls.lineString[i][1], ls.lineString[i][0]));
        }

        if (polyPoints.length == ls.lineString.length) {
          print(ls);
          //print(polyPoints);
        }
      } catch (e) {
        print(e);
        //print(polyPoints);
      }
    }

    getJsonData();
    print(polyPoints);
      var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           Padding(
             padding: const EdgeInsets.fromLTRB(25.0,0,0,0),
             child: FloatingActionButton( onPressed: () {
                // Add your onPressed code here!
                 showModalBottomSheet(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                        
                                      ),
                                      context: context, builder: (context)=>OwnDirection(summary));
              },
              backgroundColor: Colors.green,
              
              child: const Icon(Icons.directions,size: 30,)),
           ),
             FloatingActionButton( onPressed: () {
              // Add your onPressed code here!
            },
            backgroundColor: Colors.red,
            child: const Icon(Icons.warning,size: 30,)),
          FloatingActionButton( onPressed: () {
              // Add your onPressed code here!
               showModalBottomSheet(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                        
                                      ),
                                      context: context, builder: (context)=>ChoiceRow());
            },
            backgroundColor: Colors.blue,
            child: const Icon(Icons.info,size: 30,)),
        ],
      ),
      body: Column(
        children: [
          Stack(
        children: [
          Container(
            height: size.height*0.3,
            decoration: BoxDecoration(color: Color.fromARGB(178, 0, 102, 51)),
 
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                 Icon(Icons.zoom_out_map_rounded,color: Colors.white,size: 30,),
                   Container(
                     decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                     child: Padding(
                       padding: const EdgeInsets.symmetric(vertical:3.0,horizontal: 8),
                       child: DropdownButton(
              
            // Initial Value
            dropdownColor: Colors.white,
            value: widget.srcLoca.locaName,
              
            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),    
            onChanged: (String? newValue) { 
              setState(() {
                        locations.forEach((element) {if(element.locaName==newValue){
                          setState(() {
                            Navigator.pop(context);
                             Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  DrawPath(element,widget.desLoca)),
  );
                          });
                        }});
              });
            },
            // Array list of items
            items: locations.map((MasonLoca items) {
              return DropdownMenuItem(
                        value: items.locaName.toString(),
                        child: Text(items.locaName),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            
          ),
                     ),
                   ),
                 ],
               ),
              SizedBox(height: 20,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                 Icon(Icons.zoom_in_map_rounded,color: Colors.white,size: 30,),
                   Container(
                     decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                     child: Padding(
                       padding: const EdgeInsets.symmetric(vertical:3.0,horizontal: 8),
                       child: DropdownButton(
              
            // Initial Value
            dropdownColor: Colors.white,
            value: widget.desLoca.locaName,
              
            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),    
            onChanged: (String? newValue) { 
              setState(() {
                        locations.forEach((element) {if(element.locaName==newValue){
                          setState(() {
                            Navigator.pop(context);
                             Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  DrawPath(widget.srcLoca,element)),
  );
                          });
                        }});
              });
            },
            // Array list of items
            items: locations.map((MasonLoca items) {
              return DropdownMenuItem(
                        value: items.locaName.toString(),
                        child: Text(items.locaName),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            
          ),
                     ),
                   ),
                 ],
               ),
               ],
              ),
            ),
          )
        ],),
         
          Flexible(
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(startLat, startLng),
                zoom: 16.0,
                
              ),
              layers: [MarkerLayerOptions(
              markers: [
                Marker(width: 80,height: 80, point: markers[0].point, builder:  (context)=>Container(child: Icon(Icons.pin_drop,size: 20,color: Colors.green,),)),
                Marker(width: 80,height: 80,point: markers[1].point, builder:  (context)=>Container(child: Icon(Icons.pin_drop,size: 20,color: Colors.red,))),
                
              ],
            ),
                TileLayerOptions(
                    urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c']),
                PolylineLayerOptions(
                  polylines: [
                    Polyline(
                        points: polyPoints,
                        strokeWidth: 4.0,
                        color: Colors.purple),
                  ],
                  
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
  
}
//Create a new class to hold the Co-ordinates we've received from the response data

class LineString {
  LineString(this.lineString);
  List<dynamic> lineString;
}

