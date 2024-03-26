# glsl-hsluv

This is a [glslify](https://github.com/glslify/glslify) module for converting colors from [HSLUV](https://www.hsluv.org) to RGB. This is essentially a glslify compatible version of [hsluv-glsl](https://github.com/williammalo/hsluv-glsl/).

# usage

```javascript
const regl = require('regl')()
const glsl = require('glslify')

const squareGeometry = [
  // top left triangle
  [-1, 1],
  [-1, -1],
  [1, 1],
  // bottom right triangle
  [-1, -1],
  [1, -1],
  [1, 1],
]

const draw = regl({
  vert: `
    precision highp float;
    attribute vec2 position;
    varying vec2 vPosition;

    void main () {
      gl_Position = vec4(position, 0, 1);
      vPosition = position;
    }
  `,
  frag: glsl`
    precision highp float;
    uniform float tick;
    varying vec2 vPosition;

    #pragma glslify: hsluv = require('glsl-hsluv/hsluv-to-rgb')

    // https://www.hsluv.org
    const vec3 blue = vec3(260.9, 100.0, 50.0);

    void main () {
      float d = distance(vPosition, vec2(0.0));
      vec3 color = hsluv(vec3(blue.xy, d * 100.0));
      gl_FragColor = vec4(color, 1.0);
    }
  `,
  attributes : {
    position: squareGeometry,
  },
  uniforms: {
    tick: ({ tick }) => tick,
  },
  count: squareGeometry.length,
})

regl.frame(() => {
  regl.clear({
    color: [1, 1, 1, 1],
  })
  draw()
})

```
