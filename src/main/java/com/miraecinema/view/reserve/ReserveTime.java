package com.miraecinema.view.reserve;

import java.util.ArrayList;
import java.util.List;

public class ReserveTime {
	
	public List<String[]> schedule;
	
	public ReserveTime(){
		String[] theater0 = {"19:19"}; // 얘는 그냥 순번 맞추기용 가짜 시간임
		String[] theater1 = {"09:30", "10:40", "16:20", "18:40", "21:00"}; 
		String[] theater2 = {"09:20", "11:30", "15:50", "18:00", "20:10"}; 
		String[] theater3 = {"10:30", "15:10", "18:20", "22:00"};
		schedule = new ArrayList<>();
		schedule.add(theater1); 
		schedule.add(theater2); 
		schedule.add(theater3);
	}

}
