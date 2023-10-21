import 'package:flutter/material.dart';
import 'package:pokemongo_api_project/api_services/constants.dart';
import 'package:pokemongo_api_project/movie_app/movies_model/movies_model.dart';

class MoviesDetailsScreen extends StatelessWidget {
  final MoviesModel movies;
  const MoviesDetailsScreen({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
   body: CustomScrollView(
     slivers: <Widget>[
       SliverAppBar.large(
         leading: Container(
           height: 70,width: 70,margin: const EdgeInsets.only(top: 8,left: 8),
           decoration: BoxDecoration(
             color: Colors.black,
             borderRadius: BorderRadius.circular(15)

           ),
           child: IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_ios_new_rounded)),
         ),
         backgroundColor: Colors.grey,
         expandedHeight: 500,
         pinned: true,
         floating: true,
         flexibleSpace: FlexibleSpaceBar(
           title: Text(movies.title.toString(),style: const TextStyle(color: Colors.white),),
           background: ClipRRect(
             borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25)),
             child: Image.network(
                 filterQuality: FilterQuality.high,
                 fit:  BoxFit.cover,
                 "${Constants.imagesPath}${movies.posterPath}"
             ),
           ),
         ),

       ),

       SliverToBoxAdapter(
         child: Padding(padding: const EdgeInsets.all(12),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             const Text("Overview",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800),),
             const SizedBox(height: 15,),
             Text("Original language: ${movies.originalLanguage.toString()}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,letterSpacing: 0.5),),
             const SizedBox(height: 15,),
             Text(movies.overview.toString(),style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w400,letterSpacing: 0.5),),
             const SizedBox(height: 15),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Container(
                   padding: const EdgeInsets.all(10),
                   height: 40,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(15),
                     border: Border.all(color: Colors.white)
                   ),
                   child: Center(child: Text("Release Date: ${movies.releaseDate}")),
                 ),
                 Container(
                   padding: const EdgeInsets.all(10),
                   height: 40,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(15),
                       border: Border.all(color: Colors.white)
                   ),
                   child: Center(child: Text("Rating: ${movies.voteAverage}")),
                 ),
               ],
             )
           ],
         ),
         ),
       )
     ],
   ),
    );
  }
}
