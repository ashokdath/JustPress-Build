import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:justpress/Constrain.dart';

class RemoteConfigFile extends ChangeNotifier{

  String data;

  RemoteConfigFile(){
    _startupRemoteConfig().then((value) {
      data=value.getString("categories_title");
      notifyListeners();
    });
  }

  Future<RemoteConfig> _startupRemoteConfig() async {
    final RemoteConfig remoteConfig = await RemoteConfig. instance;
    await remoteConfig.setDefaults(defaults);
    await remoteConfig.fetch();
    await remoteConfig.activateFetched();
    return remoteConfig;
  }
}

