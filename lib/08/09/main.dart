import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';

import 'item.dart';
import 'package:path/path.dart' as path;
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  List<String> data = ['A', 'B', 'C', 'D', 'E'];

  Widget buildChild() {
    return SpecialColumn(
      item: SpecialColumnItem(
        title: "Flutter 基础",
        url:
            "https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/2031ed3efa78412cb73edb90fec8843f~tplv-k3u1fbpfcp-zoom-crop-mark:1304:1304:1304:734.awebp?",
        articleCount: 97,
        attentionCount: 188,
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      actions: [
        IconButton(
            onPressed: () => saveWidget(), icon: const Icon(Icons.save))
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body:
      RepaintBoundary(
        key: _globalKey,
        child: buildChild(),
      ),
    );
  }

  final GlobalKey<MyAppState> _globalKey = GlobalKey();

  void saveWidget() async {
    Uint8List? bytes = await _getBitsByKey(_globalKey);
    print(bytes?.length);
    Directory directory = await getApplicationSupportDirectory();
    File file = File(path.join(directory.path,'widget2.png'));
    if(bytes!=null){
      file.writeAsBytes(bytes.toList());
    }
  }

  Future<Uint8List?> _getBitsByKey(GlobalKey key) async {
    RenderObject? boundary = key.currentContext?.findRenderObject();
    if (boundary != null && boundary is RenderRepaintBoundary) {
      ui.Image img = await boundary.toImage(pixelRatio: 2);
      ByteData? byteData = await img.toByteData(format: ui.ImageByteFormat.png);
      Uint8List? bits = byteData?.buffer.asUint8List();
      return bits;
    }
    return null;
  }
}


