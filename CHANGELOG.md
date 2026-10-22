## 1.4.5

- Fix concurrent handlers overwriting the emitter used by `forward`, which
  could cancel a subscription immediately after an `await`.
- Ignore forwarded data and returned states after the handler has completed or
  been cancelled. Throw `StateError` when `forward` is called outside a kernel.
- Add forwarding regression tests and scheduling tests.
- Clarify existing scheduling behavior: events share the default channel unless
  explicitly registered with `pace<E>`. Use separate registrations when event
  types need independent scheduling. Avoid overlapping parent and child
  registrations, which can process an event twice. Scheduling behavior remains
  unchanged in this release.

## 1.4.4

- docs

## 1.4.3

- fix `id`: if e is S, then return S

## 1.4.2

- add `id` (s => s)

## 1.4.1

- fix `forward`(must await)

## 1.4.0

- downgrade meta

## 1.3.0

- rename relay to forward

## 1.2.0

- remove dispatch, just use `add`

## 1.1.0

- handle undefined map.

## 1.0.0

- Controlled Markov Stream.
