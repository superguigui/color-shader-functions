vec4 bsc(vec4 color, float brightness, float saturation, float contrast) {
   vec3 bColor = color.rgb * brightness;
   float intensity = dot(bColor, vec3(0.2125, 0.7154, 0.0721));
   return vec4(mix(vec3(0.5), mix(vec3(intensity), bColor, saturation), contrast), color.a);
}

#pragma glslify: export(bsc)