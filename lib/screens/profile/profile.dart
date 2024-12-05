import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/components/costume_navigator.dart'; // CostumeButtonBar
import 'package:ui_ecommerce/enums.dart'; // MenuState enum
import 'package:ui_ecommerce/state_managements/theme_provider.dart';
import 'components/body.dart'; // Body widget

class ProfileScreen extends StatelessWidget {
  static String routesName = "/profile";
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Body(),
      bottomNavigationBar: CustomBottomNavigationBar(menu: MenuState.profile),
    );
  }
}

AppBar appBar(BuildContext context) {
  return AppBar(
    forceMaterialTransparency: true,
    automaticallyImplyLeading: false,
    title: Text("Your Profile", style: Theme.of(context).textTheme.bodyLarge),
    actions: [
      Consumer<ThemeProvider>(
        builder: (context, theme, child) => IconButton(
            onPressed: () {
              theme.toggleTheme(!theme.isDarkMode);
            },
            icon: Icon(
              theme.isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
              color: Theme.of(context).iconTheme.color,
            )),
      )
    ],
  );
}
