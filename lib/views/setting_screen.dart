import 'package:flutter/material.dart';
import 'package:sales_application/views/change_password_screen.dart';

import 'edit_profile_screen.dart';


class Setting_Screen extends StatelessWidget {
    final void Function(int) onUpdate;
  const Setting_Screen({super.key,required this.onUpdate});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cài đặt"),
        backgroundColor: Colors.pink.shade100,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Container(
              width: 400,
              height: 60,
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 3,color: Colors.grey.shade100),
                 
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Edit_Profile_Screen(onUpdate: onUpdate ),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.grey;
                    }
                    return Colors.grey.shade300;
                  }),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                child: const Text(
                  "Chỉnh sửa hồ sơ",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    
                    
                  ),
                ),
              ),
            ),
               Container(
              width: 400,
              height: 60,
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 3,color: Colors.grey.shade100),
                 
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const SiginUp_Screen(),
                  //   ),
                  // );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.grey;
                    }
                    return Colors.grey.shade300;
                  }),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                child: const Text(
                  "Ngôn ngữ",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    
                    
                  ),
                ),
              ),
            ),
             Container(
              width: 400,
              height: 60,
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 3,color: Colors.grey.shade100),
                 
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Change_Password_screen(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.grey;
                    }
                    return Colors.grey.shade300;
                  }),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                child: const Text(
                  "Đổi mật khẩu",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    
                    
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}