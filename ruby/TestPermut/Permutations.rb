starting = Process. clock_gettime(Process::CLOCK_MONOTONIC)
A = ['a','b','c']
A.permutation(2).to_a
ending = Process. clock_gettime(Process::CLOCK_MONOTONIC)
elapsed = ending - starting
p elapsed

