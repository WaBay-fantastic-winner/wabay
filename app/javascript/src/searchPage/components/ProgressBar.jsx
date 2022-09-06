import React , { useState, useEffect } from 'react';
import './ProgressBar.css'

const Progress = ({done}) => {
	const [style, setStyle] = useState({});
	
	useEffect(() => {
		const newStyle = {
			opacity: 1,
			width: `${done >= 100 ? 100 : done}%`
		}	
		setStyle(newStyle);
	},[]);
	
	return (
		<div className="progress">
			<span>{done}%</span>
			<div className="progress-done" style={style}>
			</div>
		</div>
	)
}

export default Progress;