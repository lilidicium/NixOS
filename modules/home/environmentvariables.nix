{ config, pkgs, ... }: {

  environment.variables = {
    HYPRSHOT_DIR = "/home/maggie/media/images/screenshots";
    XDG_PICTURES_DIR = "/home/maggie/media/images/screenshots";
  };

}
