import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:sales_application/presenters/bottom.dart';
import 'package:sales_application/views/nghia/order_confirmation.dart';
import 'package:sales_application/views/setting_screen.dart';
import '../model/user.dart';
import 'Hao/qlsp_Screen.dart';
class Personal_Screen extends StatefulWidget {
  const Personal_Screen({
    Key? key,
  }) : super(key: key);

  @override
  State<Personal_Screen> createState() => _Personal_ScreenState();
}

class _Personal_ScreenState extends State<Personal_Screen> {
  late UserModel user = UserModel();
  int shouldUpdate = 0;

  void updateState(int value) {
    print("haaaaaaaaaaaaaaaaaaa");
    setState(() {
      shouldUpdate = value;
      getData();
       print("bbbbbbbbbbbbbbbb");
    });
  }
  @override
  
  void initState() {
    super.initState();
    getData();
      print("aaaaaaaaa");
  }

  Future<void> getData() async {
     print("bbbbbbbbbbbbbbb");
    UserModel? userData = await FirestoreService().getUserData();
    if (userData != null) {
      setState(() {
        user = userData;
      });
      
    }
  
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        
        child: Column(
          children: [
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.pink.shade100,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    child: Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                           Setting_Screen(onUpdate: updateState,),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.settings,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              buildAvatarUser(user.image),
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 10, 10),
                                child: Column(
                                  children: [
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin:
                                                const EdgeInsets.only(bottom: 30),
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                user.fullname,
                                                // "Phạm Duy Khánh",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                user.email,
      
                                                // 'duyhanh18092003@gmail.com ',
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            if (user.admin == false)
              Container(
                 padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Add your onPressed function here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade300,
                  ),
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 20,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Đơn hàng',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            if (user.admin==true)
              Container(
                padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: ElevatedButton(
                  onPressed: () {
                     Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                           const OrderConfirmation()
                                    ),
                                  );
                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade300,
                  ),
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 20,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Xác nhận đơn hàng',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (user.admin==true)
                   Container(
               padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                           QuanLySP()
                                    ),
                                  );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade300,
                  ),
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 20,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Quản lý sản phẩm',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            Container(
              padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: ElevatedButton(
                onPressed: () {
                  logOut(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                ),
                child: SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 20,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Đăng xuất',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      Icon(
                        Icons.output_rounded,
                        size: 15,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Bottom_Nav(id: 3,),
    );
  }
}

Widget buildAvatarUser(Uint8List? image) {
  if (image != null) {
    return  Padding(
      padding: const EdgeInsets.only(top: 5, left: 5),
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.transparent,
        backgroundImage: MemoryImage(image),
      ),
    );
  } else {
    return const Padding(
      padding: EdgeInsets.only(top: 5, left: 5),
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage('assets/avartar.png'),
      ),
    );
  }
}