import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'Argentina', flag: 'Argentina', Url: 'America/Argentina/Buenos_Aires'),
    WorldTime(location: 'London', flag: 'England', Url: 'Europe/London'),
    WorldTime(location: 'Berlin', flag: 'Germany', Url: 'Europe/Berlin'),
    WorldTime(location: 'Cairo', flag: 'Egypt', Url: 'Africa/Cairo'),
    WorldTime(location: 'Chicago', flag: 'United States', Url: 'America/Chicago'),
    WorldTime(location: 'New York', flag: 'United States', Url: 'America/New_York'),
    WorldTime(location: 'Seoul', flag: 'South Korea ', Url: 'Asia/Seoul'),
    WorldTime(location: 'Kolkata', flag: 'India', Url: 'Asia/Kolkata'),
  ];

  Future<void> updateTime(index) async{
    WorldTime instance = WorldTime(location: locations[index].location, flag: locations[index].flag, Url: locations[index].Url);
    await instance.getTime();
    Navigator.pop(context,{
      'location':instance.location,
      'time':instance.time,
      'date':instance.date,
      'flag':instance.flag,
      'DayTime':instance.DayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length ,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              onTap: (){
                updateTime(index);
              },
              title:   Text(locations[index].location),
            ),
          );
      }
      ),
    );
  }
}
