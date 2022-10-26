import 'package:artos/shared/theme.dart';
import 'package:artos/ui/widgets/button.dart';
import 'package:artos/ui/widgets/form.dart';
import 'package:artos/ui/widgets/transfer_recent_user_item.dart';
import 'package:artos/ui/widgets/transfer_result_user_item.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 30),
          Text(
            'Search',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 14),
          const CustomFormField(
            title: 'by username',
            isShowTitle: false,
          ),
          buildResult(),
          const SizedBox(height: 274),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, '/transfer-amount');
            },
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget buildRecentUsers() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Users',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 14),
          const TransferRecentUserItem(
            imageUrl: 'assets/img_friend1.png',
            name: 'Ramdhani',
            username: 'ddr',
            isVerified: true,
          ),
          const TransferRecentUserItem(
            imageUrl: 'assets/img_friend1.png',
            name: 'Ramdhani',
            username: 'ddr',
            isVerified: false,
          ),
          const TransferRecentUserItem(
            imageUrl: 'assets/img_friend1.png',
            name: 'Ramdhani',
            username: 'ddr',
            isVerified: false,
          ),
        ],
      ),
    );
  }

  Widget buildResult() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Result',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 14),
          Wrap(
            runSpacing: 17,
            spacing: 17,
            children: const [
              TransferResultUserItem(
                imageUrl: 'assets/img_friend1.png',
                name: 'Ramdhani',
                username: 'ddr',
                isVerified: true,
                isSelected: true,
              ),
              TransferResultUserItem(
                imageUrl: 'assets/img_friend2.png',
                name: 'Dadan',
                username: 'ddr',
              ),
              TransferResultUserItem(
                imageUrl: 'assets/img_friend3.png',
                name: 'Ramdhani',
                username: 'ddr',
                isVerified: true,
              ),
              TransferResultUserItem(
                imageUrl: 'assets/img_friend4.png',
                name: 'Dadan',
                username: 'ddr',
              ),
            ],
          )
        ],
      ),
    );
  }
}
