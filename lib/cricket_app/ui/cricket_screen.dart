import 'package:flutter/material.dart';
import 'package:pokemongo_api_project/api_services/user_provider.dart';
import 'package:provider/provider.dart';

class CricketScreen extends StatefulWidget {
  const CricketScreen({super.key});

  @override
  State<CricketScreen> createState() => _CricketScreenState();
}

class _CricketScreenState extends State<CricketScreen> {


  getCricketApiMethod() async {
    await context.read<UserProvider>().getCricketMatchData(context);
  }

  @override
  void initState() {
    super.initState();
    getCricketApiMethod();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<UserProvider>(builder: (_, user, __) {
          return Column(
            children: [
              // Container(
              //     padding: const EdgeInsets.all(25),
              //     margin: const EdgeInsets.only(left: 10,right: 10,top: 30),
              //     decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.circular(25),
              //     ),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(user.cricketMatchListData!.info!.name.toString(),style: const TextStyle(color: Colors.black),),
              //         Text(user.cricketMatchListData!.info!.startdate.toString(),style: const TextStyle(color: Colors.black),),
              //         Text(user.cricketMatchListData!.info!.enddate.toString(),style: const TextStyle(color: Colors.black),),
              //         Text(user.cricketMatchListData!.info!.t20.toString(),style: const TextStyle(color: Colors.black),),
              //         Text(user.cricketMatchListData!.info!.matches.toString(),style: const TextStyle(color: Colors.black),),
              //       ],
              //     )),
              Expanded(
                child: ListView.builder(
                    itemCount: user.cricketMatchListData!.matchList!.length,
                    itemBuilder: (context,index){
                  return Container(
                    padding: const EdgeInsets.all(25),
                    margin: const EdgeInsets.only(left: 15,right: 15,top: 30),
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(50),
                     boxShadow: [
                       BoxShadow(
                         color: Colors.black.withOpacity(0.5),
                         offset: const Offset(0, 10),
                         blurRadius: 20,
                         spreadRadius: 5.0,
                       )
                     ]
                   ),
                    child: Column(
                      children: [
                        Text(user.cricketMatchListData!.matchList![index].name.toString(),style: const TextStyle(color: Colors.black,fontSize: 22,fontWeight:FontWeight.w600),textAlign: TextAlign.center,),
                        const SizedBox(height: 10),
                        Text(user.cricketMatchListData!.matchList![index].matchType.toString(),style: const TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),textAlign: TextAlign.center,),
                        const SizedBox(height: 10),
                        Text(user.cricketMatchListData!.matchList![index].date.toString(),style: const TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),textAlign: TextAlign.center,),
                        const SizedBox(height: 10),
                        // if(user.cricketMatchData[index].teamInfo != null && user.cricketMatchData[index].teamInfo!.isNotEmpty)
                        SizedBox(
                          height: 120,
                          width: MediaQuery.of(context).size.width,
                          child: GridView.builder(
                              itemCount: user.cricketMatchListData!.matchList![index].teamInfo!.length,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12.0,
                                  mainAxisSpacing:12.0
                              ),
                              itemBuilder: (context,ind){
                                return  Column(
                                  children: [
                                    Container(
                                      height: 50,width: 50,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(image: NetworkImage(user.cricketMatchListData!.matchList![index].teamInfo![ind].img.toString()),fit: BoxFit.cover)
                                        ),
                                        // child: Image.network(user.cricketMatchData[index].teamInfo![ind].img.toString(),filterQuality: FilterQuality.high,fit: BoxFit.cover,),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(user.cricketMatchListData!.matchList![index].teamInfo![ind].name.toString(),style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                                    const SizedBox(height: 5),
                                    Text(user.cricketMatchListData!.matchList![index].teamInfo![ind].shortname.toString(),style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                                  ],
                                );
                              }),
                        ),
                      ],
                    ),
                  );
                },
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
