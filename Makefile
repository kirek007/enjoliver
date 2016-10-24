CHECK=check
CHECK_FAST=check_fast
CHECK_EUID=check_euid

default: submodules assets


assets:
	make -C bootcfg/assets/coreos
	make -C bootcfg/assets/coreos serve
	make -C bootcfg/assets/setup-network-environment
	make -C bootcfg/assets/setup-network-environment serve

clean:
	make -C bootcfg/assets/coreos fclean
	make -C bootcfg/assets/setup-network-environment fclean

$(CHECK):
	make -C app/tests/ $(CHECK)

$(CHECK_FAST):
	make -C app/tests/ $(CHECK_FAST)

$(CHECK_EUID):
	make -C app/tests/ $(CHECK_EUID)

submodules:
	git submodule init
	git submodule update