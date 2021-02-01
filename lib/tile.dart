import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Tile extends Equatable {
  final Color color;

  const Tile({this.color});

  @override
  List<Object> get props => [color];
}
