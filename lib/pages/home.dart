import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isEmpty?ModalRoute.of(context)?.settings.arguments as Map<String,String>:data;
    String bgImage = data['DayTime'];
    Color textcolor = bgImage == 'day.png'? Colors.black : Colors.white;
    return Scaffold(
      body: SafeArea(child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,120,0,0),
          child: Column(
            children: [
              FlatButton.icon(
                  onPressed: () async{
                    dynamic update = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = update;
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: textcolor,
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: textcolor,
                      fontSize: 22.0
                    ),

                  )
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: textcolor,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                data['date'],
                style: TextStyle(
                  fontSize: 40.0,
                  color: textcolor,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 60.0,
                  color: textcolor,
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
