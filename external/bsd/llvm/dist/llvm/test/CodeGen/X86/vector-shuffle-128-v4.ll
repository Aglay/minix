; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mcpu=x86-64 -x86-experimental-vector-shuffle-lowering | FileCheck %s --check-prefix=ALL --check-prefix=SSE --check-prefix=SSE2
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mcpu=x86-64 -mattr=+sse3 -x86-experimental-vector-shuffle-lowering | FileCheck %s --check-prefix=ALL --check-prefix=SSE --check-prefix=SSE3
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mcpu=x86-64 -mattr=+ssse3 -x86-experimental-vector-shuffle-lowering | FileCheck %s --check-prefix=ALL --check-prefix=SSE --check-prefix=SSSE3
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mcpu=x86-64 -mattr=+sse4.1 -x86-experimental-vector-shuffle-lowering | FileCheck %s --check-prefix=ALL --check-prefix=SSE --check-prefix=SSE41
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mcpu=x86-64 -mattr=+avx -x86-experimental-vector-shuffle-lowering | FileCheck %s --check-prefix=ALL --check-prefix=AVX --check-prefix=AVX1
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mcpu=x86-64 -mattr=+avx2 -x86-experimental-vector-shuffle-lowering | FileCheck %s --check-prefix=ALL --check-prefix=AVX --check-prefix=AVX2

target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-unknown"

define <4 x i32> @shuffle_v4i32_0001(<4 x i32> %a, <4 x i32> %b) {
; SSE-LABEL: shuffle_v4i32_0001:
; SSE:       # BB#0:
; SSE-NEXT:    pshufd {{.*#+}} xmm0 = xmm0[0,0,0,1]
; SSE-NEXT:    retq
;
; AVX-LABEL: shuffle_v4i32_0001:
; AVX:       # BB#0:
; AVX-NEXT:    vpshufd {{.*#+}} xmm0 = xmm0[0,0,0,1]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 0, i32 0, i32 0, i32 1>
  ret <4 x i32> %shuffle
}
define <4 x i32> @shuffle_v4i32_0020(<4 x i32> %a, <4 x i32> %b) {
; SSE-LABEL: shuffle_v4i32_0020:
; SSE:       # BB#0:
; SSE-NEXT:    pshufd {{.*#+}} xmm0 = xmm0[0,0,2,0]
; SSE-NEXT:    retq
;
; AVX-LABEL: shuffle_v4i32_0020:
; AVX:       # BB#0:
; AVX-NEXT:    vpshufd {{.*#+}} xmm0 = xmm0[0,0,2,0]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 0, i32 0, i32 2, i32 0>
  ret <4 x i32> %shuffle
}
define <4 x i32> @shuffle_v4i32_0112(<4 x i32> %a, <4 x i32> %b) {
; SSE-LABEL: shuffle_v4i32_0112:
; SSE:       # BB#0:
; SSE-NEXT:    pshufd {{.*#+}} xmm0 = xmm0[0,1,1,2]
; SSE-NEXT:    retq
;
; AVX-LABEL: shuffle_v4i32_0112:
; AVX:       # BB#0:
; AVX-NEXT:    vpshufd {{.*#+}} xmm0 = xmm0[0,1,1,2]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 0, i32 1, i32 1, i32 2>
  ret <4 x i32> %shuffle
}
define <4 x i32> @shuffle_v4i32_0300(<4 x i32> %a, <4 x i32> %b) {
; SSE-LABEL: shuffle_v4i32_0300:
; SSE:       # BB#0:
; SSE-NEXT:    pshufd {{.*#+}} xmm0 = xmm0[0,3,0,0]
; SSE-NEXT:    retq
;
; AVX-LABEL: shuffle_v4i32_0300:
; AVX:       # BB#0:
; AVX-NEXT:    vpshufd {{.*#+}} xmm0 = xmm0[0,3,0,0]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 0, i32 3, i32 0, i32 0>
  ret <4 x i32> %shuffle
}
define <4 x i32> @shuffle_v4i32_1000(<4 x i32> %a, <4 x i32> %b) {
; SSE-LABEL: shuffle_v4i32_1000:
; SSE:       # BB#0:
; SSE-NEXT:    pshufd {{.*#+}} xmm0 = xmm0[1,0,0,0]
; SSE-NEXT:    retq
;
; AVX-LABEL: shuffle_v4i32_1000:
; AVX:       # BB#0:
; AVX-NEXT:    vpshufd {{.*#+}} xmm0 = xmm0[1,0,0,0]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 1, i32 0, i32 0, i32 0>
  ret <4 x i32> %shuffle
}
define <4 x i32> @shuffle_v4i32_2200(<4 x i32> %a, <4 x i32> %b) {
; SSE-LABEL: shuffle_v4i32_2200:
; SSE:       # BB#0:
; SSE-NEXT:    pshufd {{.*#+}} xmm0 = xmm0[2,2,0,0]
; SSE-NEXT:    retq
;
; AVX-LABEL: shuffle_v4i32_2200:
; AVX:       # BB#0:
; AVX-NEXT:    vpshufd {{.*#+}} xmm0 = xmm0[2,2,0,0]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 2, i32 2, i32 0, i32 0>
  ret <4 x i32> %shuffle
}
define <4 x i32> @shuffle_v4i32_3330(<4 x i32> %a, <4 x i32> %b) {
; SSE-LABEL: shuffle_v4i32_3330:
; SSE:       # BB#0:
; SSE-NEXT:    pshufd {{.*#+}} xmm0 = xmm0[3,3,3,0]
; SSE-NEXT:    retq
;
; AVX-LABEL: shuffle_v4i32_3330:
; AVX:       # BB#0:
; AVX-NEXT:    vpshufd {{.*#+}} xmm0 = xmm0[3,3,3,0]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 3, i32 3, i32 3, i32 0>
  ret <4 x i32> %shuffle
}
define <4 x i32> @shuffle_v4i32_3210(<4 x i32> %a, <4 x i32> %b) {
; SSE-LABEL: shuffle_v4i32_3210:
; SSE:       # BB#0:
; SSE-NEXT:    pshufd {{.*#+}} xmm0 = xmm0[3,2,1,0]
; SSE-NEXT:    retq
;
; AVX-LABEL: shuffle_v4i32_3210:
; AVX:       # BB#0:
; AVX-NEXT:    vpshufd {{.*#+}} xmm0 = xmm0[3,2,1,0]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  ret <4 x i32> %shuffle
}

define <4 x i32> @shuffle_v4i32_2121(<4 x i32> %a, <4 x i32> %b) {
; SSE-LABEL: shuffle_v4i32_2121:
; SSE:       # BB#0:
; SSE-NEXT:    pshufd {{.*#+}} xmm0 = xmm0[2,1,2,1]
; SSE-NEXT:    retq
;
; AVX-LABEL: shuffle_v4i32_2121:
; AVX:       # BB#0:
; AVX-NEXT:    vpshufd {{.*#+}} xmm0 = xmm0[2,1,2,1]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 2, i32 1, i32 2, i32 1>
  ret <4 x i32> %shuffle
}

define <4 x float> @shuffle_v4f32_0001(<4 x float> %a, <4 x float> %b) {
; SSE-LABEL: shuffle_v4f32_0001:
; SSE:       # BB#0:
; SSE-NEXT:    shufps {{.*#+}} xmm0 = xmm0[0,0,0,1]
; SSE-NEXT:    retq
;
; AVX-LABEL: shuffle_v4f32_0001:
; AVX:       # BB#0:
; AVX-NEXT:    vpermilps {{.*#+}} xmm0 = xmm0[0,0,0,1]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x float> %a, <4 x float> %b, <4 x i32> <i32 0, i32 0, i32 0, i32 1>
  ret <4 x float> %shuffle
}
define <4 x float> @shuffle_v4f32_0020(<4 x float> %a, <4 x float> %b) {
; SSE-LABEL: shuffle_v4f32_0020:
; SSE:       # BB#0:
; SSE-NEXT:    shufps {{.*#+}} xmm0 = xmm0[0,0,2,0]
; SSE-NEXT:    retq
;
; AVX-LABEL: shuffle_v4f32_0020:
; AVX:       # BB#0:
; AVX-NEXT:    vpermilps {{.*#+}} xmm0 = xmm0[0,0,2,0]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x float> %a, <4 x float> %b, <4 x i32> <i32 0, i32 0, i32 2, i32 0>
  ret <4 x float> %shuffle
}
define <4 x float> @shuffle_v4f32_0300(<4 x float> %a, <4 x float> %b) {
; SSE-LABEL: shuffle_v4f32_0300:
; SSE:       # BB#0:
; SSE-NEXT:    shufps {{.*#+}} xmm0 = xmm0[0,3,0,0]
; SSE-NEXT:    retq
;
; AVX-LABEL: shuffle_v4f32_0300:
; AVX:       # BB#0:
; AVX-NEXT:    vpermilps {{.*#+}} xmm0 = xmm0[0,3,0,0]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x float> %a, <4 x float> %b, <4 x i32> <i32 0, i32 3, i32 0, i32 0>
  ret <4 x float> %shuffle
}
define <4 x float> @shuffle_v4f32_1000(<4 x float> %a, <4 x float> %b) {
; SSE-LABEL: shuffle_v4f32_1000:
; SSE:       # BB#0:
; SSE-NEXT:    shufps {{.*#+}} xmm0 = xmm0[1,0,0,0]
; SSE-NEXT:    retq
;
; AVX-LABEL: shuffle_v4f32_1000:
; AVX:       # BB#0:
; AVX-NEXT:    vpermilps {{.*#+}} xmm0 = xmm0[1,0,0,0]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x float> %a, <4 x float> %b, <4 x i32> <i32 1, i32 0, i32 0, i32 0>
  ret <4 x float> %shuffle
}
define <4 x float> @shuffle_v4f32_2200(<4 x float> %a, <4 x float> %b) {
; SSE-LABEL: shuffle_v4f32_2200:
; SSE:       # BB#0:
; SSE-NEXT:    shufps {{.*#+}} xmm0 = xmm0[2,2,0,0]
; SSE-NEXT:    retq
;
; AVX-LABEL: shuffle_v4f32_2200:
; AVX:       # BB#0:
; AVX-NEXT:    vpermilps {{.*#+}} xmm0 = xmm0[2,2,0,0]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x float> %a, <4 x float> %b, <4 x i32> <i32 2, i32 2, i32 0, i32 0>
  ret <4 x float> %shuffle
}
define <4 x float> @shuffle_v4f32_3330(<4 x float> %a, <4 x float> %b) {
; SSE-LABEL: shuffle_v4f32_3330:
; SSE:       # BB#0:
; SSE-NEXT:    shufps {{.*#+}} xmm0 = xmm0[3,3,3,0]
; SSE-NEXT:    retq
;
; AVX-LABEL: shuffle_v4f32_3330:
; AVX:       # BB#0:
; AVX-NEXT:    vpermilps {{.*#+}} xmm0 = xmm0[3,3,3,0]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x float> %a, <4 x float> %b, <4 x i32> <i32 3, i32 3, i32 3, i32 0>
  ret <4 x float> %shuffle
}
define <4 x float> @shuffle_v4f32_3210(<4 x float> %a, <4 x float> %b) {
; SSE-LABEL: shuffle_v4f32_3210:
; SSE:       # BB#0:
; SSE-NEXT:    shufps {{.*#+}} xmm0 = xmm0[3,2,1,0]
; SSE-NEXT:    retq
;
; AVX-LABEL: shuffle_v4f32_3210:
; AVX:       # BB#0:
; AVX-NEXT:    vpermilps {{.*#+}} xmm0 = xmm0[3,2,1,0]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x float> %a, <4 x float> %b, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  ret <4 x float> %shuffle
}
define <4 x float> @shuffle_v4f32_0011(<4 x float> %a, <4 x float> %b) {
; SSE-LABEL: shuffle_v4f32_0011:
; SSE:       # BB#0:
; SSE-NEXT:    unpcklps {{.*#+}} xmm0 = xmm0[0,0,1,1]
; SSE-NEXT:    retq
;
; AVX-LABEL: shuffle_v4f32_0011:
; AVX:       # BB#0:
; AVX-NEXT:    vunpcklps {{.*#+}} xmm0 = xmm0[0,0,1,1]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x float> %a, <4 x float> %b, <4 x i32> <i32 0, i32 0, i32 1, i32 1>
  ret <4 x float> %shuffle
}
define <4 x float> @shuffle_v4f32_2233(<4 x float> %a, <4 x float> %b) {
; SSE-LABEL: shuffle_v4f32_2233:
; SSE:       # BB#0:
; SSE-NEXT:    unpckhps {{.*#+}} xmm0 = xmm0[2,2,3,3]
; SSE-NEXT:    retq
;
; AVX-LABEL: shuffle_v4f32_2233:
; AVX:       # BB#0:
; AVX-NEXT:    vunpckhps {{.*#+}} xmm0 = xmm0[2,2,3,3]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x float> %a, <4 x float> %b, <4 x i32> <i32 2, i32 2, i32 3, i32 3>
  ret <4 x float> %shuffle
}
define <4 x float> @shuffle_v4f32_0022(<4 x float> %a, <4 x float> %b) {
; SSE2-LABEL: shuffle_v4f32_0022:
; SSE2:       # BB#0:
; SSE2-NEXT:    shufps {{.*#+}} xmm0 = xmm0[0,0,2,2]
; SSE2-NEXT:    retq
;
; SSE3-LABEL: shuffle_v4f32_0022:
; SSE3:       # BB#0:
; SSE3-NEXT:    movsldup {{.*#+}} xmm0 = xmm0[0,0,2,2]
; SSE3-NEXT:    retq
;
; SSSE3-LABEL: shuffle_v4f32_0022:
; SSSE3:       # BB#0:
; SSSE3-NEXT:    movsldup {{.*#+}} xmm0 = xmm0[0,0,2,2]
; SSSE3-NEXT:    retq
;
; SSE41-LABEL: shuffle_v4f32_0022:
; SSE41:       # BB#0:
; SSE41-NEXT:    movsldup {{.*#+}} xmm0 = xmm0[0,0,2,2]
; SSE41-NEXT:    retq
;
; AVX-LABEL: shuffle_v4f32_0022:
; AVX:       # BB#0:
; AVX-NEXT:    vmovsldup {{.*#+}} xmm0 = xmm0[0,0,2,2]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x float> %a, <4 x float> %b, <4 x i32> <i32 0, i32 0, i32 2, i32 2>
  ret <4 x float> %shuffle
}
define <4 x float> @shuffle_v4f32_1133(<4 x float> %a, <4 x float> %b) {
; SSE2-LABEL: shuffle_v4f32_1133:
; SSE2:       # BB#0:
; SSE2-NEXT:    shufps {{.*#+}} xmm0 = xmm0[1,1,3,3]
; SSE2-NEXT:    retq
;
; SSE3-LABEL: shuffle_v4f32_1133:
; SSE3:       # BB#0:
; SSE3-NEXT:    movshdup {{.*#+}} xmm0 = xmm0[1,1,3,3]
; SSE3-NEXT:    retq
;
; SSSE3-LABEL: shuffle_v4f32_1133:
; SSSE3:       # BB#0:
; SSSE3-NEXT:    movshdup {{.*#+}} xmm0 = xmm0[1,1,3,3]
; SSSE3-NEXT:    retq
;
; SSE41-LABEL: shuffle_v4f32_1133:
; SSE41:       # BB#0:
; SSE41-NEXT:    movshdup {{.*#+}} xmm0 = xmm0[1,1,3,3]
; SSE41-NEXT:    retq
;
; AVX-LABEL: shuffle_v4f32_1133:
; AVX:       # BB#0:
; AVX-NEXT:    vmovshdup {{.*#+}} xmm0 = xmm0[1,1,3,3]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x float> %a, <4 x float> %b, <4 x i32> <i32 1, i32 1, i32 3, i32 3>
  ret <4 x float> %shuffle
}

define <4 x i32> @shuffle_v4i32_0124(<4 x i32> %a, <4 x i32> %b) {
; SSE2-LABEL: shuffle_v4i32_0124:
; SSE2:       # BB#0:
; SSE2-NEXT:    shufps {{.*#+}} xmm1 = xmm1[0,0],xmm0[2,0]
; SSE2-NEXT:    shufps {{.*#+}} xmm0 = xmm0[0,1],xmm1[2,0]
; SSE2-NEXT:    retq
;
; SSE3-LABEL: shuffle_v4i32_0124:
; SSE3:       # BB#0:
; SSE3-NEXT:    shufps {{.*#+}} xmm1 = xmm1[0,0],xmm0[2,0]
; SSE3-NEXT:    shufps {{.*#+}} xmm0 = xmm0[0,1],xmm1[2,0]
; SSE3-NEXT:    retq
;
; SSSE3-LABEL: shuffle_v4i32_0124:
; SSSE3:       # BB#0:
; SSSE3-NEXT:    shufps {{.*#+}} xmm1 = xmm1[0,0],xmm0[2,0]
; SSSE3-NEXT:    shufps {{.*#+}} xmm0 = xmm0[0,1],xmm1[2,0]
; SSSE3-NEXT:    retq
;
; SSE41-LABEL: shuffle_v4i32_0124:
; SSE41:       # BB#0:
; SSE41-NEXT:    insertps {{.*#+}} xmm0 = xmm0[0,1,2],xmm1[0]
; SSE41-NEXT:    retq
;
; AVX-LABEL: shuffle_v4i32_0124:
; AVX:       # BB#0:
; AVX-NEXT:    vinsertps {{.*#+}} xmm0 = xmm0[0,1,2],xmm1[0]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  ret <4 x i32> %shuffle
}
define <4 x i32> @shuffle_v4i32_0142(<4 x i32> %a, <4 x i32> %b) {
; SSE-LABEL: shuffle_v4i32_0142:
; SSE:       # BB#0:
; SSE-NEXT:    shufps {{.*#+}} xmm1 = xmm1[0,0],xmm0[2,0]
; SSE-NEXT:    shufps {{.*#+}} xmm0 = xmm0[0,1],xmm1[0,2]
; SSE-NEXT:    retq
;
; AVX-LABEL: shuffle_v4i32_0142:
; AVX:       # BB#0:
; AVX-NEXT:    vshufps {{.*#+}} xmm1 = xmm1[0,0],xmm0[2,0]
; AVX-NEXT:    vshufps {{.*#+}} xmm0 = xmm0[0,1],xmm1[0,2]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 0, i32 1, i32 4, i32 2>
  ret <4 x i32> %shuffle
}
define <4 x i32> @shuffle_v4i32_0412(<4 x i32> %a, <4 x i32> %b) {
; SSE-LABEL: shuffle_v4i32_0412:
; SSE:       # BB#0:
; SSE-NEXT:    shufps {{.*#+}} xmm1 = xmm1[0,0],xmm0[0,0]
; SSE-NEXT:    shufps {{.*#+}} xmm1 = xmm1[2,0],xmm0[1,2]
; SSE-NEXT:    movaps %xmm1, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: shuffle_v4i32_0412:
; AVX:       # BB#0:
; AVX-NEXT:    vshufps {{.*#+}} xmm1 = xmm1[0,0],xmm0[0,0]
; AVX-NEXT:    vshufps {{.*#+}} xmm0 = xmm1[2,0],xmm0[1,2]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 0, i32 4, i32 1, i32 2>
  ret <4 x i32> %shuffle
}
define <4 x i32> @shuffle_v4i32_4012(<4 x i32> %a, <4 x i32> %b) {
; SSE-LABEL: shuffle_v4i32_4012:
; SSE:       # BB#0:
; SSE-NEXT:    shufps {{.*#+}} xmm1 = xmm1[0,0],xmm0[0,0]
; SSE-NEXT:    shufps {{.*#+}} xmm1 = xmm1[0,2],xmm0[1,2]
; SSE-NEXT:    movaps %xmm1, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: shuffle_v4i32_4012:
; AVX:       # BB#0:
; AVX-NEXT:    vshufps {{.*#+}} xmm1 = xmm1[0,0],xmm0[0,0]
; AVX-NEXT:    vshufps {{.*#+}} xmm0 = xmm1[0,2],xmm0[1,2]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 4, i32 0, i32 1, i32 2>
  ret <4 x i32> %shuffle
}
define <4 x i32> @shuffle_v4i32_0145(<4 x i32> %a, <4 x i32> %b) {
; SSE-LABEL: shuffle_v4i32_0145:
; SSE:       # BB#0:
; SSE-NEXT:    punpcklqdq {{.*#+}} xmm0 = xmm0[0],xmm1[0]
; SSE-NEXT:    retq
;
; AVX-LABEL: shuffle_v4i32_0145:
; AVX:       # BB#0:
; AVX-NEXT:    vpunpcklqdq {{.*#+}} xmm0 = xmm0[0],xmm1[0]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 0, i32 1, i32 4, i32 5>
  ret <4 x i32> %shuffle
}
define <4 x i32> @shuffle_v4i32_0451(<4 x i32> %a, <4 x i32> %b) {
; SSE-LABEL: shuffle_v4i32_0451:
; SSE:       # BB#0:
; SSE-NEXT:    shufps {{.*#+}} xmm0 = xmm0[0,1],xmm1[0,1]
; SSE-NEXT:    shufps {{.*#+}} xmm0 = xmm0[0,2,3,1]
; SSE-NEXT:    retq
;
; AVX-LABEL: shuffle_v4i32_0451:
; AVX:       # BB#0:
; AVX-NEXT:    vshufps {{.*#+}} xmm0 = xmm0[0,1],xmm1[0,1]
; AVX-NEXT:    vshufps {{.*#+}} xmm0 = xmm0[0,2,3,1]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 0, i32 4, i32 5, i32 1>
  ret <4 x i32> %shuffle
}
define <4 x i32> @shuffle_v4i32_4501(<4 x i32> %a, <4 x i32> %b) {
; SSE-LABEL: shuffle_v4i32_4501:
; SSE:       # BB#0:
; SSE-NEXT:    punpcklqdq {{.*#+}} xmm1 = xmm1[0],xmm0[0]
; SSE-NEXT:    movdqa %xmm1, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: shuffle_v4i32_4501:
; AVX:       # BB#0:
; AVX-NEXT:    vpunpcklqdq {{.*#+}} xmm0 = xmm1[0],xmm0[0]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 4, i32 5, i32 0, i32 1>
  ret <4 x i32> %shuffle
}
define <4 x i32> @shuffle_v4i32_4015(<4 x i32> %a, <4 x i32> %b) {
; SSE-LABEL: shuffle_v4i32_4015:
; SSE:       # BB#0:
; SSE-NEXT:    shufps {{.*#+}} xmm0 = xmm0[0,1],xmm1[0,1]
; SSE-NEXT:    shufps {{.*#+}} xmm0 = xmm0[2,0,1,3]
; SSE-NEXT:    retq
;
; AVX-LABEL: shuffle_v4i32_4015:
; AVX:       # BB#0:
; AVX-NEXT:    vshufps {{.*#+}} xmm0 = xmm0[0,1],xmm1[0,1]
; AVX-NEXT:    vshufps {{.*#+}} xmm0 = xmm0[2,0,1,3]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 4, i32 0, i32 1, i32 5>
  ret <4 x i32> %shuffle
}

define <4 x float> @shuffle_v4f32_4zzz(<4 x float> %a) {
; SSE2-LABEL: shuffle_v4f32_4zzz:
; SSE2:       # BB#0:
; SSE2-NEXT:    xorps %xmm1, %xmm1
; SSE2-NEXT:    movss %xmm0, %xmm1
; SSE2-NEXT:    movaps %xmm1, %xmm0
; SSE2-NEXT:    retq
;
; SSE3-LABEL: shuffle_v4f32_4zzz:
; SSE3:       # BB#0:
; SSE3-NEXT:    xorps %xmm1, %xmm1
; SSE3-NEXT:    movss %xmm0, %xmm1
; SSE3-NEXT:    movaps %xmm1, %xmm0
; SSE3-NEXT:    retq
;
; SSSE3-LABEL: shuffle_v4f32_4zzz:
; SSSE3:       # BB#0:
; SSSE3-NEXT:    xorps %xmm1, %xmm1
; SSSE3-NEXT:    movss %xmm0, %xmm1
; SSSE3-NEXT:    movaps %xmm1, %xmm0
; SSSE3-NEXT:    retq
;
; SSE41-LABEL: shuffle_v4f32_4zzz:
; SSE41:       # BB#0:
; SSE41-NEXT:    xorps %xmm1, %xmm1
; SSE41-NEXT:    blendps {{.*#+}} xmm0 = xmm0[0],xmm1[1,2,3]
; SSE41-NEXT:    retq
;
; AVX-LABEL: shuffle_v4f32_4zzz:
; AVX:       # BB#0:
; AVX-NEXT:    vxorps %xmm1, %xmm1, %xmm1
; AVX-NEXT:    vblendps {{.*#+}} xmm0 = xmm0[0],xmm1[1,2,3]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x float> zeroinitializer, <4 x float> %a, <4 x i32> <i32 4, i32 1, i32 2, i32 3>
  ret <4 x float> %shuffle
}

define <4 x float> @shuffle_v4f32_z4zz(<4 x float> %a) {
; SSE2-LABEL: shuffle_v4f32_z4zz:
; SSE2:       # BB#0:
; SSE2-NEXT:    xorps %xmm1, %xmm1
; SSE2-NEXT:    shufps {{.*#+}} xmm0 = xmm0[0,0],xmm1[2,0]
; SSE2-NEXT:    shufps {{.*#+}} xmm0 = xmm0[2,0],xmm1[3,0]
; SSE2-NEXT:    retq
;
; SSE3-LABEL: shuffle_v4f32_z4zz:
; SSE3:       # BB#0:
; SSE3-NEXT:    xorps %xmm1, %xmm1
; SSE3-NEXT:    shufps {{.*#+}} xmm0 = xmm0[0,0],xmm1[2,0]
; SSE3-NEXT:    shufps {{.*#+}} xmm0 = xmm0[2,0],xmm1[3,0]
; SSE3-NEXT:    retq
;
; SSSE3-LABEL: shuffle_v4f32_z4zz:
; SSSE3:       # BB#0:
; SSSE3-NEXT:    xorps %xmm1, %xmm1
; SSSE3-NEXT:    shufps {{.*#+}} xmm0 = xmm0[0,0],xmm1[2,0]
; SSSE3-NEXT:    shufps {{.*#+}} xmm0 = xmm0[2,0],xmm1[3,0]
; SSSE3-NEXT:    retq
;
; SSE41-LABEL: shuffle_v4f32_z4zz:
; SSE41:       # BB#0:
; SSE41-NEXT:    insertps {{.*#+}} xmm0 = zero,xmm0[0],zero,zero
; SSE41-NEXT:    retq
;
; AVX-LABEL: shuffle_v4f32_z4zz:
; AVX:       # BB#0:
; AVX-NEXT:    vinsertps {{.*#+}} xmm0 = zero,xmm0[0],zero,zero
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x float> zeroinitializer, <4 x float> %a, <4 x i32> <i32 2, i32 4, i32 3, i32 0>
  ret <4 x float> %shuffle
}

define <4 x float> @shuffle_v4f32_zz4z(<4 x float> %a) {
; SSE2-LABEL: shuffle_v4f32_zz4z:
; SSE2:       # BB#0:
; SSE2-NEXT:    xorps %xmm1, %xmm1
; SSE2-NEXT:    shufps {{.*#+}} xmm0 = xmm0[0,0],xmm1[0,0]
; SSE2-NEXT:    shufps {{.*#+}} xmm1 = xmm1[0,0],xmm0[0,2]
; SSE2-NEXT:    movaps %xmm1, %xmm0
; SSE2-NEXT:    retq
;
; SSE3-LABEL: shuffle_v4f32_zz4z:
; SSE3:       # BB#0:
; SSE3-NEXT:    xorps %xmm1, %xmm1
; SSE3-NEXT:    shufps {{.*#+}} xmm0 = xmm0[0,0],xmm1[0,0]
; SSE3-NEXT:    shufps {{.*#+}} xmm1 = xmm1[0,0],xmm0[0,2]
; SSE3-NEXT:    movaps %xmm1, %xmm0
; SSE3-NEXT:    retq
;
; SSSE3-LABEL: shuffle_v4f32_zz4z:
; SSSE3:       # BB#0:
; SSSE3-NEXT:    xorps %xmm1, %xmm1
; SSSE3-NEXT:    shufps {{.*#+}} xmm0 = xmm0[0,0],xmm1[0,0]
; SSSE3-NEXT:    shufps {{.*#+}} xmm1 = xmm1[0,0],xmm0[0,2]
; SSSE3-NEXT:    movaps %xmm1, %xmm0
; SSSE3-NEXT:    retq
;
; SSE41-LABEL: shuffle_v4f32_zz4z:
; SSE41:       # BB#0:
; SSE41-NEXT:    insertps {{.*#+}} xmm0 = zero,zero,xmm0[0],zero
; SSE41-NEXT:    retq
;
; AVX-LABEL: shuffle_v4f32_zz4z:
; AVX:       # BB#0:
; AVX-NEXT:    vinsertps {{.*#+}} xmm0 = zero,zero,xmm0[0],zero
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x float> zeroinitializer, <4 x float> %a, <4 x i32> <i32 0, i32 0, i32 4, i32 0>
  ret <4 x float> %shuffle
}

define <4 x float> @shuffle_v4f32_zuu4(<4 x float> %a) {
; SSE2-LABEL: shuffle_v4f32_zuu4:
; SSE2:       # BB#0:
; SSE2-NEXT:    xorps %xmm1, %xmm1
; SSE2-NEXT:    shufps {{.*#+}} xmm1 = xmm1[0,1],xmm0[2,0]
; SSE2-NEXT:    movaps %xmm1, %xmm0
; SSE2-NEXT:    retq
;
; SSE3-LABEL: shuffle_v4f32_zuu4:
; SSE3:       # BB#0:
; SSE3-NEXT:    xorps %xmm1, %xmm1
; SSE3-NEXT:    shufps {{.*#+}} xmm1 = xmm1[0,1],xmm0[2,0]
; SSE3-NEXT:    movaps %xmm1, %xmm0
; SSE3-NEXT:    retq
;
; SSSE3-LABEL: shuffle_v4f32_zuu4:
; SSSE3:       # BB#0:
; SSSE3-NEXT:    xorps %xmm1, %xmm1
; SSSE3-NEXT:    shufps {{.*#+}} xmm1 = xmm1[0,1],xmm0[2,0]
; SSSE3-NEXT:    movaps %xmm1, %xmm0
; SSSE3-NEXT:    retq
;
; SSE41-LABEL: shuffle_v4f32_zuu4:
; SSE41:       # BB#0:
; SSE41-NEXT:    insertps {{.*#+}} xmm0 = zero,zero,zero,xmm0[0]
; SSE41-NEXT:    retq
;
; AVX-LABEL: shuffle_v4f32_zuu4:
; AVX:       # BB#0:
; AVX-NEXT:    vinsertps {{.*#+}} xmm0 = zero,zero,zero,xmm0[0]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x float> zeroinitializer, <4 x float> %a, <4 x i32> <i32 0, i32 undef, i32 undef, i32 4>
  ret <4 x float> %shuffle
}

define <4 x float> @shuffle_v4f32_zzz7(<4 x float> %a) {
; SSE2-LABEL: shuffle_v4f32_zzz7:
; SSE2:       # BB#0:
; SSE2-NEXT:    xorps %xmm1, %xmm1
; SSE2-NEXT:    shufps {{.*#+}} xmm0 = xmm0[3,0],xmm1[2,0]
; SSE2-NEXT:    shufps {{.*#+}} xmm1 = xmm1[0,1],xmm0[2,0]
; SSE2-NEXT:    movaps %xmm1, %xmm0
; SSE2-NEXT:    retq
;
; SSE3-LABEL: shuffle_v4f32_zzz7:
; SSE3:       # BB#0:
; SSE3-NEXT:    xorps %xmm1, %xmm1
; SSE3-NEXT:    shufps {{.*#+}} xmm0 = xmm0[3,0],xmm1[2,0]
; SSE3-NEXT:    shufps {{.*#+}} xmm1 = xmm1[0,1],xmm0[2,0]
; SSE3-NEXT:    movaps %xmm1, %xmm0
; SSE3-NEXT:    retq
;
; SSSE3-LABEL: shuffle_v4f32_zzz7:
; SSSE3:       # BB#0:
; SSSE3-NEXT:    xorps %xmm1, %xmm1
; SSSE3-NEXT:    shufps {{.*#+}} xmm0 = xmm0[3,0],xmm1[2,0]
; SSSE3-NEXT:    shufps {{.*#+}} xmm1 = xmm1[0,1],xmm0[2,0]
; SSSE3-NEXT:    movaps %xmm1, %xmm0
; SSSE3-NEXT:    retq
;
; SSE41-LABEL: shuffle_v4f32_zzz7:
; SSE41:       # BB#0:
; SSE41-NEXT:    xorps %xmm1, %xmm1
; SSE41-NEXT:    blendps {{.*#+}} xmm0 = xmm1[0,1,2],xmm0[3]
; SSE41-NEXT:    retq
;
; AVX-LABEL: shuffle_v4f32_zzz7:
; AVX:       # BB#0:
; AVX-NEXT:    vxorps %xmm1, %xmm1, %xmm1
; AVX-NEXT:    vblendps {{.*#+}} xmm0 = xmm1[0,1,2],xmm0[3]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x float> zeroinitializer, <4 x float> %a, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  ret <4 x float> %shuffle
}

define <4 x float> @shuffle_v4f32_z6zz(<4 x float> %a) {
; SSE2-LABEL: shuffle_v4f32_z6zz:
; SSE2:       # BB#0:
; SSE2-NEXT:    xorps %xmm1, %xmm1
; SSE2-NEXT:    shufps {{.*#+}} xmm0 = xmm0[2,0],xmm1[0,0]
; SSE2-NEXT:    shufps {{.*#+}} xmm0 = xmm0[2,0],xmm1[2,3]
; SSE2-NEXT:    retq
;
; SSE3-LABEL: shuffle_v4f32_z6zz:
; SSE3:       # BB#0:
; SSE3-NEXT:    xorps %xmm1, %xmm1
; SSE3-NEXT:    shufps {{.*#+}} xmm0 = xmm0[2,0],xmm1[0,0]
; SSE3-NEXT:    shufps {{.*#+}} xmm0 = xmm0[2,0],xmm1[2,3]
; SSE3-NEXT:    retq
;
; SSSE3-LABEL: shuffle_v4f32_z6zz:
; SSSE3:       # BB#0:
; SSSE3-NEXT:    xorps %xmm1, %xmm1
; SSSE3-NEXT:    shufps {{.*#+}} xmm0 = xmm0[2,0],xmm1[0,0]
; SSSE3-NEXT:    shufps {{.*#+}} xmm0 = xmm0[2,0],xmm1[2,3]
; SSSE3-NEXT:    retq
;
; SSE41-LABEL: shuffle_v4f32_z6zz:
; SSE41:       # BB#0:
; SSE41-NEXT:    insertps {{.*#+}} xmm0 = zero,xmm0[2],zero,zero
; SSE41-NEXT:    retq
;
; AVX-LABEL: shuffle_v4f32_z6zz:
; AVX:       # BB#0:
; AVX-NEXT:    vinsertps {{.*#+}} xmm0 = zero,xmm0[2],zero,zero
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x float> zeroinitializer, <4 x float> %a, <4 x i32> <i32 0, i32 6, i32 2, i32 3>
  ret <4 x float> %shuffle
}

define <4 x i32> @shuffle_v4i32_4zzz(<4 x i32> %a) {
; SSE2-LABEL: shuffle_v4i32_4zzz:
; SSE2:       # BB#0:
; SSE2-NEXT:    xorps %xmm1, %xmm1
; SSE2-NEXT:    movss %xmm0, %xmm1
; SSE2-NEXT:    movaps %xmm1, %xmm0
; SSE2-NEXT:    retq
;
; SSE3-LABEL: shuffle_v4i32_4zzz:
; SSE3:       # BB#0:
; SSE3-NEXT:    xorps %xmm1, %xmm1
; SSE3-NEXT:    movss %xmm0, %xmm1
; SSE3-NEXT:    movaps %xmm1, %xmm0
; SSE3-NEXT:    retq
;
; SSSE3-LABEL: shuffle_v4i32_4zzz:
; SSSE3:       # BB#0:
; SSSE3-NEXT:    xorps %xmm1, %xmm1
; SSSE3-NEXT:    movss %xmm0, %xmm1
; SSSE3-NEXT:    movaps %xmm1, %xmm0
; SSSE3-NEXT:    retq
;
; SSE41-LABEL: shuffle_v4i32_4zzz:
; SSE41:       # BB#0:
; SSE41-NEXT:    pxor %xmm1, %xmm1
; SSE41-NEXT:    pblendw {{.*#+}} xmm0 = xmm0[0,1],xmm1[2,3,4,5,6,7]
; SSE41-NEXT:    retq
;
; AVX-LABEL: shuffle_v4i32_4zzz:
; AVX:       # BB#0:
; AVX-NEXT:    vpxor %xmm1, %xmm1, %xmm1
; AVX-NEXT:    vpblendw {{.*#+}} xmm0 = xmm0[0,1],xmm1[2,3,4,5,6,7]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x i32> zeroinitializer, <4 x i32> %a, <4 x i32> <i32 4, i32 1, i32 2, i32 3>
  ret <4 x i32> %shuffle
}

define <4 x i32> @shuffle_v4i32_z4zz(<4 x i32> %a) {
; SSE2-LABEL: shuffle_v4i32_z4zz:
; SSE2:       # BB#0:
; SSE2-NEXT:    xorps %xmm1, %xmm1
; SSE2-NEXT:    movss %xmm0, %xmm1
; SSE2-NEXT:    pshufd {{.*#+}} xmm0 = xmm1[1,0,1,1]
; SSE2-NEXT:    retq
;
; SSE3-LABEL: shuffle_v4i32_z4zz:
; SSE3:       # BB#0:
; SSE3-NEXT:    xorps %xmm1, %xmm1
; SSE3-NEXT:    movss %xmm0, %xmm1
; SSE3-NEXT:    pshufd {{.*#+}} xmm0 = xmm1[1,0,1,1]
; SSE3-NEXT:    retq
;
; SSSE3-LABEL: shuffle_v4i32_z4zz:
; SSSE3:       # BB#0:
; SSSE3-NEXT:    xorps %xmm1, %xmm1
; SSSE3-NEXT:    movss %xmm0, %xmm1
; SSSE3-NEXT:    pshufd {{.*#+}} xmm0 = xmm1[1,0,1,1]
; SSSE3-NEXT:    retq
;
; SSE41-LABEL: shuffle_v4i32_z4zz:
; SSE41:       # BB#0:
; SSE41-NEXT:    pxor %xmm1, %xmm1
; SSE41-NEXT:    pblendw {{.*#+}} xmm1 = xmm0[0,1],xmm1[2,3,4,5,6,7]
; SSE41-NEXT:    pshufd {{.*#+}} xmm0 = xmm1[1,0,1,1]
; SSE41-NEXT:    retq
;
; AVX-LABEL: shuffle_v4i32_z4zz:
; AVX:       # BB#0:
; AVX-NEXT:    vpxor %xmm1, %xmm1, %xmm1
; AVX-NEXT:    vpblendw {{.*#+}} xmm0 = xmm0[0,1],xmm1[2,3,4,5,6,7]
; AVX-NEXT:    vpshufd {{.*#+}} xmm0 = xmm0[1,0,1,1]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x i32> zeroinitializer, <4 x i32> %a, <4 x i32> <i32 2, i32 4, i32 3, i32 0>
  ret <4 x i32> %shuffle
}

define <4 x i32> @shuffle_v4i32_zz4z(<4 x i32> %a) {
; SSE2-LABEL: shuffle_v4i32_zz4z:
; SSE2:       # BB#0:
; SSE2-NEXT:    xorps %xmm1, %xmm1
; SSE2-NEXT:    movss %xmm0, %xmm1
; SSE2-NEXT:    pshufd {{.*#+}} xmm0 = xmm1[1,1,0,1]
; SSE2-NEXT:    retq
;
; SSE3-LABEL: shuffle_v4i32_zz4z:
; SSE3:       # BB#0:
; SSE3-NEXT:    xorps %xmm1, %xmm1
; SSE3-NEXT:    movss %xmm0, %xmm1
; SSE3-NEXT:    pshufd {{.*#+}} xmm0 = xmm1[1,1,0,1]
; SSE3-NEXT:    retq
;
; SSSE3-LABEL: shuffle_v4i32_zz4z:
; SSSE3:       # BB#0:
; SSSE3-NEXT:    xorps %xmm1, %xmm1
; SSSE3-NEXT:    movss %xmm0, %xmm1
; SSSE3-NEXT:    pshufd {{.*#+}} xmm0 = xmm1[1,1,0,1]
; SSSE3-NEXT:    retq
;
; SSE41-LABEL: shuffle_v4i32_zz4z:
; SSE41:       # BB#0:
; SSE41-NEXT:    pxor %xmm1, %xmm1
; SSE41-NEXT:    pblendw {{.*#+}} xmm1 = xmm0[0,1],xmm1[2,3,4,5,6,7]
; SSE41-NEXT:    pshufd {{.*#+}} xmm0 = xmm1[1,1,0,1]
; SSE41-NEXT:    retq
;
; AVX-LABEL: shuffle_v4i32_zz4z:
; AVX:       # BB#0:
; AVX-NEXT:    vpxor %xmm1, %xmm1, %xmm1
; AVX-NEXT:    vpblendw {{.*#+}} xmm0 = xmm0[0,1],xmm1[2,3,4,5,6,7]
; AVX-NEXT:    vpshufd {{.*#+}} xmm0 = xmm0[1,1,0,1]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x i32> zeroinitializer, <4 x i32> %a, <4 x i32> <i32 0, i32 0, i32 4, i32 0>
  ret <4 x i32> %shuffle
}

define <4 x i32> @shuffle_v4i32_zuu4(<4 x i32> %a) {
; SSE-LABEL: shuffle_v4i32_zuu4:
; SSE:       # BB#0:
; SSE-NEXT:    pslldq {{.*#+}} xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3]
; SSE-NEXT:    retq
;
; AVX-LABEL: shuffle_v4i32_zuu4:
; AVX:       # BB#0:
; AVX-NEXT:    vpslldq {{.*#+}} xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x i32> zeroinitializer, <4 x i32> %a, <4 x i32> <i32 0, i32 undef, i32 undef, i32 4>
  ret <4 x i32> %shuffle
}

define <4 x i32> @shuffle_v4i32_z6zz(<4 x i32> %a) {
; SSE2-LABEL: shuffle_v4i32_z6zz:
; SSE2:       # BB#0:
; SSE2-NEXT:    xorps %xmm1, %xmm1
; SSE2-NEXT:    shufps {{.*#+}} xmm0 = xmm0[2,0],xmm1[0,0]
; SSE2-NEXT:    shufps {{.*#+}} xmm0 = xmm0[2,0],xmm1[2,3]
; SSE2-NEXT:    retq
;
; SSE3-LABEL: shuffle_v4i32_z6zz:
; SSE3:       # BB#0:
; SSE3-NEXT:    xorps %xmm1, %xmm1
; SSE3-NEXT:    shufps {{.*#+}} xmm0 = xmm0[2,0],xmm1[0,0]
; SSE3-NEXT:    shufps {{.*#+}} xmm0 = xmm0[2,0],xmm1[2,3]
; SSE3-NEXT:    retq
;
; SSSE3-LABEL: shuffle_v4i32_z6zz:
; SSSE3:       # BB#0:
; SSSE3-NEXT:    xorps %xmm1, %xmm1
; SSSE3-NEXT:    shufps {{.*#+}} xmm0 = xmm0[2,0],xmm1[0,0]
; SSSE3-NEXT:    shufps {{.*#+}} xmm0 = xmm0[2,0],xmm1[2,3]
; SSSE3-NEXT:    retq
;
; SSE41-LABEL: shuffle_v4i32_z6zz:
; SSE41:       # BB#0:
; SSE41-NEXT:    insertps {{.*#+}} xmm0 = zero,xmm0[2],zero,zero
; SSE41-NEXT:    retq
;
; AVX-LABEL: shuffle_v4i32_z6zz:
; AVX:       # BB#0:
; AVX-NEXT:    vinsertps {{.*#+}} xmm0 = zero,xmm0[2],zero,zero
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x i32> zeroinitializer, <4 x i32> %a, <4 x i32> <i32 0, i32 6, i32 2, i32 3>
  ret <4 x i32> %shuffle
}

define <4 x i32> @shuffle_v4i32_7012(<4 x i32> %a, <4 x i32> %b) {
; SSE2-LABEL: shuffle_v4i32_7012:
; SSE2:       # BB#0:
; SSE2-NEXT:    shufps {{.*#+}} xmm1 = xmm1[3,0],xmm0[0,0]
; SSE2-NEXT:    shufps {{.*#+}} xmm1 = xmm1[0,2],xmm0[1,2]
; SSE2-NEXT:    movaps %xmm1, %xmm0
; SSE2-NEXT:    retq
;
; SSE3-LABEL: shuffle_v4i32_7012:
; SSE3:       # BB#0:
; SSE3-NEXT:    shufps {{.*#+}} xmm1 = xmm1[3,0],xmm0[0,0]
; SSE3-NEXT:    shufps {{.*#+}} xmm1 = xmm1[0,2],xmm0[1,2]
; SSE3-NEXT:    movaps %xmm1, %xmm0
; SSE3-NEXT:    retq
;
; SSSE3-LABEL: shuffle_v4i32_7012:
; SSSE3:       # BB#0:
; SSSE3-NEXT:    palignr {{.*#+}} xmm0 = xmm1[12,13,14,15],xmm0[0,1,2,3,4,5,6,7,8,9,10,11]
; SSSE3-NEXT:    retq
;
; SSE41-LABEL: shuffle_v4i32_7012:
; SSE41:       # BB#0:
; SSE41-NEXT:    palignr {{.*#+}} xmm0 = xmm1[12,13,14,15],xmm0[0,1,2,3,4,5,6,7,8,9,10,11]
; SSE41-NEXT:    retq
;
; AVX-LABEL: shuffle_v4i32_7012:
; AVX:       # BB#0:
; AVX-NEXT:    vpalignr {{.*#+}} xmm0 = xmm1[12,13,14,15],xmm0[0,1,2,3,4,5,6,7,8,9,10,11]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 7, i32 0, i32 1, i32 2>
  ret <4 x i32> %shuffle
}

define <4 x i32> @shuffle_v4i32_6701(<4 x i32> %a, <4 x i32> %b) {
; SSE2-LABEL: shuffle_v4i32_6701:
; SSE2:       # BB#0:
; SSE2-NEXT:    shufpd {{.*#+}} xmm1 = xmm1[1],xmm0[0]
; SSE2-NEXT:    movapd %xmm1, %xmm0
; SSE2-NEXT:    retq
;
; SSE3-LABEL: shuffle_v4i32_6701:
; SSE3:       # BB#0:
; SSE3-NEXT:    shufpd {{.*#+}} xmm1 = xmm1[1],xmm0[0]
; SSE3-NEXT:    movapd %xmm1, %xmm0
; SSE3-NEXT:    retq
;
; SSSE3-LABEL: shuffle_v4i32_6701:
; SSSE3:       # BB#0:
; SSSE3-NEXT:    palignr {{.*#+}} xmm0 = xmm1[8,9,10,11,12,13,14,15],xmm0[0,1,2,3,4,5,6,7]
; SSSE3-NEXT:    retq
;
; SSE41-LABEL: shuffle_v4i32_6701:
; SSE41:       # BB#0:
; SSE41-NEXT:    palignr {{.*#+}} xmm0 = xmm1[8,9,10,11,12,13,14,15],xmm0[0,1,2,3,4,5,6,7]
; SSE41-NEXT:    retq
;
; AVX-LABEL: shuffle_v4i32_6701:
; AVX:       # BB#0:
; AVX-NEXT:    vpalignr {{.*#+}} xmm0 = xmm1[8,9,10,11,12,13,14,15],xmm0[0,1,2,3,4,5,6,7]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 6, i32 7, i32 0, i32 1>
  ret <4 x i32> %shuffle
}

define <4 x i32> @shuffle_v4i32_5670(<4 x i32> %a, <4 x i32> %b) {
; SSE2-LABEL: shuffle_v4i32_5670:
; SSE2:       # BB#0:
; SSE2-NEXT:    shufps {{.*#+}} xmm0 = xmm0[0,0],xmm1[3,0]
; SSE2-NEXT:    shufps {{.*#+}} xmm1 = xmm1[1,2],xmm0[2,0]
; SSE2-NEXT:    movaps %xmm1, %xmm0
; SSE2-NEXT:    retq
;
; SSE3-LABEL: shuffle_v4i32_5670:
; SSE3:       # BB#0:
; SSE3-NEXT:    shufps {{.*#+}} xmm0 = xmm0[0,0],xmm1[3,0]
; SSE3-NEXT:    shufps {{.*#+}} xmm1 = xmm1[1,2],xmm0[2,0]
; SSE3-NEXT:    movaps %xmm1, %xmm0
; SSE3-NEXT:    retq
;
; SSSE3-LABEL: shuffle_v4i32_5670:
; SSSE3:       # BB#0:
; SSSE3-NEXT:    palignr {{.*#+}} xmm0 = xmm1[4,5,6,7,8,9,10,11,12,13,14,15],xmm0[0,1,2,3]
; SSSE3-NEXT:    retq
;
; SSE41-LABEL: shuffle_v4i32_5670:
; SSE41:       # BB#0:
; SSE41-NEXT:    palignr {{.*#+}} xmm0 = xmm1[4,5,6,7,8,9,10,11,12,13,14,15],xmm0[0,1,2,3]
; SSE41-NEXT:    retq
;
; AVX-LABEL: shuffle_v4i32_5670:
; AVX:       # BB#0:
; AVX-NEXT:    vpalignr {{.*#+}} xmm0 = xmm1[4,5,6,7,8,9,10,11,12,13,14,15],xmm0[0,1,2,3]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 5, i32 6, i32 7, i32 0>
  ret <4 x i32> %shuffle
}

define <4 x i32> @shuffle_v4i32_1234(<4 x i32> %a, <4 x i32> %b) {
; SSE2-LABEL: shuffle_v4i32_1234:
; SSE2:       # BB#0:
; SSE2-NEXT:    shufps {{.*#+}} xmm1 = xmm1[0,0],xmm0[3,0]
; SSE2-NEXT:    shufps {{.*#+}} xmm0 = xmm0[1,2],xmm1[2,0]
; SSE2-NEXT:    retq
;
; SSE3-LABEL: shuffle_v4i32_1234:
; SSE3:       # BB#0:
; SSE3-NEXT:    shufps {{.*#+}} xmm1 = xmm1[0,0],xmm0[3,0]
; SSE3-NEXT:    shufps {{.*#+}} xmm0 = xmm0[1,2],xmm1[2,0]
; SSE3-NEXT:    retq
;
; SSSE3-LABEL: shuffle_v4i32_1234:
; SSSE3:       # BB#0:
; SSSE3-NEXT:    palignr {{.*#+}} xmm1 = xmm0[4,5,6,7,8,9,10,11,12,13,14,15],xmm1[0,1,2,3]
; SSSE3-NEXT:    movdqa %xmm1, %xmm0
; SSSE3-NEXT:    retq
;
; SSE41-LABEL: shuffle_v4i32_1234:
; SSE41:       # BB#0:
; SSE41-NEXT:    palignr {{.*#+}} xmm1 = xmm0[4,5,6,7,8,9,10,11,12,13,14,15],xmm1[0,1,2,3]
; SSE41-NEXT:    movdqa %xmm1, %xmm0
; SSE41-NEXT:    retq
;
; AVX-LABEL: shuffle_v4i32_1234:
; AVX:       # BB#0:
; AVX-NEXT:    vpalignr {{.*#+}} xmm0 = xmm0[4,5,6,7,8,9,10,11,12,13,14,15],xmm1[0,1,2,3]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 1, i32 2, i32 3, i32 4>
  ret <4 x i32> %shuffle
}

define <4 x i32> @shuffle_v4i32_2345(<4 x i32> %a, <4 x i32> %b) {
; SSE2-LABEL: shuffle_v4i32_2345:
; SSE2:       # BB#0:
; SSE2-NEXT:    shufpd {{.*#+}} xmm0 = xmm0[1],xmm1[0]
; SSE2-NEXT:    retq
;
; SSE3-LABEL: shuffle_v4i32_2345:
; SSE3:       # BB#0:
; SSE3-NEXT:    shufpd {{.*#+}} xmm0 = xmm0[1],xmm1[0]
; SSE3-NEXT:    retq
;
; SSSE3-LABEL: shuffle_v4i32_2345:
; SSSE3:       # BB#0:
; SSSE3-NEXT:    palignr {{.*#+}} xmm1 = xmm0[8,9,10,11,12,13,14,15],xmm1[0,1,2,3,4,5,6,7]
; SSSE3-NEXT:    movdqa %xmm1, %xmm0
; SSSE3-NEXT:    retq
;
; SSE41-LABEL: shuffle_v4i32_2345:
; SSE41:       # BB#0:
; SSE41-NEXT:    palignr {{.*#+}} xmm1 = xmm0[8,9,10,11,12,13,14,15],xmm1[0,1,2,3,4,5,6,7]
; SSE41-NEXT:    movdqa %xmm1, %xmm0
; SSE41-NEXT:    retq
;
; AVX-LABEL: shuffle_v4i32_2345:
; AVX:       # BB#0:
; AVX-NEXT:    vpalignr {{.*#+}} xmm0 = xmm0[8,9,10,11,12,13,14,15],xmm1[0,1,2,3,4,5,6,7]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 2, i32 3, i32 4, i32 5>
  ret <4 x i32> %shuffle
}

define <4 x i32> @shuffle_v4i32_3456(<4 x i32> %a, <4 x i32> %b) {
; SSE2-LABEL: shuffle_v4i32_3456:
; SSE2:       # BB#0:
; SSE2-NEXT:    shufps {{.*#+}} xmm0 = xmm0[3,0],xmm1[0,0]
; SSE2-NEXT:    shufps {{.*#+}} xmm0 = xmm0[0,2],xmm1[1,2]
; SSE2-NEXT:    retq
;
; SSE3-LABEL: shuffle_v4i32_3456:
; SSE3:       # BB#0:
; SSE3-NEXT:    shufps {{.*#+}} xmm0 = xmm0[3,0],xmm1[0,0]
; SSE3-NEXT:    shufps {{.*#+}} xmm0 = xmm0[0,2],xmm1[1,2]
; SSE3-NEXT:    retq
;
; SSSE3-LABEL: shuffle_v4i32_3456:
; SSSE3:       # BB#0:
; SSSE3-NEXT:    palignr {{.*#+}} xmm1 = xmm0[12,13,14,15],xmm1[0,1,2,3,4,5,6,7,8,9,10,11]
; SSSE3-NEXT:    movdqa %xmm1, %xmm0
; SSSE3-NEXT:    retq
;
; SSE41-LABEL: shuffle_v4i32_3456:
; SSE41:       # BB#0:
; SSE41-NEXT:    palignr {{.*#+}} xmm1 = xmm0[12,13,14,15],xmm1[0,1,2,3,4,5,6,7,8,9,10,11]
; SSE41-NEXT:    movdqa %xmm1, %xmm0
; SSE41-NEXT:    retq
;
; AVX-LABEL: shuffle_v4i32_3456:
; AVX:       # BB#0:
; AVX-NEXT:    vpalignr {{.*#+}} xmm0 = xmm0[12,13,14,15],xmm1[0,1,2,3,4,5,6,7,8,9,10,11]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 3, i32 4, i32 5, i32 6>
  ret <4 x i32> %shuffle
}

define <4 x i32> @shuffle_v4i32_0u1u(<4 x i32> %a, <4 x i32> %b) {
; SSE2-LABEL: shuffle_v4i32_0u1u:
; SSE2:       # BB#0:
; SSE2-NEXT:    pshufd {{.*#+}} xmm0 = xmm0[0,1,1,3]
; SSE2-NEXT:    retq
;
; SSE3-LABEL: shuffle_v4i32_0u1u:
; SSE3:       # BB#0:
; SSE3-NEXT:    pshufd {{.*#+}} xmm0 = xmm0[0,1,1,3]
; SSE3-NEXT:    retq
;
; SSSE3-LABEL: shuffle_v4i32_0u1u:
; SSSE3:       # BB#0:
; SSSE3-NEXT:    pshufd {{.*#+}} xmm0 = xmm0[0,1,1,3]
; SSSE3-NEXT:    retq
;
; SSE41-LABEL: shuffle_v4i32_0u1u:
; SSE41:       # BB#0:
; SSE41-NEXT:    pmovzxdq %xmm0, %xmm0
; SSE41-NEXT:    retq
;
; AVX-LABEL: shuffle_v4i32_0u1u:
; AVX:       # BB#0:
; AVX-NEXT:    vpmovzxdq %xmm0, %xmm0
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 0, i32 undef, i32 1, i32 undef>
  ret <4 x i32> %shuffle
}

define <4 x i32> @shuffle_v4i32_0z1z(<4 x i32> %a) {
; SSE2-LABEL: shuffle_v4i32_0z1z:
; SSE2:       # BB#0:
; SSE2-NEXT:    pxor %xmm1, %xmm1
; SSE2-NEXT:    punpckldq {{.*#+}} xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
; SSE2-NEXT:    retq
;
; SSE3-LABEL: shuffle_v4i32_0z1z:
; SSE3:       # BB#0:
; SSE3-NEXT:    pxor %xmm1, %xmm1
; SSE3-NEXT:    punpckldq {{.*#+}} xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
; SSE3-NEXT:    retq
;
; SSSE3-LABEL: shuffle_v4i32_0z1z:
; SSSE3:       # BB#0:
; SSSE3-NEXT:    pxor %xmm1, %xmm1
; SSSE3-NEXT:    punpckldq {{.*#+}} xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
; SSSE3-NEXT:    retq
;
; SSE41-LABEL: shuffle_v4i32_0z1z:
; SSE41:       # BB#0:
; SSE41-NEXT:    pmovzxdq %xmm0, %xmm0
; SSE41-NEXT:    retq
;
; AVX-LABEL: shuffle_v4i32_0z1z:
; AVX:       # BB#0:
; AVX-NEXT:    vpmovzxdq %xmm0, %xmm0
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x i32> %a, <4 x i32> zeroinitializer, <4 x i32> <i32 0, i32 5, i32 1, i32 7>
  ret <4 x i32> %shuffle
}

define <4 x i32> @insert_reg_and_zero_v4i32(i32 %a) {
; SSE-LABEL: insert_reg_and_zero_v4i32:
; SSE:       # BB#0:
; SSE-NEXT:    movd %edi, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: insert_reg_and_zero_v4i32:
; AVX:       # BB#0:
; AVX-NEXT:    vmovd %edi, %xmm0
; AVX-NEXT:    retq
  %v = insertelement <4 x i32> undef, i32 %a, i32 0
  %shuffle = shufflevector <4 x i32> %v, <4 x i32> zeroinitializer, <4 x i32> <i32 0, i32 5, i32 6, i32 7>
  ret <4 x i32> %shuffle
}

define <4 x i32> @insert_mem_and_zero_v4i32(i32* %ptr) {
; SSE-LABEL: insert_mem_and_zero_v4i32:
; SSE:       # BB#0:
; SSE-NEXT:    movd (%rdi), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: insert_mem_and_zero_v4i32:
; AVX:       # BB#0:
; AVX-NEXT:    vmovd (%rdi), %xmm0
; AVX-NEXT:    retq
  %a = load i32* %ptr
  %v = insertelement <4 x i32> undef, i32 %a, i32 0
  %shuffle = shufflevector <4 x i32> %v, <4 x i32> zeroinitializer, <4 x i32> <i32 0, i32 5, i32 6, i32 7>
  ret <4 x i32> %shuffle
}

define <4 x float> @insert_reg_and_zero_v4f32(float %a) {
; SSE2-LABEL: insert_reg_and_zero_v4f32:
; SSE2:       # BB#0:
; SSE2-NEXT:    xorps %xmm1, %xmm1
; SSE2-NEXT:    movss %xmm0, %xmm1
; SSE2-NEXT:    movaps %xmm1, %xmm0
; SSE2-NEXT:    retq
;
; SSE3-LABEL: insert_reg_and_zero_v4f32:
; SSE3:       # BB#0:
; SSE3-NEXT:    xorps %xmm1, %xmm1
; SSE3-NEXT:    movss %xmm0, %xmm1
; SSE3-NEXT:    movaps %xmm1, %xmm0
; SSE3-NEXT:    retq
;
; SSSE3-LABEL: insert_reg_and_zero_v4f32:
; SSSE3:       # BB#0:
; SSSE3-NEXT:    xorps %xmm1, %xmm1
; SSSE3-NEXT:    movss %xmm0, %xmm1
; SSSE3-NEXT:    movaps %xmm1, %xmm0
; SSSE3-NEXT:    retq
;
; SSE41-LABEL: insert_reg_and_zero_v4f32:
; SSE41:       # BB#0:
; SSE41-NEXT:    xorps %xmm1, %xmm1
; SSE41-NEXT:    blendps {{.*#+}} xmm0 = xmm0[0],xmm1[1,2,3]
; SSE41-NEXT:    retq
;
; AVX-LABEL: insert_reg_and_zero_v4f32:
; AVX:       # BB#0:
; AVX-NEXT:    vxorps %xmm1, %xmm1, %xmm1
; AVX-NEXT:    vmovss %xmm0, %xmm1, %xmm0
; AVX-NEXT:    retq
  %v = insertelement <4 x float> undef, float %a, i32 0
  %shuffle = shufflevector <4 x float> %v, <4 x float> zeroinitializer, <4 x i32> <i32 0, i32 5, i32 6, i32 7>
  ret <4 x float> %shuffle
}

define <4 x float> @insert_mem_and_zero_v4f32(float* %ptr) {
; SSE-LABEL: insert_mem_and_zero_v4f32:
; SSE:       # BB#0:
; SSE-NEXT:    movss (%rdi), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: insert_mem_and_zero_v4f32:
; AVX:       # BB#0:
; AVX-NEXT:    vmovss (%rdi), %xmm0
; AVX-NEXT:    retq
  %a = load float* %ptr
  %v = insertelement <4 x float> undef, float %a, i32 0
  %shuffle = shufflevector <4 x float> %v, <4 x float> zeroinitializer, <4 x i32> <i32 0, i32 5, i32 6, i32 7>
  ret <4 x float> %shuffle
}

define <4 x i32> @insert_reg_lo_v4i32(i64 %a, <4 x i32> %b) {
; SSE2-LABEL: insert_reg_lo_v4i32:
; SSE2:       # BB#0:
; SSE2-NEXT:    movd %rdi, %xmm1
; SSE2-NEXT:    movsd %xmm1, %xmm0
; SSE2-NEXT:    retq
;
; SSE3-LABEL: insert_reg_lo_v4i32:
; SSE3:       # BB#0:
; SSE3-NEXT:    movd %rdi, %xmm1
; SSE3-NEXT:    movsd %xmm1, %xmm0
; SSE3-NEXT:    retq
;
; SSSE3-LABEL: insert_reg_lo_v4i32:
; SSSE3:       # BB#0:
; SSSE3-NEXT:    movd %rdi, %xmm1
; SSSE3-NEXT:    movsd %xmm1, %xmm0
; SSSE3-NEXT:    retq
;
; SSE41-LABEL: insert_reg_lo_v4i32:
; SSE41:       # BB#0:
; SSE41-NEXT:    movd %rdi, %xmm1
; SSE41-NEXT:    pblendw {{.*#+}} xmm0 = xmm1[0,1,2,3],xmm0[4,5,6,7]
; SSE41-NEXT:    retq
;
; AVX1-LABEL: insert_reg_lo_v4i32:
; AVX1:       # BB#0:
; AVX1-NEXT:    vmovq %rdi, %xmm1
; AVX1-NEXT:    vpblendw {{.*#+}} xmm0 = xmm1[0,1,2,3],xmm0[4,5,6,7]
; AVX1-NEXT:    retq
;
; AVX2-LABEL: insert_reg_lo_v4i32:
; AVX2:       # BB#0:
; AVX2-NEXT:    vmovq %rdi, %xmm1
; AVX2-NEXT:    vpblendd {{.*#+}} xmm0 = xmm1[0,1],xmm0[2,3]
; AVX2-NEXT:    retq
  %a.cast = bitcast i64 %a to <2 x i32>
  %v = shufflevector <2 x i32> %a.cast, <2 x i32> undef, <4 x i32> <i32 0, i32 1, i32 undef, i32 undef>
  %shuffle = shufflevector <4 x i32> %v, <4 x i32> %b, <4 x i32> <i32 0, i32 1, i32 6, i32 7>
  ret <4 x i32> %shuffle
}

define <4 x i32> @insert_mem_lo_v4i32(<2 x i32>* %ptr, <4 x i32> %b) {
; SSE2-LABEL: insert_mem_lo_v4i32:
; SSE2:       # BB#0:
; SSE2-NEXT:    movlpd (%rdi), %xmm0
; SSE2-NEXT:    retq
;
; SSE3-LABEL: insert_mem_lo_v4i32:
; SSE3:       # BB#0:
; SSE3-NEXT:    movlpd (%rdi), %xmm0
; SSE3-NEXT:    retq
;
; SSSE3-LABEL: insert_mem_lo_v4i32:
; SSSE3:       # BB#0:
; SSSE3-NEXT:    movlpd (%rdi), %xmm0
; SSSE3-NEXT:    retq
;
; SSE41-LABEL: insert_mem_lo_v4i32:
; SSE41:       # BB#0:
; SSE41-NEXT:    movq (%rdi), %xmm1
; SSE41-NEXT:    pblendw {{.*#+}} xmm0 = xmm1[0,1,2,3],xmm0[4,5,6,7]
; SSE41-NEXT:    retq
;
; AVX1-LABEL: insert_mem_lo_v4i32:
; AVX1:       # BB#0:
; AVX1-NEXT:    vmovq (%rdi), %xmm1
; AVX1-NEXT:    vpblendw {{.*#+}} xmm0 = xmm1[0,1,2,3],xmm0[4,5,6,7]
; AVX1-NEXT:    retq
;
; AVX2-LABEL: insert_mem_lo_v4i32:
; AVX2:       # BB#0:
; AVX2-NEXT:    vmovq (%rdi), %xmm1
; AVX2-NEXT:    vpblendd {{.*#+}} xmm0 = xmm1[0,1],xmm0[2,3]
; AVX2-NEXT:    retq
  %a = load <2 x i32>* %ptr
  %v = shufflevector <2 x i32> %a, <2 x i32> undef, <4 x i32> <i32 0, i32 1, i32 undef, i32 undef>
  %shuffle = shufflevector <4 x i32> %v, <4 x i32> %b, <4 x i32> <i32 0, i32 1, i32 6, i32 7>
  ret <4 x i32> %shuffle
}

define <4 x i32> @insert_reg_hi_v4i32(i64 %a, <4 x i32> %b) {
; SSE-LABEL: insert_reg_hi_v4i32:
; SSE:       # BB#0:
; SSE-NEXT:    movd %rdi, %xmm1
; SSE-NEXT:    punpcklqdq {{.*#+}} xmm0 = xmm0[0],xmm1[0]
; SSE-NEXT:    retq
;
; AVX-LABEL: insert_reg_hi_v4i32:
; AVX:       # BB#0:
; AVX-NEXT:    vmovq %rdi, %xmm1
; AVX-NEXT:    vpunpcklqdq {{.*#+}} xmm0 = xmm0[0],xmm1[0]
; AVX-NEXT:    retq
  %a.cast = bitcast i64 %a to <2 x i32>
  %v = shufflevector <2 x i32> %a.cast, <2 x i32> undef, <4 x i32> <i32 0, i32 1, i32 undef, i32 undef>
  %shuffle = shufflevector <4 x i32> %v, <4 x i32> %b, <4 x i32> <i32 4, i32 5, i32 0, i32 1>
  ret <4 x i32> %shuffle
}

define <4 x i32> @insert_mem_hi_v4i32(<2 x i32>* %ptr, <4 x i32> %b) {
; SSE-LABEL: insert_mem_hi_v4i32:
; SSE:       # BB#0:
; SSE-NEXT:    movq (%rdi), %xmm1
; SSE-NEXT:    punpcklqdq {{.*#+}} xmm0 = xmm0[0],xmm1[0]
; SSE-NEXT:    retq
;
; AVX-LABEL: insert_mem_hi_v4i32:
; AVX:       # BB#0:
; AVX-NEXT:    vmovq (%rdi), %xmm1
; AVX-NEXT:    vpunpcklqdq {{.*#+}} xmm0 = xmm0[0],xmm1[0]
; AVX-NEXT:    retq
  %a = load <2 x i32>* %ptr
  %v = shufflevector <2 x i32> %a, <2 x i32> undef, <4 x i32> <i32 0, i32 1, i32 undef, i32 undef>
  %shuffle = shufflevector <4 x i32> %v, <4 x i32> %b, <4 x i32> <i32 4, i32 5, i32 0, i32 1>
  ret <4 x i32> %shuffle
}

define <4 x float> @insert_reg_lo_v4f32(double %a, <4 x float> %b) {
; SSE-LABEL: insert_reg_lo_v4f32:
; SSE:       # BB#0:
; SSE-NEXT:    movsd %xmm0, %xmm1
; SSE-NEXT:    movaps %xmm1, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: insert_reg_lo_v4f32:
; AVX:       # BB#0:
; AVX-NEXT:    vmovsd %xmm0, %xmm1, %xmm0
; AVX-NEXT:    retq
  %a.cast = bitcast double %a to <2 x float>
  %v = shufflevector <2 x float> %a.cast, <2 x float> undef, <4 x i32> <i32 0, i32 1, i32 undef, i32 undef>
  %shuffle = shufflevector <4 x float> %v, <4 x float> %b, <4 x i32> <i32 0, i32 1, i32 6, i32 7>
  ret <4 x float> %shuffle
}

define <4 x float> @insert_mem_lo_v4f32(<2 x float>* %ptr, <4 x float> %b) {
; SSE-LABEL: insert_mem_lo_v4f32:
; SSE:       # BB#0:
; SSE-NEXT:    movlpd (%rdi), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: insert_mem_lo_v4f32:
; AVX:       # BB#0:
; AVX-NEXT:    vmovlpd (%rdi), %xmm0, %xmm0
; AVX-NEXT:    retq
  %a = load <2 x float>* %ptr
  %v = shufflevector <2 x float> %a, <2 x float> undef, <4 x i32> <i32 0, i32 1, i32 undef, i32 undef>
  %shuffle = shufflevector <4 x float> %v, <4 x float> %b, <4 x i32> <i32 0, i32 1, i32 6, i32 7>
  ret <4 x float> %shuffle
}

define <4 x float> @insert_reg_hi_v4f32(double %a, <4 x float> %b) {
; SSE-LABEL: insert_reg_hi_v4f32:
; SSE:       # BB#0:
; SSE-NEXT:    unpcklpd {{.*#+}} xmm1 = xmm1[0],xmm0[0]
; SSE-NEXT:    movapd %xmm1, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: insert_reg_hi_v4f32:
; AVX:       # BB#0:
; AVX-NEXT:    vunpcklpd {{.*#+}} xmm0 = xmm1[0],xmm0[0]
; AVX-NEXT:    retq
  %a.cast = bitcast double %a to <2 x float>
  %v = shufflevector <2 x float> %a.cast, <2 x float> undef, <4 x i32> <i32 0, i32 1, i32 undef, i32 undef>
  %shuffle = shufflevector <4 x float> %v, <4 x float> %b, <4 x i32> <i32 4, i32 5, i32 0, i32 1>
  ret <4 x float> %shuffle
}

define <4 x float> @insert_mem_hi_v4f32(<2 x float>* %ptr, <4 x float> %b) {
; SSE-LABEL: insert_mem_hi_v4f32:
; SSE:       # BB#0:
; SSE-NEXT:    movhpd (%rdi), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: insert_mem_hi_v4f32:
; AVX:       # BB#0:
; AVX-NEXT:    vmovhpd (%rdi), %xmm0, %xmm0
; AVX-NEXT:    retq
  %a = load <2 x float>* %ptr
  %v = shufflevector <2 x float> %a, <2 x float> undef, <4 x i32> <i32 0, i32 1, i32 undef, i32 undef>
  %shuffle = shufflevector <4 x float> %v, <4 x float> %b, <4 x i32> <i32 4, i32 5, i32 0, i32 1>
  ret <4 x float> %shuffle
}

define <4 x float> @shuffle_mem_v4f32_3210(<4 x float>* %ptr) {
; SSE-LABEL: shuffle_mem_v4f32_3210:
; SSE:       # BB#0:
; SSE-NEXT:    movaps (%rdi), %xmm0
; SSE-NEXT:    shufps {{.*#+}} xmm0 = xmm0[3,2,1,0]
; SSE-NEXT:    retq
;
; AVX-LABEL: shuffle_mem_v4f32_3210:
; AVX:       # BB#0:
; AVX-NEXT:    vpermilps {{.*#+}} xmm0 = mem[3,2,1,0]
; AVX-NEXT:    retq
  %a = load <4 x float>* %ptr
  %shuffle = shufflevector <4 x float> %a, <4 x float> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  ret <4 x float> %shuffle
}
