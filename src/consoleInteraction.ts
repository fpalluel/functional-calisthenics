import {Observable} from "rxjs";
import * as ops from 'rxjs/operators'
import {Subject} from "rxjs/Subject";

import * as readline from 'readline';
import {displayScore, nextScore, Score} from "./TennisLogic";

const ifc = readline.createInterface(process.stdin, process.stdout)

const consoleInteracter: Subject<Score> = new Subject();

const inputReceiver: Subject<{ score, ballWinner }> = new Subject();

consoleInteracter.asObservable().subscribe(score => {
    ifc.write('score: ' + displayScore(score) + "\n");
    ifc.question('winner of next ball?', ballWinner => inputReceiver.next({score, ballWinner}));
});

inputReceiver.subscribe(({score, ballWinner}) => {
    let nextScoreValue = nextScore(score)(ballWinner);
    consoleInteracter.next(nextScoreValue)
});


consoleInteracter.next([0, 0])

