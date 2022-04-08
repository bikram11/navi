import 'package:flutter/material.dart';

class SubmittedTha extends StatelessWidget {
  const SubmittedTha({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
              decoration: BoxDecoration(color: Color.fromARGB(178, 0, 102, 51),borderRadius: BorderRadius.circular(15.0),),
              child: Padding(padding: const EdgeInsets.all(8.0),
              child: Column(children: [

                 Icon(Icons.check_circle_rounded,color: Colors.white,size: 40,),
                 SizedBox(width: 20,),
                 Text("Thank you for submitting the incident. It's been successfully reported", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),textAlign: TextAlign.center,)
              ]),),
    );
  }
}