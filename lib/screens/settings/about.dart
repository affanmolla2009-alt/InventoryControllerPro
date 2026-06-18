import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  void _copyEmail(BuildContext context) {

    Clipboard.setData(
      const ClipboardData(
        text: "support@inventorycontrollerpro.com",
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(

      const SnackBar(

        content: Text(
          "Email copied to clipboard.",
        ),

      ),

    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text(
          "About",
        ),

      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            Image.asset(

              "assets/icons/app_icon.png",

              height: 100,

              width: 100,

            ),

            const SizedBox(height: 15),

            const Text(

              "Inventory Controller Pro",

              style: TextStyle(

                fontSize: 26,

                fontWeight: FontWeight.bold,

              ),

            ),

            const SizedBox(height: 5),

            const Text(
              "Professional Inventory Management",
            ),

            const SizedBox(height: 20),

            Card(

              child: ListTile(

                leading: const Icon(
                  Icons.person,
                ),

                title: const Text(
                  "Developer",
                ),

                subtitle: const Text(
                  "Affan Ali Molla",
                ),

              ),

            ),

            Card(

              child: ListTile(

                leading: const Icon(
                  Icons.business,
                ),

                title: const Text(
                  "Publisher",
                ),

                subtitle: const Text(
                  "Affan Ali Molla",
                ),

              ),

            ),

            Card(

              child: ListTile(

                leading: const Icon(
                  Icons.code,
                ),

                title: const Text(
                  "Version",
                ),

                subtitle: const Text(
                  "1.0.0",
                ),

              ),

            ),

            Card(

              child: ListTile(

                leading: const Icon(
                  Icons.copyright,
                ),

                title: const Text(
                  "License",
                ),

                subtitle: const Text(
                  "MIT License",
                ),

              ),

            ),

            Card(

              child: ListTile(

                leading: const Icon(
                  Icons.security,
                ),

                title: const Text(
                  "Privacy",
                ),

                subtitle: const Text(
                  "Your inventory data remains stored locally on your device.",
                ),

              ),

            ),

            Card(

              child: ListTile(

                leading: const Icon(
                  Icons.email,
                ),

                title: const Text(
                  "Support Email",
                ),

                subtitle: const Text(
                  "support@inventorycontrollerpro.com",
                ),

                trailing: IconButton(

                  icon: const Icon(
                    Icons.copy,
                  ),

                  onPressed: () {

                    _copyEmail(context);

                  },

                ),

              ),

            ),

            const SizedBox(height: 25),

            const Align(

              alignment: Alignment.centerLeft,

              child: Text(

                "Acknowledgements",

                style: TextStyle(

                  fontSize: 20,

                  fontWeight: FontWeight.bold,

                ),

              ),

            ),

            const SizedBox(height: 10),

            Card(

              child: Padding(

                padding: EdgeInsets.all(16),

                child: Text(

                  "This application uses Flutter, Dart, SQLite and other open-source technologies. We appreciate the efforts of the open-source community that made this project possible.",

                  textAlign: TextAlign.justify,

                ),

              ),

            ),

            const SizedBox(height: 20),

            const Align(

              alignment: Alignment.centerLeft,

              child: Text(

                "Credits",

                style: TextStyle(

                  fontSize: 20,

                  fontWeight: FontWeight.bold,

                ),

              ),

            ),

            const SizedBox(height: 10),

            Card(

              child: Padding(

                padding: EdgeInsets.all(16),

                child: Column(

                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Text(
                      "Concept : Affan Ali Molla",
                    ),

                    SizedBox(height: 6),

                    Text(
                      "Design : Affan Ali Molla",
                    ),

                    SizedBox(height: 6),

                    Text(
                      "Development : Affan Ali Molla",
                    ),

                    SizedBox(height: 6),

                    Text(
                      "Publishing : Affan Ali Molla",
                    ),

                    SizedBox(height: 6),

                    Text(
                      "Testing : Affan Ali Molla",
                    ),

                    SizedBox(height: 6),

                    Text(
                      "Maintenance : Affan Ali Molla",
                    ),

                  ],

                ),

              ),

            ),

            const SizedBox(height: 25),

            const Text(

              "© 2026 Affan Ali Molla\nAll Rights Reserved.",

              textAlign: TextAlign.center,

              style: TextStyle(
                color: Colors.grey,
              ),

            ),

            const SizedBox(height: 30),

          ],

        ),

      ),

    );

  }

}