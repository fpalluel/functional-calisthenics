module.exports = function () {
    return {
        files: [
            'src/*.ts',
            'tests/utils.ts',
            'tests/scores.json'
        ],

        tests: [
            'tests/*.test.ts'
        ],

        env: {
            type: 'node'
        }
    };
};