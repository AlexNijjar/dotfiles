{
  disko.devices.disk.main = {
    type = "disk";
    device = "/dev/nvme0n1";
    content = {
      type = "gpt";
      partitions = {
        ESP = {
          size = "1G";
          type = "EF00";
          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
            mountOptions = ["umask=0077"];
          };
        };
        root = {
          size = "100%";
          content = {
            type = "btrfs";
            extraArgs = ["-f"];
            subvolumes = {
              "/root" = {
                mountOptions = ["compress=zstd" "noatime"];
                mountpoint = "/";
              };
              "/home" = {
                mountOptions = ["compress=zstd" "noatime"];
                mountpoint = "/home";
              };
              "/nix" = {
                mountOptions = ["compress=zstd" "noatime"];
                mountpoint = "/nix";
              };
              "/swap" = {
                mountpoint = "/.swapvol";
                swap = {
                  swapfile = {
                    size = "16G";
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
