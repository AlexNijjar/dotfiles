{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 1;
    };
    kernelParams = ["amdgpu.ppfeaturemask=0xffffffff"];
  };
}
