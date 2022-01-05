import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';

  List<Text> getCurrenciesPicker() {
    List<Text> dropDownItems = [];

    for (int i = 0; i < currenciesList.length; i++) {
      dropDownItems.add(Text(currenciesList[i]));
    }

    return dropDownItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: CupertinoPicker(
                  backgroundColor: Colors.lightBlue,
                  itemExtent: 35.0,
                  onSelectedItemChanged: (selectedIndex) {
                    print(selectedIndex);
                  },
                  children: getCurrenciesPicker())),
        ],
      ),
    );
  }
}

/***************************************
 * Android-style Dropdown
 ***************************************/
//List<DropdownMenuItem> getCurrenciesDropdown() {
//
//  List<DropdownMenuItem<String>> dropDownItems = [];
//
//  for (int i = 0; i < currenciesList.length; i++) {
//    var newItem = DropdownMenuItem(
//      child: Text(currenciesList[i]),
//      value: currenciesList[i],
//    );
//    dropDownItems.add(newItem);
//  }
//
//  return dropDownItems;
//}
//DropdownButton<String>(
//value: selectedCurrency,
//items: getCurrencies(),
//onChanged: (value) {
//setState(() {
//selectedCurrency = value;
//});
//}),
