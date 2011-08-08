
function themeFilename(name) {
//    return "/etc/hildon/theme/images/" + name + ".png";
    return "./images/" + name + ".png";
}

function iconFilename(name) {
//    return "/usr/share/icons/hicolor/48x48/hildon/" + name + ".png";
    return "./icons/" + name + ".png";
}

function themedButton(basename, sensitive, pressed) {
    if (sensitive) {
        if (pressed) {
            return themeFilename(basename + "Pressed");
        } else {
            return themeFilename(basename + "Normal");
        }
    } else {
        return themeFilename(basename + "Disabled");
    }
}

