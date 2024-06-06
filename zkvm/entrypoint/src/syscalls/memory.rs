// Copyright 2023 RISC Zero, Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

const SYSTEM_START: usize = 0xFFFF_FFFF;
// const SYSTEM_START: usize = 0xF_0000_0000_0000;
// const SYSTEM_START: usize = 0xFFFF_FFFF_FFFF;

#[allow(clippy::missing_safety_doc)]
#[no_mangle]
pub unsafe extern "C" fn sys_alloc_aligned(bytes: usize, align: usize) -> *mut u8 {
    // let align = 8usize;
    extern "C" {
        // https://lld.llvm.org/ELF/linker_script.html#sections-command
        static _end: u8;
    }

    // Pointer to next heap address to use, or 0 if the heap has not yet been
    // initialized.
    static mut HEAP_POS: usize = 0;

    // SAFETY: Single threaded, so nothing else can touch this while we're working.
    let mut heap_pos = unsafe { HEAP_POS };

    if heap_pos == 0 {
        heap_pos = unsafe { (&_end) as *const u8 as usize };
    }

    // let msg = "start align -----------------------------------";
    // let buf = msg.as_bytes();
    // let nbytes = buf.len();
    // core::arch::asm!(
    //     "ecall",
    //     in("t0") 0x2,
    //     in("a0") 1,
    //     in("a1") buf.as_ptr(),
    //     in("a2") nbytes,
    // );
    //
    // let msg = "bytes";
    // let buf = msg.as_bytes();
    // let nbytes = buf.len();
    // core::arch::asm!(
    //     "ecall",
    //     in("t0") 0x3,
    //     in("a0") bytes,
    //     in("a1") buf.as_ptr(),
    //     in("a2") nbytes,
    // );
    //
    // let msg = "align";
    // let buf = msg.as_bytes();
    // let nbytes = buf.len();
    // core::arch::asm!(
    //     "ecall",
    //     in("t0") 0x3,
    //     in("a0") align,
    //     in("a1") buf.as_ptr(),
    //     in("a2") nbytes,
    // );

    let offset = heap_pos & (align - 1);

    // let msg = "offset";
    // let buf = msg.as_bytes();
    // let nbytes = buf.len();
    // core::arch::asm!(
    //     "ecall",
    //     in("t0") 0x3,
    //     in("a0") offset,
    //     in("a1") buf.as_ptr(),
    //     in("a2") nbytes,
    // );
    //
    // let msg = "heap_pos";
    // let buf = msg.as_bytes();
    // let nbytes = buf.len();
    // core::arch::asm!(
    //     "ecall",
    //     in("t0") 0x3,
    //     in("a0") heap_pos,
    //     in("a1") buf.as_ptr(),
    //     in("a2") nbytes,
    // );

    if offset != 0 {
        heap_pos += align - offset;
    }
    // let msg = "aligned heap_pos";
    // let buf = msg.as_bytes();
    // let nbytes = buf.len();
    // core::arch::asm!(
    //     "ecall",
    //     in("t0") 0x3,
    //     in("a0") heap_pos,
    //     in("a1") buf.as_ptr(),
    //     in("a2") nbytes,
    // );

    let ptr = heap_pos as *mut u8;
    heap_pos += bytes;

    // let msg = "new heap_pos";
    // let buf = msg.as_bytes();
    // let nbytes = buf.len();
    // core::arch::asm!(
    //     "ecall",
    //     in("t0") 0x3,
    //     in("a0") heap_pos,
    //     in("a1") buf.as_ptr(),
    //     in("a2") nbytes,
    // );

    // Check to make sure heap doesn't collide with SYSTEM memory.
    if SYSTEM_START < heap_pos {
        // panic!("Heap collision with SYSTEM memory. {SYSTEM_START} < {heap_pos}")
        panic!();
    }

    // let msg = "end align -----------------------------------";
    // let buf = msg.as_bytes();
    // let nbytes = buf.len();
    // core::arch::asm!(
    //     "ecall",
    //     in("t0") 0x2,
    //     in("a0") 1,
    //     in("a1") buf.as_ptr(),
    //     in("a2") nbytes,
    // );

    unsafe { HEAP_POS = heap_pos };
    ptr
}
