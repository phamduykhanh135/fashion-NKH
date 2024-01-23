import 'package:flutter/material.dart';
import 'package:sales_application/models/kien/voucherSale_Reader.dart';

class ItemVoucherSale extends StatelessWidget {
  final VoucherSales voucher;
  final String? selectedVoucherId;
  final ValueChanged<String?> onChanged;
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
   
      
      margin: const EdgeInsets.all(5),
      child: Row(
        children: [
          Radio<String>(
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
            width: MediaQuery.of(context).size.width *0.75,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.all(Radius.circular(8)),
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
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          voucher.name,
                          style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
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