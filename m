Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.74
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795174821;
	b=wCaSjScUJk1LJHoaLxDV+hxbw0cg3SNJZYrrcX1+R5TZBm2WlABARbbJsx6UFNjiAjHS
	 2ypIgzMA8N2GZtFDykTMSXyn/TzlP7y/j7e9So3owpousXx7ybcJDGOrCJfaJIvrs1dgs
	 UMKxNoHorZYqxqyNBHCnfSsRmFDnXk4e4XEiKCSSjtukSawgMk4vQr5nW8ZINOhxppRCT
	 qdlbNyTnYvDEjTqAfSwnaBOpOXfU8zavGldQjmRy72C8Gun2fVbk28N9cFnfiZ7mkwb1l
	 TBeSK3dHiTaPpkJIhFpAyXfD/Y9BHDcNR/DhBDmm3/iBbBCjl+Epw+6Ujuh26mBR/PA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Z4Hs0AMb1kMW4WdTQeE3PCBfUoM3AfjkJbzZFN5bqrs=;
	b=iDq1gNnaR0y29wywnNZlrtkmmJv+BYYTLyu7jMs8kLF4t8zin2Ln6ynjcfc3PYua/kKk
	 mEeyJnETXxydXHo8rTjI/I4rnzddLrk+qcQJnITF3UCr/T3S6OC/k+TxZtdmzV7zUqFsV
	 izi7tWUcGwvEaDeLW7IOSoi8ytEXUkAEw8bmUefP0sqzrLXVBJTVDMHlYH1ZzEY/42HUv
	 Q55IdzO8UaAm7o/R7kQBJl+MCLlMyBgucfovjTpK5iQzXMErscwJ13d3btGw0gEh9GJg2
	 pW75Oqq2Mc854sli5K7cUuLZGRcEXt5a1oonebE8+qKN8eBSdfad4/lFOVppibUjcyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IjGMij+x;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.74
Received: from mail-lr2-f10.google.com (mail-lr2-f10.google.com [74.125.230.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22B560A261F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C22B560A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IjGMij+x
Received: by mail-lr2-f10.google.com with SMTP id 38308e7fff4ca-3acff0d1090so2009371fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:40:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795174819; cv=none;
        d=google.com; s=arc-20260327;
        b=irc7jKOgZrpm+x7LGvY849nWGK0ninQq0GrYr8rM14FHw9a/SMFw+xBT17wdFIpFSV
         10J5LSGjw8bZ5cAJNhe33gxKcKW92Yv3U1MNwoKLE/fZ0R4FYy5aU5tmJSFRUnxFohh0
         YFhELPcraZZm+t9d+7/r6Kz5UJ0oKQjL45FyyIm2OFUNfyygjMprhnDrNtmNhN4f7JON
         aLaV/w1q7UT2NKVqHAih6xdQv73PDn8MvLILDvbzu13kPlw2g8HFqaXNx+uzWfjzbIZV
         ta0zUkMEgddpNVhhGUYgEDCx3eM8zKcFljbFYV54652UUS9RR/PRehip7K7jcAnTuxT3
         KfDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z4Hs0AMb1kMW4WdTQeE3PCBfUoM3AfjkJbzZFN5bqrs=;
        fh=kOE2LK05thptyaxWdImdvss1a/kFt1sNcQzKihIhYS4=;
        b=cR7TpqTq4GrcfavlGWnwhc9OL8WHy4kPlEy2VHJ5z6H1px53J1eK4ANhpz1W/XIz3g
         ObsT8VV7naFK0xx555IoYTw8ABA2TpYSpBpyIJHZDqRFHAZIu5XIzeFz1Z3+lhLI3GOX
         /mk/hQOTi6ENgwjPhcj4ZZIIygBwBbUD5yyT0J6yHqvDUWElXYSkMbRefp0W9Ycccjbm
         MsMZuLNzPYRgkDcqbHxFGMi/GRH7BIA6TI5LHk5dFIUeJISRK5iXzKQtkz2IY8+MJSRc
         Xb98jiA9HL61swC4LUoRJ5ekWqYqIHezUyYzbOLW0+UEGx3+T6BydUkmArKNtnYMlhoM
         QGIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795174819; x=1795779619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z4Hs0AMb1kMW4WdTQeE3PCBfUoM3AfjkJbzZFN5bqrs=;
        b=IjGMij+xQiahRALuhL3J8vSuiYjSYYcm3uzqxGbtOVRTSLzmTn2E0f9TGBP0nfT8qU
         myll0GYzH1AEqExS/32o/T/LeMPU4LdqTCkfYwD3hOctVeKsHzrpCQZes+qtc3oWwCsI
         DRsbwCM6BkzA0HoXjAGcx8EoxcM5rH7Y9IOfqg1JUO39e0+rVxBjBex+w/vKPwBJFqKL
         WXIdI2OjP0vEBn6FtVFYxg1CJ9MdA4LJb3UnoxmIYsZ2TpYs6OOFTRSmAWeX4Gq1s1q5
         /3/A2h1MiRBjyCKotMhV0PmsctM9W2ClkLO6X0hg4pn2j6UdZXIvDtugFfKLhyVXO3Z9
         SMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174819; x=1795779619;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z4Hs0AMb1kMW4WdTQeE3PCBfUoM3AfjkJbzZFN5bqrs=;
        b=IAreuPBB4Ut0XLdtLSd7zTzF3GWYyhjYWSm3QAlnsguMpIrwHNBMuAWn1cUES0yoLy
         e/mMnV6N0CFAqw8SUzkgRI/8l33drfHtshDMPNC9fLMgFhWRlSu7wld/B7io4dq/v+u7
         a5ha1j0TL19Voos/SA46HV9hdCywAmRWmp17JFwz8zXpHHK5zUVzbsjBXVTQkTJXz7E5
         XA29r72nvFjWOFzYke8SwAYBExYcA+CCaBCze8y13L3b/YdtTX0hJiHN/qimubxjLfx5
         qpDG/7aHJte3hsAVtCLXAR1NzZi3HygTTCtm60t+ePh3MgfsGTMHXiZ8mMh0JVtraHBT
         f9bQ==
X-Forwarded-Encrypted: i=1; AL+hErHlYcNaBZkizQFP3vZ9qYOZDdAxro1U2wKn8s6yV+ygG3TXX34+JFktMJiGA+cYzw1SysJ2HOmdLlfiCGo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZELMIqQsuuXX5AtL5/pZqSF3HIRZZ9K4/NnsPjKWiLca8V3o8
	zhemJqyN8X9KobAqCOe4YDXq7lulCGqRqG/oOG+dLuaN2Cnjty/WmYe8UVjuZYoGUZo8X3ostyG
	K65cusq1oBuUZrwk3IYaGyXYwqtWlEGg=
X-Gm-Gg: AZFdTZe2gF748YhiHFUPMpduzAto4s1xhzxg073l2b1EP5glsX/bEFsR1esLWP7qzgq
	d7Gb9EFZjNi0wxTbsL+nHHI2bHK0MJChsef23oS/8WjuQ066kOtIkm6ekoolUzB3ocyD4EoTYte
	PgrCSIZV6/EPeY03iyktkF+q69RRZNFsUEnQM6xczB+ON2GwM4h2ZW5PTp+bOP3iYChveEYI2FR
	KyL1raVjYEMnsaHv2b36UWRETFB8qhAkCGMQTdcN8V6dXJ5IBC3bYFBDxhDIaKf/zHzCD0N4zp3
	4J7gp42r4iK28MouoQIPOpwtUx9MjCIwB+AM/TpTvnlefxNhpBwvNLBEXb+qb88U9IHFhSTiyb9
	kG7e21vSku7zE/gtuH5BpScLSl1c0ozRstWzpsEPrqI8zR2XFSer1XTmVcNzvO+5koaeT
X-Received: by 2002:a05:651c:a149:b0:3ac:a2b0:ac56 with SMTP id
 38308e7fff4ca-3ae7fa8395dmr9647241fa.29.1795174818719; Fri, 20 Nov 2026
 03:40:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAO-4RZ2pjEOpTBzqca5UxZHtaFS2Dj9zmNj1BtjvKm1yFE7_Jg@mail.gmail.com>
 <CAKFNMokyeDzig1aJMjTN0nid4DGdnFPKC9G-xk3L30yMikgpRQ@mail.gmail.com>
In-Reply-To: <CAKFNMokyeDzig1aJMjTN0nid4DGdnFPKC9G-xk3L30yMikgpRQ@mail.gmail.com>
From: Zheng Zheng <fengaojigui88@gmail.com>
Date: Fri, 20 Nov 2026 19:40:04 +0800
X-Gm-Features: Aa3M54qglGJrDvJZPC1gUzztSx0PK6Osv1KqvrmSSZZLkAw2iBCT1CCmRAI_gdk
Message-ID: <CAO-4RZ2qK+6GQhzKwf5DO8aW0y22U4ePy5+erkfjY9YsVtex9A@mail.gmail.com>
Subject: Re: [BUG] INFO: task hung in nilfs_transaction_begin
 (fs/nilfs2/segment.c:221, v7.4-rc3)
To: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Cc: slava@dubeyko.com, linux-nilfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ryusuke,

Thank you for your explanation and for tracking these issues.

I thought reporting these findings would be helpful to the NILFS2
development effort.

I will hold off on submitting further reports related to NILFS2 GC
ioctl until the initial fixes land.

Thank you for your time and efforts!

Best regards,
Zheng Zheng

On Fri, Nov 20, 2026 at 7:24=E2=80=AFPM Ryusuke Konishi
<konishi.ryusuke@gmail.com> wrote:
>
> On Fri, Nov 20, 2026 at 7:59=E2=80=AFPM Zheng Zheng wrote:
> >
> > Hi Ryusuke, Viacheslav,
> >
> > We found a reproducible NILFS2 hang on v7.4-rc3 with syzkaller.  The
> > supplied recipe reproduced on independent fresh VMs.
> >
> > Note: This hang may share the same underlying root cause as the
> > previously reported nilfs_segctor_thread hang (issue #182):
> > https://github.com/nilfs-dev/nilfs2/issues/182
> >
> > Repository and reproducer:
> >
> >   https://github.com/Zheng-zheng-codes/nilfs2-transaction-begin-hang
> >   commit f1065fd59515bd55bbb5141b45e979bc0b3c9993
> >
> > Hung-task report
> > ----------------
> >
> >   INFO: task syz.7.24:13081 blocked for more than 142 seconds.
> >   task:syz.7.24        state:D stack:23176 pid:13081 tgid:13075 ppid:10=
344
> >   Call Trace:
> >    rwsem_down_read_slowpath
> >    __down_read
> >    down_read
> >    nilfs_transaction_begin+0x323/0xa00 fs/nilfs2/segment.c:221
> >    nilfs_write_begin+0x78/0x1b0 fs/nilfs2/inode.c:228
> >    generic_perform_write
> >    vfs_write
> >    ksys_write
> >
> > A second thread of the same process (PID 13109) is blocked on the
> > f_pos_lock held by PID 13081.
> >
> > An NMI backtrace of the semaphore holder (PID 13190) shows that it is
> > executing the NILFS2 segment-constructor path through
> > nilfs_clean_segments(), including btree/bmap propagation:
> >
> >   nilfs_segctor_apply_buffers fs/nilfs2/segment.c:1010
> >   nilfs_collect_file_data fs/nilfs2/segment.c:589
> >   nilfs_bmap_propagate fs/nilfs2/bmap.c:329
> >   nilfs_btree_propagate fs/nilfs2/btree.c:2128
> >
> > The lock dump identifies the semaphore holder:
> >
> >   locks held by syz.7.24/13190: 3:
> >    #0: (sb_writers#17)                at: nilfs_ioctl_clean_segments
> >                                           fs/nilfs2/ioctl.c:869
> >    #1: (&nilfs->ns_segctor_sem) WRITE at: nilfs_transaction_lock
> >                                           fs/nilfs2/segment.c:357
> >    #2: (&bmap->b_sem)                 at: nilfs_bmap_assign
> >                                           fs/nilfs2/bmap.c:373
> >
> > So a NILFS_IOCTL_CLEAN_SEGMENTS task is inside the segment-constructor
> > path, holding ns_segctor_sem for writing while doing bmap assignment,
> > and normal writers cannot acquire the semaphore for reading.  In this
> > report the segctord thread itself is not among the blocked tasks.
> >
> > Relation to the earlier nilfs_segctor_thread hang
> > -------------------------------------------------
> >
> > We previously reported a related NILFS2 hang:
> >
> >   INFO: task hung in nilfs_segctor_thread (fs/nilfs2/segment.c:357, v7.=
4-rc3)
> >   https://github.com/nilfs-dev/nilfs2/issues/182
> >   https://github.com/Zheng-zheng-codes/nilfs2-segctor-thread-hang
> >
> > Its hung-task report showed the constructor thread blocked acquiring
> > the same semaphore for writing:
> >
> >   INFO: task segctord:35823 blocked for more than 183 seconds.
> >   task:segctord state:D
> >   Call Trace:
> >    rwsem_down_write_slowpath
> >    __down_write
> >    down_write
> >    nilfs_transaction_lock+0x25d/0x410 fs/nilfs2/segment.c:357
> >    nilfs_segctor_thread_construct fs/nilfs2/segment.c:2601 [inline]
> >    nilfs_segctor_thread+0x600/0xa60 fs/nilfs2/segment.c:2716
> >    kthread
> >
> > The two reports involve different blocked tasks:
> >
> > - In the earlier report, the segctord kernel thread waits
> >   for ns_segctor_sem in write mode in nilfs_transaction_lock().
> >
> > - In this report, a normal file writer waits for the same
> >   semaphore in read mode in nilfs_transaction_begin().
> >
> > In both reports, the lock dump identifies a task executing
> > NILFS_IOCTL_CLEAN_SEGMENTS as the semaphore holder.
> >
> > The new external verification logs also repeatedly report:
> >
> >   NILFS (loop0): error -28 cleaning segments
> >
> > This resembles the repeated -ENOSPC errors observed in the
> > earlier report.
> >
> > We suspect that both hangs may be manifestations of the same
> > GC error-handling problem, but the root cause has not yet
> > been established.
> >
> > We would appreciate your analysis of this additional
> > reproduction alongside issue #182.
> >
> > Reproduction
> > ------------
> >
> >   git clone https://github.com/Zheng-zheng-codes/nilfs2-transaction-beg=
in-hang
> >   cd nilfs2-transaction-begin-hang
> >
> >   # boot v7.4-rc3 with the supplied kernel config
> >   # using a Debian trixie x86_64 guest
> >
> >   # in the guest, as root:
> >   syz-execprog -procs=3D1 -threaded -repeat=3D1 \
> >       -executor ./syz-executor \
> >       reproducer/repro.kernsight.prog
> >
> > The recipe requires sequential execution with -procs=3D1.
> > Using -procs=3D8 did not reproduce the hang under our tests.
> >
> > The recipe is a state-reconstruction sequence (72 replay programs plus
> > one model-selected priming program, followed by the crashing testcase).
> > The crash depends on the kernel state built by the recipe; the testcase
> > alone is not sufficient.
> >
> > Verification:
> >
> > - reproduction run: two attempts verified (confirmed=3Dtrue,
> >   status=3Dverified), 2026-11-20T07:17:00Z and 2026-11-20T08:05:31Z
> > - independent fresh-VM verification inside that run: 2/2 target hits
> >   (2026-11-20T07:46:46Z and 07:50:15Z)
> > - stability on fresh VMs: 5/5 reproductions, 187-194 s to the
> >   hung-task dump in every run (2026-11-20, external-verify/)
> > - evidence: reproducer/repro.outcomes.jsonl, external-verify/,
> >   logs/external-manager-session.log
> > - C reproducer: not generated; the syzkaller recipe is the primary
> >   reproducer
> >
> > Kernel/guest details:
> >
> >   kernel: v7.4-rc3, bzImage sha256
> >     0c16409f8aec508ac44a63e631c2bd352536401f3fd0856df1d839fb953a1882
> >   guest: Debian trixie x86_64, 6 GiB RAM, 4 vCPU, QEMU/KVM
> >   boot: oops=3Dpanic panic_on_warn=3D1 hung_task_panic=3D0
> >   config: CONFIG_KASAN=3Dy, CONFIG_PROVE_LOCKING=3Dy, CONFIG_NILFS2_FS=
=3Dy
> >
> > Thanks,
> > Zheng
>
> Hi Zheng Zheng,
>
> I have filed it separately at:
> https://github.com/nilfs-dev/nilfs2/issues/183
>
> Since these GC ioctl reports involve destructive corner cases that do
> not occur under normal userland usage, we are addressing them
> step-by-step at a pace that does not disrupt other tasks.
>
> As these reports seem to stem from the same underlying error-handling
> issues that I am about to investigate, it would be helpful if you
> could hold off on further reports until the initial fixes land.  That
> will help avoid duplicates and allow us to process the reports more
> effectively.
>
> Thanks,
> Ryusuke Konishi
