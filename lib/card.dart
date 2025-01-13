import 'package:flutter/material.dart';
import 'package:untitled6/show_model.dart';

import 'details_screen.dart';

class ShowCard extends StatelessWidget {
  final Show show;

  const ShowCard({Key? key, required this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ShowDetailsScreen(show: show),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: show.imageUrl != null
              ? Image.network(
            show.imageUrl!,
            fit: BoxFit.cover,
            width: 120,
          )
              : Container(
            color: Colors.grey,
            width: 120,
            child: const Center(
              child: Text(
                'No Image',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
