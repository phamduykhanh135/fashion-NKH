import 'package:flutter/material.dart';
import 'package:sales_application/views/color.dart';

class ItemLSP extends StatelessWidget {
  const ItemLSP({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: MyColor.light_grey,
              width: 1.5,
            ),
          ),
        ),

      child: InkWell(
        onTap: (){},
        child: Container(
          padding: const EdgeInsets.fromLTRB(35,0, 0,0),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 3, child: Text("Quần")),
              Expanded(child: Icon(Icons.arrow_forward_ios_outlined))
            ],
          ),
        )
      )
    );
  }
}