/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./src/**/*.{html,js}', './node_modules/tw-elements/dist/js/**/*.js'],
  theme: {
    extend: {
      width: {
        '400': '400px',
        '1000':'1000px',
      }
    }
  },
  plugins: [

  ],
}
