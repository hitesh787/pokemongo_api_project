import 'package:flutter/material.dart';
import 'package:pokemongo_api_project/theme_changer.dart';
import 'package:provider/provider.dart';



class DarkoModePages extends StatelessWidget {
  const DarkoModePages({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dark Theme Demo'),
        actions: [

        ],
      ),
      body: Column(
        children: <Widget>[
          RadioListTile<ThemeMode>(
            title: const Text('Light Mode'),
            groupValue: themeChanger.themeMode,
            value: ThemeMode.light,
            onChanged: themeChanger.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: const Text('Dark Mode'),
            groupValue: themeChanger.themeMode,
            value: ThemeMode.dark,
            onChanged: themeChanger.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: const Text('System Mode'),
            groupValue: themeChanger.themeMode,
            value: ThemeMode.system,
            onChanged: themeChanger.setTheme,
          ),
          Container(
            height: 50,width: 200,
            color: Theme.of(context).brightness == Brightness.light ? Colors.yellow : Colors.black,
            child: const Center(child: Text('Button')),
          )

        ],
      ),
    );
  }
}