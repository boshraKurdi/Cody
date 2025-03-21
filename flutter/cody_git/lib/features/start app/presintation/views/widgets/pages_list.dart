import 'package:cody/features/chat/presintation/views/chat_page.dart';
import 'package:cody/features/home/home_page.dart';
import 'package:cody/features/projects/presintation/veiws/dashboard_page.dart';
import 'package:cody/features/projects/presintation/veiws/project_page.dart';
import 'package:flutter/material.dart';

import '../../../../dashboade/ProjectDashboard.dart';
import '../../../../home/favorit_page.dart';


List<navigationButtomPages> navigationButtomPagesList =[
  navigationButtomPages(Icons.home,Icons.home,HomePage(),0),
  navigationButtomPages(Icons.favorite,Icons.favorite,  FavoritePage(),1),
  navigationButtomPages(Icons.dashboard_customize,Icons.dashboard_customize, DashboardPage(),2),
  navigationButtomPages(Icons.person, Icons.person, ChatPage(),3)
];
//HomeView(),SelectView(),PhotoProgressView(),ProfileView()
class navigationButtomPages {
  final int number;
  final IconData icon;
  final IconData activeIcon;
  final Widget page;
  navigationButtomPages(this.icon, this.activeIcon, this.page, this.number);
}
