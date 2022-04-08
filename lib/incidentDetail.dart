import 'package:flutter/material.dart';
import 'package:navi/uploadImage.dart';

class IncidentSelect extends StatefulWidget {
  final String classChoice;
  const IncidentSelect(this.classChoice, { Key? key }) : super(key: key);

  @override
  State<IncidentSelect> createState() => _IncidentSelect();
}

class _IncidentSelect extends State<IncidentSelect> {
  String dropDownvalue1 = "Johnson Center";
  String dropDownvalue2 = "SUB-1";

  var buildings = [
    'Johnson Center',
    'Horizon Hall',
    'SUB-1',
    'Enterprise Building'
  ];
  var tempBuildings =  [
    'Johnson Center',
    'Horizon Hall',
    'SUB-1',
    'Enterprise Building'
  ];
      late String _classed;

  @override
  void initState() {
    super.initState();
    _classed = widget.classChoice;
  }
  @override
  Widget build(BuildContext context) {
  return Container(
      height: 275,
              decoration: BoxDecoration(color: Color.fromARGB(178, 0, 102, 51),borderRadius: BorderRadius.circular(15.0),),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Center(child: Text("The obstacle was found connecting", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),)),
                                            SizedBox(height: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                DecoratedBox(
                  
                  decoration: ShapeDecoration(
                    
                    color: Colors.white,
                    shape:RoundedRectangleBorder(side: BorderSide(width:1.0, style: BorderStyle.solid,color: Colors.white),borderRadius: BorderRadius.all(Radius.circular(10)))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:  18.0),
                    child: DropdownButton(
                      value: dropDownvalue1,
                      style: TextStyle(fontWeight: FontWeight.bold,color:Color.fromARGB(178, 0, 102, 51) ),  
                      
                     items: buildings.map((String item)
                    {
                      return DropdownMenuItem( child: Text(item),value: item,);
                    }).toList(), onChanged: (String? newValue){
                      setState(() {
                        dropDownvalue1 = newValue!;
                    
    
                      });
                    }),
                  ),
                ),
                 SizedBox(height: 10,),
                 Center(child: Text("and", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15),)),
                                            SizedBox(height: 10,),
                DecoratedBox(
                  
                  decoration: ShapeDecoration(
                    
                    color: Colors.white,
                    shape:RoundedRectangleBorder(side: BorderSide(width:1.0, style: BorderStyle.solid,color: Colors.white),borderRadius: BorderRadius.all(Radius.circular(10)))
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:  18.0),
                    child: DropdownButton(
                      value: dropDownvalue2,
                      style: TextStyle(fontWeight: FontWeight.bold,color:Color.fromARGB(178, 0, 102, 51) ),  
                      
                     items: buildings.map((String item)
                    {
                      return DropdownMenuItem( child: Text(item),value: item,);
                    }).toList(), onChanged: (String? newValue){
                      setState(() {
                        dropDownvalue2 = newValue!;
                    
    
                      });
                    }),
                  ),
                ),
               
              ],
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