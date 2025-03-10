import 'package:flutter/material.dart';

class Medicine {
  final String name;
  final String? image;
  final int quantity;
  final DateTime date;
  final TimeOfDay time;

  Medicine({
    required this.name,
    required this.image,
    required this.quantity,
    required this.date,
    required this.time,
  });
}

