import 'package:flutter/material.dart';
import 'package:sales_application/model/item_purchase_history.dart';
import '../model/bills.dart';

class PurchaseHistory extends StatefulWidget {
  const PurchaseHistory({super.key});

  @override
  State<PurchaseHistory> createState() => _PurchaseHistoryState();
}

class _PurchaseHistoryState extends State<PurchaseHistory> {
  List<Bills> bills=[];
  void _loadData() {
    Bills.loadData().then((value) {
      setState(() {

        bills= Bills.bills;
        
      });
    });
  }
  @override
  void initState() {
    super.initState();
    
    _loadData();
    
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            for(int i=0;i<n;i++)
              if(bills[i].bill_state==false)
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                width:MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/4+10,
                decoration: BoxDecoration(color: Colors.grey.shade300 ,borderRadius: BorderRadius.circular(10)),
                child: Item_History(bill: bills[i],)
              ),
           
          ],
        ),
      ),
    );
  }
}