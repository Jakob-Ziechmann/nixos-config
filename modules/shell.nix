{ pkgs, ... }: {
	system.activationScripts.binbash = {
		deps = [ "binsh" ];
		text = ''
			ln -sf /bin/sh /bin/bash
		'';
	};
}
