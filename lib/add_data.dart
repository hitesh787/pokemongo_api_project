import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pokemongo_api_project/home_screen.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({super.key});

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  bool isEdit = false;

  Future<void> createApi() async {
    final uri = Uri.parse('https://dummy.restapiexample.com/api/v1/create');
    final response = await http.post(
      uri,
      body: (jsonEncode({
        "name": nameController.text.toString(),
        "salary": salaryController.text.toString(),
        "age": ageController.text.toString(),
      })),
    );
    print(
        " /////////////////////////// response body ///////////////////////////");
    if (response.statusCode == 201) {
      print(response.statusCode);
      var jsonData = jsonDecode(response.body.toString());
      print(jsonData);
      nameController.text = "";
      salaryController.text = "";
      ageController.text = "";
      print("********* Successfully Data Save ***********");
    } else {
      print(response.statusCode);
      print('--------  Error  ---------');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Data"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(hintText: "name"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: salaryController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: "salary"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: "Age"),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
                onPressed: () {
                  createApi();
                },
                child: const Text("Add Data")),
            const SizedBox(height: 40),

            ElevatedButton(
                onPressed: () async {

                  final serviceStatus = await Permission.camera.isGranted ;

                  bool isCameraOn = serviceStatus == ServiceStatus.enabled;

                  final status = await Permission.camera.request();

                  PermissionStatus cameraStatus = await Permission.camera.request();

                  if (cameraStatus == PermissionStatus.granted) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Permission Granted")));
                  }

                  if (cameraStatus == PermissionStatus.denied) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("This Permission is recommended")));
                  }

                  if (cameraStatus == PermissionStatus.permanentlyDenied) {
                    openAppSettings();
                  }
                },
                child: const Text("Camera Permission")),
            const SizedBox(height: 40),
            ElevatedButton(
                onPressed: () async {
                  PermissionStatus storageStatus =
                      await Permission.storage.request();
                  if (storageStatus == PermissionStatus.granted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Permission Granted")));
                  }
                  if (storageStatus == PermissionStatus.denied) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("This Permission is recommended")));
                  }
                  if (storageStatus == PermissionStatus.permanentlyDenied) {
                    openAppSettings();
                  }
                },
                child: const Text("Storage Permission")),
            const SizedBox(height: 40),
            ElevatedButton(
                onPressed: () async {
                  Map<Permission, PermissionStatus> status = await [
                    Permission.camera,
                    Permission.microphone,
                    Permission.storage,
                  ].request();

                  print(status.toString());
                },
                child: const Text("All Permission")),
          ],
        ),
      ),
    );
  }
}
