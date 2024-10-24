// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  late Stopwatch _stopwatch;
  late Timer _timer;
  final List<String> _lapTimes = [];
  String displayTime = "00:00:00:00";

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    _timer = Timer.periodic(Duration(milliseconds: 30), (timer) {
      if (_stopwatch.isRunning) {
        setState(() {
          displayTime = _formatTime(_stopwatch.elapsed);
        });
      }
    });
  }

  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    final milliseconds =
        twoDigits(duration.inMilliseconds.remainder(1000) ~/ 10);
    return "$hours:$minutes:$seconds:$milliseconds";
  }

  void _startStopwatch() {
    setState(() {
      _stopwatch.start();
    });
  }

  void _pauseStopwatch() {
    setState(() {
      _stopwatch.stop();
    });
  }

  void _resetStopwatch() {
    setState(() {
      _stopwatch.reset();
      _lapTimes.clear();
      displayTime = "00:00:00:00";
    });
  }

  void _markRecord() {
    setState(() {
      _lapTimes.insert(0,
          _formatTime(_stopwatch.elapsed)); // Menambahkan catatan di awal list
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch',
            style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 240, 240, 240),
                fontSize: 22,
                fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 1, 9, 69),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/homepage.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Center(
                child: Text(
                  displayTime,
                  style: GoogleFonts.robotoMono(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    onPressed: _stopwatch.isRunning
                        ? _pauseStopwatch
                        : _startStopwatch,
                    child: Text(
                      _stopwatch.isRunning ? "Pause" : "Start",
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    onPressed: _resetStopwatch,
                    child: Text(
                      "Reset",
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    onPressed: _markRecord,
                    child: Text(
                      "Mark",
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  itemCount: _lapTimes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        "Lap ${_lapTimes.length - index}: ${_lapTimes[index]}",
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                child: Image(image: AssetImage('assets/images/calculator.png')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
