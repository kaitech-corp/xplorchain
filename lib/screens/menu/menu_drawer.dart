import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_chain_mvp/services/size_config/size_config.dart';
import '../../services/constants/constants.dart';

///Example menu
class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SafeArea(
        child: Drawer(
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  child: Stack(
                          children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text('Xplor',
                                    style: Theme.of(context).textTheme.headline5)),
                            Align(
                              alignment: Alignment.center,
                              child: CircleAvatar(
                                radius: SizeConfig.screenWidth / 8.0,
                                    
                                backgroundImage:AssetImage(earthImage),
                              ),
                            ),
                          ],
                        ),
                ),
                ListTile(
                  leading: const Icon(Icons.people),
                  title: Text(Intl.message('Profile'),
                      style: Theme.of(context).textTheme.subtitle1),
                  onTap: () {
                    // navigationService.navigateTo(UsersRoute);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.search,
                  ),
                  title:
                  Text(Intl.message('Search'), style: Theme.of(context).textTheme.subtitle1),
                  onTap: () {
                    // navigationService.navigateTo(DMChatListPageRoute);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.info),
                  title: Text(Intl.message('Help & Feedback'),
                      style: Theme.of(context).textTheme.subtitle1),
                  onTap: () {
                    // navigationService.navigateTo(HelpPageRoute);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: Text(Intl.message('Settings'),
                      style: Theme.of(context).textTheme.subtitle1),
                  onTap: () {
                    // navigationService.navigateTo(SettingsRoute);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.exit_to_app),
                  title:
                  Text(Intl.message('Logout'), style: Theme.of(context).textTheme.subtitle1),
                  onTap: () {
                
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: currentVersion(context),
                )
              ],
            )),
      ),
    );
  }

  Widget currentVersion(BuildContext context) {
    // return FutureBuilder<String>(
    //   future: DatabaseService().getVersion(),
    //   builder: (context, data) {
    //     if (data.hasData) {
    //       final String version = data.data;
          return Text(version, style: Theme.of(context).textTheme.subtitle1);
        // } else {
        //   return const Text('');
    //     }
    //   },
    // );
  }
}
