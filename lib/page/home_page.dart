import 'dart:async';
import 'package:flutter/material.dart';

class NewsArticle {
  final String title;
  final String description;
  final String imageUrl;

  NewsArticle({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

// Dữ liệu giả cho các bài viết tin tức
final List<NewsArticle> newsArticles = [
  NewsArticle(
    title: 'News 1',
    description: 'This is a short description for news 1.',
    imageUrl: 'assets/picture_1.jpg', // Ảnh từ thư mục assets
  ),
  NewsArticle(
    title: 'News 2',
    description: 'This is a short description for news 2.',
    imageUrl: 'assets/picture_2.jpg', // Ảnh từ URL mạng
  ),
  NewsArticle(
    title: 'News 3',
    description: 'This is a short description for news 3.',
    imageUrl: 'assets/picture_3.jpg', // Ảnh từ URL mạng
  ),
  NewsArticle(
    title: 'News 4',
    description: 'This is a short description for news 3.',
    imageUrl: 'assets/picture_4.jpg', // Ảnh từ URL mạng
  ),
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);

    // Tự động cuộn trang mỗi 5 giây
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < newsArticles.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            // PageView chiếm toàn bộ chiều ngang
            SizedBox(
              height: 250,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: newsArticles.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final article = newsArticles[index];
                      return GestureDetector(
                        onTap: () {
                          // Thực hiện hành động khi nhấn vào, ví dụ hiển thị thông báo
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(article.title),
                              content: Text(article.description),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('Close'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // Hiển thị ảnh của bài báo, tự động chọn asset hoặc network
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                                  child: article.imageUrl.startsWith('http')
                                      ? Image.network(
                                    article.imageUrl,
                                    height: 150,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  )
                                      : Image.asset(
                                    article.imageUrl,
                                    height: 150,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        article.title,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        article.description,
                                        style: TextStyle(fontSize: 14),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  // Vòng tròn biểu thị trang hiện tại
                  Positioned(
                    bottom: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(newsArticles.length, (index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          width: _currentPage == index ? 12 : 8,
                          height: _currentPage == index ? 12 : 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index ? Colors.blue : Colors.grey,
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            // Nội dung bổ sung dưới PageView
            Text(
              'Other content goes here...',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
