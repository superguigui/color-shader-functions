vec4 brightness(vec4 color, float value) {
  return color + vec4(value, value, value, 0.0);
}

#pragma glslify: export(brightness)