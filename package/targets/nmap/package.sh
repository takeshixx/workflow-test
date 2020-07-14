#!/bin/bash
set -x
if [ $# -lt 2 ];then
    echo "Usage: ${0} <output directory> <arch>" >&2
    echo "Example: ${0} /output x86_64" >&2
    exit 2
fi
output_dir=$1
arch=$2
tmp_dir=$(mktemp -dt packaging.XXXXXX)
trap exit_script EXIT TERM

if [ ! -d "$output_dir" ];then
    echo "Invalid directory ${output_dir}"
    exit 1
fi

exit_script(){
    rm -rf "$tmp_dir"
}

echo "tmp_dir: ${tmp_dir}"

version=""

for f in $(ls "$output_dir");do
    case "$f" in
        nmap-data*)
            mv "${output_dir}/${f}" "${tmp_dir}/data"
            ;;
        nmap*)
            mv "${output_dir}/${f}" "${tmp_dir}/nmap"
            version=${f//nmap-/}
            ;;
        nping*)
            mv "${output_dir}/${f}" "${tmp_dir}/nping"
            ;;
        ncat*)
            mv "${output_dir}/${f}" "${tmp_dir}/ncat"
            ;;
        *)
            echo "This file should not be there: ${output_dir}/${f}"
            ;;
    esac
done

if [ ! -d /packaged ];then
    mkdir /packaged
fi
cp $GITHUB_WORKSPACE/package/targets/nmap/run-nmap.sh "$tmp_dir"
cd "$tmp_dir"
tar czf "${output}/nmap-${version}-${arch}-portable.tar.gz" -C "$tmp_dir" .
cp "${output}/nmap-${version}-${arch}-portable.tar.gz" /packaged
zip -r -q "${output}/nmap-${version}-${arch}-portable.zip" .
cp "${output}/nmap-${version}-${arch}-portable.zip" /packaged
