import 'package:flutter/material.dart';

class ContentItem {
  String type; // "text", "image"
  String data;

  ContentItem(this.type, this.data);

  Widget build(BuildContext context) {
    if (type == 'text') {
      return Text(data);
    } else if (type == 'image') {
      return Image.network(data);
    }else if(type == 'video'){
      return Text("video");
    }else if(type == 'audio'){
      return Text("audio");
    }
    return Container();
  }
}

class ContentDisplay extends StatelessWidget {
  final List<ContentItem> items;

  const ContentDisplay(this.items, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((item) => item.build(context)).toList(),
    );
  }
}
