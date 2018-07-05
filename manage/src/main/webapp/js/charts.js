
var xAxisData = [];
var chart1data1=[],chart1data2=[];
var chart2data1=[],chart2data2=[];
     
getChart();
var timer3 = setInterval(function(){
    getChart();
    getTheTime();
}, timeB);

function getChart(){
    $.ajax({
      type: 'POST',
      url: 'http://'+getHost()+'/resources/tv/show!chart.action',
      dataType: 'json',
      success: function(data){
        
        if (data.code == 'succ') {
	      xAxisData = [];
	      chart1data1=[],chart1data2=[];
	      chart2data1=[],chart2data2=[];
          var chartArr = data.data;
          for (var i = 0 ; i < chartArr.length; i++) {
            
              xAxisData.push((chartArr[i].date+'').substring(5,10))
              
              chart1data1.push((chartArr[i].betmoney)/100)
              chart1data2.push((chartArr[i].chargemoney)/100)
              chart2data1.push(chartArr[i].betcount)
              chart2data2.push(chartArr[i].rechargeusercount)
              container1();
              container();
          };
        }else{
            alert('出错了！');
        };
      }
    });    
}



// var xAxisData = [ '9月1日', '9月2日',  '9月3日', '9月4日', '9月5日',  '9月6日', '9月7日'  ]
// var data1 = [40009.9, 70001.5, 100006.4, 120009.2, 50000.0, 170006.0, 151035.6];
// var data2 = [80003.6, 78000.8, 98000.5, 90003.4, 100006.0, 80004.5, 100005.0];

function container1() {
    $('#container1').highcharts({
        credits: { enabled:false },
        exporting: { enabled:false },
        chart: {
            type: 'column'
        },
        title: {
            text: '近七天趋势图'
        },
        subtitle: {
            text: ''
        },
        xAxis: {
            categories: xAxisData,
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: ''
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: false,
                borderWidth: 0,  
                dataLabels:{
                  enabled:true, // dataLabels设为true
                  style:{
                      color:'#2a2a2a'
                  }
                }
            }
        },
        series: [{
            name: '销量（元）',
            color:'#ff7a7a',
            data: chart1data1
        }, {
            name: '充值（元）',
            color:'#87c2ff',
            data: chart1data2
        }]
    });
};
function container() {
    $('#container').highcharts({
        credits: { enabled:false },
        exporting: { enabled:false },
        chart: {
            type: 'line'
        },
        title: {
            text: '近七天趋势图'
        },
        subtitle: {
            text: ''
        },
        xAxis: {
            allowDecimals: false,
            labels: {
                formatter: function () {
                    return this.value; // clean, unformatted number for year
                }
            },
            categories: xAxisData,
            crosshair: true
        },
        yAxis: {
            title: {
                text: ''
            },
            labels: {
                formatter: function () {
                    return this.value;
                    return this.value / 1000 + 'k';
                }
            }
        },
        tooltip: {
            pointFormat: '{series.name} <b>{point.y:,.0f}</b>'
        },
        plotOptions: {
            line: {
                dataLabels: {
                    enabled: true          // 开启数据标签
                },
                // enableMouseTracking: false // 关闭鼠标跟踪，对应的提示框、点击事件会失效
            },
            area: {
                pointStart: 1940,
                marker: {
                    enabled: false,
                    symbol: 'circle',
                    radius: 2,
                    states: {
                        hover: {
                            enabled: true
                        }
                    }
                }
            }
        },
        series: [{
            name: '投注用户数（个）',
            color:'#ff7a7a',
            data: chart2data1
        }, {
            name: '充值用户数（个）',
            color:'#87c2ff',
            data: chart2data2
        }]
    });
};