# Manifest Repository

这个仓库包含了管理多个项目的manifest文件。

## 包含的项目

- **coreutils**: 核心工具项目
- **network**: 网络相关项目  
- **rtsp**: RTSP流媒体项目
- **remote-desk**: 远程桌面项目

## 使用方法

### 使用repo工具（推荐）

1. 安装repo工具：
```bash
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
```

2. **选择访问方式：**

#### HTTPS方式 (默认)
```bash
mkdir workspace && cd workspace
repo init -u https://github.com/lmshao/manifest.git
repo sync
```

#### SSH方式 (开发者推荐)
```bash
mkdir workspace && cd workspace
repo init -u git@github.com:lmshao/manifest.git -m ssh.xml
repo sync
```

### 使用setup脚本（最简单）

```bash
# 进入manifest仓库目录
cd manifest

# HTTPS方式 (默认)
./setup.sh

# SSH方式
USE_SSH=1 ./setup.sh
```

3. 同步所有项目：
```bash
repo sync
```

### 手动克隆

如果不使用repo工具，也可以手动克隆各个项目：

```bash
mkdir workspace
cd workspace

git clone git@github.com:lmshao/coreutils.git
git clone git@github.com:lmshao/network.git
git clone git@github.com:lmshao/rtsp.git
git clone git@github.com:lmshao/remote-desk.git
```

## 维护

要添加新项目，编辑 `default.xml` 和 `ssh.xml` 文件，添加新的 `<project>` 标签。

要更新所有项目：
```bash
repo sync
```
