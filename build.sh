#!/bin/bash
name="srun"
version="v0.1.0"
path="out"

start=$(date +%s)

# Windows
# os="windows"
# arch=("386" "amd64" "arm64")
# for a in ${arch[@]}; do
#     GOOS=$os GOARCH=$a go build -o $path/$name-$os-$a-$version.exe -ldflags -w
#     echo "Built executable: $path/$name-$os-$a-$version.exe"
# done

# Linux
os="linux"
# arch=("386" "amd64" "arm" "arm64" "mips" "mipsle" "mips64" "mips64le" "ppc64" "ppc64le" "s390x" "riscv64")
arch=("amd64")
for a in ${arch[@]}; do
    GOOS=$os GOARCH=$a go build -o $path/$name-$os-$a-$version -ldflags -w
    echo "Built executable: $path/$name-$os-$a-$version"
done

# macOS
# os="darwin"
# arch=("amd64" "arm64")
# for a in ${arch[@]}; do
#     GOOS=$os GOARCH=$a go build -o $path/$name-$os-$a-$version -ldflags -w
#     echo "Built executable: $path/$name-$os-$a-$version"
# done

end=$(date +%s)
dur=$(($end - $start))
echo "Build time: $dur seconds"

# Set output variable
echo "::set-output name=artifact_path::$GITHUB_WORKSPACE/$path"
