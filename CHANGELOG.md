## 1.4.5-wip

- Fix `forward` binding being overwritten by concurrent event handlers. Each
  kernel now retains its own emitter through a dedicated Dart Zone, including
  across `await` boundaries.
- Ignore forwarded data and returned states after the associated emitter has
  finished or been cancelled.
- Report a `StateError` when `forward` is called outside a CMS kernel context.
- Add regression tests and sequence diagrams for concurrent forwarding.
- Add characterization tests for overlapping `pace` registrations and for
  long-lived forwarding under a global sequential transformer. These tests
  document existing scheduling behavior; this release does not change it.

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
