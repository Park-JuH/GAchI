import 'package:flutter/material.dart';

void showRatingDialog(BuildContext context) {
  double rating = 0;
  String title  ="";

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text(title),                 // 모집글 제목
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Slider(
                  value: rating,
                  onChanged: (newRating) {
                    setState(() {
                      rating = newRating;
                    });
                  },
                  divisions: 5,
                  min: 0,
                  max: 5,
                  label: rating.round().toString(),
                ),
                Text('Rating: ${rating.toStringAsFixed(1)}'),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  print("The user has rated $rating stars"); // replace this with your own functionality
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    },
  );
}
