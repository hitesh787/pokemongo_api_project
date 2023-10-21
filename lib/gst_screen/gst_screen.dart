import 'package:flutter/material.dart';

class GstCalculatorApp extends StatefulWidget {
  const GstCalculatorApp({super.key});

  @override
  State<GstCalculatorApp> createState() => _GstCalculatorAppState();
}

class _GstCalculatorAppState extends State<GstCalculatorApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [


            TextFormField(
              decoration: const InputDecoration(
                label: Text("Amount")
              ),
            ),

            const SizedBox(height: 20),

            TextFormField(
              decoration: const InputDecoration(
                  label: Text("Percentage")
              ),
            ),

            const SizedBox(height: 50),
            
            GestureDetector(
              onTap: (){
                print("Calculate Amount");

              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(child: Text("Calculate",style: TextStyle(fontSize: 20,color: Colors.white),)),
              ),
            )
            
          ],
        ),
      ),
    );
  }
}
