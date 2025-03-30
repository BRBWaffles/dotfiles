# My NixOS Dotfiles

This is my current multi-system NixOS configuration.

## File Structure

### `lib/`

This defines two helper functions that make it easier to create configurations in the `flake`:

1. `mkHome`: Creates a Home Manager configuration (for managing user-specific settings and packages)
2. `mkLinuxSystem`: Creates a NixOS system configuration (for managing system-wide settings)

Both functions take some modules (configuration files) as input and set up the necessary environment with some default settings, like allowing unfree packages and passing through important variables (inputs, config, etc.).

### `modules/config/`

This defines a configuration schema or template for managing various aspects of the system:

1. `people`: Creates records for user accounts, their SSH keys, emails, etc.
2. `services`: Creates records for various services with their domains, hostnames, SSL certificates, etc.
3. `machines`: Creates records for different devices with their mount points, IP addresses, and storage configurations
4. `aesthetics`: Creates records for visual appearance settings like fonts, colours, and cursor properties

It's essentially creating a structured way to organize abstracted configuration data that is declared in multiple places throughout the system configuration.

### `modules/home/`

This defines home environment configurations for different users across different machines in a multi-user, multi-device setup. It's using NixOS's home-manager functionality to manage user-specific configurations. Essentially, this is a configuration file that determines which software and configurations each user gets on each machine, allowing for personalized but reproducible user environments across the system.

### `modules/nixos/`

This defines a set of NixOS modules that are used to configure different systems. Each system has its own set of module imports that define what features or services are enabled on that system, as well as some shared modules. The file uses a helper function `directoryImport` (imported from ../helpers.nix) to import all the module definitions from the current directory. This allows for modular system configuration where different machines can easily inherit different sets of features and services. These modules are used in the `flake`.

### `parts/`

This defines the development environment configuration for the project, which includes:

1. `devshells`: Creates a default development shell with several development tools.
2. `pre-commit`: Creates pre-commit hooks that run before git commits.

This setup ensures that anyone working on this project has access to the same development tools and follows the same code formatting and commit message standards.

### `profiles/`

This defines NIxOS user configurations and their respective homes. Each profile is designed to be imported into each system configuration via the `flake`, with different settings and tools based on the user's needs and preferences. It also uses `systemd.tmpfiles` to declare custom home folder structures.

### `secrets/`

This contains encrypted secrets and credentials using `sops-nix`. This is a security-sensitive file that should be handled carefully as it contains encrypted credentials for multiple services and systems.

### `systems/`

This defines the system configurations for different machines. Each machine has similar configuration structure but with specific customizations. The system naming schema follows a celestial convention, with desktops being named after planets, laptops after moons, and servers after dwarf planets. The `fileSystems` configurations include helper functions for easily configuring mounts for internal storage, Synology, and samba drives.

### `templates/`

This defines flake-based development environment templates for projects written in different programming languages, such as Elm and Haskell. This setup also makes use of `devshells` and is designed for developers who want to quickly bootstrap projects with a complete development environment using Nix for reproducibility and dependency management.

### `flake.nix`

This defines the core of the NixOS configuration using helper functions from `lib/`, which is organized as a flake-parts-based structure for better modularity:

1. `inputs`: Declares all external dependencies including, such as core Nix components (`nixpkgs`, `flake-parts`, `systems`) and user environment components (`home-manager`, `sops-nix`).
2. `outputs`: Uses flake-parts to organize system configurations for multiple machines (`mars`, `venus`, `deimos`, `charon`, and `ceres`) and shared modules (`core`, `mantle`, `crust`) imported across systems.

Each system imports specialized modules and user profiles based on its intended purpose and users, creating a flexible but consistent configuration framework across multiple machines.
