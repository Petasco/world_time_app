import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupworldTime(BuildContext context) async {
    WorldTime instance1 = WorldTime(
      location: "Ghana - Accra",
      flag: 'ghana.png',
      url: 'Africa/Accra',
      isDaytime: true,
    );
    await instance1.getTime();

    WorldTime instance2 = WorldTime(
      location: 'London',
      flag: 'uk-flag.jpg',
      url: 'Europe/London',
      isDaytime: true,
    );
    await instance2.getTime();

    WorldTime instance3 = WorldTime(
      location: 'America - Argentina',
      flag: 'argentina-flag.jpg',
      url: 'Argentina/Salta',
      isDaytime: true,
    );
    await instance3.getTime();

    WorldTime instance4 = WorldTime(
      location: 'Seoul',
      flag: 'south-korea-flag.jpg',
      url: 'Asia/Seoul',
      isDaytime: true,
    );
    await instance4.getTime();

    WorldTime instance5 = WorldTime(
      location: 'Germany - Berlin',
      flag: 'germany-flag.jpg',
      url: 'Europe/Berlin',
      isDaytime: true,
    );
    await instance5.getTime();

    WorldTime instance6 = WorldTime(
      location: 'New York',
      flag: 'uk-flag.jpg',
      url: 'America/New_York',
      isDaytime: true,
    );
    await instance6.getTime();

    WorldTime instance7 = WorldTime(
      location: 'Nigeria - Legos',
      flag: 'nigeria-flag.jpg',
      url: 'Africa/Nigeria',
      isDaytime: true,
    );
    await instance7.getTime();

    WorldTime instance8 = WorldTime(
      location: 'Cairo',
      flag: 'egypt-flag.gif',
      url: 'Africa/Egypt',
      isDaytime: true,
    );
    await instance8.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance1.location,
      'flag': instance1.flag,
      'time': instance1.time,
      'isDaytime': instance1.isDaytime,
    });
  }
  /*
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupworldTime();
  }*/

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setupworldTime(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
