import 'package:flutter/material.dart';

class EarningDevices extends StatelessWidget {
  const EarningDevices({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Active Eearning Devices",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Image.asset(
                  "assets/pngs/computer-screen.png",
                  width: 20,
                  height: 29,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Expanded(
                  child: FittedBox(
                    child: Text(
                      "Network earning is only available on desktop",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 208, 204, 204),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Row(children: [
              Text("Unknown Devices"),
              Spacer(),
              Row(
                children: [
                  Icon(
                    Icons.wifi,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "97%",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}
