//Selecting all individual elements
const inputValueSelector = document.querySelector(".guess");
const checkButton = document.querySelector("main button");
const currentScoreSelector = document.querySelector(".score");
const currentHighscoreSelector = document.querySelector(".highscore");
const randomNumber = document.querySelector(".number");

//Creating variables to use in event listener
let valueCurrentScore = 0;
let valueCurrentHighscore = 0;
let randomNumberValue = 0;
randomNumberValue = Math.floor(Math.random() * 20 + 1);


checkButton.addEventListener("click", () => {
    //Valid input number check and value of input save
    let currentValidNumber = 0;
    let booleanValidNumber = 0;
    if (inputValueSelector.value >= 1 && inputValueSelector.value <= 20) {
        currentValidNumber = parseInt(inputValueSelector.value);
        booleanValidNumber = 1;
        //Debug
        console.log(`CurrentValidNumber: ${currentValidNumber}`);
        console.log(booleanValidNumber);
    } else {
        booleanValidNumber = 0;
        //Debug
        console.log("False")
        console.log(booleanValidNumber);
    }
    //Comparing random number with input and updating score/highscore
    if (currentValidNumber === randomNumberValue) {
        randomNumber.textContent = `${randomNumberValue}`;
        valueCurrentScore++;
        currentScoreSelector.textContent = valueCurrentScore;
        checkHighScore(valueCurrentScore);
        valueCurrentScore = 0;
        inputValueSelector.value = "";
        //Debug
        console.log("true they are same");
    } else if (booleanValidNumber === 1) {
        valueCurrentScore++;
        currentScoreSelector.textContent = valueCurrentScore;
        inputValueSelector.value = "";
        randomNumber.textContent = `?`;
        //Debug
        console.log("false they are different");
        console.log(`This is current score ${currentScoreSelector.textContent}`);
    }
    //Random number generator
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


const checkHighScore = (scoreValue) => {
    if (valueCurrentHighscore == 0 || valueCurrentScore < valueCurrentHighscore) {
        valueCurrentHighscore = valueCurrentScore;
        console.clear();
        currentHighscoreSelector.textContent = scoreValue;
        console.log(`NEW HIGHSCORE ${scoreValue}`);
    } else {
        console.clear();
        console.log("NO NEW Highscore");
    }
}
