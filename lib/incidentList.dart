import 'package:flutter/material.dart';

import 'incident.dart';


class IncidentList extends StatefulWidget {
  final List<Incident> incidentList;


 IncidentList(this.incidentList );

  @override
  State<IncidentList> createState() => _IncidentListState();
}

class _IncidentListState extends State<IncidentList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.widget.incidentList.length,
      itemBuilder: (context,index){
        var incident = this.widget.incidentList[index];
        return Card(
          child: Row(children: [
            Expanded(child: ListTile(title: Text(incident.type),subtitle: 
                Text(incident.inc +" at "+ incident.timeStamp),
              
            )),
          ],),
        );
      },

    );
  }
}