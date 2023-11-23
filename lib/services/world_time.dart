import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location; // location name for the UI
  String time = ''; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for the api endpoint
  bool isDaytime = true; // true = day n false = night


  WorldTime({required this.location, required this.flag, required this.url, required this.isDaytime});
  
  Future<void> getTime() async {

    try{
      // make the request
      Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);
      //print(data);

      // get the properties from the data
      String datatime = data['datetime'];
      String utcOffset = data['utc_offset'].substring(1,3);

      // create DateTime object
      DateTime now = DateTime.parse(datatime);
      now = now.add(Duration(hours: int.parse(utcOffset)));

      isDaytime = now.hour > 6 && now.hour < 20? true : false;
      time = DateFormat.jm().format(now);
    }
    catch (e){
      print("Oops: $e");
      time = "Could not get time data";
    }
  }

}

