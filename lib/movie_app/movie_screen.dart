
import 'package:flutter/material.dart';
import 'package:pokemongo_api_project/api_services/user_provider.dart';
import 'package:pokemongo_api_project/movie_app/widget/movies_list_title.dart';
import 'package:pokemongo_api_project/movie_app/widget/trending_slider_widget.dart';
import 'package:provider/provider.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {


  getMoviesData() async {
    await context.read<UserProvider>().getTrendingMovies(context);
    await context.read<UserProvider>().getTopRatedMovies(context);
    await context.read<UserProvider>().getUpComingMovies(context);
    await context.read<UserProvider>().getGenreCategoryMoviesList(context);
  }

  @override
  void initState() {
    super.initState();
    getMoviesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie App",
            style: TextStyle(fontSize: 25, color: Colors.black)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Consumer<UserProvider>(builder: (_, user, __) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Trending Movies", style: TextStyle(fontSize: 25, color: Colors.black),),
                  const SizedBox(height: 16,),
                  const TrendingSliderWidget(),
                  const SizedBox(height: 16,),
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                        itemCount: user.genreMoviesListData.length,
                        itemBuilder: (context,index){
                      return Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(right:10),
                        // height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black)
                        ),
                        child: Center(child: Text(user.genreMoviesListData[index].name.toString(),style: const TextStyle(fontSize: 15,color: Colors.black),)),
                      );

                    }),
                  ),
                  const SizedBox(height: 16,),
                  const Text("Top Rated Movies", style: TextStyle(fontSize: 25, color: Colors.black),),
                  const SizedBox(height: 16,),
                  MovieListTitleWidget(titleList: user.topRateMoviesData),
                  const SizedBox(height: 16,),
                  const Text("Upcoming Movies", style: TextStyle(fontSize: 25, color: Colors.black),),
                  const SizedBox(height: 16,),
                  MovieListTitleWidget(titleList: user.upComingMoviesData),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}



