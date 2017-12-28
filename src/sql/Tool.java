package sql;

public class Tool {

	public String row2time(int row){
		System.out.println(row);
		String timeStr = new String();
		switch(row) {
		case 1:timeStr =  "0900";break;
		case 2:timeStr =  "0930";break;
		case 3:timeStr =  "1000";break;
		case 4:timeStr =  "1030";break;
		case 5:timeStr =  "1100";break;
		case 6:timeStr =  "1130";break;
		case 7:timeStr =  "1200";break;
		case 8:timeStr =  "1230";break;
		case 9:timeStr =  "1300";break;
		case 10:timeStr =  "1330";break;
		case 11:timeStr =  "1400";break;
		case 12:timeStr =  "1430";break;
		case 13:timeStr =  "1500";break;
		case 14:timeStr =  "1530";break;
		case 15:timeStr =  "1600";break;
		case 16:timeStr =  "1630";break;		
		}
		System.out.println(timeStr);
		return timeStr;
		
	}

	public int addDate(int date, String changeType ) {			
			if(changeType.equals("daily")){				
				date = this.add1day(date);		
			}			
			else{				
				 date = this.add7days(date);
			}						
			return date;				
		}
						
	public int add1day(int date) {
		int year = date / 10000;
		int month =(date % 10000) / 100;
		int day = date % 100;
		
		if(month ==2 && day == 28) {			
			month = month +1;
			day = 1;			
		}
		else if ( day == 30 && (month == 2|| month ==4 || month == 6 || month == 9 || month == 11  )) {			
			month = month +1;
			day = 1;			
		}
		else if(day == 31) {			
			month = month +1;
			day = 1;	
		}
		else {			
			day = day+1;
		}
		
		date = year * 10000 + month *100 + day;
		return date;
	}
		
	private int add7days(int date) {		
		int year = date / 10000;
		int month =(date % 10000) / 100;
		int day = date % 100;
		
		for(int i = 0; i < 7; i++){		
			System.out.println(year);
			System.out.println(month);
			System.out.println(day);
		
			if(month ==2 && day == 28) {
				month = month +1;
				day = 1;			
			}
			else if ((month == 2 || month == 4 || month == 6 || month == 9 || month == 11  )& day == 30) {
				month = month +1;
				day = 1;			
			}
			else if(day == 31) {
				month = month +1;
				day = 1;	
			}
			else {
				day = day+1;
			}
		}
		
		date = year * 10000 + month *100 + day;
		return date;				
	}
	
	public float getDuration(int startTime, int endTime) {
		float startHour = startTime / 100;
		float startMin = startTime % 100;
		float endHour = endTime / 100;
		float endMin = endTime % 100;		
		float startPeriod = startHour + startMin / 60;
		float endPeriod = endHour + endMin / 60;
		float duration = endPeriod - startPeriod;
		return duration;
	}
	
	public int getPeriod(int startTime, int endTime) {
		int startHour = startTime / 100;
		int startMin = startTime % 100;
		int endHour = endTime / 100;
		int endMin = endTime % 100;		
		int startPeriod = startHour * 4 + startMin / 15;
		int endPeriod = endHour * 4 + endMin / 15;
		int period = endPeriod - startPeriod;
		return period;
	}
	
}
 