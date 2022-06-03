module.exports = function () {
  return {
    presets: [
      [
        require('@babel/preset-env'),
        {
          targets: {
            node: 'current',
          },
          useBuiltIns: 'usage',
          corejs: '3.21',
        },
      ],
    ],
    plugins: [],
  };
};
