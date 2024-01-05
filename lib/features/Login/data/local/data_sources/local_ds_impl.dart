



import 'package:mustproject2shopify2/core/cashe/Shared_Pref.dart';
import 'package:mustproject2shopify2/features/Login/data/local/data_sources/local_ds.dart';

class LoginLocaldsimpl implements Loginlocalds {
  @override
  cacheToken(String Token) {
    SharedPreff.SaveToken(Data: Token, Key: "token");
  }

  @override
  getToken() {
    SharedPreff.GetToken(Key: "token");
  }
}
