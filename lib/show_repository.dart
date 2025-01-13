import 'package:dio/dio.dart';

import 'package:untitled6/show_model.dart';



class ShowRepository {
  final Dio _dio = Dio();

  Future<List<Show>> fetchShows() async {
    const url = 'https://api.tvmaze.com/search/shows?q=all';
    final response = await _dio.get(url);
    return (response.data as List).map((json) => Show.fromJson(json)).toList();
  }
}
