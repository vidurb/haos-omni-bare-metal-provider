# Changelog

## 1.0.2 - 2026-04-08

- Fix provider startup by including `zbin` at `/bin/zbin` for iPXE patching.
- Bump add-on `config.yaml` version to `1.0.2` to match the release tag.

## 1.0.1 - 2026-04-08

- Fix release image tag mismatch by stripping a leading `v` from GitHub release tags in CI image publishing.
- Keep add-on `config.yaml` version (`1.0.1`) aligned with published GHCR image tags.

## 1.0.0 - 2026-04-08

- First release.
- Bundles `ghcr.io/siderolabs/omni-infra-provider-bare-metal:v0.8.1` (multi-arch).
- Host networking, NET_RAW/NET_ADMIN, AppArmor disabled for DHCP proxy operation.
- Images published to GHCR via GitHub Actions.
