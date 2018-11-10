### JPAN's Save Block Recycle: New Game Minus

Fixes an oddity with JPAN's Save Block Recycle where the saved memory doesn't get zeroed upon starting a new game. Instead, it'll retain whatever it happened to be in the previous save file.

To be clear, this does not actually include JPAN's Save Block Recycle itself.

#### How do I insert this?

First, open `jpan-recycle-new-game.asm` in a text editor to customize it. Tweak the definition of `rom` to fit your ROM's filename, and `free_space` should be where you want the code inserted. You'll need `48` bytes starting from a half-word aligned offset (read: an even offset). 

Edit `jpan_block` if the RAM block saved by your copy of JPAN's Save Block Recycle doesn't start from `0x0203C000`.

You'll need to have [armips](https://github.com/Kingcom/armips).

Once you're ready, assemble with `armips jpan-recycle-new-game.asm`. It'll insert the code directly into your ROM.