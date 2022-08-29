// import { Progress } from 'antd';
import React , { useState } from 'react';
import './ProgressBar.css'

const Progress = ({done}) => {
	const [style, setStyle] = useState({});
	
	setTimeout(() => {
		const newStyle = {
			opacity: 1,
			width: `${done >= 100 ? 100 : done}%`
		}
		
		setStyle(newStyle);
	}, 200);
	
	return (
		<div className="progress">
			<span>{done}%</span>
			<div className="progress-done" style={style}>
			</div>
		</div>
	)
}

const ProgressBar = () => {
    return (
        <Progress done="90"/>
    )
};

export default ProgressBar;