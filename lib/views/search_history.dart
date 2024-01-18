// import thư viện SharedPreferences để sử dụng lưu trữ dữ liệu cục bộ
import 'package:shared_preferences/shared_preferences.dart';

// Lớp quản lý lịch sử tìm kiếm
class SearchHistory {
  // Khai báo khóa để lưu trữ lịch sử tìm kiếm trong SharedPreferences
  static const String _historyKey = 'searchHistory';

  // Lấy lịch sử tìm kiếm từ SharedPreferences dựa trên userId
  static Future<List<String>> getSearchHistory(String userId) async {
    // Khởi tạo đối tượng SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Trả về danh sách lịch sử tìm kiếm hoặc danh sách rỗng nếu không có
    return prefs.getStringList(_historyKey + userId) ?? [];
  }

  // Lưu trữ lịch sử tìm kiếm vào SharedPreferences dựa trên userId
  static Future<void> saveSearchHistory(String userId, List<String> history) async {
    // Khởi tạo đối tượng SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Lưu danh sách lịch sử tìm kiếm vào SharedPreferences
    await prefs.setStringList(_historyKey + userId, history);
  }

  // Thêm một từ khóa tìm kiếm mới vào lịch sử dựa trên userId
  static Future<void> addToSearchHistory(String userId, String searchTerm) async {
    // Lấy danh sách lịch sử tìm kiếm hiện tại
    List<String> history = await getSearchHistory(userId);
    // Kiểm tra xem từ khóa tìm kiếm đã tồn tại trong lịch sử chưa
    if (!history.contains(searchTerm)) {
      // Thêm từ khóa tìm kiếm mới vào đầu danh sách
      history.insert(0, searchTerm);
      // Giữ cho danh sách lịch sử không quá dài, ví dụ, giữ tối đa 10 mục
      if (history.length > 10) {
        history.removeLast(); // Loại bỏ mục cuối cùng
      }
      // Lưu lịch sử tìm kiếm đã được cập nhật vào SharedPreferences
      await saveSearchHistory(userId, history);
    }
  }
}
