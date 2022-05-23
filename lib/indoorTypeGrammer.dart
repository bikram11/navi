import 'package:flutter/material.dart';
import 'package:navi/indoorTypeFloor.dart';
import 'package:navi/uploadImage.dart';

import 'incidentDetail.dart';


//choice row
class IndoorTypeGrammer extends StatefulWidget {
    final String classLabel;
    final String tempTextupdate;
  const IndoorTypeGrammer(this.tempTextupdate,this.classLabel, { Key? key }) : super(key: key);

  @override
  _IndoorTypeGrammerState createState() => _IndoorTypeGrammerState();
}

class _IndoorTypeGrammerState extends State<IndoorTypeGrammer> {
 
  String classChoice = '_______';
      bool isPressedOne = false;
    bool isPressedTwo = false;
    bool isPressedThree = false;
    bool isPressedFour = false;

@override
  void initState(){
    super.initState();
   classChoice = widget.tempTextupdate +" was found ";
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
            Center(child: Text(classChoice + "__________________", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),)),
                                            SizedBox(height: 20,),
            FittedBox(
              child: Row(
                
                children: [
                  GestureDetector(
                  onTap: () {
                    setState(() {
                      isPressedOne = !isPressedOne;
                      isPressedTwo=false;
                      isPressedThree = false;
                      isPressedFour = false;
                      classChoice = widget.tempTextupdate +" was found not working";
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
                "not working",
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
              isPressedThree = false;
                      isPressedFour = false;
                      classChoice = widget.tempTextupdate +" was found stuck midway";
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
                "stuck midway",
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
            SizedBox(width: 10),
                  GestureDetector(
                  onTap: () {
                    setState(() {
                      isPressedThree = !isPressedThree;
                      isPressedOne=false;
                      isPressedTwo=false;
                      isPressedFour = false;
                      classChoice = widget.tempTextupdate +" was found to open too quick";
                    });
                  },
                  child: Container(
                    
                   
                    decoration: BoxDecoration(
                      color: isPressedThree ? Colors.white : Colors.white10,
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
                "open too quick",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: isPressedThree ? Color.fromARGB(178, 0, 102, 51):Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
                      ),
                    ),
                  )),
            
                  SizedBox(width: 10),
                  GestureDetector(
                  onTap: () {
                    setState(() {
                      isPressedFour = !isPressedFour;
                      isPressedOne=false;
                      isPressedTwo=false;
                      isPressedThree = false;
                      classChoice = widget.tempTextupdate +" was found to close too quick";
                    });
                  },
                  child: Container(
                    
                   
                    decoration: BoxDecoration(
                      color: isPressedFour ? Colors.white : Colors.white10,
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
                "close too quick",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: isPressedFour ? Color.fromARGB(178, 0, 102, 51):Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
                      ),
                    ),
                  )),
                  
                       
                 
                ],
              ),
            ),
            GestureDetector(
                                onTap: (){
                                  Navigator.pop(context);
                                  showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      
                                    ),
                                    context: context, builder: (context)=>IndoorTypeFloor(classChoice,widget.classLabel));
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