# Throughput benchmark

Run from the package root in AOT mode:

```sh
dart compile exe benchmark/throughput.dart -o /tmp/cms-throughput
/tmp/cms-throughput
```

Compares CMS with direct Bloc handlers using the same sequential transformer,
integer inputs and integer states. The synchronous workload returns/emits the
input; the asynchronous workload additionally awaits `Future.value`.
Each sample enqueues 20,000 events and waits for all state notifications.
Every output is checked for order and value. Construction and cleanup are
excluded; event enqueueing, processing and state delivery are included.

Each workload uses three warmup rounds and nine measured rounds, alternating
CMS/Bloc execution order. Results report median microseconds per event and
the ratio of those medians. There is no timing threshold in the unit tests.

Local AOT result (Dart 3.13.5, Linux x64):

| Workload | CMS (µs/event) | Bloc (µs/event) | CMS / Bloc |
| --- | ---: | ---: | ---: |
| Synchronous | 1.191 | 0.854 | 1.39× |
| Asynchronous | 1.182 | 0.924 | 1.28× |

These are microbenchmarks of lightweight handlers, not application latency
measurements. They include the combined cost of CMS dispatch, Zone binding and
awaiting the kernel; they do not isolate the cost of each component. They do
not measure `forward`, multiple `pace` registrations, memory use, I/O or UI
rendering. Absolute times and ratios vary with hardware and system load.
