{
  config,
  inputs,
  pkgs,
  ...
}: {
  home.file.".config/rofi/config.rasi".text = ''
    configuration {
    /*	modes: "window,drun,run,ssh";*/
    /*	font: "mono 12";*/
    /*	location: 0;*/
    /*	yoffset: 0;*/
    /*	xoffset: 0;*/
    /*	fixed-num-lines: true;*/
    /*	show-icons: false;*/
    /*	terminal: "rofi-sensible-terminal";*/
    /*	ssh-client: "ssh";*/
    /*	ssh-command: "{terminal} -e {ssh-client} {host} [-p {port}]";*/
    /*	run-command: "{cmd}";*/
    /*	run-list-command: "";*/
    /*	run-shell-command: "{terminal} -e {cmd}";*/
    /*	window-command: "wmctrl -i -R {window}";*/
    /*	window-match-fields: "all";*/
    /*	icon-theme: ;*/
    /*	drun-match-fields: "name,generic,exec,categories,keywords";*/
    /*	drun-categories: ;*/
    /*	drun-show-actions: false;*/
    /*	drun-display-format: "{name} [<span weight='light' size='small'><i>({generic})</i></span>]";*/
    /*	drun-url-launcher: "xdg-open";*/
    /*	disable-history: false;*/
    /*	ignored-prefixes: "";*/
    /*	sort: false;*/
    /*	sorting-method: "normal";*/
    /*	case-sensitive: false;*/
    /*	cycle: true;*/
    /*	sidebar-mode: false;*/
    /*	hover-select: false;*/
    /*	eh: 1;*/
    /*	auto-select: false;*/
    /*	parse-hosts: false;*/
    /*	parse-known-hosts: true;*/
    /*	combi-modes: "window,run";*/
    /*	matching: "normal";*/
    /*	tokenize: true;*/
    /*	m: "-5";*/
    /*	filter: ;*/
    /*	dpi: -1;*/
    /*	threads: 0;*/
    /*	scroll-method: 0;*/
    /*	window-format: "{w}    {c}   {t}";*/
    /*	click-to-exit: true;*/
    /*	global-kb: false;*/
    /*	max-history-size: 25;*/
    /*	combi-hide-mode-prefix: false;*/
    /*	combi-display-format: "{mode} {text}";*/
    /*	matching-negate-char: '-' /* unsupported */;*/
    /*	cache-dir: ;*/
    /*	window-thumbnail: false;*/
    /*	drun-use-desktop-cache: false;*/
    /*	drun-reload-desktop-cache: false;*/
    /*	normalize-match: false;*/
    /*	steal-focus: false;*/
    /*	application-fallback-icon: ;*/
    /*	refilter-timeout-limit: 300;*/
    /*	xserver-i300-workaround: false;*/
    /*	completer-mode: "recursivebrowser";*/
    /*	pid: "/run/user/1000/rofi.pid";*/
    /*	display-window: ;*/
    /*	display-run: ;*/
    /*	display-ssh: ;*/
    /*	display-drun: ;*/
    /*	display-combi: ;*/
    /*	display-keys: ;*/
    /*	display-filebrowser: ;*/
    /*	display-recursivebrowser: ;*/
    /*	kb-primary-paste: "Control+V,Shift+Insert";*/
    /*	kb-secondary-paste: "Control+v,Insert";*/
    /*	kb-secondary-copy: "Control+c";*/
    /*	kb-clear-line: "Control+w";*/
    /*	kb-move-front: "Control+a";*/
    /*	kb-move-end: "Control+e";*/
    /*	kb-move-word-back: "Alt+b,Control+Left";*/
    /*	kb-move-word-forward: "Alt+f,Control+Right";*/
    /*	kb-move-char-back: "Left,Control+b";*/
    /*	kb-move-char-forward: "Right,Control+f";*/
    /*	kb-remove-word-back: "Control+Alt+h,Control+BackSpace";*/
    /*	kb-remove-word-forward: "Control+Alt+d";*/
    /*	kb-remove-char-forward: "Delete,Control+d";*/
    /*	kb-remove-char-back: "BackSpace,Shift+BackSpace,Control+h";*/
    /*	kb-remove-to-eol: "Control+k";*/
    /*	kb-remove-to-sol: "Control+u";*/
    /*	kb-accept-entry: "Control+j,Control+m,Return,KP_Enter";*/
    /*	kb-accept-custom: "Control+Return";*/
    /*	kb-accept-custom-alt: "Control+Shift+Return";*/
    /*	kb-accept-alt: "Shift+Return";*/
    /*	kb-delete-entry: "Shift+Delete";*/
    /*	kb-mode-next: "Shift+Right,Control+Tab";*/
    /*	kb-mode-previous: "Shift+Left,Control+ISO_Left_Tab";*/
    /*	kb-mode-complete: "Control+l";*/
    /*	kb-row-left: "Control+Page_Up";*/
    /*	kb-row-right: "Control+Page_Down";*/
    /*	kb-row-up: "Up,Control+p";*/
    /*	kb-row-down: "Down,Control+n";*/
    /*	kb-row-tab: "";*/
    /*	kb-element-next: "Tab";*/
    /*	kb-element-prev: "ISO_Left_Tab";*/
    /*	kb-page-prev: "Page_Up";*/
    /*	kb-page-next: "Page_Down";*/
    /*	kb-row-first: "Home,KP_Home";*/
    /*	kb-row-last: "End,KP_End";*/
    /*	kb-row-select: "Control+space";*/
    /*	kb-screenshot: "Alt+S";*/
    /*	kb-ellipsize: "Alt+period";*/
    /*	kb-toggle-case-sensitivity: "grave,dead_grave";*/
    /*	kb-toggle-sort: "Alt+grave";*/
    /*	kb-cancel: "Escape,Control+g,Control+bracketleft";*/
    /*	kb-custom-1: "Alt+1";*/
    /*	kb-custom-2: "Alt+2";*/
    /*	kb-custom-3: "Alt+3";*/
    /*	kb-custom-4: "Alt+4";*/
    /*	kb-custom-5: "Alt+5";*/
    /*	kb-custom-6: "Alt+6";*/
    /*	kb-custom-7: "Alt+7";*/
    /*	kb-custom-8: "Alt+8";*/
    /*	kb-custom-9: "Alt+9";*/
    /*	kb-custom-10: "Alt+0";*/
    /*	kb-custom-11: "Alt+exclam";*/
    /*	kb-custom-12: "Alt+at";*/
    /*	kb-custom-13: "Alt+numbersign";*/
    /*	kb-custom-14: "Alt+dollar";*/
    /*	kb-custom-15: "Alt+percent";*/
    /*	kb-custom-16: "Alt+dead_circumflex";*/
    /*	kb-custom-17: "Alt+ampersand";*/
    /*	kb-custom-18: "Alt+asterisk";*/
    /*	kb-custom-19: "Alt+parenleft";*/
    /*	kb-select-1: "Super+1";*/
    /*	kb-select-2: "Super+2";*/
    /*	kb-select-3: "Super+3";*/
    /*	kb-select-4: "Super+4";*/
    /*	kb-select-5: "Super+5";*/
    /*	kb-select-6: "Super+6";*/
    /*	kb-select-7: "Super+7";*/
    /*	kb-select-8: "Super+8";*/
    /*	kb-select-9: "Super+9";*/
    /*	kb-select-10: "Super+0";*/
    /*	kb-entry-history-up: "Control+Up";*/
    /*	kb-entry-history-down: "Control+Down";*/
    /*	ml-row-left: "ScrollLeft";*/
    /*	ml-row-right: "ScrollRight";*/
    /*	ml-row-up: "ScrollUp";*/
    /*	ml-row-down: "ScrollDown";*/
    /*	me-select-entry: "MousePrimary";*/
    /*	me-accept-entry: "MouseDPrimary";*/
    /*	me-accept-custom: "Control+MouseDPrimary";*/
        modi: "run,drun,window";
        icon-theme: "Oranchelo";
        show-icons: true;
        terminal: "wezterm";
        drun-display-format: "{icon} {name}";
        location: 0;
        disable-history: false;
        hide-scrollbar: true;
        display-drun: "   Apps ";
        display-run: "   Run ";
        display-window: " 﩯  Window";
        display-Network: " 󰤨  Network";
        sidebar-mode: true;

      timeout {
          action: "kb-cancel";
          delay:  0;
      }
      filebrowser {
          directories-first: true;
          sorting-method:    "name";
      }
    }

    @theme "catppuccin-frappe"
  '';

  home.file.".config/rofi/themes/catppuccin-frappe.rasi".text = ''
    * {
        bg-col:  #303446;
        bg-col-light: #303446;
        border-col: #303446;
        selected-col: #303446;
        blue: #8caaee;
        fg-col: #c6d0f5;
        fg-col2: #e78284;
        grey: #737994;

        width: 600;
        font: "JetBrainsMono Nerd Font 14";
    }

    element-text, element-icon , mode-switcher {
        background-color: inherit;
        text-color:       inherit;
    }

    window {
        height: 360px;
        border: 3px;
        border-color: @border-col;
        background-color: @bg-col;
    }

    mainbox {
        background-color: @bg-col;
    }

    inputbar {
        children: [prompt,entry];
        background-color: @bg-col;
        border-radius: 5px;
        padding: 2px;
    }

    prompt {
        background-color: @blue;
        padding: 6px;
        text-color: @bg-col;
        border-radius: 3px;
        margin: 20px 0px 0px 20px;
    }

    textbox-prompt-colon {
        expand: false;
        str: ":";
    }

    entry {
        padding: 6px;
        margin: 20px 0px 0px 10px;
        text-color: @fg-col;
        background-color: @bg-col;
    }

    listview {
        border: 0px 0px 0px;
        padding: 6px 0px 0px;
        margin: 10px 0px 0px 20px;
        columns: 2;
        lines: 5;
        background-color: @bg-col;
    }

    element {
        padding: 5px;
        background-color: @bg-col;
        text-color: @fg-col  ;
    }

    element-icon {
        size: 25px;
    }

    element selected {
        background-color:  @selected-col ;
        text-color: @fg-col2  ;
    }

    mode-switcher {
        spacing: 0;
      }

    button {
        padding: 10px;
        background-color: @bg-col-light;
        text-color: @grey;
        vertical-align: 0.5;
        horizontal-align: 0.5;
    }

    button selected {
      background-color: @bg-col;
      text-color: @blue;
    }

    message {
        background-color: @bg-col-light;
        margin: 2px;
        padding: 2px;
        border-radius: 5px;
    }

    textbox {
        padding: 6px;
        margin: 20px 0px 0px 20px;
        text-color: @blue;
        background-color: @bg-col-light;
    }
  '';
}
