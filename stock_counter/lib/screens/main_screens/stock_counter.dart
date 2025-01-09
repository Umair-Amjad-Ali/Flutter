import 'package:flutter/material.dart';
import 'package:stock_counter/widgets/dropdown_card.dart';

class StockCounter extends StatefulWidget {
  const StockCounter({super.key});

  @override
  State<StockCounter> createState() => _StockCounterState();
}

class _StockCounterState extends State<StockCounter> {
  var _location = ['India', 'USA', 'UK', 'Canada', 'Australia'];
  var _items = ['Detonators', 'Booster'];

  String? _selectedCountry; // State to track the selected value
  String? _selectedItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Color(0xFFEA4848),
                      shape: BoxShape.rectangle,
                    ),
                    child: const Icon(Icons.menu, color: Colors.white),
                  ),
                  // Middle Text
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 35, vertical: 8),
                    decoration: BoxDecoration(
                      color: Color(0xFFEA4848),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "Stock Counter",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  //Profile Icon
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xFFEA4848),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.person, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Dropdown
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  DropdownCard(
                    selectedValue: _selectedCountry,
                    items: _location,
                    onChanged: (value) {
                      setState(() {
                        _selectedCountry = value;
                      });
                    },
                    hintText: 'Choose Country',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DropdownCard(
                    selectedValue: _selectedItems,
                    items: _items,
                    onChanged: (value) {
                      setState(() {
                        _selectedItems = value;
                      });
                    },
                    hintText: 'Choose Items',
                  ),
                  Row(
                    children: [],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
