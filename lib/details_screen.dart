import 'package:flutter/material.dart';
import 'package:untitled6/show_model.dart';



class ShowDetailsScreen extends StatelessWidget {
  final Show show;

  const ShowDetailsScreen({Key? key, required this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(show.name, style: const TextStyle(color: Colors.red)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (show.imageUrl != null)
              Center(
                child: Image.network(
                  show.imageUrl!,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              )
            else
              Container(
                height: 300,
                color: Colors.grey,
                child: const Center(
                  child: Text(
                    'No Image Available',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            const SizedBox(height: 16),
            Text(
              show.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Summary",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              show.summary.replaceAll(RegExp(r'<[^>]*>'), ''), // Remove HTML tags
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
