import 'package:flutter/material.dart';

class DataModel {
  final Image image;
  final String title;
  final String description;
  final DateTime date;
  final TimeOfDay time;

  DataModel({
    required this.image,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
  });
}