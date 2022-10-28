import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllSongsPage extends StatefulWidget {
  const AllSongsPage({Key? key}) : super(key: key);

  @override
  State<AllSongsPage> createState() => _AllSongsPageState();
}

class _AllSongsPageState extends State<AllSongsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MP3 Player By Anik"),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          leading: const Icon(Icons.music_note),
          title: Text("Music No $index"),
          subtitle: const Text("Artist Name\ Duration"),
          trailing: const Icon(Icons.more_horiz),
        ),
        itemCount: 100,
      ),
    );
  }
}
