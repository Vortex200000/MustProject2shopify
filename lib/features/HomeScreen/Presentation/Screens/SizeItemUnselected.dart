
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SizeItemUnSelected extends StatefulWidget {

  List<int>Sizes;
  int index ;
  SizeItemUnSelected(this.Sizes , this.index);
  @override
  State<SizeItemUnSelected> createState() => _SizeItemUnSelectedState();
}

class _SizeItemUnSelectedState extends State<SizeItemUnSelected> {
  // const SizeItemUnSelected({super.key});
  bool flag = false;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
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
          height: 35,
          width: 35,
          child: Center(
              child: Text("${widget.Sizes[widget.index]}",
                  style: TextStyle(
                      color: flag == false ? Colors.black : Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400))),
          decoration: BoxDecoration(
              color: flag == false ? Colors.transparent : Colors.black,
              border: Border.all(),
              borderRadius: BorderRadius.circular(5)
              // shape: BoxShape.circle

          ),
        ),
      ),
    );
  }
}
