import 'package:flutter/material.dart';
import 'package:image_example/helper/button.dart';
import 'package:image_example/Speech_to_ext/speech_screen.dart';
import 'package:image_example/agora_rtc_enginee/video_call.dart';
import 'package:image_example/agora_ui_kit.dart';
import 'package:image_example/flutter_animation/animation_home.dart';
import 'package:image_example/device_info_pluse.dart';
import 'package:image_example/expended_example.dart';
import 'package:image_example/file_picker_example.dart';
import 'package:image_example/flutter_easy_loading_example.dart';
import 'package:image_example/flutter_favorite_package/favorite_package_home/package_home.dart';
import 'package:image_example/intl_example.dart';
import 'package:image_example/key/keyhome/key_home.dart';
import 'package:image_example/media_query_example.dart';
import 'package:image_example/package_info_plus.dart';
import 'package:image_example/path_provider_example.dart';
import 'package:image_example/richtext_example.dart';
import 'package:image_example/silvers/flutter_silver_home.dart';
import 'package:image_example/spacer_example.dart';
import 'package:image_example/tableview.dart';
import 'package:image_example/toast_example.dart';
import 'package:image_example/url_launcher_exampler.dart';
import '../PageView/page_builder_example.dart';
import '../Scrollbar/scrollbar_example.dart';
import '../agora_rtc_enginee/dropdwon_buttonhide_underline.dart';
import '../cached_network_image_example.dart';
import '../dio_example.dart';
import '../fire_store_example.dart';
import '../fittedbox_example.dart';
import '../geolocator_example.dart';
import '../image_picker_example.dart';

class SilverAppBar extends StatefulWidget {
  const SilverAppBar({Key? key}) : super(key: key);

  @override
  State<SilverAppBar> createState() => _SilverAppBarState();
}

class _SilverAppBarState extends State<SilverAppBar> {
  String appBarText = "Sliver AppBar";

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
      SliverAppBar(
        floating: true,
        stretch: true,
        pinned: true,
        backgroundColor: Colors.red,
        expandedHeight: 300,
        flexibleSpace: FlexibleSpaceBar(
          stretchModes: const [StretchMode.zoomBackground,StretchMode.blurBackground],
          centerTitle: true,
          title: const Text("Sliver AppBar"),
          background: Image.asset(
            "assets/camera_lense.jpeg",
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
      SliverToBoxAdapter(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                      builder: (context) => const SpeechScreen()));
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PackageHome()));
            }),
        HelperButton(
            text: "go to Agora video call",
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const VideoCall()));
            }),
        HelperButton(
            text: 'Agora uikit  video call',
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AgoraUiKit()));
            }),
        HelperButton(
            text: 'go to key example',
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const KeyHome()));
            }),
        HelperButton(
            text: 'firestore example',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FireStoreExample()));
            }),
        HelperButton(
            text: 'go device info pluse',
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Dinfo()));
            }),
        HelperButton(
            text: 'go Package info plus',
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Pinfo()));
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
                      builder: (context) => const CachedNetworkImageExample()));
            }),
        HelperButton(
            text: 'go to geolocator example',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GeolocatorExample()));
            }),
        HelperButton(
            text: 'flutter easy loading',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FlutterEasyLoadingExample()));
            }),
        HelperButton(
            text: 'go to path picker example',
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PathExample()));
            }),
        HelperButton(
            text: 'go to file picker example',
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FilePicker1()));
            }),
        HelperButton(
          text: 'go to url Launcher',
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Url1()));
          },
        ),
        HelperButton(
          text: 'go to image picker',
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ImagePickerExample()));
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
                    builder: (context) => const MediaQueryExample()));
          },
        ),
        HelperButton(
          text: 'Dio example',
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => DioExample()));
          },
        ),
        HelperButton(
          text: 'Intl example',
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const IntleExample()));
          },
        ),
        HelperButton(
          text: 'Example of Page View',
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyPageView()));
          },
        ),
        HelperButton(
          text: 'Example of Scrollbar',
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ScrollBarExample()));
          },
        ),
        HelperButton(
          text: 'Example of TableView',
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const TabBarViewWidget()));
          },
        ),
        HelperButton(
          text: 'Example of Spacer',
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SpacerExample()));
          },
        ),
        HelperButton(
          text: 'Example of fittedbox',
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FittedBoxExample()));
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
      ]))
    ]);
  }
}
