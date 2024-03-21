{ config, inputs, pkgs, ... }:
{
home.file."${config.xdg.configHome}/nvim" = {
enable = true;
recursive = true;
source = ./.config/nvim;
executable = true;
# target = "./nvim";
};
}
