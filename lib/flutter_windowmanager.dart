import 'dart:async';

import 'package:flutter/services.dart';

class FlutterWindowManager {
  // Flags for WindowManager.LayoutParams, as per
  // https://developer.android.com/reference/android/view/WindowManager.LayoutParams.html
  static const int FLAG_ALLOW_LOCK_WHILE_SCREEN_ON = 0x00000001;
  static const int FLAG_ALT_FOCUSABLE_IM = 0x00020000;
  static const int FLAG_DIM_BEHIND = 0x00000002;
  static const int FLAG_FORCE_NOT_FULLSCREEN = 0x00000800;
  static const int FLAG_FULLSCREEN = 0x00000400;
  static const int FLAG_HARDWARE_ACCELERATED = 0x01000000;
  static const int FLAG_IGNORE_CHEEK_PRESSES = 0x00008000;
  static const int FLAG_KEEP_SCREEN_ON = 0x00000080;
  static const int FLAG_LAYOUT_INSET_DECOR = 0x00010000;
  static const int FLAG_LAYOUT_IN_SCREEN = 0x00000100;
  static const int FLAG_LAYOUT_NO_LIMITS = 0x00000200;
  static const int FLAG_NOT_FOCUSABLE = 0x00000008;
  static const int FLAG_NOT_TOUCHABLE = 0x00000010;
  static const int FLAG_NOT_TOUCH_MODAL = 0x00000020;
  static const int FLAG_SCALED = 0x00004000;
  static const int FLAG_SECURE = 0x00002000;
  static const int FLAG_SHOW_WALLPAPER = 0x00100000;
  static const int FLAG_SPLIT_TOUCH = 0x00800000;
  static const int FLAG_WATCH_OUTSIDE_TOUCH = 0x00040000;
  static const int FLAG_BLUR_BEHIND = 0x00000004;
  static const int FLAG_DISMISS_KEYGUARD = 0x00400000;
  static const int FLAG_DITHER = 0x00001000;
  static const int FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS = 0x80000000;
  static const int FLAG_LAYOUT_ATTACHED_IN_DECOR = 0x40000000;
  static const int FLAG_LAYOUT_IN_OVERSCAN = 0x02000000;
  static const int FLAG_LOCAL_FOCUS_MODE = 0x10000000;
  static const int FLAG_SHOW_WHEN_LOCKED = 0x00080000;
  static const int FLAG_TOUCHABLE_WHEN_WAKING = 0x00000040;
  static const int FLAG_TRANSLUCENT_NAVIGATION = 0x08000000;
  static const int FLAG_TRANSLUCENT_STATUS = 0x04000000;
  static const int FLAG_TURN_SCREEN_ON = 0x00200000;

  static const MethodChannel _channel =
      const MethodChannel('flutter_windowmanager');

  static Future<bool> addFlags(int flags) async {
    return await _channel.invokeMethod("addFlags", {
      "flags": flags,
    });
  }

  static Future<bool> clearFlags(int flags) async {
    return await _channel.invokeMethod("clearFlags", {
      "flags": flags,
    });
  }
}
