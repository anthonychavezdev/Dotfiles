{ ... }: {
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  # networking.firewall.allowedUDPPorts = [ 8081 ];
  networking.firewall = {
    # Allow LAN connections
    # extraCommands = ''
    #   iptables -A nixos-fw -p tcp -s 192.168.1.0/24 -j nixos-jw-accept
    #   iptables -A nixos-fw -p udp -s 192.168.1.0/24 -j nixos-jw-accept
    #   '';

    allowedTCPPorts = [
      # Spotify
      # sync local tracks from your filesystem with mobile devices in the same network
      57621
      # Expo
      8081 ];
    allowedUDPPorts = [
      # In order to enable discovery of Google Cast devices (and possibly other Spotify Connect devices) in the same network
      5353 ];

    # KDE/GSconnect
    allowedTCPPortRanges = [
      { from = 1714; to = 1764; }
    ];
    allowedUDPPortRanges = [
      { from = 1714; to = 1764; }
    ];
  };
}
