import 'package:shiku_flutter/http/api.dart';

/// **************************************************************************
/// 来自金慧科技Json转Dart工具
/// **************************************************************************

class ApiConfigModel {
  static String xMPPDomain;
  static String xMPPHost;
  static int xMPPTimeout;
  static String address;
  static String androidAppUrl;
  static String androidDisable;
  static String androidExplain;
  static int androidVersion;
  static String apiUrl;
  static String appleId;
  static String audioLen;
  static int chatRecordTimeOut;
  static String customerCompanyId;
  static String customerDepartmentId;
  static int displayRedPacket;
  static int distance;
  static String downloadAvatarUrl;
  static String downloadUrl;
  static int enableMpModule;
  static int enableOpenModule;
  static int enablePayModule;
  static int fileValidTime;
  static String headBackgroundImg;
  static String helpUrl;
  static int hideSearchByFriends;
  static String iosAppUrl;
  static String iosDisable;
  static String iosExplain;
  static int iosVersion;
  static String ipAddress;
  static int isCommonCreateGroup;
  static int isCommonFindFriends;
  static int isOpenAPNSorJPUSH;
  static int isOpenCluster;
  static int isOpenGoogleFCM;
  static int isOpenOnlineStatus;
  static int isOpenPositionService;
  static int isOpenReadReceipt;
  static int isOpenReceipt;
  static int isOpenRegister;
  static int isOpenRoomSearch;
  static int isOpenSMSCode;
  static int isOpenUI;
  static String jitsiServer;
  static String liveUrl;
  static String macAppUrl;
  static String macDisable;
  static String macExplain;
  static int macVersion;
  static int nicknameSearchUser;
  static String pcAppUrl;
  static String pcDisable;
  static String pcExplain;
  static int pcVersion;
  static String popularAPP;
  static String privacyPolicyPrefix;
  static int regeditPhoneOrName;
  static int registerInviteCode;
  static String shareUrl;
  static int showContactsUser;
  static String softUrl;
  static String uploadUrl;
  static String videoLen;
  static int videoLength;
  static String website;
  static int xmppPingTime;
  static String apiKey;

  void setValue(Map<String, dynamic> json) {
    ApiConfigModel.xMPPDomain = json['XMPPDomain'];
    ApiConfigModel.xMPPHost = json['XMPPHost'];
    ApiConfigModel.xMPPTimeout = json['XMPPTimeout'];
    ApiConfigModel.address = json['address'];
    ApiConfigModel.androidAppUrl = json['androidAppUrl'];
    ApiConfigModel.androidDisable = json['androidDisable'];
    ApiConfigModel.androidExplain = json['androidExplain'];
    ApiConfigModel.androidVersion = json['androidVersion'];
    ApiConfigModel.apiUrl = json['apiUrl'];
    ApiConfigModel.appleId = json['appleId'];
    ApiConfigModel.audioLen = json['audioLen'];
    ApiConfigModel.chatRecordTimeOut = json['chatRecordTimeOut'];
    ApiConfigModel.customerCompanyId = json['customer_companyId'];
    ApiConfigModel.customerDepartmentId = json['customer_departmentId'];
    ApiConfigModel.displayRedPacket = json['displayRedPacket'];
    ApiConfigModel.distance = json['distance'];
    ApiConfigModel.downloadAvatarUrl = json['downloadAvatarUrl'];
    ApiConfigModel.downloadUrl = json['downloadUrl'];
    ApiConfigModel.enableMpModule = json['enableMpModule'];
    ApiConfigModel.enableOpenModule = json['enableOpenModule'];
    ApiConfigModel.enablePayModule = json['enablePayModule'];
    ApiConfigModel.fileValidTime = json['fileValidTime'];
    ApiConfigModel.headBackgroundImg = json['headBackgroundImg'];
    ApiConfigModel.helpUrl = json['helpUrl'];
    ApiConfigModel.hideSearchByFriends = json['hideSearchByFriends'];
    ApiConfigModel.iosAppUrl = json['iosAppUrl'];
    ApiConfigModel.iosDisable = json['iosDisable'];
    ApiConfigModel.iosExplain = json['iosExplain'];
    ApiConfigModel.iosVersion = json['iosVersion'];
    ApiConfigModel.ipAddress = json['ipAddress'];
    ApiConfigModel.isCommonCreateGroup = json['isCommonCreateGroup'];
    ApiConfigModel.isCommonFindFriends = json['isCommonFindFriends'];
    ApiConfigModel.isOpenAPNSorJPUSH = json['isOpenAPNSorJPUSH'];
    ApiConfigModel.isOpenCluster = json['isOpenCluster'];
    ApiConfigModel.isOpenGoogleFCM = json['isOpenGoogleFCM'];
    ApiConfigModel.isOpenOnlineStatus = json['isOpenOnlineStatus'];
    ApiConfigModel.isOpenPositionService = json['isOpenPositionService'];
    ApiConfigModel.isOpenReadReceipt = json['isOpenReadReceipt'];
    ApiConfigModel.isOpenReceipt = json['isOpenReceipt'];
    ApiConfigModel.isOpenRegister = json['isOpenRegister'];
    ApiConfigModel.isOpenRoomSearch = json['isOpenRoomSearch'];
    ApiConfigModel.isOpenSMSCode = json['isOpenSMSCode'];
    ApiConfigModel.isOpenUI = json['isOpenUI'];
    ApiConfigModel.jitsiServer = json['jitsiServer'];
    ApiConfigModel.liveUrl = json['liveUrl'];
    ApiConfigModel.macAppUrl = json['macAppUrl'];
    ApiConfigModel.macDisable = json['macDisable'];
    ApiConfigModel.macExplain = json['macExplain'];
    ApiConfigModel.macVersion = json['macVersion'];
    ApiConfigModel.nicknameSearchUser = json['nicknameSearchUser'];
    ApiConfigModel.pcAppUrl = json['pcAppUrl'];
    ApiConfigModel.pcDisable = json['pcDisable'];
    ApiConfigModel.pcExplain = json['pcExplain'];
    ApiConfigModel.pcVersion = json['pcVersion'];
    ApiConfigModel.popularAPP = json['popularAPP'];
    ApiConfigModel.privacyPolicyPrefix = json['privacyPolicyPrefix'];
    ApiConfigModel.regeditPhoneOrName = json['regeditPhoneOrName'];
    ApiConfigModel.registerInviteCode = json['registerInviteCode'];
    ApiConfigModel.shareUrl = json['shareUrl'];
    ApiConfigModel.showContactsUser = json['showContactsUser'];
    ApiConfigModel.softUrl = json['softUrl'];
    ApiConfigModel.uploadUrl = json['uploadUrl'];
    ApiConfigModel.videoLen = json['videoLen'];
    ApiConfigModel.videoLength = json['videoLength'];
    ApiConfigModel.website = json['website'];
    ApiConfigModel.xmppPingTime = json['xmppPingTime'];
    ApiConfigModel.apiKey = "a891a7a6-03af-475c-8ae1-7fb4b230e958";
//    API.reqUrl = ApiConfigModel.apiUrl;
    API.reqUrl = json['apiUrl'];
    print('IM: config success');
  }
}