{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nithish-laptop";
  networking.networkmanager.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };
  services.blueman.enable = true;

  time.timeZone = "America/Los_Angeles";

  services.printing = {
    enable = true;
    drivers = with pkgs; [
      gutenprint # — Drivers for many different printers from many different vendors.
      gutenprintBin # — Additional, binary-only drivers for some printers.
      hplip # — Drivers for HP printers.
      hplipWithPlugin # — Drivers for HP printers, with the proprietary plugin. Use NIXPKGS_ALLOW_UNFREE=1 nix-shell -p hplipWithPlugin --run 'sudo -E hp-setup' to add the printer, regular CUPS UI doesn't seem to work.
      postscript-lexmark # — Postscript drivers for Lexmark
      samsung-unified-linux-driver # — Proprietary Samsung Drivers
      splix # — Drivers for printers supporting SPL (Samsung Printer Language).
      brlaser # — Drivers for some Brother printers
      brgenml1lpr #  — Generic drivers for more Brother printers [1]
      brgenml1cupswrapper # — Generic drivers for more Brother printers [1]
      cnijfilter2 # — Drivers for some Canon Pixma devices (Proprietary driver)
    ];
  };
  # network printing
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
  # firmware updates
  services.fwupd.enable = true;
  services.gnome.gnome-keyring.enable = true;
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --remember --time --cmd Hyprland";
      };
    };
  };

  # hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # services.desktopManager.cosmic.enable = true;
  # services.displayManager.cosmic-greeter.enable = true;

  # sound
  hardware.pulseaudio.enable = false;
  hardware.graphics.enable32Bit = true;
  hardware.pulseaudio.support32Bit = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  users.users.nithish = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
  };

  #fingerprint reader
  services.fprintd.enable = true;
  security.pam.services.hyprlock = {};
  services.udev.packages = with pkgs; [gnome-settings-daemon];

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git

    power-profiles-daemon

    tailscale

    networkmanagerapplet
    meson
    wayland-protocols
    wayland-utils
    wl-clipboard
    wlroots

    polkit_gnome
    wireplumber
  ];
  # enable Hyprland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # xdg.portal.enable = true;
  # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  services.tailscale.enable = true;

  fonts.packages = with pkgs; [
    font-awesome
    nerdfonts
    fira-code
    ibm-plex
  ];
  services.openssh.enable = true;
  services.power-profiles-daemon.enable = true;
  services.logind = {
    powerKey = "ignore";
    powerKeyLongPress = "poweroff";
    lidSwitch = "suspend";
    lidSwitchExternalPower = "suspend";
  };

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?
}
