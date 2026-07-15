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

