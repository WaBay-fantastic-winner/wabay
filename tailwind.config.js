/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./src/**/*.{html,js}', './node_modules/tw-elements/dist/js/**/*.js'],
  theme: {
    extend: {
      width: {
        '400': '400px',
        '800':'800px',
        '1000':'1000px'
      },
      height: {
        '500': '500px',
        '350': '350px'
      }
    }
  },
  plugins: [

  ],
}
