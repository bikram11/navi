
// ignore_for_file: deprecated_member_use

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:navi/database.dart';
import 'package:navi/incident.dart';
import 'package:navi/incidentList.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:navi/locationForm.dart';
import 'package:navi/locationFormMultipleSelect.dart';
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Incident> incidents = [];

  Future<void> updateIncidents()async {
    getallIncidents().then((incidents)=>{
      this.setState(() {
        this.incidents = incidents;
      })
    });
  }


  @override
  void initState(){
    super.initState();
    updateIncidents();
  }
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    var formatterDate = DateFormat.yMMMMd('en_US');
    var formatterTime = DateFormat.jm();
    String actualDate = formatterDate.format(now);
    String actualTime = formatterTime.format(now);
    var size = MediaQuery.of(context).size;
    const html = r'''<a class="twitter-timeline" href="https://twitter.com/GeorgeMasonNews?ref_src=twsrc%5Etfw">Tweets by GeorgeMasonNews</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>''';
    return Scaffold(
      body: Column(
        children: [
          Stack(
          children: [
            Container(
              height: size.height*0.6,
              decoration: BoxDecoration(color: Color.fromARGB(178, 0, 102, 51)),
 
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[Align(
                    alignment: Alignment.topRight,
                    child: Container(height: 52,width: 52,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(178, 0, 102, 100),
                      shape: BoxShape.circle
                    ),
                    child: Icon(Icons.vertical_distribute,color: Colors.white,size: 20,),
                    ),
                  ),
                  Text(actualDate, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                  Text(actualTime, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: size.height*0.35,
                      decoration: BoxDecoration(color: Colors.white,
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: RefreshIndicator(
                        onRefresh: updateIncidents,
                        child: IncidentList(incidents)),
          //             child: Html(
          // data: html,),
                    ),
                  )],
                ),
              ),
            )
          ],),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: size.width*0.40,
                              height: size.height*0.15,
                              decoration: BoxDecoration(color: Colors.white,
                              border: Border.all(color: Color.fromARGB(17, 0, 0, 0)),
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.elevator_rounded,color: Color.fromARGB(195, 0, 0, 0),size: 30,),
                                  Text("Indoor\nNavigation", style: TextStyle(color: Color.fromARGB(195, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 25),textAlign: TextAlign.center,),
                                ],
                              ),
                            
                            ),
                          ),
                                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: size.width*0.40,
                              height: size.height*0.15,
                              decoration: BoxDecoration(color: Colors.white,
                              border: Border.all(color: Color.fromARGB(17, 0, 0, 0)),
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                             child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.map_rounded,color: Color.fromARGB(195, 0, 0, 0),size: 30,),
                                  Text("Outdoor\nNavigation", style: TextStyle(color: Color.fromARGB(195, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 25),textAlign: TextAlign.center,),
                                ],
                              ),
                            
                            ),
                          ),
                ],
              ),
                                Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: size.width*0.80,
                              height: size.height*0.10,
                              decoration: BoxDecoration(color: Colors.redAccent,
                              border: Border.all(color: Color.fromARGB(0, 0, 0, 0)),
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                              child:GestureDetector(
                                onTap: (){
                                  showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      
                                    ),
                                    context: context, builder: (context)=>ChoiceRow());
                                },
                                
                                
                                child: Center(child: Text("Report an Incident", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),))),
                            ),
                          ),
            ],
          )
        ],
      ),
    );
  }
}