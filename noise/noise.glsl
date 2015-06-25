float random(vec2 n, float offset ){
  return 0.5 - fract(sin(dot(n.xy + vec2( offset, 0. ), vec2(12.9898, 78.233)))* 43758.5453);
}

vec4 noise(vec4 color, vec2 pos, float time, float amount, float speed) {
  return color + vec4(vec3(amount * random(pos, 0.00001 * speed * time)), 1.0);
}

#pragma glslify: export(noise)