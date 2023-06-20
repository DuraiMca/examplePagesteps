import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WizardScreen extends StatefulWidget {
  final List<Widget>? widgets;
  final Color activeColor;
  final Color inactiveColor;
  final VoidCallback? onFinish;
  final String nextButtonText;
  final String finishButtonText;
  final double borderRadius;
  final List<Icon>? stepIcons;

  WizardScreen({
    Key? key,
    this.widgets,
    this.activeColor = const Color.fromARGB(255, 184, 154, 67),
    this.inactiveColor = Colors.blueGrey,
    this.onFinish,
    this.nextButtonText = 'Next',
    this.finishButtonText = 'Finish',
    this.borderRadius = 0.0,
    this.stepIcons,
  }) : super(key: key);

  @override
  _WizardScreenState createState() => _WizardScreenState();
}

class _WizardScreenState extends State<WizardScreen> {
  late List<WizardStep> _steps;
  int _currentStep = 0;

  @override
  void initState() {
    _steps = widget.widgets!.map((widget) => WizardStep(widget: widget)).toList();
    super.initState();
  }

  void _nextStep() {
    setState(() {
      if (_currentStep < _steps.length - 1) {
        _currentStep++;
      } else {
        if (widget.onFinish != null) {
          widget.onFinish!();
        }
      }
    });
  }

  void _previousStep() {
    setState(() {
      if (_currentStep > 0) {
        _currentStep--;
      }
    });
  }

  Widget _buildProgressIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: _steps.map((step) {
          final isActive = _steps.indexOf(step) <= _currentStep;
          final colors = isActive ? widget.activeColor : widget.inactiveColor;
          return Expanded(
            child: Container(
              height: 8.0,
              decoration: BoxDecoration(
                color: colors,
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    _buildProgressIndicator(),
                    Expanded(child: _steps[_currentStep].widget),
                  ],
                ),
              ),
              Container(
                 width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: _nextStep,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _currentStep == _steps.length - 1 ? widget.finishButtonText : widget.nextButtonText,
                            ),
                            if (widget.stepIcons != null && _currentStep < widget.stepIcons!.length)
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: widget.stepIcons![_currentStep],
                              ),
                          ],
                        ),
                      ),
                    
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class WizardStep {
  final Widget widget;

  WizardStep({required this.widget});
}
