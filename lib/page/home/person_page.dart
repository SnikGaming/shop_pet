import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shop_pet/core/const.dart';
import 'package:shop_pet/models/cat_model.dart';

import '../../core/custom_method.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({super.key});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  AssetsAudioPlayer _play = AssetsAudioPlayer();
  final cat_data = FirebaseFirestore.instance.collection('cat').orderBy("user");
  bool isPlaying = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _play.open(Audio('assets/sound/cccc.mp3'),
        autoStart: false, showNotification: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              isPlaying = !isPlaying;
              if (isPlaying) {
                await _play.pause();
              } else {
                await _play.play();
              }
            },
            child: Text("PLay")),
      ),
    );
  }
}
