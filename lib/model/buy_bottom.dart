import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BuyBottom extends StatelessWidget {
  final double onTotalAmountChanged;
  final double VoucherSale;
  final String address;

  const BuyBottom({Key? key, required this.onTotalAmountChanged, required this.VoucherSale, required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color myColor = const Color(0xFF8E1C68);

    return Container(
      height: 60,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.pink.shade100),
                minimumSize: MaterialStateProperty.all(const Size(360, 50)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () async {
                
                print(address);
                if (address.isEmpty) {
                  showAddressDialog(context);
                } else {
                  await createAndAddInvoice();
                }
              },
              child: Text(
                'Thanh toán',
                style: TextStyle(color: myColor, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showAddressDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Lỗi"),
          content: Text("Vui lòng nhập địa chỉ trước khi thanh toán."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  Future<void> createAndAddInvoice() async {
    QuerySnapshot paymentsSnapshot = await FirebaseFirestore.instance.collection('payments').get();
    List<Map<String, dynamic>> items = paymentsSnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

    await FirebaseFirestore.instance.collection('invoices').add({
      'address': address,
      'items': items,
      'totalAmount': VoucherSale == 0 ? onTotalAmountChanged : onTotalAmountChanged - (onTotalAmountChanged * VoucherSale) / 100,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
