import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'incident.dart';


final database_ref = FirebaseDatabase.instance.reference();


DatabaseReference saveIncident(Incident incident){
  var id = database_ref.child('incidents/').push();
  id.set(incident.toJson());
  return id;
}

Future<List<Incident>> getallIncidents() async{
  DatabaseEvent dataSnapshot = await database_ref.child('incidents/').once();
 
  List<Incident> incidents = [];
  if(dataSnapshot.snapshot.value != null){
    Map<dynamic,dynamic> values= dataSnapshot.snapshot.value as Map;
    values.forEach((key,value){
      Incident incident = createIncident(value);
      incident.setId(database_ref.child('incidents/'+key));
      incidents.add(incident);
    });
  }
  
  
  return incidents;
}