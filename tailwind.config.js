/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./src/**/*.{html,js}', './node_modules/tw-elements/dist/js/**/*.js'],
  theme: {
    minHeight: {
      '180': '180px',
    },
    minHeight: {
      '300px': '300px',
    },
    extend: {
      width: {
        '400': '400px',
        '800':'800px',
        '1000':'1000px'
      },
      height: {
        '500': '500px',
        '350': '350px',
        '70': '70px',
        '450': '450px',
        '400': '400px',
        '365': '365px',
        '380': '380px',
      }
    }
  },
  plugins: [

  ],
}
