import 'package:flutter/material.dart';

class QuantityButton extends StatefulWidget {
  final int initialValue;
  final int minValue;
  final int maxValue;
  final ValueChanged<int>? onChanged;

  const QuantityButton({
    super.key,
    this.initialValue = 1,
    this.minValue = 0,
    this.maxValue = 999999,
    this.onChanged,
  });

  @override
  State<QuantityButton> createState() =>
      _QuantityButtonState();
}

class _QuantityButtonState
    extends State<QuantityButton> {

  late int quantity;

  late TextEditingController controller;

  @override
  void initState() {
    super.initState();

    quantity = widget.initialValue;

    controller = TextEditingController(
      text: quantity.toString(),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void updateQuantity(int value) {

    if (value < widget.minValue) return;

    if (value > widget.maxValue) return;

    setState(() {

      quantity = value;

      controller.text = value.toString();

    });

    widget.onChanged?.call(quantity);
  }

  void increment() {

    updateQuantity(quantity + 1);

  }

  void decrement() {

    updateQuantity(quantity - 1);

  }

  @override
  Widget build(BuildContext context) {

    return Container(

      height: 52,

      decoration: BoxDecoration(

        border: Border.all(
          color: Colors.grey.shade300,
        ),

        borderRadius:
            BorderRadius.circular(12),

      ),

      child: Row(

        children: [

          InkWell(

            onTap: decrement,

            onLongPress: decrement,

            child: const SizedBox(

              width: 50,

              child: Icon(
                Icons.remove,
              ),

            ),

          ),

          Expanded(

            child: TextField(

              controller: controller,

              textAlign: TextAlign.center,

              keyboardType:
                  TextInputType.number,

              decoration:
                  const InputDecoration(

                border: InputBorder.none,

              ),

              onChanged: (value) {

                final parsed =
                    int.tryParse(value);

                if (parsed == null) return;

                updateQuantity(parsed);

              },

            ),

          ),

          InkWell(

            onTap: increment,

            onLongPress: increment,

            child: const SizedBox(

              width: 50,

              child: Icon(
                Icons.add,
              ),

            ),

          ),

        ],

      ),

    );

  }

}