#pragma glslify: hsluv_maxChromaForLH = require('./hsluv-max-chroma-for-lh')

vec3 hsluvToLch(vec3 tuple) {
    tuple.g *= hsluv_maxChromaForLH(tuple.b, tuple.r) * .01;
    return tuple.bgr;
}

#pragma glslify: export(hsluvToLch)
