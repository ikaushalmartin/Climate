import 'package:climate/services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getlocation();
  }

  void getlocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Location l = Location();
    await l.getcurrentlocation();
    print(l.latitude);
    print(l.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            getlocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
