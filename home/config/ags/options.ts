import { type BarWidget } from "widget/bar/Bar"
import { opt, mkOptions } from "lib/option"
import { distro } from "lib/variables"
import { icon } from "lib/utils"
import icons from "lib/icons"

const options = mkOptions(OPTIONS, {
    autotheme: opt(false),

    wallpaper: opt(`/home/${USER}/.config/background`, { persistent: true }),

    theme: {
        dark: {
            primary: {
                bg: opt("#2bb776"),
                fg: opt("#141414"),
            },
            error: {
                bg: opt("#e55f86"),
                fg: opt("#141414"),
            },
            bg: opt("#171717"),
            fg: opt("#eeeeee"),
            widget: opt("#eeeeee"),
            border: opt("#eeeeee"),
        },
        light: {
            primary: {
                bg: opt("#426ede"),
                fg: opt("#eeeeee"),
            },
            error: {
                bg: opt("#b13558"),
                fg: opt("#eeeeee"),
            },
            bg: opt("#fffffa"),
            fg: opt("#080808"),
            widget: opt("#080808"),
            border: opt("#080808"),
        },

        blur: opt(0),
        scheme: opt<"dark" | "light">("dark"),
        widget: { opacity: opt(94) },
        border: {
            width: opt(2),
            opacity: opt(100),
        },

        shadows: opt(true),
        padding: opt(6),
        spacing: opt(3),
        radius: opt(5),
    },

    transition: opt(200),

    font: {
        size: opt(9),
        name: opt("JetBrains Mono Nerd Font"),
    },

    bar: {
        flatButtons: opt(false),
        position: opt<"top" | "bottom">("top"),
        corners: opt(true),
        layout: {
            start: opt<BarWidget[]>([
                //"launcher",
                "workspaces",
                //"taskbar",
                "expander",
                "messages",
            ]),
            center: opt<BarWidget[]>([
                "date",
            ]),
            end: opt<BarWidget[]>([
                "media",
                "expander",
                "systray",
                "colorpicker",
                "screenrecord",
                "system",
                "battery",
                "powermenu",
            ]),
        },
        launcher: {
            icon: {
                colored: opt(true),
                icon: opt(icon(distro, icons.ui.search)),
            },
            label: {
                colored: opt(false),
                label: opt(""),
            },
            action: opt(() => App.toggleWindow("applauncher")),
        },
        date: {
            format: opt("%H:%M - %a, %b %d."),
            action: opt(() => App.toggleWindow("datemenu")),
        },
        battery: {
            bar: opt<"hidden" | "regular" | "whole">("whole"),
            charging: opt("#00D787"),
            percentage: opt(true),
            blocks: opt(10),
            width: opt(50),
            low: opt(30),
        },
        workspaces: {
            workspaces: opt(10),
        },
        taskbar: {
            iconSize: opt(0),
            monochrome: opt(true),
            exclusive: opt(false),
        },
        messages: {
            action: opt(() => App.toggleWindow("datemenu")),
        },
        systray: {
            ignore: opt([
                "KDE Connect Indicator",
                "spotify-client",
            ]),
        },
        media: {
            monochrome: opt(true),
            preferred: opt("spotify"),
            direction: opt<"left" | "right">("right"),
            length: opt(40),
        },
        powermenu: {
            monochrome: opt(false),
            action: opt(() => App.toggleWindow("powermenu")),
        },
    },

    applauncher: {
        iconSize: opt(50),
        width: opt(0),
        margin: opt(80),
        maxItem: opt(6),
        favorites: opt([
            [
                "jetbrains-toolbox",
                "io.dbeaver.DBeaverCommunity",
                "postman",
                "obs",
                "webcord",
            ],
        ]),
    },

    overview: {
        scale: opt(9),
        workspaces: opt(8),
        monochromeIcon: opt(true),
    },

    powermenu: {
        sleep: opt("systemctl suspend"),
        reboot: opt("systemctl reboot"),
        logout: opt("pkill Hyprland"),
        shutdown: opt("shutdown now"),
        layout: opt<"line" | "box">("line"),
        labels: opt(true),
    },

    quicksettings: {
        avatar: {
            image: opt(`/var/lib/AccountsService/icons/${Utils.USER}`),
            size: opt(70),
        },
        width: opt(380),
        position: opt<"left" | "center" | "right">("right"),
        networkSettings: opt("gtk-launch gnome-control-center"),
        media: {
            monochromeIcon: opt(true),
            coverSize: opt(100),
        },
    },

    datemenu: {
        position: opt<"left" | "center" | "right">("center"),
    },

    osd: {
        progress: {
            vertical: opt(true),
            pack: {
                h: opt<"start" | "center" | "end">("end"),
                v: opt<"start" | "center" | "end">("center"),
            },
        },
        microphone: {
            pack: {
                h: opt<"start" | "center" | "end">("center"),
                v: opt<"start" | "center" | "end">("end"),
            },
        },
    },

    notifications: {
        position: opt<Array<"top" | "bottom" | "left" | "right">>(["top", "right"]),
        blacklist: opt(["Spotify"]),
        width: opt(440),
    },

    hyprland: {
        gaps: opt(2.4),
        inactiveBorder: opt("333333ff"),
    },
})

globalThis["options"] = options
export default options
