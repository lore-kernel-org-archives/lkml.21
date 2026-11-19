Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795059747;
	b=REMk5Cd0t8Jp1jpKELy2QXOzT2y/OiIpGPfCMrqwDRzTya8wRcM50+RnfHz/7RkK15V+
	 XxLpIMfPAWN3JwqetkxrZI5dWpGKWL9MoR3PjSSRGCIQ2d3xjYqsBRJkFe7Kkho5QyoPs
	 rfeS9iZlbKE3Q6iaEoDEA9z2Kxx1f1xovMK5v8G/fQWms0P/dR8BFo97qU+AFbBvQJ0Bj
	 PgxCGfG5tpmJE4cgo/r5bNvlsWSLCTJFtUiovhLvnfLiW3ItVBclCGW0tx3WoXQvNzumm
	 69dQE6yZhGbPmC6NayeipOcbi9QYtokXEFD3skXqsapLfF2d6mrFfOmKlQLQ41paR7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795059747;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=YzXAVBP4P5avemsKJhJOEhdEUSdV8On0IvBSzHo9qUs=;
	b=oepQ9dZqndyJ8t5U4W9YL7LNNRuhbJmBdPQLiK3q+FVXZLEn8iLWuj5XVaj78YkeE8eo
	 2t+oVyNvKEZiwUhZUA3Ug89EP3W483JdQ2EsibeSjxJhhDuTLH3wV18xrlzxBNQrCtWE2
	 QhDb6q2mwx5hc6ohQRWwa66Vh4FIMML6Hd866H/7M4crjE7rrVWGq1/aOuhIaPt6R3HHV
	 In0Y2ZfECzab07tUDYd53KCpiCNafTrggkO9mTWUfPA4LfCcJVGHzerzGxsPsbW75FXDj
	 OVGyIxQ/UTov8zPCPKWIa8clPiJBLg/xW4RRO9X4N04+0Cw8lRlA3TR023AJ3ZMVg8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF7C606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FF7C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ab4f652f9bso1260325b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:42:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795059746; x=1795664546;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YzXAVBP4P5avemsKJhJOEhdEUSdV8On0IvBSzHo9qUs=;
        b=Dyuzl5KKZGzWL3AlHR+sjzRNowwRPSCsGERbnUjL5Y6PoT2zgrdR7PYBk8gsmoA2xp
         RmbnxfOVRXjERnKbD7vavcqXkdFsxk+HZIyULCZz7HOYdVYe8OakQaITTck/ngdd+o8P
         WlexsiC7iXCenS550BGHVqyPWbjyQP69c14KLm1d1KFPBVU14ylbYyF/r/zkyv9i9mEZ
         qZB+ZTj/au4bTH5jVv/YR21xlK6Na/vDtX59PXg9Kv8wJG6y0kbE+9Wm0Lg+J/UWhC+q
         teVhRovV5KxQDhnGrl8YlnOzo81E1egcRj2Lx5ljRtLpfoiQQYUnPU14vWi8CJb1zTKV
         76PA==
X-Forwarded-Encrypted: i=1; AL+hErH7wNm2hj8IKmPeK44L8/9qV94b5ghO6KeaH8dRr+7DQcLh0Oi8PpDNg+T/vV1yLWF+UZz05FBjcSnUMoU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yRDbVXzKklfDxv4DNacXumNRk15Ih+uKsZN9Q8NqxBXj4U+9X
	q55U3eq4A6ffg66SoWBAB53xVSl74ztxe2J8QPRI3LgS2pAXMGQMKKBF2vd0dzkbHLG6rondP+L
	OSBp7Mnw2b2E0k9m2kLgLTcViF30WIclCgaTgCy3k/Y9wvnjIvLqC5Zlf/d4=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4fcb:b0:4b9:a88b:888e with SMTP id
 5614622812f47-57741723d3fmr6247282b6e.36.1795059746478; Wed, 18 Nov 2026
 19:42:26 -0800 (PST)
Date: Wed, 18 Nov 2026 19:42:26 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6afe7022.48d76eb4.4b11.0000.GAE@google.com>
Subject: [syzbot] [kernel?] KCSAN: data-race in 0x0 / fpu_flush_thread
From: syzbot <syzbot+58cbd7974a103b8b8916@syzkaller.appspotmail.com>
To: arnd@arndb.de, binbin.wu@linux.intel.com, bp@alien8.de, chao.gao@intel.com, 
	dapeng1.mi@linux.intel.com, dave.hansen@linux.intel.com, ebiggers@kernel.org, 
	hpa@zytor.com, linux-kernel@vger.kernel.org, mingo@redhat.com, 
	peterz@infradead.org, seanjc@google.com, syzkaller-bugs@googlegroups.com, 
	tglx@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    666539eecdf4 Merge tag 'assoc-array-fixes-v2'
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1624fad9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b949a9d3c1d44ceb
dashboard link: https://syzkaller.appspot.com/bug?extid=58cbd7974a103b8b8916
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/a943b9915869/disk-666539ee.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9bfd839d7ea5/vmlinux-666539ee.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0f20b9720a71/bzImage-666539ee.xz

AI-generated root cause summary:
In fpu_flush_thread() (invoked during execve via flush_thread()),
fpstate_reset() modifies the task's fpu->fpstate pointer and resets fpstate
configuration fields without holding fpregs_lock() and before the live hardware
FPU registers are invalidated. If preemption or a softirq occurs during
fpstate_reset(), switch_fpu() executes save_fpregs_to_fpstate(), which
concurrently reads fpstate->xfeatures and writes hardware register state into
fpu->fpstate. When dynamic features such as AMX are active, saving live
registers into the newly assigned default fixed fpstate buffer triggers an
out-of-bounds memory write.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=58cbd7974a103b8b8916

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+58cbd7974a103b8b8916@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in 0x0 / fpu_flush_thread

read to 0xffff888104809f18 of 8 bytes by task 10978 on cpu 0:

write to 0xffff888104809f18 of 8 bytes by task 10978 on cpu 0:
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
CPU: 0 UID: 0 PID: 10978 Comm: dhcpcd-run-hook Not tainted syzkaller #0 PREEMPT(lazy) 
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
