import 'package:flutter/material.dart';
import 'package:qa_lint/core/utils/constants/constants.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_iconbutton.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_text_widget.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.drawerColor,
      width: mediaQuerryWidth(context) * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: mediaQuerryHeight(context) * 0.05,
          ),
          Row(
            children: [
              SizedBox(
                width: mediaQuerryHeight(context) * 0.02,
              ),
              CircleAvatar(
                radius: mediaQuerryHeight(context) * 0.04,
                backgroundColor: Colors.white,
                backgroundImage: const AssetImage(ImagePath.googleLogo),
              ),
              SizedBox(
                width: mediaQuerryHeight(context) * 0.02,
              ),
              Column(
                children: [
                  customText(
                      context: context,
                      text: 'Pradeep Tharu',
                      color: AppColor.backgroundColor,
                      fontWeight: FontWeight.w500,
                      fontSize: mediaQuerryHeight(context) * 0.025),
                  customText(
                    context: context,
                    text: 'pradeep@vurilo.com',
                    color: AppColor.backgroundColor,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              SizedBox(
                width: mediaQuerryHeight(context) * 0.018,
              ),
            ],
          ),
          SizedBox(
            height: mediaQuerryHeight(context) * 0.02,
          ),
          buildListTile(
              iconData: const Icon(
                Icons.dashboard,
                color: AppColor.backgroundColor,
              ),
              title: customText(
                  context: context,
                  text: 'DashBoard',
                  color: AppColor.backgroundColor,
                  fontSize: mediaQuerryHeight(context) * 0.025),
              onTap: () {}),
          buildListTile(
              iconData: const Icon(
                Icons.dashboard,
                color: AppColor.backgroundColor,
              ),
              title: customText(
                  context: context,
                  text: 'Project',
                  color: AppColor.backgroundColor,
                  fontSize: mediaQuerryHeight(context) * 0.025),
              onTap: () {}),
          buildListTile(
              iconData: const Icon(
                Icons.dashboard,
                color: AppColor.backgroundColor,
              ),
              title: customText(
                  context: context,
                  text: 'Payment',
                  color: AppColor.backgroundColor,
                  fontSize: mediaQuerryHeight(context) * 0.025),
              onTap: () {}),
          buildListTile(
            iconData: const Icon(
              Icons.dashboard,
              color: AppColor.backgroundColor,
            ),
            title: customText(
                context: context,
                text: 'Setting',
                color: AppColor.backgroundColor,
                fontSize: mediaQuerryHeight(context) * 0.025),
            onTap: () {},
          ),
          // Spacer(),
          CustomIconButton(
            icon: Icons.logout,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget buildListTile(
      {Widget? iconData, Widget? title, void Function()? onTap}) {
    return ListTile(
      leading: iconData,
      title: title,
      onTap: onTap,
    );
  }
}
