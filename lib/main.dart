import 'package:flutter/material.dart';

import './screens/category_screen.dart';
import './screens/anime_list.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo),
          scaffoldBackgroundColor: const Color.fromRGBO(25, 55, 109, 1)),
      routes: {
        '/': (context) => const CategoryScreen(),
        AnimeList.routeName: (context) => const AnimeList(),
      },
    );
  }
}
