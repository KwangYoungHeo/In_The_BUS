package site.inthebus.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class BusDataDTO {
	
	private int day_range;
	@NonNull private int day;
	@NonNull private String busNo;
	private String stationName;
	@NonNull private int ars_id;
	@NonNull private int time;
	private String inType;
	private int inCount;
	private int avgTemp;
	private int maxTemp;
	private int minTemp;
	private int rain;
	
	public BusDataDTO(int day_range, @NonNull int day, @NonNull String busNo, @NonNull int ars_id, @NonNull int time) {
		this.day_range = day_range;
		this.day = day;
		this.busNo = busNo;
		this.ars_id = ars_id;
		this.time = time;
	}

}
