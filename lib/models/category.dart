// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:meal_app/theme/theme.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  final String image;
  Category( {
    required this.id,
    required this.title,
    required this.image,
    this.color = kPrimaryClr,
  });


}
