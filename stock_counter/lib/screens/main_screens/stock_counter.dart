import 'package:flutter/material.dart';
import 'package:stock_counter/screens/main_screens/usages.dart';
import 'package:stock_counter/screens/personal_info.dart';
import 'package:stock_counter/widgets/calculated_card.dart';
import 'package:stock_counter/widgets/data_card.dart';
import 'package:stock_counter/widgets/dropdown_card.dart';
import 'package:stock_counter/widgets/dynamic_button.dart';
import 'package:stock_counter/widgets/input_field.dart';

class StockCounter extends StatefulWidget {
  const StockCounter({super.key});

  @override
  State<StockCounter> createState() => _StockCounterState();
}

class _StockCounterState extends State<StockCounter> {
  var _location = ['India', 'USA', 'UK', 'Canada', 'Australia'];
  var _items = ['Detonators', 'Booster'];
  var _detonators = [
    'Detonator 1',
    'Detonator 2',
    'Detonator 3',
    'Detonator 4',
    'Detonator 5',
    'Detonator 6'
  ];
  var _boosters = [
    'Booster 1',
    'Booster 2',
    'Booster 3',
    'Booster 4',
    'Booster 5',
    'Booster 6',
  ];

  String? _selectedCountry; // State to track the selected value
  String? _selectedItems;
  String? _selectDetonaotors;
  String? _selectedBoosters;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 8),
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
                    InkWell(
                      onTap: () {
                        // Navigate to the next screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PersonalInfo()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Color(0xFFEA4848),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.person, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Dropdown
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Select items"), Icon(Icons.add)],
                    ),
                    DropdownCard(
                      selectedValue: _selectDetonaotors,
                      items: _detonators,
                      onChanged: (value) {
                        setState(() {
                          _selectDetonaotors = value;
                        });
                      },
                      hintText: 'Choose Items',
                      labelText: "Detonators",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    DropdownCard(
                      selectedValue: _selectedBoosters,
                      items: _boosters,
                      onChanged: (value) {
                        setState(() {
                          _selectedBoosters = value;
                        });
                      },
                      hintText: 'Choose Items',
                      labelText: "Boosters",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          "Enter Variables",
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        width: double
                            .infinity, // Ensures the Card takes up all available width
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: DynamicButton(
                                      label: 'Detonators', onPressed: () {}),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                InputField(labelText: "Box per Stack "),
                                const SizedBox(height: 10),
                                InputField(labelText: "Stack of 6 "),
                                const SizedBox(height: 10),
                                InputField(labelText: "Single Box "),
                                const SizedBox(height: 10),
                                InputField(labelText: "Loose Units "),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: DynamicButton(
                          label: "Generate Count",
                          onPressed: () {},
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    DataCard(counredUnits: "4453", text: "Total Stock Count"),
                    Row(
                      children: [
                        // First Card
                        Expanded(
                          child: CalculatedCard(
                              headText: "Weight", calculatedText: "50.0 Kg"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // Second Card
                        Expanded(
                          child: CalculatedCard(
                              headText: " Det Card",
                              calculatedText: "4452 Meters"),
                        ),
                      ],
                    ),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Summary",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Stack 6",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Stack 6",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Stack 6",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: DynamicButton(
                            label: "Save Stock",
                            onPressed: () {
                              // save stock
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Usages(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
