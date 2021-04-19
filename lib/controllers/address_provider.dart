import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/models/address.dart';
import 'package:smartcommerce/utils/db/address_db.dart';
import 'package:smartcommerce/utils/pref/selected_address.dart';

class AddressController extends ChangeNotifier with SharedPrefAddress {
  AddressDB db;
  RxList<Address> _addresses = <Address>[].obs;
  Rx<Address> _selectedAddress = Address.empty().obs;
  RxInt lastId = 0.obs;

  List<Address> get addresses {
    return [..._addresses];
  }

  void addAddress(Address address) {
    if (address == null) {
      return;
    }
    updateLatest();
    address.id = lastId.value;
    _addresses.insert(0, address);
    notifyListeners();
    db.addAddress(address);
  }

  Address get selectedAddress {
    return _selectedAddress.value;
  }

  set selectedAddress(Address address) {
    setSelected(address.id);
    _selectedAddress.value = address;
    notifyListeners();
  }

  removeAddress(Address address) {
    _addresses.removeWhere((element) => element.id == address.id);
    if (_selectedAddress.value == address) {
      deleteSelected();
      _selectedAddress.value = Address.empty();
    }
    notifyListeners();
    db.deleteSelectedAddress(address.id);
  }

  initDB() async {
    db = AddressDB();
    await db.init();
    _addresses = await db.getAddress();
    int selected = await getSelected();
    if (selected != null) {
      _selectedAddress.value =
          _addresses.firstWhere((element) => element.id == selected);
    }
    notifyListeners();
    selected = await getLatest();
    if (selected != null) {
      lastId.value = selected;
    }
  }

  updateLatest() async {
    lastId++;
    await setLatest(lastId.value);
  }

  clearAddress() {
    _addresses.clear();
    _selectedAddress.value = Address.empty();
    notifyListeners();
    db.deleteAddress();
    deleteLatest();
    deleteSelected();
  }
}
