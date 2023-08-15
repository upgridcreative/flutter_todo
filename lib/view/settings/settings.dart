import 'package:flutter/material.dart';
import '../../shared/theme/colors.dart';
import '../../sync/usecases/sync.dart';
import '../../view_model/auth_wrapper.dart';
import "package:get/get.dart";

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  final AuthWrapperViewModel viewModel = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            GestureDetector(
              onTap: viewModel.logout,
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorClass.primary.withAlpha(100)),
                width: double.infinity,
                child: Row(
                  children: const [
                    SizedBox(width: 30),
                    Icon(Icons.logout, size: 30),
                    Spacer(),
                    Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 100),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: SyncToolKit().syncData,
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorClass.primary.withAlpha(100),
                ),
                width: double.infinity,
                child: Row(
                  children: const [
                    SizedBox(width: 30),
                    Icon(Icons.logout, size: 30),
                    Spacer(),
                    Text(
                      'Manual Sync (Test)',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
