testing
test34
  | z3 |
  z3 := ConstraintSolver newZ3Solver.
  [ctx a: (BabelsbergHRecord newFrom: {#balance -> (0.0)})]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx a = (BabelsbergIRecord newFrom: {#balance -> (0.0)})
    variable: 'ctx a'
    equals: (BabelsbergIRecord newFrom: {#balance -> (0.0)})
    butIs: ctx a.
  [ctx m: 10.0]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx a = (BabelsbergIRecord newFrom: {#balance -> (0.0)})
    variable: 'ctx a'
    equals: (BabelsbergIRecord newFrom: {#balance -> (0.0)})
    butIs: ctx a.
  self
    assert:ctx m = 10.0
    variable: 'ctx m'
    equals: 10.0
    butIs: ctx m.
  [ctx def: (nil Require_min_balance: ctx a and: ctx m)]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx a = (BabelsbergIRecord newFrom: {#balance -> (11.0)})
    variable: 'ctx a'
    equals: (BabelsbergIRecord newFrom: {#balance -> (11.0)})
    butIs: ctx a.
  self
    assert:ctx m = 10.0
    variable: 'ctx m'
    equals: 10.0
    butIs: ctx m.
  [ctx m: 100.0]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx a = (BabelsbergIRecord newFrom: {#balance -> (11.0)})
    variable: 'ctx a'
    equals: (BabelsbergIRecord newFrom: {#balance -> (11.0)})
    butIs: ctx a.
  self
    assert:ctx m = 100.0
    variable: 'ctx m'
    equals: 100.0
    butIs: ctx m.
