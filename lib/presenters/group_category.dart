import 'package:flutter/material.dart';

class GroupCategory extends StatefulWidget {
  const GroupCategory({super.key, required this.onChangeD});
  final Function onChangeD;

  @override
  State<GroupCategory> createState() => _GroupCategoryState();
}

class _GroupCategoryState extends State<GroupCategory> {
  String val = "Tất cả";
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: val,
      items: <String>['Tất cả', 'Quần', 'Áo', 'Phụ kiện',]
          .map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: const TextStyle(color: Colors.blueAccent),
          ),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          val = value!;
          widget.onChangeD(value);
        });
      },
    );
  }
}
