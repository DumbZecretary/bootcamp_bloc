import 'package:bloc/bloc.dart';
import 'package:counter_app/app.dart';
import 'package:counter_app/observer.dart';
import 'package:flutter/material.dart';

void main() {
  Bloc.observer = CounterObserver();
  runApp(
    const CounterApp(),
  );
}