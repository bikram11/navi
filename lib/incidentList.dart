import 'package:flutter/material.dart';

import 'incident.dart';
import 'package:flutter_tts/flutter_tts.dart';

class IncidentList extends StatefulWidget {
  final List<Incident> incidentList;


 IncidentList(this.incidentList );

  @override
  State<IncidentList> createState() => _IncidentListState();
}

class _IncidentListState extends State<IncidentList> {
  final FlutterTts flutterTts = FlutterTts();
    Future _speak(String abc) async {


    if (abc != null) {
      if (abc!.isNotEmpty) {
        await flutterTts.speak(abc!);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.widget.incidentList.length,
      itemBuilder: (context,index){
        var incident = this.widget.incidentList[index];
        return Card(
          child: Row(children: [
            Expanded(child: ListTile(title: Text(incident.type),subtitle: 
                GestureDetector(
                  onTap: () {
                    String temp = incident.inc +" at "+ incident.timeStamp;



                  },
                  
                  child: Text(incident.inc +" at "+ incident.timeStamp)),
              
            )),
          ],),
        );
      },

    );
  }
}