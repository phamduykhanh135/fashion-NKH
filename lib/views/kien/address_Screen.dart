import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/kien/address_Reader.dart';

class address_Screen extends StatefulWidget {
  final void Function(Address) onAddressSelected;

  const address_Screen({Key? key, required this.onAddressSelected}) : super(key: key);

  @override
  State<address_Screen> createState() => _address_ScreenState();
}

class _address_ScreenState extends State<address_Screen> {
  Color myColor = const Color(0xFF8E1C68);
  List<Address> addr = [];
  int selectedAddressIndex = -1;
Future<void> _showConfirm(String addressId) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
           backgroundColor: const Color.fromARGB(255, 239, 232, 232),
          title: const Text('Bạn có muốn xóa?',textAlign: TextAlign.center),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              TextButton(
              style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 255, 255, 255)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                    ),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Đóng dialog
              },
              child: const Text('Hủy',style: TextStyle(color: Colors.black)),
            ),
            
            TextButton(
              style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.pink.shade100),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                    ),
              ),
             onPressed: () async {
                Address.deleteAddress(addressId);
                Navigator.of(context).pop();
            },

              child: const Text('Xóa',style: TextStyle(color: Colors.black)),
            ),
            ],)
          ],
        );
      },
    );
  }

  void _loadData() async {
    await Address.loadData_address();
    setState(() {
      addr = Address.address;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chọn địa chỉ nhận hàng",
          style: TextStyle(color: myColor),
        ),
        iconTheme: IconThemeData(color: myColor),
        backgroundColor: Colors.pink.shade100,
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('address').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('Lỗi: ${snapshot.error}');
            return Text('Lỗi: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData && snapshot.data != null) {
            addr = snapshot.data!.docs.map((doc) => Address.fromJson(doc.data() as Map<String, dynamic>)).toList();
          }

          return Padding(
            padding: const EdgeInsets.only(bottom: 1),
            child: ListView(
              children: [
                Text("Chọn địa chỉ:",style: TextStyle(color: myColor, fontSize: 18,fontWeight: FontWeight.bold)),
                const Divider(color: Colors.grey, thickness: 1),
                ListView.builder(
                  padding: const EdgeInsets.only(left: 20),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: addr.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildAddressItem(index);
                  },
                ),
                const Divider(color: Colors.grey, thickness: 1),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton.icon(
                        onPressed: (){},
                        // onPressed: () 
                        // async {
                        //   final result = await Navigator.push<Address?>(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => add_Address(),
                        //     ),
                        //   );

                        //   if (result != null && result is Address) {
                        //     // Pass the selected address back to the previous screen
                        //     Navigator.pop(context, result);
                        //   }
                        // },
                        icon: Icon(Icons.add,color:myColor ),
                        label:  Text('Thêm địa chỉ mới',style: TextStyle(color:myColor, fontSize: 18)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.pink.shade100),
            minimumSize: MaterialStateProperty.all(const Size(120, 50)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
          child: Text(
            'Xác nhận',
            style: TextStyle(color: myColor, fontSize: 18),
          ),
        ),
      ),
    );
  }

  Widget buildAddressItem(int index) {
    return ListTile(
      title: Row(
        
        children: [
          Radio(
            activeColor: Colors.pink.shade100,
            value: index,
            groupValue: selectedAddressIndex,
            onChanged: (value) {
              setState(() {
                selectedAddressIndex = value as int;
                widget.onAddressSelected(addr[index]); // Use the callback method
              });
            },
          ),
          const SizedBox(width: 50,),
          SizedBox(
            width: MediaQuery.of(context).size.width/2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(addr[index].fullname,style: const TextStyle(fontSize: 18)),
                Text(addr[index].phone,style: const TextStyle(fontSize: 18)),
                Text(addr[index].addressText,style: const TextStyle(fontSize: 18)),
              ],
              
            ),
            
            
          ),
           IconButton(
                          onPressed: (){
                            _showConfirm(addr[index].id);
                          },
                          icon: const Icon(Icons.delete),
                        ),
        ],
      ),
    );
  }
}