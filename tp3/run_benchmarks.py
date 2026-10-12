import numpy as np
import matplotlib.pyplot as plt
import fbench

ns = [10**k for k in range(2, 7)]
ts = [fbench.bench(n) for n in ns]

plt.loglog(ns, ts, 'o-', label='Jacobi (CSR)')
plt.loglog(ns, [ts[0]*n/ns[0] for n in ns], '--', label='O(n)')
plt.xlabel('n'); plt.ylabel('temps (s)'); plt.legend(); plt.grid(True, which='both')
plt.savefig('bench.png', dpi=150)