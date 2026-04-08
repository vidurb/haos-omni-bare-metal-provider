# haos-omni-bare-metal-provider

Home Assistant OS add-on repository that runs the [Sidero Omni bare metal infrastructure provider](https://github.com/siderolabs/omni-infra-provider-bare-metal) on your Home Assistant host.

## Install

1. In Home Assistant: **Settings** → **Add-ons** → **Add-on Store** → **⋮** → **Repositories**
2. Add: `https://github.com/vidurb/haos-omni-bare-metal-provider`
3. Refresh the store, open **HAOS Omni Bare Metal Provider**, install, configure Omni and network settings, then start.

## Layout

- [`omni-bare-metal-provider/`](omni-bare-metal-provider/) — Supervisor add-on (metadata, image build, entrypoint)

## Requirements

- **amd64** or **aarch64** Home Assistant installation (match your hardware to the provider’s PXE/boot expectations).
- A running [Sidero Omni](https://www.siderolabs.com/omni/) instance and an infrastructure provider in Omni whose ID matches **Provider ID** in the add-on (default `bare-metal`).
- L2 network access suitable for **DHCP proxy** operation (a normal DHCP server must already exist on the segment; the provider supplies iPXE responses).
- Access to Talos **Image Factory** endpoints unless you use advanced flags not exposed by this add-on.

## Documentation

See the add-on **Documentation** tab in Home Assistant or [`omni-bare-metal-provider/DOCS.md`](omni-bare-metal-provider/DOCS.md).

## License

MIT
