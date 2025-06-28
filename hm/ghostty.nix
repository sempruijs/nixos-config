{ ... }:
{
  xdg.configFile."ghostty/config".text = ''
    macos-option-as-alt = true
    # font-family = JetBrains Mono
    font-size = 45

    # COLORS
    background = #ffffff
    foreground = #000000
    selection-background = #000000
    selection-foreground = #ffffff

    # black
    palette = 0=#000000
    palette = 8=#1a1a1a

    # red
    palette = 1=#800000
    palette = 9=#800000

    # green
    palette = 2=#006400
    palette = 10=#006400

    # yellow
    palette = 3=#996600
    palette = 11=#996600

    # blue
    palette = 4=#000080
    palette = 12=#000080

    # purple
    palette = 5=#4b0082
    palette = 13=#4b0082

    # aqua
    palette = 6=#006666
    palette = 14=#006666

    # white
    palette = 7=#ffffff
    palette = 15=#ffffff

    # extra
    palette = 16=#cc6600
    palette = 17=#800040

    # CURSOR
    cursor-color = #000000
    cursor-text = #ffffff
  '';
}
