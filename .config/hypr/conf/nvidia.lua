--------------
--- NVIDIA ---
--------------

-- See https://wiki.hypr.land/Nvidia/
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("GBM_BACKEND", "nvidia-drm")

hl.config({
    cursor = {
        no_hardware_cursors = true,
    },
})
