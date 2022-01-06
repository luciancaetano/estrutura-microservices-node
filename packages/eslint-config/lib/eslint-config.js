module.exports = {
    env: {
        es6: true,
        node: true,
    },
    extends: [
        'airbnb-base',
        'plugin:@typescript-eslint/recommended',
    ],
    globals: {
        Atomics: 'readonly',
        SharedArrayBuffer: 'readonly',
    },
    parser: '@typescript-eslint/parser',
    parserOptions: {
        ecmaVersion: 2018,
        sourceType: 'module',
    },
    plugins: ['@typescript-eslint'],
    rules: {
        'no-plusplus': 'off',
        // 'import/extensions': 'off',
        'import/no-extraneous-dependencies': 'off',
        'no-shadow': 'off',
        '@typescript-eslint/no-shadow': 'error',
        indent: 'off',
        'lines-between-class-members': 'off',
        '@typescript-eslint/indent': ['error', 4],
        'max-classes-per-file': 'off',
        'linebreak-style': 'off',
        '@typescript-eslint/triple-slash-reference': 'off',
        'no-await-in-loop': 'off',
        '@typescript-eslint/no-var-requires': 'off',
        '@typescript-eslint/explicit-module-boundary-types': 'off',
        '@typescript-eslint/no-explicit-any': 'off',
        'import/prefer-default-export': 'off',
        'class-methods-use-this': 'off',
        'max-len': 'off',
        'import/extensions': [
            'error',
            'ignorePackages',
            {
                ts: 'never',
            },
        ],
    },
    settings: {
        'import/resolver': {
            typescript: {},
        },
    },
};
