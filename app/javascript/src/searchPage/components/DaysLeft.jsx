import React from 'react'

const DaysLeft = ({endTime}) => {
  const  leftMillisecond = (new Date(endTime)) - (new Date());
  const  leftDays = parseInt(leftMillisecond/ 1000 / 60 / 60 / 24, 10);
  return (
    <span>
      倒數 {leftDays <= 0  ? 0 : leftDays } 天
    </span>
  )
}

export default DaysLeft