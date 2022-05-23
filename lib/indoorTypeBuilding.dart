import 'package:flutter/material.dart';
import 'package:navi/uploadImage.dart';

import 'database.dart';
import 'incidentDetail.dart';
import 'masonLoca.dart';


//choice row
class IndoorTypeBuilding extends StatefulWidget {
    final String classLabel;
    final String tempTextupdate;
  const IndoorTypeBuilding(this.tempTextupdate,this.classLabel, { Key? key }) : super(key: key);

  @override
  _IndoorTypeBuildingState createState() => _IndoorTypeBuildingState();
}

class _IndoorTypeBuildingState extends State<IndoorTypeBuilding> {
  String initLevel = 'Aquatic and Fitness Center';
  String classChoice = '_______';
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
   classChoice = widget.tempTextupdate +" the ";
  }
  @override
  Widget build(BuildContext context) {


    return Container(
      height: 300,
              decoration: BoxDecoration(color: Color.fromARGB(178, 0, 102, 51),borderRadius: BorderRadius.circular(15.0),),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Center(child: Text(classChoice , style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),)),
                                            SizedBox(height: 20,),
             Container(
                     decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                     child: Padding(
                       padding: const EdgeInsets.symmetric(vertical:3.0,horizontal: 8),
                child:     DropdownButton(
              
            // Initial Value
            dropdownColor: Colors.white,
            value: initLevel,
              
            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),    
            onChanged: (String? newValue) { 
              setState(() {
                            initLevel = newValue!;
                             classChoice = widget.tempTextupdate + " the "+initLevel;  
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
            GestureDetector(
                                onTap: (){
                                  Navigator.pop(context);
                                  showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      
                                    ),
                                    context: context, builder: (context)=>ImageUpload(widget.classLabel,"There was an incident reported "+classChoice.substring(41)));
                                },
              child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                
                                height: 50,
                                decoration: BoxDecoration(color: Colors.redAccent,
                                border: Border.all(color: Color.fromARGB(0, 0, 0, 0)),
                                borderRadius: BorderRadius.all(Radius.circular(10))),
                                child:Center(child: Text("Next", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),)),
                              ),
                            ),
            ),
          ],
        ),
      ),
    );
  }
}