
import 'package:flutter/material.dart';


class HomeDrawerList extends StatelessWidget {
  var AppLocalizations;

  HomeDrawerList({super.key});


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: SizedBox(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                child: Icon(
                  Icons.home_filled,
                  size: 100,
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.settings,
                ),
                title:const Text('drawer_settings_btn_txt'),
                onTap: () {}
                //Navigator.pushNamed(context, settingsRoute),
              ),
              ListTile(
                leading:const Icon(
                  Icons.info,
                ),
                title:const Text('drawer_about_btn_txt'),
                onTap: () => Navigator.pushNamed(context, '/about'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}