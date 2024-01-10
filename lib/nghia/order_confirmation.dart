import 'package:flutter/material.dart';

class OrderConfirmation extends StatefulWidget {
  const OrderConfirmation({super.key});

  @override
  State<OrderConfirmation> createState() => _OrderConfirmationState();
}

class _OrderConfirmationState extends State<OrderConfirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,//có thể thay đổi
        title: Text('Xác nhận đơn hàng',textAlign: TextAlign.center,style: TextStyle(color: Colors.purpleAccent.shade400,)),//thay doi
        centerTitle: true,// chỉnh titile ở giữa
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.arrow_back),
          color: Colors.purpleAccent.shade400,//thay doi
        ),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            for(int i=0;i<3;i++)
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                width:MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/3,
                decoration: BoxDecoration(color: Colors.grey.shade300 ,borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Ảnh
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          width: MediaQuery.of(context).size.width/5,
                          height: 120,
                          child: Image.asset('assets/img/quanjean.jpg')
                        ),

                        //Thông tin sản phẩm
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Tên sản phẩm
                              Text("Quần Jean nam xanh",style: TextStyle(fontSize: 18),),
                              //Đơn giá
                              Text("299.000 đ",style: TextStyle(fontSize: 15,color: Colors.red),),
                              //Số lượng
                              Text("Số lượng: 1",style: TextStyle(fontSize: 15),),
                            ]
                          ),
                        )
                      ],
                    ),
                    //Thành tiền
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Row(children: [
                        Text("Thành tiền: ",style: TextStyle(fontSize: 18,),),
                        Text("299.000 đ",style: TextStyle(fontSize: 18,color: Colors.red),),
                      ],),
                    ),
                    //Xác nhận hủy
                    Container(
                      margin: EdgeInsets.all(5),
                      
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: (){
                              showDialog(
                                context: context, 
                                builder: (BuildContext context){
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),side: BorderSide(width: 1,color: Colors.black)),                                   
                                    content:Text("Xác nhận đơn thành công",textAlign: TextAlign.center,) ,
                                    actions: [
                                      Center(
                                        child: ElevatedButton(
                                          onPressed:(){ Navigator.of(context).pop();}, 
                                          child: Text("OK",style: TextStyle(color: Colors.purpleAccent.shade400,fontSize: 15),),
                                          
                                          style:ButtonStyle(
                                            backgroundColor: MaterialStatePropertyAll(Colors.pink.shade100), //thay đổi
                                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),)),
                                            
                                          ),
                                        

                                        )
                                      )
                                    ],
                                  );
                                }
                              );
                            },
                            child: Text("Xác nhận đơn",style: TextStyle(color: Colors.purpleAccent.shade400,fontSize: 15),),
                            style:ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Colors.pink.shade100), //thay đổi
                              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),)),

                            ),
                          ) ,
                        ],
                      )
                    )
                  ]
                ),
              ),
            
            
            
          ],
        ),
      ),
    );
  }
}