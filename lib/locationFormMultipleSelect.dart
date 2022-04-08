import 'package:flutter/material.dart';
import 'package:navi/uploadImage.dart';

import 'incidentDetail.dart';
  String classChoice = '';
class ChoiceButton extends StatefulWidget {
  final String label;
  final bool isPressed;
  
  
  const ChoiceButton({
    Key? key,
    this.isPressed = false,
    required this.label,
  }) : super(key: key);

  @override
  _ChoiceButtonState createState() => _ChoiceButtonState();
}

class _ChoiceButtonState extends State<ChoiceButton> {
  late bool _isPressed;

  @override
  void initState() {
    super.initState();
    _isPressed = widget.isPressed;
    classChoice = widget.label;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isPressed = !_isPressed;
          classChoice = widget.label;
        });
      },
      child: Container(
        height: 120,
        width: 150,
        decoration: BoxDecoration(
          color: _isPressed ? Colors.white : Colors.white70,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            
            color: Colors.white70,
            width: 80 * 0.05,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Icon(widget.label=="Indoors"?Icons.elevator_rounded:Icons.map_rounded,color: Color.fromARGB(178, 0, 102, 51),size: 30,),
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(178, 0, 102, 51),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//choice row
class ChoiceRow extends StatefulWidget {
  @override
  _ChoiceRowState createState() => _ChoiceRowState();
}

class _ChoiceRowState extends State<ChoiceRow> {
  bool isPressed = false;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
              decoration: BoxDecoration(color: Color.fromARGB(178, 0, 102, 51),borderRadius: BorderRadius.circular(15.0),),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Center(child: Text("Where did you find the Incident?", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),)),
                                            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                ChoiceButton(
                  
                  isPressed: isPressed,
                  label: 'Outdoors',
                  
                ),
                SizedBox(width: 10),
                ChoiceButton(
                  isPressed: isPressed,
                  label: 'Indoors',
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
                                    context: context, builder: (context)=>IncidentSelect(classChoice));
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