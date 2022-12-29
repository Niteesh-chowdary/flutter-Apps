import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  late String location;
  late String time;
  late String date;
  late String flag;
  late String Url;
  late String DayTime;

  WorldTime({required this.location,required this.flag,required this.Url});

  Future<void> getTime() async{
    try{
      Response response = await get(Uri(scheme: 'https',host:'worldtimeapi.org' ,path:'api/timezone/$Url'));
      Map data = jsonDecode(response.body);
      String Datetime = data['datetime'];
      String symbol = data['utc_offset'].substring(0,1);
      String offset = data['utc_offset'].substring(1,3);
      DateTime now = DateTime.parse(Datetime);
      if(symbol == "-"){
        now = now.subtract(Duration(hours: int.parse(data['utc_offset'].substring(1,3)),minutes: int.parse(data['utc_offset'].substring(4,6))));
      }
      else {
        now = now.add(Duration(hours: int.parse(data['utc_offset'].substring(1,3)),minutes: int.parse(data['utc_offset'].substring(4,6))));
      }
      DayTime = now.hour > 6 && now.hour <17 ? 'day.png' : 'night.png';
      date = DateFormat.yMMMMd().format(now);
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print("ERROR: $e");
      time = "Failed To Fetch Time";
    }
  }

}

