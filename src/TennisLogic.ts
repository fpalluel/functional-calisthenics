export type ScoreAndBallWinner = { score: Score, ballWinner: string };
type Score = [number, number]
type ScoreWithFormatting = { score: Score, formattedScore: string }

export function nextScoreWithFormatting({score, ballWinner}: ScoreAndBallWinner): ScoreWithFormatting {
    let nextScoreValue = nextScore(score)(ballWinner);
    return {
        score: nextScoreValue,
        formattedScore: formatScore(nextScoreValue)
    };
}

export function createInitialScore(): ScoreWithFormatting {
    let initialScore: Score = [0, 0];
    let formattedScore = formatScore(initialScore);
    return {score: initialScore, formattedScore};
}

function formatScore(score: Score) {
    return score.toString()
}

function nextScore(score: Score): (ballWinner: any) => Score {
    return ballWinner => [score[0] + 1, score[1]]
}
