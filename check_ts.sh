#!/bin/bash

ts_dir="$1"
build_dir="$2"
template="$3"
ts_file=''
ret=0

error()
{
    echo "check_ts($ts_file): $@" >&2
    ret=1
}

fatal_error()
{
    error "$@"
    exit 1
}

[[ -n "$ts_dir" && -n "$build_dir" && -n "$template" ]] || fatal_error "wrong parameters, need [ts_dir] & [build_dir] & [template]"
[[ -d "$ts_dir" ]] || fatal_error "ts_dir does not exist"
[[ -d "$build_dir" ]] || fatal_error "build_dir does not exist"

for ts_file in "$ts_dir/"*.ts; do
    # skip the template file
    [[ "$ts_file" != *"/$template.ts" ]] || continue

    # check if lanuguage matches file name
    language="$(sed -nre '/<TS[^>]+ language/ { s/^.*<TS[^>]+ language[[:space:]]*=[[:space:]]*['\''"]([^'\''"]+)['\''"].*$/\1/; p; }' "$ts_file")" \
        || error "getting language failure"
    [[ -n "$language" ]] || error "unable to get language from ts file"

    [[ "$ts_file" = *_"$language".ts ]] || error "language($language) and file name mismatch"

    # check if .qm file is created
    ts_filename="${ts_file##*/}"
    qm_file="$build_dir/${ts_filename%ts}qm"
    [[ -f "$qm_file" ]] || error "qm file($qm_file) is not built"
done

exit $ret
