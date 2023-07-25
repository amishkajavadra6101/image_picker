// Row(
// children: [
// const SizedBox(
// width: 20,
// ),
// RichText(
// text: TextSpan(
// text: AppLocalizations.of(context)!
// .translate("dont_have_an_account"),
// style: const TextStyle(
// color: ColorRes.black, fontSize: 12),
// children: [
// TextSpan(
// text: AppLocalizations.of(context)!
// .translate("sign_up"),
// style: const TextStyle(
// color: ColorRes.green,
// decoration:
// TextDecoration.underline,
// fontSize: 14),
// recognizer: TapGestureRecognizer()
// ..onTap = () {
// context.read<LoginBloc>().add(
// CheckVerificationEnabled(),
// );
// },
// )
// ],
// ),
// ),
// const Spacer(),
// DropdownButtonHideUnderline(
// child: DropdownButton<Item>(
// hint: const Text("Select item"),
// value: selectedUser,
// onChanged: (Item? value) {
// selectedUser = value!;
// String locale =
// (users.indexOf(value) == 0)
// ? 'en'
//     : 'ar';
// Provider.of<AppLanguage>(context,
// listen: false)
//     .changeLanguage(Locale(locale))
//     .then((value) => appState
//     .isLangArabic = (locale == 'ar'));
// setLanguage(locale);
// setState(() {});
// },
// items: users.map((Item user) {
// return DropdownMenuItem<Item>(
// value: user,
// child: Row(
// children: <Widget>[
// CustomSvgPicture(
// image: user.image,
// height: 30,
// width: 30,
// ),
// const SizedBox(
// width: 10,
// ),
// Text(
// user.name,
// style: const TextStyle(
// color: Colors.black),
// ),
// ],
// ),
// );
// }).toList(),
// ),
// ),
// const SizedBox(
// width: 20,
// ),
// ],
// ),

import 'package:flutter/material.dart';

class SpacerExample extends StatelessWidget {
  const SpacerExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('example of spacer'),
      ),
      body: const Center(
        child: Row(
          children: [
            Text('Begin'),
            Spacer(), // Defaults to a flex of one.
            Text('Middle'),
            // Gives twice the space between Middle and End than Begin and Middle.
            Spacer(flex: 2),
            Text('End'),
          ],
        ),
      ),
    );
  }
}
