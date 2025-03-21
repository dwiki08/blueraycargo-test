import 'package:blueraycargo/common/constants.dart';
import 'package:blueraycargo/component/action_dialog.dart';
import 'package:blueraycargo/component/divider.dart';
import 'package:blueraycargo/data/model/address.dart';
import 'package:blueraycargo/provider/update_address_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../common/theme.dart';
import '../provider/address_provider.dart';
import '../screen/address/form_address_screen.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
    required this.address,
    this.hideDelete = false,
  });

  final Address address;
  final bool hideDelete;

  @override
  Widget build(BuildContext context) {
    final addressProvider = context.read<AddressProvider>();
    final updateAddressProvider = context.read<UpdateAddressProvider>();

    onDelete() async {
      await updateAddressProvider.deleteAddress(addressId: address.addressId);
      if (updateAddressProvider.successUpdate == true) {
        addressProvider.getAddressList();
        Navigator.pop(context);
      } else {
        showSnackBar(
          context,
          updateAddressProvider.error?.message ?? 'Terjadi kesalahan',
        );
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding / 2,
        vertical: 4,
      ),
      width: double.infinity,
      child: Card(
        color: Colors.white,
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: defaultPadding,
                right: defaultPadding / 2,
                top: defaultPadding,
                bottom: defaultPadding,
              ),
              color: primaryBlue.withValues(alpha: 0.1),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.home_outlined),
                  SizedBox(width: defaultPadding),
                  Expanded(
                    child: Text(
                      '${address.isPrimary == true ? '[Alamat Utama]\n' : ''}${address.label}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => FormAddressScreen(address: address),
                        ),
                      );
                    },
                    icon: SvgPicture.asset(assetsIcons('ic_edit.svg')),
                  ),
                  Visibility(
                    visible: !hideDelete,
                    child: IconButton(
                      onPressed: () {
                        actionDialog(
                          context: context,
                          onAction: () {
                            onDelete();
                          },
                          title: 'Hapus Alamat',
                          content:
                              'Apakah Anda yakin ingin menghapus alamat ini?',
                        );
                      },
                      icon: SvgPicture.asset(assetsIcons('ic_trash.svg')),
                    ),
                  ),
                ],
              ),
            ),
            divider(),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Row(
                children: [
                  Icon(Icons.person_outline),
                  SizedBox(width: defaultPadding),
                  Expanded(child: Text(address.name)),
                ],
              ),
            ),
            divider(),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Row(
                children: [
                  Icon(Icons.phone_outlined),
                  SizedBox(width: defaultPadding),
                  Text(address.phoneNumber),
                ],
              ),
            ),
            divider(),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.pin_drop_outlined),
                  SizedBox(width: defaultPadding),
                  Flexible(child: Text(address.address)),
                ],
              ),
            ),
            divider(),
          ],
        ),
      ),
    );
  }
}
