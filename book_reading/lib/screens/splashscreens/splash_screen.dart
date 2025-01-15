import 'package:book_reading/screens/users/signup_socials.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      "image": "assets/headphone.png",
      "heading": "Master 10-hour books in just 15 minutes!",
      "subtext":
          "Grow smarter, faster! Get top books key ideas to boost your growth!"
    },
    {
      "image": "assets/strength-1.png",
      "heading": "Listen to books anytime, anywhere!",
      "subtext":
          "Listen to your favorite books anytime, anywhere—ideal for busy lifestyles!."
    },
    {
      "image": "assets/strength-2.png",
      "heading": "Watch summaries like movies!",
      "subtext":
          "Books now come alive with whiteboard animations for faster, engaging learning!"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image Section (Separate Container)
          Expanded(
            flex: 3,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Image.asset(
                    _pages[index]["image"]!,
                    fit: BoxFit.contain,
                  ),
                );
              },
            ),
          ),
          // Text Section (Heading and Subtext)
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _pages[_currentPage]["heading"]!,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _pages[_currentPage]["subtext"]!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Pagination Indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _pages.length,
              (index) => Row(
                children: [
                  // Circle Indicator with Number
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index
                          ? Colors.black
                          : Colors.grey[300],
                      border: Border.all(color: Colors.black, width: 1.5),
                    ),
                    child: Center(
                      child: Text(
                        "${index + 1}",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: _currentPage == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  // Line between circles (except the last one)
                  if (index < _pages.length - 1)
                    Container(
                      width: 30,
                      height: 2,
                      color: Colors.black,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Button to Continue
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 30, left: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentPage < _pages.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupSocials()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      _currentPage < _pages.length - 1
                          ? "Continue"
                          : "Get Started",
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
