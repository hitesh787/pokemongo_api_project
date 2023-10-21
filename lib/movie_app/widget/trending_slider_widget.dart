import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemongo_api_project/api_services/constants.dart';
import 'package:pokemongo_api_project/api_services/user_provider.dart';
import 'package:pokemongo_api_project/movie_app/movies_details_screen.dart';
import 'package:provider/provider.dart';

/// Trending Slider
class TrendingSliderWidget extends StatelessWidget {
  const TrendingSliderWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (_, user, __) {
        return CarouselSlider.builder(
          itemCount: user.trendingMoviesData.length,
          options: CarouselOptions(
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            pauseAutoPlayOnTouch: true,
            viewportFraction: 0.8,
            enlargeCenterPage: true,
          ),
          itemBuilder: (context, itemIndex, pageViewIndex) {
            if(user.trendingMoviesData.isNotEmpty){
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MoviesDetailsScreen(movies: user.trendingMoviesData[itemIndex])));
                },
                child:  ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                        filterQuality: FilterQuality.high,
                        fit:  BoxFit.fill,
                        "${Constants.imagesPath}${user.trendingMoviesData[itemIndex].posterPath}"
                    ),
                  ),
                ),
              );
            }
            return const Center(child: CupertinoActivityIndicator());

          },
        );
      }
    );
  }
}