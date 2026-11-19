Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795085678;
	b=B6GD/gt0MMn6dKR2AD2pv40n9fMc41syrvstp4DDmIUIlq3h2ZBm3FMl07xDdCqQrNnF
	 kcrGqkQb6vQBFE3CJuMcA1qc1hJ7yt9C19r0PHMu2uUYrCcuBRwo2smJebNaDCm9TgH2+
	 Md3x51MyCmis4llQtnO2WS1Ep4kqmwDVWw9gqFdk7H3vKkzLq5TxXxRI0N2vcndNDWFtG
	 Ak+gG0ymL8ABYK8LwdHP5B6JXgcRzR3xsUCiMBpUzi+WYvLCyHV/1m+oXMIXRPqY7TV9s
	 XZMu+VeB0cOKVbcCLF2KMAivWUHDUHYj5dhyxn8Nog7GFtRcwdu5L9Y19k18UnA6Lpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795085678;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=MkA6JRnq7TUj0+O96I1vYHcMozmgpupu4tJZmg3q1dM=;
	b=2RHuXUQXAMiL3wuZpBKKs8NLTmMN4ZbRS6GDjLpqdGa43STp6FlC3/9iXIvZoBIjY6pI
	 eTNyE9nj4J5PWUbtaRmsQ2uXeXBCGINtx9BqWVLlYzhFpDiGs/BBF9jAb8vSxdZWxt5L7
	 IO7FrMLL+ZiZfzO+DrQ76GO3BXAJ80ILQ1xmUtjBtBpmo4LIwe5UnKh1ccWKQHelZbSV6
	 28JdGB2Sy9m3oIT40aeJ6fmYhL0GkEmnsxEhQiPN699ZxKUs5CuzYFROo7sBPvFHal/oy
	 1e2h5ZG8mXEyeflUkx4aA+5AcqmdHkKh0oODtSv+a7tzcD2BxIV01W2yhvS/UBvWLIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B80606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7B80606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-540537f959fso2259624b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:54:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795085676; x=1795690476;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MkA6JRnq7TUj0+O96I1vYHcMozmgpupu4tJZmg3q1dM=;
        b=cwWlOTKGn+PiP/5OjdyP2GYewTZAqStsN4d4QOe5mypgNFttRWFDIlQCViwKuFgSgY
         TU7If5YMXXyjtaU0JGdh7BeVxP0+/kM1z8CBCDwakBZSX3FLXmcoINOhAgVNl5uVZoxq
         VNqDom7/qDRKuwabPO9orH3wNHMGL7n4qnRRByql3mzOJJ/rviCUHVT0X2Kxq5sbE59/
         RPFXdvo9+/DYICNGYOVuO4MRoqwRGsRfFOb09X19w49Gcy4yjcZeveL2xtH0M+ZI3jQr
         8ER22wGX1iwLrLNoKahzeSgt0GPiIWE6Z1k2UULoLi6KWZl7aWI1uc3qkN6dJb/H8cHO
         ulUg==
X-Forwarded-Encrypted: i=1; AL+hErFDgFiZTk6+bZhoA054SirF+0K9xDvDfL0cSQjoVmy63bMZuHXblbTSpIwuGCCa68u5WPAO1Czqtub4qsE=@vger.kernel.org
X-Gm-Message-State: APuU4Z85ixdRbkmp6IP8pzvSbWQnecMmL2XJuvyEC0yAMoaaK0Jsc4/N
	ycFaMvGfVOeRxl39OoIAA4FyYJF2Q1jK33bVCoQG9YJn86LeMd50yM5w2mfrCDVxZNE1NrD0qKy
	vNGfz7HCDYQMoo6c1Y3sYqmYyNDsNhC3kRcGszFAfkMpzKMQ88thYAD/XqcM=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:238b:b0:4b9:e6ab:d07b with SMTP id
 5614622812f47-5773d52f18fmr5676083b6e.27.1795085676602; Thu, 19 Nov 2026
 02:54:36 -0800 (PST)
Date: Thu, 19 Nov 2026 02:54:36 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6afed56c.c909bf2b.1e1a73.0000.GAE@google.com>
Subject: [syzbot] [perf?] KCSAN: data-race in __perf_event_overflow / perf_pending_task
From: syzbot <syzbot+a480b581a0bf5f5e8b0d@syzkaller.appspotmail.com>
To: acme@kernel.org, adrian.hunter@intel.com, 
	alexander.shishkin@linux.intel.com, irogers@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	namhyung@kernel.org, peterz@infradead.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    666539eecdf4 Merge tag 'assoc-array-fixes-v2'
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12c9e5c3580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b949a9d3c1d44ceb
dashboard link: https://syzkaller.appspot.com/bug?extid=a480b581a0bf5f5e8b0d
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/a943b9915869/disk-666539ee.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9bfd839d7ea5/vmlinux-666539ee.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0f20b9720a71/bzImage-666539ee.xz

AI-generated root cause summary:
In kernel/events/core.c, perf_pending_task() clears event->pending_work to 0
before calling perf_sigtrap(), which reads event->pending_addr. Because
perf_pending_task() runs in task context with interrupts enabled, a concurrent
interrupt (such as an hrtimer interrupt calling __perf_event_overflow()) on the
same CPU observes event->pending_work == 0, considers the pending slot
available, re-enqueues event->pending_task via task_work_add(), and overwrites
event->pending_addr while perf_sigtrap() is concurrently reading it.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=a480b581a0bf5f5e8b0d

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a480b581a0bf5f5e8b0d@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in __perf_event_overflow / perf_pending_task

write to 0xffff88811b623050 of 8 bytes by interrupt on cpu 1:
 __perf_event_overflow+0x7f1/0x950 kernel/events/core.c:10959
 perf_event_overflow kernel/events/core.c:11004 [inline]
 perf_swevent_hrtimer+0x293/0x320 kernel/events/core.c:12424
 __run_hrtimer kernel/time/hrtimer.c:2079 [inline]
 __hrtimer_run_queues+0x1f8/0x540 kernel/time/hrtimer.c:2136
 hrtimer_interrupt+0x27b/0x870 kernel/time/hrtimer.c:2255
 local_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1051 [inline]
 __sysvec_apic_timer_interrupt+0x5f/0x1f0 arch/x86/kernel/apic/apic.c:1068
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1062 [inline]
 sysvec_apic_timer_interrupt+0x6f/0x80 arch/x86/kernel/apic/apic.c:1062
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:674
 native_pause arch/x86/include/asm/vdso/processor.h:13 [inline]
 delay_tsc+0x43/0xa0 arch/x86/lib/delay.c:76
 udelay include/asm-generic/delay.h:64 [inline]
 delay_access kernel/kcsan/core.c:332 [inline]
 kcsan_setup_watchpoint+0x255/0x3f0 kernel/kcsan/core.c:622
 perf_sigtrap kernel/events/core.c:7676 [inline]
 perf_pending_task+0x16a/0x220 kernel/events/core.c:7780
 task_work_run+0x145/0x1a0 kernel/task_work.c:233
 resume_user_mode_work+0x85/0xa0 include/linux/resume_user_mode.h:50
 __exit_to_user_mode_loop kernel/entry/common.c:70 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:101 [inline]
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 irqentry_exit_to_user_mode_prepare include/linux/irq-entry-common.h:244 [inline]
 irqentry_exit_to_user_mode include/linux/irq-entry-common.h:315 [inline]
 irqentry_exit+0x170/0x640 kernel/entry/common.c:152
 sysvec_apic_timer_interrupt+0x44/0x80 arch/x86/kernel/apic/apic.c:1062
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:674

read to 0xffff88811b623050 of 8 bytes by task 4399 on cpu 1:
 perf_sigtrap kernel/events/core.c:7676 [inline]
 perf_pending_task+0x16a/0x220 kernel/events/core.c:7780
 task_work_run+0x145/0x1a0 kernel/task_work.c:233
 resume_user_mode_work+0x85/0xa0 include/linux/resume_user_mode.h:50
 __exit_to_user_mode_loop kernel/entry/common.c:70 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:101 [inline]
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 irqentry_exit_to_user_mode_prepare include/linux/irq-entry-common.h:244 [inline]
 irqentry_exit_to_user_mode include/linux/irq-entry-common.h:315 [inline]
 irqentry_exit+0x170/0x640 kernel/entry/common.c:152
 sysvec_apic_timer_interrupt+0x44/0x80 arch/x86/kernel/apic/apic.c:1062
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:674

Reported by Kernel Concurrency Sanitizer on:
CPU: 1 UID: 0 PID: 4399 Comm: syz.0.427 Not tainted syzkaller #0 PREEMPT(lazy) 
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
