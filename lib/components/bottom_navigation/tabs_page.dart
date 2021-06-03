// import 'package:fastmilk_admin/components/bottom_navigation/tab_navigation_item.dart';
// import 'package:flutter/material.dart';

// class TabsPage extends StatefulWidget {
//   static String tag = 'tabs-page';
//   @override
//   _TabsPageState createState() => _TabsPageState();
// }

// class _TabsPageState extends State<TabsPage> {
//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: TabNavigationItem.items[_currentIndex].page,
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (int index) => setState(() => _currentIndex = index),
//         items: [
//           for (final tabItem in TabNavigationItem.items)
//             BottomNavigationBarItem(
//               icon: tabItem.icon,
//               title: tabItem.title,
//             )
//         ],
//       ),
//     );
//   }
// }
