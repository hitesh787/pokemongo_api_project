

import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  final String name ;
  const MessageScreen({Key? key , required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Text("Username : $name ",style: const TextStyle(fontSize: 30),),
      ),
    );
  }
}