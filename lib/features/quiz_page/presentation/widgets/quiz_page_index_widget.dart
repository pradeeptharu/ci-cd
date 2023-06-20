import 'package:qa_lint/core/utils/constants/exports.dart';

class QuizPageIndexWidget extends StatefulWidget {
  const QuizPageIndexWidget({super.key});

  @override
  State<QuizPageIndexWidget> createState() => _QuizPageIndexWidgetState();
}

class _QuizPageIndexWidgetState extends State<QuizPageIndexWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToIndex(int index) {
    double itemOffset = index * (mediaQuerryHeight(context) * 0.05 + 30);
    double scrollOffset = itemOffset - mediaQuerryWidth(context) * 0.2;
    _scrollController.animateTo(scrollOffset,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);
    var currentQuestionIndex = quizProvider.currentQuestionIndex;
    var questionLength = quizProvider.quizQuestions.length;
    return SizedBox(
      height: mediaQuerryHeight(context) * 0.08,
      child: ListView.builder(
        controller: _scrollController,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: questionLength,
        itemBuilder: (BuildContext context, int index) {
          bool isButtonPressed = currentQuestionIndex == index;

          return Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: isButtonPressed
                      ? AppColor.buttonColor
                      : AppColor.backgroundColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColor.buttonColor),
                ),
                height: mediaQuerryHeight(context) * 0.05,
                width: mediaQuerryHeight(context) * 0.05,
                child: TextButton(
                  onPressed: () {
                    quizProvider.setCurrentQuestionIndex(index);
                    _scrollToIndex(index);
                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        return isButtonPressed ? Colors.white : Colors.black;
                      },
                    ),
                  ),
                  child: Text(
                    '${index + 1}',
                  ),
                ),
              ),
              const SizedBox(width: 30),
            ],
          );
        },
      ),
    );
  }
}
