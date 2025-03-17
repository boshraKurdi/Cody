
import 'package:cody/features/start%20app/presintation/views/widgets/main_buttom_navigation_bar.dart';
import 'package:cody/features/start%20app/presintation/views/widgets/pages_list.dart';
import 'package:cody/features/start%20app/presintation/views/widgets/search_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../views_blocs/buttom navigation bloc/buttom_navigation_bar_bloc.dart';

class NavPage extends StatelessWidget {
  const NavPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtomNavigationBarBloc(),
      child: BlocBuilder<ButtomNavigationBarBloc, ButtomNavigationBarState>(
        builder: (context, state) {
          return Scaffold(
            body: navigationButtomPagesList[state.pageIndex].page,
            floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked,
            floatingActionButton: const SearchIcon(),
            bottomNavigationBar: MainButtomNavigationBar(
              state: state,
            ),
          );
        },
      ),
    );
  }
}

