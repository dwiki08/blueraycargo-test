import 'dart:developer';
import 'dart:io';

import 'package:blueraycargo/data/model/address.dart';
import 'package:blueraycargo/provider/address_provider.dart';
import 'package:blueraycargo/provider/update_address_provider.dart';
import 'package:blueraycargo/utils/extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../common/theme.dart';
import '../../component/form_field.dart';
import '../../component/loading.dart';
import '../../provider/file_picker_provider.dart';
import '../../provider/page_provider.dart';
import '../../provider/state/data_state.dart';
import '../../utils/utils.dart';
import '../map/location_picker.dart';

class FormAddressScreen extends StatefulWidget {
  static const routeName = '/form-address';

  const FormAddressScreen({super.key, this.address});

  final Address? address;

  @override
  State<FormAddressScreen> createState() => _FormAddressScreenState();
}

class _FormAddressScreenState extends State<FormAddressScreen> {
  final _labelTextController = TextEditingController();
  final _nameTextController = TextEditingController();
  final _phoneTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _districtTextController = TextEditingController();
  final _postalCodeTextController = TextEditingController();
  final _addressTextController = TextEditingController();
  final _npwpTextController = TextEditingController();

  bool isEditForm = false;
  String? fileName;
  String? filePath;
  LatLng? location;
  geo.Placemark? placemark;
  bool isPrimary = false;

  setLocationInfo(LatLng latLng) async {
    final dataPlacemark = await getPlacemark(latLng);
    setState(() {
      placemark = dataPlacemark;
      location = latLng;
    });
  }

  initializeField() {
    if (widget.address != null) {
      isEditForm = true;
      isPrimary = widget.address?.isPrimary == true;
      _labelTextController.text = widget.address!.label;
      _nameTextController.text = widget.address!.name;
      _phoneTextController.text = widget.address!.phoneNumber;
      _emailTextController.text = widget.address!.email ?? '';
      _districtTextController.text = widget.address!.subDistrictName;
      _postalCodeTextController.text = widget.address!.postalCode;
      _addressTextController.text = widget.address!.address;
      _npwpTextController.text = widget.address!.npwp ?? '';
      setLocationInfo(LatLng(widget.address!.lat, widget.address!.long));
    }
  }

  @override
  void initState() {
    super.initState();
    initializeField();
  }

  @override
  void dispose() {
    _labelTextController.dispose();
    _nameTextController.dispose();
    _phoneTextController.dispose();
    _emailTextController.dispose();
    _districtTextController.dispose();
    _postalCodeTextController.dispose();
    _addressTextController.dispose();
    _npwpTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final addressProvider = context.read<AddressProvider>();
    final updateAddressProvider = context.read<UpdateAddressProvider>();

    placemarkAddress() {
      return '${placemark?.subLocality}, ${placemark?.locality}, ${placemark?.subAdministrativeArea}, ${placemark?.administrativeArea}, ${placemark?.country} ${placemark?.postalCode}';
    }

    onSubmit() async {
      if (_labelTextController.text.isNullOrEmpty() ||
          _nameTextController.text.isNullOrEmpty() ||
          _phoneTextController.text.isNullOrEmpty() ||
          _districtTextController.text.isNullOrEmpty() ||
          _postalCodeTextController.text.isNullOrEmpty() ||
          _addressTextController.text.isNullOrEmpty()) {
        showSnackBar(context, 'Mohon lengkapi semua kolom yang wajib diisi.');
        return;
      }

      bool isLabelExist =
          addressProvider.addresses
              .where(
                (address) => address.label.toLowerCase().contains(
                  _labelTextController.text.toLowerCase(),
                ),
              )
              .isNotEmpty;
      if (isLabelExist && widget.address == null) {
        showSnackBar(context, 'Label alamat sudah ada.');
        return;
      }

      if (location == null) {
        showSnackBar(context, 'Mohon pilih titik lokasi alamat.');
        return;
      }

      final address = Address(
        isPrimary: isPrimary,
        addressId: isEditForm ? widget.address!.addressId : -1,
        label: _labelTextController.text,
        address: _addressTextController.text,
        name: _nameTextController.text,
        phoneNumber: _phoneTextController.text,
        email: _emailTextController.text,
        provinceName: '-',
        districtName: '-',
        subDistrictName: '-',
        provinceId: -1,
        districtId: -1,
        subDistrictId: -1,
        postalCode: _postalCodeTextController.text,
        lat: location?.latitude ?? 0,
        long: location?.longitude ?? 0,
        addressMap: placemarkAddress(),
        npwp: _npwpTextController.text,
        npwpFile: filePath ?? widget.address?.npwpFile,
      );
      await updateAddressProvider.addOrEditAddress(
        address: address,
        district: _districtTextController.text,
      );
      log('successUpdate: ${updateAddressProvider.successUpdate}');
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

    onOpenGallery() async {
      final provider = context.read<FilePickerProvider>();

      final isMacOS = defaultTargetPlatform == TargetPlatform.macOS;
      final isLinux = defaultTargetPlatform == TargetPlatform.linux;
      if (isMacOS || isLinux) return;

      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        filePath = pickedFile.path;
        provider.setFile(pickedFile);
        provider.setFilePath(pickedFile.path);
        setState(() {
          fileName = pickedFile.name;
        });
      }
    }

    onPickLocation() async {
      LatLng? defaultLatLng;
      if (location != null) {
        defaultLatLng = LatLng(location!.latitude, location!.longitude);
      }
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => LocationPickerScreen(latLng: defaultLatLng),
        ),
      );
      final data = await context.read<PageManagerProvider>().waitForResult();
      final latLng = data.data as LatLng;
      setLocationInfo(latLng);
    }

    dialogPrimaryAddress() {
      return Visibility(
        visible: widget.address?.isPrimary != true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Jadikan alamat utama?'),
            OverflowBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio(
                      value: true,
                      groupValue: isPrimary,
                      onChanged: (value) {
                        setState(() {
                          isPrimary = value!;
                        });
                      },
                    ),
                    Text('Ya'),
                  ],
                ),
                SizedBox(width: 16),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio(
                      value: false,
                      groupValue: isPrimary,
                      onChanged: (value) {
                        setState(() {
                          isPrimary = value!;
                        });
                      },
                    ),
                    Text('Tidak'),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Alamat Pengiriman')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Visibility(visible: isEditForm, child: dialogPrimaryAddress()),
            formField(
              context: context,
              textController: _labelTextController,
              label: 'Label Alamat *',
              hint: 'Label Alamat',
            ),
            formField(
              context: context,
              textController: _nameTextController,
              label: 'Nama Penerima *',
              hint: 'Nama Penerima',
              keyboardType: TextInputType.name,
            ),
            formField(
              context: context,
              textController: _phoneTextController,
              label: 'Nomor Telepon *',
              hint: '08xxxx',
              keyboardType: TextInputType.phone,
            ),
            formField(
              context: context,
              textController: _emailTextController,
              label: 'Email',
              hint: 'Alamat email',
              keyboardType: TextInputType.emailAddress,
            ),
            formField(
              context: context,
              textController: _districtTextController,
              label: 'Kecamatan *',
              hint: 'Masukkan nama kecamatan',
            ),
            formField(
              context: context,
              textController: _postalCodeTextController,
              label: 'Kode Pos *',
              hint: 'Kode Pos',
              keyboardType: TextInputType.number,
            ),
            formField(
              context: context,
              textController: _addressTextController,
              label: 'Alamat Lengkap *',
              hint: 'Masukkan nama jalan, rumah, atau komplek',
              keyboardType: TextInputType.multiline,
              minLines: 4,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Text('Pin Alamat *'),
                SizedBox(height: 4),
                InkWell(
                  onTap: () {
                    onPickLocation();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade600),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(defaultPadding),
                    child: Row(
                      children: [
                        Icon(Icons.pin_drop_outlined, color: primaryBlue),
                        SizedBox(width: 16),
                        Flexible(
                          child: Text(
                            placemark == null
                                ? 'Pilih titik lokasi alamat'
                                : '${placemark?.street}\n${placemarkAddress()}',
                            style: textTheme.bodyMedium?.copyWith(
                              color: primaryBlue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            formField(
              context: context,
              textController: _npwpTextController,
              label: 'NPWP',
              hint: 'Nomor NPWP',
              keyboardType: TextInputType.number,
              maxLength: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Text('Unggah File NPWP'),
                SizedBox(height: 4),
                InkWell(
                  onTap: () {
                    onOpenGallery();
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade600),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding,
                      vertical: defaultPadding * 2,
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.upload, color: primaryBlue),
                        SizedBox(width: 16),
                        Text(
                          fileName == null
                              ? 'Unggah foto NPWP Anda'
                              : fileName!,
                          style: textTheme.bodyMedium?.copyWith(
                            color: primaryBlue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Visibility(
                  visible:
                      filePath.isNullOrEmpty() == false ||
                      widget.address?.npwpFile.isNullOrEmpty() == false,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade600),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:
                          filePath.isNullOrEmpty() == false
                              ? Image.file(
                                File(filePath ?? ''),
                                fit: BoxFit.contain,
                              )
                              : Image.network(
                                widget.address?.npwpFile ?? '',
                                fit: BoxFit.contain,
                              ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 64),
            Consumer<AddressProvider>(
              builder: (context, value, child) {
                if (value.state == DataState.isLoading) {
                  return const Loading();
                } else {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(defaultCircularRadius),
                        ),
                        minimumSize: const Size(100, 42),
                        backgroundColor: primaryBlue,
                      ),
                      onPressed: () {
                        onSubmit();
                      },
                      child: Text(
                        'Simpan',
                        style: textTheme.labelLarge?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
