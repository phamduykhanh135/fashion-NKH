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
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
        color:  Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10)
      ),
      child: DropdownButton<String>(
        value: val,
        items: <String>['Tất cả', 'Áo', 'Quần', 'Phụ kiện']
            .map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
            ),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            val = value!;
            widget.onChangeD(value);
          });
        },
      ),
    );
  }
}
