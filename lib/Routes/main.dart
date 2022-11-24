import 'package:flutter/material.dart';
import 'package:sii_music/Page/MyLibrary.dart';
import 'package:sii_music/Page/Playlist.dart';
import 'package:sii_music/Page/Profile.dart';
import 'package:sii_music/Page/RightContainer.dart';
import 'package:sii_music/Page/Search.dart';
import 'package:sii_music/Page/Home.dart';

/**
 * @author[qq651]
 * @version[创建日期，2022/11/24 22:31]
 * @function[功能简介 ]
 **/
class Routes {
  static var routes = {
    "/home" : () => Home(),
    "/myLibrary" : () => MyLirary(),
    "/playlist" : () => Playlist(),
    "/profile" : () => Profile(),
    "/rightContainer" : () => RightContainer(),
    "/search" : () => Search(),
  };
}