import 'package:flutter/material.dart';
import 'package:navi/locationFormMultipleSelect.dart';
class LocationForm extends StatelessWidget {
  const LocationForm({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
 return Container(
                                      height: 320,
              decoration: BoxDecoration(color: Color.fromARGB(178, 0, 102, 51),borderRadius: BorderRadius.circular(15.0),),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Column(
                                          children: [
                                            MaterialButton(onPressed: () {
                                              
                                            },
                                            color:Colors.white,
                                            textColor: Color.fromARGB(178, 0, 102, 51),
                                            child: Icon(Icons.pin_drop,size: 50,),padding: EdgeInsets.all(16),shape: CircleBorder(),),
                                            SizedBox(height: 10,),
                                            Center(child: Text("Allow up to Access the location", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),)),
                                            SizedBox(height: 5,),
                                            Center(child: Text("OR", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 15),)),
                                            SizedBox(height: 5,),
                                            Container(
                                              height: 50,
                                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                                              child: TextField(
                                                textAlign: TextAlign.center,
                                                
                                                decoration: InputDecoration.collapsed(hintText: "Enter the Address Manually"),
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
                                    context: context, builder: (context)=>ChoiceRow());
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