export type Score = [number, number]

export function displayScore(score: Score) {
    return score.toString()
}

export function nextScore(score: Score): (ballWinner: any) => Score {
    return ballWinner => [score[0] + 1, score[1]]
}
