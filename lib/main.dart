import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_view.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
      home: HomeView(),
    ),
    ),
  );
}