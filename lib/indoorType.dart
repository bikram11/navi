import 'package:flutter/material.dart';
import 'package:navi/indoorTypeGrammer.dart';
import 'package:navi/uploadImage.dart';

import 'incidentDetail.dart';


//choice row
class IndoorTypes extends StatefulWidget {
    final String classLabel;
  const IndoorTypes(this.classLabel, { Key? key }) : super(key: key);

  @override
  _IndoorTypesState createState() => _IndoorTypesState();
}

class _IndoorTypesState extends State<IndoorTypes> {
 
  String classChoice = '_______';
      bool isPressedOne = false;
    bool isPressedTwo = false;
@override
  void initState(){
    super.initState();
   classChoice = "I would like to report an "+ widget.classLabel + " obstacle that ";
  }
  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 250,
              decoration: BoxDecoration(color: Color.fromARGB(178, 0, 102, 51),borderRadius: BorderRadius.circular(15.0),),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Center(child: Text(classChoice +" _____________________", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),)),
                                            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
      onTap: () {
        setState(() {
          isPressedOne = !isPressedOne;
          isPressedTwo=false;
          classChoice = "I would like to report an "+ widget.classLabel + " obstacle that "+ "an Electric Door";
        });
      },
      child: Container(
        
       
        decoration: BoxDecoration(
          color: isPressedOne ? Colors.white : Colors.white10,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            
            color: Colors.white70,
            width: 3,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "An Electric Door",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isPressedOne ? Color.fromARGB(178, 0, 102, 51):Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      )),SizedBox(width: 10),
      GestureDetector(
      onTap: () {
        setState(() {
          isPressedTwo = !isPressedTwo;
          isPressedOne=false;
          classChoice = "I would like to report an "+ widget.classLabel + " obstacle that "+ "an Elevator";
        });
      },
      child: Container(
        
       
        decoration: BoxDecoration(
          color: isPressedTwo ? Colors.white : Colors.white10,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            
            color: Colors.white70,
            width: 3,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "An Elevator",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isPressedTwo ? Color.fromARGB(178, 0, 102, 51):Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      )),

                
           
               
              ],
            ),
            GestureDetector(
                                onTap: (){
                                  Navigator.pop(context);
                                  showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      
                                    ),
                                    context: context, builder: (context)=>IndoorTypeGrammer(classChoice,widget.classLabel));
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