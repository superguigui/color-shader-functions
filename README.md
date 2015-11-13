Color shader functions
====

These methods are to be used with glslify.


## Installation
With npm, to be used with browserify and glslify transform.
```bash
npm install color-shader-functions --save
```

## Usage
```glsl
uniform sampler2D tInput;
uniform vec2 resolution;
uniform float time;

varying vec2 vUv;

// Import the methods you need
#pragma glslify: vignette = require(color-shader-functions/vignette)
#pragma glslify: bsc = require(color-shader-functions/bsc)
#pragma glslify: film = require(color-shader-functions/film)

void main() {
  vec4 color = texture2D(tInput, vUv);

  color = vignette(color, 1.4, 2.3, resolution);
  color = bsc(color, 0.8, 0.8, 0.9);
  color = film(color, vUv, time, 2048.0, 0.4, 0.3);

  gl_FragColor = color;
}
```
