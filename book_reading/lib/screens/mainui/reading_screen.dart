import 'package:flutter/material.dart';
import '../../widgets/reading_screen_bottom_bar.dart';

class ReadingScreen extends StatefulWidget {
  const ReadingScreen({super.key});

  @override
  _ReadingScreenState createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentPage = 1; // Adjusted to start from 1 for correct UI display

  void _goToPreviousPage() {
    if (currentPage > 1) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        currentPage--;
      });
    }
  }

  void _goToNextPage() {
    if (currentPage < 8) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        currentPage++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios,
                  color: Colors.black, size: 16),
              onPressed: () => Navigator.pop(context),
            ),
            title: const Text(
              "Book Name Will Appear Here",
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            actions: [
              IconButton(
                icon:
                    const Icon(Icons.more_vert, color: Colors.black, size: 16),
                onPressed: () {},
              ),
            ],
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  height: screenHeight * 0.05,
                  width: double.infinity,
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      "Chapter Title",
                      style: TextStyle(
                        fontSize: screenHeight * 0.01,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: 8,
                    onPageChanged: (index) {
                      setState(() {
                        currentPage = index + 1;
                      });
                    },
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.04,
                          vertical: screenHeight * 0.01),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Cultivate Relationships Based on Respect and Understanding:",
                              style: TextStyle(
                                fontSize: screenHeight * 0.017,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.015),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: screenHeight * 0.017,
                                  color: Colors.black,
                                  height: 1.5,
                                ),
                                children: [
                                  const TextSpan(
                                    text:
                                        "Building relationships based on respect and understanding is essential for creating strong and lasting connections. When people feel truly valued and understood, they are more open, willing to cooperate, and engaged in the relationship. Respect means recognizing each person’s unique worth, while understanding encourages us to listen and relate to others' perspectives. By focusing on these values, relationships become supportive spaces where everyone feels appreciated and accepted. ",
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.015),
                            Text(
                              "For example, in a friendship where one person values being on time while the other is often late, frustration could arise. Instead of reacting with criticism, the friend who values punctuality might share their needs calmly and listen to the other’s side. This respectful conversation creates mutual understanding, letting them find a solution that respects both preferences. This approach strengthens the relationship by honoring both people’s values and keeping a respectful ton",
                              style: TextStyle(
                                height: 1.5,
                                fontSize: screenHeight * 0.017,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.015),
                            Text(
                              "To actively build respectful and understanding relationships, make an effort to communicate openly and listen without interrupting or making assumptions. Show appreciation for the other person’s views, even if they are different from your own, and look for common ground. When respect and understanding form the foundation of your interactions",
                              style: TextStyle(
                                height: 1.5,
                                fontSize: screenHeight * 0.017,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, size: screenHeight * 0.025),
                      onPressed: _goToPreviousPage,
                      color:
                          currentPage > 1 ? Colors.black : Colors.grey.shade400,
                    ),
                    Text(
                      "$currentPage of 8",
                      style:
                          TextStyle(fontSize: 12, color: Colors.grey.shade600),
                    ),
                    IconButton(
                      icon:
                          Icon(Icons.arrow_forward, size: screenHeight * 0.025),
                      onPressed: _goToNextPage,
                      color:
                          currentPage < 8 ? Colors.black : Colors.grey.shade400,
                    ),
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: ReadingScreenBottomBar(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
          ),
        );
      },
    );
  }
}
