package site.inthebus.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
public class BookmarkDTO {
	
	@NonNull private String id;
	@NonNull private String bus_id;
	@NonNull private String station_id;
	private String bus_name;
	

}
