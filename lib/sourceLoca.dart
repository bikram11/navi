import 'package:flutter/material.dart';
import 'package:navi/masonLoca.dart';
import 'package:navi/sourceDesti.dart';
import 'database.dart';
import 'locationFormMultipleSelect.dart';
import 'search_widget.dart';
class SourceLoca extends StatefulWidget {
  const SourceLoca({ Key? key }) : super(key: key);

  @override
  State<SourceLoca> createState() => _SourceLocaState();
}

class _SourceLocaState extends State<SourceLoca> {
    List<MasonLoca> locations = [];
    late MasonLoca? tempLoca = null;
    
  String query = '';
  Future<void> updateLocations()async {
    getallMasonLoca().then((locations)=>{
      this.setState(() {
        this.locations = locations;
      })
    });
  }
  @override
  void initState() {
    super.initState();
    updateLocations();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Scaffold(
    
      body: Column(
        
        children: [
          Stack(
          children: [
            Container(
              height: size.height*0.3,
              decoration: BoxDecoration(color: Color.fromARGB(178, 0, 102, 51)),
 
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                     buildSearch(),
                  Text(tempLoca!=null?"You have selected "+tempLoca!.locaName+" as your starting location":"Please select a starting location from the list below or search for it", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),textAlign: TextAlign.center,),
           
                 ],
                ),
              ),
            )
          ],),
          Container(
            height: size.height*0.5,
            child: Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        itemCount: locations.length,
                        itemBuilder: (context, index) {
                          final location = locations[index];
    
                          return buildLocations(location);
                        },
                      ),
                    ),
                  ],
                ),
          ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical:1.1),
                          child: Container(
                            width: size.width,
                            height: size.height*0.17,
                            decoration: BoxDecoration(  border: Border.all(color: Color.fromARGB(0, 0, 0, 0)),
                                  borderRadius: BorderRadius.all(Radius.circular(10))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: size.width*0.80,
                                  height: size.height*0.06,
                                  decoration: BoxDecoration(color:tempLoca!=null? Color.fromARGB(178, 0, 102, 51):Colors.grey,
                                  border: Border.all(color: Color.fromARGB(0, 0, 0, 0)),
                                  borderRadius: BorderRadius.all(Radius.circular(10))),
                                  child:GestureDetector(
                                    onTap: () {
                                      if(tempLoca!=null){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  SourceDesti(tempLoca!)),
  );
                                      }
},
                                    
                                    
                                    child: Center(child: Text("Proceed", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),))),
                                ),
                              ),
          GestureDetector(
                                    onTap: (){
                                      updateLocations();
                                    },
             child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: size.width*0.80,
                                    height: size.height*0.05,
                                    decoration: BoxDecoration(color: Colors.redAccent,
                                    border: Border.all(color: Color.fromARGB(0, 0, 0, 0)),
                                    borderRadius: BorderRadius.all(Radius.circular(10))),
                                    child:Center(child: Text("Reset Search", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),)),
                                  ),
                                ),
           ),
                ],
              ),
                          ),
                        ),
        ],
      ),
    );
  }
   Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Search and select the building',
        onChanged: searchBook,
      );

        Widget buildLocations(MasonLoca locations) => GestureDetector(
          onTap: (){
            setState(() {
               tempLoca = locations;
            });
           
          },
          child: Container(
            decoration: BoxDecoration( 
               color: tempLoca!=null&&tempLoca!.locaName==locations.locaName? Color.fromARGB(178, 0, 102, 51):Colors.white,
               border: Border.all(color: Colors.black12,width: 2),
                                
                                  ),
            child: ListTile(
            title: Text(locations.locaName,style: TextStyle(

              color: tempLoca!=null&&tempLoca!.locaName==locations.locaName? Colors.white:Colors.black54,
              fontWeight: tempLoca!=null&&tempLoca!.locaName==locations.locaName? FontWeight.bold:FontWeight.normal,
            ),),
                ),
          ),
        );

  void searchBook(String query) {
    final tempLocations = locations.where((location) {
      final titleLower = location.locaName.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      locations = tempLocations;
    });
  }
}