

import 'package:flutter/material.dart';

class ImageCard extends StatefulWidget {
  const ImageCard({super.key, required this.imageLink, this.label = "test"});
  final String imageLink;
  final String label;

  @override
  State<StatefulWidget> createState() => ImageCardState();
}

class ImageCardState extends State<ImageCard> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 1,
        margin: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: Theme.of(context).colorScheme.primary
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12))
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: Image(image: NetworkImage(widget.imageLink), width: 150, height: 150, fit: BoxFit.cover)
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(widget.label),
            )
          ],
        ),
      ),
    );
  }

}