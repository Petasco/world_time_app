import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'Ghana - Accra', flag: 'ghana-flag.jpg', url: 'Africa/Ghana', isDaytime: true),
    WorldTime(location: 'London', flag: 'uk-flag.jpg', url: 'Europe/London', isDaytime: true),
    WorldTime(location: 'America', flag: 'argentina-flag.jpg', url: 'Argentina/Salta', isDaytime: true),
    WorldTime(location: 'Seoul', flag: 'south-korea-flag.jpg', url: 'Asia/Seoul', isDaytime: true),
    WorldTime(location: 'Berlin', flag: 'germany-flag.jpg', url: 'Europe/Berlin', isDaytime: true),
    WorldTime(location: 'New York', flag: 'uk-flag.jpg', url: 'America/New_York', isDaytime: true),
    WorldTime(location: 'Nigeria - Legos', flag: 'nigeria-flag.jpg', url: 'Africa/Nigeria', isDaytime: true),
    WorldTime(location: 'Cairo', flag: 'egypt-flag.gif', url: 'Africa/Egypt', isDaytime: true),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    Navigator.pop(context, {
      'locations': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: const Text("Choose Loaction"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading:CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        }),
    );
  }
}
