import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {

  final String title;

  final bool showBackButton;

  final bool showSearch;

  final bool showNotification;

  final bool showProfile;

  final bool showThemeToggle;

  final VoidCallback? onBack;

  final VoidCallback? onSearch;

  final VoidCallback? onNotification;

  final VoidCallback? onProfile;

  final VoidCallback? onThemeToggle;

  final PopupMenuButton<String>? popupMenu;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.showSearch = false,
    this.showNotification = false,
    this.showProfile = false,
    this.showThemeToggle = false,
    this.onBack,
    this.onSearch,
    this.onNotification,
    this.onProfile,
    this.onThemeToggle,
    this.popupMenu,
  });

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {

    return AppBar(

      elevation: 0,

      centerTitle: false,

      automaticallyImplyLeading: false,

      title: Text(

        title,

        style: const TextStyle(

          fontWeight: FontWeight.bold,

          fontSize: 22,

        ),

      ),

      leading: showBackButton

          ? IconButton(

              icon: const Icon(
                Icons.arrow_back_ios_new,
              ),

              onPressed: onBack ??
                  () {
                    Navigator.pop(context);
                  },

            )

          : null,

      actions: [

        if (showSearch)

          IconButton(

            icon: const Icon(
              Icons.search,
            ),

            onPressed: onSearch,

          ),

        if (showThemeToggle)

          IconButton(

            icon: const Icon(
              Icons.dark_mode,
            ),

            onPressed: onThemeToggle,

          ),

        if (showNotification)

          Stack(

            alignment: Alignment.center,

            children: [

              IconButton(

                icon: const Icon(
                  Icons.notifications,
                ),

                onPressed: onNotification,

              ),

              Positioned(

                right: 10,

                top: 10,

                child: Container(

                  width: 10,

                  height: 10,

                  decoration:
                      const BoxDecoration(

                    color: Colors.red,

                    shape: BoxShape.circle,

                  ),

                ),

              ),

            ],

          ),

        if (showProfile)

          Padding(

            padding:
                const EdgeInsets.only(
              right: 8,
            ),

            child: GestureDetector(

              onTap: onProfile,

              child: const CircleAvatar(

                radius: 18,

                backgroundImage: AssetImage(

                  "assets/placeholders/no_image.png",

                ),

              ),

            ),

          ),

        if (popupMenu != null)

          popupMenu!,

      ],

    );

  }

}