import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class ContentItem {
  Widget build(BuildContext context);
}

class TextItem extends ContentItem {
  final String text;
  TextItem(this.text);

  @override
  Widget build(BuildContext context) =>
      Text(text, style: const TextStyle(fontSize: 20, color: Colors.black));
}

class ImageItem extends ContentItem {
  final String url;
  ImageItem(this.url);

  @override
  Widget build(BuildContext context) => Image.network(url, height: 250);
}

class VideoItem extends ContentItem {
  final String url;
  VideoItem(this.url);

  @override
  Widget build(BuildContext context) => Container(
    height: 150,
    color: Colors.black12,
    alignment: Alignment.center,
    //* add text copy button
    child: Row(
      children: [
        Expanded(
          child: Text(
            url,
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
        IconButton(
          onPressed: () {
            ClipboardData data = ClipboardData(text: url);
            Clipboard.setData(data);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.green,
                content: Text("Copied to clipboard"),
              ),
            );
          },
          icon: const Icon(Icons.copy),
        ),
      ],
    ),
  );
}