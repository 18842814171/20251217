# 0️⃣ One-sentence mental model (keep this)

> **All `*.sh` files do only three things:**
> 1️⃣ run **your compiler**
> 2️⃣ maybe run **LLVM (`llc`)**
> 3️⃣ run **GCC to link & execute**

There is **no magic compiler inside the scripts**.

---

# 1️⃣ What is the *only real compiler* here?

👉 **`./build/compiler` is the ONLY compiler you wrote**

Every script eventually calls **this binary**.

Everything else:

* `llc`
* `aarch64-linux-gnu-gcc / g++`
* `test`

are **tools around it**, not replacements.

---

# 2️⃣ What does `-O1` REALLY mean here?

⚠️ **Important truth:**

> `-O1` is NOT a GCC optimization level
> `-O1` is a **flag your own compiler interprets**

So when you see:

```bash
./build/compiler -S -o out.ll test.sy -O1 -ir
```

It means:

> “Enable my compiler’s internal optimization passes”

It does **NOT** automatically call LLVM passes.

---

# 3️⃣ Two completely different backend paths

There are **two parallel codegen routes** in this project.

## 🔴 Path A: Direct ARM Codegen (hard mode)
**not intended for this project**
```
.sy
 ↓ your compiler
ARM .s
 ↓ gcc
.out
```
Used by:

* `codegenTest.sh`
* `codegenO1Test.sh`

### In this path:

* Your compiler **directly emits ARM instructions**
* `-O1` means **your own backend optimizations**
* LLVM is NOT involved

⚠️ This is **much harder** and usually incomplete.
For non-trivial SysY programs, especially with:

arrays

loops

function calls

runtime I/O

the direct ARM backend is usually incomplete or buggy in student projects.

But your example:

no I/O

no arrays

no function calls

no stack frame

➡️ the easiest possible case

So it’s expected to work.
---

## 🟢 Path B: LLVM IR → ARM (recommended)

```
.sy
 ↓ your compiler
LLVM IR (.ll)
 ↓ llc
ARM .s
 ↓ gcc
.out
```

Used by:

* `irTest.sh`
* `passesTest.sh`
* competition default

Here:

* Your compiler emits **LLVM IR**
* `-O1` = enable IR-level optimizations
* LLVM handles register allocation & instruction selection

✅ This is why your project works now.

---

# 4️⃣ What EXACTLY each script does

Let’s decode them one by one.

---

## 🔹 `compileTest.sh` (baseline correctness)

```bash
aarch64-linux-gnu-g++ -x c++ source.sy ...
```

📌 Purpose:

* Treat `.sy` as **C++**
* Compile reference output
* Used ONLY to check `.out` correctness

❗ This does NOT test your compiler.

---

## 🔹 `codegenTest.sh`

```bash
./build/compiler -S -o out.s test.sy
aarch64-linux-gnu-gcc out.s ...
```

📌 Purpose:

* Test **direct ARM codegen**
* No optimization
* No LLVM

---

## 🔹 `codegenO1Test.sh`

```bash
./build/compiler -S -o out.s test.sy -O1
aarch64-linux-gnu-g++
```

📌 Purpose:

* Test **your backend optimization**
* Still direct ARM codegen
* No LLVM

⚠️ This script often **hangs or fails** in student projects.

---

## 🔹 `irTest.sh`

```bash
./build/compiler -S -o out.ll test.sy -ir
```

📌 Purpose:

* Only check **IR correctness**
* No execution
* No optimization

---

## 🔹 `passesTest.sh` ⭐⭐⭐ (MOST IMPORTANT)

```bash
./build/compiler -S -o out.ll test.sy -O1 -ir
llc out.ll → out.s
gcc out.s → out
run & compare output
```

📌 Purpose:

* Test **IR optimization correctness**
* Performance evaluation
* Official grading path

✅ This is the script you should care about.

---

# 5️⃣ Why there are TWO versions of your script

You posted:

### Version 1 (no optimization)

```bash
./build/compiler -S -o out.ll test.sy -ir
```

### Version 2 (optimized)

```bash
./build/compiler -S -o out.ll test.sy -O1 -ir
```

👉 Difference:

| Flag  | Effect                |
| ----- | --------------------- |
| `-ir` | emit LLVM IR          |
| `-O1` | enable your IR passes |

LLVM `llc` is always the same.

---

# 6️⃣ Why `gcc` vs `g++` vs `-static` differ

### `-static`

* Fully static binary
* Required on some judges
* Larger binary
* No libc dependency

### `gcc` vs `g++`

| Tool | Used when                   |
| ---- | --------------------------- |
| gcc  | C ABI only                  |
| g++  | C++ runtime (iostream etc.) |

SysY runtime is **C-compatible**, so either works IF linked correctly.

---

# 7️⃣ Why you felt “blackbox confusion”

Because:

* Scripts are **glue code**
* Optimization is **inside your compiler**
* LLVM is **silent unless error**
* `-O1` is **project-defined**, not standard

This is *very common* in compiler courses.

---

# 8️⃣ How to *know* which path you used

### Check file extension:

| Output        | Meaning        |
| ------------- | -------------- |
| `.s` directly | direct backend |
| `.ll` present | IR path        |
| `llc` invoked | LLVM backend   |

### Check command:

```bash
ps aux | grep llc
```

If you see `llc`, you’re on IR path.

---

# 9️⃣ Final authoritative answer to your confusion

> **What kind of blackbox program are the .sh files using?**

👉 None.
They only orchestrate:

* your compiler
* LLVM
* GCC

> **What kind of O1 is executed?**

👉 **Your own O1**, implemented in your compiler, **not GCC’s**

> **Relationship between codegen and IR codegen?**

| Direct codegen    | IR codegen          |
| ----------------- | ------------------- |
| hard              | easy                |
| backend you write | backend LLVM writes |
| unstable          | stable              |
| optional          | required            |

---

# **Any change to optimization logic requires rebuilding `./build/compiler`.**

The `.sh` scripts **do not contain optimizations**.
They only *invoke* your compiler.

---
### What `./build/compiler` contains

It is:

* your **front-end**
* your **IR builder**
* your **optimization passes**
* your **backend selection logic**

When you pass:

```bash
-O1
```

you are telling **your own compiler binary**:

> “Enable the optimization code that was compiled into me.”

So if you modify:

* dead code elimination
* constant folding
* loop optimization
* CFG simplification
* instruction combining

👉 Those changes live in **source code**, not scripts.

---

## 🧠 Think of it like this

### `.sh` files

* 🚚 drivers / pipelines
* no intelligence
* no optimization

### `./build/compiler`

* 🧠 brain
* contains all optimization logic
* must be rebuilt after changes

---

## 🛠 Typical workflow (recommended)

### 1️⃣ Modify optimization code

Example:

```cpp
// src/ir/PassManager.cpp
if (optLevel >= 1) {
    runConstFold();
    runDCE();
}
```

### 2️⃣ Rebuild compiler

```bash
cmake --build build
# or
make -C build
```

(or `ninja -C build`, depending on your setup)

### 3️⃣ Re-run tests

```bash
./test functional passesTest.sh
```

---

## ❌ What does *not* require rebuilding

| Change          | Rebuild compiler? |
| --------------- | ----------------- |
| `.sh` script    | ❌ No              |
| testcases `.sy` | ❌ No              |
| `.in / .out`    | ❌ No              |
| LLVM version    | ❌ No              |
| runtime library | ❌ No              |

---

## ⚠️ Common student mistake (you avoided it)

> “I changed the optimization but nothing changed.”

Cause:

* forgot to rebuild `./build/compiler`
* old binary still running

Fix:

```bash
rm -rf build
cmake -S . -B build
cmake --build build
```

---

## 🧪 How to *confirm* your new optimization is active

### Option 1: add a debug print

```cpp
if (optLevel >= 1) {
    std::cerr << "[O1] running DCE\n";
}
```

Run:

```bash
./build/compiler -S -o t.ll test.sy -O1 -ir
```

If you see the message → rebuilt correctly.

---

### Option 2: compare IR

```bash
./build/compiler -S -o noopt.ll test.sy -ir
./build/compiler -S -o opt.ll test.sy -O1 -ir
diff noopt.ll opt.ll
```

---

## 🏁 Final takeaway 

> **Scripts orchestrate.
> Compiler optimizes.
> Changing optimizations ⇒ rebuild compiler.**

