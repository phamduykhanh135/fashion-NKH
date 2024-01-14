import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../views/Voucher.dart';
import '../views/payment.dart';

class Buy_SelectedOption extends StatefulWidget {
  final void Function(double) onVoucherSelected;
  const Buy_SelectedOption({Key? key, required this.onVoucherSelected}) : super(key: key);

  @override
  State<Buy_SelectedOption> createState() => _Buy_SelectedOptionState();
}

class _Buy_SelectedOptionState extends State<Buy_SelectedOption> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Divider(color: Colors.grey, thickness: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Phương thức thanh toán", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Payment_Screen()),
                  );
                },
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
          const Divider(color: Colors.grey, thickness: 1),
          Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text("Chọn voucher", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Voucher(
            
                  onVoucherSelected: (value) {
                    // Gọi hàm callback của widget cha để truyền giá trị lên
                    widget.onVoucherSelected(value);
                  },
                ),
              ),
            );
          },
          icon: Icon(Icons.arrow_forward_ios),
        )

          ],
        ),

        ],
      ),
    );
  }
}