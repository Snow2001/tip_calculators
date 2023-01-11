import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final String id = 'home_page';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();
  List<bool> _selection = [true, false, false];
  String? tip;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              if(tip != null)
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(tip!, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),),
                ),

              Text('Total Amount'),
              SizedBox(
                width: 70,
                child: TextField(
                  controller: controller,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: ('\$100.00')
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: ToggleButtons(
                  children: [
                    Text('10'), Text('15'), Text('20'),
                  ],
                  isSelected: _selection,
                  onPressed: updateSelection,
                ),
              ),
              ElevatedButton(
                onPressed: _calculetetip,
                child: Text('Calculator'),
              )
            ],
          ),
        ),
      ),
    );
  }
  void updateSelection(int selectedndex){
    setState(() {
      for(int i = 0; i <_selection.length; i++){
        _selection[i] = selectedndex == i;
      }
    });
  }
  void _calculetetip(){
    final totalAmount = double.parse(controller.text);
    final selectedIndex = _selection.indexWhere((element) => element);
    final tipPersentage = [0.1, 0.15, 0.2][selectedIndex];

    final total = (totalAmount * tipPersentage).toStringAsFixed(2);

    setState(() {
      tip = ('\$$total');
    });
  }
}
