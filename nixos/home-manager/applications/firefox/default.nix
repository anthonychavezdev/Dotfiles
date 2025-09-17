{ config, pkgs, inputs, firefox-addons-allowUnfree, ... }: {
  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
        settings = {
          # "browser.startup.homepage" = "https://duckduckgo.com";
          "browser.search.defaultenginename" = "DuckDuckGo";
          "browser.search.order.1" = "DuckDuckGo";

          "browser.compactmode.show" = true;
          # Faster scrolling with mouse wheel
          "mousewheel.min_line_scroll_amount" = 100;
        };
        search = {
          force = true;
          default = "ddg";
          order = [ "ddg" "google" ];
        };
       extensions = {
         packages = with firefox-addons-allowUnfree; [
           ublock-origin
           bitwarden
           darkreader
           vimium
           multi-account-containers
           pay-by-privacy
         ];
       };
      };
    };
  };
}
