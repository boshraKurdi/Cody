import 'package:cody/utls/Shared%20pref%20helper/shared_pref.dart';
import '../../features/auth/data/models/register_model.dart';

class UserCacheHelper {
  setUserCache(RegisterModel userInformation ) {
    final SharedPref sf = SharedPref();
  sf.save("user", userInformation);
}

 RegisterModel getUserCache(String user)  {
  final SharedPref sf = SharedPref();
  RegisterModel user = RegisterModel.fromJson(sf.read("user"));
  return user;
}
 deleteUserCache(String user)  {
    final SharedPref sf = SharedPref();
    sf.remove(user);
  }

}

