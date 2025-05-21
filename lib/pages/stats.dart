import 'package:flutter/material.dart';
import 'package:kg_charts/kg_charts.dart';
import '../models/radar_data.dart';

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final List<double> weights = [12.2, 16.1, 15.0, 16.3];
  final List<double> heights = [50.0, 54.5, 59.2, 63.7];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildPageIndicator(int index) {
    return Container(
      width: 8.0,
      height: 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? Colors.deepPurple : Colors.grey.shade300,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final modelIndex = _currentPage.clamp(0, radarData.length - 1);
    final double currentWeight =
        weights.length > modelIndex ? weights[modelIndex] : 0.0;
    final double currentHeight =
        heights.length > modelIndex ? heights[modelIndex] : 0.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Child Development Statistic",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      if (_currentPage > 0) {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                    },
                  ),
                  Expanded(
                    child: Text(
                      radarData.isNotEmpty
                          ? radarData[modelIndex].legend.first.name
                          : "N/A",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      if (_currentPage < radarData.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.344,
              child: PageView.builder(
                controller: _pageController,
                itemCount: radarData.length,
                itemBuilder: (context, index) {
                  final model = radarData[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: RadarWidget(
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
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  radarData.length,
                  (index) => _buildPageIndicator(index),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Highlight",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F0F5),
                        borderRadius: BorderRadius.circular(15.0),
                        border: const Border(
                          top: BorderSide(color: Colors.red, width: 4.0),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.accessibility,
                                    size: 30,
                                    color: Colors.deepPurple,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "Weight",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    "$currentWeight",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const Text(
                                    " KG.",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Save Data",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey[400],
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F0F5),
                        borderRadius: BorderRadius.circular(15.0),
                        border: const Border(
                          top: BorderSide(color: Colors.red, width: 4.0),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.height,
                                    size: 30,
                                    color: Colors.deepPurple,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "Height",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    "$currentHeight",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const Text(
                                    " CM.",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Save Data",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey[400],
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
