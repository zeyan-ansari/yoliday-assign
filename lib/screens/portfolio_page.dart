import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/project_card.dart';
import '../project_tab.dart';

class PortfolioPage extends StatefulWidget {
  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  // Variable to track the selected tab index
  int _selectedIndex = 0;

  // List of different screens/widgets that correspond to each BottomNavigationBar tab
  static List<Widget> _widgetOptions = <Widget>[
    Text('Home Screen'),            // Home Tab Content (Replace with your content)
    ProjectTab(),                   // Portfolio Tab Content (ProjectTab)
    Text('Input Screen'),           // Input Tab Content (Placeholder)
    Text('Profile Screen'),         // Profile Tab Content (Placeholder)
  ];

  // Function to handle BottomNavigationBar item taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected tab index
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          centerTitle: false,
          title: Text('Portfolio', style: TextStyle(color: Colors.black)),
          actions: [
            SvgPicture.asset('assets/ic_round-shopping-bag.svg'),
            IconButton(
              icon: Icon(Icons.notifications, color: Color(0xffDF5532)),
              onPressed: () {},
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(30.0), // Increase height to accommodate search bar
            child: Column(
              children: [
                TabBar(
                  tabs: [
                    Tab(text: 'Project'),
                    Tab(text: 'Saved'),
                    Tab(text: 'Shared'),
                    Tab(text: 'Achievement'),
                  ],
                  labelColor: Color(0xffDF5532),
                  unselectedLabelColor: Color(0xff303030),
                  indicatorColor: Color(0xffDF5532),
                ),
              ],
            ),
          ),
        ),
        body: Center(
          // Display the appropriate content based on the selected tab
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: TextStyle(color: Color(0xffDF5532)),
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          currentIndex: _selectedIndex,  // This will highlight the selected tab
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/Home svg.svg',color: _selectedIndex==0?Color(0xffDF5532):Colors.grey,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/Portfolia svg.svg',color: _selectedIndex==1?Color(0xffDF5532):Colors.grey,),
              label: 'Portfolio',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/Input svg@2x.svg',color: _selectedIndex==2?Color(0xffDF5532):Colors.grey,),
              label: 'Input',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/Profile svg.svg',color: _selectedIndex==3?Color(0xffDF5532):Colors.grey,),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Color(0xffDF5532), // Color of the selected item
          unselectedItemColor: Colors.grey,
          selectedIconTheme: IconThemeData(color:Color(0xffDF5532), ),
          showUnselectedLabels: true,// Color of unselected items
          onTap: _onItemTapped,  // Handle taps
        ),
        floatingActionButton: Container(margin: EdgeInsets.only(left: 50),
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 110,
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/filter.svg',height: 20,color: Colors.white,),
                    SizedBox(width: 5,),
                    Text('Filter',style: TextStyle(color: Colors.white),),
                  ],
                ),
                decoration:BoxDecoration(
                  color: Color(0xffDF5532),
                  borderRadius: BorderRadius.circular(20)

                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
