builtin.module attributes  {"torch.debug_module_name" = "foo"} {
  "ml_program.global"() {"is_mutable", "sym_name" = "global_seed", "sym_visibility" = "private", "type" = tensor<i64>, "value" = dense<0> : tensor<i64>} : () -> ()
  func.func @forward(%arg0 : tensor<256x128xf32>, %arg1 : tensor<128x10xf32>, %arg2 : tensor<10xf32>) -> tensor<256x10xf32> {
    %0 = arith.constant 0.000000e+00 : f32
    %1 = "tensor.empty"() : () -> tensor<256x10xf32>
    %2 = "linalg.generic"(%0, %1) ({
    ^0(%arg3 : f32, %arg4 : f32):
      "linalg.yield"(%arg3) : (f32) -> ()
    }) {"indexing_maps" = [affine_map<(d0, d1) -> ()>, affine_map<(d0, d1) -> (d0, d1)>], "iterator_types" = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], "operandSegmentSizes" = array<i32: 1, 1>} : (f32, tensor<256x10xf32>) -> tensor<256x10xf32>
    func.return %2 : tensor<256x10xf32>
  }
}
