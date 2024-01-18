import 'package:flutter/material.dart';

class Buy_List extends StatelessWidget {
  final double totalPrice;
  final double selectedVoucherValue;
  final void Function(double) onTotalAmountChanged;

  const Buy_List({Key? key, required this.totalPrice, required this.selectedVoucherValue, required this.onTotalAmountChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double finalTotalAmount = totalPrice - (totalPrice * selectedVoucherValue) / 100;
    onTotalAmountChanged(finalTotalAmount);

    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Tổng tiền hàng:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(totalPrice.toStringAsFixed(3), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Voucher giảm giá (áp dụng):", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text("${selectedVoucherValue.toInt()}%", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Thành tiền:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(finalTotalAmount.toStringAsFixed(3), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
