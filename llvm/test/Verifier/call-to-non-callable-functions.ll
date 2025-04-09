; RUN: not llvm-as %s -o /dev/null 2>&1 | FileCheck %s

declare amdgpu_cs void @callee_cs()

declare amdgpu_cs_chain void @callee_cs_chain()

declare amdgpu_cs_chain_preserve void @callee_cs_chain_preserve()

declare amdgpu_es void @callee_es()

declare amdgpu_gs void @callee_gs()

declare amdgpu_hs void @callee_hs()

declare amdgpu_kernel void @callee_kernel()

declare amdgpu_ls void @callee_ls()

declare amdgpu_ps void @callee_ps()

declare amdgpu_vs void @callee_vs()

; CHECK: Callee is not callable
; CHECK-NEXT: call amdgpu_cs_chain void @callee_cs_chain()
define amdgpu_cs_chain void @caller_cs_chain() {
entry:
  call amdgpu_cs_chain void @callee_cs_chain()
  ret void
}

; CHECK: Callee is not callable
; CHECK-NEXT: call amdgpu_cs_chain_preserve void @callee_cs_chain_preserve()
define amdgpu_cs_chain_preserve void @caller_cs_chain_preserve() {
entry:
  call amdgpu_cs_chain_preserve void @callee_cs_chain_preserve()
  ret void
}

; CHECK: Callee is not callable
; CHECK-NEXT: call amdgpu_kernel void @callee_kernel()
define amdgpu_kernel void @caller_kernel() {
entry:
  call amdgpu_kernel void @callee_kernel()
  ret void
}

; CHECK: Callee is not callable
; CHECK-NEXT: call amdgpu_vs void @callee_vs()
define amdgpu_vs void @caller_vs() {
entry:
  call amdgpu_vs void @callee_vs()
  ret void
}

; CHECK: Callee is not callable
; CHECK-NEXT: call amdgpu_gs void @callee_gs()
define amdgpu_gs void @caller_gs() {
entry:
  call amdgpu_gs void @callee_gs()
  ret void
}

; CHECK: Callee is not callable
; CHECK-NEXT: call amdgpu_ps void @callee_ps()
define amdgpu_ps void @caller_ps() {
entry:
  call amdgpu_ps void @callee_ps()
  ret void
}

; CHECK: Callee is not callable
; CHECK-NEXT: call amdgpu_cs void @callee_cs()
define amdgpu_cs void @caller_cs() {
entry:
  call amdgpu_cs void @callee_cs()
  ret void
}

; CHECK: Callee is not callable
; CHECK-NEXT: call amdgpu_es void @callee_es()
define amdgpu_es void @caller_es() {
entry:
  call amdgpu_es void @callee_es()
  ret void
}

; CHECK: Callee is not callable
; CHECK-NEXT: call amdgpu_hs void @callee_hs()
define amdgpu_hs void @caller_hs() {
entry:
  call amdgpu_hs void @callee_hs()
  ret void
}

; CHECK: Callee is not callable
; CHECK-NEXT: call amdgpu_ls void @callee_ls()
define amdgpu_ls void @caller_ls() {
entry:
  call amdgpu_ls void @callee_ls()
  ret void
}

; CHECK: Callee is not callable
; CHECK-NEXT: call amdgpu_cs_chain void %func()
define amdgpu_cs_chain void @indirect_caller_cs_chain(ptr %func) {
entry:
  call amdgpu_cs_chain void %func()
  ret void
}

; CHECK: Callee is not callable
; CHECK-NEXT: call amdgpu_cs_chain_preserve void %func()
define amdgpu_cs_chain_preserve void @indirect_caller_cs_chain_preserve(ptr %func) {
entry:
  call amdgpu_cs_chain_preserve void %func()
  ret void
}

; CHECK: Callee is not callable
; CHECK-NEXT: call amdgpu_kernel void %func()
define void @indirect_caller_kernel(ptr %func) {
entry:
  call amdgpu_kernel void %func()
  ret void
}

; CHECK: Callee is not callable
; CHECK-NEXT: call amdgpu_vs void %func()
define void @indirect_caller_vs(ptr %func) {
entry:
  call amdgpu_vs void %func()
  ret void
}

; CHECK: Callee is not callable
; CHECK-NEXT: call amdgpu_gs void %func()
define void @indirect_caller_gs(ptr %func) {
entry:
  call amdgpu_gs void %func()
  ret void
}

; CHECK: Callee is not callable
; CHECK-NEXT: call amdgpu_ps void %func()
define void @indirect_caller_ps(ptr %func) {
entry:
  call amdgpu_ps void %func()
  ret void
}

; CHECK: Callee is not callable
; CHECK-NEXT: call amdgpu_cs void %func()
define void @indirect_caller_cs(ptr %func) {
entry:
  call amdgpu_cs void %func()
  ret void
}

; CHECK: Callee is not callable
; CHECK-NEXT: call amdgpu_es void %func()
define void @indirect_caller_es(ptr %func) {
entry:
  call amdgpu_es void %func()
  ret void
}

; CHECK: Callee is not callable
; CHECK-NEXT: call amdgpu_hs void %func()
define void @indirect_caller_hs(ptr %func) {
entry:
  call amdgpu_hs void %func()
  ret void
}

; CHECK: Callee is not callable
; CHECK-NEXT: call amdgpu_ls void %func()
define void @indirect_caller_ls(ptr %func) {
entry:
  call amdgpu_ls void %func()
  ret void
}
