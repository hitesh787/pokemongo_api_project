// ignore_for_file: use_build_context_synchronously, avoid_print, unnecessary_string_interpolations
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pokemongo_api_project/api_services/constants.dart';
import 'package:pokemongo_api_project/cricket_app/cricket_model/cricket_match_model.dart';
import 'package:pokemongo_api_project/cricket_app/cricket_model/match_list_model.dart';
import 'package:pokemongo_api_project/movie_app/api_services.dart';
import 'package:pokemongo_api_project/movie_app/movies_model/genres_category_list_model.dart';
import 'package:pokemongo_api_project/movie_app/movies_model/movies_model.dart';

class UserProvider with ChangeNotifier {

  List<MoviesModel> trendingMoviesData = [];
  List<MoviesModel> topRateMoviesData = [];
  List<MoviesModel> upComingMoviesData = [];
  List<GenresCategoryListModel> genreMoviesListData = [];
  CricketMatchSeriesModel? cricketMatchListData;

/// Trending Movies
  Future<List<MoviesModel>> getTrendingMovies(BuildContext context) async {
    try {
      String url = "${Constants.trendingUrl}";
      var resp = await ApiServiceClass.getRequestForMoviesApp(url);
      print("getTrendingMovies****************** ${resp!.data}");
      if (resp.statusCode == 200) {
        trendingMoviesData = (resp.data["results"] as List).map((e) => MoviesModel.fromJson(e)).toList();
        notifyListeners();
        return trendingMoviesData;
      }
      return trendingMoviesData;
    } catch (e) {
      return trendingMoviesData;
    }
  }


  /// Top Related Movies
  Future<List<MoviesModel>> getTopRatedMovies(BuildContext context) async {
    try {
      String url = "${Constants.topRatedUrl}";
      var resp = await ApiServiceClass.getRequestForMoviesApp(url);
      print("getTopRatedMovies----------------- ${resp!.data}");
      if (resp.statusCode == 200) {
        topRateMoviesData = (resp.data["results"] as List).map((e) => MoviesModel.fromJson(e)).toList();
        notifyListeners();
        return topRateMoviesData;
      }
      return topRateMoviesData;
    } catch (e) {
      return topRateMoviesData;
    }
  }


  /// Up coming Movies
  Future<List<MoviesModel>> getUpComingMovies(BuildContext context) async {
    try {
      String url = "${Constants.upcomingUrl}";
      var resp = await ApiServiceClass.getRequestForMoviesApp(url);
      print("getUpComingMovies ++++++++++++++ ${resp!.data}");
      if (resp.statusCode == 200) {
        upComingMoviesData = (resp.data["results"] as List).map((e) => MoviesModel.fromJson(e)).toList();
        notifyListeners();
        return upComingMoviesData;
      }
      return upComingMoviesData;
    } catch (e) {
      print("THIS IS CATCH BLOCK $e");
      return upComingMoviesData;
    }
  }


  /// genre Movies List
  Future<List<GenresCategoryListModel>> getGenreCategoryMoviesList(BuildContext context) async {
    try {
      String url = "${Constants.genresUrl}";
      var resp = await ApiServiceClass.getRequestForMoviesApp(url);
      print("getUpComingMovies ++++++++++++++ ${resp!.data}");
      if (resp.statusCode == 200) {
        genreMoviesListData = (resp.data["genres"] as List).map((e) => GenresCategoryListModel.fromJson(e)).toList();
        notifyListeners();
        return genreMoviesListData;
      }
      return genreMoviesListData;
    } catch (e) {
      print("THIS IS CATCH BLOCK $e");
      return genreMoviesListData;
    }
  }


  Future<CricketMatchSeriesModel?> getCricketMatchData(BuildContext context) async {

    try{
      String url = Constants.cricketMatchListUrl;
      var resp = await ApiServiceClass.getRequestForCricketApp(context, url);
      print("getUpComingMovies ++++++++++++++ ${resp!.data}");
      if(resp.statusCode == 200){
        // cricketMatchData = (resp.data["data"] as List).map((cricket) => CricketMatchSeriesModel.fromJson(cricket)).toList();
        cricketMatchListData = CricketMatchSeriesModel.fromJson(resp.data["data"]);
        notifyListeners();
        // print("getCricketMatchData 0000000000000000000000000000000 ${cricketMatchData.length}");
        return cricketMatchListData;
      }
      return cricketMatchListData;
    }catch(e){
      print("THIS IS CATCH BLOCK $e");
      return cricketMatchListData;
    }

  }






}

