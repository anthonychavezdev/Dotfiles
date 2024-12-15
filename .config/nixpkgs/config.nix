{
  packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball {
      url = "https://github.com/nix-community/NUR/archive/b74bc77b078afa6a48dad913d4e2b50fcadbab24.tar.gz";
      sha256 = "0ffgvmraz4dpf7ryzgyq4f4gakiw04bzhrqyghimv0fxj6c9cf3z";
    }) {
      inherit pkgs;
    };
  };
}

