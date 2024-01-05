import 'package:flutter/cupertino.dart';

class DrawerItems extends StatelessWidget {
  // const DrawerIcons({super.key});
String ItemName;
IconData ItemIcon;

DrawerItems(this.ItemName, this.ItemIcon);

  @override
  Widget build(BuildContext context) {
    return Container(
      child : Row(
        children: [
          Icon(this.ItemIcon),
          SizedBox(width: 10,),
          Text(ItemName),

        ],

      )

    );
  }
}
