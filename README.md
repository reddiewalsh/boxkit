# boxkit

## Description

boxkit is a set of GitHub actions and skeleton files to build toolbox and distrobox images. Basically, clone this repo, make the changes you want, and then build what you need.

## Void-based Boxkit with Emacs

This image's main purpose of the image is to be used as a general-purpose coding toolbox with a focus on Doom Emacs
- Emacs
  - fd
  - ripgrep
  - mu4e and isync 
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
  
## How to use

### Create Box

If you use distrobox:

    distrobox create -i ghcr.io/reddiewalsh/boxkit -n boxkit
    distrobox enter boxkit
    
If you use toolbx:

    toolbox create -i ghcr.io/reddiewalsh/boxkit -c boxkit
    toolbox enter boxkit

### Pull down your config

Use `chezmoi` to pull down your dotfiles and set up git sync.


### Make your own

Fork and add programs to this this image - over time you'll end up with the perfect CLI for you.
Keeping it as a pet works, though the author recommends leaving all your config in git and routinely pulling a new image.

The user experience is much nicer if you [set your terminal open right in the container](https://distrobox.privatedns.org/useful_tips/#using-distrobox-as-main-cli) and is the intended experience. 

## Verification

These images are signed with sisgstore's [cosign](https://docs.sigstore.dev/cosign/overview/). You can verify the signature by downloading the `cosign.pub` key from this repo and running the following command:

    cosign verify --key cosign.pub ghcr.io/ublue-os/boxkit
    
If you're forking this repo you should [read the docs](https://docs.github.com/en/actions/security-guides/encrypted-secrets) on keeping secrets in github. You need to [generate a new keypair](https://docs.sigstore.dev/cosign/overview/) with cosign. The public key can be in your public repo (your users need it to check the signatures), and you can paste the private key in Settings -> Secrets -> Actions.

