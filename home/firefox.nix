{ pkgs, ... }: {
  programs.firefox = {
    enable = true;

    profiles.xayah = {
      name = "xayah";

      bookmarks = let 
        mkBookmark = name: tags: keyword: url: { name = name; tags = tags; keyword = keyword; url = url; };
      in [
        # Bookmarks for university
        (mkBookmark "Moodle" ["uni"] "moodle" "https://www.b-tu.de/elearning/btu/my/")
        (mkBookmark "MyBTU" ["uni"] "mybtu" "https://www.b-tu.de/myBTU/")
        (mkBookmark "BTU-Mail" ["uni"] "btumail" "https://www.b-tu.de/webmail/imp/")
        (mkBookmark "Prüfungsportal" ["uni"] "pportal" "https://www.b-tu.de/qispos11/rds?state=user&type=0")

        # Often used websites
        (mkBookmark "Youtube" [] "yt" "https://www.youtube.com/")
        (mkBookmark "Youtube Music" ["music"] "music" "https://music.youtube.com/")
      ];

      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        sponsorblock
        youtube-shorts-block
        dashlane
        vimium
      ];

      search = {
        force = true;
        default = "Startpage";
        engines = let
          mkParam = name: value: { name = name; value = value; };
        in {
          "Nix Packages" = {
            urls = [{
              template = "https://search.nixos.org/packages";
              params = [
                (mkParam "type" "packages")
                (mkParam "channel" "unstable")
                (mkParam "query" "{searchTerms}")
              ];
            }];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@n"];
          };

          "Hoogle" = {
            urls = [{
              template = "https://hoogle.haskell.org/";
              params = [
                (mkParam "hoogle" "{searchTerms}")
              ];
            }];
            definedAliases = ["@h"];
          };

          "Startpage" = {
            urls = [{
              template = "https://www.startpage.com/do/search";
              params = [
                (mkParam "query" "{searchTerms}")
                (mkParam "lui" "english")
              ];
            }];
            definedAliases = ["@p"];
          };

          "Bing".metaData.hidden = true;
          "Wikipedia".metaData.hidden = true;
          "Google".metaData.alias = "@g";
        };
      };
      

      settings = {
        "browser.disableResetPrompt" = true;
        "browser.download.panel.shown" = true;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.shell.defaultBrowserCheckCount" = 1;
      };
    };
  };
}
