import 'package:flutter/material.dart';
import 'package:omar_ahmed_mentor_ship/question_one/answer.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}



class ContentDisplay extends StatelessWidget {
  final List<ContentItem> items;
  const ContentDisplay(this.items, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: item.build(context),
            ),
          )
          .toList(),
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<ContentItem> items = [
    TextItem("Hello, this is text content!"),
    ImageItem(
      "https://miro.medium.com/v2/resize:fit:1358/1*g1yyJlcBlc73J2I7TJM-yQ.png",
    ),
    VideoItem(
      "https://www.youtube.com/watch?v=XADR7pkUgZk&list=PLwWuxCLlF_uevri_OpofVLXkRRFnZ7TSV&index=3",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Content Display Example")),
      body: SingleChildScrollView(child: ContentDisplay(items)),
    );
  }
}
