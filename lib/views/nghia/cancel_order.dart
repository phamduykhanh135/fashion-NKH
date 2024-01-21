import 'package:flutter/material.dart';
import 'package:sales_application/model/nghia/item_cancel_order.dart';
import 'package:sales_application/data/nghia/bills.dart';
import 'detail_bill.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CancelOrder extends StatefulWidget {
  const CancelOrder({super.key});

  @override
  State<CancelOrder> createState() => _CancelOrderState();
}

class _CancelOrderState extends State<CancelOrder> {

  List<Bills> bills = [];
  void _loadData() async {
    await Bills.loadBills();
    setState(() {
      bills = Bills.bills;
    });
  }

  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance.collection('invoices').snapshots().listen((event) {
      _loadData();
    });
    
    _loadData();
  }

  @override
  void dispose() {
  
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    int n=bills.length;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,//có thể thay đổi
        title: Text('Hủy đơn hàng',textAlign: TextAlign.center,style: TextStyle(color: Colors.purpleAccent.shade400,)),//thay doi
        centerTitle: true,// chỉnh titile ở giữa
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
             
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.purpleAccent.shade400,//thay doi
        ),
      ),
      body:StreamBuilder(
      stream: FirebaseFirestore.instance.collection('invoices').snapshots(),
      builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return const CircularProgressIndicator();
      }                
      return 
        SingleChildScrollView(
        child: Column(
          children: [
            if (bills.every((bill) =>
                bill.confirm_state == true ||
                bill.bill_state == false ||
                bill.cancel_state == true))
              Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/img/package.jpg',
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 2,
                      ),
                      const Text("Không có đơn hàng nào"),
                    ],
                  ),
                ),
              )
            else
            for(int i=0;i<n;i++)
            if(bills[i].bill_state==true && bills[i].confirm_state==false&&bills[i].cancel_state==false)  
              GestureDetector(
              onTap: () {
                // Xử lý sự kiện khi container được nhấn
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail_bill(bill: bills[i],)));
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height /3+20,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Item_Cancel(bill: bills[i]),
              ),
            )
                  
          ],
        ),
      );
    },
    )
    );
  }
}