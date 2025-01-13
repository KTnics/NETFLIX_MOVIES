import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailsPage extends StatelessWidget {
  final Map<String, dynamic> showData; // Expecting show data as a Map

  DetailsPage({required this.showData});

  @override
  Widget build(BuildContext context) {
    final imageUrl = showData['image'] != null
        ? showData['image']['original']
        : 'https://via.placeholder.com/150';
    final summary = showData['summary'] != null
        ? showData['summary']
        : 'No summary available for this show.';

    return Scaffold(
      appBar: AppBar(
        title: Text(showData['name']),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  Icon(Icons.error),
            ),
            SizedBox(height: 20),
            Text(
              showData['name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              showData['genres'] != null
                  ? showData['genres'].join(', ')
                  : 'Genres not available',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Text(
              'Summary:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              summary,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
