create_clock -name {CLK_50M} -period 20.0 [get_ports {clock}]

derive_pll_clocks
derive_clock_uncertainty