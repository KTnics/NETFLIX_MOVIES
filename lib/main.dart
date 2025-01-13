import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled6/show_cubit.dart';
import 'package:untitled6/show_repository.dart';
import 'ShowSearchPage.dart';
import 'details_screen.dart';
import 'dummy.dart';
import 'homescreen.dart';

void main() {
  runApp(const NetflixApp());
}

class NetflixApp extends StatefulWidget {
  const NetflixApp({Key? key}) : super(key: key);

  @override
  _NetflixAppState createState() => _NetflixAppState();
}

class _NetflixAppState extends State<NetflixApp> {
  int _selectedIndex = 0;

  // List of Screens to navigate to.
  static List<Widget> _screens = <Widget>[
    const HomeScreen(),
    ShowSearchPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowCubit(ShowRepository())..fetchShows(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: Scaffold(

          body: _screens[_selectedIndex], // This changes based on the selected index
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
