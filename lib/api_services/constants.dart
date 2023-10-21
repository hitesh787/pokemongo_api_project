import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemongo_api_project/model/employer_model.dart';
import 'package:pokemongo_api_project/movie_app/movies_model/movies_model.dart';

class Constants{


  static const imagesPath = 'https://image.tmdb.org/t/p/w500/';

  static const apiKey = '?api_key=04d5cda6fc5073f7f6c0aaccf9efb9a4';

  static const trendingUrl = 'https://api.themoviedb.org/3/trending/all/day$apiKey';
  static const topRatedUrl = 'https://api.themoviedb.org/3/movie/top_rated$apiKey';
  static const upcomingUrl = 'https://api.themoviedb.org/3/movie/upcoming$apiKey';
  static const genresUrl = 'https://api.themoviedb.org/3/genre/movie/list$apiKey';



  static const cricketMatchUrl = 'https://api.cricapi.com/v1/matches?apikey=ce3526e5-699c-4f98-bae7-e60a2d217cd2&offset=0';
  static const cricketMatchListUrl = 'https://api.cricapi.com/v1/series_info?apikey=ce3526e5-699c-4f98-bae7-e60a2d217cd2&offset=0&id=47b54677-34de-4378-9019-154e82b9cc1a';


}