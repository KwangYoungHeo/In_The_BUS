package site.inthebus.function;

import java.util.ArrayList;
import java.util.List;

public class BusNoCheck {
	// 버스 노선 추가할 때 마다 case추가하고 전역 변수로 해당 노선의 정류장 리스트 생성할 것
	// 추후 DB에 담을 것, 현재는 정보가 적으므로 이곳에 작성
	// 매월 06번 기점 -> 종점
	List<Integer> list_06forward = new ArrayList<>(
			List.of(2109, 2100, 2155, 2261, 2023, 2032, 2022, 2254, 3179, 3185, 3184, 3104, 3091, 3189, 3195, 3138,
					3143, 1136, 1127, 1008, 1004, 1010, 4566, 4564, 4165, 4174, 4170, 4217, 4653, 4224, 4310));

	// 매월 06번 종점 -> 기점
	List<Integer> list_06reverse = new ArrayList<>(
			List.of(4311, 4239, 4684, 4171, 4175, 4164, 4415, 4421, 1009, 1003, 1007, 1126, 1134, 3144, 3145, 3364,
					3190, 3093, 3105, 3183, 3186, 3363, 2253, 2021, 2031, 2024, 2260, 2154, 2099, 2110));

	// 진월 07번 기점 -> 종점
	List<Integer> list_07forward = new ArrayList<>(List.of(3161, 3155, 3159, 3228, 3241, 3236, 3243, 3209, 3212, 3091,
			3189, 3195, 3138, 3143, 1136, 1127, 1116, 1118, 4523, 4527, 4539, 4334, 4349, 4551, 4407, 4379, 4361, 4369,
			4197, 4250, 4253, 4474, 4468, 4466));

	// 진월 07번 종점 -> 기점
	List<Integer> list_07reverse = new ArrayList<>(
			List.of(4467, 4475, 4254, 4251, 4198, 4368, 4377, 4380, 4406, 4552, 4348, 4333, 4534, 4513, 1114, 1111,
					1134, 3144, 3145, 3364, 3190, 3093, 3213, 3210, 3242, 3235, 3240, 3160, 3156, 3162));

	// 수완 03번 기점 -> 종점
	List<Integer> list_03forward = new ArrayList<>(List.of(5424, 5441, 5454, 5442, 5701, 5703, 5745, 5743, 5728, 5296,
			5306, 2002, 2004, 4434, 4349, 1706, 1027, 1017, 1047, 1141, 3207, 3210, 3235, 3240, 3148, 3230, 3231, 3272,
			3283, 3285, 3288, 3168, 3146, 3342, 3340, 3156, 3162));

	// 수완 03번 종점 -> 기점
	List<Integer> list_03reverse = new ArrayList<>(List.of(3161, 3155, 3341, 3343, 3147, 3169, 3287, 3286, 3284, 3273,
			3232, 3229, 3227, 3241, 3236, 3209, 3208, 1142, 1048, 1018, 1026, 4561, 4348, 4435, 2003, 2001, 5305, 5297,
			5727, 5742, 5744, 5702, 5700, 5406, 5418, 5403, 4124));

	// 운림 54번 기점 -> 종점
	List<Integer> list_54forward = new ArrayList<>(List.of(1162, 1158, 1166, 1154, 1160, 1100, 1167, 1163, 1151, 1149,
			1147, 1045, 1041, 1129, 1008, 1004, 1010, 4566, 4564, 4165, 4174, 4418, 4426, 4248, 4386, 4379, 4361, 4373,
			4369, 4572, 4196, 4203, 4211));

	// 운림 54번 종점 -> 기점
	List<Integer> list_54reverse = new ArrayList<>(List.of(4210, 4204, 4205, 4209, 4368, 4374, 4378, 4380, 4414, 4249,
			4419, 4175, 4164, 4425, 4415, 4421, 1002, 1003, 1007, 1128, 1044, 1046, 1146, 1139, 1150, 1152, 1157, 1164,
			1168, 1101, 1161, 1165, 1159, 1162));

	public ArrayList<List<Integer>> makeStationList(String busNo, int arsID) {

		int forward_index = 0;
		int reverse_index = 0;
		ArrayList<List<Integer>> listCarrier = new ArrayList<>();

		List<Integer> list_forward = new ArrayList<>();
		List<Integer> list_reverse = new ArrayList<>();

		StringBuilder slice = new StringBuilder();
		for (char c : busNo.toCharArray()) {
			if (Character.isDigit(c)) {
				slice.append(c);
			}
		}

		int busNum = Integer.parseInt(slice.toString());

		switch (busNum) {
		case 06:
			list_forward = list_06forward;
			list_reverse = list_06reverse;

			forward_index = list_forward.indexOf(arsID);
			reverse_index = list_reverse.indexOf(arsID);

			if (forward_index != -1) {

				listCarrier.add(0, list_forward);
				listCarrier.add(1, list_reverse);
				return listCarrier;
			} else if (reverse_index != -1) {

				listCarrier.add(0, list_reverse);
				listCarrier.add(1, list_forward);
				return listCarrier;
			} else {
				break;
			}
		case 07:
			list_forward = list_07forward;
			list_reverse = list_07reverse;

			forward_index = list_forward.indexOf(arsID);
			reverse_index = list_reverse.indexOf(arsID);

			if (forward_index != -1) {

				listCarrier.add(0, list_forward);
				listCarrier.add(1, list_reverse);
				return listCarrier;
			} else if (reverse_index != -1) {

				listCarrier.add(0, list_reverse);
				listCarrier.add(1, list_forward);
				return listCarrier;
			} else {
				break;
			}
		case 03:
			list_forward = list_03forward;
			list_reverse = list_03reverse;

			forward_index = list_forward.indexOf(arsID);
			reverse_index = list_reverse.indexOf(arsID);

			if (forward_index != -1) {

				listCarrier.add(0, list_forward);
				listCarrier.add(1, list_reverse);
				return listCarrier;
			} else if (reverse_index != -1) {

				listCarrier.add(0, list_reverse);
				listCarrier.add(1, list_forward);
				return listCarrier;
			} else {
				break;
			}
		case 54:
			list_forward = list_54forward;
			list_reverse = list_54reverse;

			forward_index = list_forward.indexOf(arsID);
			reverse_index = list_reverse.indexOf(arsID);

			if (forward_index != -1) {

				listCarrier.add(0, list_forward);
				listCarrier.add(1, list_reverse);
				return listCarrier;
			} else if (reverse_index != -1) {

				listCarrier.add(0, list_reverse);
				listCarrier.add(1, list_forward);
				return listCarrier;
			} else {
				break;
			}
			// 이곳에 추가하기
		}

		return null;
	}
}
