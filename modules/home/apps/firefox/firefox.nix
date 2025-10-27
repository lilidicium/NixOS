{ config
, pkgs
, lib
, ...
}:
let
  fxcast = pkgs.fx_cast_bridge.overrideAttrs (o: {
    version = "0.3.1";
    src = pkgs.fetchFromGitHub {
      owner = "hensm";
      repo = "fx_cast";
      rev = "v0.3.1";
      hash = "sha256-hB4NVJW2exHoKsMp0CKzHerYgj8aR77rV+ZsCoWA1Dg=";
    };
  });

  darkreaderManifest = {
    name = "darkreader";
    description = "custom darkreader native host for syncing with pywal";
    path = ".files/index.js";
    type = "stdio";
  };
in
{
  config.xdg.configFile."google-chrome/NativeMessagingHosts/darkreader.json".text = builtins.toJSON
    (darkreaderManifest // { allowed_origins = [ "chrome-extension://eimdkcfmnnhlocgglnpbjgjibbfkejcn/" ]; });

  config.home.file = {
    ".mozilla/native-messaging-hosts/darkreader.json".text = builtins.toJSON
      (darkreaderManifest // { allowed_extensions = [ "darkreader@alexhulbert.com" ]; });
  };

  config.xdg.configFile."vimfx/config.js".source = ./files/vimfx.js;
  config.xdg.configFile."vimfx/frame.js".text = "";

  config.programs.firefox = {
    enable = true;
    languagePacks = [ "en-US" ];
    profileVersion = null;
    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "dom.w3c_touch_events.enabled" = 1;
        "widget.use-xdg-desktop-portal" = true;
        "apz.gtk.kinetic_scroll.enabled" = false;
      };
    };

    /* ---- POLICIES ---- */
    # Check about:policies#documentation for options.
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value= true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      DisableFirefoxScreenshots = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
      DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
      SearchBar = "unified"; # alternative: "separate"

      /* ---- EXTENSIONS ---- */
      # Check about:support for extension/add-on ID strings.
      # Valid strings for installation_mode are "allowed", "blocked",
      # "force_installed" and "normal_installed".
      ExtensionSettings = {
        # uBlock Origin:
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        # Privacy Badger:
        "jid1-MnnxcxisBPnSXQ@jetpack" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
          installation_mode = "force_installed";
        };
        # Pywalfox:
        "pywalfox@frewacom.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/pywalfox/latest.xpi";
          installation_mode = "force_installed";
        };
      };

      /* ---- PREFERENCES ---- */
      # Check about:config for options.
      Preferences = {
        "browser.contentblocking.category" = { Value = "strict"; Status = "locked"; };
        "extensions.screenshots.disabled" = true;
        "browser.topsites.contile.enabled" = false;
        "browser.formfill.enable" = false;
        "browser.search.suggest.enabled" = false;
        "browser.search.suggest.enabled.private" = false;
        "browser.urlbar.suggest.searches" = false;
        "browser.urlbar.showSearchSuggestionsFirst" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.snippets" = false;
        "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
        "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = false;
        "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = false;
        "browser.newtabpage.activity-stream.section.highlights.includeVisited" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.system.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "layout.css.devPixelsPerPx" = "1.75";
        "sidebar.verticalTabs" = true;
        "sidebar.verticalTabs.dragToPinPromo.dismissed" = true;
        "sidebar.visibility" = "always-show";
        "sidebar.position_start" = false;
        "browser.tabs.closeWindowWithLastTab" = false;

      };
    };
  };

}
