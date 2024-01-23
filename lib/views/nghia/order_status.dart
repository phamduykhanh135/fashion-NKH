import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sales_application/model/nghia/bills.dart';
import 'package:sales_application/presenters/nghia/item_order_status.dart';
import 'detail_bill.dart';

class OrderStatus extends StatefulWidget {
  const OrderStatus({Key? key}) : super(key: key);

  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

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
    _tabController = TabController(length: 2, vsync: this);

    FirebaseFirestore.instance.collection('invoices').snapshots().listen((event) {
      _loadData();
    });
    
    _loadData();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int n=bills.length;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        title: Text(
          'Trạng thái đơn hàng',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.purpleAccent.shade400),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.purpleAccent.shade400,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.pink,
              labelColor: Colors.pink,
              unselectedLabelColor: Colors.black,
              tabs: const [
                Tab(text: 'Chờ xác nhận'),
                Tab(text: 'Đang giao'),
              ],
            ),
          ),
        ),
      ),
      body:StreamBuilder(
      stream: FirebaseFirestore.instance.collection('invoices').snapshots(),
      builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return const CircularProgressIndicator();
      }                
      return 
       TabBarView(
        controller: _tabController,
        children: [
          // Nội dung của Tab Chờ xác nhận
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
                    height: MediaQuery.of(context).size.height / 4 + 30,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Item_StateOrder(bill: bills[i]),
                  ),
                )
                      
              ],
            ),
          ),

          // Nội dung của Đang giao
          SingleChildScrollView(
            child: Column(
              children: [
                if (bills.every((bill) =>
                    bill.confirm_state == false ||
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
                if(bills[i].bill_state==true && bills[i].confirm_state==true&&bills[i].cancel_state==false)  
                 GestureDetector(
                  onTap: () {
                    // Xử lý sự kiện khi container được nhấn
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail_bill(bill: bills[i],)));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 4 + 30,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Item_StateOrder(bill: bills[i]),
                  ),
                )
              
              ],
            ),
          ),
        ],
      );
      }
      )
    );
  }
}