## 1️ sudo apt install llvm
```bash
./tests/irTest.sh tests/final.sy tests/finalout

file finalout.ll
```

Result:

```
finalout.ll: C source, ASCII text
```

And the content starts with:

```llvm
declare void @_sysy_starttime(i32)
declare void @_sysy_stoptime(i32)
declare i32 @getint()
...
```

###  Interpretation

* The file **IS LLVM IR**, despite `file` saying “C source”

  * `file` often mis-detects `.ll`
* Your compiler **successfully emitted LLVM IR**
* The IR contains correct SysY runtime declarations 

 **IR stage is working**

---

## 2️ What `passTest.sh` expects

From your earlier snippet, `passtest.sh` logic is roughly:

```bash
./build/compiler -S -o output.ll input.sy -O1 -ir
llc output.ll -> output.s
aarch64-linux-gnu-g++ output.s + sylib -> executable
run executable
```

So:

> **`passtest.sh` does NOT run `.ll` directly**
> It runs: `.sy → .ll → .s → .out → execute`

---

## 3️ Why your `finalout.ll` is not “runnable”

* LLVM IR is **not executable**
* You must pass it through **llc + linker**

That’s exactly what `passTest.sh` automates.

---

## 4️ How to correctly run `passtest.sh`

###  Important rule

You **never call `passTest.sh` on `.ll` files**

You call it on **`.sy` files**, just like the main `test` driver does.

---

###  Correct usage (manual)

From **project root**:

```bash
./tests/passesTest.sh tests/final.sy tests/finalout
```

NOT from `tests/` directory unless the script uses relative paths safely.

---

### What should be generated

After running, you should see:

```
tests/finalout.ll   (LLVM IR)
tests/finalout.s    (ARM assembly)
tests/finalout      (AArch64 executable)
```

Check:

```bash
file tests/finalout
```

Expected:

```
ELF 64-bit LSB executable, ARM aarch64
```

---
---

### ❌ Error: undefined reference to `getint`

Then **one of these is wrong**:

1. linking library name

   ```bash
   -l:sylib.a    ❌
   -l:sylib++.a ❌ (if compiled as C)
   ```

   ✔ Correct for IR path:

   ```bash
   -l:sylib.a
   ```

2. missing include:

   ```bash
   -include lib/sylib.h
   ```

3. ABI mismatch (rare, but happens if llc target wrong)

---

### ❌ Error: `file format not recognized`

You are passing `.sy` or `.ll` **directly** to `g++`

✔ Fix:
Only `.s` goes into `aarch64-linux-gnu-g++`

---

## 6️ How to verify you “went through IR”

You already did, but here is the official checklist:

###  Step 1: `.ll` exists

```bash
ls tests/finalout.ll
```

###  Step 2: `.ll` contains LLVM syntax

```bash
define i32 @main()
```

###  Step 3: `llc` works

```bash
llc tests/finalout.ll -o tests/finalout.s
```

### Step 4: assembly links

```bash
aarch64-linux-gnu-g++ tests/finalout.s -L build/lib -l:sylib.a -o tests/finalout
```

###  Step 5: executable runs (if qemu or ARM env exists)

```bash
qemu-aarch64 ./tests/finalout
```

---

## 7️ How this fits into `./test functional`

When you run:

```bash
./test functional
```

The flow is:

1. test.cpp (the **real entry**) is compiled into `test`
2. `test`:

   * enumerates `tests/functional/*.sy`
   * checks `.in` / `.out`
   * calls **compile script** (default: `compileTest.sh`)
3. If you want IR path:

   * change compile script to `passtest.sh`
   * or pass it as argument:

     ```bash
     ./test functional passtest.sh
     ```

---

## 8️ TL;DR (key answers)

| Question                           | Answer                                |
| ---------------------------------- | ------------------------------------- |
| Why is `finalout.ll` not runnable? | LLVM IR ≠ executable                  |
| Did IR generation work?            |  Yes                                 |
| How do I run `passtest.sh`?        | `./tests/passtest.sh input.sy output` |
| Do I run it on `.ll`?              | ❌ No                                  |


# About "irTest.sh"
```bash
lyz@LYZ:/mnt/d/作业/编译原理/T202510358205721-859-main$ ./tests/irTest.sh tests/final.sy tests/finalout
lyz@LYZ:/mnt/d/作业/编译原理/T202510358205721-859-main$ cd tests
lyz@LYZ:/mnt/d/作业/编译原理/T202510358205721-859-main/tests$ file finalout.ll
finalout.ll: C source, ASCII text
lyz@LYZ:/mnt/d/作业/编译原理/T202510358205721-859-main/tests$ sed -n '1,50p' finalout.ll
declare void @_sysy_starttime(i32)

declare void @_sysy_stoptime(i32)

declare i32 @getint()

declare float @getfloat()
...
```
# About "passesTest.sh"
```bash
lyz@LYZ:/mnt/d/作业/编译原理/T202510358205721-859-main$ ./tests/passesTest.sh tests/final.sy tests/finalout
lyz@LYZ:/mnt/d/作业/编译原理/T202510358205721-859-main$ file tests/finalout
tests/finalout: ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, BuildID[sha1]=d195332cbace5f8dfb6ca075d9e4490fa4cf6e80, for GNU/Linux 3.7.0, not stripped

lyz@LYZ:/mnt/d/作业/编译原理/T202510358205721-859-main$ file tests/finalout.ll
tests/finalout.ll: C source, ASCII text
lyz@LYZ:/mnt/d/作业/编译原理/T202510358205721-859-main$ file tests/finalout.s
tests/finalout.s: assembler source, ASCII text

# Want ir path? Pass it as an argument!
lyz@LYZ:/mnt/d/作业/编译原理/T202510358205721-859-main$ ./test functional passesTest.sh
checking tests/functional/01_mm1.sy
checking tests/functional/01_mm2.sy
checking tests/functional/01_mm3.sy
tests/functional/01_mm1.sy OK 0H-0M-2S-489611us [ gcc 0H-0M-4S-59776us ]
tests/functional/01_mm2.sy OK 0H-0M-2S-251127us [ gcc 0H-0M-3S-607220us ]
tests/functional/01_mm3.sy OK 0H-0M-1S-554987us [ gcc 0H-0M-2S-737789us ]
 [ best 0H-0M-6S-295725us] / 300H-0M-0S-0us
lyz@LYZ:/mnt/d/作业/编译原理/T202510358205721-859-main$
lyz@LYZ:/mnt/d/作业/编译原理/T202510358205721-859-main$  ./tests/passesTest2.sh tests/final.sy tests/finalout2
# static method also works
```
