defmodule AlchemicAvatar.Color do
  @palettes [:google, :iwanthue]

  def from_name(username) do
    colors_palette = AlchemicAvatar.Config.colors_palette
    if colors_palette in @palettes do
      apply(AlchemicAvatar.Color, colors_palette, [username])
    else
      apply(AlchemicAvatar.Color, :google, [username])
    end
  end

  def google(username) do
    index = do_google_username(username)
    google_tuple() |> elem(index)
  end

  def iwanthue(username) do
    len = tuple_size(iwanthue_tuple())
    index = username |> hexdigest |> digest_to_index(len)
    iwanthue_tuple() |> elem(index)
  end

 # def randomcolor(username) do
		##lent
	#end

  defp do_google_username(username) do
    case username do
      <<char, _rest::binary>> when char in 97..122 ->
       char - 32 - 65
      <<char, _rest::binary>> when char in 65..90 ->
       char - 65
      <<char, _rest::binary>> when char in 48..57 ->
       <<char>> |> String.to_integer
      <<string::binary>> ->
        len = tuple_size(google_tuple())
        string |> hexdigest |> digest_to_index(len)
    end
  end

  defp hexdigest(data) when is_binary(data) do
    data |> :erlang.md5 |> Base.encode16(case: :lower)
  end

  defp digest_to_index(data, len) when is_binary(data) do
    data |> String.slice(0..15) |> String.to_integer(16) |> rem(len)
  end

  defp google_tuple do
    {
      [226, 95, 81], # A
      [242, 96, 145], # B
      [187, 101, 202], # C
      [149, 114, 207], # D
      [120, 132, 205], # E
      [91, 149, 249], # F
      [72, 194, 249], # G
      [69, 208, 226], # H
      [72, 182, 172], # I
      [82, 188, 137], # J
      [155, 206, 95], # K
      [212, 227, 74], # L
      [254, 218, 16], # M
      [247, 192, 0], # N
      [255, 168, 0], # O
      [255, 138, 96], # P
      [194, 194, 194], # Q
      [143, 164, 175], # R
      [162, 136, 126], # S
      [163, 163, 163], # T
      [175, 181, 226], # U
      [179, 155, 221], # V
      [194, 194, 194], # W
      [124, 222, 235], # X
      [188, 170, 164], # Y
      [173, 214, 125] # Z
    }
  end

  defp old_iwanthue_tuple do
    {
     [198,125,40],
     [61,155,243],
     [74,243,75],
     [238,89,166],
     [52,240,224],
     [177,156,155],
     [240,120,145],
     [111,154,78],
     [237,179,245],
     [237,101,95],
     [89,239,155],
     [43,254,70],
     [163,212,245],
     [65,152,142],
     [165,135,246],
     [181,166,38],
     [187,229,206],
     [77,164,25],
     [179,246,101],
     [234,93,37],
     [225,155,115],
     [142,140,188],
     [223,120,140],
     [249,174,27],
     [244,117,225],
     [137,141,102],
     [75,191,146],
     [188,239,142],
     [164,199,145],
     [173,120,149],
     [59,195,89],
     [222,198,220],
     [68,145,187],
     [236,204,179],
     [159,195,72],
     [188,121,189],
     [166,160,85],
     [181,233,37],
     [236,177,85],
     [121,147,160],
     [234,218,110],
     [241,157,191],
     [62,200,234],
     [133,243,34],
     [88,149,110],
     [59,228,248],
     [183,119,118],
     [251,195,45],
     [113,196,122],
     [197,115,70],
     [80,175,187],
     [103,231,238],
     [240,72,133],
     [228,149,241],
     [180,188,159],
     [172,132,85],
     [180,135,251],
     [236,194,58],
     [217,176,109],
     [88,244,199],
     [186,157,239],
     [113,230,96],
     [206,115,165],
     [244,178,163],
     [230,139,26],
     [241,125,89],
     [83,160,66],
     [107,190,166],
     [197,161,210],
     [198,203,245],
     [238,117,19],
     [228,119,116],
     [131,156,41],
     [145,178,168],
     [139,170,220],
     [233,95,125],
     [87,178,230],
     [157,200,119],
     [237,140,76],
     [229,185,186],
     [144,206,212],
     [236,209,158],
     [185,189,79],
     [34,208,66],
     [84,238,129],
     [133,140,134],
     [67,157,94],
     [168,179,25],
     [140,145,240],
     [151,241,125],
     [67,162,107],
     [200,156,21],
     [169,173,189],
     [226,116,189],
     [133,231,191],
     [194,161,63],
     [241,77,99],
     [241,217,53],
     [123,204,105],
     [210,201,119],
     [229,108,155],
     [240,91,72],
     [187,115,210],
     [240,163,100],
     [178,217,57],
     [179,135,116],
     [204,211,24],
     [186,135,57],
     [223,176,135],
     [204,148,151],
     [116,223,50],
     [95,195,46],
     [123,160,236],
     [181,172,131],
     [142,220,202],
     [240,140,112],
     [172,145,164],
     [228,124,45],
     [135,151,243],
     [42,205,125],
     [192,233,116],
     [119,170,114],
     [158,138,26],
     [73,190,183],
     [185,229,243],
     [227,107,55],
     [196,205,202],
     [132,143,60],
     [233,192,237],
     [62,150,220],
     [205,201,141],
     [106,140,190],
     [161,131,205],
     [135,134,158],
     [198,139,81],
     [115,171,32],
     [101,181,67],
     [149,137,119],
     [37,142,183],
     [183,130,175],
     [168,125,133],
     [124,142,87],
     [236,156,171],
     [232,194,91],
     [219,200,69],
     [144,219,34],
     [219,95,187],
     [145,154,217],
     [165,185,100],
     [127,238,163],
     [224,178,198],
     [119,153,120],
     [124,212,92],
     [172,161,105],
     [231,155,135],
     [157,132,101],
     [122,185,146],
     [53,166,51],
     [70,163,90],
     [150,190,213],
     [210,107,60],
     [166,152,185],
     [159,194,159],
     [39,141,222],
     [202,176,161],
     [95,140,229],
     [168,142,87],
     [93,170,203],
     [159,142,54],
     [14,168,39],
     [94,150,149],
     [187,206,136],
     [157,224,166],
     [235,158,208],
     [109,232,216],
     [141,201,87],
     [208,124,118],
     [142,125,214],
     [19,237,174],
     [72,219,41],
     [234,102,111],
     [168,142,79],
     [188,135,35],
     [95,155,143],
     [148,173,116],
     [223,112,95],
     [228,128,236],
     [206,114,54],
     [195,119,88],
     [235,140,94],
     [235,202,125],
     [233,155,153],
     [214,214,238],
     [246,200,35],
     [151,125,171],
     [132,145,172],
     [131,142,118],
     [199,126,150],
     [61,162,123],
     [58,176,151],
     [215,141,69],
     [225,154,220],
     [220,77,167],
     [233,161,64],
     [130,221,137],
     [81,191,129],
     [169,162,140],
     [174,177,222],
     [236,174,47],
     [233,188,180],
     [69,222,172],
     [71,232,93],
     [118,211,238],
     [157,224,83],
     [218,105,73],
     [126,169,36]
    }
  end

  defp iwanthue_tuple do
		# Generated by randomColor.js
		# Seed 7, hue: random
		{
			[121, 226, 247],
			[148, 201, 239],
			[183, 205, 244],
			[11, 26, 142],
			[39, 26, 124],
			[140, 82, 242],
			[183, 110, 229],
			[220, 143, 234],
			[242, 179, 237],
			[193, 13, 133],
			[239, 47, 131],
			[229, 75, 106],
			[229, 111, 105],
			[232, 163, 136],
			[242, 210, 176],
			[242, 189, 14],
			[237, 237, 42],
			[178, 214, 59],
			[151, 214, 83],
			[140, 216, 110],
			[159, 249, 154],
			[7, 198, 46],
			[28, 188, 97],
			[53, 196, 150],
			[76, 201, 191],
			[138, 226, 242],
			[167, 210, 239],
			[4, 59, 155],
			[21, 36, 132],
			[94, 73, 252],
			[147, 100, 234],
			[185, 127, 226],
			[224, 163, 237],
			[196, 3, 183],
			[252, 37, 188],
			[242, 67, 146],
			[229, 94, 123],
			[232, 127, 125],
			[234, 179, 159],
			[249, 126, 2],
			[232, 182, 32],
			[232, 229, 58],
			[184, 214, 74],
			[163, 216, 101],
			[178, 252, 146],
			[183, 255, 178],
			[21, 191, 52],
			[44, 193, 106],
			[68, 201, 154],
			[114, 249, 236],
			[155, 228, 239],
			[194, 229, 249],
			[15, 64, 142],
			[32, 47, 130],
			[103, 91, 239],
			[154, 117, 229],
			[193, 146, 229],
			[236, 190, 247],
			[193, 19, 185],
			[247, 56, 193],
			[237, 85, 156],
			[232, 116, 143],
			[234, 149, 147],
			[244, 200, 186],
			[239, 127, 21],
			[224, 174, 49],
			[232, 226, 76],
			[191, 216, 91],
			[177, 221, 119],
			[192, 252, 164],
			[29, 198, 13],
			[34, 193, 58],
			[59, 198, 115],
			[103, 252, 197],
			[131, 247, 233],
			[176, 234, 242],
			[9, 102, 153],
			[27, 70, 135],
			[82, 110, 249],
			[116, 107, 234],
			[165, 135, 229],
			[207, 170, 237],
			[155, 9, 196],
			[249, 44, 243],
			[242, 75, 197],
			[234, 105, 170],
			[234, 136, 160],
			[237, 168, 169],
			[244, 64, 9],
			[232, 129, 39],
			[216, 171, 65],
			[229, 222, 94],
			[198, 219, 107],
			[211, 252, 153],
			[72, 209, 4],
			[44, 196, 27],
			[49, 196, 68],
			[75, 204, 124],
			[118, 247, 198],
			[146, 244, 230],
			[1, 149, 165],
			[21, 102, 142],
			[37, 80, 135],
			[98, 124, 239],
			[130, 125, 232],
			[178, 155, 232],
			[231, 204, 255],
			[156, 25, 196],
			[244, 66, 241],
			[237, 94, 201],
			[232, 122, 179],
			[234, 154, 176],
			[252, 199, 201],
			[232, 68, 27],
			[224, 131, 56],
			[226, 182, 86],
			[229, 219, 110],
			[234, 252, 143],
			[220, 252, 171],
			[85, 198, 19],
			[60, 198, 41],
			[67, 204, 83],
			[111, 252, 162],
			[138, 247, 203],
			[167, 249, 236],
			[15, 141, 153],
			[31, 104, 137],
			[89, 160, 247],
			[114, 138, 234],
			[146, 143, 232],
			[197, 181, 242],
			[72, 10, 130],
			[201, 54, 249],
			[239, 84, 242],
			[234, 112, 206],
			[229, 139, 187],
			[242, 179, 198],
			[242, 16, 28],
			[221, 76, 44],
			[219, 136, 72],
			[226, 186, 106],
			[234, 224, 131],
			[238, 252, 161],
			[131, 206, 10],
			[97, 198, 33],
			[75, 201, 56],
			[83, 209, 96],
			[126, 247, 166],
			[155, 247, 209],
			[6, 173, 142],
			[25, 136, 142],
			[42, 109, 137],
			[105, 168, 239],
			[132, 155, 232],
			[163, 162, 232],
			[34, 3, 127],
			[74, 21, 127],
			[199, 73, 244],
			[232, 101, 237],
			[232, 129, 209],
			[232, 160, 199],
			[252, 5, 83],
			[229, 34, 47],
			[221, 90, 64],
			[229, 149, 96],
			[226, 191, 124],
			[252, 241, 161],
			[193, 219, 2],
			[136, 201, 24],
			[109, 201, 48],
			[93, 204, 71],
			[118, 252, 129],
			[143, 247, 176],
			[178, 255, 221],
			[18, 170, 140],
			[36, 136, 140],
			[95, 202, 244],
			[123, 178, 237],
			[150, 171, 232],
			[199, 199, 252],
			[38, 14, 117],
			[145, 60, 242],
			[199, 92, 242],
			[228, 119, 234],
			[232, 148, 216],
			[247, 190, 222],
			[239, 23, 95],
			[224, 53, 70],
			[221, 103, 82],
			[226, 156, 113],
			[229, 198, 144],
			[252, 242, 179],
			[187, 206, 16],
			[146, 204, 40],
			[121, 204, 63],
			[111, 209, 89],
			[133, 247, 141],
			[164, 249, 190],
			[12, 175, 99],
			[33, 178, 147]
			[47, 138, 140],
			[112, 207, 239],
			[140, 187, 234],
			[177, 193, 239],
			[8, 12, 127],
			[94, 50, 252],
			[146, 76, 232],
			[183, 100, 219],
			[225, 136, 232],
			[237, 170, 226],
			[252, 12, 152],
			[229, 43, 108],
			[221, 70, 88],
			[224, 117, 100],
			[226, 166, 131]
		}
  end
end
