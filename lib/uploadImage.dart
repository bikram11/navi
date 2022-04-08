import 'package:flutter/material.dart';

import 'package:dotted_border/dotted_border.dart';
import 'package:intl/intl.dart';
import 'package:navi/database.dart';
import 'package:navi/homePage.dart';
import 'package:navi/incident.dart';
import 'package:navi/submitted.dart';


class ImageUpload extends StatefulWidget {
  final String classChoice;
  final String incident;

  const ImageUpload(this.classChoice,this.incident, { Key? key }) : super(key: key);

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {


    late String _classed;
    late String _incident;

  @override
  void initState() {
    super.initState();
    _classed = widget.classChoice;
    _incident = widget.incident;
  }

  void newIncident(String type,String inci){
  
    var dt = DateTime.now();

    var d12 = DateFormat('MM/dd/yyyy, hh:mm a').format(dt);
    var incidS = new Incident(type,inci,d12, "");
    
    incidS.setId(saveIncident(incidS));

  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 250,
              decoration: BoxDecoration(color: Color.fromARGB(178, 0, 102, 51),borderRadius: BorderRadius.circular(15.0),),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
             Center(child: Text("Would you like to include an Image?", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),)),
                                              SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DottedBorder(
                color: Colors.white,
                strokeWidth: 3,
              borderType: BorderType.RRect,
              radius: Radius.circular(12),
              padding: EdgeInsets.all(6),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: Container(
                  height: 100,
                  
                  child: Center(child:  Icon(Icons.camera_alt,color: Colors.white,size: 30,)),
                ),
              ),
    ),
            ),
             Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              
                              height: 50,
                              decoration: BoxDecoration(color: Colors.redAccent,
                              border: Border.all(color: Color.fromARGB(0, 0, 0, 0)),
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                              child:GestureDetector(
                                onTap: (){
                                  newIncident(_classed, _incident);
                                   
                                  Navigator.pop(context);
                                
                                  showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      
                                    ),
                                    context: context, builder: (context)=>SubmittedTha());
                                },
                                
                                
                                child: Center(child: Text("Submit", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),))),
                            ),
                          ),
          ],
        ),
      )
    );
  }
}