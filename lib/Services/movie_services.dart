// ignore_for_file: avoid_print, deprecated_member_use

import 'package:dio/dio.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/models/movie_search_model.dart';

class MovieServices {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://api.themoviedb.org/3/movie/';
  final String _apikey = 'eff458afec4dd1cdfce61765ec793d07';

  Future<List<MovieModel>> getNowPlayingMovies() async {
    try {
      final response =
          await _dio.get('${_baseUrl}now_playing?api_key=$_apikey');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['results'];
        return data.map((movie) => MovieModel.fromMap(movie)).toList();
      } else {
        throw Exception('Failed to load movies');
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print('Error Response Data: ${e.response!.data}');
      } else {
        print('Error Request Options: ${e.requestOptions}');
        print('Error Message: ${e.message}');
      }
      throw Exception('Failed to load movies');
    }
  }

  Future<List<MovieModel>> getUpcomingMovies() async {
    try {
      final response = await _dio.get('${_baseUrl}upcoming?api_key=$_apikey');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['results'];

        return data.map((movie) => MovieModel.fromMap(movie)).toList();
      } else {
        throw Exception('Failed to load movies');
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print('Error Response Data: ${e.response!.data}');
      } else {
        print('Error Request Options: ${e.requestOptions}');
        print('Error Message: ${e.message}');
      }
      throw Exception('Failed to load movies');
    }
  }

  Future<List<MovieSearchModel>> searchCollections(String query) async {
    try {
      final response = await _dio.get(
          'https://api.themoviedb.org/3/search/collection?query=$query&api_key=$_apikey');

      if (response.statusCode == 200) {
        if (response.data['results'] != null) {
          List<dynamic> data = response.data['results'];
          return data.map((movie) => MovieSearchModel.fromJson(movie)).toList();
        } else {
          throw Exception('No results found');
        }
      } else {
        throw Exception('Failed to search collections');
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print('Error Response Data: ${e.response!.data}');
      } else {
        print('Error Request Options: ${e.requestOptions}');
        print('Error Message: ${e.message}');
      }
      throw Exception('Failed to search collections');
    }
  }

  Future<List<MovieModel>> searchByMovie(String query) async {
    try {
      final response = await _dio.get(
          'https://api.themoviedb.org/3/search/movie?query=$query&api_key=$_apikey');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['results'];

        return data.map((movie) => MovieModel.fromMap(movie)).toList();
      } else {
        throw Exception('Failed to load movies');
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print('Error Response Data: ${e.response!.data}');
      } else {
        print('Error Request Options: ${e.requestOptions}');
        print('Error Message: ${e.message}');
      }
      throw Exception('Failed to load movies');
    }
  }
}
