import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';

import 'all_songs_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MP3 audio Player",
      theme: ThemeData(primarySwatch: Colors.indigo),
      home:  AllSongsPage(),
    );
  }
}

