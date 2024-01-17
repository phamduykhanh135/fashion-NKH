import 'package:flutter/material.dart';
import 'package:sales_application/model/item_cancel_order.dart';
import '../model/bills.dart';

class CancelOrder extends StatefulWidget {
  const CancelOrder({super.key});

  @override
  State<CancelOrder> createState() => _CancelOrderState();
}

class _CancelOrderState extends State<CancelOrder> {

  List<Bills> bills=[];
  bool isDataLoaded = false;
  int n=0;
  void _loadData() {
    Bills.loadData().then((value) {
      setState(() {

        bills= Bills.bills;
        n=bills.length;
        isDataLoaded=true;
        
        
      });
    });
  }
  @override
  void initState() {
    super.initState();
    if(isDataLoaded==false){
      _loadData();
    }
    
    
  }
  
  @override
  Widget build(BuildContext context) {
     
    
    print(n);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,//có thể thay đổi
        title: Text('Hủy đơn hàng',textAlign: TextAlign.center,style: TextStyle(color: Colors.purpleAccent.shade400,)),//thay doi
        centerTitle: true,// chỉnh titile ở giữa
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
             
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.purpleAccent.shade400,//thay doi
        ),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            if(bills.every((bill) => bill.confirm_state == true)||bills.every((bill) => bill.bill_state == false)||bills.every((bill) => bill.cancel_state == true))
            Container(
              child: Center(
                child:Column(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/img/package.jpg',width: MediaQuery.of(context).size.width/2,height:  MediaQuery.of(context).size.height/2,),                  
                    Text("Không có sản phẩm nào")
                  ],
                )
              ),
            )
            else
            for(int i=0;i<n;i++)
              if(bills[i].bill_state==true && bills[i].confirm_state==false&&bills[i].cancel_state==false)
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                width:MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/3,
                decoration: BoxDecoration(color: Colors.grey.shade300 ,borderRadius: BorderRadius.circular(10)),
                child: Item_Cancel(bill: bills[i],)
              ),
          ],
        ),
      ),
    );
  }
}