import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'Accra', flag: '', url: 'Africa/Ghana', isDaytime: true),
    WorldTime(location: 'London', flag: '', url: 'Europe/London', isDaytime: true),
    WorldTime(location: 'America', flag: '', url: 'Argentina/Salta', isDaytime: true),
    WorldTime(location: 'London', flag: '', url: 'Europe/London', isDaytime: true),
    WorldTime(location: 'Accra', flag: '', url: 'Africa/Ghana', isDaytime: true),
    WorldTime(location: 'London', flag: '', url: 'Europe/London', isDaytime: true),
    WorldTime(location: 'Accra', flag: '', url: 'Africa/Ghana', isDaytime: true),
    WorldTime(location: 'London', flag: '', url: 'Europe/London', isDaytime: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Choose Loaction"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              onTap: () {},
              title: Text(locations[index].location),
            ),
          );
        }),
    );
  }
}
