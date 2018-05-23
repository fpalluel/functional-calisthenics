import {Observable} from "rxjs/Observable";
import * as ops from 'rxjs/operators'
import {Subject} from "rxjs/Subject";
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/do';

import * as readline from 'readline';
import {
    createInitialScore,
    nextScoreWithFormatting,
    ScoreAndBallWinner,
} from "./TennisLogic";

function setupInteractionLoop() {
    function displayAndAskForWinner({score, formattedScore}) {
        ifc.write('score: ' + formattedScore + "\n");
        ifc.question('winner of next ball?', ballWinner => {
            inputReceiver.next({score, ballWinner});
        });
    }

    const ifc = readline.createInterface(process.stdin, process.stdout)
    const inputReceiver: Subject<ScoreAndBallWinner> = new Subject();
    inputReceiver
        .map(nextScoreWithFormatting) // non mutable
        .do(displayAndAskForWinner)
        .subscribe();
    return displayAndAskForWinner;
}


const displayAndAskForBallWinner = setupInteractionLoop();
let initialScore = createInitialScore();
displayAndAskForBallWinner(initialScore)

