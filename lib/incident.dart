import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'database.dart';

class Incident {
  String inc;
  String timeStamp;
  String type;
  String imageUrl;
  late DatabaseReference _id;

  Incident(this.type,this.inc, this.timeStamp,this.imageUrl);

  void setId(DatabaseReference id){
    this._id = id;
  }

  Map<String,dynamic> toJson(){
    return {
      'timeStamp':this.timeStamp,
      'incident':this.inc,
      'imageUrl':this.imageUrl,
      'type':this.type
    };
  }
}

Incident createIncident(record){
  Map<String, dynamic> attributes = {
    'incident': '',
    'timeStamp':'',
    'type':''
  };

  record.forEach((key,value)=>{attributes[key]=value});

  Incident incident = new Incident(attributes['type'], attributes['incident'], attributes['timeStamp'], "");
  return incident;
}