{
  description = ''word size strings'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-shorteststring-master.flake = false;
  inputs.src-shorteststring-master.owner = "metagn";
  inputs.src-shorteststring-master.ref   = "master";
  inputs.src-shorteststring-master.repo  = "shorteststring";
  inputs.src-shorteststring-master.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-shorteststring-master"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-shorteststring-master";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}