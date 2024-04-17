/**
 * webpack.config-cli.js
 * Copyright: Microsoft 2018
 */

const path = require('path');
const CopyPlugin = require('copy-webpack-plugin');
const { cacheConfig, monorepoResourceNameMapper, tsconfigResolveAliases } = require('../../build/lib/webpack');

const outPath = path.resolve(__dirname, 'dist');
const typeshedFallback = path.resolve(__dirname, '..', 'pyright-internal', 'typeshed-fallback');

// ! Cython
// Watcher doesn't seem to watch symlinked files in copy plugin
// So copy manually.
const libGdb = path.resolve(__dirname, '..', 'vscode-cython-debug', 'lib');
const externGdb = path.resolve(__dirname, '..', 'vscode-cython-debug', '_external');
const cythonGdb = path.resolve(externGdb, 'cython', 'Cython', 'Debugger');
const libCython = path.resolve(cythonGdb, 'libcython.py');
const libPython = path.resolve(cythonGdb, 'libpython.py');
const gdb = path.resolve(externGdb, 'binutils-gdb', 'gdb', 'python', 'lib', 'gdb');
const destGdb = 'lib';
const destPython = path.join(destGdb, 'python');
const destCygdb = path.join(destPython, 'cygdb');

/**@type {(env: any, argv: { mode: 'production' | 'development' | 'none' }) => import('webpack').Configuration}*/
module.exports = (_, { mode }) => {
    return {
        context: __dirname,
        entry: {
            extension: './src/extension.ts',
            server: './src/server.ts',
        },
        target: 'node',
        output: {
            filename: '[name].js',
            path: outPath,
            libraryTarget: 'commonjs2',
            devtoolModuleFilenameTemplate:
                mode === 'development' ? '../[resource-path]' : monorepoResourceNameMapper('vscode-pyright'),
            clean: true,
        },
        devtool: mode === 'development' ? 'source-map' : 'nosources-source-map',
        cache: mode === 'development' ? cacheConfig(__dirname, __filename) : false,
        stats: {
            all: false,
            errors: true,
            warnings: true,
            publicPath: true,
            timings: true,
        },
        resolve: {
            extensions: ['.ts', '.js'],
            alias: tsconfigResolveAliases('tsconfig.json'),
        },
        externals: {
            vscode: 'commonjs vscode',
            fsevents: 'commonjs2 fsevents',
        },
        module: {
            rules: [
                {
                    test: /\.ts$/,
                    loader: 'ts-loader',
                    options: {
                        configFile: 'tsconfig.json',
                    },
                },
            ],
        },
        plugins: [
            new CopyPlugin({
                patterns: [
                    { from: typeshedFallback, to: 'typeshed-fallback' },
                    { from: libGdb, to: destGdb },
                    { from: libCython, to: path.join(destCygdb, 'libcython.py') },
                    { from: libPython, to: path.join(destCygdb, 'libpython.py') },
                    { from: gdb, to: path.join(destPython, 'gdb') },
                ],
            }),
        ],
    };
};
