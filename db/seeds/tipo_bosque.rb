TipoBosque.create!(nombre: 'seco_tropical')

tropical = TipoBosque.create!(nombre: 'humedo_tropical')

tropical.ecuacion_volumenes.create(dap_inicial: 0, dap_final: 39.99, ecuacion_volumen: '0.004 + (0.531 * (d * d) * h)')

tropical.ecuacion_volumenes.create(dap_inicial: 40, dap_final: 59.99, ecuacion_volumen: '0.067 + (0.502 * (d * d) * h)')

tropical.ecuacion_volumenes.create(dap_inicial: 60, dap_final: 9999.99, ecuacion_volumen: '0.081 + (0.499 * (d * d) * h)')

