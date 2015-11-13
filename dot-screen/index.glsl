const float angle = 1.57;

float pattern(vec2 pos, vec2 resolution, float scale) {
  vec2 center = .5 * resolution;
  float s = sin(angle), c = cos(angle);
  vec2 tex = pos * resolution - center;
  vec2 point = vec2(c * tex.x - s * tex.y, s * tex.x + c * tex.y) * scale;
  return (sin(point.x) * sin(point.y)) * 4.0;
}

vec4 dotScreen(vec4 color, vec2 pos, vec2 resolution, float scale) {
  float average = (color.r + color.g + color.b) / 3.0;
  return vec4(vec3(average * 10.0 - 5.0 + pattern(pos, resolution, scale)), color.a);
}

#pragma glslify: export(dotScreen)