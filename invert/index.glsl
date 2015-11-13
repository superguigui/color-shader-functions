vec4 invert(vec4 color) {
  return vec4(1.0 - color.rgb, color.a);
}

#pragma glslify: export(invert)