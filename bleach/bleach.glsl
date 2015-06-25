const vec4 one = vec4(1.0);
const vec4 two = vec4(2.0);
const vec4 lumcoeff = vec4(0.2125,0.7154,0.0721,0.0);

vec4 bleach(vec4 color, float famount)  {
  vec4 luma = vec4(vec3(dot(color, lumcoeff)), color.a);
  vec4 amount = vec4(famount);
  float luminance = dot(color, lumcoeff);
  float mixamount = clamp((luminance - 0.45) * 10.0, 0.0, 1.0);
  vec4 branch1 = two * color * luma;
  vec4 branch2 = one - (two * (one - color) * (one - luma));
  vec4 result = mix(branch1, branch2, vec4(mixamount));
  return mix(color, result, amount);
}

#pragma glslify: export(bleach)