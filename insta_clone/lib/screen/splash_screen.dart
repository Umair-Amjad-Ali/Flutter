import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 52, 46, 46), // Set background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  "assets/images/insta.png", // Replace with your image asset path
                  width: 100, // Adjust the width as needed
                  height: 100, // Adjust the height as needed
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 80.0), // Adjust padding as needed
              child: Text(
                "From",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   // void initState() {
//   //   super.initState();
//   //   Timer(const Duration(seconds: 300), () {
//   //     Navigator.pushReplacement(
//   //       context,
//   //       MaterialPageRoute(builder: (context) => const HomeScreen()),
//   //     );
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 40, 39, 39),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: Container(
//               child: Image.asset(
//                 "assets/images/insta.png",
//                 width: 70,
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Text(
//               'skfhoifjweo',
//               style: TextStyle(color: Colors.white),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
