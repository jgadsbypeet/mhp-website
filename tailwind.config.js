/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './templates/**/*.html',
    './templates/**/*.twig',
    './src/styles/**/*.js'
  ],
  theme: {
    screens: {
      'xs': '420px',
      'sm': '600px',
      'md': '720px',
      'nav': '900px', // keep separately for easier updates on header navigation
      'lg': '1024px',
      'xl': '1280px',
      '2xl': '1440px',
    },
    fontFamily: {
      'display': ['sans-serif'],
      'heading': ['sans-serif'],
      'body': ['sans-serif'],
    },
    fontWeight: {
      normal: '400',
      medium: '500',
      semibold: '600',
    },
    fontSize: {
      reset: "62.5%",
      // for h1
      '4xl': ['4.8rem',  '4.4rem'],
      '4xl-lg': ['8.6rem', '7.8rem'],
      // for heading-3xl (used in statistics)
      '3xl': ['6.4rem',  '6rem'],
      '3xl-lg': ['8rem', '7.2rem'],
      // for heading-2xl (used in call to action)
      '2xl': ['4.8rem',  '4.4rem'],
      '2xl-lg': ['5.6rem', '5.2rem'],
      // for h2 / heading-xl
      'xl': ['3rem', '3.6rem'],
      'xl-lg': ['4.8rem', '5.6rem'],
      // for h3 / heading-lg
      'lg': ['2.4rem', '3rem'],
      'lg-lg': ['3rem', '3.8rem'],
      // for h4 / heading-md
      'h-md': ['1.9rem', '2.4rem'],
      'h-md-lg': ['2.5rem', '3.2rem'],
      // heading-sm
      'h-sm': ['1.7rem', '2.2rem'],
      'h-sm-lg': ['2.1rem', '2.8rem'],
      // heading-xs
      'h-xs': ['1.6rem', '2rem'],
      'h-xs-lg': ['1.9rem', '2.4rem'],
      // for body-md
      'md': ['1.9rem', '2.4rem'],
      'md-lg': ['2.5rem', '3.2rem'],
      // for body / body-sm
      'base': ['1.7rem', '2.2rem'],
      'base-lg': ['2.1rem', '2.8rem'],
      // for body-xs
      'xs': ['1.6rem', '2rem'],
      'xs-lg': ['1.9rem', '2.4rem'],
      // for body-2xs
      '2xs': ['1.4rem', '1.8rem'],
      '2xs-lg': ['1.6rem', '2rem'],
      // for body-3xs
      '3xs': ['1.2rem', '1.4rem'],
      '3xs-lg': ['1.4rem', '1.6rem'],
    },
    extend: {
      colors: {
        'grey': {
					'1': 'var(--color-grey-1)',
					'2': 'var(--color-grey-2)',
					'3': 'var(--color-grey-3)',
					'4': 'var(--color-grey-4)',
					'5': 'var(--color-grey-5)'
				},
        'interactions': {
          DEFAULT: '#0055FF',
          'hover': '#0044CC',
					'press': '#003399'
				},
        'focus': {
          'dark': 'var(--color-black)',
          'light': 'var(--color-yellow)',
        },
        'error': 'var(--color-red)',
				'primary-text': 'var(--color-black)',
        'secondary-text': 'var(--color-grey-1)',
				'reversed-text': 'white',
				'primary': 'var(--color-black)',
        'secondary': 'var(--color-grey-1)',
      },
      maxWidth: {
        'sm' : '600px',
        'md' : '768px',
        'lg' : '1088px',
        'xl' : '1240px',
      },
      spacing: {
        '1': '4px',
        '2': '8px',
        '3': '12px',
        '4': '16px',
        '5': '24px',
        '6': '32px',
        '7': '40px',
        '8': '48px',
        '9': '56px',
        '10': '64px',
        // responsive spacing
        '1-lg': '4px',
        '2-lg': '8px',
        '3-lg': '16px',
        '4-lg': '24px',
        '5-lg': '32px',
        '6-lg': '40px',
        '7-lg': '48px',
        '8-lg': '56px',
        '9-lg': '64px',
        '10-lg': '80px',
      },
      padding: {
        '4xs' : '4px',
        '3xs' : '6px',
        '2xs' : '8px',
        'xs' : '12px',
        'sm' : '16px',
        'md' : '20px',
        'lg' : '24px',
        'xl' : '32px',
        '2xl' : '40px',
        '3xl' : '48px',
        '4xl' : '56px',
        '5xl' : '64px',
      },
      margin: {
        '4xs' : '4px',
        '3xs' : '6px',
        '2xs' : '8px',
        'xs' : '12px',
        'sm' : '16px',
        'md' : '20px',
        'lg' : '24px',
        'xl' : '32px',
        '2xl' : '40px',
        '3xl' : '48px',
        '4xl' : '56px',
        '5xl' : '64px',
      },
      borderRadius: {
        'sm': '4px',
        DEFAULT: '8px',
        'md': '12px',
        'lg': '20px',
      },
      boxShadow: {
        'md': '0px 3px 15px rgba(0,0,0,0.2)',
      },
      // backgroundImage: {
      //   'hero-bubbles': "url('../images/graphics/hero-bubbles.svg')",
      // },
    },
  },
  plugins: [],
}