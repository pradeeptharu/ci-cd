import 'package:flutter/material.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_iconbutton_widget.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_text_widget.dart';
import 'package:qa_lint/features/dashboard/presentation/widgets/custom_drawer_widget.dart';

// ignore: must_be_immutable
class DashBoardPage extends StatelessWidget {
  DashBoardPage({super.key});
  int currentQuestion = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        actions: [
          CustomIconButton(
            icon: Icons.person,
            onPressed: () {},
          ),
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.person_4),
          // ),
        ],
        title: customText(
          context: context,
          text: 'DashBoard',
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
