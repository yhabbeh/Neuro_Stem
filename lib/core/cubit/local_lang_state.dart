import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LocalState extends Equatable {}

class LocalInitState extends LocalState {
  @override
  List<Object> get props => [];
}

class ChangeLocalState extends LocalState {
  ChangeLocalState({required this.locale});
  final Locale locale;

  @override
  List<Object?> get props => [locale];
}
