function onChart(month, age, room, gender) {
	const ctx = document.getElementById('month');
    const ctx2 = document.getElementById('age');
    const ctx3 = document.getElementById('room');
    const ctx4 = document.getElementById('gender');

	if (month) {
		var label = [];
		var data = [];
		for (var i=0; i<12; i++) {
			label.push((i+1) + "월");
			data.push(0);
		}
		
		$.each(month, function(index, item) {
			data[item.name-1] = item.count;
		});
		
		new Chart(ctx, {
		        type: 'line',
		        data: {
		        labels: label,
		        datasets: [{
		            label: '월별 예약 현황',
		            data: data,
		            backgroundColor: bgColor,
		            borderColor: bdColor,
		            borderWidth: 1,
		            borderRadius: 15
		        }]
	        },
	        options: {
	            maintainAspectRatio: false,
	            scales: {
	                y: {
	                    beginAtZero: true
	                }
	            }
	        }
	    });
	}
    
	if (age) {
		var label = [];
		var data = [];
		$.each(age, function(index, item) {
			label.push(item.name);
			data.push(item.count);
			//alert(`${index} ${item.name}`);
		});
		
		new Chart(ctx2, {
	        type: 'pie',
	        data: {
		        labels: label,
		        datasets: [{
		            label: '연령별 예약 현황',
		            data: data,
		            backgroundColor: bgColor,
		            borderColor: bdColor,
		            borderWidth: 1,
		            borderRadius: 0
		        }]
	        },
	        options: {
	            maintainAspectRatio: false,
	            responsive: true,
			    plugins: {
			      legend: {
			        position: 'top',
			      },
			      title: {
			        display: true,
			        text: '연령별 예약 현황'
			      }
			    }
	        }
	    });
	}
    
    if (room) {
		var label = [];
		var data = [];
		$.each(room, function(index, item) {
			label.push(item.name);
			data.push(item.count);
			//alert(`${index} ${item.name}`);
		});
		
		new Chart(ctx3, {
	        type: 'bar',
	        data: {
		        labels: label,
		        datasets: [{
		            label: '객실별 예약 현황',
		            data: data,
		            backgroundColor: bgColor,
		            borderColor: bdColor,
		            borderWidth: 1,
		            borderRadius: 0
		        }]
	        },
	        options: {
	            maintainAspectRatio: false,
	            scales: {
	                y: {
	                    beginAtZero: true
	                }
	            },
	            responsive: true,
	        }
	    });
	}
	
	if (gender) {
		alert
		var label = [];
		var data = [];
		$.each(gender, function(index, item) {
			label.push(item.name);
			data.push(item.count);
			//alert(`${index} ${item.name}`);
		});
		
		new Chart(ctx4, {
			type: 'doughnut',
	        data: {
		        labels: label,
		        datasets: [{
		            label: '성별 예약 현황',
		            data: data,
		            backgroundColor: bgColor,
		            borderColor: bdColor,
		            borderWidth: 1,
		            borderRadius: 0
		        }]
	        },
	        options: {
	            maintainAspectRatio: false,
	            responsive: true,
			    plugins: {
			      legend: {
			        position: 'top',
			      },
			      title: {
			        display: true,
			        text: '성별 예약 현황'
			      }
			    },
			    rotation: -90,
		        circumference: 180
	        }
	    });
	}
	
}


var bgColor = [
	            'rgba(255, 99, 132, 0.2)',
	            'rgba(255, 159, 64, 0.2)',
	            'rgba(255, 205, 86, 0.2)',
	            'rgba(75, 192, 192, 0.2)',
	            'rgba(54, 162, 235, 0.2)',
	            'rgba(153, 102, 255, 0.2)',
	            'rgba(201, 203, 207, 0.2)'
	            ];
		            
var bdColor = [
				'rgb(255, 99, 132)',
				'rgb(255, 159, 64)',
				'rgb(255, 205, 86)',
				'rgb(75, 192, 192)',
				'rgb(54, 162, 235)',
				'rgb(153, 102, 255)',
				'rgb(201, 203, 207)'
				];	