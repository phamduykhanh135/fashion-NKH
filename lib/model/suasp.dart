// class Sua{
//   static String l_sp="";
//   static String kichco_sp="";
//   static int price_sp=0;
//   static int quatitySizeS=0;
//   static int quatitySizeM=0;
//   static int quatitySizeL=0;
//   static int quatitySizeXL=0;
//   static int discount_sp=0;
//
// }
class SuaMap {
  // Map static
  static Map<dynamic, dynamic> myMap = {
    'id': 0,
    'image':"" ,
    'name':"",
    'Descriptions':"",
    'category':"",
    'price':0,
    'sizeS':0,
    'sizeM':0,
    'sizeL':0,
    'sizeXL':0,
    'discount':0
  };
  static int getValueByKey(String key) {
    return myMap[key] ?? -1; // Trả về -1 nếu key không tồn tại
  }
}