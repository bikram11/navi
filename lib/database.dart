import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:navi/masonLoca.dart';
import 'incident.dart';


final database_ref = FirebaseDatabase.instance.reference();
List<List> loca = [["Aquatic and Fitness Center",38.8264251,-77.3064282],
["Aquia Building",38.8320725,-77.3116064],
["Art and Design Building",38.827989,-77.3085147],
["Buchanan Hall",38.8288041,-77.3107454],
["Carow Hall",38.831411,-77.3034433],
["Carty House",38.8318379,-77.3212147],
["Center for the Arts/Concert Hall",38.8294504,-77.3115664],
["Central Heating and Cooling Plant",38.8316594,-77.3049692],
["Child Development Center",38.8356435,-77.306876],
["College Hall",38.8289247,-77.3101186],
["Cross Cottage",38.828739,-77.3130975],
["David King Hall",38.8306015,-77.3088737],
["de Laski Performing Arts Building",38.8298841,-77.3107971],
["EagleBank Arena",38.826811,-77.3118073],
["East Building",38.8329854,-77.3104444],
["Enterprise Hall",38.8289473,-77.3085014],
["Exploratory Hall",38.8296521,-77.3076815],
["Facilities Administration",38.8323125,-77.305059],
["Facilities Management, Archives",38.8325663,-77.3037125],
["Fenwick Library",38.8319944,-77.3092078],
["Field House and Module",38.8341204,-77.3170976],
["Finley Building",38.8330545,-77.3110727],
["George Mason Statue",38.8304289,-77.3105991],
["Greenhouse",38.8280262,-77.3035555],
["Harris Theatre",38.8309367,-77.3107696],
["Horizon Hall",38.8310861,-77.3098006],
["Innovation Hall",38.8284842,-77.3096595],
["Johnson Center/Admissions",38.8297426,-77.309695],
["Kelley II - 10716 Kelley Drive",38.8314353,-77.3202947],
["Krasnow Institute",38.8311697,-77.3025631],
["Krug Hall",38.8324522,-77.3107137],
["Lecture Hall",38.8331798,-77.3097786],
["Merten Hall",38.8350572,-77.3101162],
["Music/Theater Building",38.8293132,-77.3102792],
["Nguyen Engineering Building",38.8275291,-77.3072581],
["Northeast Module",38.8345412,-77.3063156],
["Northeast Module II",38.8344607,-77.3063558],
["Nottoway Annex",38.825425,-77.3076844],
["Parking Deck, Mason Pond",38.8305171,-77.311462],
["Parking Deck, Rappahannock River",38.8346329,-77.3082454],
["Parking Deck, Shenandoah",38.8289094,-77.3066856],
["Parking Services",38.8289412,-77.3073029],
["Peterson Hall",38.834208,-77.3110603],
["Planetary Hall",38.8298856,-77.30847],
["Police and Safety Headquarters",38.8352228,-77.3074357],
["Recreation and Athletic Complex (RAC)",38.8305345,-77.3146491],
["Recycling Center",38.8327158,-77.3030618],
["Research Hall",38.8283981,-77.3074825],
["Rivanna Module",38.8326017,-77.3062258],
["Student Union Building I",38.8316214,-77.3109749],
["The Hub",38.8308204,-77.3075497],
["Thompson Hall",38.8327503,-77.3121053],
["West Building",38.8325012,-77.311329]];

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


DatabaseReference saveMasonLoca(MasonLoca masonLoca){
  var id = database_ref.child('locations/').push();
  id.set(masonLoca.toJson());
  return id;
}

Future<List<MasonLoca>> getallMasonLoca() async{
  DatabaseEvent dataSnapshot = await database_ref.child('locations/').once();
 
  List<MasonLoca> locations = [];
  if(dataSnapshot.snapshot.value != null){
    Map<dynamic,dynamic> values= dataSnapshot.snapshot.value as Map;
    values.forEach((key,value){
      MasonLoca masonLoca = createMasonLoca(value);
      masonLoca.setId(database_ref.child('locations/'+key));
      locations.add(masonLoca);
    });
  }else{
    loca.forEach((element){

      var tempLoca = new MasonLoca(element[0],element[1],element[2]);
      tempLoca.setId(saveMasonLoca(tempLoca));
      locations.add(tempLoca);
    });
  }
  
  
  return locations;
}