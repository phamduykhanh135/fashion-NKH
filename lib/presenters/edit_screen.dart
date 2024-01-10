import 'package:flutter/material.dart';

import '../model/user.dart';

class Edit_Screen extends StatelessWidget {
  const Edit_Screen({super.key,required this.name_edit,required this.sst});
  final String name_edit;
  final int sst;

  @override
  Widget build(BuildContext context) {
      TextEditingController name = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title:  Text("Sửa $name_edit"),
        actions: [
          TextButton(onPressed: (){
              updateUserInfo(name.text);
          }, 
          child: Container(
            child: Row(
              children: const [
                 Text("Lưu",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)
              ],
            ),
          )
          )
        ],
        backgroundColor: Colors.pink.shade100,
      ),
      body: Center(
        child: Column(
          children: [
            
             Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: TextFormField(
                controller: name,
                cursorColor: Colors.grey,
                style: const TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                 
                  labelText: name_edit,
                  labelStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      color: Colors.grey, // Border color when focused
                      width: 1.0,
                    ),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
