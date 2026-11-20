Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795173901;
	b=e7yBSEiXT4YE1qBJN1HT5hw+9dDRctPszKA6DzYAF5232sbf2B4/BB9H+E+5nG+8zU90
	 rBA5EGX1P7/j09vz56mxxbxtufZBzGXo41FuixgCJWSkQoMIH4ImVkIGuK8Lw1b2jCqqA
	 f74QPWLno1R5AC8ipcra8R9RxW3OQuRIjht3kisOgZhfmtvm8NKo449GtC5pdqi52jfPt
	 2ptfCO6vv0hGzZ10IgNC72GOaoaTkCWjfQqbfRXET1TZy0dFks8+KDq1QXkcoI0Ft+YuF
	 JyOEeHpId+L39/PrJ7berN3Ys39WhP1GHXKnIu7ffNyUt/EtsSHsxZLHdEJccMFLelA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QtxjPtWyAORLLdXxS1zO3pkCCQgK9BiQlfjTBORq21Y=;
	b=jerOanHQdPZy4ovhC1vptSt7qP25TJXjfy/XE5mzR8/p0N8+mTUR4i8+WYghRGarAd0o
	 1vLTPtRiJXTYhwhQ/gcdttAHuAy2zbbzSKvuuGtaUxG5NPgytoRBOUnsciDej/9ZItYc1
	 +HzbShAs/HUXmMO8ormObBGrEwXkOyOyrXvqpZXUv3yi3DjGwljdJDkIsuh8B+Q+7FYtW
	 RfxIc0ABA/4IoH8NA0ART+cx0Y34rGUws0la5kdnS26K8sK7MQGz4ufzHOBiPgWIIHprR
	 gO3iPIgLgUYRT9AlVYAFPc/gaKdTm2UDEkLYG82k82g6Mt8FZshxwuZ9RqC/SRekgvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZYX6o4lh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A478606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A478606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZYX6o4lh
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so5793995e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:25:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795173899; cv=none;
        d=google.com; s=arc-20260327;
        b=BIn1o9O9qIeTvJ4V66Y7MfXPMie+ZAfpJca1o7qzQS9sWDJ/fFrELKqfN1YypOOOSR
         uIzwgINmztMwWRGXtihVJdzDQDD42EAiO1hhmF/lajoOA+Kj6KV35GQB5sCMwFrf4CcB
         IKKLViSrarMPMHfvE+6n6MtxkgdD68EvSOOf7r7pge8wDMXJGcoZJrn8/V/9NcJWJsKP
         55gHqkUPoq3lv5iYje1AsMtaPDKKY63bA26UA+U9Tt68UP/H3N30BNsLZi4ryEwimjdZ
         rzF9mUSSD7FR/nnjXR2pqk58/a0VYZcwPMjNm2J9C0su4GxKvae64oX//8rktJMF/sbN
         1DSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QtxjPtWyAORLLdXxS1zO3pkCCQgK9BiQlfjTBORq21Y=;
        fh=DXWszXwVNgHxkKR929iAMwVrHlDpK//8TTfPjZMeQ54=;
        b=ZrIvkkDp6zEDeGYYffCKfbNIg1Z9hga/uJCy9I/i/b0qDz2zcwrM4f7oBpNpxxI2Mu
         PstkA4/Xf0GKC4VtVQR9hSvvKzPCNLGAWGnBxjIHmfBtXOOcouUHVWHVFxhlLPgZDHRs
         4A3iZoBZrtFugMxR2+ASnnbzNNJM3UPyrHm2PWsNvhO2oJB6LMJCV1dcyh0qNgcAJkBQ
         9esadg7QMKaVs2raBCp3buqfQoOpAU9ZiIcdJvdOhAabpfK2ZApKGHhv0ihKI+anMLQK
         s/r/sIQKN0yD69kJhNQm7BVooolLs8T7NAjSBdm9iWQS++fngE8gPdSeomyDCZHmERtw
         NaPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795173899; x=1795778699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QtxjPtWyAORLLdXxS1zO3pkCCQgK9BiQlfjTBORq21Y=;
        b=ZYX6o4lhmeOQeWdznHmyaZLd4Rk3J1q2E8T0FvsLzBqC+pq1lIlrU2+4AvMCIGLeMu
         jxmnizU2cQ9Tzf+9pS10mXnkYvswFAR9R3bdCi1aMqSwE0aPii7MgkJVGnHFrhP3dTpC
         eBFTWCnU9AL5MTVuE1YRMktGQrgUfd53U0srC2HXpAsvQXaGkAb/8nvB4yjdkYd+EgI4
         GROSDhXNN7DToDT4hHHK8li3OGFEkpmcfqkR2vuwZv56hZBhxl2tkBWNRc8uqMMFUey8
         OCh6jCqQPUe1IBG4m19xWs55VprqYxorlG2E8kqyb7RVa0IrtV50x+WR0j/0sAM8SfSX
         oBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173899; x=1795778699;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QtxjPtWyAORLLdXxS1zO3pkCCQgK9BiQlfjTBORq21Y=;
        b=utzPnT0SC5y46KAmyudhfs1HnV32fvBrypq9wFjoeZrGmZc5BpSoOQfcdwcEaxe+Ym
         6GILmX4mX7Vx2ja72XJ86AHGN2jSb3U6/8IDteqZLaDwdNvJluD6naegd9LvzxJxl9h/
         NyzTgDg+58dxVV71n1KVZjziwYrwBXlZQ0v5ojKdjnmC+VuXmtv0cGgqX3T/BaVNPSLi
         8QnrjHfM5sPQtn6XrfUZSK9fA8UM5R92WeZ2WbeaLNZO8WNUwVzbdk2rv05fbyC4svjD
         uUjcHQpeAtFvkMoDa7Z6gGyxkkJWQxAQCCkRDNgVZs9DK1T89wYbTeQT2tAmkO+WxCwr
         0RTw==
X-Forwarded-Encrypted: i=1; AL+hErGuanJn4de0gVg2GaUoQ4Z0CesGk7C8uPraCf8AMPUyxD//J0ZFqy2oi/NprMu8aA1CUrQqNUuatart1HU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SuQaDW02R4ESgS4DMqz2YjNU0qw5+J1AMLtRLUIhx0RwEE+xn
	fJYJ0fUHsrxMm16btnVW2ove7/wzfrFtR579TUz/6e7FQ7xf+YGa9u67KIYZ0zkNJjPlEDvNSQQ
	2wKXY/ZLhbEdiuYl7ozJaMl31jdxzfqg=
X-Gm-Gg: AYBFou0jWfa7XOL16XpJt8CzpWH32eigCV4dZrQcqKbbD9bSMaAHRsEdNDF7OynGuhp
	Ij5Zf6PjiqNll6Sfk6U0JKwInR/kZwTwBwyI02d4hcHxfxuNMKHHotQHjTGG8PGGlqAil8Y1JuO
	I60PH3BCzC0q0g7UGBoaqhgnQmdB4xy+6GgfE670SUBTg3WKQCl84OVL6ztZ/QCexYVfHSG2edk
	JSU0PXbMoT1w1PW7oMQo0XuQ712fNM8iedzgnp9QMjtzZSkiu7ydSq7npRPUIZXMrWeQ7XvLc3e
	nHAcpRWLunvdYLSYwG1CFuCg9tgNLmS5wKdGIBc0WtMfsyJdoXMLcxavwWwjFO7wMLFyGaYHskH
	FP8h40lxB5qYgB2kCPRzMb/Wtc9OQfU4/EVtC+w==
X-Received: by 2002:a05:600c:a088:b0:4a2:1a:a120 with SMTP id
 5b1f17b1804b1-4bb8880ac02mr60110345e9.6.1795173898451; Fri, 20 Nov 2026
 03:24:58 -0800 (PST)
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
In-Reply-To: <CAO-4RZ2pjEOpTBzqca5UxZHtaFS2Dj9zmNj1BtjvKm1yFE7_Jg@mail.gmail.com>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Fri, 20 Nov 2026 20:24:39 +0900
X-Gm-Features: Aa3M54pngFl2bEEaSiGVCZXRR4_jUeP31-DZipStF-kFqq9kWuqVkgu-WIQdrq0
Message-ID: <CAKFNMokyeDzig1aJMjTN0nid4DGdnFPKC9G-xk3L30yMikgpRQ@mail.gmail.com>
Subject: Re: [BUG] INFO: task hung in nilfs_transaction_begin
 (fs/nilfs2/segment.c:221, v7.4-rc3)
To: Zheng Zheng <fengaojigui88@gmail.com>
Cc: slava@dubeyko.com, linux-nilfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 7:59=E2=80=AFPM Zheng Zheng wrote:
>
> Hi Ryusuke, Viacheslav,
>
> We found a reproducible NILFS2 hang on v7.4-rc3 with syzkaller.  The
> supplied recipe reproduced on independent fresh VMs.
>
> Note: This hang may share the same underlying root cause as the
> previously reported nilfs_segctor_thread hang (issue #182):
> https://github.com/nilfs-dev/nilfs2/issues/182
>
> Repository and reproducer:
>
>   https://github.com/Zheng-zheng-codes/nilfs2-transaction-begin-hang
>   commit f1065fd59515bd55bbb5141b45e979bc0b3c9993
>
> Hung-task report
> ----------------
>
>   INFO: task syz.7.24:13081 blocked for more than 142 seconds.
>   task:syz.7.24        state:D stack:23176 pid:13081 tgid:13075 ppid:1034=
4
>   Call Trace:
>    rwsem_down_read_slowpath
>    __down_read
>    down_read
>    nilfs_transaction_begin+0x323/0xa00 fs/nilfs2/segment.c:221
>    nilfs_write_begin+0x78/0x1b0 fs/nilfs2/inode.c:228
>    generic_perform_write
>    vfs_write
>    ksys_write
>
> A second thread of the same process (PID 13109) is blocked on the
> f_pos_lock held by PID 13081.
>
> An NMI backtrace of the semaphore holder (PID 13190) shows that it is
> executing the NILFS2 segment-constructor path through
> nilfs_clean_segments(), including btree/bmap propagation:
>
>   nilfs_segctor_apply_buffers fs/nilfs2/segment.c:1010
>   nilfs_collect_file_data fs/nilfs2/segment.c:589
>   nilfs_bmap_propagate fs/nilfs2/bmap.c:329
>   nilfs_btree_propagate fs/nilfs2/btree.c:2128
>
> The lock dump identifies the semaphore holder:
>
>   locks held by syz.7.24/13190: 3:
>    #0: (sb_writers#17)                at: nilfs_ioctl_clean_segments
>                                           fs/nilfs2/ioctl.c:869
>    #1: (&nilfs->ns_segctor_sem) WRITE at: nilfs_transaction_lock
>                                           fs/nilfs2/segment.c:357
>    #2: (&bmap->b_sem)                 at: nilfs_bmap_assign
>                                           fs/nilfs2/bmap.c:373
>
> So a NILFS_IOCTL_CLEAN_SEGMENTS task is inside the segment-constructor
> path, holding ns_segctor_sem for writing while doing bmap assignment,
> and normal writers cannot acquire the semaphore for reading.  In this
> report the segctord thread itself is not among the blocked tasks.
>
> Relation to the earlier nilfs_segctor_thread hang
> -------------------------------------------------
>
> We previously reported a related NILFS2 hang:
>
>   INFO: task hung in nilfs_segctor_thread (fs/nilfs2/segment.c:357, v7.4-=
rc3)
>   https://github.com/nilfs-dev/nilfs2/issues/182
>   https://github.com/Zheng-zheng-codes/nilfs2-segctor-thread-hang
>
> Its hung-task report showed the constructor thread blocked acquiring
> the same semaphore for writing:
>
>   INFO: task segctord:35823 blocked for more than 183 seconds.
>   task:segctord state:D
>   Call Trace:
>    rwsem_down_write_slowpath
>    __down_write
>    down_write
>    nilfs_transaction_lock+0x25d/0x410 fs/nilfs2/segment.c:357
>    nilfs_segctor_thread_construct fs/nilfs2/segment.c:2601 [inline]
>    nilfs_segctor_thread+0x600/0xa60 fs/nilfs2/segment.c:2716
>    kthread
>
> The two reports involve different blocked tasks:
>
> - In the earlier report, the segctord kernel thread waits
>   for ns_segctor_sem in write mode in nilfs_transaction_lock().
>
> - In this report, a normal file writer waits for the same
>   semaphore in read mode in nilfs_transaction_begin().
>
> In both reports, the lock dump identifies a task executing
> NILFS_IOCTL_CLEAN_SEGMENTS as the semaphore holder.
>
> The new external verification logs also repeatedly report:
>
>   NILFS (loop0): error -28 cleaning segments
>
> This resembles the repeated -ENOSPC errors observed in the
> earlier report.
>
> We suspect that both hangs may be manifestations of the same
> GC error-handling problem, but the root cause has not yet
> been established.
>
> We would appreciate your analysis of this additional
> reproduction alongside issue #182.
>
> Reproduction
> ------------
>
>   git clone https://github.com/Zheng-zheng-codes/nilfs2-transaction-begin=
-hang
>   cd nilfs2-transaction-begin-hang
>
>   # boot v7.4-rc3 with the supplied kernel config
>   # using a Debian trixie x86_64 guest
>
>   # in the guest, as root:
>   syz-execprog -procs=3D1 -threaded -repeat=3D1 \
>       -executor ./syz-executor \
>       reproducer/repro.kernsight.prog
>
> The recipe requires sequential execution with -procs=3D1.
> Using -procs=3D8 did not reproduce the hang under our tests.
>
> The recipe is a state-reconstruction sequence (72 replay programs plus
> one model-selected priming program, followed by the crashing testcase).
> The crash depends on the kernel state built by the recipe; the testcase
> alone is not sufficient.
>
> Verification:
>
> - reproduction run: two attempts verified (confirmed=3Dtrue,
>   status=3Dverified), 2026-11-20T07:17:00Z and 2026-11-20T08:05:31Z
> - independent fresh-VM verification inside that run: 2/2 target hits
>   (2026-11-20T07:46:46Z and 07:50:15Z)
> - stability on fresh VMs: 5/5 reproductions, 187-194 s to the
>   hung-task dump in every run (2026-11-20, external-verify/)
> - evidence: reproducer/repro.outcomes.jsonl, external-verify/,
>   logs/external-manager-session.log
> - C reproducer: not generated; the syzkaller recipe is the primary
>   reproducer
>
> Kernel/guest details:
>
>   kernel: v7.4-rc3, bzImage sha256
>     0c16409f8aec508ac44a63e631c2bd352536401f3fd0856df1d839fb953a1882
>   guest: Debian trixie x86_64, 6 GiB RAM, 4 vCPU, QEMU/KVM
>   boot: oops=3Dpanic panic_on_warn=3D1 hung_task_panic=3D0
>   config: CONFIG_KASAN=3Dy, CONFIG_PROVE_LOCKING=3Dy, CONFIG_NILFS2_FS=3D=
y
>
> Thanks,
> Zheng

Hi Zheng Zheng,

I have filed it separately at:
https://github.com/nilfs-dev/nilfs2/issues/183

Since these GC ioctl reports involve destructive corner cases that do
not occur under normal userland usage, we are addressing them
step-by-step at a pace that does not disrupt other tasks.

As these reports seem to stem from the same underlying error-handling
issues that I am about to investigate, it would be helpful if you
could hold off on further reports until the initial fixes land.  That
will help avoid duplicates and allow us to process the reports more
effectively.

Thanks,
Ryusuke Konishi
