import 'package:shared_preferences/shared_preferences.dart';

class SessionManager{

  static SharedPreferences? _preferences;
  static const _isLOGIN = "is_login";
  static const _userID = "user_id";
  static const _userFirstName = "first_name";
  static const _userLastName = "last_name";
  static const _userEMAIL = "email";
  static const _userMobile = "mobile";
  static const _authToken = 'token';
  static const _referralCode = 'referral_code';
  static const _categoryid = "category_id";

  static Future init()async =>
      _preferences = await SharedPreferences.getInstance();

  static dynamic setCategoryID(String partnerId){
    _preferences!.setString(_categoryid, partnerId);
  }

  static dynamic getCategoryID(){
    return _preferences!.getString(_categoryid);
  }

  static dynamic setUserLoggedIn(bool isLogin){
    _preferences!.setBool(_isLOGIN, isLogin);
  }

  static dynamic getisLoggedIn() {
    return _preferences!.getBool(_isLOGIN) ?? false;
  }

  static dynamic setUserID(String userId){
    _preferences!.setString(_userID, userId);
  }

  static dynamic getUserID(){
    return _preferences!.getString(_userID);
  }

  static dynamic setReferralCode(String code) {
    _preferences!.setString(_referralCode, code);
  }

  static dynamic getReferralCode() {
    return _preferences!.getString(_referralCode) ?? '';
  }

  static dynamic setFirstName(String userName) {
    _preferences!.setString(_userFirstName, userName);
  }

  static dynamic getFirstName() {
    return _preferences!.getString(_userFirstName);
  }
  static dynamic setLastName(String userName) {
    _preferences!.setString(_userLastName, userName);
  }

  static dynamic getLastName() {
    return _preferences!.getString(_userLastName);
  }

  static dynamic setUserEmail(String email) {
    _preferences!.setString(_userEMAIL, email);
  }

  static dynamic getUserEmail() {
    return _preferences!.getString(_userEMAIL);
  }

  static dynamic setUserMobile(String mobile) {
    _preferences!.setString(_userMobile, mobile);
  }

  static dynamic getUserMobile() {
    return _preferences!.getString(_userMobile);
  }

  static dynamic setAuthToken(String token) {
    _preferences!.setString(_authToken, token);
  }

  static dynamic getAuthToken() {
    return _preferences!.getString(_authToken);
  }

  static dynamic logout() {
    _preferences!.remove(_userEMAIL);
    _preferences!.remove(_userMobile);
    _preferences!.remove(_userFirstName);
    _preferences!.remove(_userLastName);
    _preferences!.remove(_userID);
    _preferences!.remove(_isLOGIN);
    _preferences!.remove(_authToken);
    _preferences!.remove(_categoryid);
  }


}