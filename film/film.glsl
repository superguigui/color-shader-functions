vec4 film(vec4 color, vec2 pos, float ttime, float scCount, float scIntensity, float nIntensity) {
  float x = pos.x * pos.y * ttime *  1000.0;
  x = mod(x, 13.0) * mod(x, 123.0);
  float dx = mod(x, 0.01);
  vec2 sc = vec2(sin(pos.y * scCount), cos(pos.y * scCount));
  vec3 cResult = color.rgb + color.rgb * clamp(0.1 + dx * 100.0, 0.0, 1.0);
  cResult += color.rgb * vec3(sc.x, sc.y, sc.x) * scIntensity;
  cResult = color.rgb + clamp(nIntensity, 0.0, 1.0) * (cResult - color.rgb);
  return vec4(cResult, color.a);
}

#pragma glslify: export(film)