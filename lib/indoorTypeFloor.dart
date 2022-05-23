import 'package:flutter/material.dart';
import 'package:navi/indoorTypeBuilding.dart';
import 'package:navi/uploadImage.dart';

import 'incidentDetail.dart';


//choice row
class IndoorTypeFloor extends StatefulWidget {
    final String classLabel;
    final String tempTextupdate;
  const IndoorTypeFloor(this.tempTextupdate,this.classLabel, { Key? key }) : super(key: key);

  @override
  _IndoorTypeFloorState createState() => _IndoorTypeFloorState();
}

class _IndoorTypeFloorState extends State<IndoorTypeFloor> {
  String initLevel = 'Ground Floor';
  
  String classChoice = '_______';
  List<String> floorLevels = ['Ground Floor',"First Floor","Second Floor","Third Floor","Fourth Floor","Fifth Floor"];

@override
  void initState(){
    super.initState();
   classChoice = widget.tempTextupdate +" on the ";
  }
  @override
  Widget build(BuildContext context) {


    return Container(
      height: 270,
              decoration: BoxDecoration(color: Color.fromARGB(178, 0, 102, 51),borderRadius: BorderRadius.circular(15.0),),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Center(child: Text(classChoice + "________________", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),)),
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
                       classChoice = widget.tempTextupdate + " on the "+initLevel + " of ";      
                });
              },
              // Array list of items
              items: floorLevels.map((String items) {
                return DropdownMenuItem(
                              value: items,
                              child: Text(floorLevels.indexOf(items).toString()+" - "+ items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              
                      )
              ),
            ),
            GestureDetector(
                                onTap: (){
                                  Navigator.pop(context);
                                  showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      
                                    ),
                                    context: context, builder: (context)=>IndoorTypeBuilding(classChoice,widget.classLabel));
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