import 'package:flutter/material.dart';
import 'package:untitled6/show_model.dart';


import 'card.dart';


class ShowCarousel extends StatelessWidget {
  final String category;
  final List<Show> shows;

  const ShowCarousel({Key? key, required this.category, required this.shows})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            category,
            style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: shows.length,
            itemBuilder: (context, index) {
              return ShowCard(show: shows[index]);
            },
          ),
        ),
      ],
    );
  }
}
