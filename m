Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795120015;
	b=yvEpXIAoyf1UPqmYCUnk2xU5u45swnVYaw/iWNFG+GV+2rdcz6V+dANVlzhDoKURxbQ8
	 1GBNe24F2M86rTZkUKWkDp25bsn4P+WURr9B+LRP7Jt25BKDJrOkLBiv7eqos8Fdx3ZLI
	 eXyNrNYKPHyVw/h+BssH1yGfk2+oWWdQnJ2H3wH89qtnLfAnb0FZ5Hm2aCawTIFL+mhfE
	 9J7vLI38M7rKSgkWpPZzymzQHifDryrA5zWzfrfTzQPfhONiU/ZD/bOq873BLhix+Di+p
	 Fc/kWg3j4ADCOZLijKOWbERHnEBeq42D5U/k25oDjGu/38rI5AWtTIfOEq+AnL3xugg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795120015;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=Gqqb9w9VphZ14i+KlQEZNfAOJl9HDOeu8hkwOFv+IW4=;
	b=DkrLPvVVDZt09wwaVtyhECosTvoFQBIzhwGHNpqNGOvN/DlT5VYaB2av9W1S5vHoozqe
	 lXwm7d6EdhjsYf/4gOwDcDcKClCSog1/YaSK5PxBchyYKb2VZ2Q+OxpTletGrWgYxJspr
	 OPXQYJ1g4kT/1tLRGc1iFD9R3fm/P4F+Z1J4LvEuOc7DAMHOr0YjaWxvUroCDixRZrKhT
	 uEpxAxpIhS/8/dwBE24chLFal07YZOxB8cP6Xbr94mRAZLMMeO9JGR6ib5f8Ah2HXqQBM
	 ei4XGU4Z4kC+t/ggXqiCcrpSyZ7AhCbkDA0AjJH6zssnd0P3p/DDkKWoYxhq5/nbWjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA48606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:26:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DA48606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4cbf700ddccso261453b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:26:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795120014; x=1795724814;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gqqb9w9VphZ14i+KlQEZNfAOJl9HDOeu8hkwOFv+IW4=;
        b=GKUch1igRzmHlPhGrk039SdZ/FNm/qbPktj6jWhR27eOgWDX93rVIi09rI3+eKj2jh
         RxrUAIDHMmuZeP4qv8xU//aFWZ3aIVZQs3JDeCFjPhzxwHf5VYBQhwogtN7HlUIyrR/3
         Z98Avv2E5lNfM97h+ZHk5wc3uK5WS2qA0xZcjH6nBVqynPE0XMjr+K9EdhUdtJxZbG2X
         l2H67gqG2eQn73DmVJ2QDG47UFCzke9XBW3GRvB9ZvzUUNwoiJ1UCQIIskefuVBb3L0Y
         95uwAfTuiLXblVmRZCD8xap2tg5ljQSyAgZPC7rvPCpEgnEVUAceBnYcl0mrAl0fAwCi
         +jQQ==
X-Forwarded-Encrypted: i=1; AL+hErGGRDbMow3hv3cDAFnFVCOuzxhkrUSJ5INLLnzX1qfV8koewKaC5lrxA1o/THfUyNmFK3Ggu19dUm5Tj/U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IYzF/6reEpuaqI5CdomSQFErU4kDG0Q7Z5XRWqM2eFy4QNtkB
	rteNSUCUCYljpl9AQMhqlONrQThlXnmy4xTqn/qcD3OlFOq/1dh9M/xOU+ud4sQoWRzKu/ixe27
	8YC2Et5W5Y3gJ8p1RAEM8pF71w2lCjF8hel95I2Q/GuSRfJFExJCjf/erRw8=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1915:b0:4f7:867a:1136 with SMTP id
 5614622812f47-57a0c7bef2emr1532488b6e.64.1795120014288; Thu, 19 Nov 2026
 12:26:54 -0800 (PST)
Date: Thu, 19 Nov 2026 12:26:54 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aff5b8e.4ea6388a.d0c9.0001.GAE@google.com>
Subject: [syzbot] [kernel?] KCSAN: data-race in fpu_flush_thread / skb_copy_bits
From: syzbot <syzbot+b07ec23d35be305855be@syzkaller.appspotmail.com>
To: arnd@arndb.de, binbin.wu@linux.intel.com, bp@alien8.de, chao.gao@intel.com, 
	dapeng1.mi@linux.intel.com, dave.hansen@linux.intel.com, ebiggers@kernel.org, 
	hpa@zytor.com, linux-kernel@vger.kernel.org, mingo@redhat.com, 
	seanjc@google.com, syzkaller-bugs@googlegroups.com, tglx@kernel.org, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    666539eecdf4 Merge tag 'assoc-array-fixes-v2'
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14b3c5be580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b949a9d3c1d44ceb
dashboard link: https://syzkaller.appspot.com/bug?extid=b07ec23d35be305855be
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/a943b9915869/disk-666539ee.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9bfd839d7ea5/vmlinux-666539ee.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0f20b9720a71/bzImage-666539ee.xz

AI-generated root cause summary:
In arch/x86/kernel/fpu/core.c, fpu_flush_thread() calls
fpstate_reset(x86_task_fpu(current)) before fpu_reset_fpstate_regs() without
holding fpregs_lock() and while TIF_NEED_FPU_LOAD may still be clear. Because
preemption and softirqs remain enabled, a context switch into __switch_to() ->
switch_fpu() (or a softirq using kernel_fpu_begin()) can observe
!TIF_NEED_FPU_LOAD and invoke save_fpregs_to_fpstate() -> os_xsave(), reading
fpstate->xfd (via xfd_validate_state()) and fpstate->xfeatures concurrently with
__fpstate_reset() modifying them. KCSAN reported the same task/CPU with an empty
read stack and a stale "skb_copy_bits" frame because preemption occurred inside
KCSAN's delay_tsc(), and __switch_to_asm switches %rsp to the next task's stack
before __switch_to() calls switch_fpu() while `current` still points to the
outgoing task, causing arch_stack_walk() to fail and return 0 frames.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=b07ec23d35be305855be

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b07ec23d35be305855be@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in fpu_flush_thread / skb_copy_bits

read to 0xffff888103fc3058 of 8 bytes by task 15366 on cpu 0:

write to 0xffff888103fc3058 of 8 bytes by task 15366 on cpu 0:
 __fpstate_reset arch/x86/kernel/fpu/core.c:-1 [inline]
 fpstate_reset arch/x86/kernel/fpu/core.c:620 [inline]
 fpu_flush_thread+0x128/0x360 arch/x86/kernel/fpu/core.c:882
 flush_thread+0x40/0x80 arch/x86/kernel/process.c:291
 begin_new_exec+0xcd0/0x1260 fs/exec.c:1235
 load_elf_binary+0x5ee/0x1a00 fs/binfmt_elf.c:1010
 search_binary_handler fs/exec.c:1777 [inline]
 exec_binprm fs/exec.c:1809 [inline]
 bprm_execve+0x480/0xaa0 fs/exec.c:1865
 do_execveat_common+0x6ba/0x720 fs/exec.c:1963
 __do_sys_execve fs/exec.c:2036 [inline]
 __se_sys_execve fs/exec.c:2030 [inline]
 __x64_sys_execve+0x5f/0x80 fs/exec.c:2030
 x64_sys_call+0x1cd2/0x2550 arch/x86/include/generated/asm/syscalls_64.h:60
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x11e/0x3a0 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Reported by Kernel Concurrency Sanitizer on:
CPU: 0 UID: 0 PID: 15366 Comm: dhcpcd-run-hook Not tainted syzkaller #0 PREEMPT(lazy) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
