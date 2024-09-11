import 'package:clima/main.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';

class LocationService {
  static LocationService instance = LocationService.internal();
  LocationService.internal();
  factory LocationService() => instance;

  bool? isLocationServiceEnabled;
  LocationPermission? permission;
  Position? position;

  handleLocationServiceSetting() async {
    isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled!) {
      await showEnableLocationServiceDialog();
      isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    }
  }

  handlePermisson() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }
  }

  init() async {
    await handleLocationServiceSetting();
    if (isLocationServiceEnabled == true) {
      await handlePermisson();
      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        position = await Geolocator.getCurrentPosition();
      }
    }
  }

  showEnableLocationServiceDialog() async {
    await showDialog(
      context: appContext,
      builder: (context) => AlertDialog.adaptive(
        title: const Text("Turn on your location service"),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text("ok"),
          ),
          TextButton(
            onPressed: () {
              Geolocator.openLocationSettings();
            },
            child: const Text("Setting"),
          )
        ],
      ),
    );
  }
}
