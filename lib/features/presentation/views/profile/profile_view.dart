import 'package:flutter/material.dart';
import '../../../../utils/app_strings.dart';
import '../../widgets/common_appbar.dart';


class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CommonAppBar(
        title: AppStrings.profile,
      ),
    );
  }
}
