# Fire Emblem: The Binding Blade

This is a decompilation of Fire Emblem: Fūin no Tsurugi (a.k.a. Fire Emblem: The Binding Blade).

It builds the following ROM:

* **[fe6.gba]** `sha1: a57095da867de4d585c33d4394712986245fe6ca`

GBAFE decompilation progress history can be found on [laqieer's FE decomp portal][fe-decomp-portal].

[fe6.gba]: https://datomatic.no-intro.org/index.php?page=show_record&s=23&n=0367
[fe-decomp-portal]: https://laqieer.github.io/fe-decomp-portal/

## Quick setup

- get a copy of the original rom (still required for every build for now), put it in this folder and name it `fe6-base.gba`.

```bash
# install dependencies
sudo apt update
sudo apt install -y build-essential gcc-arm-none-eabi binutils-arm-none-eabi libpng-dev
python -m pip install requests argparse numpy pillow
./tools/install_agbcc.sh
./build_tools.sh

# make
make compare
```

In the future, a native GCC or GCC-like C compiler (such as clang) will be required to build tools, there is just no tool to build yet.

## Building with Docker

If you're on Windows, MacOS, or a Linux distribution without the necessary packages, you can build the project using [Docker](https://www.docker.com/get-started/), which will create a small Virtual Machine (VM) with all the tools you need.

- Download [Docker Desktop](https://docs.docker.com/get-started/get-docker/) and open it.
- Download our Dockerfile. Open a terminal and navigate to the Dockerfile's location.
- `docker build --tag fe6_image .` to build our Docker image.
- `docker run -it --name fe6_container fe6_image` to create a VM and boot into its shell.

The VM will have all dependencies preinstalled, and a `setup.sh` script which you can run to automatically clone the repo and build agbcc+tools. All you have to do is copy your ROM to the repo's root and run `make compare` to build the project. To copy files between the VM and host, use the [`docker cp` command](https://docs.docker.com/reference/cli/docker/container/cp/#examples)

On subsequent runs, you can start the VM again with `docker start -ai fe6_container`. Many IDEs and text editors, such as Visual Studio Code and CLion, have Docker integration and can connect to your VM for easy development.

## Contributing

Please do. I'm going to be pretty strict on what I accept though, so mind your formatting and naming conventions.

You can also consider porting stuff between fe6 and fe8.

## See also

* [**StanHash/fe1**](https://github.com/StanHash/fe1), a disassembly of Fire Emblem: Ankoku Ryu to Hikari no Tsurugi (dormant)
* [**ZaneAvernathy/FireEmblem5**](https://github.com/ZaneAvernathy/FireEmblem5), a disassembly of Fire Emblem: Thracia 776
* [**MokhaLeee/FireEmblem7J**](https://github.com/MokhaLeee/FireEmblem7J), a decompilation of Fire Emblem: Rekka no Ken (JP)
* [**FireEmblemUniverse/fireemblem8u**](https://github.com/FireEmblemUniverse/fireemblem8u), a decompilation of Fire Emblem: The Sacred Stones (US)

## Contact

You can find me over at the [Fire Emblem Universe Discord](https://feuniverse.us/t/feu-discord-server/1480?u=stanh) under the handle `nat_776`.
