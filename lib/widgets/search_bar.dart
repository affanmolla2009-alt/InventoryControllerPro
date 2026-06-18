import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onVoiceSearch;
  final VoidCallback? onClear;

  const CustomSearchBar({
    super.key,
    this.hintText = "Search...",
    this.onChanged,
    this.onVoiceSearch,
    this.onClear,
  });

  @override
  State<CustomSearchBar> createState() =>
      _CustomSearchBarState();
}

class _CustomSearchBarState
    extends State<CustomSearchBar> {

  final TextEditingController controller =
      TextEditingController();

  bool hasText = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void clearSearch() {

    controller.clear();

    setState(() {

      hasText = false;

    });

    if (widget.onClear != null) {

      widget.onClear!();

    }

    if (widget.onChanged != null) {

      widget.onChanged!("");

    }

  }

  @override
  Widget build(BuildContext context) {

    return Container(

      height: 56,

      decoration: BoxDecoration(

        color: Theme.of(context)
            .cardColor,

        borderRadius:
            BorderRadius.circular(14),

        boxShadow: [

          BoxShadow(

            color: Colors.black12,

            blurRadius: 4,

            offset: const Offset(0, 2),

          ),

        ],

      ),

      child: TextField(

        controller: controller,

        onChanged: (value) {

          setState(() {

            hasText = value.isNotEmpty;

          });

          if (widget.onChanged != null) {

            widget.onChanged!(value);

          }

        },

        decoration: InputDecoration(

          border: InputBorder.none,

          contentPadding:
              const EdgeInsets.symmetric(
            vertical: 16,
          ),

          hintText: widget.hintText,

          prefixIcon: const Icon(
            Icons.search,
          ),

          suffixIcon: Row(

            mainAxisSize: MainAxisSize.min,

            children: [

              if (hasText)

                IconButton(

                  icon: const Icon(
                    Icons.clear,
                  ),

                  onPressed:
                      clearSearch,

                ),

              IconButton(

                icon: const Icon(
                  Icons.mic,
                ),

                onPressed:
                    widget.onVoiceSearch,

              ),

            ],

          ),

        ),

      ),

    );

  }

}