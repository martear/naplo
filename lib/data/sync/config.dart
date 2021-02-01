import 'dart:convert';

import 'package:filcnaplo/data/context/app.dart';
import 'package:filcnaplo/data/models/config.dart';
//import 'package:filcnaplo/data/models/dummy.dart';

class ConfigSync {
  Config config = Config.defaults;

  Future<bool> sync() async {
    if (!app.debugUser) {
      Config _config;
      _config = await app.kretaApi.client.getConfig();

      if (_config != null) {
        config = _config;

        await app.storage.storage.update("settings", {
          "config": jsonEncode(_config.json),
        });
      }

      return _config != null;
    } else {
      return true;
    }
  }

  delete() {
    config = Config.defaults;
  }
}
