vec4 glitch(int byp, vec2 pos, sampler2D tDisp, vec3 seed, vec2 distortion, float col_s) {
  if (byp < 1) {
    float xs = floor(gl_FragCoord.x / 0.5);
    float ys = floor(gl_FragCoord.y / 0.5);
    vec4 normal = texture2D(tDisp, pos * seed.z * seed.z);

    if (pos.y < distortion.x + col_s && pos.y > distortion.x - col_s * seed.z) {
      if (seed.x > 0.) {
        pos.y = 1. - (pos.y + distortion.y);
      }
      else {
        pos.y = distortion.y;
      }
    }

    if (pos.x < distortion.y + col_s && pos.x > distortion.y - col_s * seed.z) {
      if (seed.y > 0.){
        pos.x = distortion.x;
      }
      else {
        pos.x = 1. - (pos.x + distortion.x);
      }
    }

    pos.x += normal.x * seed.x * (seed.z / 5.);
    pos.y += normal.y * seed.y * (seed.z / 5.);
    
    vec2 offset = amount * vec2(cos(angle), sin(angle));
    vec4 cr = texture2D(tInput, pos + offset);
    vec4 cga = color;
    vec4 cb = texture2D(tInput, pos - offset);

    color = vec4(cr.r, cga.g, cb.b, cga.a);
  }
}