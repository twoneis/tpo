{
  outputs = { self }: {
    overlays.default = final: prev: {
      gojasm = prev.callPackage ./packages/gojasm.nix { };
    };
  };
}
