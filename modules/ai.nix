{ pkgs, ... }:

{

  services.ollama = {
    enable = true; 
    package = pkgs.ollama-rocm;

    # Optional: preload models, see https://ollama.com/library
    loadModels = [ "llama3.1:8b" ];

  };

  services.open-webui = {
    enable = true;
    openFirewall = true;
    port = 8080;
  };
}
