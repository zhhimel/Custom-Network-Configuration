# Makefile to automate bridge network and namespace setup

SCRIPTS_DIR = scripts

all: create_network setup_namespace apply_policy test_connectivity

create_network:
	bash $(SCRIPTS_DIR)/create_bridge.sh

setup_namespace:
	bash $(SCRIPTS_DIR)/setup_namespace.sh

apply_policy:
	bash $(SCRIPTS_DIR)/apply_network_policy.sh

test_connectivity:
	bash $(SCRIPTS_DIR)/test_connectivity.sh

clean:
	sudo ip netns del custom_ns 2>/dev/null || true
	sudo ip link del br_custom 2>/dev/null || true
	sudo ip link del veth0 2>/dev/null || true
