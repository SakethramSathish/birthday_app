import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'home_page_after_midnight.dart';

class CakePage extends StatefulWidget {
  const CakePage({super.key});

  @override
  _CakePageState createState() => _CakePageState();
}

class _CakePageState extends State<CakePage> {
  late AudioPlayer _audioPlayer;
  bool _candlesLit = true; // Track whether the candles are lit

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _playBirthdayMusic();
  }

  void _playBirthdayMusic() async {
    try {
      await _audioPlayer.play(AssetSource('audio/happy_birthday.mp3'));
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background image for consistency
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/birthday_background.jpg'), // Add your background image
            fit: BoxFit.cover,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            setState(() {
              _candlesLit = !_candlesLit; // Toggle candle state
            });
          },
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white
                    .withOpacity(0.8), // Slight opacity for readability
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Cake Cutting Time!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                  Text(" "),
                  Text(
                    'Tap to blow out the candles',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.pinkAccent,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Image.asset(
                    _candlesLit
                        ? 'assets/images/cake_with_candles.jpg' // Cake with candles
                        : 'assets/images/cake_without_candles.jpg', // Cake without candles
                    height: 300, // Adjust the size to fit well in the screen
                    width: 300,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePageAfterMidnight(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent, // Button color
                      shape: StadiumBorder(),
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                    ),
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
