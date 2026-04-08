# HAOS Omni Bare Metal Provider

This add-on runs the official [omni-infra-provider-bare-metal](https://github.com/siderolabs/omni-infra-provider-bare-metal) so **Sidero Omni** can manage bare-metal machines (PXE/iPXE, power control, etc.) from your Home Assistant host.

## Prerequisites

- Home Assistant OS or Supervised on **amd64** or **aarch64**.
- A running Omni instance and an **infrastructure provider** in Omni whose ID matches **Provider ID** (default `bare-metal`).
- An Omni **service account key** for this provider.
- Network placement where the Home Assistant host can run a **DHCP proxy** on the same L2 segment as target machines. A normal **DHCP server must already exist**; this provider does not replace full DHCP.
- Outbound access to Talos **Image Factory** (`factory.talos.dev`, `pxe.factory.talos.dev`) unless you run a custom setup (not covered by default options).

## Installation

1. Open **Settings** → **Add-ons** → **Add-on Store**.
2. **⋮** → **Repositories** → add `https://github.com/vidurb/haos-omni-bare-metal-provider`.
3. Refresh, install **HAOS Omni Bare Metal Provider**, then open **Configuration**.

## Configuration

| Option | Description |
|--------|-------------|
| Omni API endpoint | HTTPS URL of your Omni API. |
| Omni service account key | Secret key for the provider. |
| Provider ID | Must match the infra provider ID in Omni (default `bare-metal`). |
| Provider name | Display name in Omni (default `Bare Metal`). |
| API advertise address | IP address agents and DHCP clients should use to reach this provider. **Required** when multiple interfaces or routes exist. |
| DHCP proxy interface | Optional interface name or IP for the DHCP proxy bind (see upstream `--dhcp-proxy-iface-or-ip`). |
| DHCP proxy port | UDP port for the proxy (default `67`; use `4011` for ProxyDHCP mode per upstream docs). |
| Disable DHCP proxy | Disables the built-in DHCP proxy entirely (only if you know you need this). |
| Insecure skip TLS verify | Only if Omni TLS cannot be validated. |
| Debug | Enables verbose logging on the provider. |

## Networking and privileges

This add-on uses **host networking** and requests **NET_RAW** and **NET_ADMIN** so the DHCP proxy can operate. **AppArmor is disabled** for this add-on to reduce interference with raw sockets.

Bare-metal provisioning is sensitive: incorrect network settings can disrupt DHCP/PXE on your LAN. Test on an isolated VLAN when possible.

## Data

`/data` is reserved for persistent add-on storage (currently unused by default options).

## Security

- Treat the Omni service account key as a highly sensitive credential.
- Prefer **manual** start until configuration is correct (default boot mode).
- This add-on is powerful; only install it if you understand Omni bare-metal networking.

## Support

- Add-on issues: [haos-omni-bare-metal-provider](https://github.com/vidurb/haos-omni-bare-metal-provider/issues)
- Provider behavior: [omni-infra-provider-bare-metal](https://github.com/siderolabs/omni-infra-provider-bare-metal) and [Sidero docs](https://docs.siderolabs.com/omni/omni-cluster-setup/setting-up-the-bare-metal-infrastructure-provider)
