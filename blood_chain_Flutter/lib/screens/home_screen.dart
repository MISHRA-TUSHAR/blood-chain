import 'package:blood/widgets/sidebar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> inventoryData = [
    {"Blood Type": "O-", "Availability": "Yes", "Location": "Hospital A"},
    {"Blood Type": "O+", "Availability": "Yes", "Location": "Hospital B"},
    {"Blood Type": "A+", "Availability": "Yes", "Location": "Hospital C"},
    {"Blood Type": "A-", "Availability": "No", "Location": "Hospital D"},
    {"Blood Type": "B+", "Availability": "Yes", "Location": "Hospital E"},
    {"Blood Type": "B-", "Availability": "Yes", "Location": "Hospital F"},
    {"Blood Type": "AB+", "Availability": "Yes", "Location": "Hospital G"},
    {"Blood Type": "AB-", "Availability": "Yes", "Location": "Hospital H"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      drawer: const SideBar(),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Inventory',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 3,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 20,
                    columns: const [
                      DataColumn(
                        label: Text(
                          'Blood Type',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Availability',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Location',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                    rows: inventoryData.map((data) {
                      return DataRow(cells: [
                        DataCell(Text(data['Blood Type'] ?? '')),
                        DataCell(
                          Text(
                            data['Availability'] ?? '',
                            style: TextStyle(
                              color: data['Availability'] == 'Yes'
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                        ),
                        DataCell(Text(data['Location'] ?? '')),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LocateHPScreen()),
                  );
                },
                child: const Text('Locate Nearest Hospital'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LocateHPScreen extends StatelessWidget {
  const LocateHPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Locate Nearest Hospital'),
      ),
      body: const Center(
        child: Text('This is the Locate Nearest Hospital Screen'),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}
