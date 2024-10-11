import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://example.com/image.jpg',
              width: 50,
              height: 50,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Kemampuan Merangkum Tulisan',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('BAHASA SUNDA\nOleh Al-Baiqi Samaan'),
              ],
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text('A', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
