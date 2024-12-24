import 'package:ecom_admin_app/screens/edit_upload_product_form.dart';
import 'package:ecom_admin_app/screens/inner_screen/orders/orders_screen.dart';
import 'package:ecom_admin_app/screens/search_screen.dart';
import 'package:flutter/material.dart';

import '../services/assets_manager.dart';

class DashboardButtonsModel {
  final String text, imagePath;
  final Function onPressed;

  DashboardButtonsModel({
    required this.text,
    required this.imagePath,
    required this.onPressed,
  });

  static List<DashboardButtonsModel> dashboardBtnList(context) => [
        DashboardButtonsModel(
          text: "Add New Product",
          imagePath: AssetsManager.shoes,
          onPressed: () {
            Navigator.pushNamed(context, EditOrUploadProductScreen.routeName);
          },
        ),
        DashboardButtonsModel(
          text: "View all products",
          imagePath: AssetsManager.book,
          onPressed: () {
            Navigator.pushNamed(context, SearchScreen.routeName);
          },
        ),
        DashboardButtonsModel(
          text: "View Orders",
          imagePath: AssetsManager.emptySearch,
          onPressed: () {
            Navigator.pushNamed(context, OrdersScreenFree.routeName);
          },
        ),
      ];
}
