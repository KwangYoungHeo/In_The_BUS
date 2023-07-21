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
public class TestMemberDTO {

	@NonNull private String id;
	private String nickname;
	private String profile_img;

}
