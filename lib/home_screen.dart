import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this)..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  Widget customRow(String title, data){
    return Padding(
      padding: const EdgeInsets.only(left: 10,bottom: 5,right: 10,top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              Text(data,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            ],
          ),
          SizedBox(height: 5,),
          Divider(
            color: Colors.teal,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(height: height * .1,),
            const PieChart(
              animationDuration: Duration(milliseconds: 1200),
                colorList: [
                  Color(0xff4285F4),
                  Color(0xff1aa260),
                  Color(0xffde5246),
                ],
                chartType: ChartType.ring,
                legendOptions: LegendOptions(
                  legendPosition: LegendPosition.left
                ),
                chartRadius: 140,

                dataMap: {
              'Total' : 30,
              'Recovered' : 20,
              'Deaths' : 10,
            },
            ),
            SizedBox(height: height * 0.11,),
            Card(
              color: Colors.teal,
              child: Column(
                children: [
                  customRow('Total', '200'),
                  customRow('Total', '200'),
                  customRow('Total', '200'),
                ],
              ),
            ),
            SizedBox(height: height * 0.05,),
            Container(
              height: height * .06,
              width: width * .8,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: Text('Track Countries',style: TextStyle(fontWeight: FontWeight.w400),)),
            )
          ],
        ),
      ),
    );
  }
}
