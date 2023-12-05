import 'package:flutter/material.dart';
import 'dart:io';

import 'edit_screen.dart';

class ImageDisplayPage extends StatelessWidget {
  final File imageFile;
  final double topPadding; // Adjust this value to control top padding.
  final double bottomPadding; // Adjust this value to control bottom padding.

  const ImageDisplayPage({
    Key? key,
    required this.imageFile,
    this.topPadding = 20.0, // Default top padding is 20.0.
    this.bottomPadding = 20.0, // Default bottom padding is 20.0.
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width - 10;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Selected Image'),
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              'assets/minimal_chess2.png',
              fit: BoxFit.cover,
            ),
          ),
          // Content Column
          Positioned(
            top: topPadding,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 2.0), // Adjust the padding as needed
              child: Container(
                width: screenWidth, // Set width to screenWidth
                height: screenWidth, // Set height to screenWidth
                decoration: BoxDecoration(
                  shape:
                      BoxShape.rectangle, // You can change the shape as needed
                  border: Border.all(
                    color: Colors.teal,
                    width: 7.0,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(
                      0.0)), // You can adjust the border radius as needed
                  child: Container(
                    color: Colors.black, // Fill with black color
                    child: Center(
                      child: Image.file(
                        imageFile,
                        fit: BoxFit.contain, // Fit image within container
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Positioned Button at the Bottom
          Positioned(
            bottom: bottomPadding,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black54, // Background color
                  foregroundColor: Colors.white, // Text color
                  minimumSize: const Size(170, 50),
                  maximumSize: const Size(200, 50), // Size
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50), // Rounded corners
                  ),
                  elevation: 5, // Shadow
                ),
                onPressed: () {
                  // Navigate to EditPage when button is pressed
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditPage(imageFile: imageFile),
                    ),
                  );
                },
                child: const Row(
                  mainAxisSize: MainAxisSize
                      .min, // Ensures the Row only takes necessary space
                  children: [
                    Icon(Icons.casino), // The icon
                    SizedBox(width: 8), // Space between icon and text
                    Text(
                      'Scan the image',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'MyButton1',
                      ),
                    ), // The text
                  ],
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     // Add your button's onPressed action here
              //   },
              //   child: Text('Your Button Text'),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
