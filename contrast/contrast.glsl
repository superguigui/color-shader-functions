vec4 contrast(vec4 color, float value) {
  return vec4(color.rgb * value, color.a);
}

#pragma glslify: export(contrast)