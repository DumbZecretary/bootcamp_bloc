import 'package:bloc/bloc.dart';
import 'package:count_app/app.dart';
import 'package:count_app/observer.dart';
import 'package:flutter/material.dart';

void main() {
  Bloc.observer = CountingObserver();
  runApp(
    const CountApp(),
  );
}
