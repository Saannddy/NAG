import 'package:flutter/material.dart';
import 'package:kg_charts/kg_charts.dart';
import '../models/radar_data.dart';

class Stats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Child Development Statistic",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: radarData.length,
              itemBuilder: (context, index) {
                final model = radarData[index];
                return Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      model.legend.first.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 20),
                    (RadarWidget(
                      radarMap: model,
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      isNeedDrawLegend: false,
                      dilogText: (
                        IndicatorModel indicatorModel,
                        List<LegendModel> legendModels,
                        List<double> mapDataModels,
                      ) {
                        StringBuffer text = StringBuffer("");
                        for (int i = 0; i < mapDataModels.length; i++) {
                          text.write(
                            "${legendModels[i].name} : ${mapDataModels[i].toString()}",
                          );
                          if (i != mapDataModels.length - 1) {
                            text.write("\n");
                          }
                        }
                        return text.toString();
                      },
                    )),
                  ],
                );
              },
            ),
          ),
          Text(
            "Highlight",
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [SizedBox(width: 30), Text("B")],
          ),
        ],
      ),
    );
  }
}
