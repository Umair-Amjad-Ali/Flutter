// home_screen.dart
import 'package:flutter/material.dart';
import 'package:node_pay/Screens/custom_card.dart';
import 'package:node_pay/Screens/mobile_resourses_card.dart';
import 'package:node_pay/wigets/earnig_statistics.dart';

import 'package:node_pay/wigets/earning_devices.dart';
import 'package:node_pay/wigets/missions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _onItemTapped(int index) {
    switch (index) {
      case 1:
        Navigator.pushNamed(context, '/referral');
        break;
      case 2:
        Navigator.pushNamed(context, '/mission_reward');
        break;
      case 3:
        Navigator.pushNamed(context, '/transaction_history');
        break;
      default:
        // For Dashboard (index 0), stay on the HomeScreen
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NodePay',
          style:
              TextStyle(color: Color.fromARGB(255, 17, 16, 16), fontSize: 24.0),
          textAlign: TextAlign.left,
        ),
        backgroundColor: const Color.fromARGB(255, 245, 246, 247),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset("assets/pngs/logo.png"),
        ),
        leadingWidth: 60,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, bottom: 8),
            child: Image.asset("assets/pngs/right-logo.png"),
          ),
        ],
      ),

      // Main Content with Scrolling
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          color: const Color.fromARGB(255, 219, 224, 233),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello umair_Amjad"),
                  SizedBox(height: 10),
                  Text(
                    "Dashboard",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // First Container
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:
                            const Icon(Icons.person_add, color: Colors.white),
                      ),
                      const Text("Total Referrals : 3"),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 21, 8, 73),
                              Color.fromARGB(255, 35, 9, 136),
                            ],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: const Row(children: [
                          Text(
                            "Share",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.share, size: 20, color: Colors.white),
                        ]),
                      )
                    ],
                  )
                ]),
              ),
              const SizedBox(height: 20),

              // Second Container
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Current Season : Season # 1"),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomCard(
                          backgroundGradient: LinearGradient(colors: [
                            Color.fromARGB(255, 21, 8, 73),
                            Color.fromARGB(255, 35, 9, 136),
                          ]),
                          iconContainerColor: Colors.white,
                          mainTextColor: Colors.white,
                          icon: Icons.star,
                          iconColor: Colors.black,
                          mainText: "Total Nodepay Points",
                          subText: "37,987",
                        ),
                        SizedBox(width: 10),
                        CustomCard(
                          backgroundColor: Color.fromARGB(255, 153, 166, 188),
                          iconContainerColor: Colors.black,
                          mainTextColor: Colors.black,
                          icon: Icons.calendar_month_outlined,
                          iconColor: Colors.white,
                          mainText: "Today's Earning",
                          subText: "2010",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Third Container (Mobile Resources Card)
              const MobileResourcesCard(),
              // Fourth Container (Active Eearning Devices)
              const SizedBox(height: 20),
              const EarningDevices(),

              // Fourth Container (Missions)
              const SizedBox(height: 20),
              const Missions(),
              // Fourth Container (Earnig Statistics)
              const SizedBox(height: 20),
              const EarnigStatistics(),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(Icons.dashboard),
                SizedBox(height: 4), // Adds space between icon and label
              ],
            ),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(Icons.rocket_launch),
                SizedBox(height: 4),
              ],
            ),
            label: 'Referral Program',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(Icons.task_alt),
                SizedBox(height: 4),
              ],
            ),
            label: 'Mission & Reward',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(Icons.timelapse),
                SizedBox(height: 4),
              ],
            ),
            label: 'Transaction History',
          ),
        ],
        selectedItemColor: const Color.fromARGB(255, 35, 23, 85),
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
