import 'package:ezhuthukal_app/model/article.dart';
import 'package:ezhuthukal_app/model/functions/articles.dart';
import 'package:ezhuthukal_app/view/home/articles.dart';
import 'package:ezhuthukal_app/view/ui_utils/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ezhuthukal"),
        toolbarHeight: 70,
        elevation: 10,
        backgroundColor: AppTheme.kPrimary,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<List<Article>>(
          future: fetchArticles(), // Call a function to fetch articles
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Display a loading indicator while waiting for data
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              // Display an error message if data fetching fails
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              // Display the list of articles if data is available
              return ListView.builder(
                itemBuilder: (context, index) =>
                    ArticleCard(article: snapshot.data![index]),
                itemCount: snapshot.data?.length,
              );
            } else {
              // Display a message when no data is available
              return Center(
                child: Text("No articles available"),
              );
            }
          },
        ),
      ),
    );
  }

  // Function to fetch articles (replace this with your actual data fetching logic)
  Future<List<Article>> fetchArticles() async {
    // Simulating an asynchronous data fetching process (e.g., fetching from a web API)
    await Future.delayed(Duration(seconds: 2));
    return generateDummyArticles();
  }
}

class ProfilePageScreen extends StatelessWidget {
  const ProfilePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class SearchPageScreen extends StatelessWidget {
  const SearchPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class BackgroundPainter extends CustomPainter {
  final Color startColor;
  final Color endColor;

  BackgroundPainter({required this.startColor, required this.endColor});

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final Gradient gradient = LinearGradient(
      colors: [startColor, endColor],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    final Paint paint = Paint()..shader = gradient.createShader(rect);
    final Path path = Path()
      ..moveTo(0, size.height * 0.3)
      ..quadraticBezierTo(size.width * 0.25, size.height * 0.35,
          size.width * 0.5, size.height * 0.3)
      ..quadraticBezierTo(
          size.width * 0.75, size.height * 0.25, size.width, size.height * 0.3)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CustomClipperDump extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path()
      ..moveTo(0, size.height * 0.3)
      ..quadraticBezierTo(size.width * 0.25, size.height * 0.35,
          size.width * 0.5, size.height * 0.3)
      ..quadraticBezierTo(
          size.width * 0.75, size.height * 0.25, size.width, size.height * 0.3)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class MyBottomNavBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width - 20, 0)
      ..lineTo(size.width, 20)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
