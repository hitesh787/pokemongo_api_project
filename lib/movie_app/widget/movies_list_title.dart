
import 'package:flutter/material.dart';
import 'package:pokemongo_api_project/api_services/constants.dart';
import 'package:pokemongo_api_project/api_services/user_provider.dart';
import 'package:pokemongo_api_project/movie_app/api_services.dart';
import 'package:pokemongo_api_project/movie_app/movies_details_screen.dart';
import 'package:pokemongo_api_project/movie_app/movies_model/movies_model.dart';
import 'package:provider/provider.dart';

/// Movies list Title
class MovieListTitleWidget extends StatelessWidget {
  final List<MoviesModel> titleList;
  const MovieListTitleWidget({super.key, required this.titleList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
          itemCount: titleList.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MoviesDetailsScreen(movies: titleList[index])));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    height: 300,
                    width: 200,
                    child: Image.network(
                        filterQuality: FilterQuality.high,
                        fit:  BoxFit.cover,
                        "${Constants.imagesPath}${titleList[index].posterPath}"
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}