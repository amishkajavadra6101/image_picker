// ignore_for_file: use_build_context_synchronously

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:image_example/Speech_to_ext/speech_screen.dart';
import 'package:image_example/agora_rtc_enginee/video_call.dart';
import 'package:image_example/agora_ui_kit.dart';
import 'package:image_example/flutter_animation/animation_home.dart';
import 'package:image_example/device_info_pluse.dart';
import 'package:image_example/expended_example.dart';
import 'package:image_example/file_picker_example.dart';
import 'package:image_example/flutter_easy_loading_example.dart';
import 'package:image_example/flutter_favorite_package/favorite_package_home/package_home.dart';
import 'package:image_example/helper/button.dart';
import 'package:image_example/intl_example.dart';
import 'package:image_example/key/keyhome/key_home.dart';
import 'package:image_example/media_query_example.dart';
import 'package:image_example/package_info_plus.dart';
import 'package:image_example/path_provider_example.dart';
import 'package:image_example/qr_code_generator.dart';
import 'package:image_example/richtext_example.dart';
import 'package:image_example/silvers/flutter_silver_home.dart';
import 'package:image_example/smooth_page_indicator.dart';
import 'package:image_example/spacer_example.dart';
import 'package:image_example/syncfusion_flutter_datagrid.dart';
import 'package:image_example/tableview.dart';
import 'package:image_example/toast_example.dart';
import 'package:image_example/url_launcher_exampler.dart';
import 'package:permission_handler/permission_handler.dart';
import 'PageView/page_builder_example.dart';
import 'Scrollbar/scrollbar_example.dart';
import 'agora_rtc_enginee/dropdwon_buttonhide_underline.dart';
import 'audio_player.dart';
import 'cached_network_image_example.dart';
import 'dio_example.dart';
import 'email_verfication.dart';
import 'fire_store_example.dart';
import 'fittedbox_example.dart';
import 'form_field.dart';
import 'geolocator_example.dart';
import 'image_picker_example.dart';
import 'notificationservice/local_notification_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  // bool showingAlertDialog = false;

  @override
  void initState() {
    requestPermissions();
    LocalNotificationService.initialize(context);
    FirebaseAnalytics.instance.setCurrentScreen(screenName: 'Home_Screen');
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    // 1. This method call when app in terminated state and you get a notification
    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        if (message != null) {
          if (message.data['_id'] != null) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const GeolocatorExample(),
            ));
          }
        }
      }, //firebase gave you headsup notifaction in background but firebace not gave headsup notification while app in foreground
    );
    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        if (message.notification != null) {
          debugPrint(message.notification!.title);
          debugPrint(message.notification!.body);
          // LocalNotificationService.display(message);
        }
      },
    );
    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        if (message.notification != null) {
          if (message.data['_id'] != null) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const FilePicker1(),
            ));
          }
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) async {
  //   super.didChangeAppLifecycleState(state);
  //   // if (showingAlertDialog && await Permission.camera.status.isGranted) {
  //   //   Navigator.pop(context);
  //   // }
  // }

  requestPermissions() async {
    PermissionStatus camera = await Permission.camera.status;

    if (!camera.isGranted) {
      await Permission.camera.request();
    }
    camera = await Permission.camera.status;
    if (camera.isGranted) {
      return;
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              content: const Text(
                'in order to work   properly application needs permission to access your camera',
                style: TextStyle(fontSize: 20),
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    await openAppSettings();
                    while (true) {
                      await Future.delayed(const Duration(milliseconds: 500));
                      camera = await Permission.camera.status;
                      if (camera.isGranted) {
                        Navigator.of(context).pop();
                        break;
                      }
                    }
                  },
                  child: const Text('Settings'),
                ),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('image picker'),
        ),
        body: Scrollbar(
          thumbVisibility: true,
          thickness: 10,
          radius: const Radius.circular(20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HelperButton(
                        text: 'Silvers',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FlutterSilver()));
                        }),
                    HelperButton(
                        text: 'Speech to Text with package',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  const SpeechScreen()));
                        }),
                    HelperButton(
                        text: 'Email Verification',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const EmailVerification()));
                        }),
                    HelperButton(
                        text: 'QR Code Generator',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const QrGeneratore()));
                        }),
                    HelperButton(
                        text: 'syncfusion flutter datagrid',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SyncfusionFlutterDatagrid()));
                        }),
                    HelperButton(
                        text: 'smooth page indicator',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SmoothPageIndicatorExample()));
                        }),
                    HelperButton(
                        text: 'Audio Player',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AudioPlayerExample()));
                        }),
                    HelperButton(
                        text: 'Form Field Example',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FormFieldExample()));
                        }),
                    HelperButton(
                        text: 'Animation Home',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AnimationHome()));
                        }),
                    HelperButton(
                        text: 'Flutter Animation Packages',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PackageHome()));
                        }),
                    HelperButton(
                        text: "go to Agora video call",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const VideoCall()));
                        }),
                    HelperButton(
                        text: 'Agora uikit  video call',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AgoraUiKit()));
                        }),
                    HelperButton(
                        text: 'go to key example',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const KeyHome()));
                        }),
                    HelperButton(
                        text: 'firestore example',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const FireStoreExample()));
                        }),
                    HelperButton(
                        text: 'go device info pluse',
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Dinfo()));
                        }),
                    HelperButton(
                        text: 'go Package info plus',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Pinfo()));
                        }),
                    HelperButton(
                        text: 'go to toast example',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ToastExample()));
                        }),
                    HelperButton(
                        text: 'cached_network_image',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CachedNetworkImageExample()));
                        }),
                    HelperButton(
                        text: 'go to geolocator example',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const GeolocatorExample()));
                        }),
                    HelperButton(
                        text: 'flutter easy loading',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const FlutterEasyLoadingExample()));
                        }),
                    HelperButton(
                        text: 'go to path picker example',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PathExample()));
                        }),
                    HelperButton(
                        text: 'go to file picker example',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FilePicker1()));
                        }),
                    HelperButton(
                      text: 'go to url Launcher',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Url1()));
                      },
                    ),
                    HelperButton(
                      text: 'go to image picker',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ImagePickerExample()));
                      },
                    ),
                    HelperButton(
                      text: 'Expended example',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ExpendedExample()));
                      },
                    ),
                    HelperButton(
                      text: 'Media Query example',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const MediaQueryExample()));
                      },
                    ),
                    HelperButton(
                      text: 'Dio example',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DioExample()));
                      },
                    ),
                    HelperButton(
                      text: 'Intl example',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const IntleExample()));
                      },
                    ),
                    HelperButton(
                      text: 'Example of Page View',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyPageView()));
                      },
                    ),
                    HelperButton(
                      text: 'Example of Scrollbar',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ScrollBarExample()));
                      },
                    ),
                    HelperButton(
                      text: 'Example of TableView',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TabBarViewWidget()));
                      },
                    ),

                    HelperButton(
                      text: 'Example of Spacer',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SpacerExample()));
                      },
                    ),
                    HelperButton(
                      text: 'Example of fittedbox',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const FittedBoxExample()));
                      },
                    ),
                    HelperButton(
                      text: 'DropdownButton Example',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const DropDownButtonHideUnderLineExample()));
                      },
                    ),
                    HelperButton(
                      text: 'example of rich text',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RichTextExample()));
                      },
                    ),
                  ]),
            ),
          ),
        ));
  }
}
