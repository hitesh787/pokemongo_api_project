import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pokemongo_api_project/add_data.dart';
import 'package:http/http.dart' as http;
import 'package:pokemongo_api_project/model/employer_model.dart';
import 'package:pokemongo_api_project/model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

import 'main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Data> employerData = [];
  List<Articles> newsData = [];

  /// Get Data from API
  // Future<List<Data>> getFetch() async {
  //   String url = "https://newsapi.org/v2/everything?q=tesla&from=2023-07-29&sortBy=publishedAt&apiKey=8ec4fbf0ec9f41d1abff44df32fb25a5";
  //   final res = await http.get(Uri.parse(url));
  //   if (res.statusCode == 200) {
  //     var data = jsonDecode(res.body.toString());
  //     debugPrint("***********************************");
  //      employerData = (data["data"] as List).map((e) => Data.fromJson(e)).toList();
  //     setState(() {});
  //     debugPrint("***********************************");
  //     return employerData;
  //   } else {
  //     debugPrint("++++++++++++++++++++++++++++++++++++");
  //     print("object ${res.statusCode}");
  //     debugPrint("++++++++++++++++++++++++++++++++++++");
  //     return employerData;
  //   }
  // }

  /// Get Data from API
  Future<List<Articles>> getFetch() async {
    String url = "https://newsapi.org/v2/everything?q=tesla&from=2023-07-31&sortBy=publishedAt&apiKey=8ec4fbf0ec9f41d1abff44df32fb25a5";
    final res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body.toString());
      debugPrint("***********************************");
      // print(res);
      // print(res.body);
      // print(res.bodyBytes);
      // print(res.request);
      // print(res.headers);
      // print(res.reasonPhrase);
      newsData = (data["articles"] as List).map((e) => Articles.fromJson(e)).toList();
      setState(() {});
      debugPrint("***********************************");
      return newsData;
    } else {
      debugPrint("++++++++++++++++++++++++++++++++++++");
      print("object ${res.statusCode}");
      debugPrint("++++++++++++++++++++++++++++++++++++");
      return newsData;
    }
  }

  getData() async {
    await getFetch();
  }

  @override
  void initState() {
    getData();
    super.initState();
    // fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NEWS API'),
        // actions: [
        //   IconButton(
        //       icon: Icon(MyApp.themeNotifier.value == ThemeMode.light
        //           ? Icons.dark_mode
        //           : Icons.light_mode),
        //       onPressed: () {
        //         MyApp.themeNotifier.value =
        //             MyApp.themeNotifier.value == ThemeMode.light
        //                 ? ThemeMode.dark
        //                 : ThemeMode.light;
        //       })
        // ],
      ),
      body: ListView.builder(
        itemCount: newsData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.25),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Images
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(image: NetworkImage(newsData[index].urlToImage.toString()),fit: BoxFit.cover),
                    ),
                  ),

                  /// title
                  Text("${newsData[index].title}", style: const TextStyle(fontSize: 20)),
                  const SizedBox(height: 10,),
                  /// Description
                  Text("${newsData[index].description}",style: const TextStyle(fontSize: 15)),
                  const SizedBox(height: 10,),
                  /// Full Article Link
                  const Text("Full Article for :",style: TextStyle(fontSize: 15)),
                  TextButton(
                      onPressed: () async {
                        var url = Uri.parse(newsData[index].url.toString());
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Text("${newsData[index].url}",maxLines: 2),
                  ),
                  /// Author
                  const SizedBox(height: 10,),
                  Text("Author : ${newsData[index].author}",style: const TextStyle(fontSize: 18)),
                  /// Date
                  Text("Date : ${newsData[index].publishedAt}",style: const TextStyle(fontSize: 18)),

                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Map<String,dynamic> userMap = userObject.toJson();
            // var json = jsonEncode(userMap);
            // print(json);

            //
            // var decode = jsonDecode(utf8.decoder.convert(userJson as List<int>));
            // Map<String,dynamic> userMAp = decode;
            // HelloModel newUser = HelloModel.fromJson(userMAp);
            // print(newUser.name.toString());
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddDataScreen()));
          },
          child: const Icon(Icons.add)),
    );
  }

}

