Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795883850;
	b=jVTS9Yz4MTK2ByW20uoDd5k+YRBvb+MYPO88LWQwuMcQHAHrMniKSDtoyKOM8v+CPpuk
	 PaadWxT6Y5pgcqlgDUidyRBYyfKTkxRe7wuFDPo9idmzXAOJcZAqixEtpcWBHXZTeHEMq
	 JXDgU8oIw86ggqzt21vtfEckgs9QXprHs0Htvu6nascnurNw0JwJ0yE4piWlwQFJ1nTgH
	 l0iPoGPGHsLfcj3+HZbF0hgHmEbMLAbV0e4t3tNAq9UqohPkef3pXnYYVaJdW/n+lu0P6
	 p+bfJFoTxSlW4686EW2lXIv975aqUtnPvdS30Ku4d9fmubJl1ksnQVIoEUpiHvQTMRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795883850;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type:Content-Transfer-Encoding;
	bh=MsFzV/05/ABcdJmfIaOKaEcJjQh30/7B9dyohNfnDP4=;
	b=ID91xPe7acu2r35DWSWy7jEde/StqURimAnksvc1KyeHz3AhtyEFTo2pDNzV1CCY2fz6
	 CmbxcZvl4gvOJkV0q8N3YAKZF83BAG38Mh3Dz7luqgtPwfF73XLKZlrHTuZufD9yaODOM
	 f+puiOVK5xTOFqBtlq1dwk4jg4te09eTf2rIQth0DCZr1NHLQk2SSgrYUn9Tv3z9ugnVX
	 ZA8LUZmRpnpOs1AgEkfwyw48RZ8aBJYneNdvWIp7IPg0kYl7rWbV1gzPUJNvvLAhhaXMi
	 bDNruLXumacm/Xd40R4vERCgxgavV+5POCCxCExsd16Hlg+UjxD56he6WO0SUdV7r6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE95606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 16:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAE95606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4f8281066c4so10469483b6e.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:37:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795883848; x=1796488648;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MsFzV/05/ABcdJmfIaOKaEcJjQh30/7B9dyohNfnDP4=;
        b=MazrSvRXaI//pmFK1bunRT/Ruf7PssRwoOTOQ6uLDHEidif9Nwud7pu/LtGdCz5x3f
         kirEIDrG1btSEVOrm0P3o7AhAUU+Q3gE4BlJ9rXx28Kd1Sx22PLTZLuO13p/zaRl664f
         un0w4r/qKwKFgMoQb3KXBJUYu3lrikiJGV3iVP3Iq0q8/d7kOZzT9XZvijNbBPkm9V5I
         GKA+d5Oce468pkSY1KU6QFJZ2gidUch+8Mu77w1QJrVsmFHWMGb9jX8ymo6VWlUSrvmV
         a2zB0KK5dSldLa4eYUPnsFvq5KjpZngmGXrYN9aMURYgf0TGFeQMwEIL7bCCkWQdtAH6
         vnbA==
X-Forwarded-Encrypted: i=1; AL+hErE+IBhmkCLM3h7qOXqXLWXrBHRvgiJ4gD9D8p46G4Z2M85m6hg0zRkG2aBJJlWCfnjqtlSJ2KSI3+kGRP0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tU+2idHA8fHEHCxDRW1CRM0u7gwF0atxcDNiiROyu6OBe4EEX
	lE0fXsuItt4Ru+0yKeIpOsG29tVzr56ABRBgUekRhAt8Jf3KiqWI4hkjsOj5Zdy0zjPUPNaPnLg
	MSdenU+ta2qoL/8GLffDw4HGiZ4m44f8JioDqNBs3AUXgRW5UNZyMLoP1zZA=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1996:b0:564:22ae:a68c with SMTP id
 5614622812f47-57a0a927e0dmr31421148b6e.13.1795883848665; Sat, 28 Nov 2026
 08:37:28 -0800 (PST)
Date: Sat, 28 Nov 2026 08:37:28 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b0b0348.8ccee5ca.1045fd.0298.GAE@google.com>
Subject: [syzbot] [openvswitch?] BUG: workqueue lockup in ovs_dp_masks_rebalance
From: syzbot <syzbot+a262610586e32d5c8d7a@syzkaller.appspotmail.com>
To: aconole@redhat.com, dev@openvswitch.org, echaudro@redhat.com, 
	i.maximets@ovn.org, linux-kernel@vger.kernel.org, luto@kernel.org, 
	netdev@vger.kernel.org, peterz@infradead.org, syzkaller-bugs@googlegroups.com, 
	tglx@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot found the following issue on:

HEAD commit:    3fdeb5ad9354 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.g=
it
console output: https://syzkaller.appspot.com/x/log.txt?x=3D153faa73580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dbe66ed143fccf86=
7
dashboard link: https://syzkaller.appspot.com/bug?extid=3Da262610586e32d5c8=
d7a
compiler:       Debian clang version 22.1.8 (1~deb13u5), Debian LLD 22.1.8
userspace arch: arm64
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D17f10903580000

AI-generated root cause summary:
The report shows a 46-second workqueue lockup on CPU 1's normal-priority pe=
r-CPU
pool (pool 6) preceded by "sched: DL replenish lagged too much" from
replenish_dl_entity() in kernel/sched/deadline.c. Both in-flight workers on=
 CPU
1 (ovs_dp_masks_rebalance and wg_packet_tx_worker) are in TASK_RUNNING stat=
e and
were cleanly preempted via preempt_schedule_common() -> __schedule() ->
__switch_to(), meaning neither is deadlocked or currently executing=E2=80=
=94both have
simply been starved of CPU 1 for 46 seconds while CPU 0 (pool 2) and unboun=
d
pool 8 continued making progress. Because show_cpu_pool_busy_workers() in
kernel/workqueue.c checks task_is_running() (which tests __state =3D=3D TAS=
K_RUNNING
rather than whether the task is actually running on the CPU), it skipped
trigger_single_cpu_backtrace(1). Without CPU 1's actual backtrace, the exac=
t
offending task, non-preemptible loop, scheduler/dl_server misbehavior, or
hypervisor vCPU-1 stall cannot be determined conclusively from this report
alone.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=3Da26261058=
6e32d5c8d7a

IMPORTANT: if you fix the issue, please add the following tag to the commit=
:
Reported-by: syzbot+a262610586e32d5c8d7a@syzkaller.appspotmail.com

BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck f=
or 10s!
Showing busy workqueues and worker pools:
workqueue events: flags=3D0x100
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    in-flight: 876:request_firmware_work_func for 102s
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D9 refcnt=3D10
    in-flight: 1103:ovs_dp_masks_rebalance for 10s
    pending: pcpu_balance_workfn, 7*ovs_dp_masks_rebalance
workqueue mm_percpu_wq: flags=3D0x108
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: vmstat_update
pool 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 hung=3D0s workers=3D6 idle: =
10 4913 11 4795 4551
pool 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D10s workers=3D6 idle:=
 4824 25 877 27 4901
Showing backtraces of busy workers in stalled worker pools:
pool 6:
task:kworker/1:3     state:R  running task     stack:0     pid:1103  tgid:1=
103  ppid:2      task_flags:0x4208060 flags:0x00000010
Workqueue: events ovs_dp_masks_rebalance
Call trace:
 __switch_to+0x2b4/0x6e4 arch/arm64/kernel/process.c:792 (T)
 context_switch kernel/sched/core.c:5584 [inline]
 __schedule+0x13a0/0x2bd4 kernel/sched/core.c:7386
 preempt_schedule_irq+0x74/0x174 kernel/sched/core.c:7666
 irqentry_exit_cond_resched+0x30/0x40 kernel/entry/common.c:145
 irqentry_exit_to_kernel_mode_preempt+0x44/0x54 include/linux/irq-entry-com=
mon.h:453
 arm64_exit_to_kernel_mode_preempt+0x1c/0x38 arch/arm64/kernel/entry-common=
.c:108
 __el1_irq arch/arm64/kernel/entry-common.c:572 [inline]
 el1_interrupt+0x4c/0x60 arch/arm64/kernel/entry-common.c:582
 el1h_64_irq_handler+0x18/0x24 arch/arm64/kernel/entry-common.c:587
 el1h_64_irq+0x78/0x7c arch/arm64/kernel/entry.S:602
 check_kcov_mode+0xc/0x54 kernel/kcov.c:179 (P)
 do_cmp lib/sort.c:159 [inline]
 __sort_r+0x304/0x4d0 lib/sort.c:259
 sort+0xb0/0x100 lib/sort.c:342
 ovs_flow_masks_rebalance+0x47c/0x99c net/openvswitch/flow_table.c:1155
 ovs_dp_masks_rebalance+0x64/0x11c net/openvswitch/datapath.c:2618
 process_one_work kernel/workqueue.c:3495 [inline]
 process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3578
 worker_thread+0x798/0xbd0 kernel/workqueue.c:3659
 kthread+0x304/0x3d4 kernel/kthread.c:436
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:854


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
