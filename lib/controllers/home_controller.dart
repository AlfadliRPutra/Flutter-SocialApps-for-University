import 'package:get/get.dart';
import 'package:src/models/home_content.dart';
import 'package:src/screens/chat_screen.dart';
import 'package:src/screens/profile_screen.dart';
import 'package:src/screens/search_screen.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;
  var pages =
      [HomeContent(), const SearchScreen(), ChatScreen(), ProfileScreen()].obs;

  void onTabTapped(int index) {
    currentIndex.value = index;
  }
}
