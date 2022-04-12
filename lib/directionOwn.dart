import 'package:flutter/material.dart';

class OwnDirection extends StatefulWidget {
  final List summary;
  const OwnDirection(this.summary, { Key? key }) : super(key: key);

  @override
  State<OwnDirection> createState() => _OwnDirectionState();
}

class _OwnDirectionState extends State<OwnDirection> {
  @override
  Widget build(BuildContext context) {
     return ListView.builder(
      itemCount: this.widget.summary.length,
      itemBuilder: (context,index){
        var incident = this.widget.summary[index];
        int duratio = (incident['duration']/60).round();
        return Card(
          child: Row(children: [
            Expanded(child: ListTile(
              leading: Icon(returnIcons(incident['type']),color: Colors.black54,size: 30,),
              title: Text(incident['instruction']),subtitle: 
                Text(incident['type']==10?"You have arrived at your destination":(duratio>0?"It will take you around " + duratio.toString()+" minutes":"It'll take you less than a minute")),
              
            )),
          ],),
        );
      },

    );
  }

  
IconData returnIcons(int val){
  if(val==0){
    return Icons.arrow_back_sharp;
  }else if(val==1){
    return Icons.arrow_forward_sharp;
  }else if(val==2){
    return Icons.turn_sharp_left;
  }else if(val==3){
    return Icons.turn_sharp_right;
  }else if(val==4){
    return Icons.turn_slight_left;
  }else if(val==5){
    return Icons.turn_slight_right;
  }else if(val==6){
    return Icons.straight;
  }else if(val==7){
    return Icons.roundabout_left;
  }else if(val==8){
    return Icons.roundabout_right;
  }else if(val==9){
    return Icons.u_turn_left;
  }else if(val==10){
    return Icons.pin_drop;
  }else if(val==11){
    return Icons.wheelchair_pickup;
  }else if(val==12){
    return Icons.turn_left;
  }else if(val==13){
    return Icons.turn_right;
  }
  return Icons.error;
}
}
