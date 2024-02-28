# boxkit

## Description

boxkit is a set of GitHub actions and skeleton files to build toolbox and distrobox images. Basically, clone this repo, make the changes you want, and then build what you need.

## Fedora-based Boxkit with Emacs

This image is built on a Fedora base to provide a consistent and familiar experience for users of Fedora Silverblue and other Fedora Atomic Desktops.

It's main purpose of the image is to be used as a general-purpose coding toolbox with a focus on Doom Emacs
- Emacs
  - fd
  - ripgrep
  - maildir-utils and isync (for mu4e)
  - libtool and cmake (for vterm)
- Neovim as an alternative editor.
- Basic Utilities:
  - ncdu
  - btop & htop
  - plocate
  - bat
- file management
  - ranger
  - vifm
  - zathura (pdf reader)
  

- Host Management QoL
  - These are meant for occasional one off commands, not complex workflows
    - Auto symlink the flatpak, podman, and docker commands
    - Auto symlink rpm-ostree for Fedora
    - Auto symlink transactional-update for openSUSE MicroOS

## How to use

### Create Box

If you use distrobox:

    distrobox create -i ghcr.io/ublue-os/boxkit -n boxkit
    distrobox enter boxkit
    
If you use toolbx:

    toolbox create -i ghcr.io/ublue-os/boxkit -c boxkit
    toolbox enter boxkit

### Pull down your config

Use `chezmoi` to pull down your dotfiles and set up git sync.


### Make your own

Fork and add programs to this this image - over time you'll end up with the perfect CLI for you.
Keeping it as a pet works, though the author recommends leaving all your config in git and routinely pulling a new image.

The user experience is much nicer if you [set your terminal open right in the container](https://distrobox.privatedns.org/useful_tips/#using-distrobox-as-main-cli) and is the intended experience. 

## Why?

While LTS images pay the bills they move at that pace for a reason, I wanted:

- Something that kept up the pace with cloud native tech
- Expansive repos so all stack needs are covered
  - But also has all the cool new tools the rustaceans keep cranking out
- apk is _fast_

And of course, as the user space for a cloud-native desktop the biggest reason is it's everywhere in the stack, why not be the "default terminal"?

Also, I've never gotten really to know Alpine, the problem with running distros like this bare metal on my PC is that there's a whole bunch of hardware quirks and all sorts of little enablement things that more generalized distros tend to get right. 

But in a Toolbx/Distrobox world the kernel and anything that talks to hardware is handled by the host operating system.
This let's us concentrate on just the CLI experience, get yourself some of that UNIX bling.
Also apk is fast. Watch the video for more!

[![Video Recording](https://img.youtube.com/vi/7-FPAWjROos/0.jpg)](https://youtu.be/7-FPAWjROos)

## Verification

These images are signed with sisgstore's [cosign](https://docs.sigstore.dev/cosign/overview/). You can verify the signature by downloading the `cosign.pub` key from this repo and running the following command:

    cosign verify --key cosign.pub ghcr.io/ublue-os/boxkit
    
If you're forking this repo you should [read the docs](https://docs.github.com/en/actions/security-guides/encrypted-secrets) on keeping secrets in github. You need to [generate a new keypair](https://docs.sigstore.dev/cosign/overview/) with cosign. The public key can be in your public repo (your users need it to check the signatures), and you can paste the private key in Settings -> Secrets -> Actions.

## Scope and Cynicism

I know what you're thinking, we're just going to shove everything from [Modern UNIX](https://github.com/ibraheemdev/modern-unix) in there and it's going to look like a glitter explosion. 

That's why I'm going to be strongly opinionated, so use this as a base to build your own perfect CLI experience. 
Custom configs are NOT included, those belong in your dotfiles, use them in combination with an image. 

This is a tame first effort, one of you out there is going to make something better than this, the perfect CLI workspace, I salute you. 

## Finding Good Base Images

Of course you can make this however you want, but start with the [Toolbx Community images](https://github.com/toolbx-images/images).
These are a set of mostly-stock images with packages needed to run as a toolbox/distrobox already installed. 

Try to derive your blingbox from those base images so we can all help maintain them over time, you can't have bling without good stock!

Tag your image with `boxkit` to share with others!

## [![Repography logo](https://images.repography.com/logo.svg)](https://repography.com) / Recent activity [![Time period](https://images.repography.com/35181738/ublue-os/boxkit/recent-activity/9_nHJKzKdmCsGzSsdjbuHqS2t9mY6ijnFHQGQSEWtW0/lgGy5XEcVYQ14vma9bwaPOYJFIxlNmj5nK3-CFQQkgc_badge.svg)](https://repography.com)
[![Timeline graph](https://images.repography.com/35181738/ublue-os/boxkit/recent-activity/9_nHJKzKdmCsGzSsdjbuHqS2t9mY6ijnFHQGQSEWtW0/lgGy5XEcVYQ14vma9bwaPOYJFIxlNmj5nK3-CFQQkgc_timeline.svg)](https://github.com/ublue-os/boxkit/commits)
[![Issue status graph](https://images.repography.com/35181738/ublue-os/boxkit/recent-activity/9_nHJKzKdmCsGzSsdjbuHqS2t9mY6ijnFHQGQSEWtW0/lgGy5XEcVYQ14vma9bwaPOYJFIxlNmj5nK3-CFQQkgc_issues.svg)](https://github.com/ublue-os/boxkit/issues)
[![Pull request status graph](https://images.repography.com/35181738/ublue-os/boxkit/recent-activity/9_nHJKzKdmCsGzSsdjbuHqS2t9mY6ijnFHQGQSEWtW0/lgGy5XEcVYQ14vma9bwaPOYJFIxlNmj5nK3-CFQQkgc_prs.svg)](https://github.com/ublue-os/boxkit/pulls)
[![Trending topics](https://images.repography.com/35181738/ublue-os/boxkit/recent-activity/9_nHJKzKdmCsGzSsdjbuHqS2t9mY6ijnFHQGQSEWtW0/lgGy5XEcVYQ14vma9bwaPOYJFIxlNmj5nK3-CFQQkgc_words.svg)](https://github.com/ublue-os/boxkit/commits)
[![Top contributors](https://images.repography.com/35181738/ublue-os/boxkit/recent-activity/9_nHJKzKdmCsGzSsdjbuHqS2t9mY6ijnFHQGQSEWtW0/lgGy5XEcVYQ14vma9bwaPOYJFIxlNmj5nK3-CFQQkgc_users.svg)](https://github.com/ublue-os/boxkit/graphs/contributors)
[![Activity map](https://images.repography.com/35181738/ublue-os/boxkit/recent-activity/9_nHJKzKdmCsGzSsdjbuHqS2t9mY6ijnFHQGQSEWtW0/lgGy5XEcVYQ14vma9bwaPOYJFIxlNmj5nK3-CFQQkgc_map.svg)](https://github.com/ublue-os/boxkit/commits)
