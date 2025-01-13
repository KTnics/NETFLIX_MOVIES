import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:untitled6/serchdetails.dart';

import 'netflix_app_bar.dart';

 // Import the details page

class ShowSearchPage extends StatefulWidget {
  @override
  _ShowSearchPageState createState() => _ShowSearchPageState();
}

class _ShowSearchPageState extends State<ShowSearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<dynamic> _shows = [];
  bool _isLoading = false;

  // Function to search shows based on the search term
  Future<void> _searchShows(String query) async {
    if (query.isEmpty) {
      setState(() {
        _shows = [];
      });
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final url = Uri.parse('https://api.tvmaze.com/search/shows?q=$query');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        _shows = json.decode(response.body);
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      throw Exception('Failed to load shows');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NetflixAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for Shows...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                _searchShows(value);  // Trigger the search when the user types
              },
            ),
          ),
          Expanded(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : _shows.isEmpty
                ? Center(child: Text("No Shows Found"))
                : ListView.builder(
              itemCount: _shows.length,
              itemBuilder: (context, index) {
                final show = _shows[index]['show'];
                final imageUrl = show['image'] != null
                    ? show['image']['original']
                    : 'https://via.placeholder.com/150';
                return ListTile(
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  leading: CachedNetworkImage(
                    imageUrl: imageUrl,
                    width: 60,
                    height: 90,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.error),
                  ),
                  title: Text(show['name']),
                  subtitle: show['genres'] != null
                      ? Text(show['genres'].join(', '))
                      : null,
                  onTap: () {
                    // Navigate to the details page with the show data
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(
                          showData: show, // Pass the show data directly
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
