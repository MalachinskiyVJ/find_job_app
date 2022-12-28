import 'package:find_job/ui/screens/add_company_screen.dart';
import 'package:find_job/ui/screens/add_job_screen.dart';
import 'package:find_job/ui/screens/companies_screen.dart';
import 'package:find_job/ui/screens/jobs_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);
  static const id = 'tabs_screen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

var _selectedPageIndex = 0;

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pageDetails = [
    {
      'pageName': CompaniesScreen(),
      'title': 'Companies',
      'color': Colors.lightBlueAccent,
      'buttonText': 'Company',
      'addScreen': const AddCompanyScreen()
    },
    {
      'pageName': JobsScreen(),
      'title': 'Jobs',
      'color': Colors.orangeAccent,
      'buttonText': 'Job',
      'addScreen': const AddJobScreen()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDetails[_selectedPageIndex]['title']),
        centerTitle: true,
        backgroundColor: _pageDetails[_selectedPageIndex]['color'],
      ),
      body: _pageDetails[_selectedPageIndex]['pageName'],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          onTap: (index) {
            setState(() {
              _selectedPageIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
              ),
              label: 'Companies',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Jobs'),
          ]),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _onPessedFloatingButton(),
        label: Text(_pageDetails[_selectedPageIndex]['buttonText'] ?? ""),
        backgroundColor: _pageDetails[_selectedPageIndex]['color'],
        icon: const Icon(Icons.add),
      ),
    );
  }

  void _onPessedFloatingButton() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                _pageDetails[_selectedPageIndex]['addScreen']));
  }
}
