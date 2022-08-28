import React from 'react'
import AboutUs from './text/AboutUs'

const Footer = () => {
  return (
    <section>
        <div>
            {AboutUs.map((item, index) => index === 0 ? <h2>{item}</h2> : <li>{item}<li/>)}
        </div>
    </section>
  )
}

export default Footer