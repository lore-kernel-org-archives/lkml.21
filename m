Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.230.72
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795172371;
	b=4oKHZ+ZcIHW165FqZS20sAF59t9VhfiN3WCKjno+TowAsOy6VtSQlww1lQC6SwXnZazt
	 j0WXLeYAy2oRaWmFS0ErIJdGQ4AXA/mrV5kdK8yA11Ahbz0kqOJjSoZjnNkHmXHkE6ldY
	 OIL+B6DMy/fb4POYWopFcrAbgYT4+f5dg7Pra6lJKbXElLparRQhZZ5N9FszHSPpZ0618
	 JAW5Uy7jh3hzNqw/MuvXvhWip9URA4MU+0WJojasivpIbhTAR01iMaO5EMOAvF8rc3quI
	 lN01FlXHj1eF5edT7uFxmdGIX5Web/lAu60QBa0LX+So9mS7TCweeuR778OAvCCKQzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=lsuDl5Mn3UwB19cNkcSJlYu8KKq2fYppJdpOiWNy9qk=;
	b=ihgqPc4QqTVXV/+ZpVj7C5bY9/17/Vnj40VAbErlUANhS9CkhppR3JtHRR9wnwa7ToJ4
	 kXcl3xUkQM7e4ko5VrNoDK4i0QdmjGVIxGTXD4K081JhC+x4pxkfXlHwm+tDwwLuZNR8R
	 imzS1UqdH8tMc8iDhdW1Mih0PCo9Jq7XaUL/RIQJGDyCEf2XCl+Z6s5RDVxgFJOyNCjhV
	 +ibY6htaZYgLItdYdL9Pzz4wsb780HkMHwS+iDEzp/BqTmwbAEcwjy41wWInmrLD0djK2
	 Ua5LqrmUlnb5U6wsrQ9BEdhY2+nEPC+i1RYVevBQ/lVNYBMT4tWVFpa5YaBDptFi7UQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hjZVtA5I;
	arc=fail smtp.remote-ip=74.125.230.72
Received: from mail-lr2-f8.google.com (mail-lr2-f8.google.com [74.125.230.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75138606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75138606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hjZVtA5I
Received: by mail-lr2-f8.google.com with SMTP id 38308e7fff4ca-3adf2030cdbso2672131fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:59:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795172370; cv=none;
        d=google.com; s=arc-20260327;
        b=NV34GKW9oCUvpv4UKXR0rDBhzQ/HTz20IaJtu2v2voLic9PJ8+hE1H/yvrDaVBNt7K
         egHggoijYsCu+WJept+0+ugyK6D7jTLVrpPqKmCPm9HTT1prvfvN0hXjTUpwvqljHNnS
         bsIbpCp3o++WTv/Zs83P3BL89TzqdszNnl3MFqrUufmp1paaPDNMTHGrOcoqd5LzDPrx
         cBacrDKzqg0h6Sh27VxpYvZiVXH5rgAhm3asYpyK5lqys/KZgQpmeSe3JM6HfqanKtOe
         tCZIKqiY4NQu6EXyT/WEhl7diRevyXfO1sokKClZYtIRel4nydDYcUoZjvHqpS32JTYl
         HayA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=lsuDl5Mn3UwB19cNkcSJlYu8KKq2fYppJdpOiWNy9qk=;
        fh=s2oUvdUkxyzETTho9QitXWLJIP0UpnkM3fBZk+kdFhI=;
        b=ViRct05gPHKxJZFpL8Vwh6bRiA+ADhRLo11hJsTMh1uNcWN0lku+PNqCVLP61RM7VD
         Lpc6brA8GTmxz6ErivIazc2dGAEtytDbO2qMsFBLwRglr9hdnhlBhHJIVhWsxvvxMLVR
         I5/gsKLF0cpRpVvDoNcsOaKIJSrX27YMLmlDEH/H9lCzx3ZzbJbjJAn5yqR9FfyHL7Ji
         iu2v3GbbLaJwXvTAVngmrNJG3QmAqzqCb3zR+d0RFfs2by0z3JmAcIIiK7bbnLSPxm/O
         3hFuw/2skugpscum5vFn9OdIeGosBReksRJBXF562Hr9kGr/e/48D1g1fJseyKVh6EgR
         PWSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795172370; x=1795777170; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lsuDl5Mn3UwB19cNkcSJlYu8KKq2fYppJdpOiWNy9qk=;
        b=hjZVtA5I3GOQ3OgGiXpAh4D/yiWo9n387+63YqmnJU8rK6mUkJsQCbGY/Ryfmj4PG7
         POiFVQfTW9uzhfKwvXmSKNLW1YkN/zO0PKc1tZpAIn2ZN71ygI5F6MJf5mRq2YhUApRw
         Jn5mUuk0f5jRbWdBzrP3tKCsIy61XMt6s5r8o4wSy9g2mZ0HqlnCZyybpySMbUvfRxXW
         KBLGqSBia5V1CZuzax3w6ZDBX/34Va8R6FA9ERAKaCf16ELD+klxRjhxpXofsKocJE62
         LOManfqKvXTvs49MVsXib5bhQoDtiYdcfP/1xv/XAEjlMM09sx+Y90rZ1rMs/DRA6Jh+
         FO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172370; x=1795777170;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lsuDl5Mn3UwB19cNkcSJlYu8KKq2fYppJdpOiWNy9qk=;
        b=RATPfdX2DUFtbSqQD4zLLG00uc+KzN63CPDUorR9SfrOy2IQYS5Q7aNB+f3RPTpkEv
         v0znydpPGEVIayPCDDna9gOiPrCn7LpdglNUhuSjlQhUPp2QqqhJ0DSKzo10RviQMjrF
         lCiSYJ/M+fQvPmNrgRIbhxt8utyOCrzWY0ciDtNaknPdPh/inMTZdi23pCbjnZnFfG8D
         Xo5Wn++s0xGfosRtXMLO21MW6+KdZmAG9a0toJa4Nsc1REaKDdG6P4qQUhD8Dzte+13I
         ddqtUA/4IrXP1+rFukhjZ4e2XP8HYHbC83wuMMjgd3L6mzcKdYyE/7Az9KTrEX4qgD/d
         ta2Q==
X-Forwarded-Encrypted: i=1; AL+hErGB51QvJNVYM5AqVgnfuI1/92A1j1kn7n1k9vKjJYwm3XRoyub70Li78jAI1AGXxsRkAUQQkybtU7Km/dQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KAaNV4p7VtT1DUTV0luczzqtoaC5xDX1YgLr0G0Jk/Qsn7lto
	20ue5++5cQoOMk++mVOMQwy85ixKUcGZCQSNyWwW96Tj8nZwlwE3iStHyxiY+YsX5j7r9XJabRT
	KqxB1BrFpgDD2CmXXque2kZ9m+tZVDMo=
X-Gm-Gg: AZFdTZfn4xBpiPfQJSD6djU1Nz7M4Osn0X7NDL88tpc0LDona61xejYwhfKH0yoKgUb
	yaYvia18EcDMCDnBz7NPvH7btreBLBSPs9XmbbLGKL/cGmO2Cdh8Qt0Q18tYwS5SYJeSxoZos2j
	7X3Pa+QJlIUFJMhoVyRhBjZJW2jbMu95qxe+ivs5/8/+PhNMOss7ZiMPMSLw5ZANmAzM8paDYw+
	dmY1Dt3TPpbWSruVXvkV1ibpfD3CkK0iLMzPmhYKdfc3Ds6CT1DorlqGIVnkcW8wi2bnOe4c3zU
	F74MqAqWkSvIjKovBVyBYYvIoUEqzHHV1XzNXqW+wA7A3mWeiVL6s4iewbRt4Xswk1KliHzI3fh
	VXVPFWbGeB3g1cW2jdRK7sLK3DKtASGfqNltDUGT2QsXipxIhbGWeRViaHTmz30fm16IZ
X-Received: by 2002:a05:6512:3187:b0:5c1:9752:4a4a with SMTP id
 2adb3069b0e04-5c1bc85a157mr752168e87.65.1795172369334; Fri, 20 Nov 2026
 02:59:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Zheng Zheng <fengaojigui88@gmail.com>
Date: Fri, 20 Nov 2026 18:59:15 +0800
X-Gm-Features: Aa3M54rmQkwWBhrijL1QXQXHklkFcgZIvs5-RQmIqvid1q9B1KJKQjJZfoZUeyk
Message-ID: <CAO-4RZ2pjEOpTBzqca5UxZHtaFS2Dj9zmNj1BtjvKm1yFE7_Jg@mail.gmail.com>
Subject: [BUG] INFO: task hung in nilfs_transaction_begin (fs/nilfs2/segment.c:221,
 v7.4-rc3)
To: konishi.ryusuke@gmail.com
Cc: slava@dubeyko.com, linux-nilfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hi Ryusuke, Viacheslav,

We found a reproducible NILFS2 hang on v7.4-rc3 with syzkaller.  The
supplied recipe reproduced on independent fresh VMs.

Note: This hang may share the same underlying root cause as the
previously reported nilfs_segctor_thread hang (issue #182):
https://github.com/nilfs-dev/nilfs2/issues/182

Repository and reproducer:

  https://github.com/Zheng-zheng-codes/nilfs2-transaction-begin-hang
  commit f1065fd59515bd55bbb5141b45e979bc0b3c9993

Hung-task report
----------------

  INFO: task syz.7.24:13081 blocked for more than 142 seconds.
  task:syz.7.24        state:D stack:23176 pid:13081 tgid:13075 ppid:10344
  Call Trace:
   rwsem_down_read_slowpath
   __down_read
   down_read
   nilfs_transaction_begin+0x323/0xa00 fs/nilfs2/segment.c:221
   nilfs_write_begin+0x78/0x1b0 fs/nilfs2/inode.c:228
   generic_perform_write
   vfs_write
   ksys_write

A second thread of the same process (PID 13109) is blocked on the
f_pos_lock held by PID 13081.

An NMI backtrace of the semaphore holder (PID 13190) shows that it is
executing the NILFS2 segment-constructor path through
nilfs_clean_segments(), including btree/bmap propagation:

  nilfs_segctor_apply_buffers fs/nilfs2/segment.c:1010
  nilfs_collect_file_data fs/nilfs2/segment.c:589
  nilfs_bmap_propagate fs/nilfs2/bmap.c:329
  nilfs_btree_propagate fs/nilfs2/btree.c:2128

The lock dump identifies the semaphore holder:

  locks held by syz.7.24/13190: 3:
   #0: (sb_writers#17)                at: nilfs_ioctl_clean_segments
                                          fs/nilfs2/ioctl.c:869
   #1: (&nilfs->ns_segctor_sem) WRITE at: nilfs_transaction_lock
                                          fs/nilfs2/segment.c:357
   #2: (&bmap->b_sem)                 at: nilfs_bmap_assign
                                          fs/nilfs2/bmap.c:373

So a NILFS_IOCTL_CLEAN_SEGMENTS task is inside the segment-constructor
path, holding ns_segctor_sem for writing while doing bmap assignment,
and normal writers cannot acquire the semaphore for reading.  In this
report the segctord thread itself is not among the blocked tasks.

Relation to the earlier nilfs_segctor_thread hang
-------------------------------------------------

We previously reported a related NILFS2 hang:

  INFO: task hung in nilfs_segctor_thread (fs/nilfs2/segment.c:357, v7.4-rc3)
  https://github.com/nilfs-dev/nilfs2/issues/182
  https://github.com/Zheng-zheng-codes/nilfs2-segctor-thread-hang

Its hung-task report showed the constructor thread blocked acquiring
the same semaphore for writing:

  INFO: task segctord:35823 blocked for more than 183 seconds.
  task:segctord state:D
  Call Trace:
   rwsem_down_write_slowpath
   __down_write
   down_write
   nilfs_transaction_lock+0x25d/0x410 fs/nilfs2/segment.c:357
   nilfs_segctor_thread_construct fs/nilfs2/segment.c:2601 [inline]
   nilfs_segctor_thread+0x600/0xa60 fs/nilfs2/segment.c:2716
   kthread

The two reports involve different blocked tasks:

- In the earlier report, the segctord kernel thread waits
  for ns_segctor_sem in write mode in nilfs_transaction_lock().

- In this report, a normal file writer waits for the same
  semaphore in read mode in nilfs_transaction_begin().

In both reports, the lock dump identifies a task executing
NILFS_IOCTL_CLEAN_SEGMENTS as the semaphore holder.

The new external verification logs also repeatedly report:

  NILFS (loop0): error -28 cleaning segments

This resembles the repeated -ENOSPC errors observed in the
earlier report.

We suspect that both hangs may be manifestations of the same
GC error-handling problem, but the root cause has not yet
been established.

We would appreciate your analysis of this additional
reproduction alongside issue #182.

Reproduction
------------

  git clone https://github.com/Zheng-zheng-codes/nilfs2-transaction-begin-hang
  cd nilfs2-transaction-begin-hang

  # boot v7.4-rc3 with the supplied kernel config
  # using a Debian trixie x86_64 guest

  # in the guest, as root:
  syz-execprog -procs=1 -threaded -repeat=1 \
      -executor ./syz-executor \
      reproducer/repro.kernsight.prog

The recipe requires sequential execution with -procs=1.
Using -procs=8 did not reproduce the hang under our tests.

The recipe is a state-reconstruction sequence (72 replay programs plus
one model-selected priming program, followed by the crashing testcase).
The crash depends on the kernel state built by the recipe; the testcase
alone is not sufficient.

Verification:

- reproduction run: two attempts verified (confirmed=true,
  status=verified), 2026-11-20T07:17:00Z and 2026-11-20T08:05:31Z
- independent fresh-VM verification inside that run: 2/2 target hits
  (2026-11-20T07:46:46Z and 07:50:15Z)
- stability on fresh VMs: 5/5 reproductions, 187-194 s to the
  hung-task dump in every run (2026-11-20, external-verify/)
- evidence: reproducer/repro.outcomes.jsonl, external-verify/,
  logs/external-manager-session.log
- C reproducer: not generated; the syzkaller recipe is the primary
  reproducer

Kernel/guest details:

  kernel: v7.4-rc3, bzImage sha256
    0c16409f8aec508ac44a63e631c2bd352536401f3fd0856df1d839fb953a1882
  guest: Debian trixie x86_64, 6 GiB RAM, 4 vCPU, QEMU/KVM
  boot: oops=panic panic_on_warn=1 hung_task_panic=0
  config: CONFIG_KASAN=y, CONFIG_PROVE_LOCKING=y, CONFIG_NILFS2_FS=y

Thanks,
Zheng
