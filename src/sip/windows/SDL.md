# SDL

---

http://www.libsdl.org/release/SDL2-2.0.12.zip

---

run MSYS

cd SDL2-2.0.12

./configure --enable-shared --prefix=$(pwd)-release

make && make install

---

#error You should run hg revert SDL_config.h
