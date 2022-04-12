import 'package:flutter/material.dart';
import 'package:navi/uploadImage.dart';

import 'database.dart';
import 'masonLoca.dart';

class IncidentSelect extends StatefulWidget {
  final String classChoice;
  const IncidentSelect(this.classChoice, { Key? key }) : super(key: key);

  @override
  State<IncidentSelect> createState() => _IncidentSelect();
}

class _IncidentSelect extends State<IncidentSelect> {
  String dropDownvalue1 = "Nguyen Engineering Building";
  String dropDownvalue2 = "Music/Theater Building";
 List<MasonLoca> locations = [];
 List<MasonLoca> tempLocations = [];

  Future<void> updateLocations()async {
    getallMasonLoca().then((locations)=>{
      this.setState(() {
        this.locations = locations;
        this.tempLocations = locations;
      })
    });
  }
 
      late String _classed;

  @override
  void initState() {
    super.initState();
    updateLocations();
    _classed = widget.classChoice;
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
            Center(child: Text("The obstacle was found connecting", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),)),
                                            SizedBox(height: 10,),
           
           Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                 Icon(Icons.zoom_out_map_rounded,color: Colors.white,size: 24,),
                   Container(
                     decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                     child: Padding(
                       padding: const EdgeInsets.symmetric(vertical:3.0,horizontal: 8),
                       child: DropdownButton(
              
            // Initial Value
            dropdownColor: Colors.white,
            value: dropDownvalue1,
              
            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),    
            onChanged: (String? newValue) { 
              setState(() {
                dropDownvalue1 = newValue!;
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
              SizedBox(height: 10,),
            
                 Center(child: Text("and", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15),)),
                                            SizedBox(height: 10,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                 Icon(Icons.zoom_in_map_rounded,color: Colors.white,size: 24,),
                   Container(
                     decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                     child: Padding(
                       padding: const EdgeInsets.symmetric(vertical:3.0,horizontal: 8),
                       child: DropdownButton(
              
            // Initial Value
            dropdownColor: Colors.white,
            value: dropDownvalue2,
              
            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),    
            onChanged: (String? newValue) { 
              setState(() {
                         dropDownvalue2 = newValue!;
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
          
           
            Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              
                              height: 50,
                              decoration: BoxDecoration(color: Colors.redAccent,
                              border: Border.all(color: Color.fromARGB(0, 0, 0, 0)),
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                              child:GestureDetector(
                                onTap: (){
                                  Navigator.pop(context);
                                  showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      
                                    ),
                                    context: context, builder: (context)=>ImageUpload(_classed,"There was a incident reported in the sidewalk connecting "+dropDownvalue1+" and "+dropDownvalue2));
                                },
                                
                                
                                child: Center(child: Text("Next", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),))),
                            ),
                          ),
          ],
        ),
      ),
    );
  
  }
}