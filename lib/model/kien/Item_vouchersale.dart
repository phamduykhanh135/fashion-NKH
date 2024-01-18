
import 'package:flutter/material.dart';
import 'package:sales_application/data/kien/voucherSale_Reader.dart';

class ItemVoucherSale extends StatelessWidget {
  final VoucherSales voucher;
  final int? selectedVoucherId;
  final ValueChanged<int?> onChanged;
  final ValueChanged<int> onChangedMoney;

  const ItemVoucherSale({
    Key? key,
    required this.voucher,
    required this.selectedVoucherId,
    required this.onChanged,
    required this.onChangedMoney,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Row(
        children: [
          Radio<int>(
            activeColor: Colors.pink.shade100,
            value: voucher.id,
            groupValue: selectedVoucherId,
            onChanged: (value) {
              onChanged(value);
              onChangedMoney(voucher.money);
            },
          ),
          Container(
            padding: const EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width / 1.35,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.all(const Radius.circular(8)),
            ),
            child: Row(
              children: [
                Image.network(
                  voucher.image,
                  width: MediaQuery.of(context).size.width / 10,
                  height: MediaQuery.of(context).size.height / 10,
                  fit: BoxFit.contain,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          voucher.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          voucher.descriptions,
                          softWrap: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
