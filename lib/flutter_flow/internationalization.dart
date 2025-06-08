import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ko', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? koText = '',
    String? enText = '',
  }) =>
      [koText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    '1a7lrdwb': {
      'ko': ' 학생 - ',
      'en': 'student -',
    },
    'a51pmt39': {
      'ko': ' 번 좌석(',
      'en': 'Seat number(',
    },
    '0kqws3hh': {
      'ko': ')',
      'en': ')',
    },
    'oozt6r9f': {
      'ko': 'Delete',
      'en': 'Delete',
    },
    'mthvr63p': {
      'ko': '주간랭킹',
      'en': '',
    },
    'jolze01o': {
      'ko': '-',
      'en': '-',
    },
    'lqsd42zw': {
      'ko': '\n',
      'en': '',
    },
    'jw6d5xt7': {
      'ko': ' 포인트 ',
      'en': 'point',
    },
    'fa89fjml': {
      'ko': '월간랭킹',
      'en': '',
    },
    'e712ryoz': {
      'ko': '-',
      'en': '-',
    },
    '9edy8gqd': {
      'ko': '\n',
      'en': '',
    },
    'xqwrun0s': {
      'ko': ' 포인트 ',
      'en': 'point',
    },
    'j3js0rwz': {
      'ko': 'Hello World',
      'en': '',
    },
    's252ggsd': {
      'ko': 'Platform Navigation',
      'en': 'Platform Navigation',
    },
    'tduf5mac': {
      'ko': '메인메뉴',
      'en': 'Main Menu',
    },
    '7nkumn1c': {
      'ko': '플래너확인',
      'en': 'Check planner',
    },
    'wvirljok': {
      'ko': '시간표 관리',
      'en': 'Schedule Management',
    },
    '9je02ug5': {
      'ko': '공부시간분석',
      'en': 'Study time analysis',
    },
    '84jqczir': {
      'ko': 'Settings',
      'en': 'Settings',
    },
    'dzlqrywj': {
      'ko': '개인설정',
      'en': 'Personal Settings',
    },
    'n15fbvjn': {
      'ko': '보유 포인트 : ',
      'en': '',
    },
    'xmke1tsf': {
      'ko': ' 점 ',
      'en': '',
    },
    'e93obq9l': {
      'ko': '',
      'en': '',
    },
    'hye9vdir': {
      'ko': 'Home',
      'en': 'Home',
    },
  },
  // auth_WelcomeScreen
  {
    '5ybgx24o': {
      'ko': '로그인',
      'en': '',
    },
    'hg1kent9': {
      'ko': '회원가입',
      'en': '',
    },
    '1qbkc7pz': {
      'ko': 'V ',
      'en': '',
    },
    'pqdbx76u': {
      'ko': 'Hello World',
      'en': '',
    },
    '2uduzov3': {
      'ko': 'depolyed date : ',
      'en': '',
    },
    'ya236f0l': {
      'ko': 'Hello World',
      'en': '',
    },
    'wjl334q3': {
      'ko': 'Home',
      'en': 'Home',
    },
  },
  // auth_Create
  {
    'vwwz8e8n': {
      'ko': '회원가입',
      'en': 'join the membership',
    },
    'qey1ca7r': {
      'ko': '이메일',
      'en': 'email',
    },
    'y8ccjtbq': {
      'ko': '비밀번호',
      'en': 'password',
    },
    'm09kc2lk': {
      'ko': '비밀번호확인',
      'en': 'password',
    },
    '6ocyk9tw': {
      'ko': '2차 비밀번호(6자리)',
      'en': 'Secondary password (6 digits)',
    },
    '8sb4kwhq': {
      'ko': '학생명',
      'en': 'Student name',
    },
    '68p1h5zx': {
      'ko': '신분',
      'en': 'station in life',
    },
    'hu049jfk': {
      'ko': 'Search for an item...',
      'en': 'Search for an item...',
    },
    's179xcqi': {
      'ko': '학생',
      'en': 'student',
    },
    'bc0rgaqo': {
      'ko': '재수',
      'en': 'Good luck',
    },
    'yolq9242': {
      'ko': '공시',
      'en': 'Public notice',
    },
    'zomnxy9g': {
      'ko': '일반',
      'en': 'common',
    },
    'nhut6xey': {
      'ko': '학교명(00고등학교)',
      'en': 'School name (00 High School)',
    },
    'qsuxqay6': {
      'ko': '센터명',
      'en': 'Center name',
    },
    '0y0qbxmp': {
      'ko': 'Search for an item...',
      'en': 'Search for an item...',
    },
    'nw2l1al6': {
      'ko': '학생',
      'en': 'student',
    },
    'fcub2cim': {
      'ko': '재수',
      'en': 'Good luck',
    },
    'ahbyrhjr': {
      'ko': '공시',
      'en': 'Public notice',
    },
    'jbjpa020': {
      'ko': '일반',
      'en': 'common',
    },
    'nno0kj8l': {
      'ko': '전화번호 (ex.010-1234-5678)',
      'en': 'Student name',
    },
    'i8y86u1n': {
      'ko': '생년월일 (ex.2006/01/05)',
      'en': 'Student name',
    },
    'umvn0771': {
      'ko': '',
      'en': '',
    },
    't8krrw6p': {
      'ko': 'Create Account',
      'en': 'Create Account',
    },
    'n1x87mxb': {
      'ko': 'Home',
      'en': 'Home',
    },
  },
  // auth_Login
  {
    'wwt0hnq0': {
      'ko': '로그인하기',
      'en': 'Get to my account',
    },
    '1avlqts8': {
      'ko': 'Email Address',
      'en': 'Email Address',
    },
    'emin4cgb': {
      'ko': 'Password',
      'en': 'Password',
    },
    'gzutj348': {
      'ko': '비밀번호 찾기',
      'en': 'Forgot Password?',
    },
    'faosfaxw': {
      'ko': 'Login',
      'en': 'Login',
    },
    'mqw4h0pm': {
      'ko': 'Home',
      'en': 'Home',
    },
  },
  // auth_ForgotPassword
  {
    'jt9ln5h4': {
      'ko': '비밀번호찾기',
      'en': 'Forgot Password',
    },
    's4fd6liv': {
      'ko': '회원가입하신 이메일주소로 인증메일을 보냅니다.',
      'en': 'We will send you a reset link.',
    },
    'l1zskwdh': {
      'ko': 'Email Address',
      'en': 'Email Address',
    },
    'ukox13i6': {
      'ko': 'Send Link',
      'en': 'Send Link',
    },
    'v3vd3a6a': {
      'ko': 'Home',
      'en': 'Home',
    },
  },
  // timerPage
  {
    '0xxj46rj': {
      'ko': '타이머 시간을 클릭하여 확대가능',
      'en': '',
    },
    'm1671iaz': {
      'ko': '공부시작',
      'en': '',
    },
    'pqklq3cd': {
      'ko': '관리자 호출',
      'en': '',
    },
    'ax25wo46': {
      'ko': '일시정지',
      'en': '',
    },
    'n06wp2nl': {
      'ko': '공부중지',
      'en': '',
    },
    'wlepzmkd': {
      'ko': '현재공부기록',
      'en': 'Current study record',
    },
    '7kxuoqd1': {
      'ko': '시작시각',
      'en': 'Start time',
    },
    '5npdubtt': {
      'ko': '종료시각',
      'en': 'End time',
    },
    '0ocuuju1': {
      'ko': '공부시간',
      'en': 'Study time',
    },
    'iqmzf0xo': {
      'ko': '오늘의 공부 타임라인',
      'en': '',
    },
    'fp16p9bf': {
      'ko': 'Home',
      'en': 'Home',
    },
  },
  // backup
  {
    'yucs135q': {
      'ko': 'Page Title',
      'en': 'Page Title',
    },
    'cjz5nhl0': {
      'ko': 'Home',
      'en': 'Home',
    },
  },
  // userPage
  {
    'v6h92yl4': {
      'ko': '좌석 만료일 : ',
      'en': 'Seat Expiration Date:',
    },
    'lgn3ge75': {
      'ko': 'David.j@gmail.com',
      'en': 'David.j@gmail.com',
    },
    'pnv7vi02': {
      'ko': '포인트 확인',
      'en': 'Point Management',
    },
    '87hijuag': {
      'ko': '대표 과목 설정',
      'en': 'Setting representative subjects',
    },
    '57os1gab': {
      'ko': 'Help Center',
      'en': 'Help Center',
    },
    'y0svwee2': {
      'ko': 'Settings',
      'en': 'Settings',
    },
    '9e51q603': {
      'ko': '알림설정',
      'en': 'Notification settings',
    },
    'xsx3jlfr': {
      'ko': '잠금설정',
      'en': 'Lock settings',
    },
    'wgfti7v9': {
      'ko': '개인정보처리방침 및 이용약관',
      'en': 'Privacy Policy',
    },
    '7e88zrrv': {
      'ko': 'Log out of account',
      'en': 'Log out of account',
    },
    'hn1oqq3t': {
      'ko': 'V ',
      'en': '',
    },
    'vjtnw1a1': {
      'ko': 'Hello World',
      'en': '',
    },
    'ohdoihgz': {
      'ko': 'depolyed date : ',
      'en': '',
    },
    'sp6yx7fg': {
      'ko': 'Hello World',
      'en': '',
    },
    'drkv8ol0': {
      'ko': 'Platform Navigation',
      'en': 'Platform Navigation',
    },
    'n9z48dp1': {
      'ko': '메인메뉴',
      'en': 'Main Menu',
    },
    'i3jx9amg': {
      'ko': '플래너확인',
      'en': 'Check planner',
    },
    'ohm3agld': {
      'ko': '공부시간분석',
      'en': 'Study time analysis',
    },
    'lbgp0ie3': {
      'ko': '시간표 관리',
      'en': 'Schedule Management',
    },
    'dflh7b2r': {
      'ko': 'Settings',
      'en': 'Settings',
    },
    '8u40etk8': {
      'ko': '개인설정',
      'en': 'Personal Settings',
    },
    'efvl95d1': {
      'ko': '보유 포인트 : ',
      'en': '',
    },
    '4qq5vpef': {
      'ko': ' 점 ',
      'en': '',
    },
    'pmxd1yqp': {
      'ko': '',
      'en': '',
    },
    'z2ilxzkd': {
      'ko': 'Home',
      'en': 'Home',
    },
  },
  // Settings1Notifications
  {
    '6s11dqjv': {
      'ko': 'Settings Page',
      'en': 'Settings Page',
    },
    '8zzszftr': {
      'ko':
          'Choose what notifcations you want to recieve below and we will update the settings.',
      'en':
          'Choose what notifications you want to recieve below and we will update the settings.',
    },
    'o3p16zui': {
      'ko': 'Push Notifications',
      'en': 'Push Notifications',
    },
    'g67aklao': {
      'ko':
          'Receive Push notifications from our application on a semi regular basis.',
      'en':
          'Receive Push notifications from our application on a semi regular basis.',
    },
    'lo96ey9k': {
      'ko': 'Email Notifications',
      'en': 'Email Notifications',
    },
    'xnvktf2s': {
      'ko':
          'Receive email notifications from our marketing team about new features.',
      'en':
          'Receive email notifications from our marketing team about new features.',
    },
    'vgcm1uoc': {
      'ko': 'Location Services',
      'en': 'Location Services',
    },
    'wswdulbv': {
      'ko':
          'Allow us to track your location, this helps keep track of spending and keeps you safe.',
      'en':
          'Allow us to track your location, this helps keep track of spending and keeps you safe.',
    },
    'wltnhq1t': {
      'ko': 'Change Changes',
      'en': 'Change Changes',
    },
    'sf7fr1gp': {
      'ko': 'Home',
      'en': 'Home',
    },
  },
  // analyticsPage
  {
    'pk4vbqp0': {
      'ko': 'Home',
      'en': '',
    },
  },
  // adminSeatConfigure
  {
    'ag9ll4hs': {
      'ko': '내공관리자',
      'en': '',
    },
    's44swigz': {
      'ko': 'Platform Navigation',
      'en': '',
    },
    'q79pxdz1': {
      'ko': '플래너확인',
      'en': '',
    },
    'zxv0talx': {
      'ko': '시간표 관리',
      'en': '',
    },
    'jzkxvplf': {
      'ko': '벨 기록 조회',
      'en': '',
    },
    '058r2rd0': {
      'ko': '공부 기록 조회',
      'en': '',
    },
    '0panmh7u': {
      'ko': 'Settings',
      'en': '',
    },
    'vhx2suyi': {
      'ko': '좌석배정',
      'en': '',
    },
    '5vdirxp5': {
      'ko': '좌석변경',
      'en': '',
    },
    '3i4ft0rt': {
      'ko': '포인트 관리',
      'en': '',
    },
    '6d1gf0l7': {
      'ko': '인원추이확인',
      'en': '',
    },
    '3b5a1690': {
      'ko': '입학원서/서약서확인',
      'en': '',
    },
    'hnykkumr': {
      'ko': '좌석배정',
      'en': '',
    },
    'bkrs2gwz': {
      'ko': '학생들의 좌석을 배정해주세요',
      'en': '',
    },
    '9jf97nc8': {
      'ko': 'Select...',
      'en': '',
    },
    '73tn7mkv': {
      'ko': 'Search...',
      'en': '',
    },
    'w79t7x85': {
      'ko': 'Option 1',
      'en': '',
    },
    'h077cm7c': {
      'ko': 'Option 2',
      'en': '',
    },
    'vielfpih': {
      'ko': 'Option 3',
      'en': '',
    },
    'lub0npsf': {
      'ko': '이름',
      'en': '',
    },
    'oe5ssdb2': {
      'ko': '학교',
      'en': '',
    },
    'd7cfzvz3': {
      'ko': '등록일',
      'en': '',
    },
    'pfv9g4wj': {
      'ko': '지점',
      'en': '',
    },
    'heoadc6x': {
      'ko': '좌석배정',
      'en': '',
    },
    'mm12nq0w': {
      'ko': 'Home',
      'en': '',
    },
  },
  // adminplannerPage
  {
    '1hseyro0': {
      'ko': '플래너 확인',
      'en': '',
    },
    '5sazzl33': {
      'ko': '제출된 플래너를 승인 및 저장하세요',
      'en': '',
    },
    '6cvp4sp5': {
      'ko': '지점선택',
      'en': '',
    },
    'q1ha6inv': {
      'ko': 'Search...',
      'en': '',
    },
    'mpvjtct5': {
      'ko': 'Option 1',
      'en': '',
    },
    'l713i9hq': {
      'ko': 'Option 2',
      'en': '',
    },
    'alvdjsza': {
      'ko': 'Option 3',
      'en': '',
    },
    'aekdiqw1': {
      'ko': '이름',
      'en': '',
    },
    'mtcviyw8': {
      'ko': '좌석번호',
      'en': '',
    },
    '4h0jy67h': {
      'ko': '지점',
      'en': '',
    },
    'i6u1bcvo': {
      'ko': '제출시각',
      'en': '',
    },
    '0kx4a6xu': {
      'ko': '확인여부',
      'en': '',
    },
    'rdl2c3db': {
      'ko': '확인 인원 : ',
      'en': '',
    },
    'qlpo1r57': {
      'ko': 'Hello World',
      'en': '',
    },
    'n4j3augi': {
      'ko': '미확인 인원 : ',
      'en': '',
    },
    '7jruih3h': {
      'ko': 'Hello World',
      'en': '',
    },
    'h9d253gx': {
      'ko': '평균공부시간 : ',
      'en': '',
    },
    'l4bfka14': {
      'ko': 'Hello World',
      'en': '',
    },
    'e76b7aua': {
      'ko': 'TimeTable',
      'en': '',
    },
    'gtsnmnx7': {
      'ko': '5',
      'en': '',
    },
    '5b9m5a02': {
      'ko': '6',
      'en': '',
    },
    '4pa2zqtu': {
      'ko': '7',
      'en': '',
    },
    'l5cbscqa': {
      'ko': '8',
      'en': '',
    },
    'g392wd87': {
      'ko': '9',
      'en': '',
    },
    'se9gl50c': {
      'ko': '10',
      'en': '',
    },
    'd9be1luv': {
      'ko': '11',
      'en': '',
    },
    'vcef0iqg': {
      'ko': '12',
      'en': '',
    },
    'utyk7h74': {
      'ko': '13',
      'en': '',
    },
    'dgmw9h17': {
      'ko': '14',
      'en': '',
    },
    'i2kfjfbm': {
      'ko': '15',
      'en': '',
    },
    'na3spghj': {
      'ko': '16',
      'en': '',
    },
    'yckjqden': {
      'ko': '17',
      'en': '',
    },
    'lsir6i5j': {
      'ko': '18',
      'en': '',
    },
    'akix5oha': {
      'ko': '19',
      'en': '',
    },
    '4ewe80l6': {
      'ko': '20',
      'en': '',
    },
    'gu7eg10y': {
      'ko': '21',
      'en': '',
    },
    'cmhav4go': {
      'ko': '22',
      'en': '',
    },
    '5biq31oz': {
      'ko': '23',
      'en': '',
    },
    'yeo47jk2': {
      'ko': '24',
      'en': '',
    },
    '7zb8btun': {
      'ko': '1',
      'en': '',
    },
    '2fikcu7m': {
      'ko': '2',
      'en': '',
    },
    's55ahvu7': {
      'ko': '3',
      'en': '',
    },
    '05scjl3j': {
      'ko': '4',
      'en': '',
    },
    'dy6uhopr': {
      'ko': '내공관리자',
      'en': '',
    },
    '2zsc6a8w': {
      'ko': 'Platform Navigation',
      'en': '',
    },
    'mmes5d9x': {
      'ko': '플래너확인',
      'en': '',
    },
    'fqlg0f9q': {
      'ko': '시간표 관리',
      'en': '',
    },
    'd9jdtnmz': {
      'ko': '벨 기록 조회',
      'en': '',
    },
    '4abyfxrv': {
      'ko': '공부 기록 조회',
      'en': '',
    },
    '5qzgbu1j': {
      'ko': 'Settings',
      'en': '',
    },
    'klbp1jr1': {
      'ko': '좌석배정',
      'en': '',
    },
    '28eqswxx': {
      'ko': '좌석변경',
      'en': '',
    },
    'md5v39ew': {
      'ko': '포인트 관리',
      'en': '',
    },
    '84izfiwc': {
      'ko': '인원추이확인',
      'en': '',
    },
    '9jh2fiw9': {
      'ko': '입학원서/서약서확인',
      'en': '',
    },
    '19y03ooa': {
      'ko': 'Home',
      'en': '',
    },
  },
  // adminSeatChange
  {
    'yxg4z0bq': {
      'ko': '내공관리자',
      'en': '',
    },
    'fdfmw9o1': {
      'ko': 'Platform Navigation',
      'en': '',
    },
    'k8dx31tp': {
      'ko': '플래너확인',
      'en': '',
    },
    'uu8tvgio': {
      'ko': '시간표 관리',
      'en': '',
    },
    'ydka407d': {
      'ko': '벨 기록 조회',
      'en': '',
    },
    'nbuwit8s': {
      'ko': '공부 기록 조회',
      'en': '',
    },
    'ejauuwss': {
      'ko': 'Settings',
      'en': '',
    },
    'x5xmx2bl': {
      'ko': '좌석배정',
      'en': '',
    },
    'tsrf5m0q': {
      'ko': '좌석변경',
      'en': '',
    },
    'nuanz0qd': {
      'ko': '포인트 관리',
      'en': '',
    },
    'm6if1aju': {
      'ko': '인원추이확인',
      'en': '',
    },
    'jjphw9sf': {
      'ko': '입학원서/서약서확인',
      'en': '',
    },
    'nc4hnwd2': {
      'ko': '좌석변경',
      'en': '',
    },
    'pf122zv1': {
      'ko': '학생들의 좌석을 배정해주세요.(빨간색 버튼을 통해 배정을 취소할 경우 해당 학생은 2일간 재배정 불가)',
      'en': '',
    },
    '3alkahlo': {
      'ko': 'Select...',
      'en': '',
    },
    'oqhn20d7': {
      'ko': 'Search...',
      'en': '',
    },
    'g6ltl5ki': {
      'ko': 'Option 1',
      'en': '',
    },
    'llsri1hg': {
      'ko': 'Option 2',
      'en': '',
    },
    'ph7e9caj': {
      'ko': 'Option 3',
      'en': '',
    },
    '07h1ppri': {
      'ko': '좌석번호',
      'en': '',
    },
    'e33ty6so': {
      'ko': '학생명',
      'en': '',
    },
    '0o42zkcd': {
      'ko': '지점',
      'en': '',
    },
    '117fq338': {
      'ko': '좌석수정 / 삭제',
      'en': '',
    },
    'yx070d1u': {
      'ko': 'Home',
      'en': '',
    },
  },
  // adminPointConfigurePage
  {
    'b7gl8bg8': {
      'ko': '내공관리자',
      'en': '',
    },
    'l932eufl': {
      'ko': 'Platform Navigation',
      'en': '',
    },
    '3b03trlw': {
      'ko': '플래너확인',
      'en': '',
    },
    'u6nvgb5v': {
      'ko': '시간표 관리',
      'en': '',
    },
    '5rtxtrkj': {
      'ko': '벨 기록 조회',
      'en': '',
    },
    '174nznbh': {
      'ko': '공부 기록 조회',
      'en': '',
    },
    '6eg6ugzu': {
      'ko': 'Settings',
      'en': '',
    },
    'h0975xl1': {
      'ko': '좌석배정',
      'en': '',
    },
    'k7ogoguj': {
      'ko': '좌석변경',
      'en': '',
    },
    'rrbdik3g': {
      'ko': '포인트 관리',
      'en': '',
    },
    'ukmppdj3': {
      'ko': '인원추이확인',
      'en': '',
    },
    'av0xyp5j': {
      'ko': '입학원서/서약서확인',
      'en': '',
    },
    'tl0vm0y8': {
      'ko': '포인트 관리',
      'en': '',
    },
    'fu50h7df': {
      'ko': '지점 및 좌석을 입력 후 검색해주세요',
      'en': '',
    },
    'jff0atkx': {
      'ko': '지점선택',
      'en': '',
    },
    'tpvht1pe': {
      'ko': 'Search...',
      'en': '',
    },
    'ousujg1a': {
      'ko': 'Option 1',
      'en': '',
    },
    'f8hyslll': {
      'ko': 'Option 2',
      'en': '',
    },
    'a79jvvez': {
      'ko': 'Option 3',
      'en': '',
    },
    'fqp5p5of': {
      'ko': '좌석번호 :',
      'en': '',
    },
    'smpn7pt2': {
      'ko': '',
      'en': '',
    },
    'uydav5rf': {
      'ko': '좌석번호',
      'en': '',
    },
    'xonku1zk': {
      'ko': '학생명',
      'en': '',
    },
    '8so0jhca': {
      'ko': '현재 점수',
      'en': '',
    },
    'fi1brrzh': {
      'ko': '포인트 부여/차감',
      'en': '',
    },
    '5nwa05uf': {
      'ko': '기록조회',
      'en': '',
    },
    '28rf7q7f': {
      'ko': 'Home',
      'en': '',
    },
  },
  // studentAnalytics
  {
    '13yjsbxt': {
      'ko': '누적공부시간',
      'en': '',
    },
    'jlly85ps': {
      'ko': ' ~ ',
      'en': '',
    },
    'lqchyss9': {
      'ko': 'Hello World',
      'en': '',
    },
    'i8bkbhec': {
      'ko': 'Hello World',
      'en': '',
    },
    '6yefnez7': {
      'ko': '나의 공부시간',
      'en': '',
    },
    'iflkfokv': {
      'ko': '기간 총 공부시간',
      'en': '',
    },
    'q1yej4bm': {
      'ko': '\n\n',
      'en': '',
    },
    'mhnw67ml': {
      'ko': '평균공부시간',
      'en': '',
    },
    'jgksdpjo': {
      'ko': '\n\n',
      'en': '',
    },
    'kfmjghpu': {
      'ko': '내공 평균 공부시간',
      'en': '',
    },
    'mrsd919y': {
      'ko': '기간 총 공부시간',
      'en': '',
    },
    'fhgycqst': {
      'ko': '\n\n',
      'en': '',
    },
    'bb5fuw8s': {
      'ko': '데이터 수집중...',
      'en': '',
    },
    'sdxtp42a': {
      'ko': '평균공부시간',
      'en': '',
    },
    'g390y24s': {
      'ko': '\n\n',
      'en': '',
    },
    'nxoioc9e': {
      'ko': '데이터 수집중...',
      'en': '',
    },
    '4anifbmv': {
      'ko': 'Home',
      'en': '',
    },
  },
  // setBestColorPage
  {
    'q96uyd25': {
      'ko': 'TextField',
      'en': '',
    },
    'p546677a': {
      'ko': 'colorpicker',
      'en': '',
    },
    '32rx88xv': {
      'ko': 'save',
      'en': '',
    },
    'u8zbcxg0': {
      'ko': 'Page Title',
      'en': '',
    },
    'ioxwd1ek': {
      'ko': 'Home',
      'en': '',
    },
  },
  // pageeee
  {
    '4t3g5d59': {
      'ko': 'Platform Navigation',
      'en': '',
    },
    'xo08j24a': {
      'ko': '메인메뉴',
      'en': '',
    },
    '1dl3o6ls': {
      'ko': '플래너확인',
      'en': '',
    },
    'xkumutni': {
      'ko': '공부시간분석',
      'en': '',
    },
    'wcgnbbjx': {
      'ko': '시간표 관리',
      'en': '',
    },
    'pmetb3iw': {
      'ko': 'Settings',
      'en': '',
    },
    'zgmkf3a2': {
      'ko': '개인설정',
      'en': '',
    },
    'hqrq48id': {
      'ko': '보유 포인트 : ',
      'en': '',
    },
    'srpozm5v': {
      'ko': ' 점 ',
      'en': '',
    },
    '1b3h5u9l': {
      'ko': '',
      'en': '',
    },
    '7mbntnn0': {
      'ko': '수면시각 : ',
      'en': '',
    },
    'tngtwzm4': {
      'ko': '기상시각 : ',
      'en': '',
    },
    '074bs2m3': {
      'ko': '목표공부시간 : ',
      'en': '',
    },
    't4167kpj': {
      'ko': '현재공부시간 : ',
      'en': '',
    },
    'lpr2o7f4': {
      'ko': '※ 날짜 텍스트를 스와이프하거나 time table 좌측 캘린더 버튼을 클릭하여 날짜 변경',
      'en': '',
    },
    'rnhw2tjz': {
      'ko': 'TO DO LIST',
      'en': '',
    },
    'v23o1msf': {
      'ko': 'STUDY PLAN',
      'en': '',
    },
    '0l4ewjpy': {
      'ko': 'SUB',
      'en': '',
    },
    '0hi9xmog': {
      'ko': 'click!',
      'en': '',
    },
    'p8qs7y62': {
      'ko': 'TimeTable',
      'en': '',
    },
    '7lv7ybg6': {
      'ko': '5',
      'en': '',
    },
    '09esbp58': {
      'ko': '6',
      'en': '',
    },
    'wvut6nhm': {
      'ko': '7',
      'en': '',
    },
    '1kc8ga7d': {
      'ko': '8',
      'en': '',
    },
    'qaj4uocp': {
      'ko': '9',
      'en': '',
    },
    'm437mwys': {
      'ko': '10',
      'en': '',
    },
    'i0f3j9x7': {
      'ko': '11',
      'en': '',
    },
    '9oxtcuoz': {
      'ko': '12',
      'en': '',
    },
    'b0udfzo8': {
      'ko': '13',
      'en': '',
    },
    'bvsoktuz': {
      'ko': '14',
      'en': '',
    },
    'vbanbl5d': {
      'ko': '15',
      'en': '',
    },
    'fjrw3dgd': {
      'ko': '16',
      'en': '',
    },
    'y5z9alkb': {
      'ko': '17',
      'en': '',
    },
    '056dfs2h': {
      'ko': '18',
      'en': '',
    },
    '6yjwdhib': {
      'ko': '19',
      'en': '',
    },
    'r76pvops': {
      'ko': '20',
      'en': '',
    },
    'v8go3tpw': {
      'ko': '21',
      'en': '',
    },
    'esm3izmk': {
      'ko': '22',
      'en': '',
    },
    'ygmi6gxp': {
      'ko': '23',
      'en': '',
    },
    'ubo4flsd': {
      'ko': '24',
      'en': '',
    },
    'sq7291r8': {
      'ko': '1',
      'en': '',
    },
    'vrjih96j': {
      'ko': '2',
      'en': '',
    },
    'b5k930ju': {
      'ko': '3',
      'en': '',
    },
    'yamsvc8f': {
      'ko': '4',
      'en': '',
    },
    'ioc3p4ch': {
      'ko': 'Memo',
      'en': '',
    },
    'j5vg4i41': {
      'ko': 'To do List 추가하기',
      'en': '',
    },
    'k7zyg131': {
      'ko': 'Home',
      'en': '',
    },
  },
  // alertAdmin
  {
    'd6u9l7dv': {
      'ko': 'Home',
      'en': 'Home',
    },
  },
  // timetablePage
  {
    'duobsg94': {
      'ko': '현재시간표',
      'en': '',
    },
    'dtiio5ez': {
      'ko': '현재시간표',
      'en': '',
    },
    'timdqg2t': {
      'ko': '예비시간표',
      'en': '',
    },
    'kdqi8ahr': {
      'ko': '최종수정요청 : ',
      'en': '',
    },
    'un7fo5cv': {
      'ko': '수정하기',
      'en': '',
    },
    'atjmaz3i': {
      'ko': '메인메뉴',
      'en': '',
    },
    '5t8x1p0k': {
      'ko': '플래너 확인',
      'en': '',
    },
    '632yacbg': {
      'ko': '시간표 관리',
      'en': '',
    },
    'j8brr6ar': {
      'ko': '공부 시간 분석',
      'en': '',
    },
    '3xcaphp0': {
      'ko': '개인설정',
      'en': '',
    },
    'a6dz28oy': {
      'ko': '잠금 모드',
      'en': '',
    },
    'vyfq37do': {
      'ko': 'Home',
      'en': '',
    },
  },
  // updatePage
  {
    'oxycfcc7': {
      'ko': '새로운 버전이 출시되었습니다.\n \n아래 버튼을 클릭하여 업데이트 해주시기 바랍니다.',
      'en': '',
    },
    '46lwej9a': {
      'ko': 'Hello World',
      'en': '',
    },
    '5003ox0p': {
      'ko': '업데이트 다운로드',
      'en': '',
    },
    '0edq8b30': {
      'ko': 'Home',
      'en': 'Home',
    },
  },
  // temporaryLockPage
  {
    '9za1h10s': {
      'ko': 'Home',
      'en': '',
    },
  },
  // HomePageCopy
  {
    'pdwh6g71': {
      'ko': '메인메뉴',
      'en': '',
    },
    'i870shre': {
      'ko': '플래너 확인',
      'en': '',
    },
    '8y8mspi2': {
      'ko': '시간표 관리',
      'en': '',
    },
    'l0r1wwmh': {
      'ko': '공부 시간 분석',
      'en': '',
    },
    'or43ofsm': {
      'ko': '개인설정',
      'en': '',
    },
    'geg13jzi': {
      'ko': '잠금 모드',
      'en': '',
    },
    'o00m6sd1': {
      'ko': '이름 : ',
      'en': '',
    },
    'r8zn3ymp': {
      'ko': '학교 : ',
      'en': '',
    },
    '5ifjvw5y': {
      'ko': '좌석번호 : ',
      'en': '',
    },
    'hrghuwyz': {
      'ko': '현재 포인트 : ',
      'en': '',
    },
    'u608628s': {
      'ko': 'Delete',
      'en': 'Delete',
    },
    'pqfruw6e': {
      'ko': '오늘의 일정',
      'en': '',
    },
    'lat45cie': {
      'ko': ' ~ ',
      'en': '',
    },
    'eew66nxm': {
      'ko': '주간누적랭킹',
      'en': '',
    },
    'i0nmm845': {
      'ko': '-',
      'en': '-',
    },
    '5tct3xec': {
      'ko': '\n',
      'en': '',
    },
    '2n8gdm6q': {
      'ko': ' 포인트 ',
      'en': 'point',
    },
    '9mfhd79x': {
      'ko': '월간누적랭킹',
      'en': '',
    },
    'ui6k8aou': {
      'ko': '-',
      'en': '-',
    },
    '3fiilhrf': {
      'ko': '\n',
      'en': '',
    },
    'mza6dgeq': {
      'ko': ' 포인트 ',
      'en': 'point',
    },
    '7zn7orh7': {
      'ko': '대표과목관리',
      'en': '',
    },
    '9fr38uxp': {
      'ko': '선생님 코멘트가 도착했어요!\n 메세지를 눌러 확인해봅시다!',
      'en': '',
    },
    's51l1lrn': {
      'ko': 'Home',
      'en': 'Home',
    },
  },
  // secondpinPage
  {
    'wigbn9b2': {
      'ko': 'Home',
      'en': '',
    },
  },
  // timetableSelectPage
  {
    '0yfybq73': {
      'ko': '시간표 이름',
      'en': '',
    },
    'wqm8vqtk': {
      'ko': '시간표 이름을 입력해주세요',
      'en': '',
    },
    '1ygpt9lh': {
      'ko': '시간표 수정',
      'en': '',
    },
    '9fv2nec7': {
      'ko': '월',
      'en': '',
    },
    'up1ygl1o': {
      'ko': '화',
      'en': '',
    },
    'nf6t0636': {
      'ko': '수',
      'en': '',
    },
    'p3tme2nd': {
      'ko': '목',
      'en': '',
    },
    'y5dsjazi': {
      'ko': '금',
      'en': '',
    },
    '3sbf16fm': {
      'ko': '토',
      'en': '',
    },
    'zugdrp56': {
      'ko': '일',
      'en': '',
    },
    '6uzpsd9z': {
      'ko': '미등원요일 선택',
      'en': '',
    },
    '7rp9v06c': {
      'ko': '등원시각 : ',
      'en': '',
    },
    'n4t9xgvd': {
      'ko': '하원시각 : ',
      'en': '',
    },
    '3lxkwjpm': {
      'ko': '외출관리',
      'en': '',
    },
    'lre3m1jr': {
      'ko': ' ~ ',
      'en': '',
    },
    'ozstzayn': {
      'ko': ' 저장',
      'en': '',
    },
    'a2kg5pes': {
      'ko': '임시저장',
      'en': '',
    },
    'jcxnh2op': {
      'ko': '취소',
      'en': '',
    },
    'q5kt71za': {
      'ko': 'Home',
      'en': '',
    },
  },
  // adminpmCallCheck
  {
    '8nio18v9': {
      'ko': '내공관리자',
      'en': '',
    },
    'qg0m52yi': {
      'ko': 'Platform Navigation',
      'en': '',
    },
    'ssqwjqrb': {
      'ko': '플래너확인',
      'en': '',
    },
    'akgor6nq': {
      'ko': '시간표 관리',
      'en': '',
    },
    'uwlhepqx': {
      'ko': '벨 기록 조회',
      'en': '',
    },
    'j29415kw': {
      'ko': '공부 기록 조회',
      'en': '',
    },
    'oc9rq4yw': {
      'ko': 'Settings',
      'en': '',
    },
    '4aqnfaz9': {
      'ko': '좌석배정',
      'en': '',
    },
    'aujlavrk': {
      'ko': '좌석변경',
      'en': '',
    },
    '71twlbpj': {
      'ko': '포인트 관리',
      'en': '',
    },
    '3dgnof1h': {
      'ko': '인원추이확인',
      'en': '',
    },
    'v9cbxylk': {
      'ko': '입학원서/서약서확인',
      'en': '',
    },
    'xcmleteh': {
      'ko': '벨관리',
      'en': '',
    },
    'ukp6kp9m': {
      'ko': '제출된 플래너를 승인 및 저장하세요',
      'en': '',
    },
    '9ab2omdr': {
      'ko': '지점선택',
      'en': '',
    },
    'jzh69w7l': {
      'ko': 'Search...',
      'en': '',
    },
    'jvp47s2s': {
      'ko': 'Option 1',
      'en': '',
    },
    '5x2inphd': {
      'ko': 'Option 2',
      'en': '',
    },
    '399nys0n': {
      'ko': 'Option 3',
      'en': '',
    },
    'lakcjl3i': {
      'ko': '좌석번호 :',
      'en': '',
    },
    'vcjed6kj': {
      'ko': '',
      'en': '',
    },
    'v32tlz80': {
      'ko': '좌석번호',
      'en': '',
    },
    'y0vuu8jk': {
      'ko': '호출시각',
      'en': '',
    },
    'd101rnaz': {
      'ko': '사유',
      'en': '',
    },
    'ujkum5nm': {
      'ko': 'Home',
      'en': '',
    },
  },
  // adminpmStudyCheck
  {
    '88rnnmbj': {
      'ko': '공부기록확인',
      'en': '',
    },
    '220267jy': {
      'ko': '지점선택',
      'en': '',
    },
    'n3bmazu9': {
      'ko': 'Search...',
      'en': '',
    },
    '6lh6jjsb': {
      'ko': 'Option 1',
      'en': '',
    },
    'wp6808if': {
      'ko': 'Option 2',
      'en': '',
    },
    'm1qt4f4i': {
      'ko': 'Option 3',
      'en': '',
    },
    '4xma37dh': {
      'ko': '좌석번호 :',
      'en': '',
    },
    'h1jmcvv3': {
      'ko': '',
      'en': '',
    },
    'qifx3f76': {
      'ko': '이름',
      'en': '',
    },
    'ino429lw': {
      'ko': '좌석번호',
      'en': '',
    },
    'f7z7dm64': {
      'ko': '지점',
      'en': '',
    },
    'nzo66gup': {
      'ko': '내공관리자',
      'en': '',
    },
    'rf3qf7wn': {
      'ko': 'Platform Navigation',
      'en': '',
    },
    'a5vm4bzn': {
      'ko': '플래너확인',
      'en': '',
    },
    'otdwqp7m': {
      'ko': '시간표 관리',
      'en': '',
    },
    'pglxkct5': {
      'ko': '벨 기록 조회',
      'en': '',
    },
    'b2mzusft': {
      'ko': '공부 기록 조회',
      'en': '',
    },
    'j8ruo44m': {
      'ko': 'Settings',
      'en': '',
    },
    'ygz0u0ia': {
      'ko': '좌석배정',
      'en': '',
    },
    'nm6iqvwt': {
      'ko': '좌석변경',
      'en': '',
    },
    '0dekp940': {
      'ko': '포인트 관리',
      'en': '',
    },
    'regnv68k': {
      'ko': '인원추이확인',
      'en': '',
    },
    'ge581bcz': {
      'ko': '입학원서/서약서확인',
      'en': '',
    },
    'ox6nncxv': {
      'ko': 'Home',
      'en': '',
    },
  },
  // adminTimeTablePage
  {
    't36wb2ia': {
      'ko': '내공관리자',
      'en': '',
    },
    '57huntg0': {
      'ko': 'Platform Navigation',
      'en': '',
    },
    'npvt1a0t': {
      'ko': '플래너확인',
      'en': '',
    },
    'y88r1ve4': {
      'ko': '시간표 관리',
      'en': '',
    },
    '7vhvb5w6': {
      'ko': '벨 기록 조회',
      'en': '',
    },
    '00bjmqo8': {
      'ko': '공부 기록 조회',
      'en': '',
    },
    'vy5fyf9x': {
      'ko': 'Settings',
      'en': '',
    },
    '2idh2mwe': {
      'ko': '좌석배정',
      'en': '',
    },
    '52ho5m6e': {
      'ko': '좌석변경',
      'en': '',
    },
    'as8577xs': {
      'ko': '포인트 관리',
      'en': '',
    },
    'bwqhdbut': {
      'ko': '입학원서/서약서확인',
      'en': '',
    },
    'fv8fuza4': {
      'ko': '시간표 관리',
      'en': '',
    },
    'hcahx2xk': {
      'ko': '제출된 플래너를 승인 및 저장하세요',
      'en': '',
    },
    'hk6omc6r': {
      'ko': '지점선택',
      'en': '',
    },
    'u56wj3wr': {
      'ko': 'Search...',
      'en': '',
    },
    '8o5fpgy5': {
      'ko': 'Option 1',
      'en': '',
    },
    'g3bx0zc1': {
      'ko': 'Option 2',
      'en': '',
    },
    'c48dn9qs': {
      'ko': 'Option 3',
      'en': '',
    },
    'ha10m6yi': {
      'ko': '좌석번호 :',
      'en': '',
    },
    'baepb3zk': {
      'ko': '',
      'en': '',
    },
    'uoquoty1': {
      'ko': '이름',
      'en': '',
    },
    'g7aob9j3': {
      'ko': '좌석번호',
      'en': '',
    },
    '58m5j8m5': {
      'ko': '수정요청',
      'en': '',
    },
    '0mq1fir5': {
      'ko': '요청일자',
      'en': '',
    },
    'sltp25ck': {
      'ko': '시간표 수정',
      'en': '',
    },
    'kdpyrpog': {
      'ko': '현재시간표',
      'en': '',
    },
    '16yigoix': {
      'ko': '시간표 변경승인',
      'en': '',
    },
    'odl8z9ln': {
      'ko': '변경요청시간표',
      'en': '',
    },
    'kkdlid1u': {
      'ko': '시간표 수정',
      'en': '',
    },
    'pytjxmun': {
      'ko': '월',
      'en': '',
    },
    'zrggxxv0': {
      'ko': '월',
      'en': '',
    },
    'fu2zj6z9': {
      'ko': '화',
      'en': '',
    },
    'xv284ffl': {
      'ko': '수',
      'en': '',
    },
    'pn3476ux': {
      'ko': '목',
      'en': '',
    },
    'x2hwtzh3': {
      'ko': '금',
      'en': '',
    },
    'oyz5w9zh': {
      'ko': '토',
      'en': '',
    },
    '36q600yo': {
      'ko': '일',
      'en': '',
    },
    '7eeffcoi': {
      'ko': '미등원요일 선택',
      'en': '',
    },
    's91totye': {
      'ko': '등원시각 : ',
      'en': '',
    },
    's6tsnu8i': {
      'ko': '하원시각 : ',
      'en': '',
    },
    'b8j54r7x': {
      'ko': '외출관리',
      'en': '',
    },
    '7gvh667o': {
      'ko': ' ~ ',
      'en': '',
    },
    'cfbu765v': {
      'ko': ' 저장',
      'en': '',
    },
    'gggtxa3s': {
      'ko': '취소',
      'en': '',
    },
    'qb4aob49': {
      'ko': 'Home',
      'en': '',
    },
  },
  // masterSpotCheckPage
  {
    'v0diauai': {
      'ko': '내공관리자',
      'en': '',
    },
    'f1tgrjqd': {
      'ko': 'Platform Navigation',
      'en': '',
    },
    'y2g592fw': {
      'ko': '플래너확인',
      'en': '',
    },
    'qy0iw6o1': {
      'ko': '시간표 관리',
      'en': '',
    },
    '1lllw3ag': {
      'ko': '벨 기록 조회',
      'en': '',
    },
    '6ttlopjf': {
      'ko': '공부 기록 조회',
      'en': '',
    },
    '8un5jkb4': {
      'ko': 'Settings',
      'en': '',
    },
    'zn0czrl8': {
      'ko': '좌석배정',
      'en': '',
    },
    'jgte8mbm': {
      'ko': '좌석변경',
      'en': '',
    },
    '7jk5r5u6': {
      'ko': '포인트 관리',
      'en': '',
    },
    '5p9h8yf1': {
      'ko': '벨관리',
      'en': '',
    },
    '9xy9gnx0': {
      'ko': '제출된 플래너를 승인 및 저장하세요',
      'en': '',
    },
    'qj63v9o7': {
      'ko': '지점선택',
      'en': '',
    },
    'upe8wp1l': {
      'ko': 'Search...',
      'en': '',
    },
    '0djxe0w8': {
      'ko': 'Option 1',
      'en': '',
    },
    'zhcd0eyk': {
      'ko': 'Option 2',
      'en': '',
    },
    'oaxait5d': {
      'ko': 'Option 3',
      'en': '',
    },
    'q8i4xsh4': {
      'ko': '좌석번호 :',
      'en': '',
    },
    'kjzbiw5o': {
      'ko': '',
      'en': '',
    },
    'riutybcj': {
      'ko': 'Home',
      'en': '',
    },
  },
  // adminCostCheck
  {
    '3cxyo0xa': {
      'ko': '내공관리자',
      'en': '',
    },
    'iksl6b7j': {
      'ko': 'Platform Navigation',
      'en': '',
    },
    'q1ds7xdu': {
      'ko': '플래너확인',
      'en': '',
    },
    '4nq7es0s': {
      'ko': '시간표 관리',
      'en': '',
    },
    'ailn8ppf': {
      'ko': '벨 기록 조회',
      'en': '',
    },
    'f5x2ejzc': {
      'ko': '공부 기록 조회',
      'en': '',
    },
    '0en3x5ap': {
      'ko': 'Settings',
      'en': '',
    },
    'wylv2r2s': {
      'ko': '좌석배정',
      'en': '',
    },
    'l4931dr2': {
      'ko': '좌석변경',
      'en': '',
    },
    'b8e7kile': {
      'ko': '포인트 관리',
      'en': '',
    },
    'gxcs1hts': {
      'ko': '인원추이확인',
      'en': '',
    },
    'gk5md4b7': {
      'ko': '입학원서/서약서확인',
      'en': '',
    },
    'a95cnl9g': {
      'ko': '인원 추이 확인',
      'en': '',
    },
    'wru27lmi': {
      'ko': '제출된 플래너를 승인 및 저장하세요',
      'en': '',
    },
    'rbxql3w6': {
      'ko': '지점선택',
      'en': '',
    },
    'v660yd18': {
      'ko': 'Search...',
      'en': '',
    },
    'dzxbztcn': {
      'ko': 'Option 1',
      'en': '',
    },
    'f8b83jt6': {
      'ko': 'Option 2',
      'en': '',
    },
    'e8k3ppma': {
      'ko': 'Option 3',
      'en': '',
    },
    't461l025': {
      'ko': '날짜',
      'en': '',
    },
    'm8nc2ogc': {
      'ko': '인원',
      'en': '',
    },
    'qby113qm': {
      'ko': '해당기간 총 인원 : ',
      'en': '',
    },
    '34myvm76': {
      'ko': '명',
      'en': '',
    },
    'anglcah8': {
      'ko': 'Hello World',
      'en': '',
    },
    '58817j7f': {
      'ko': '해당기간 총 비용 : ',
      'en': '',
    },
    'dfxrnmxz': {
      'ko': '원',
      'en': '',
    },
    'hqw945nf': {
      'ko': 'Hello World',
      'en': '',
    },
    '8mixzpcr': {
      'ko': '원하는 날짜를 클릭하여 상세보기',
      'en': '',
    },
    'b3wxods2': {
      'ko': 'Home',
      'en': '',
    },
  },
  // sign2
  {
    '1jy7x0yz': {
      'ko': '(주) 내공 관리형 스터디카페 입학원서',
      'en': '',
    },
    '9073ofsa': {
      'ko': '저장하기',
      'en': '',
    },
    't0yhzsz3': {
      'ko': '  ■ 학생 이름',
      'en': '',
    },
    'bc94ssvx': {
      'ko': '  ■ 생년월일',
      'en': '',
    },
    'fpz70zzn': {
      'ko': '  ■ 학교/학년',
      'en': '',
    },
    'fqmvhrp3': {
      'ko': '/',
      'en': '',
    },
    'jdzom8jl': {
      'ko': '학년',
      'en': '',
    },
    'li5lcey3': {
      'ko': '  ■ 전화번호',
      'en': '',
    },
    '1om08q88': {
      'ko': '  ■ 주소',
      'en': '',
    },
    '57jbto54': {
      'ko': '  ■ 학부모 연락처',
      'en': '',
    },
    'awo3vuoz': {
      'ko': '부',
      'en': '',
    },
    '12gf1pj9': {
      'ko': '모',
      'en': '',
    },
    'lib64k6o': {
      'ko': ' ■ 공부목적',
      'en': '',
    },
    '6cjyaxjl': {
      'ko': '세부선택항목',
      'en': '',
    },
    '0e6rgnhv': {
      'ko': '수능',
      'en': '',
    },
    'rxwvye3c': {
      'ko': '수시',
      'en': '',
    },
    '6pl1xb7h': {
      'ko': '    -   ',
      'en': '',
    },
    'ym6z736s': {
      'ko': '희망 전형',
      'en': '',
    },
    '8pyxxmoc': {
      'ko': 'Search...',
      'en': '',
    },
    'yfwdo193': {
      'ko': '논술',
      'en': '',
    },
    'n6cfkisp': {
      'ko': '학종',
      'en': '',
    },
    'xsfz2dfs': {
      'ko': '교과',
      'en': '',
    },
    'jaa91ku3': {
      'ko': '정시',
      'en': '',
    },
    '2okycx1j': {
      'ko': '공시',
      'en': '',
    },
    'qm6l2h7e': {
      'ko': '준비 중인 시험 혹은 목표를 입력해주세요.',
      'en': '',
    },
    'j6upbljh': {
      'ko': '기타',
      'en': '',
    },
    '8hhttlll': {
      'ko': '준비 중인 시험 혹은 목표를 입력해주세요.',
      'en': '',
    },
    's242j6ny': {
      'ko': '  ■ 수능 선택 과목 및 현재 등급',
      'en': '',
    },
    'y8c1jdqs': {
      'ko': '영역',
      'en': '',
    },
    'fmx1vls3': {
      'ko': '선택 과목 / 응시 여부',
      'en': '',
    },
    '0pt33njc': {
      'ko': '현재 등급',
      'en': '',
    },
    '0umrtsn8': {
      'ko': '국어',
      'en': '',
    },
    'fbt3lv5y': {
      'ko': '선택 과목',
      'en': '',
    },
    '3fbhn8n7': {
      'ko': 'Search...',
      'en': '',
    },
    'lzyt9niw': {
      'ko': '언어와 매체',
      'en': '',
    },
    '11oirrbe': {
      'ko': '화법과 작문',
      'en': '',
    },
    'f9e9ylo7': {
      'ko': '( )',
      'en': '',
    },
    '80gavln9': {
      'ko': '등급',
      'en': '',
    },
    'cqpzoa7o': {
      'ko': '수학',
      'en': '',
    },
    'tthmbnik': {
      'ko': '선택 과목',
      'en': '',
    },
    'glqbqogd': {
      'ko': 'Search...',
      'en': '',
    },
    '4m41u1og': {
      'ko': '미적분',
      'en': '',
    },
    't8322btx': {
      'ko': '확률과 통계',
      'en': '',
    },
    'a3uuhn8x': {
      'ko': '기하',
      'en': '',
    },
    '2ofykl7y': {
      'ko': '( )',
      'en': '',
    },
    'cgqp16fd': {
      'ko': '등급',
      'en': '',
    },
    'bsh4n9lj': {
      'ko': '탐구1',
      'en': '',
    },
    'm8ljcl07': {
      'ko': '탐구',
      'en': '',
    },
    '0g5vxyqv': {
      'ko': 'Search...',
      'en': '',
    },
    '4jajst8o': {
      'ko': '사탐',
      'en': '',
    },
    'rmtn7xji': {
      'ko': '과탐',
      'en': '',
    },
    'l30708ew': {
      'ko': '선택 과목',
      'en': '',
    },
    'obv2l26g': {
      'ko': 'Search...',
      'en': '',
    },
    '6r4ys3q3': {
      'ko': '사탐',
      'en': '',
    },
    '0k60s9qv': {
      'ko': '과탐',
      'en': '',
    },
    'ap16qw3f': {
      'ko': '( )',
      'en': '',
    },
    '668wp9iz': {
      'ko': '등급',
      'en': '',
    },
    '9dzxabn9': {
      'ko': '영역',
      'en': '',
    },
    'v8wk09nj': {
      'ko': '선택 과목 / 응시 여부',
      'en': '',
    },
    '390nrhdx': {
      'ko': '현재 등급',
      'en': '',
    },
    '1ki5ov9p': {
      'ko': '영어',
      'en': '',
    },
    'y4yenhj4': {
      'ko': '응시 여부',
      'en': '',
    },
    '345tmx80': {
      'ko': 'Search...',
      'en': '',
    },
    'tb460ysg': {
      'ko': '응시',
      'en': '',
    },
    'kvwjh8ma': {
      'ko': '미응시',
      'en': '',
    },
    'rph141f6': {
      'ko': '( )',
      'en': '',
    },
    '7vnnzzcp': {
      'ko': '등급',
      'en': '',
    },
    'a62i6p1l': {
      'ko': '한국사',
      'en': '',
    },
    '0sr3959g': {
      'ko': '응시 여부',
      'en': '',
    },
    'mqlhkn5z': {
      'ko': 'Search...',
      'en': '',
    },
    'z06mlmhe': {
      'ko': '응시',
      'en': '',
    },
    'ozxyb7bi': {
      'ko': '미응시',
      'en': '',
    },
    'hq1opmfc': {
      'ko': '( )',
      'en': '',
    },
    '2epzmgy8': {
      'ko': '등급',
      'en': '',
    },
    'sl05asyn': {
      'ko': '탐구2',
      'en': '',
    },
    'g1gzj1hg': {
      'ko': '탐구',
      'en': '',
    },
    'rsphbuzi': {
      'ko': 'Search...',
      'en': '',
    },
    '1ktmqw2d': {
      'ko': '사탐',
      'en': '',
    },
    'r8jqcdrl': {
      'ko': '과탐',
      'en': '',
    },
    'poo4e56l': {
      'ko': '선택 과목',
      'en': '',
    },
    'm0491tuv': {
      'ko': 'Search...',
      'en': '',
    },
    '0opk541k': {
      'ko': '사탐',
      'en': '',
    },
    'o56mccei': {
      'ko': '과탐',
      'en': '',
    },
    'o89xoabt': {
      'ko': '( )',
      'en': '',
    },
    'pm42ryqr': {
      'ko': '등급',
      'en': '',
    },
    '9000opwv': {
      'ko': '  ■ 부가 학습 프로그램',
      'en': '',
    },
    'yfsikrh7': {
      'ko': '컨설팅 여부',
      'en': '',
    },
    '39ttb9pt': {
      'ko': '플래너 코칭',
      'en': '',
    },
    '81djegnk': {
      'ko': '[㈜내공관리형 스터디카페 환불규정] ',
      'en': '',
    },
    'gm4tizdc': {
      'ko':
          '▪ 환불 방식\n    - 환불 금액 = 결제 금액 – 위약금 (총 결제금액의 10% 또는 20%) − (총 이용일 수 × 19300원) *19300원 = 기본 일일사용 금액 \n    - 이용일 수는 이용 시작일 기준으로 계산되며, 1일이라도 이용 시 하루로 간주됩니다. \n▪ 위약금 기준\n   - 전체 기간권 공통 (1개월/2개월권에 해당): 총 결제 금액의 10%\n   - 3개월 이상 장기권의 해지 시 혜택 남용 방지를 위해 별도 위약금(10%)이 가산 적용됩니다. \n▪ 기타 \n  - 본 환불 규정은 공정거래위원회 소비자분쟁해결기준을 준수합니다. \n  - 결제 시 본 규정에 동의한 것으로 간주되며, 환불 요청 시 본 내용이 적용됩니다. \n  - 예약금은 좌석을 미리 확보하기 위한 금액으로, 결제 시 총 이용요금에서 미리 제외하고 나머지 금액만 결제하시면 됩니다. \n  - 환불 요청 시에는 예약금을 포함한 전체 금액을 기준으로 위약금과 사용일 요금을 계산하며, 예약금은 환불되지 않습니다. ',
      'en': '',
    },
    'mv4lv98q': {
      'ko':
          '* 사용자가 서약서 사항 위반하여 벌점이 20점 이상 누적되어 강제 퇴실 되는 경우, 수강료는 환불되지 않습니다. \n* 총 사용 기간은 총 기간권 중의 총 사용 일수를 말하며, 반환 금액의 산정은 반환사유가 발생한 날까지 경과된 사용 시간을 기준으로 합니다. \n* 기간권 정지는 원칙적으로 불가능합니다. \n   (단, 입원 등 상당한 사유발생시에는 사유 제출 후 최고 관리자 승인 여부에 따라 최대 7일간 기간연장 (확인서 및 진단서 필수지참)',
      'en': '',
    },
    'ktsoxrcu': {
      'ko': '결제 전 본 내용에 대해 고지 및 설명을 받았으며, 이에 동의합니다',
      'en': '',
    },
    'o1m7axi3': {
      'ko': '사용자 서명 :   ',
      'en': '',
    },
    '792x4cl4': {
      'ko': '(서명)',
      'en': '',
    },
    'ocxath8z': {
      'ko': '보호자 서명 :   ',
      'en': '',
    },
    'w7cegmt7': {
      'ko': '(서명)',
      'en': '',
    },
    'c8eh2tyw': {
      'ko': 'Home',
      'en': '',
    },
  },
  // secureSignPage
  {
    'eq39oyn2': {
      'ko': '㈜내공관리형스터디카페 등록서약서',
      'en': '',
    },
    'ztq37ske': {
      'ko': '저장하기',
      'en': '',
    },
    'w6y6fca0': {
      'ko': '▪학생 이름: ',
      'en': '',
    },
    'm6il66px': {
      'ko': 'TextField',
      'en': '',
    },
    'v4p5zi46': {
      'ko': '▪연락처: ',
      'en': '',
    },
    'rspjh83r': {
      'ko': 'TextField',
      'en': '',
    },
    'g2zei2lx': {
      'ko': '▪생년월일(앞8자리): ',
      'en': '',
    },
    '2y6b5xco': {
      'ko': 'TextField',
      'en': '',
    },
    '90rrue1u': {
      'ko': '상기 본인은 내공관리형스터디카페 등록과 동시에 아래 사항을 숙지하고, \n이를 철저히 준수할 것을 서약합니다. ',
      'en': '',
    },
    'tn8he3we': {
      'ko': '서약사항',
      'en': '',
    },
    'yqvent14': {
      'ko':
          '▪본인은 학업 성적 향상에 최선의 노력을 다하겠습니다. \n\n\n▪내공스터디카페의 모든 규칙을 성실히 준수하고, 관리자 통제를 따르겠습니다. \n\n\n▪스터디카페 내 에티켓을 준수하고 타인에게 피해를 주지 않겠습니다. \n\n\n▪규칙 위반 및 통제 불응, 벌점 누적 시 퇴실 조치에 이의를 제기하지 않으며,  \n\n\n▪등록 후 환불 및 양도는 규정에 따르며, 이의 제기를 하지 않겠습니다. \n\n\n▪등록과 운영을 위한 최소한의 개인정보 수집에 동의합니다. ',
      'en': '',
    },
    'x03os0uv': {
      'ko': '본인은 위의 서약 내용을 모두 숙지하였으며, 모든 사항에 동의합니다.',
      'en': '',
    },
    'tzhn4de0': {
      'ko': '사용자 서명 :   ',
      'en': '',
    },
    'fsjw9pzv': {
      'ko': '(서명)',
      'en': '',
    },
    'wsgbvzd0': {
      'ko': '주식회사  내공관리형스터디카페  귀하',
      'en': '',
    },
    'bixchhzi': {
      'ko': 'Home',
      'en': '',
    },
  },
  // adminSignCheck
  {
    'b0njk54z': {
      'ko': '입학원서/서약서 관리',
      'en': '',
    },
    '1xwfgdor': {
      'ko': '지점선택',
      'en': '',
    },
    'e9n99mhm': {
      'ko': 'Search...',
      'en': '',
    },
    'wm2mer4d': {
      'ko': 'Option 1',
      'en': '',
    },
    '84cvb2wv': {
      'ko': 'Option 2',
      'en': '',
    },
    '2hz2dvd2': {
      'ko': 'Option 3',
      'en': '',
    },
    'vkkusjhi': {
      'ko': '좌석번호 :',
      'en': '',
    },
    '2npgfa59': {
      'ko': '',
      'en': '',
    },
    'ahtl3a3y': {
      'ko': '이름',
      'en': '',
    },
    'f36z7llh': {
      'ko': '좌석번호',
      'en': '',
    },
    '0qfzsqt9': {
      'ko': '생성일',
      'en': '',
    },
    'q9rvx0u4': {
      'ko': '내공관리자',
      'en': '',
    },
    'mg4y8m8z': {
      'ko': 'Platform Navigation',
      'en': '',
    },
    'x9850hz1': {
      'ko': '플래너확인',
      'en': '',
    },
    '5nkjcyyr': {
      'ko': '시간표 관리',
      'en': '',
    },
    'ccezdo0z': {
      'ko': '벨 기록 조회',
      'en': '',
    },
    'w3d8s77n': {
      'ko': '공부 기록 조회',
      'en': '',
    },
    's22b9x3d': {
      'ko': 'Settings',
      'en': '',
    },
    'zv0zx7ig': {
      'ko': '좌석배정',
      'en': '',
    },
    'iije98e4': {
      'ko': '좌석변경',
      'en': '',
    },
    'uydjdxhb': {
      'ko': '포인트 관리',
      'en': '',
    },
    'dlywrle6': {
      'ko': '인원추이확인',
      'en': '',
    },
    'mc9as131': {
      'ko': '입학원서/서약서확인',
      'en': '',
    },
    'li1aatg4': {
      'ko': 'Home',
      'en': '',
    },
  },
  // plannerTimeOptionBottomSheet
  {
    's9m9beip': {
      'ko': '플래너 시간 설정',
      'en': 'Set planner time',
    },
    'rxfqhb3x': {
      'ko': '플래너에 표시될 처음, 끝시간을 설정해주세요.',
      'en':
          'Please set the start and end times to be displayed in the planner.',
    },
    'am7spdjm': {
      'ko': '시작시간',
      'en': 'Start time',
    },
    '7lc1o9sf': {
      'ko': 'Search for an item...',
      'en': 'Search for an item...',
    },
    'glqj09e6': {
      'ko': '5시',
      'en': '5 o\'clock',
    },
    'cq40boxg': {
      'ko': '6시',
      'en': '6 o\'clock',
    },
    'vvilbti8': {
      'ko': '7시',
      'en': '7 o\'clock',
    },
    'h0tk2u8o': {
      'ko': '8시',
      'en': '8 o\'clock',
    },
    'pwn5d05j': {
      'ko': '9시',
      'en': '9 o\'clock',
    },
    'cvgy3jfo': {
      'ko': '마무리 시간',
      'en': 'Finishing time',
    },
    'sut9nk19': {
      'ko': 'Search for an item...',
      'en': 'Search for an item...',
    },
    'kst3f7l8': {
      'ko': '22시',
      'en': '22 o\'clock',
    },
    'e2kz08j1': {
      'ko': '23시',
      'en': '23:00',
    },
    'yay7nnrs': {
      'ko': '24시',
      'en': '24 hours',
    },
    '0rurf4it': {
      'ko': '1시',
      'en': '1 o\'clock',
    },
    'eiaypmrl': {
      'ko': '2시',
      'en': '2 o\'clock',
    },
    'h9qx3nas': {
      'ko': '3시',
      'en': '3 o\'clock',
    },
    'asfllf2w': {
      'ko': '4시',
      'en': '4 o\'clock',
    },
    '357vyekx': {
      'ko': '저장',
      'en': 'save',
    },
    'q33o7zko': {
      'ko': '취소',
      'en': 'cancellation',
    },
  },
  // plannerInutSetCopy
  {
    '87th6qwf': {
      'ko': '학습계획입력',
      'en': '',
    },
    'nunwdjyb': {
      'ko': '과목명',
      'en': 'Subject name',
    },
    '25jkvgza': {
      'ko': '과목명을 입력해주세요. (ex. 영어, 물리)',
      'en': 'Subject name',
    },
    'v790npf4': {
      'ko': '공부내용',
      'en': 'Study content',
    },
    'ov2uggdg': {
      'ko': '구체적인 학습계획을 작성해주세요. (ex. 강기본 문학 day12)',
      'en': 'Study content',
    },
    'cwvdtt9w': {
      'ko': '색상',
      'en': 'color',
    },
    '7jpf0gw0': {
      'ko': '← 클릭하여 과목색상설정',
      'en': '',
    },
    'd12my60n': {
      'ko': '저장',
      'en': 'save',
    },
    '5vws355k': {
      'ko': '취소',
      'en': 'cancellation',
    },
    'zlf5h4qk': {
      'ko': '⚫  대표과목에서 지정된 과목명을 입력할 경우\n        색상이 자동으로 적용됩니다.',
      'en': '',
    },
    'aepslxd6': {
      'ko': '⚫  공부내용을 구체적으로 입력하지 않을 시 \n',
      'en': '',
    },
    'xoofl2hx': {
      'ko': '        포인트 적립이 반려',
      'en': '',
    },
    '8kmtfqzi': {
      'ko': '될 수 있으므로 구체적인\n        학습계획을 작성해 주시기 바랍니다.',
      'en': '',
    },
  },
  // plannerFix
  {
    'up45ec53': {
      'ko': '과목명',
      'en': 'Subject name',
    },
    'q2tjvhi4': {
      'ko': '과목명',
      'en': 'Subject name',
    },
    'x5yh4xzy': {
      'ko': '공부내용',
      'en': 'Study content',
    },
    'da8eqjfq': {
      'ko': '공부내용',
      'en': 'Study content',
    },
    'ztjfro6d': {
      'ko': '색깔',
      'en': 'color',
    },
    'dzzmm8xb': {
      'ko': 'color picker',
      'en': 'color picker',
    },
    'umecke63': {
      'ko': '저장',
      'en': 'save',
    },
    '3asauka4': {
      'ko': '취소',
      'en': 'cancellation',
    },
    '4ctzpxg8': {
      'ko': '공부기록 삭제',
      'en': 'Delete study records',
    },
  },
  // adminSeatConfigureBottomSheet
  {
    'e8eazmlc': {
      'ko': '좌석부여',
      'en': '',
    },
    'hhb1tz02': {
      'ko': ' 학생의 좌석을 배정해 주세요',
      'en': '',
    },
    'dhg6ftgx': {
      'ko': 'Hello World',
      'en': '',
    },
    'xk9gs9q0': {
      'ko': '',
      'en': '',
    },
    'inwekhik': {
      'ko': '좌석번호를 입력해 주세요',
      'en': '',
    },
    '35o0qft7': {
      'ko': '확인',
      'en': '',
    },
    '1nsja3sc': {
      'ko': '취소',
      'en': '',
    },
  },
  // WidgetToCaptureComponent
  {
    'zzre9tcq': {
      'ko': '수면시간 : ',
      'en': '',
    },
    'yd5mk8er': {
      'ko': '기상시간 : ',
      'en': '',
    },
    'fwsoq0gy': {
      'ko': '목표공부시간 : ',
      'en': '',
    },
    'e66tnlml': {
      'ko': '현재공부시간 : ',
      'en': '',
    },
    'vy8q87z0': {
      'ko': 'TO DO LIST',
      'en': '',
    },
    'u1nyg1mj': {
      'ko': 'STUDY PLAN',
      'en': '',
    },
    'vy6atp7g': {
      'ko': 'SUB',
      'en': '',
    },
    'of4vvwzw': {
      'ko': 'TimeTable',
      'en': '',
    },
    'nlk8wjxi': {
      'ko': '5',
      'en': '',
    },
    'r38cwv26': {
      'ko': '6',
      'en': '',
    },
    'bchh104x': {
      'ko': '7',
      'en': '',
    },
    'q9tmue14': {
      'ko': '8',
      'en': '',
    },
    'o55cz1wn': {
      'ko': '9',
      'en': '',
    },
    '6yn8asc4': {
      'ko': '10',
      'en': '',
    },
    't88gmrls': {
      'ko': '11',
      'en': '',
    },
    'r86dt2ye': {
      'ko': '12',
      'en': '',
    },
    '52g66dts': {
      'ko': '13',
      'en': '',
    },
    '8iu42wzd': {
      'ko': '14',
      'en': '',
    },
    'n952sgft': {
      'ko': '15',
      'en': '',
    },
    '9587mfbd': {
      'ko': '16',
      'en': '',
    },
    'qway0kkv': {
      'ko': '17',
      'en': '',
    },
    'phg4bqeo': {
      'ko': '18',
      'en': '',
    },
    'qa1b6o0q': {
      'ko': '19',
      'en': '',
    },
    'pg18up5t': {
      'ko': '20',
      'en': '',
    },
    'mfbp548d': {
      'ko': '21',
      'en': '',
    },
    'zcrujv4p': {
      'ko': '22',
      'en': '',
    },
    '7al0gqno': {
      'ko': '23',
      'en': '',
    },
    'j611n2l7': {
      'ko': '24',
      'en': '',
    },
    'vh8pi0hy': {
      'ko': '1',
      'en': '',
    },
    'q9ho2nvt': {
      'ko': '2',
      'en': '',
    },
    'bihkjajt': {
      'ko': '3',
      'en': '',
    },
    'xvfw2xz6': {
      'ko': '4',
      'en': '',
    },
    'lkv01w57': {
      'ko': 'Memo',
      'en': '',
    },
    'e2u4j23l': {
      'ko': 'Encouragement',
      'en': '',
    },
    't44b9cl3': {
      'ko': '',
      'en': '',
    },
    'opxgiksy': {
      'ko': 'TextField',
      'en': '',
    },
  },
  // adminSeatChangeBottomSheet
  {
    'kv8ypx2a': {
      'ko': '좌석변경',
      'en': '',
    },
    '4h4jw3ii': {
      'ko': ' 학생의 좌석을 배정해 주세요',
      'en': '',
    },
    '7xcxtgzn': {
      'ko': 'Hello World',
      'en': '',
    },
    '7xykt552': {
      'ko': '',
      'en': '',
    },
    '9kgip50v': {
      'ko': '좌석번호를 입력해 주세요',
      'en': '',
    },
    '2ap6o9v5': {
      'ko': '확인',
      'en': '',
    },
    'uw6135mz': {
      'ko': '취소',
      'en': '',
    },
  },
  // privacyPolicy
  {
    'rowr13zz': {
      'ko': '이용약관',
      'en': '',
    },
    'pfbdgc0y': {
      'ko': 'Hello World',
      'en': '',
    },
    'xz7klnm7': {
      'ko': '개인정보처리방침',
      'en': '',
    },
    'w57g7iiq': {
      'ko': 'Hello World',
      'en': '',
    },
  },
  // termsOfServices
  {
    'p3ljbmes': {
      'ko': '이용약관',
      'en': '',
    },
    'r3heb4zg': {
      'ko': 'Hello World',
      'en': '',
    },
  },
  // Dashboard01RecentActivity
  {
    'bocnrsjg': {
      'ko': 'Recent Activity',
      'en': '',
    },
    '1ax3lusv': {
      'ko': 'Below is an overview of tasks & activity completed.',
      'en': '',
    },
    'uxqxoz8g': {
      'ko': 'Tasks',
      'en': '',
    },
    '4b9eukw5': {
      'ko': 'Completed',
      'en': '',
    },
  },
  // callWhileStudy
  {
    'qsypsdya': {
      'ko': '화장실 / 휴게실',
      'en': '',
    },
    '4a7igcag': {
      'ko': '질문',
      'en': '',
    },
    'ihae1x8g': {
      'ko': '기타',
      'en': '',
    },
  },
  // dailySet
  {
    '3yuhipyj': {
      'ko': '수면시각 :',
      'en': '',
    },
    'a19musvf': {
      'ko': '기상시각 :',
      'en': '',
    },
    'i15ls5bv': {
      'ko': '목표공부시간 :  ',
      'en': '',
    },
    '8n5xkeci': {
      'ko': '저장',
      'en': '',
    },
    'mxtbl1bm': {
      'ko': '취소',
      'en': '',
    },
  },
  // temporaryLock
  {
    '37db1j6j': {
      'ko': 'Insert PIN',
      'en': '',
    },
    '1imgg2qw': {
      'ko': '7',
      'en': '',
    },
    'xbuxgy0w': {
      'ko': '8',
      'en': '',
    },
    'vtt3s5xg': {
      'ko': '9',
      'en': '',
    },
    'pwp35wds': {
      'ko': '4',
      'en': '',
    },
    'lylvn4g0': {
      'ko': '5',
      'en': '',
    },
    'ggjj2azl': {
      'ko': '6',
      'en': '',
    },
    'h6dkx1b5': {
      'ko': '1',
      'en': '',
    },
    'oy46b296': {
      'ko': '2',
      'en': '',
    },
    'ym54vorg': {
      'ko': '3',
      'en': '',
    },
    'j0pnremt': {
      'ko': 'C',
      'en': '',
    },
    '752yiia7': {
      'ko': '0',
      'en': '',
    },
  },
  // secondPinConfirm
  {
    'xqcjvivv': {
      'ko': '현재 2차 비밀번호를 입력해 주세요.',
      'en': '',
    },
    '6cdy96xb': {
      'ko': '7',
      'en': '',
    },
    'dd3sf1kv': {
      'ko': '8',
      'en': '',
    },
    'nss7y5c4': {
      'ko': '9',
      'en': '',
    },
    'f1g79k6i': {
      'ko': '4',
      'en': '',
    },
    'nafdttfw': {
      'ko': '5',
      'en': '',
    },
    'dea3pguq': {
      'ko': '6',
      'en': '',
    },
    'ubpi7h2c': {
      'ko': '1',
      'en': '',
    },
    '43lz3twn': {
      'ko': '2',
      'en': '',
    },
    '5hghs8cs': {
      'ko': '3',
      'en': '',
    },
    't7dlgw99': {
      'ko': 'C',
      'en': '',
    },
    '5zyx490l': {
      'ko': '0',
      'en': '',
    },
  },
  // helpCenter
  {
    'dfae1x7t': {
      'ko': 'Help Center',
      'en': '',
    },
    '58bl331r': {
      'ko':
          '앱 사용과 관련된 불편사항 및 건의사항은 각 지점 담당 선생님 혹은 parkjh3530@gmail.com으로 문의 바랍니다',
      'en': '',
    },
  },
  // pointadjustcompo
  {
    'w2kxdlkg': {
      'ko': '학생',
      'en': '',
    },
    'e5tetwvx': {
      'ko': '현재 포인트',
      'en': '',
    },
    'we1z7hfe': {
      'ko': ':',
      'en': '',
    },
    'k70nw7t7': {
      'ko': ':',
      'en': '',
    },
    'o5mao20v': {
      'ko': '현재 포인트',
      'en': '',
    },
    'u3bpglis': {
      'ko': '',
      'en': '',
    },
    'm9ualjbx': {
      'ko': 'TextField',
      'en': '',
    },
    '9pw6q11m': {
      'ko': '사유',
      'en': '',
    },
    '0iwqopm4': {
      'ko': ':',
      'en': '',
    },
    '1zk33kfz': {
      'ko': '현재 포인트',
      'en': '',
    },
    'elmowda7': {
      'ko': '',
      'en': '',
    },
    'cmgih2uz': {
      'ko': 'TextField',
      'en': '',
    },
    '70vl07vr': {
      'ko': '확인',
      'en': '',
    },
    '2nsyho0d': {
      'ko': '취소',
      'en': '',
    },
  },
  // test11
  {
    '5r844jkp': {
      'ko': '수면시간 : ',
      'en': '',
    },
    'aw3o0rf9': {
      'ko': '기상시간 : ',
      'en': '',
    },
    '7dx33ngy': {
      'ko': '목표공부시간 : ',
      'en': '',
    },
    '5v9wil78': {
      'ko': '현재공부시간 : ',
      'en': '',
    },
    'roztzh13': {
      'ko': '오늘의 한마디 :',
      'en': '',
    },
    'uheamk68': {
      'ko': '',
      'en': '',
    },
    'i2he2l3f': {
      'ko': '오늘의 다짐, 고민거리, 건의사항등\n하고싶은 말을 자유롭게 적어주세요!',
      'en': '',
    },
    'fdfri5xu': {
      'ko': 'TO DO LIST',
      'en': '',
    },
    'u0e77cll': {
      'ko': 'STUDY PLAN',
      'en': '',
    },
    'axn0nvw7': {
      'ko': 'SUB',
      'en': '',
    },
    '7qz27fko': {
      'ko': 'TimeTable',
      'en': '',
    },
    '5ztpeni7': {
      'ko': '5',
      'en': '',
    },
    '29c0v8j1': {
      'ko': '6',
      'en': '',
    },
    '3miqgwki': {
      'ko': '7',
      'en': '',
    },
    'np7lk07u': {
      'ko': '8',
      'en': '',
    },
    'mijzuzgu': {
      'ko': '9',
      'en': '',
    },
    'h4dduz9o': {
      'ko': '10',
      'en': '',
    },
    '6eti23xq': {
      'ko': '11',
      'en': '',
    },
    'wvcx6ymq': {
      'ko': '12',
      'en': '',
    },
    'u0zebo96': {
      'ko': '13',
      'en': '',
    },
    'x2xypj0r': {
      'ko': '14',
      'en': '',
    },
    '8ompatdx': {
      'ko': '15',
      'en': '',
    },
    '6v22bofn': {
      'ko': '16',
      'en': '',
    },
    'a9e9ksdk': {
      'ko': '17',
      'en': '',
    },
    'f1d49ztv': {
      'ko': '18',
      'en': '',
    },
    'pn7uynt6': {
      'ko': '19',
      'en': '',
    },
    '28yfiqj6': {
      'ko': '20',
      'en': '',
    },
    'gl30r3l5': {
      'ko': '21',
      'en': '',
    },
    'vr31i4lj': {
      'ko': '22',
      'en': '',
    },
    '1gl7t18o': {
      'ko': '23',
      'en': '',
    },
    '897mgbwa': {
      'ko': 'Good Things',
      'en': '',
    },
    '2q0e29ub': {
      'ko': 'Improvement',
      'en': '',
    },
  },
  // pointCheckComponent
  {
    'gqpnxmnm': {
      'ko': '포인트확인',
      'en': '',
    },
    'lt2n36ef': {
      'ko': '획득일시',
      'en': '',
    },
    'bwb6s3kl': {
      'ko': '획득 포인트',
      'en': '',
    },
    'znf18f7t': {
      'ko': '사유',
      'en': '',
    },
    'o9hulri2': {
      'ko': '총점',
      'en': '',
    },
  },
  // ddaycomponent
  {
    'mzdw6l7u': {
      'ko': 'D-Day 추가하기',
      'en': '',
    },
    'i6pzip2z': {
      'ko': '날짜선택 :',
      'en': '',
    },
    'nx4t1mpt': {
      'ko': '이벤트 선택 :',
      'en': '',
    },
    '6rh65giy': {
      'ko': 'TextField',
      'en': '',
    },
    'c2xwwmyo': {
      'ko': '저장',
      'en': '',
    },
    'rf29e10f': {
      'ko': '취소',
      'en': '',
    },
  },
  // reorderableListview
  {
    'a705batw': {
      'ko': '대표과목설정',
      'en': '',
    },
    'awpjbk67': {
      'ko': '※ 텍스트와 원을 클릭하여 과목명 및 과목색상 설정',
      'en': '',
    },
  },
  // subjectBottomSheet
  {
    'qyimaghl': {
      'ko': '과목명',
      'en': '',
    },
    '3b7nl2u8': {
      'ko': 'TextField',
      'en': '',
    },
  },
  // timetablestart
  {
    'icb2m793': {
      'ko': '시간표 제작',
      'en': '',
    },
    '50k9cpwk': {
      'ko': '시간표 이름 : ',
      'en': '',
    },
    'l4cmg0wi': {
      'ko': 'TextField',
      'en': '',
    },
    'wrlxr26s': {
      'ko': '만들기',
      'en': '',
    },
    'j28pr45k': {
      'ko': '취소',
      'en': '',
    },
  },
  // weeklyToCapture
  {
    'jroo45o5': {
      'ko': '누적공부시간',
      'en': '',
    },
    'z1nlw6a0': {
      'ko': ' ~ ',
      'en': '',
    },
    'exeo5fzc': {
      'ko': 'Hello World',
      'en': '',
    },
    'mpquntg9': {
      'ko': 'Hello World',
      'en': '',
    },
    'j7iy14cq': {
      'ko': '나의 공부시간',
      'en': '',
    },
    'oji9y2o0': {
      'ko': '기간 총 공부시간',
      'en': '',
    },
    'yt2i55pg': {
      'ko': '\n\n',
      'en': '',
    },
    'm90kw4g8': {
      'ko': '평균공부시간',
      'en': '',
    },
    'sysbeymm': {
      'ko': '\n\n',
      'en': '',
    },
    'aa16ziq7': {
      'ko': '내공 평균 공부시간',
      'en': '',
    },
    'xys6nxzo': {
      'ko': '기간 총 공부시간',
      'en': '',
    },
    'va8uit2k': {
      'ko': '\n\n',
      'en': '',
    },
    'hppnk8j5': {
      'ko': '데이터 수집중...',
      'en': '',
    },
    '34tkcy8d': {
      'ko': '평균공부시간',
      'en': '',
    },
    'pgtvkuog': {
      'ko': '\n\n',
      'en': '',
    },
    'eddztdvt': {
      'ko': '데이터 수집중...',
      'en': '',
    },
    'r0tfn07z': {
      'ko': '누적 포인트 : ',
      'en': '',
    },
    '6lo82qu2': {
      'ko': '점',
      'en': '',
    },
    'wz3b9hak': {
      'ko': ' - ',
      'en': '',
    },
    'tgkgdueq': {
      'ko': '번',
      'en': '',
    },
    'vnyqjo84': {
      'ko': '- 주간 선생님 코멘트',
      'en': '',
    },
    's123t0do': {
      'ko': '학습 내용 및 태도를 입력해 주세요(최대 10줄)',
      'en': '',
    },
    'f4j5x9uo': {
      'ko': '- 공지사항',
      'en': '',
    },
    '2pk8q1uh': {
      'ko': '주간공지사항을 입력해주세요.(최대 20줄)',
      'en': '',
    },
  },
  // costCallBottomSheet
  {
    'ybhx8e7z': {
      'ko': ' 일자 활성 사용자 좌석번호',
      'en': '',
    },
    'mvemu3tb': {
      'ko': '   (총 ',
      'en': '',
    },
    '1t5jddjg': {
      'ko': '명)',
      'en': '',
    },
    'y5yomjab': {
      'ko': ', ',
      'en': '',
    },
    'wxhjbjbi': {
      'ko': '좌우로 스크롤 가능',
      'en': '',
    },
  },
  // timetabletoCapture
  {
    '74vcmnwr': {
      'ko': '학생명 : ',
      'en': '',
    },
    'ouxsgjtc': {
      'ko': '박종형',
      'en': '',
    },
  },
  // timetablestartAdminSet
  {
    'opae5vr6': {
      'ko': 'click!',
      'en': '',
    },
    '2idln9hx': {
      'ko': '',
      'en': '',
    },
    '0i3ybr3l': {
      'ko': '',
      'en': '',
    },
    'xcau5d2z': {
      'ko': '외출 사유 및  색상을 입력해주세요',
      'en': '',
    },
    'zztel1t4': {
      'ko': '시작시각 ',
      'en': '',
    },
    'gq8azh5h': {
      'ko': ' : ',
      'en': '',
    },
    'qgl7c6pu': {
      'ko': ' : ',
      'en': '',
    },
    'g55rlagk': {
      'ko': '시',
      'en': '',
    },
    'djug5ram': {
      'ko': '분',
      'en': '',
    },
    'i614nhp6': {
      'ko': '종료시각',
      'en': '',
    },
    'h5moiiy9': {
      'ko': '  : ',
      'en': '',
    },
    't77hb37v': {
      'ko': '  : ',
      'en': '',
    },
    'v4pwspsm': {
      'ko': '시',
      'en': '',
    },
    'hrrx5nen': {
      'ko': '분',
      'en': '',
    },
    'eltpbi9b': {
      'ko': '외출 반영',
      'en': '',
    },
    '11zqai1m': {
      'ko': '취소',
      'en': '',
    },
  },
  // simpleColorPicker
  {
    'r7hyalxj': {
      'ko': '색상 선택',
      'en': '',
    },
  },
  // timetablestartUserSet
  {
    '8m4mwx21': {
      'ko': 'click!',
      'en': '',
    },
    'za0mvz6z': {
      'ko': '',
      'en': '',
    },
    '5k2ljw66': {
      'ko': '',
      'en': '',
    },
    'jjyicir8': {
      'ko': '외출 사유 및  색상을 입력해주세요',
      'en': '',
    },
    'ngiwkrwv': {
      'ko': '시작시각 ',
      'en': '',
    },
    '5b4azgnk': {
      'ko': ' : ',
      'en': '',
    },
    'xut6cvsh': {
      'ko': ' : ',
      'en': '',
    },
    'h6bvbuc3': {
      'ko': '시',
      'en': '',
    },
    'cnk98exg': {
      'ko': '분',
      'en': '',
    },
    '41wfiitn': {
      'ko': '종료시각',
      'en': '',
    },
    '5bbpedwi': {
      'ko': '  : ',
      'en': '',
    },
    'd6z6dij2': {
      'ko': '  : ',
      'en': '',
    },
    '8pluzrl5': {
      'ko': '시',
      'en': '',
    },
    'c07e3q7z': {
      'ko': '분',
      'en': '',
    },
    'bkqyxm2j': {
      'ko': '외출 반영',
      'en': '',
    },
    '1qfltys2': {
      'ko': '취소',
      'en': '',
    },
  },
  // sign2component
  {
    'tm8kk2pc': {
      'ko': '(주) 내공 관리형 스터디카페 입학원서',
      'en': '',
    },
    'e1xl4zxu': {
      'ko': '  ■ 학생 이름',
      'en': '',
    },
    'xz8ezym5': {
      'ko': '  ■ 생년월일',
      'en': '',
    },
    'dxf79sgr': {
      'ko': '  ■ 학교/학년',
      'en': '',
    },
    'q5xgujxv': {
      'ko': '/',
      'en': '',
    },
    'srzvrs4o': {
      'ko': '학년',
      'en': '',
    },
    'xq07cf8f': {
      'ko': '  ■ 전화번호',
      'en': '',
    },
    'jgk0ocyk': {
      'ko': '  ■ 주소',
      'en': '',
    },
    'm2udqo9w': {
      'ko': '  ■ 학부모 연락처',
      'en': '',
    },
    '455hshlu': {
      'ko': '부',
      'en': '',
    },
    'kpbi42zv': {
      'ko': '모',
      'en': '',
    },
    'nrzwrfkf': {
      'ko': ' ■ 공부목적',
      'en': '',
    },
    'qme3z7u1': {
      'ko': '세부선택항목',
      'en': '',
    },
    'anuwxt1j': {
      'ko': '수능',
      'en': '',
    },
    '9it8utsg': {
      'ko': '수시',
      'en': '',
    },
    'v0mnvy1o': {
      'ko': '    -   ',
      'en': '',
    },
    'lhr8rmdl': {
      'ko': '희망 전형',
      'en': '',
    },
    'jz3f9419': {
      'ko': 'Search...',
      'en': '',
    },
    'q96jw3o2': {
      'ko': '논술',
      'en': '',
    },
    'kockjm60': {
      'ko': '학종',
      'en': '',
    },
    'hczl62hl': {
      'ko': '교과',
      'en': '',
    },
    'pmh5m3vc': {
      'ko': '정시',
      'en': '',
    },
    'tijiiyfq': {
      'ko': '공시',
      'en': '',
    },
    'mjhwokx1': {
      'ko': '준비 중인 시험 혹은 목표를 입력해주세요.',
      'en': '',
    },
    'e00eacr2': {
      'ko': '기타',
      'en': '',
    },
    'g8d9b420': {
      'ko': '준비 중인 시험 혹은 목표를 입력해주세요.',
      'en': '',
    },
    'ipq7jjgo': {
      'ko': '  ■ 수능 선택 과목 및 현재 등급',
      'en': '',
    },
    'kbuze27t': {
      'ko': '영역',
      'en': '',
    },
    '8u6h3q76': {
      'ko': '선택 과목 / 응시 여부',
      'en': '',
    },
    '2uc2ex9x': {
      'ko': '현재 등급',
      'en': '',
    },
    '6xjfrlju': {
      'ko': '국어',
      'en': '',
    },
    'ki2yp4ec': {
      'ko': '선택 과목',
      'en': '',
    },
    'xvx6dv2w': {
      'ko': 'Search...',
      'en': '',
    },
    'dz4h9d43': {
      'ko': '언어와 매체',
      'en': '',
    },
    't3q1447x': {
      'ko': '화법과 작문',
      'en': '',
    },
    'pzjpa5gh': {
      'ko': '( )',
      'en': '',
    },
    '9fkk3n21': {
      'ko': '등급',
      'en': '',
    },
    '9vadizg0': {
      'ko': '수학',
      'en': '',
    },
    'h3arr8zl': {
      'ko': '선택 과목',
      'en': '',
    },
    'zq9tn70q': {
      'ko': 'Search...',
      'en': '',
    },
    'i4c32kn5': {
      'ko': '미적분',
      'en': '',
    },
    'zcrnec6l': {
      'ko': '확률과 통계',
      'en': '',
    },
    'doxav2cm': {
      'ko': '기하',
      'en': '',
    },
    '0jn596dm': {
      'ko': '( )',
      'en': '',
    },
    'qjrvx09s': {
      'ko': '등급',
      'en': '',
    },
    'dtyqendi': {
      'ko': '탐구1',
      'en': '',
    },
    'ku2698xo': {
      'ko': '탐구',
      'en': '',
    },
    '9mzku14q': {
      'ko': 'Search...',
      'en': '',
    },
    'ta50oxg8': {
      'ko': '사탐',
      'en': '',
    },
    'mmp5sgsm': {
      'ko': '과탐',
      'en': '',
    },
    'lh2jd1uk': {
      'ko': '선택 과목',
      'en': '',
    },
    'loatxorw': {
      'ko': 'Search...',
      'en': '',
    },
    'sjelzqat': {
      'ko': '사탐',
      'en': '',
    },
    '80solmzm': {
      'ko': '과탐',
      'en': '',
    },
    'mzaz1kxx': {
      'ko': '( )',
      'en': '',
    },
    'bzwd49hn': {
      'ko': '등급',
      'en': '',
    },
    'pll6bq7z': {
      'ko': '영역',
      'en': '',
    },
    'igic6xjt': {
      'ko': '선택 과목 / 응시 여부',
      'en': '',
    },
    'b5fkc0tm': {
      'ko': '현재 등급',
      'en': '',
    },
    '05wkexwc': {
      'ko': '영어',
      'en': '',
    },
    'eie6h88a': {
      'ko': '응시 여부',
      'en': '',
    },
    '5xtq5g99': {
      'ko': 'Search...',
      'en': '',
    },
    '1b0a8r3i': {
      'ko': '응시',
      'en': '',
    },
    'hqrk6rv7': {
      'ko': '미응시',
      'en': '',
    },
    '11hgbsg0': {
      'ko': '( )',
      'en': '',
    },
    '0xoikrd0': {
      'ko': '등급',
      'en': '',
    },
    'zil0ibvn': {
      'ko': '한국사',
      'en': '',
    },
    'dl0y9m2c': {
      'ko': '응시 여부',
      'en': '',
    },
    'phzbu7jw': {
      'ko': 'Search...',
      'en': '',
    },
    '6615t3ra': {
      'ko': '응시',
      'en': '',
    },
    '5a8jbt66': {
      'ko': '미응시',
      'en': '',
    },
    'bqm1c7qi': {
      'ko': '( )',
      'en': '',
    },
    'o64o30ct': {
      'ko': '등급',
      'en': '',
    },
    'dnui1s2i': {
      'ko': '탐구2',
      'en': '',
    },
    'ktzn14o6': {
      'ko': '탐구',
      'en': '',
    },
    '8jsxlp52': {
      'ko': 'Search...',
      'en': '',
    },
    'p6wocbas': {
      'ko': '사탐',
      'en': '',
    },
    'yuz6k6l9': {
      'ko': '과탐',
      'en': '',
    },
    'upvi6f1d': {
      'ko': '선택 과목',
      'en': '',
    },
    '7axbmrca': {
      'ko': 'Search...',
      'en': '',
    },
    'wugtn880': {
      'ko': '사탐',
      'en': '',
    },
    'cl0qvfsk': {
      'ko': '과탐',
      'en': '',
    },
    '3541v23q': {
      'ko': '( )',
      'en': '',
    },
    '8h8qdf9m': {
      'ko': '등급',
      'en': '',
    },
    'quyp6gun': {
      'ko': '  ■ 부가 학습 프로그램',
      'en': '',
    },
    'wwvix5e1': {
      'ko': '컨설팅 여부',
      'en': '',
    },
    'ure6td7i': {
      'ko': '플래너 코칭',
      'en': '',
    },
    'kajrtn1y': {
      'ko': '[㈜내공관리형 스터디카페 환불규정] ',
      'en': '',
    },
    '8u34a5th': {
      'ko':
          '▪ 환불 방식\n    - 환불 금액 = 결제 금액 – 위약금 (총 결제금액의 10% 또는 20%) − (총 이용일 수 × 19300원) *19300원 = 기본 일일사용 금액 \n    - 이용일 수는 이용 시작일 기준으로 계산되며, 1일이라도 이용 시 하루로 간주됩니다. \n▪ 위약금 기준\n   - 전체 기간권 공통 (1개월/2개월권에 해당): 총 결제 금액의 10%\n   - 3개월 이상 장기권의 해지 시 혜택 남용 방지를 위해 별도 위약금(10%)이 가산 적용됩니다. \n▪ 기타 \n  - 본 환불 규정은 공정거래위원회 소비자분쟁해결기준을 준수합니다. \n  - 결제 시 본 규정에 동의한 것으로 간주되며, 환불 요청 시 본 내용이 적용됩니다. \n  - 예약금은 좌석을 미리 확보하기 위한 금액으로, 결제 시 총 이용요금에서 미리 제외하고 나머지 금액만 결제하시면 됩니다. \n  - 환불 요청 시에는 예약금을 포함한 전체 금액을 기준으로 위약금과 사용일 요금을 계산하며, 예약금은 환불되지 않습니다. ',
      'en': '',
    },
    '1zpt42rl': {
      'ko':
          '* 사용자가 서약서 사항 위반하여 벌점이 20점 이상 누적되어 강제 퇴실 되는 경우, 수강료는 환불되지 않습니다. \n* 총 사용 기간은 총 기간권 중의 총 사용 일수를 말하며, 반환 금액의 산정은 반환사유가 발생한 날까지 경과된 사용 시간을 기준으로 합니다. \n* 기간권 정지는 원칙적으로 불가능합니다. \n   (단, 입원 등 상당한 사유발생시에는 사유 제출 후 최고 관리자 승인 여부에 따라 최대 7일간 기간연장 (확인서 및 진단서 필수지참)',
      'en': '',
    },
    's5g4jrq9': {
      'ko': '결제 전 본 내용에 대해 고지 및 설명을 받았으며, 이에 동의합니다',
      'en': '',
    },
    'bvc1zgcr': {
      'ko': '사용자 서명 :   ',
      'en': '',
    },
    'zyryji5a': {
      'ko': '보호자 서명 :   ',
      'en': '',
    },
  },
  // timetablestartNaegongtime
  {
    'se0x0cky': {
      'ko': '등/하원시간 설정',
      'en': '',
    },
    'fpyplse6': {
      'ko': '등원시각 ',
      'en': '',
    },
    '7257hwrm': {
      'ko': ' : ',
      'en': '',
    },
    'pt5b90vx': {
      'ko': ' : ',
      'en': '',
    },
    'p0lcfx4v': {
      'ko': '시',
      'en': '',
    },
    '4oposmlm': {
      'ko': '분',
      'en': '',
    },
    '2km76iu4': {
      'ko': '하원시각',
      'en': '',
    },
    '2s9xt7jn': {
      'ko': '  : ',
      'en': '',
    },
    'v95d5fn0': {
      'ko': '  : ',
      'en': '',
    },
    'fmcgmdv1': {
      'ko': '시',
      'en': '',
    },
    'lyo0esno': {
      'ko': '분',
      'en': '',
    },
    '9f5icw6z': {
      'ko': '외출 반영',
      'en': '',
    },
    'j76u57li': {
      'ko': '취소',
      'en': '',
    },
  },
  // sign2capture
  {
    '990p9m16': {
      'ko': '(주) 내공 관리형 스터디카페 입학원서',
      'en': '',
    },
    '617knz18': {
      'ko': '  ■ 학생 이름',
      'en': '',
    },
    '93e0nlbw': {
      'ko': '  ■ 생년월일',
      'en': '',
    },
    'rpv5mx2g': {
      'ko': '  ■ 학교/학년',
      'en': '',
    },
    '6znxjj22': {
      'ko': '  /  ',
      'en': '',
    },
    'w1cz72st': {
      'ko': '학년',
      'en': '',
    },
    'h82mflos': {
      'ko': '  ■ 전화번호',
      'en': '',
    },
    't11nrfix': {
      'ko': '  ■ 주소',
      'en': '',
    },
    '0xj66dij': {
      'ko': '  ■ 학부모 연락처',
      'en': '',
    },
    'k68prrls': {
      'ko': '부',
      'en': '',
    },
    'gw96r9wt': {
      'ko': '모',
      'en': '',
    },
    'pn5iycs1': {
      'ko': ' ■ 공부목적',
      'en': '',
    },
    '29x0xxx7': {
      'ko': '세부선택항목',
      'en': '',
    },
    '2t1eudmz': {
      'ko': '수능',
      'en': '',
    },
    'lzcxwsbe': {
      'ko': '수시',
      'en': '',
    },
    'c5u05kns': {
      'ko': '    -   ',
      'en': '',
    },
    'ocgxmloo': {
      'ko': '정시',
      'en': '',
    },
    'q1ur6ysh': {
      'ko': '공시',
      'en': '',
    },
    '6zvz5nk1': {
      'ko': '기타',
      'en': '',
    },
    'tbw0xzbt': {
      'ko': '  ■ 수능 선택 과목 및 현재 등급',
      'en': '',
    },
    'vns9ihlr': {
      'ko': '영역',
      'en': '',
    },
    'jf49lbkz': {
      'ko': '선택 과목 / 응시 여부',
      'en': '',
    },
    '78anm6uf': {
      'ko': '현재 등급',
      'en': '',
    },
    'xatu79dq': {
      'ko': '국어',
      'en': '',
    },
    'xzi5yl4a': {
      'ko': '  등급',
      'en': '',
    },
    '1kwhhhij': {
      'ko': '수학',
      'en': '',
    },
    'q2qolwvv': {
      'ko': '  등급',
      'en': '',
    },
    'i5ri90nq': {
      'ko': '탐구1',
      'en': '',
    },
    'nb1wql5v': {
      'ko': '  등급',
      'en': '',
    },
    '7y73ns99': {
      'ko': '영역',
      'en': '',
    },
    'd06ypwak': {
      'ko': '선택 과목 / 응시 여부',
      'en': '',
    },
    'l7xoqqor': {
      'ko': '현재 등급',
      'en': '',
    },
    'ckz20a9k': {
      'ko': '영어',
      'en': '',
    },
    'bv0if2w2': {
      'ko': '  등급',
      'en': '',
    },
    '9v42hmbb': {
      'ko': '한국사',
      'en': '',
    },
    'x0jog5yf': {
      'ko': '  등급',
      'en': '',
    },
    '318izgki': {
      'ko': '탐구2',
      'en': '',
    },
    '776d92xz': {
      'ko': '  등급',
      'en': '',
    },
    'f759bo6j': {
      'ko': '  ■ 부가 학습 프로그램',
      'en': '',
    },
    'n6vtbuge': {
      'ko': '컨설팅 여부',
      'en': '',
    },
    'spu59o4o': {
      'ko': '플래너 코칭',
      'en': '',
    },
    'fjmvcrgu': {
      'ko': '[㈜내공관리형 스터디카페 환불규정] ',
      'en': '',
    },
    'os6kry9k': {
      'ko':
          '▪ 환불 방식\n    - 환불 금액 = 결제 금액 – 위약금 (총 결제금액의 10% 또는 20%) − (총 이용일 수 × 19300원) *19300원 = 기본 일일사용 금액 \n    - 이용일 수는 이용 시작일 기준으로 계산되며, 1일이라도 이용 시 하루로 간주됩니다. \n▪ 위약금 기준\n   - 전체 기간권 공통 (1개월/2개월권에 해당): 총 결제 금액의 10%\n   - 3개월 이상 장기권의 해지 시 혜택 남용 방지를 위해 별도 위약금(10%)이 가산 적용됩니다. \n▪ 기타 \n  - 본 환불 규정은 공정거래위원회 소비자분쟁해결기준을 준수합니다. \n  - 결제 시 본 규정에 동의한 것으로 간주되며, 환불 요청 시 본 내용이 적용됩니다. \n  - 예약금은 좌석을 미리 확보하기 위한 금액으로, 결제 시 총 이용요금에서 미리 제외하고 나머지 금액만 결제하시면 됩니다. \n  - 환불 요청 시에는 예약금을 포함한 전체 금액을 기준으로 위약금과 사용일 요금을 계산하며, 예약금은 환불되지 않습니다. ',
      'en': '',
    },
    '3m5foktn': {
      'ko':
          '* 사용자가 서약서 사항 위반하여 벌점이 20점 이상 누적되어 강제 퇴실 되는 경우, 수강료는 환불되지 않습니다. \n* 총 사용 기간은 총 기간권 중의 총 사용 일수를 말하며, 반환 금액의 산정은 반환사유가 발생한 날까지 경과된 사용 시간을 기준으로 합니다. \n* 기간권 정지는 원칙적으로 불가능합니다. \n   (단, 입원 등 상당한 사유발생시에는 사유 제출 후 최고 관리자 승인 여부에 따라 최대 7일간 기간연장 (확인서 및 진단서 필수지참)',
      'en': '',
    },
    'qjmq2pgn': {
      'ko': '결제 전 본 내용에 대해 고지 및 설명을 받았으며, 이에 동의합니다',
      'en': '',
    },
    'ztlr5mty': {
      'ko': '사용자 서명 :   ',
      'en': '',
    },
    'vdmss080': {
      'ko': '보호자 서명 :   ',
      'en': '',
    },
  },
  // secureSign2Capture
  {
    'ueecguwn': {
      'ko': '㈜내공관리형스터디카페 등록서약서',
      'en': '',
    },
    'kzyie8vo': {
      'ko': '▪학생 이름: ',
      'en': '',
    },
    'k2ij2xh1': {
      'ko': '▪연락처: ',
      'en': '',
    },
    'gl5tpt7l': {
      'ko': '▪생년월일(8자리): ',
      'en': '',
    },
    '458tgxdm': {
      'ko': '상기 본인은 내공관리형스터디카페 등록과 동시에 아래 사항을 숙지하고, \n이를 철저히 준수할 것을 서약합니다. ',
      'en': '',
    },
    'ce8fj6qj': {
      'ko': '서약사항',
      'en': '',
    },
    'wnprobj6': {
      'ko':
          '▪본인은 학업 성적 향상에 최선의 노력을 다하겠습니다. \n\n\n▪내공스터디카페의 모든 규칙을 성실히 준수하고, 관리자 통제를 따르겠습니다. \n\n\n▪스터디카페 내 에티켓을 준수하고 타인에게 피해를 주지 않겠습니다. \n\n\n▪규칙 위반 및 통제 불응, 벌점 누적 시 퇴실 조치에 이의를 제기하지 않으며,  \n\n\n▪등록 후 환불 및 양도는 규정에 따르며, 이의 제기를 하지 않겠습니다. \n\n\n▪등록과 운영을 위한 최소한의 개인정보 수집에 동의합니다. ',
      'en': '',
    },
    'u4aszvo7': {
      'ko': '본인은 위의 서약 내용을 모두 숙지하였으며, 모든 사항에 동의합니다.',
      'en': '',
    },
    'bf7ostpe': {
      'ko': '사용자 서명 :   ',
      'en': '',
    },
    '4gz3z84e': {
      'ko': '주식회사  내공관리형스터디카페  귀하',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'rxmgapcs': {
      'ko': 'Title',
      'en': 'Title',
    },
    'hg46it45': {
      'ko': 'Subtitle goes here...',
      'en': 'Subtitle goes here...',
    },
    'rt5yta4w': {
      'ko': 'are you sure to provide location data?',
      'en': '',
    },
    'tjdw9w18': {
      'ko': '위치정보 수집을 허가하시겠습니까?',
      'en': '',
    },
    'elwxahj2': {
      'ko': '12',
      'en': '',
    },
    '146sgepy': {
      'ko': 'are you sure to ensure contact?',
      'en': '',
    },
    '3gx5fk3l': {
      'ko': '',
      'en': '',
    },
    'fqzlm8kn': {
      'ko': '',
      'en': '',
    },
    '1d2r4p3o': {
      'ko': '',
      'en': '',
    },
    '1ql6h09k': {
      'ko': '',
      'en': '',
    },
    '4r57gxe5': {
      'ko': '',
      'en': '',
    },
    'ujva6nmx': {
      'ko': '',
      'en': '',
    },
    'jro8lyw3': {
      'ko': '',
      'en': '',
    },
    'juraff75': {
      'ko': '',
      'en': '',
    },
    '4idz97xr': {
      'ko': '',
      'en': '',
    },
    'ei6u64un': {
      'ko': '',
      'en': '',
    },
    'q1857cwl': {
      'ko': '',
      'en': '',
    },
    'icdxdaob': {
      'ko': '',
      'en': '',
    },
    'gbgkqvb8': {
      'ko': '',
      'en': '',
    },
    'bep3pb0y': {
      'ko': '',
      'en': '',
    },
    'lazwtlrf': {
      'ko': '',
      'en': '',
    },
    '6x337yz5': {
      'ko': '',
      'en': '',
    },
    'xnmgci54': {
      'ko': '',
      'en': '',
    },
    '5sftm42r': {
      'ko': '',
      'en': '',
    },
    '1brhi96g': {
      'ko': '',
      'en': '',
    },
    't5k127n5': {
      'ko': '',
      'en': '',
    },
    'n6kf0pup': {
      'ko': '',
      'en': '',
    },
    'baui5q41': {
      'ko': '',
      'en': '',
    },
    'c31gdtjl': {
      'ko': '',
      'en': '',
    },
    '8yhiplwt': {
      'ko': '',
      'en': '',
    },
    'ixy8x8ft': {
      'ko': '',
      'en': '',
    },
    'wfagqe05': {
      'ko': '',
      'en': '',
    },
    'fv47hm3t': {
      'ko': '',
      'en': '',
    },
    '85ovme0y': {
      'ko': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
