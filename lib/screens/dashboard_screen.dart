import 'package:ecom_admin_app/models/dashboard_btn_model.dart';
import 'package:ecom_admin_app/providers/theme_provider.dart';
import 'package:ecom_admin_app/services/assets_manager.dart';
import 'package:ecom_admin_app/widgets/dashboard_btns.dart';
import 'package:ecom_admin_app/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/DashboardScreen';
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const TitlesTextWidget(label: "Dashboard"),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AssetsManager.book),
          ),
          actions: [
            IconButton(
              onPressed: () {
                themeProvider.setDarkTheme(
                    themeValue: !themeProvider.getIsDarkTheme);
              },
              icon: Icon(themeProvider.getIsDarkTheme
                  ? Icons.light_mode
                  : Icons.dark_mode),
            ),
          ],
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            DashboardButtonsModel.dashboardBtnList(context).length,
            (index) => DashboardButtonsWidget(
              text: DashboardButtonsModel.dashboardBtnList(context)[index].text,
              imagePath: DashboardButtonsModel.dashboardBtnList(context)[index]
                  .imagePath,
              onPressed: DashboardButtonsModel.dashboardBtnList(context)[index]
                  .onPressed,
            ),
          ),
        ));
  }
}
