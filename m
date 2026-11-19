Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.72
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795093240;
	b=gndxGVZx+wVCeYdIyjKfY1WSirT6Li8iw6ADVOVIR9bV0it6FelIARWUR0C1HlHg+ijX
	 rKN+ACzfhCsAQ7ctSBeUDJqEPawMaiiPcol7qN90ZT1+H9WdoZvwnN+8h3R07+Im1El8j
	 GSuvu+JEO4iq/1+ELhpIbYM+7tEHbcXpsFntzr9tjAf8NOq4KIBFhgmiWyqHm/e78PE9w
	 HKJyjIFqNpqnoFcHZ31RPYdodEoBmbwzTgwS8r1EEatNjCwGzbXl5PiLd43EOf6IkoWFc
	 W8cHmNTOZNZl9Xfn3Np16TaM2ySYfH53mEuH5Sz3nVef9fkQBe+B7hXsp4SHCcOvZow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=1UOYu9Q0PzRdpizvWhSKuoToUBKIjH2/MZWY5nBexs4=;
	b=nrdwLP9eY4ZyzkBwAMAJFAzOakk15FANfUq5qqSTJFuyX68knckY6PD5mPCXwyPlShtm
	 3Wp9NETfcKbYJmVEqs6qzXbwV5I8Rq3y7N4uAJ+jrlYCA3QGPb/yDzdIgkiBXAeLVErjE
	 wAh050UZGF7sOiw24jiNt2H59FQeTrA7w9x1zHGTFn+DpBd9R9yvP00nIUMNnrpi6kKo6
	 tdq90klEapPmZuPJBIyCCDIrtux3fGfimbxFQmaXYEGpuGmSQoV5tdb/KgMeymtpCw69J
	 5TYI1eI3PxR/g3Zm7gMAKTAmIPqTF7ZxUzMYGy3fXnnk2G7xXwGi5hYm1V3E5Pdh0dA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W4i2vNRG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.72
Received: from mail-lr2-f8.google.com (mail-lr2-f8.google.com [74.125.230.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28483606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28483606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W4i2vNRG
Received: by mail-lr2-f8.google.com with SMTP id 38308e7fff4ca-3ad8a138a11so9903001fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:00:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795093238; cv=none;
        d=google.com; s=arc-20260327;
        b=FRfbOicBAxqzPWFYHs5XSSYb3HOzj+vbfKroilEiYFBxxujnbQ/7J63hrJ8k6z6gku
         By7txnvVPcJg0SP0BN09ceS41nnDXefACPbsP9o23eGwR8v6+Wz/fCWJqLIL2Kp+J8Q3
         BM1+WxYc1RpBYVkCCFljs6AFoET7+MnSdx28LDB2l6aF3aOBWmp3TebMRs8JddChxtpb
         8qb3AReD7rMRuYmoCYTbRK3de+AH7XdBFP0jJ+wjO9yRT+hXMZTwD32gCeCQpUVANIw8
         GSEI1N5qDla9PmLmAzLWn8NDRGpb/FRoxDbX/1KsXMZtRYaZ/jD2RH3V232jP8Yhn9IL
         fCFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=1UOYu9Q0PzRdpizvWhSKuoToUBKIjH2/MZWY5nBexs4=;
        fh=KnnwpCq/e0JC5St7pL8W4c71azKlz99Hlh145FZMeuY=;
        b=q+Oc6qB68WcovHNLq+cArc/YQtccKeExAtgj64RNWt1oMUx4JqXuw54LBXqbC6VWIf
         F7P4IGIE4Bxc0Mhe3Kz2AKtjd0j8fJv2/0XnIg00TtJH355g6cNFrAVSvGbeoK6gQYxq
         aiUecUGEf2GirLUiDiem+WpRuua7XckzwrVzDZFJSLu3nk0wyhl4+1+Z/k9S1sZZmYF/
         GvEg8Frg4ENzbcyLt1DUs7ckYrQvgDYXz5BQJzY42UwEYmLjUPxNKTq+bY9X6McqKBAY
         ccNH3NkCZR8l3J/LhAZQjmabgaTRVbWnNMAYXl5XhdpjxdVfAjYDmFQWDKyyxJE/8wcP
         Ef7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795093238; x=1795698038; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1UOYu9Q0PzRdpizvWhSKuoToUBKIjH2/MZWY5nBexs4=;
        b=W4i2vNRGz1VcqI2PzL2wcX1fQmADzxMPkXdRT9Ul5nKPEuEGzf9Goqcjj0n4hlR4pK
         gwWNz055jx1EeEyMN+cfw/H+a8oSZNFrjHJSBLofDaCjgoDnVl2H8FizK7KUY8HuB7Bk
         PhOleAJ2QwQNv3DZFmxkSesDMl7dABNLJX6hoi6fQyx3FyOwt3o8GrQCJ62Xbt7g6AXA
         EdD1mniUjJRsur/N+wWAofLPoK1Ri3fofXccu9CekFdBD20QQatMsHSnC8EPaY37um1J
         PsKKR+YE+4EWziUupLWPX2gtQ7MvYwTvaaAgicQaW6szQoSQgDW7OHTOYgwIMxZtup4F
         vk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093238; x=1795698038;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1UOYu9Q0PzRdpizvWhSKuoToUBKIjH2/MZWY5nBexs4=;
        b=z7PYlACaBZrEV3ZRlgT+U/LEhV3Asl0ydYj8qWj+T+KxONlF2+4vDg9zxoPOUOK+br
         a76kE8XmlCjOFGyHEmM3+910ZtxApqs2enYLwDIpQth2JX9fOpmJkzeUHfbE9vULlrWm
         0IbjTqNyfg14pS4EKn5zqkk0txafNM7voQsyQYHHPR/nDyp8KroD2RdenM4g12czYnmN
         ywLKGi0+ZwA3IjvIxm8cRwaaLp+/BAlukuSD8IiqmrkGYNWw0vB4qFI8mMh32OtJNOlM
         N4pnW+hjBYL+fuS1kgSzmf5sctcINVTNbrKpUt9K7gSSZFRQEMkFi17DwPLFFkH6EQ3l
         4tXA==
X-Forwarded-Encrypted: i=1; AL+hErHYtDFGPtzSfJz54Cz83UCYfhd2e6TM1qF0n7DiZY76dIRfom5US+dCw+I/Z1XJW/Xa7LTKAqr71jVFv0k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yb54tdENJpr52MJnlrJNJNsAZD5Hln7OHltaJqJPc11bHH/cd
	xiDd9QPskQyn95zfUELw0rqbgRTHjWNtFmh2DAk0xwKoPK68XYUN1SlgYA1kD31wQNIA3UBnwbi
	qYWoi0h9qZe42ZHFbZOuNYS1zTqGFfOg=
X-Gm-Gg: AYBFou1WQgukQwbTpRycFrTD6lAUkn/uq8mAtnUj2AawrbQKOcRm/u7mmnpvvT8ZPO1
	kta/j55g/7FaknmnLxZnzwv4xx5H0KFZmAWb/8ZWT/zeTlL3Tj2ipd2q3jHleFWLpa/uaqDvFcd
	IBlthUqsFPb79B0Gbb6+h9dvWrPcyH7rlVPl7H1iEyVw0nH6fTbpsbhDabdVZwzbELyaPy+eIyA
	pVnupFXk+FRa1rcYT0HhgD+xWz0p/7UsxOPvezArsbCK/y23Sx4tfC9pi5Mh9pgKQ0c+qrbpFDM
	tvdtpjfCxj/LNHjRcXm/Kigp4ffuNaC3FzSpb731NEfe6iRXTtT5jJ0UJXgfw9ZZmfuzF8xmHSh
	EKRB9DtOZq6V2jnr5QZ4B111nOrFdjWXDf41PyZBD5hUeYZmjhsiHeD/52QlTg2JqL8d442ORzw
	lenvNxuyA1imM38g==
X-Received: by 2002:a05:651c:a1a3:b0:3ab:2d74:720 with SMTP id
 38308e7fff4ca-3ae670e5029mr19241561fa.19.1795093237878; Thu, 19 Nov 2026
 05:00:37 -0800 (PST)
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
Date: Thu, 19 Nov 2026 21:00:20 +0800
X-Gm-Features: AclHuK8RtgM76QuV3Dn0Ssp2PetiT1giOj3_nSpsgXYV3CYN6aQRAYBMJyAxvJI
Message-ID: <CAO-4RZ26E_nHitssH-itT4Kjy0uAtQzG0_+uH210HiiHV6K36A@mail.gmail.com>
Subject: [BUG] INFO: task hung in f2fs_write_data_pages (fs/f2fs/data.c:3834, v7.4-rc3)
To: jaegeuk@kernel.org, chao@kernel.org
Cc: daehojeong@google.com, qiwenjie@xiaomi.com, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hi Jaegeuk, Chao,

We found a reproducible F2FS writeback hang on v7.4-rc3 with syzkaller. The
recipe is self-contained and reproduced on three independent fresh VMs; no
state snapshot is required.

Repository and reproducer:

  https://github.com/Zheng-zheng-codes/f2fs-write-data-pages-hang
  commit ff85a8d2e8d444ae78308f084869666cb9acc514

Hung-task report
----------------

The primary blocked task is waiting in `__f2fs_write_data_pages()`:

  INFO: task syz.2.19:29337 blocked for more than 142 seconds.
  task:syz.2.19 state:D stack:24760 pid:29337
  Call Trace:
   <TASK>
   __schedule
   schedule_preempt_disabled
   __mutex_lock
   __f2fs_write_data_pages fs/f2fs/data.c:3834 [inline]
   f2fs_write_data_pages+0xfaf/0x14a0 fs/f2fs/data.c:3879
   do_writepages
   filemap_writeback
   file_write_and_wait_range
   f2fs_do_sync_file
   f2fs_sync_file
   vfs_fsync_range
   f2fs_file_write_iter
   do_pwritev
   __x64_sys_pwritev
   do_syscall_64
   entry_SYSCALL_64_after_hwframe
   </TASK>

A second task in the same report is blocked in `f2fs_fallocate()`:

  INFO: task syz.2.19:29526 blocked for more than 142 seconds.
  task:syz.2.19 state:D stack:28664 pid:29526
  Call Trace:
   <TASK>
   rwsem_down_write_slowpath
   __down_write
   down_write
   inode_lock
   f2fs_fallocate+0x347/0x3ca0 fs/f2fs/file.c:2116
   vfs_fallocate
   __x64_sys_fallocate
   do_syscall_64
   entry_SYSCALL_64_after_hwframe
   </TASK>

Important lock observations
----------------------------

The first blocked task is waiting for the per-superblock `sbi->writepages`
mutex. The lock dump also shows another task, PID 29506, holding
`sbi->writepages` together with:

- `sbi->gc_lock`
- `fi->i_gc_rwsem[0]`
- `fi->i_gc_rwsem[1]`

The NMI backtrace for PID 29506 shows it in garbage collection reached from
writeback:

  f2fs_get_node_info
   is_alive fs/f2fs/gc.c:1163 [inline]
    gc_data_segment fs/f2fs/gc.c:1642 [inline]
     do_garbage_collect fs/f2fs/gc.c:1935
      f2fs_gc fs/f2fs/gc.c:2047
       f2fs_balance_fs fs/f2fs/segment.c:475
        f2fs_write_single_data_page fs/f2fs/data.c:3433
         f2fs_write_cache_pages fs/f2fs/data.c:3665
          __f2fs_write_data_pages fs/f2fs/data.c:3841 [inline]
           f2fs_write_data_pages fs/f2fs/data.c:3879
            do_writepages
             filemap_writeback
              filemap_invalidate_pages
               kiocb_invalidate_pages
                __iomap_dio_rw
                 f2fs_dio_write_iter
                  f2fs_file_write_iter

The relevant source in `__f2fs_write_data_pages()` is:

  if (__should_serialize_io(inode, wbc)) {
      mutex_lock(&sbi->writepages);
      locked = true;
  }

  account_writeback(inode, true);

  blk_start_plug(&plug);
  ret = f2fs_write_cache_pages(mapping, wbc, io_type);
  blk_finish_plug(&plug);

  account_writeback(inode, false);

  if (locked)
      mutex_unlock(&sbi->writepages);

In this report, `f2fs_write_cache_pages()` reaches `f2fs_balance_fs()` and GC
while the per-superblock `sbi->writepages` mutex is held. Other tasks then
block on that mutex, and the fallocate path blocks on the inode lock.
We have not
confirmed the root cause or a fix; this is the observed lock dependency.

How to reproduce
----------------

  git clone https://github.com/Zheng-zheng-codes/f2fs-write-data-pages-hang
  cd f2fs-write-data-pages-hang

  # boot v7.4-rc3 with the supplied kernel config
  # using a Debian trixie x86_64 guest

  # in the guest, as root:
  syz-execprog -procs=8 -threaded -repeat=0 \
      -executor ./syz-executor reproducer/repro.kernsight.prog

`-repeat=0` enables indefinite repetition. The hung-task reports appeared
after approximately 205-206 seconds in the external verification runs. The
recipe has 141 entries: 140 replay programs followed by the testcase.

Verification:

- Main Kernsight pipeline: attempt 5, `confirmed=true`,
  `status=verified`, 140 replay programs, 2026-11-19T08:05:41Z
- Pipeline verification scope: `snapshot_restore`
- Independent external fresh-VM verification: **3/3**
  - run 1 hit after 205 s
  - run 2 hit after 206 s
  - run 3 hit after 206 s
- A run was counted only when one hung-task report contained both
  `INFO: task ... blocked for more than` and `f2fs_write_data_pages`
- External serial logs: `external-verify/serial-{1,2,3}.log`
- Target checker: `external-verify/verify-logs.py`
- C reproducer: not generated; the syzkaller recipe is the primary reproducer

Kernel/guest details:

  kernel: v7.4-rc3, bzImage sha256
    0c16409f8aec508ac44a63e631c2bd352536401f3fd0856df1d839fb953a1882
  guest: Debian trixie x86_64, 6 GiB RAM, 4 vCPU, QEMU/KVM
  boot: oops=panic panic_on_warn=1 hung_task_panic=0
  config: CONFIG_KASAN=y, CONFIG_PROVE_LOCKING=y, CONFIG_F2FS_FS=y

Thanks,
Zheng Zheng
