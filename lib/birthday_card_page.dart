import 'package:flutter/material.dart';

class BirthdayCardPage extends StatelessWidget {
  const BirthdayCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Background image for the page
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/birthday_background3.jpg'), // Use your background image
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Main content
            Center(
              child: SingleChildScrollView(
                padding:
                    EdgeInsets.all(10), // Add padding for better aesthetics
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Birthday card image
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/images/birthday_card.jpg',
                          width: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Birthday message
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white
                            .withOpacity(0.8), // Slight opacity for readability
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Text(
                        'Happy Birthday Appa!!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                          shadows: [
                            Shadow(
                              blurRadius: 5,
                              color: Colors.black.withOpacity(0.5),
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Back button
            Positioned(
              top: 20, // Position slightly below the top
              left: 10, // Position slightly inward from the left edge
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black, // White color for visibility
                  size: 30, // Larger size for better touch target
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                padding: EdgeInsets.all(10), // Add padding for aesthetics
                splashRadius: 25, // Ripple effect radius
              ),
            ),
          ],
        ),
      ),
    );
  }
}
