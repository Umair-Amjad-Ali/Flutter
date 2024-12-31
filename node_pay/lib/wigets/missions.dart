import 'package:flutter/material.dart';

class Missions extends StatelessWidget {
  const Missions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Mission',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  // Define your onPressed action here
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black, // Text color
                  side: const BorderSide(
                      color: Color.fromARGB(255, 117, 108, 108),
                      width: 1), // Border color and width
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8), // Optional padding
                ),
                child: const Text(
                  "View All Missions",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 12, bottom: 30, left: 12, right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 212, 203, 203),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/pngs/mission.png",
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(width: 15),
                    const Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Align to start
                      children: [
                        Text(
                          "Daily Treasure Claim",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text("Claim Your Daily Reward"),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20), // Add space before the button
                TextButton(
                  onPressed: () {
                    // Add your button action here
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 20),
                    backgroundColor: const Color.fromARGB(255, 166, 160, 160),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    shadowColor: Colors.grey,
                    elevation: 10, // Add shadow effect
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.lock,
                        size: 17,
                        color: Color.fromARGB(255, 76, 75, 75),
                      ),
                      const SizedBox(width: 7),
                      const Text(
                        "100",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 76, 75, 75),
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Image.asset(
                        "assets/pngs/logo.png",
                        height: 20,
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
