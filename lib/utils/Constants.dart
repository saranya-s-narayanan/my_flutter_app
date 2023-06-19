import 'package:flutter/material.dart';

class Constants{
  static final Constants _instance = Constants._internal();

  Constants._internal();

  factory Constants() {
    return _instance;
  }

  final String appName = "wertyuu";


}