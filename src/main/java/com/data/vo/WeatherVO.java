package com.data.vo;

public class WeatherVO {
	
	private String sdate,			// 날짜
				stdHour,			// 시간대
				unitCode,			// 휴게소코드
				unitName,			// 휴게소명
				routeNo,			// 노선번호
				routeName,			// 도로명
				updaownTypeCode,	// 기점종점방향구분코드
				xValue,				// x
				yValue,				// y
				tmxValue,			// tm_x
				tmyValue,			// tm_y
				addr,				// 주소
				addrCode,			// 기상실황지역코드
				addrName,			// 기상실황지역명
				weatherContents,	// 현재일기내용
				sensoryTemp,		// 체감온도
				highestTemp,		// 최고온도
				lowestTemp,			// 최저온도
				rainfallValue;		// 강수량

	// constructor -------------------------------------------------------------------------
	public WeatherVO() { }
	public WeatherVO(String sdate, String stdHour, String unitCode, String unitName, String routeNo, String routeName,
			String updaownTypeCode, String xValue, String yValue, String tmxValue, String tmyValue, String addr,
			String addrCode, String addrName, String weatherContents, String sensoryTemp, String highestTemp,
			String lowestTemp, String rainfallValue) {
		this.sdate = sdate;
		this.stdHour = stdHour;
		this.unitCode = unitCode;
		this.unitName = unitName;
		this.routeNo = routeNo;
		this.routeName = routeName;
		this.updaownTypeCode = updaownTypeCode;
		this.xValue = xValue;
		this.yValue = yValue;
		this.tmxValue = tmxValue;
		this.tmyValue = tmyValue;
		this.addr = addr;
		this.addrCode = addrCode;
		this.addrName = addrName;
		this.weatherContents = weatherContents;
		this.sensoryTemp = sensoryTemp;
		this.highestTemp = highestTemp;
		this.lowestTemp = lowestTemp;
		this.rainfallValue = rainfallValue;
	}
			
	// getter setter -----------------------------------------------------------------------
	public String getSdate() { return sdate; }
	public void setSdate(String sdate) { this.sdate = sdate; }
	public String getStdHour() { return stdHour; }
	public void setStdHour(String stdHour) { this.stdHour = stdHour; }
	public String getUnitCode() { return unitCode; }
	public void setUnitCode(String unitCode) { this.unitCode = unitCode; }
	public String getUnitName() { return unitName; }
	public void setUnitName(String unitName) { this.unitName = unitName; }
	public String getRouteNo() { return routeNo; }
	public void setRouteNo(String routeNo) { this.routeNo = routeNo; }
	public String getRouteName() { return routeName; }
	public void setRouteName(String routeName) { this.routeName = routeName; }
	public String getUpdaownTypeCode() { return updaownTypeCode; }
	public void setUpdaownTypeCode(String updaownTypeCode) { this.updaownTypeCode = updaownTypeCode; }
	public String getxValue() { return xValue; }
	public void setxValue(String xValue) { this.xValue = xValue; }
	public String getyValue() { return yValue; }
	public void setyValue(String yValue) { this.yValue = yValue; }
	public String getTmxValue() { return tmxValue; }
	public void setTmxValue(String tmxValue) { this.tmxValue = tmxValue; }
	public String getTmyValue() { return tmyValue; }
	public void setTmyValue(String tmyValue) { this.tmyValue = tmyValue; }
	public String getAddr() { return addr; }
	public void setAddr(String addr) { this.addr = addr; }
	public String getAddrCode() { return addrCode; }
	public void setAddrCode(String addrCode) { this.addrCode = addrCode; }
	public String getAddrName() { return addrName; }
	public void setAddrName(String addrName) { this.addrName = addrName; }
	public String getWeatherContents() { return weatherContents; }
	public void setWeatherContents(String weatherContents) { this.weatherContents = weatherContents; }
	public String getSensoryTemp() { return sensoryTemp; }
	public void setSensoryTemp(String sensoryTemp) { this.sensoryTemp = sensoryTemp; }
	public String getHighestTemp() { return highestTemp; }
	public void setHighestTemp(String highestTemp) { this.highestTemp = highestTemp; }
	public String getLowestTemp() { return lowestTemp; }
	public void setLowestTemp(String lowestTemp) { this.lowestTemp = lowestTemp; }
	public String getRainfallValue() { return rainfallValue; }
	public void setRainfallValue(String rainfallValue) { this.rainfallValue = rainfallValue; }

}
