# OrangeFox 12.1 device tree — Oppo A15 (CPH2185 / MT6765)

Port of the OrangeFox `garden` (Redmi 9A / dandelion) tree to the Oppo A15.

| Part | Source |
|------|--------|
| OrangeFox framework (`vendorsetup.sh`, helper scripts, product/device layout, TWRP/Fox flags) | `garden-fox_12.1_Q` |
| Kernel, DTB, DTBO, boot-image offsets, partition table, super layout, fstab/twrp.flags | `android_recovery_oppo_CPH2185-twrp-12.1` |
| Crypto stack (Trustonic mobicore, keymaster 4.0, cryptoeng, gatekeeper) | `android_recovery_oppo_CPH2185-twrp-12.1` |

Dropped from the Redmi tree: Microtrust TEEI (`teei_daemon`, beanpod keymaster, `thh/ta`), Novatek/FocalTech
touch firmware, `unified-script.sh` (dandelion/angelica/cattail props), f2fs `/data`, AVB recovery key,
Qualcomm-style USB rc.

Build: `lunch twrp_CPH2185-eng && mka adbd bootimage` (or run the workflow in `.github/workflows`).
