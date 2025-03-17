
import 'package:cody/features/start%20app/presintation/views/widgets/pages_list.dart';
import 'package:cody/features/start%20app/presintation/views/widgets/tab_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constants/colo_extension.dart';
import '../../views_blocs/buttom navigation bloc/buttom_navigation_bar_bloc.dart';
import '../nav_page.dart';

class MainButtomNavigationBar extends StatelessWidget {
  final ButtomNavigationBarState state;
  const MainButtomNavigationBar({
    super.key, required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(height: 50,
      decoration: BoxDecoration(
        color: TColor.primaryColor3
        //gradient:TColor.kmainGradint,
      //     boxShadow: const [
      //   BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, -2))
      // ]
      ),
      //  height: kToolbarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: navigationButtomPagesList.map((e) =>Row(
          children: [
            TabButton(
                icon: e.icon,
                selectIcon: e.activeIcon,
                isActive: state.pageIndex == e.number,
                onTap: () {
                  BlocProvider.of<ButtomNavigationBarBloc>(context).add(ButtomNavigationBarEvent(pageIndex: e.number));
                }),
            e.number==1? const SizedBox(width: 50,):const SizedBox()
          ],
        ), ).toList(),
      ),
    );
  }
}