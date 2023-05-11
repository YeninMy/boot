<!DOCTYPE html>
<html>
<head>
    <title>Simple Test</title>
    <style>
        .hidden {
            display: none;
        }
    </style>
</head>
<body>
<button id="start">Start Test</button>
<div id="test" class="hidden">
    <p id="question"></p>
    <input type="number" id="answer" min="1" max="4">
    <button id="next">Next Question</button>
</div>
<div id="result" class="hidden"></div>
<script>
    var questions = [
        { question: "2+2=?", answers: [1, 2, 3, 4], correct: 4 },
        { question: "3-2=?", answers: [1, 2, 3, 4], correct: 1 },
        { question: "1+2=?", answers: [1, 2, 3, 4], correct: 3 },
        { question: "3+2=?", answers: [1, 2, 3, 4], correct: 5 },
        { question: "5*0=?", answers: [1, 2, 3, 4], correct: 5 },
    ];
    var currentQuestion = 0;
    var score = 0;
    var userAnswers = [];

    document.getElementById('start').addEventListener('click', function() {
        document.getElementById('start').classList.add('hidden');
        document.getElementById('test').classList.remove('hidden');
        showQuestion();
    });

    document.getElementById('next').addEventListener('click', function() {
        var answer = document.getElementById('answer').value;
        userAnswers.push(answer);
        if (answer == questions[currentQuestion].correct) {
            score++;
        }
        currentQuestion++;
        if (currentQuestion < questions.length) {
            showQuestion();
        } else {
            endTest();
        }
    });

    function showQuestion() {
        document.getElementById('question').textContent = questions[currentQuestion].question;
        document.getElementById('answer').value = '';
    }

    function endTest() {
        document.getElementById('test').classList.add('hidden');
        var result = document.getElementById('result');
        result.classList.remove('hidden');
        result.innerHTML = '<p>Correct answers: ' + questions.map(q => q.correct).join(', ') + '</p>';
        result.innerHTML += '<p>Your answers: ' + userAnswers.join(', ') + '</p>';
        result.innerHTML += '<p>Score: ' + (score / questions.length * 100) + '%</p>';
    }
</script>
</body>
</html>