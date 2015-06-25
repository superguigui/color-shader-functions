Color shader functions
====

These methods are to be used with glslify.

## Usage
```glsl
uniform sampler2D tInput;
uniform vec2 resolution;
uniform float time;

varying vec2 vUv;

// Import the methods you need
#pragma glslify: vignette = require(color-shader-functions/vignette/vignette.glsl)
#pragma glslify: bsc = require(color-shader-functions/bsc/bsc.glsl)
#pragma glslify: film = require(color-shader-functions/film/film.glsl)

void main() {
  vec4 color = texture2D(tInput, vUv);

  color = vignette(color, 1.4, 2.3, resolution);
  color = bsc(color, 0.8, 0.8, 0.9);
  color = film(color, vUv, time, 2048.0, 0.4, 0.3);
  color = sepia(color, 0.2);

  gl_FragColor = color;
}
``