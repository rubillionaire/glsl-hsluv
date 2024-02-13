// https://www.hsluv.org
// https://github.com/williammalo/hsluv-glsl/

#pragma glslify: hsluvToLch = require('./hsluv-to-lch')
#pragma glslify: lchToRgb = require('./lch-to-rgb')

vec3 hsluvToRgb(vec3 tuple) {
    return lchToRgb(hsluvToLch(tuple));
}

#pragma glslify: export(hsluvToRgb)