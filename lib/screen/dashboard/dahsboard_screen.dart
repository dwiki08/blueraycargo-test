import 'package:blueraycargo/common/constants.dart';
import 'package:blueraycargo/data/model/address.dart';
import 'package:blueraycargo/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../component/action_dialog.dart';
import '../../component/address_card.dart';
import '../../component/loading.dart';
import '../../provider/address_provider.dart';
import '../../provider/auth_provider.dart';
import '../../provider/state/data_state.dart';
import '../address/form_address_screen.dart';
import '../login/login_screen.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboard';

  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final ScrollController scrollController = ScrollController();

  getAddressList() async {
    await context.read<AddressProvider>().getAddressList();
  }

  onLogout() async {
    await context.read<AuthProvider>().logout();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      getAddressList();
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            onPressed: () {
              actionDialog(
                context: context,
                onAction: () => onLogout(),
                title: 'Logout',
                content: 'Apakah Anda yakin ingin logout?',
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, FormAddressScreen.routeName);
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Consumer<AddressProvider>(
          builder: (context, state, child) {
            switch (state.state) {
              case DataState.isLoading:
                return const Loading(marginTop: 100);
              case DataState.error:
                return Text(state.error!.message.orEmpty());
              case DataState.hasData:
                final List<Address> list = state.addresses;
                return ListView.builder(
                  controller: scrollController,
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context, i) {
                    return AddressCard(
                      address: list[i],
                      hideDelete: list.length == 1 && list[i].isPrimary == true,
                    );
                  },
                );
              case DataState.noData:
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(16),
                  color: Colors.white,
                  child: Column(
                    spacing: 16,
                    children: [
                      SizedBox(height: 64),
                      SvgPicture.asset(
                        assetsIcons('empty.svg'),
                        height: 200,
                        width: 200,
                      ),
                      Text(
                        'Belum ada alamat yang tersimpan.\nMohon buat terlebih dahulu.',
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
