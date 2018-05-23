export type ScoreAndBallWinner = { score: Score, ballWinner: string };
type Score = [number, number]
type ScoreWithFormatting = { score: Score, formattedScore: string }

function toScoreWithFormatting(nextScoreValue) {
    return {
        score: nextScoreValue,
        formattedScore: formatScore(nextScoreValue)
    };
}

export function nextScoreWithFormatting({score, ballWinner}: ScoreAndBallWinner): ScoreWithFormatting {
    let nextScoreValue = nextScore(score)(ballWinner); // violates no naming of values only functions
    return toScoreWithFormatting(nextScoreValue);
}

export function createInitialScore(): ScoreWithFormatting {
    let initialScore: Score = [0, 0]; // violates no naming of values only functions
    return {score: initialScore, formattedScore: formatScore(initialScore)};
}

function formatScore(score: Score) {
    // Fake todo implement
    return score.toString()
}

function nextScore(score: Score): (ballWinner: any) => Score {
    // Fake todo implement
    return ballWinner => [score[0] + 1, score[1]]
}
