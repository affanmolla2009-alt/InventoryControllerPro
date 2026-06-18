import 'package:flutter/material.dart';

class ThemeSettings extends StatefulWidget {
  const ThemeSettings({super.key});

  @override
  State<ThemeSettings> createState() =>
      _ThemeSettingsState();
}

class _ThemeSettingsState
    extends State<ThemeSettings> {

  ThemeMode _themeMode = ThemeMode.system;

  MaterialColor _accentColor = Colors.blue;

  Future<void> _saveTheme() async {

    /*
      theme_service.dart

      Save:

      ThemeMode

      Accent Color

      settings_provider.dart

      theme_provider.dart

    */

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(

      const SnackBar(

        content: Text(
          "Theme settings saved successfully.",
        ),

      ),

    );

  }

  Widget _colorCircle(MaterialColor color) {

    return GestureDetector(

      onTap: () {

        setState(() {

          _accentColor = color;

        });

      },

      child: Container(

        width: 45,

        height: 45,

        decoration: BoxDecoration(

          color: color,

          shape: BoxShape.circle,

          border: Border.all(

            color: _accentColor == color
                ? Colors.black
                : Colors.grey,

            width: 2,

          ),

        ),

        child: _accentColor == color
            ? const Icon(
                Icons.check,
                color: Colors.white,
              )
            : null,

      ),

    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text(
          "Theme Settings",
        ),

      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            const Text(

              "Appearance",

              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),

            ),

            const SizedBox(height: 15),

            RadioListTile<ThemeMode>(

              value: ThemeMode.light,

              groupValue: _themeMode,

              title: const Text(
                "Light Mode",
              ),

              secondary: const Icon(
                Icons.light_mode,
              ),

              onChanged: (value) {

                setState(() {

                  _themeMode = value!;

                });

              },

            ),

            RadioListTile<ThemeMode>(

              value: ThemeMode.dark,

              groupValue: _themeMode,

              title: const Text(
                "Dark Mode",
              ),

              secondary: const Icon(
                Icons.dark_mode,
              ),

              onChanged: (value) {

                setState(() {

                  _themeMode = value!;

                });

              },

            ),

            RadioListTile<ThemeMode>(

              value: ThemeMode.system,

              groupValue: _themeMode,

              title: const Text(
                "System Default",
              ),

              secondary: const Icon(
                Icons.phone_android,
              ),

              onChanged: (value) {

                setState(() {

                  _themeMode = value!;

                });

              },

            ),

            const Divider(height: 40),

            const Text(

              "Accent Color",

              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),

            ),

            const SizedBox(height: 20),

            Wrap(

              spacing: 15,

              runSpacing: 15,

              children: [

                _colorCircle(Colors.blue),

                _colorCircle(Colors.green),

                _colorCircle(Colors.red),

                _colorCircle(Colors.orange),

                _colorCircle(Colors.purple),

                _colorCircle(Colors.teal),

                _colorCircle(Colors.indigo),

                _colorCircle(Colors.brown),

              ],

            ),

            const SizedBox(height: 35),

            Card(

              child: Padding(

                padding:
                    const EdgeInsets.all(16),

                child: Column(

                  children: [

                    Icon(

                      Icons.palette,

                      size: 55,

                      color: _accentColor,

                    ),

                    const SizedBox(height: 10),

                    const Text(

                      "Preview",

                      style: TextStyle(
                        fontWeight:
                            FontWeight.bold,
                        fontSize: 18,
                      ),

                    ),

                    const SizedBox(height: 10),

                    ElevatedButton(

                      style:
                          ElevatedButton.styleFrom(

                        backgroundColor:
                            _accentColor,

                      ),

                      onPressed: () {},

                      child: const Text(
                        "Sample Button",
                      ),

                    ),

                  ],

                ),

              ),

            ),

            const SizedBox(height: 30),

            SizedBox(

              width: double.infinity,

              height: 55,

              child:
                  ElevatedButton.icon(

                icon: const Icon(
                  Icons.save,
                ),

                label: const Text(
                  "Save Theme",
                ),

                onPressed: _saveTheme,

              ),

            ),

            const SizedBox(height: 25),

            Card(

              child: Padding(

                padding:
                    const EdgeInsets.all(16),

                child: Column(

                  children: const [

                    Icon(
                      Icons.info_outline,
                      size: 40,
                    ),

                    SizedBox(height: 10),

                    Text(

                      "Theme changes will be applied throughout the application after saving.",

                      textAlign:
                          TextAlign.center,

                    ),

                  ],

                ),

              ),

            ),

          ],

        ),

      ),

    );

  }

}