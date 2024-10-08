//GAME FUNCTIONALITY:
//Selecting all individual elements for main game:
const inputValueSelector = document.querySelector(".guess");
const checkButton = document.querySelector("main button");
const currentScoreSelector = document.querySelector(".score");
const currentHighscoreSelector = document.querySelector(".highscore");
const randomNumber = document.querySelector(".number");
const sectionRight = document.querySelector(".right");

//Creating variables to use in event listener:
let valueCurrentScore = 0;
let valueCurrentHighscore = 0;
let randomNumberValue = 0;
let savedCorrectGuesses = [];
//Audio variables:
let correctGuessAudio = new Audio('correctGuessAudio.mp3');
let wrongGuessAudio = new Audio('wrongGuessAudio.mp3');
randomNumberValue = Math.floor(Math.random() * 20 + 1);

//Event listener to check guessed number to random number:
checkButton.addEventListener("click", () => {
    //Valid input number check and value of input save:
    let currentValidNumber = 0;
    let booleanValidNumber = 0;
    if (inputValueSelector.value >= 1 && inputValueSelector.value <= 20) {
        currentValidNumber = parseInt(inputValueSelector.value);
        booleanValidNumber = 1;
    } else {
        booleanValidNumber = 0;
        window.alert("Error! Number has to be between 1 and 20!");
        inputValueSelector.value = "";
    }
    //Comparing random number with input and updating score/highscore and playing audio:
    if (currentValidNumber === randomNumberValue) {
        randomNumber.textContent = `${randomNumberValue}`;
        savedCorrectGuesses.push(randomNumberValue)
        valueCurrentScore++;
        currentScoreSelector.textContent = valueCurrentScore;
        checkHighScore(valueCurrentScore);
        valueCurrentScore = 0;
        inputValueSelector.value = "";
        correctGuessAudio.play();
    } else if (booleanValidNumber === 1) {
        valueCurrentScore++;
        currentScoreSelector.textContent = valueCurrentScore;
        inputValueSelector.value = "";
        randomNumber.textContent = `?`;
        wrongGuessAudio.play();
    }
    //Random number generator:
    if (booleanValidNumber === 1) {
        if (randomNumberValue === -1) {
            randomNumberValue = Math.floor(Math.random() * 20 + 1);
        } else if (currentValidNumber === randomNumberValue) {
            randomNumberValue = Math.floor(Math.random() * 20 + 1);
        }
    } else {
        randomNumber.textContent = `?`;
    }
})


//NEW HIGHSCORE UPDATE FUNCTIONALITY AND SAVED GUESSED NUMBERS:
//Selecting element:
const mainSelector = document.querySelector("main");

//Check highscore function:
const checkHighScore = (scoreValue) => {
    //Checks/updates if any highscore exist and if is lower than previous highscore:
    if (valueCurrentHighscore == 0 || valueCurrentScore < valueCurrentHighscore) {
        valueCurrentHighscore = valueCurrentScore;
        currentHighscoreSelector.textContent = scoreValue;
    }
    //History of guessed numbers:
    if (savedCorrectGuesses.length === 1) {
        const pPreviousGuesses = `<p>These are your previous guesses:</p>`
        sectionRight.insertAdjacentHTML("afterend", pPreviousGuesses)
        mainSelector.insertAdjacentHTML("beforeend", `${randomNumberValue}`);
    } else {
        mainSelector.insertAdjacentHTML("beforeend", `, ${randomNumberValue}`);
    }
}


//AGAIN BUTTON FUNCTIONALITY:
//Selecting "again" button:
const againButton = document.querySelector("header button");

//Adding event listener upon click to refresh page to reset:
againButton.addEventListener("click", () => {
    window.location.reload()
})