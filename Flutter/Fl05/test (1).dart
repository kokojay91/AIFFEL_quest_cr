import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(JellyfishClassifierApp());
}

class JellyfishClassifierApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JellyfishClassifierPage(),
    );
  }
}

class JellyfishClassifierPage extends StatelessWidget {
  final String apiUrl = "https://8ced-35-230-49-89.ngrok-free.app/sample"; // FastAPI 서버 URL

  // 예측 결과 요청 함수
  Future<void> fetchPrediction() async {
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'ngrok-skip-browser-warning': '69420',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print("예측 결과: ${data['predicted_label']}"); // 예측 결과를 디버그 콘솔에 출력
      } else {
        print("Error: 서버에서 실패 응답 (상태 코드: ${response.statusCode})");
      }
    } catch (e) {
      print("Error: $e"); // 에러를 디버그 콘솔에 출력
    }
  }

  // 예측 확률 요청 함수
  Future<void> fetchProbability() async {
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'ngrok-skip-browser-warning': '69420',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        double probability = double.parse(data['prediction_score']) * 100;
        print("예측 확률: ${probability.toStringAsFixed(2)}%"); // 예측 확률을 디버그 콘솔에 출력
      } else {
        print("Error: 서버에서 실패 응답 (상태 코드: ${response.statusCode})");
      }
    } catch (e) {
      print("Error: $e"); // 에러를 디버그 콘솔에 출력
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jellyfish Classifier"),
        leading: Icon(Icons.water),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 이미지 표시
          Container(
            width: 300,
            height: 300,
            child: Image.asset(
              'images/jellyfish.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          // 버튼들
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: fetchPrediction, // "예측 결과" 버튼 클릭 시 실행
                child: Text("예측 결과"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: fetchProbability, // "확률 확인" 버튼 클릭 시 실행
                child: Text("확률 확인"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
