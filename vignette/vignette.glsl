vec4 vignette(vec4 color, float boost, float reduction, vec2 resolution) {
  vec2 center = resolution * 0.5;
  float vignette = distance(center, gl_FragCoord.xy)  / resolution.x;
  vignette = boost - vignette * reduction;
  return vec4(color.rgb * vignette, 1.0);
}

#pragma glslify: export(vignette)