# My Desktop cloning other PC

## 1. Download your complete setup
```bash
git clone https://github.com ~/scr
```

## 2. Navigate to your folder
```bash
cd ~/scr
```

## To update cloud
```bash
git add -A
git commit -m "Update status bar alignment and tweak dwm colors"
git push
```

## Get latest pull
```bash
cd ~/scr
git pull
```

## Reset local folder to match the cloud exactly
```bash
# 1. Fetch the cloud data without merging yet
git fetch origin

# 2. Reset your local folder to match the cloud exactly
git reset --hard origin/main
```


## Launching DWM on your other PC
After cloning, symlink the backed-up xinitrc file to your home directory:
```bash
ln -sf ~/scr/scripts/xinitrc.bak ~/.xinitrc
```
Start your desktop environment:
```bash
startx
```

## Optional Hardware Tweaks (Gentoo NUC Configuration)
If your other hardware requires similar performance optimizations, update your local bootloader configurations manually:
1. Edit your system grub config:
   ```bash
   doas nano /etc/default/grub
   ```
2. Append your required kernel parameters (e.g., turning off turbo boost):
   ```text
   GRUB_CMDLINE_LINUX_DEFAULT="intel_pstate=disable ..."
   ```
3. Re-generate your configuration layout:
   ```bash
   doas grub-mkconfig -o /boot/grub/grub.cfg
   ```
