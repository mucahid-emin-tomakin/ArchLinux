#!/bin/bash
#
#
# ██████╗  █████╗ ███╗   ██╗ ██████╗ ███████╗██████╗ 
# ██╔══██╗██╔══██╗████╗  ██║██╔════╝ ██╔════╝██╔══██╗
# ██████╔╝███████║██╔██╗ ██║██║  ███╗█████╗  ██████╔╝
# ██╔══██╗██╔══██║██║╚██╗██║██║   ██║██╔══╝  ██╔══██╗
# ██║  ██║██║  ██║██║ ╚████║╚██████╔╝███████╗██║  ██║
# ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝
#
    set -o noclobber -o noglob -o pipefail
    export PATH="/usr/local/bin:/usr/bin:/bin"
    IFS=$'\n'
    FILE_PATH="${1}"            # Full path of the highlighted file
    PV_WIDTH="${2}"             # Width of the preview pane (number of fitting characters)
    PV_HEIGHT="${3}"            # Height of the preview pane (number of fitting characters)
    IMAGE_CACHE_PATH="${4}"     # Full path that should be used to cache image preview
    PV_IMAGE_ENABLED="${5}"     # 'True' if image previews are enabled, 'False' otherwise.
    FILE_EXTENSION="${FILE_PATH##*.}"
    FILE_EXTENSION_LOWER=$(echo "${FILE_EXTENSION}" | tr '[:upper:]' '[:lower:]')
    HIGHLIGHT_SIZE_MAX=1048576  # 1 MiB
    # ------------------------------------------------------------
    # Img (Kitty-Protocoll)
    # ------------------------------------------------------------
    handle_image() {
        local mimetype="${1}"
        case "${mimetype}" in
            image/*)
                exit 7;;
            video/*)
                if command -v ffmpegthumbnailer >/dev/null 2>&1; then
                    ffmpegthumbnailer -i "${FILE_PATH}" -o "${IMAGE_CACHE_PATH}" -s 0 && exit 6
                fi
                exit 1;;
            application/pdf)
                 pdftoppm -f 1 -l 1 \
                          -scale-to-x 1920 \
                          -scale-to-y -1 \
                          -singlefile \
                          -jpeg -tiffcompression jpeg \
                          -- "${FILE_PATH}" "${IMAGE_CACHE_PATH%.*}" \
                 && exit 6 || exit 1;;
        *)
            return
            ;;
    esac
    }
    # ------------------------------------------------------------
    # Archiv (bsdtar)
    # ------------------------------------------------------------
    handle_extension() {
        case "${FILE_EXTENSION_LOWER}" in
            a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|\
            rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)
                bsdtar --list --file "${FILE_PATH}" && exit 5
                exit 1;;
            htm|html|xhtml)
                if command -v bat >/dev/null 2>&1; then
                    bat --paging=never --style=numbers --color=always -- "${FILE_PATH}" && exit 5
                else
                    cat -- "${FILE_PATH}" && exit 5
                fi
                exit 2;;
        esac
    }
    # ------------------------------------------------------------
    # File (bat) & Metadata for Video
    # ------------------------------------------------------------
    handle_mime() {
        local mimetype="${1}"
        case "${mimetype}" in
            text/* | */xml)
                if [[ "$( stat --printf='%s' -- "${FILE_PATH}" )" -gt "${HIGHLIGHT_SIZE_MAX}" ]]; then
                    exit 2
                fi
                if command -v bat >/dev/null 2>&1; then
                    bat --paging=never --color=always --style=numbers -- "${FILE_PATH}" && exit 5
                else
                    cat -- "${FILE_PATH}" && exit 5
                fi
                exit 2;;
            image/*)
                ffprobe -v error -show_format -show_streams "${FILE_PATH}" 2>/dev/null && exit 5
                exit 1;;
            video/* | audio/*)
                ffprobe -v error -show_format -show_streams "${FILE_PATH}" 2>/dev/null && exit 5
                exit 1;;
        esac
    }
    # ------------------------------------------------------------
    # Fallback
    # ------------------------------------------------------------
    handle_fallback() {
        echo '----- File Type Classification -----' && file --dereference --brief -- "${FILE_PATH}" && exit 5
        exit 1
    }
    # ------------------------------------------------------------
    # Main
    # ------------------------------------------------------------
    MIMETYPE="$(file --dereference --brief --mime-type -- "${FILE_PATH}")"
    if [[ "${PV_IMAGE_ENABLED}" == 'True' ]]; then
        handle_image "${MIMETYPE}"
    fi
    handle_extension
    handle_mime "${MIMETYPE}"
    handle_fallback
    exit 1
#
#
#