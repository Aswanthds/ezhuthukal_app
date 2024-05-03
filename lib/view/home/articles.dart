import 'package:ezhuthukal_app/model/article.dart';
import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard({required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(16.0), // Content padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // _ArticleImage(
              //     imageUrl: article.imageUrl), // Image with custom paint
              SizedBox(height: 8.0),
              Text(
                article.title,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4.0),
              Text(
                article.user.toString(),
                style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
              ),
              SizedBox(height: 8.0),
              Text(
                article.text, // Show excerpt
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
      

    );
  }
}

class _ArticleCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.addRRect(
        RRect.fromLTRBR(20, 20, 20, 20, Radius.circular(30)));
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _ArticleImage extends StatelessWidget {
  final String imageUrl;

  const _ArticleImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0), // Image corner rounding
          child: Image.network(
            imageUrl,
            width: double.infinity,
            height: 150.0,
            fit: BoxFit.cover, // Cover the entire area
          ),
        ),
        CustomPaint(
          // Overlay with subtle gradient
          painter: _ImageOverlayPainter(),
          child: Container(width: double.infinity, height: 150.0),
        ),
      ],
    );
  }
}

class _ImageOverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(0.2) // Transparent black
      ..style = PaintingStyle.fill;
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
