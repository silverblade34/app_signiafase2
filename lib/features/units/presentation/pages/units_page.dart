import 'package:app_signiafase2/config/constants/colors.dart';
import 'package:app_signiafase2/config/constants/fonts.dart';
import 'package:app_signiafase2/core/widgets/slidebar.dart';
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
          title: const Text('Salida de unidades', style: AppFonts.titleAppBar),
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        endDrawer: Obx(
          () => slidebarDrawer(nameConductor: controller.nameUser.value),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: const TabBar(
                  indicatorColor: AppColors.primaryColor,
                  labelColor: AppColors.primaryColor,
                  tabs: <Widget>[
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.description_outlined,
                              color: AppColors.darkGrey),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "GENERAL",
                            style: TextStyle(color: AppColors.darkGrey),
                          )
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.confirmation_number_outlined,
                              color: AppColors.darkGrey),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "RESGUARDO",
                            style: TextStyle(color: AppColors.darkGrey),
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
