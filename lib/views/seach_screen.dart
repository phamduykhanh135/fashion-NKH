import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sales_application/presenters/item_poduct_home.dart';
import './search_history.dart';
import '../presenters/item_product_search.dart';
import '../model/product.dart'; // Import model Product

class Search_Screen extends StatefulWidget {
  const Search_Screen({
    super.key,
  });

  @override
  State<Search_Screen> createState() => _Search_ScreenState();
}

class _Search_ScreenState extends State<Search_Screen> {
  late Future<List<Product>> products;
  TextEditingController searchController = TextEditingController();
  bool showResultText = false;
  int count = 0;
  bool isDescending = true;
  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    // Lấy danh sách sản phẩm từ Firebase khi màn hình được tạo
    products = FirebaseModel().getProductsData();
  }

  // Hàm tìm kiếm và lưu lịch sử tìm kiếm
  void searchWithHistory(String searchTerm) {
    setState(() {
      // Gán giá trị từ khóa tìm kiếm vào ô nhập liệu
      searchController.text = searchTerm;

      // Bắt đầu quá trình tìm kiếm sản phẩm dựa trên từ khóa tìm kiếm
      products = FirebaseModel().searchProducts(searchTerm);

      // Lấy userId nếu đã đăng nhập và lưu từ khóa tìm kiếm vào lịch sử
      String? userId = currentUser?.uid;
      if (userId != null) {
        SearchHistory.addToSearchHistory(userId, searchTerm);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        title: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 40,
          child: TextField(
            controller: searchController,
            onChanged: (value) {
              // Không làm gì ở đây để tránh kích hoạt buildList mỗi khi thay đổi văn bản
            },
            decoration: InputDecoration(
              hintText: 'Tìm kiếm...',
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20.0),
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.search,color: Colors.grey,),
                onPressed: () {
                  String searchTerm = searchController.text;
                  if (searchTerm.isNotEmpty) {
                    // Sử dụng UID của người dùng hiện tại khi gọi hàm searchWithHistory
                    searchWithHistory(searchTerm);
                    setState(() {
                      products = FirebaseModel().searchProducts(searchTerm);
                      showResultText = true;
                    });
                  } else {
                    print("Trường tìm kiếm trống.");
                  }
                },
              ),
            ),
            style: const TextStyle(color: Colors.grey),
            textAlignVertical: TextAlignVertical.center,
          ),
        ),
         leading:IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back,color: Colors.white,)) ,
      ),
      
      body: showResultText && searchController.text.isNotEmpty
      // Đã nhấn icon hoặc trường bằng rỗng
          ? buildList()
          : buildSearchHistory(),
    );
  }

  // Widget hiển thị danh sách sản phẩm
  Widget buildList() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (showResultText &&
                  searchController.text.isNotEmpty &&
                  count != 0)
                Row(
                  children: [
                    const Text("Có tất cả ",
                        style: TextStyle(color: Colors.grey)),
                    Text("$count", style: const TextStyle(color: Colors.grey)),
                    const Text(" loại ", style: TextStyle(color: Colors.grey)),
                    Text(
                      searchController.text,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.pink.shade100),
                    ),
                    const Text(" được tìm thấy",
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
              Row(
                children: [
                  const Text("Giá:",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                  IconButton(
                      onPressed: () {
                        // Sắp xếp giảm dần
                        setState(() {
                          isDescending = true;
                          products = sortProducts(products, isDescending);
                        });
                      },
                      icon: const Icon(Icons.keyboard_arrow_up,
                          color: Colors.grey)),
                  IconButton(
                      onPressed: () {
                        // Sắp xếp tăng dần
                        setState(() {
                          isDescending = false;
                          products = sortProducts(products, isDescending);
                        });
                      },
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.grey)),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder<List<Product>>(
            future: products,
            builder: (context, productSnapshot) {
              if (productSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (productSnapshot.hasError) {
                return Center(child: Text("Error: ${productSnapshot.error}"));
              } else if (!productSnapshot.hasData ||
                  productSnapshot.data!.isEmpty) {
                count = productSnapshot.data!.length;
                print("hshshs$count");
                return const Center(
                    child: Column(
                  children: [
                    Text("Không có sản phẩm nào cả! "),
                    Text("Muốn tìm sản phẩm thì bạn cần phải có "),
                    Text("KIẾN THỨC"),
                    Text("KINH NGHIỆM"),
                    Text(" TRẢI NGHIỆM !!!!!!"),
                  ],
                ));
              } else {
                count = productSnapshot.data!.length;
                print("cccccc$count");
                return ListView.builder(
                  itemCount: (productSnapshot.data!.length / 2).ceil(),
                  itemBuilder: (_, index) {
                    final int firstProductIndex = index * 2;
                    final int secondProductIndex = firstProductIndex + 1;
                    return Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Item_Product_Home(
                                product:
                                    productSnapshot.data![firstProductIndex]),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: secondProductIndex <
                                    productSnapshot.data!.length
                                ? Item_Product_Home(
                                    product: productSnapshot
                                        .data![secondProductIndex])
                                : const SizedBox(),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }

  // Widget hiển thị lịch sử tìm kiếm
  Widget buildSearchHistory() {
    return FutureBuilder<List<String>>(
      future: SearchHistory.getSearchHistory(currentUser?.uid ?? ""),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text("Lỗi: ${snapshot.error}");
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const SizedBox.shrink();
        } else {
          return Column(
            children: [
              const ListTile(
                title: Text('Lịch sử tìm kiếm'),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: Key(snapshot.data![index]),
                      direction: DismissDirection.startToEnd,
                      background: Container(
                        color: Colors.red,
                        padding: const EdgeInsets.only(left: 16),
                        alignment: Alignment.centerLeft,
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(snapshot.data![index]),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () async {
                                List<String> updatedHistory =
                                    List.from(snapshot.data!);
                                setState(() {});
                                updatedHistory.removeAt(index);
                                String? userId = currentUser?.uid;
                                await SearchHistory.saveSearchHistory(
                                    userId ?? "", updatedHistory);
                              },
                            ),
                          ],
                        ),
                        onTap: () async {
                          // Lấy từ khóa tìm kiếm được chọn
                          String selectedHistoryItem = snapshot.data![index];

                          // Gán giá trị từ khóa tìm kiếm vào ô nhập liệu
                          searchController.text = selectedHistoryItem;

                          // Kích hoạt tìm kiếm với từ khóa tìm kiếm được chọn
                          searchWithHistory(selectedHistoryItem);
                          showResultText = true;
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }

  // Hàm sắp xếp sản phẩm theo giá
  Future<List<Product>> sortProducts(
      Future<List<Product>> productList, bool descending) async {
    List<Product> sortedList = await productList;
    sortedList.sort((a, b) {
      // Sử dụng giá bán có giảm giá nếu có, nếu không thì sử dụng giá mặc định
      double priceA = a.discount != "0"
          ? double.parse(a.price) -
              (double.parse(a.price) * double.parse(a.discount) / 100)
          : double.parse(a.price);
      double priceB = b.discount != "0"
          ? double.parse(b.price) -
              (double.parse(b.price) * double.parse(b.discount) / 100)
          : double.parse(b.price);

      if (descending) {
        return priceB.compareTo(priceA);
      } else {
        return priceA.compareTo(priceB);
      }
    });

    return sortedList;
  }
}