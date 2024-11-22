import 'package:app_signiafase2/config/constants/colors.dart';
import 'package:app_signiafase2/config/constants/fonts.dart';
import 'package:app_signiafase2/features/units/controllers/units_controller.dart';
import 'package:app_signiafase2/features/units/presentation/widgets/tab_general.dart';
import 'package:app_signiafase2/features/units/presentation/widgets/tab_resguardo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnitsPage extends GetView<UnitsController> {
  const UnitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Centro de control', style: AppFonts.titleAppBar),
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        backgroundColor: AppColors.darkGrey,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Salida de unidades",
                      style: TextStyle(
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: const TabBar(
                  indicatorColor: Colors.white,
                  labelColor: Colors.white,
                  tabs: <Widget>[
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.description_outlined,
                              color: AppColors.lightGrey),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "GENERAL",
                            style: TextStyle(color: AppColors.lightGrey),
                          )
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.confirmation_number_outlined,
                              color: AppColors.lightGrey),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "RESGUARDO",
                            style: TextStyle(color: AppColors.lightGrey),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    SingleChildScrollView(
                      child: TabGeneral(
                        controller: controller,
                      ),
                    ),
                    SingleChildScrollView(
                      child: TabResguardo(
                        controller: controller,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
