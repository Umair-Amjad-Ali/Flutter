import 'package:flutter/material.dart';
import 'dart:async';

class MobileResourcesCard extends StatefulWidget {
  const MobileResourcesCard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MobileResourcesCardState createState() => _MobileResourcesCardState();
}

class _MobileResourcesCardState extends State<MobileResourcesCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  int filledBlocks = 0;
  Duration remainingTime = const Duration(hours: 1); // 1 hour countdown
  late Timer countdownTimer;

  @override
  void initState() {
    super.initState();

    // Animation for bubble
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 20).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Start countdown timer
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.inSeconds > 0) {
        setState(() {
          remainingTime = remainingTime - const Duration(seconds: 1);
        });
      } else {
        timer.cancel();
        if (filledBlocks < 8) {
          setState(() {
            filledBlocks++;
            remainingTime =
                const Duration(hours: 1); // Reset timer for next block
          });
          countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
            setState(() {
              remainingTime = remainingTime - const Duration(seconds: 1);
            });
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    countdownTimer.cancel();
    super.dispose();
  }

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 21, 8, 73),
            Color.fromARGB(255, 35, 9, 136),
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Utilize Your \n Mobile \n Resources',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, _animation.value),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const RadialGradient(
                          colors: [
                            Color.fromARGB(255, 1, 7, 18),
                            Color.fromARGB(255, 169, 167, 191),
                          ],
                          center: Alignment.center,
                          radius: 0.6,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 194, 215, 232)
                                .withOpacity(0.5),
                            spreadRadius: 25,
                            blurRadius: 30,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/pngs/logo-white.png",
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Text Section
          const Text(
            'Track Resource Usage',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),

          const SizedBox(height: 20),

          // Blocks Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              8,
              (index) => Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: index < filledBlocks
                      ? const Color.fromARGB(255, 40, 174, 44)
                      : const Color.fromARGB(255, 131, 122, 122),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Countdown Timer and Buffering Indicator
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Next update in: ${formatDuration(remainingTime)}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 4,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 25, bottom: 25, right: 20, left: 10),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 36, 19, 106),
                  Color.fromARGB(255, 28, 27, 31),
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/pngs/cloud-computing.png",
                      height: 40,
                      width: 50,
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    const Column(
                      children: [
                        Text(
                          "Completed:",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          "1/8 Blocks",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  // padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 49, 48, 48)
                            .withOpacity(1),
                        blurRadius: 2,
                        spreadRadius: 10,
                        offset: const Offset(0, 0),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20), // Optional: Rounded corners
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        const Text(
                          'Claim 75',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          "assets/pngs/logo.png",
                          height: 30,
                          width: 30,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
