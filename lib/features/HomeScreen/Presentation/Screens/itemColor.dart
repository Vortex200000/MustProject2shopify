import 'package:flutter/material.dart';


class ItemColour extends StatefulWidget {
  // const ItemColour({super.key});
  Color ItemColors;

  ItemColour(this.ItemColors);

  @override
  State<ItemColour> createState() => _ItemColourState();
}

class _ItemColourState extends State<ItemColour> {
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,


      onTap: () {
        if (flag == false) {
          flag = true;
        } else
          flag = false;
        setState(() {});
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(

          padding: flag == true ? EdgeInsets.all(2): EdgeInsets.all(0),
          width: 35,
          height: 35,
          child: Container(
            decoration: BoxDecoration(
              color: widget.ItemColors,

              borderRadius: BorderRadius.circular(50),
            ),
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black , width: 2),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
