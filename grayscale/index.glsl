const vec3 luma = vec3( .299, 0.587, 0.114 );

vec4 grayscale(vec4 color) {
  return vec4(vec3(dot(color.rgb, luma)), color.a);
}

#pragma glslify: export(grayscale)