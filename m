Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.72
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795180517;
	b=JRzCqzQ9ZYTQyHf0cmnlnG8a9whxApqL55hFAfUATj9qmZECrPCED8IVHh529/8U2ECD
	 aGCeVmhAwCNlcUvXW2p/25RmNPRR4GH1GJzk12XJAZu4Efa3IAygrW1K9H1VM7CGXNp3a
	 vfOPRV9IWyy/MHRyAMPd0ER1HFJhtzGAY5lZusqrn+pmZb1mCm6VySM+5EGKM86LHvolv
	 a5+YOhYB4II++SlvPbBBQ5p8M44fuVzorJ4rmo5CYo6FiYNKFBZhUryxzmd5fyDBowNOI
	 v/lgLp7sD0MaCZrOg5xDtz5ZIapV9T1as8OgLgEmYwGFwjjtfGp434iPd/cSJXmBGSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=EQiG04aeGhho2nX4ngIjEvlX8jJG32lCa/NIg3JNY4Y=;
	b=B1XOncBAO+UNNbGqvws3gqthxqgy9KtJkvAepBV0yWxJszS+enHi2q3eeer4jc5kSNSe
	 6ZBA8KdmX74a3iH2tkICCrQJ2lccjEg+6y3FQX1Z3FylBpST8m8SL/InvN5+3y64VioTZ
	 IaD1x9/kPof4rfP12kh5Iz3qD5NNlsNZWhSG6AnObnyJTJmW64Dw7fT5kZcQOSohcjWIm
	 dS873zbdW1LKn/51Aomakv56KILMIiXM5smrdziRW2ms+okWrHsZffmswrKQFnwqCHnXL
	 rl2O0tZ067YPDMoxgqP1L6dVfsDcwEk6/UN1Vz6J6VqO/wgSoAhg+qsGJapwJEkmgNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="P9co/5nk";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.72
Received: from mail-lr2-f8.google.com (mail-lr2-f8.google.com [74.125.230.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC8C606A330
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BC8C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P9co/5nk
Received: by mail-lr2-f8.google.com with SMTP id 38308e7fff4ca-3adf2030cdbso3152551fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:15:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795180515; cv=none;
        d=google.com; s=arc-20260327;
        b=DxFgmsfDBcaZPEcDX25s4VwgnB98xE8qUrK3DgKZ1jVViWzy6muTd/ogAnfFCQst5K
         7sNktOhho68T1zaYINE9AlO59+a5ZPiAu6R3YmONQRk8T/psPIJlp7kGxgoMiSH1K9aG
         G48XTD5qvud8Y9U8G88iUK16oilxxAXTD0fIClGOC4ZXDRUjPf5e1l83Y4vhFzBiITr1
         w5yotl1SSFc+0zHd+6q1fb00XiQ1/ez+y2LRD1zlUg7ZjtG/XuCwQunQK20ZbCnGOfo6
         1Sslf623Uc+mPISQJTPDR+Kvwviz4k7RYN9h/W81x/rSNKsOQ+Mx/DgoMb4cD1XoMQx0
         4f1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=EQiG04aeGhho2nX4ngIjEvlX8jJG32lCa/NIg3JNY4Y=;
        fh=mOGANzA266xZEqPKHKA3PdneYXoNSwJux0X1Nu/LfbY=;
        b=rHMg2MLr7ito//s/bTEkhk4wMSvb6C7KNLKm32tZ5FqvhjRuEGFSemRj4t2P7DVg4d
         X5qlSkT6RELdeVXGcEsEH1DnfhcYQYiAHXtU1pCMpaT9BJ8jYt6kzO34FKwxJ/TRCe7C
         jMnQHLtKUDBhAV+R9aTMtEt13LYPwWIBZxrWDio8GiT3tWGsHfAkWeT+IE7nM9sl628K
         dMSg95Pv3pV2m2DpXI89qO3aWOanhVpqYVxbwVmc8e0uJOlGrxE+VxLKKMv+8PHz/YNz
         ZSHa35BJyJsWbKMDw74jFHw2E1w6QgaIgYakogelQRqxTFhyvEWFizFaehpojSs5uADH
         Zjgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795180515; x=1795785315; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EQiG04aeGhho2nX4ngIjEvlX8jJG32lCa/NIg3JNY4Y=;
        b=P9co/5nk2BCfKH8P/NoIB2Cn1oBV2UuKQpTkMTjoGmhyC8ElxqvuutoIG99+3e2034
         Sgc4xCwPTG8/ECehHbxAaNwWst8YOp7WlW3cravICM1M2qbXw9rJ+3nFGz1ZEVq7ygZr
         GUC0z2n2/5HvzSYBklMRJvM8ud7UM5jLxrKRCLGBkQsXlWd9JIpc09u6MsGSb5RW3xJd
         aVOrchqLoy9P6YY2dzvmuzZ4e0//2bxqH1t4WQnH3tKDJ9b42Jae1zg0LDuyfQnlTLND
         8RpX52Ze6Y92GHxcFQqw9LHWWodDnbsZE3qbgbEMR7/x52A/MaUFA0h55F/qJ1fvTT/3
         I10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180515; x=1795785315;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EQiG04aeGhho2nX4ngIjEvlX8jJG32lCa/NIg3JNY4Y=;
        b=BqrMeBAguVtHldt6OoO6BiqJbMg6+oOMnmiHenkz466a1boxVmnGk+8veXs0wuP5bd
         vS+vTNn8qvqgTyYxZYTP9fQPQltXAnWmSxDRt9JrsePv5O26umgWGoQCc4HhhogLneaF
         Er6qX0va5V7CUnpKp/d4eg7A8ackVJEGUwuESFlz8uUxUihTHg8aSJkgjYfqVjjpKRAq
         kHVZfvMwfNRT6o5PiezAPxkv6ejGjE81b67ku9L1FSLNZRFf1BXhu0X24e1v2gj3w1J7
         sIb08NEA1DvEsSK9Ea3I8GgpCryBsm1d1bl0dhp5Vg91QqugrzRubcz8igTEV3uLUl8L
         dQ2A==
X-Forwarded-Encrypted: i=1; AL+hErEbpBepIgh8/ns2ThXNwVFZnHkiTN18MJdLGbZoCefTZG/bEnF0w6QP0O7SPDjVYft+lbyqyMfv0xJmxJs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8a9kaGuu2UAu4w4+6buqM5j0qxx97I6bRalWu5YHrXsB7chQLE
	/0yO3e8I84rfy/adWp+wBd0XLcappLx9H3gq0v/kY8kKjpUA0vIeht2hYPHvxtlvW2Gv/wCUM9j
	vllRKiRfL7bppEmTRPoznx4et+im10kA=
X-Gm-Gg: AZFdTZcg/ORS9WTV8P1Ez4wlb+KY3KuyPIjiKOdXLH/naySOu/HN0lTQFIxTjXSFpA2
	jsA+s+4OBFoNTvTSAbb1N0VIimK22VJG+EPkYRrUfoMP0nJQI+JajaAd+92BVI6rSzfGUbMW/fA
	uiU0GCeHQNL5XteMf33SUucVbu3oj1rlK6fkBa5iC8Sc2hwXJv4syBpk+xj3iodbgxsrhiam7sV
	fnnr7b7uvy4Z+UN5FRK9s7blbE6c15itdBwAvTZqE9Of4XrzyoRbS2Yi2qyxGbb4CsxLYeajBF6
	7CxK8XUOkarYaSD5Med1Z1A1G5aLGzaLiX9g8ILdig83F25p/Xz5AvGgRTzfyyP0fzBVcX2f3Mb
	2oDav7gmDAdD8C84z/xjJEMrKCSkCUHw993zK28G9ejHTQXcnDo2u93c2N2sH6kKn/zUU
X-Received: by 2002:a05:6512:23a0:b0:5bc:ca83:1fc0 with SMTP id
 2adb3069b0e04-5c1bc84e614mr893480e87.60.1795180515196; Fri, 20 Nov 2026
 05:15:15 -0800 (PST)
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
Date: Fri, 20 Nov 2026 21:15:00 +0800
X-Gm-Features: Aa3M54o01QUrjwMOe7JbVZOC_U4U8JrBvLlJFLHGEXWyo1gmrd71mbHzknsbcAA
Message-ID: <CAO-4RZ3D4PjuOopArwKVtt31KLKwPAqTu_w+jwJKhbTkKfBykA@mail.gmail.com>
Subject: [BUG] INFO: task hung in f2fs_balance_fs (fs/f2fs/segment.c:461, v7.4-rc3)
To: jaegeuk@kernel.org
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hi Jaegeuk, Chao,

We found a reproducible F2FS hang on v7.4-rc3 with syzkaller. The supplied
recipe reproduced on independent fresh VMs.

Repository and reproducer:

  https://github.com/Zheng-zheng-codes/f2fs-balance-fs-hang

Hung-task report
----------------

  INFO: task syz.3.29:17033 blocked for more than 143 seconds.
  task:syz.3.29 state:D
  Call Trace:
   io_schedule
   f2fs_balance_fs+0x5a2/0x9e0 fs/f2fs/segment.c:461
   f2fs_map_blocks+0x2626/0x4d00 fs/f2fs/data.c:2160
   f2fs_iomap_begin fs/f2fs/data.c:4798 [inline]
   f2fs_iomap_next+0x3d9/0xc20 fs/f2fs/data.c:4856
   iomap_iter
   __iomap_dio_rw
   f2fs_dio_write_iter fs/f2fs/file.c:5587 [inline]
   f2fs_file_write_iter+0x1da1/0x2d10 fs/f2fs/file.c:5711
   vfs_write
   ksys_write

The blocked task is a direct-I/O writer sleeping in the GC_MERGE branch
of f2fs_balance_fs(), which hands the request to the background GC
thread and waits:

  if (test_opt(sbi, GC_MERGE) && sbi->gc_thread.f2fs_gc_task) {
          prepare_to_wait(&sbi->gc_thread.fggc_wq, &wait, TASK_UNINTERRUPTIBLE);
          wake_up(&sbi->gc_thread.gc_wait_queue_head);
          io_schedule();
          finish_wait(&sbi->gc_thread.fggc_wq, &wait);
  }

While it sleeps, the writer holds:

  #0: (&f->f_pos_lock)              at: fdget_pos+0x2a5 fs/file.c:1413
  #1: (sb_writers#15)               at: ksys_write+0x126 fs/read_write.c:719
  #2: (&sb->s_type->i_mutex_key#29) at: f2fs_file_write_iter fs/f2fs/file.c:5675
  #3: (&fi->i_gc_rwsem[1]) READ     at: f2fs_dio_write_iter fs/f2fs/file.c:5573

The same report shows two collateral stalls caused by this sleeper: a
second thread of the same process blocked in fdget_pos() on the held
f_pos_lock, and a freeze_super() task waiting in sb_wait_write() for
sb_writers to drain.

Possible root cause
-------------------

The writer waits for the background GC thread while holding
fi->i_gc_rwsem[1] for reading.  If the GC thread selects this inode as
a victim, it must take i_gc_rwsem for writing first and cannot proceed,
which would make the wait in f2fs_balance_fs() unbounded.  The GC
thread's stack is not captured in the report, so we could not confirm
this mutual-wait explanation, nor what drove the filesystem low on free
segments.  We would appreciate your analysis.

This hang is distinct from the previously reported
"INFO: task hung in f2fs_write_data_pages" (writeback path,
sbi->writepages mutex, fs/f2fs/data.c:3834): different call chain and
different blocking primitive, though both occur under segment
allocation / GC pressure.

Reproduction
------------

  git clone https://github.com/Zheng-zheng-codes/f2fs-balance-fs-hang
  cd f2fs-balance-fs-hang

  # boot v7.4-rc3 with the supplied kernel config
  # using a Debian trixie x86_64 guest

  # in the guest, as root:
  syz-execprog -procs=1 -repeat=1 reproducer/repro.kernsight.prog

Note: run with a single process.  With -procs=8 the recipe's
state-building sequence is executed out of order and the crash does not
reproduce.

The recipe is a state-reconstruction sequence (107 replay programs plus
one model-selected priming program, followed by the crashing testcase).
The crash depends on the kernel state built by the recipe; the testcase
alone is not sufficient.

Verification:

- five independent fresh-VM runs: 5/5 reproductions, 201-205 s to the
  hung-task dump in every run (2026-11-20, external-verify/)
- C reproducer: not generated; the syzkaller recipe is the primary
  reproducer

Kernel/guest details:

  kernel: v7.4-rc3, bzImage sha256
    0c16409f8aec508ac44a63e631c2bd352536401f3fd0856df1d839fb953a1882
  guest: Debian trixie x86_64, 6 GiB RAM, 4 vCPU, QEMU/KVM
  boot: oops=panic panic_on_warn=1 hung_task_panic=0
  config: CONFIG_KASAN=y, CONFIG_PROVE_LOCKING=y, CONFIG_F2FS_FS=y

Thanks,
Zheng
