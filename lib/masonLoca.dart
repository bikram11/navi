import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'database.dart';

class MasonLoca {
  String locaName;
  double locaLong;
  double locaLati;
  late DatabaseReference _id;

  MasonLoca(this.locaName,this.locaLong, this.locaLati);

  void setId(DatabaseReference id){
    this._id = id;
  }

  Map<String,dynamic> toJson(){
    return {
      'locaName':this.locaName,
      'locaLong':this.locaLong,
      'locaLati':this.locaLati,

    };
  }
}

MasonLoca createMasonLoca(record){
  Map<String, dynamic> attributes = {
    'locaName':'',
      'locaLong':'',
      'locaLati':'',
  };

  record.forEach((key,value)=>{attributes[key]=value});

  MasonLoca masonLoca = new MasonLoca(attributes['locaName'], attributes['locaLong'], attributes['locaLati']);
  return masonLoca;
}