

import 'package:flutter/material.dart';

class ImageCardContent {
  ImageCardContent(this.imageLink, this.label);
  String imageLink;
  String label;
}

class ImageCard extends StatefulWidget {
  const ImageCard({super.key, required this.content});
  factory ImageCard.from(String label, String imageLink) {
    return ImageCard(content: ImageCardContent(imageLink, label));
  }
  final ImageCardContent content;

  @override
  State<StatefulWidget> createState() => ImageCardState();
}

class ImageCardState extends State<ImageCard> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 1,
        margin: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: Theme.of(context).colorScheme.primary
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12))
        ),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: Image(image: NetworkImage(widget.content.imageLink), width: 150, height: 150, fit: BoxFit.cover)
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(widget.content.label),
            )
          ],
        ),
      ),
    );
  }

}