import 'package:flutter/material.dart';
import '../../data/kien/address_Reader.dart';
import '../../views/kien/address_Screen.dart';
import '../../views/kien/Voucher_Screen.dart';
import '../../views/kien/payment_Screen.dart';

class Buy_SelectedOption extends StatefulWidget {
  final void Function(double) onVoucherSelected;
  final double totalPrice;
  final void Function(Address) onAddressSelected;

  const Buy_SelectedOption({
    Key? key,
    required this.onVoucherSelected,
    required this.totalPrice,
    required this.onAddressSelected,
  }) : super(key: key);

  @override
  State<Buy_SelectedOption> createState() => _Buy_SelectedOptionState();
}

class _Buy_SelectedOptionState extends State<Buy_SelectedOption> {
  Address? selectedAddress;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
         
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Phương thức thanh toán", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Payment_Screen()),
                  );
                },
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
          const Divider(color: Colors.grey, thickness: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Chọn voucher", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Voucher(
                        onVoucherSelected: (value) {
                          widget.onVoucherSelected(value);
                        },
                        totalPrice: widget.totalPrice,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
          const Divider(color: Colors.grey, thickness: 1),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Chọn địa chỉ nhận hàng", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              
              IconButton(
                onPressed: () async {
                  final result = await Navigator.push<Address?>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => address_Screen(onAddressSelected: widget.onAddressSelected),
                    ),
                  );

                  if (result != null) {
                    setState(() {
                      selectedAddress = result;
                      // No need to update the text here, it's updated in the Text widget
                      widget.onAddressSelected(result); 
                    });
                  }
                },
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}