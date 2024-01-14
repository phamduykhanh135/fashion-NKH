import 'package:flutter/material.dart';
import 'package:sales_application/data/voucherShip_Reader.dart';
import 'package:sales_application/data/voucherSale_Reader.dart';

class Item_voucherShip extends StatelessWidget {
  final VoucherShips voucher;
  final int? selectedVoucherId;
  final ValueChanged<int?> onChanged;

  const Item_voucherShip({
    Key? key,
    required this.voucher,
    required this.selectedVoucherId,
    required this.onChanged,
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
            onChanged: onChanged,
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
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          
                        ),
                        Text(
                          voucher.value.toString(),
                          softWrap: true,
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