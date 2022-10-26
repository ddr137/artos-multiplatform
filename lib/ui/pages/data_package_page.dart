import 'package:artos/shared/theme.dart';
import 'package:artos/ui/widgets/button.dart';
import 'package:artos/ui/widgets/form.dart';
import 'package:artos/ui/widgets/package_item.dart';
import 'package:artos/ui/widgets/transfer_result_user_item.dart';
import 'package:flutter/material.dart';

class DataPackagePage extends StatelessWidget {
  const DataPackagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paket Data'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 30),
          Text(
            'Phone Number',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 14),
          const CustomFormField(
            title: '+628',
            isShowTitle: false,
          ),
          const SizedBox(height: 40),
          Text(
            'Select Package',
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
              PackageItem(
                amount: 10,
                price: 20000,
                isSelected: true,
              ),
              PackageItem(
                amount: 20,
                price: 25000,
              ),
              PackageItem(
                amount: 50,
                price: 45000,
              ),
              PackageItem(
                amount: 130,
                price: 100000,
              ),
            ],
          ),
          const SizedBox(height: 85),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () async {
              if (await Navigator.pushNamed(context, '/pin') == true) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/data-success',
                      (route) => false,
                );
              }
            },
          ),
          const SizedBox(height: 57),
        ],
      ),
    );
  }
}
