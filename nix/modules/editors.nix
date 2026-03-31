{
  xdg.configFile."zed/settings.json".text = builtins.toJSON {
    telemetry = {
      metrics = false;
      diagnostics = false;
    };
    auto_update = false;
    show_edit_predictions = true;
    languages = {
      Terraform.show_edit_predictions = true;
      "Shell Script".show_edit_predictions = true;
      HTML.show_edit_predictions = true;
      Go.show_edit_predictions = true;
      Markdown.show_edit_predictions = true;
      Python = {
        format_on_save = "on";
        formatter = [
          { code_action = "source.organizeImports.ruff"; }
          { code_action = "source.fixAll.ruff"; }
          { language_server.name = "ruff"; }
        ];
      };
    };
    theme = "Ayu Mirage";
    terminal.font_family = "JetBrains Mono";
    ui_font_family = "JetBrains Mono";
    buffer_font_family = "JetBrains Mono";
    ui_font_size = 16;
    buffer_font_size = 13.0;
    ensure_final_newline_on_save = true;
    collaboration_panel.button = false;
    agent = {
      default_model = {
        provider = "openrouter";
        model = "anthropic/claude-haiku-4.5";
      };
      default_profile = "ask";
    };
    language_models = { };
    lsp = {
      protobuf-language-server = {
        binary = {
          path = "buf";
          arguments = [ "beta" "lsp" ];
        };
      };
    };
  };
}
