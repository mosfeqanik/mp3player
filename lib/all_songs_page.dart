import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class AllSongsPage extends StatefulWidget {
  const AllSongsPage({Key? key}) : super(key: key);

  @override
  State<AllSongsPage> createState() => _AllSongsPageState();
}

class _AllSongsPageState extends State<AllSongsPage> {
  final _audioQuery = OnAudioQuery();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestPermission();
  }
  void requestPermission(){
    Permission.storage.request();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MP3 Player By Anik"),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: FutureBuilder<List<SongModel>>(
        future: _audioQuery.querySongs(
          sortType: null,
          orderType: OrderType.ASC_OR_SMALLER,
          uriType: UriType.EXTERNAL_PRIMARY
          ,  ignoreCase: true,),
          builder:(context,item){
            if(item.data==null){
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }
            if(item.data!.isEmpty){
              return const Center(child: Text("No Songs Found"));
            }
            return ListView.builder(
              itemBuilder: (context, index) => ListTile(
                leading: const Icon(Icons.music_note),
                title: Text(item.data![index].displayNameWOExt),
                subtitle:  Text("${item.data![index].artist}"),
                trailing: const Icon(Icons.more_horiz),
              ),
              itemCount: 100,
            );
        }
        ),
    );
  }
}
