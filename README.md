[![NixOS Unstable](https://img.shields.io/badge/NixOS-24.05-blue.svg?style=flat-square&logo=NixOS&logoColor=white)](https://nixos.org)

I decided to document my NixOS journey by making this repo public. I'm keeping it
mostly for version control and backups, but it's also nice to have a link that
I can use to share my entire system config with others.

> [!IMPORTANT]
> **Disclaimer:** _I do not intend anyone but myself to use this configuration._
> I have this repo for version control purposes, and so I can send it to Nix
> experts when I need help with something. Feel free to copy from this repo if
> you want (I'm trying to make it as readable as possible!), but I discourage
> you from Using This Config.

+ **What's new:**
  - split home.nix and configuration.nix into modules, 
    located at `/modules/home` and `/modules/system`
  - homogenized formatting and improved readability by 
    adding (and removing) comments

+ **What I'm working on:**
  - modularizing hyprland.nix
  - cleaning up flake.nix
  - swapping out the nwg launchers for sysmenu
  - figuring out how to implement non-.nix configuration files
  - implementing kmonad because my thinkpad doesn't have qmk

------
|               | Wayland                 |
|---------------|-------------------------|
| **Shell:**    | [caelestia][caelestia]  |
| **WM:**       | hyprland                |
| **Editor:**   | micro & vscode          |
| **Terminal:** | alacritty               |
| **Launcher:** | nwg-launcher            |
| **Browser:**  | [zen][zen]              |

-----

+ **Why NixOS?**
  For as long as I've been using computers, I've had to reinstall my OS
  every few months because my drive accumulates so much random stuff.
  Programs I don't use anymore, artifacts left over from uninstallations,
  random repos I cloned and forgot to delete, et cetera. I thought simply
  not using Windows would fix this issue, but alas, the same thing happened
  on Arch. Nix lets me have my entire system configured declaratively, so 
  I can cut down on the amount of random bullshit I install, and if I *do*
  have to reinstall, my system will be exactly the same once I import my
  config.

+ **Should YOU use NixOS?**
  Here's my answer: if you don't do Linux as a hobby (if you value your
  free time), don't. NixOS is absolutely a hobby to me, and as much as I
  adore it, it's also driven me nearly insane. Learning Nix from scratch
  was *rough*. It took me an entire month to get my configuration to a
  usable state, and it was two months before I really knew what I was
  doing. Declarative configuration has to be worth the blood, sweat, and
  tears to you, and if it isn't, you'll go through the hell of Nix for
  nothing. It's worth it to me! I'll let you decide if it's worth it 
  for you.

+ **How did you learn to use NixOS?**
  I started with [this guide][guide], which was very nice. I started a thread
  in [diinki's discord server][discord] to ask more experienced Nix users all my
  NixOS questions (since the Nix documentation is useless). Join up and
  say hi to me (*@lilidicium*)!!! I referenced [ZaneyOS][zaneyos] for my Hyprland
  config, and for the rest of it, I pretty much DIY'd it (I do NOT
  recommend trying to figure Nix stuff out on your own. Ask someone who
  knows what they're doing, trust me!!!) For this readme, I referenced 
  [hlissner's][hlissner] readme, which has a ton of way better NixOS resources.
  Please go check them out!

[zen]: https://zen-browser.app/
[caelestia]: https://github.com/caelestia-dots/shell
[hlissner]: https://github.com/hlissner/dotfiles
[zaneyos]: https://gitlab.com/Zaney/zaneyos
[guide]: https://nixos-and-flakes.thiscute.world/
[discord]: https://discord.gg/JnZNJy9BPk
