import 'package:flutter/material.dart';
import 'package:tuyen_sinh_app/page/home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBodyContent(),
      bottomNavigationBar: _buildBottomAppBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.red[50],
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.black,
          size: 30,
        ),
        onPressed: () {
          // Hành động khi nhấn nút menu
        },
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/logohust.png', // Đường dẫn logo
            height: 30, // Chiều cao logo
          ),
          SizedBox(width: 8),
          Text(
            'Tuyển sinh',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        Stack(
          children: [
            IconButton(
              icon: Icon(Icons.notifications_none, color: Colors.black),
              onPressed: () {
                // Hành động khi nhấn biểu tượng thông báo
              },
            ),
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                constraints: const BoxConstraints(
                  minWidth: 16,
                  minHeight: 16,
                ),
                child: Text(
                  '13', // Số lượng thông báo
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ],
      centerTitle: true,
      elevation: 0, // Xóa bóng của AppBar
    );
  }

  BottomAppBar _buildBottomAppBar() {
    return BottomAppBar(
      color: Colors.red[50],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBottomIcon(Icons.home, "Home", 0),
          _buildBottomIcon(Icons.search, "Search", 1),
          _buildBottomIcon(Icons.question_mark, "Q & A", 2),
          _buildBottomIcon(Icons.support, "Support", 3),
          _buildBottomIcon(Icons.person, "My Profile", 4),
        ],
      ),
    );
  }


  Widget _buildBodyContent() {
    // Dựa vào _selectedIndex để hiển thị nội dung tương ứng
    switch (_selectedIndex) {
      case 0:
        return HomePage();
      case 1:
        return Center(child: Text("Search Page", style: TextStyle(fontSize: 24)));
      case 2:
        return Center(child: Text("Q&A Page", style: TextStyle(fontSize: 24)));
      case 3:
        return Center(child: Text("Support Page", style: TextStyle(fontSize: 24)));
      case 4:
        return Center(child: Text("My profite Page", style: TextStyle(fontSize: 24)));
      default:
        return Center(child: Text("Page not found", style: TextStyle(fontSize: 24)));
    }
  }


  Widget _buildBottomIcon(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
            color: _selectedIndex == index ? Colors.blue : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              color: _selectedIndex == index ? Colors.blue : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}