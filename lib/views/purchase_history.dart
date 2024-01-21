import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/bills.dart';
import 'package:sales_application/model/item_order_status.dart';
import 'detail_bill.dart';

class PurchaseHistory extends StatefulWidget {
  const PurchaseHistory({super.key});

  @override
  State<PurchaseHistory> createState() => _PurchaseHistoryState();
}

class _PurchaseHistoryState extends State<PurchaseHistory> {
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
        title: Text('Lịch sử mua hàng',textAlign: TextAlign.center,style: TextStyle(color: Colors.purpleAccent.shade400,)),//thay doi
        centerTitle: true,// chỉnh titile ở giữa
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.purpleAccent.shade400,//thay doi
        ),
      ),
      body:StreamBuilder(
      stream: FirebaseFirestore.instance.collection('invoices').snapshots(),
      builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return CircularProgressIndicator();
      }                
      return 
       SingleChildScrollView(
        child: Column(
          children: [
            if (bills.every((bill) => bill.bill_state == true))
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
                      Text("Không có đơn hàng nào"),
                    ],
                  ),
                ),
              )
            else
            for(int i=0;i<n;i++)
              if(bills[i].bill_state==false)
              GestureDetector(
                onTap: () {
                  // Xử lý sự kiện khi container được nhấn
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail_bill(bill: bills[i],)));
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4 + 10,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Item_StateOrder(bill: bills[i]),
                ),
              )
           
          ],
        ),
      );
      }
      )
    );
  }
}