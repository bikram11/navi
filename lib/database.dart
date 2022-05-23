import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:navi/masonLoca.dart';
import 'incident.dart';


final database_ref = FirebaseDatabase.instance.reference();
List<List> loca = [["Aquatic and Fitness Center",38.826665, -77.304371],
["Aquia Building",38.831853, -77.309824],
["Art and Design Building",38.828215, -77.306260],
["Buchanan Hall",38.828613, -77.308344],
["Carow Hall",38.831547, -77.301545],
["Carty House",38.832742, -77.318679],
["Center for the Arts/Concert Hall",38.829160, -77.309565],
["Central Heating and Cooling Plant",38.8316594,-77.3049692],
["Child Development Center",38.835630, -77.304297],
["College Hall",38.829037, -77.307878],
["Cross Cottage",38.828882, -77.310970],
["David King Hall",38.830744, -77.307006],
["de Laski Performing Arts Building",38.830188, -77.308659],
["EagleBank Arena",38.826500, -77.310056],
["East Building",38.833103, -77.308044],
["Enterprise Hall",38.828898, -77.305812],
["Exploratory Hall",38.829322, -77.305353],
["Facilities Administration",38.832193, -77.302946],
["Facilities Management, Archives",38.832474, -77.301524],
["Fenwick Library",38.831584, -77.307381],
["Field House and Module",38.834387, -77.314545],
["Finley Building",38.833076, -77.308559],
["George Mason Statue",38.830362, -77.308562],
["Greenhouse",38.828102, -77.301536],
["Harris Theatre",38.830883, -77.309171],
["Horizon Hall",38.831057, -77.307526],
["Innovation Hall",38.828385, -77.306722],
["Johnson Center/Admissions",38.830061, -77.306868],
["Kelley II - 10716 Kelley Drive",38.831371, -77.318124],
["Krasnow Institute",38.830947, -77.300774],
["Krug Hall",38.832497, -77.308152],
["Lecture Hall",38.833178, -77.307858],
["Merten Hall",38.834868, -77.307801],
["Music/Theater Building",38.829250, -77.308311],
["Nguyen Engineering Building",38.827678, -77.304860],
["Northeast Module",38.834698, -77.304344],
["Northeast Module II",38.834698, -77.304344],
["Nottoway Annex",38.825617, -77.305695],
["Parking Deck, Mason Pond",38.830579, -77.309009],
["Parking Deck, Rappahannock River",38.834212, -77.306381],
["Parking Deck, Shenandoah",38.829185, -77.304822],
["Parking Services",38.828983, -77.305280],
["Peterson Hall",38.834115, -77.308449],
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