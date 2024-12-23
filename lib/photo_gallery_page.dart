import 'package:flutter/material.dart';

class PhotoGalleryPage extends StatelessWidget {
  final Map<String, List<String>> gallery = {
    '2019': [
      'assets/gallery/2019/image1.jpg',
      'assets/gallery/2019/image2.jpg',
    ],
    '2022': [
      'assets/gallery/2022/image1.jpg',
      'assets/gallery/2022/image2.jpg',
    ],
    '2023': [
      'assets/gallery/2023/image1.jpg',
      'assets/gallery/2023/image2.jpg',
    ],
    '2024': [
      'assets/gallery/2024/image1.jpg',
      'assets/gallery/2024/image2.jpg',
    ],
  };

  PhotoGalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Memories'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: gallery.entries.map((entry) {
            String year = entry.key;
            List<String> images = entry.value;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    year,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: images.map((image) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        image,
                        width: MediaQuery.of(context).size.width / 3 - 16,
                        height: MediaQuery.of(context).size.width / 3 - 16,
                        fit: BoxFit.cover,
                      ),
                    );
                  }).toList(),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
