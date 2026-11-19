Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.221.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795098085;
	b=RmAtj8jFgSyPu74AmZ/h7KNDhc5Z+tE/EFzD1ZpPC6k9BSGMiQ/cQRdElAHY7sWUwt7Z
	 FguzaWXBVer2yV47LYqL+7q5yDbcpO4KCDmI5cIi9mabtlysaryma5/3XW7k4H/7Fy3fN
	 Q+l3Vzdx73lyqbxFl8if3R10lBzA+RlfKcb9fkUdIXM1dJ1ciwrhUXjW3URe0XRrImVUw
	 nRTM6CyLEL2nnSQFJJFVnL1nllm4A4SytGYxMAfGN53Gk44nbODhWgSQnoRasG80Sal8i
	 mhXdYKpkOY7mBiLQxVfkQhSO0m3pTF0wQ+2h65UQbSJC+sNhzQhf6xnQE3QH8gyfqJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=y04CS3a1J3CXqGFaQTOcHCW2uGdwJOdnkJAq0Pc5CFY=;
	b=XzfUWlUUX3zJuupLBccVQwXbu754wHqeH1y9GpiHFZaZgWd/KVRRfHYwKbsTX8/1SbEg
	 3e4sBQUaZTTiF8mty6btpPcdtKgFwgYOsearnA74695JYzXIGN7PBBM6+xDdmdcFuIO4Q
	 twEOjQofcwaDdt2jTw+oRSa+lSFwbgM6vHNzEFYzHaMBET/pRjPBEBj44MjP5MCQqiM4S
	 Mkir+ChdWiGDOXOp5qENcHXSPFblSFYPXFxSPZ+cfK/muZc+UpNPr1a2CVNGJxP/LwY0c
	 tX0/xJIcX/Xx8yFCCsP2mpMVh3TDy9FjuKFYXyIRV7CWx5rIdPLOEaWYaBH2seEDH/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IG75hVnM;
	arc=fail smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C85606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69C85606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IG75hVnM
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1313134f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:21:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795098084; cv=none;
        d=google.com; s=arc-20260327;
        b=mbvEWo/hApNyOA6wNSA7j+ZgauffLBnpWuu39SG1Ogd9rmz4QtKk3dNUktZvujIpgE
         q9m4jgYWCrUipWkfOjNxzu5f6ZTmtn/UkK6fG4prFJ6dhDl+KY52gb/9hrXYf/3CcsN3
         vsT/ZRSwz40Tae815Qo69GVjQlNfTN3XBMqhqkyy6vgKyo4X71/TFX8ReojVMVW7B8Tw
         b6bIqgiX2hwFmg5WQVHOAcG8p9uc4jUBVoh3r1RG0Y5wWc/zTJ8LErK15QOpNQMCQyyX
         ctk5vxQK+RLIvG7h7muuzv5ISqAPu1zm05K2jdYpIO/QYXj6nG4/TntrSPVEUWT6d6MW
         nQsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y04CS3a1J3CXqGFaQTOcHCW2uGdwJOdnkJAq0Pc5CFY=;
        fh=nv0BblpguT7TtY11wygPGOtTXQzAv+fu4tVVeC1wUJM=;
        b=iI1VrwDnL4MvrhQ/z2JTdaZWSRgHS2hhdf2tZaP7AoqNgKwetLyT+gmLYnisRmSWCJ
         X9MHU74HGBDO7N6RavTPHnGhIEfcyDITl40n/YyfQwHmgf0IUmVtBhcmdO56Sa3dVIxh
         FJNGVM6a5pR8TAumY4YRFemuiWjEQ4xxFKn79SugwPXKSRNfhOktHPP+dIx6VrqmbV8G
         vUR3OgNn8scpvmg2RrAQqYuuxu+KrV/TL6JAIKUkGvxMXxCsxDkxQ+GN2dzbDxfdZgvl
         1tpSAA4E9sWci8hl5unoPtxJjIM1TMDq5jZp1PuFmgDnTFTjW6mdHxe7N7WyY0DrUUUm
         G1KQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795098084; x=1795702884; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y04CS3a1J3CXqGFaQTOcHCW2uGdwJOdnkJAq0Pc5CFY=;
        b=IG75hVnM9ivavyaInozy3BqwUaU2lEXquJG5ktgX0AvFJu+BCLDa7gIxjFwvrd59xL
         GmfphVX7NJLErDWJ6nWKhM96AEf8YwYGs5yRSK0HE0lfAcyUBmZ4UOlxjRVUyN7XF9Qz
         GXl0OlT5FZJMn3ypCgmhgpLNgpdaNHEIn4QdHoAFO4pbIwb3fGp9A5gfjhe0z393taNS
         bcIDtWi/zW9vEmOoCzgQdRwIA3w1povoQ82aq5fu/00iiRiusrNeOlgvrhyHbJIGusZT
         iiRHiZk8wOss0b1TUqk0jvRCMk0qXps8Jw82/hF5iJ2At6JbsBA1WNfZof7/d76WtxCV
         iyow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795098084; x=1795702884;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y04CS3a1J3CXqGFaQTOcHCW2uGdwJOdnkJAq0Pc5CFY=;
        b=YiCt4I6nxh5fVDqlOpXADUanFJlJdubXUoUO7vZqLwZglwdxMJEhVF70TUjPsIw3Xn
         QXw6yI5lvZyOhXNKCe86Hq21C3H+x+aL/jHFSF/D0uuDRiX4fQWiDRUNUjLDh7jnY7Ur
         crvm6eas7tCPqMrzhXRjlTMpPYAa+R/+yvxMxWE4eVDf4JeLB5/cN5kEFDSlNXy0gSJz
         3VecXMKEUGcNMRsGBEQCLAkdKLoSJV+72R4BJcJE3doYZjT+icF5BHPlBie59GGZXNyQ
         wZYLiB8tX8qdxANnV5ydfev9Os/cfnWaPF8fIFIYaMN12JfylXe2lhxV97cbcWpq0jaR
         N2zQ==
X-Forwarded-Encrypted: i=1; AL+hErHPPEveDq56G+EZrhv+s6O6iaArge+Xj9Q1ses3sP/tnxjuKkMC/f+zGFfeVKQ1Lo87kHlP4IR1HKcQgog=@vger.kernel.org
X-Gm-Message-State: APuU4Z952SCn1CnnNMfpQb/Hn7tYWjKvrG9TAwPi8ZsHrQ4TUQLIjoYG
	/OCjBhcx3dl38mtlMOENV3hDeKrXgo/nA7ie3Pe4Z6IMd7gPMNkh9hoaP4LOkF94p1j8ytRk+aB
	4AM2lnBiwJ7IY/Zd41197oA2gRQXN9FI/Hv37
X-Gm-Gg: AZFdTZeknux/vMfBYzua2meRHjyUmmapxw5vtEl0cf3O2yKYZ18dXq1nIz+lgbR5iyS
	UD2mLaVYyRLrfrOf91lIVoD/hj+LnIT2lJSyQBnmlYNPhhBLcJxkwve4dCYdFCmfnATxr141ILS
	tP51JjCYIYiYVqdHZ7YTbci5EpeZXtsZ/+d4M0PQAH7R4khiQQaCviYkT8yXMfmA52uuHzuC1/E
	6yqwdrqaSbLYNiXOIU49mYZ/JQsWlDl1y96dOteDQRE/Br4kI1+WNajSPlRiZEUyG2nVsFT0xuD
	OYq1ilc94NCYnvAkOc9OKZJ+JpAHqAl9a0LW112ws/9SRmkd8HCbS8MRHpAJZ+7uq0vloZ9Lh2J
	tNBluwOFDq7jFY06G7keL/1R6gptMiOPvES0k+A==
X-Received: by 2002:a5d:5d12:0:b0:4a7:14d0:9c4c with SMTP id
 ffacd0b85a97d-4a714d0b8b5mr11508333f8f.6.1795098083499; Thu, 19 Nov 2026
 06:21:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAO-4RZ1Q-HzRCd+S1uHZJRdN-ZCtv47f=pXTxbq4YaJgn_DALQ@mail.gmail.com>
In-Reply-To: <CAO-4RZ1Q-HzRCd+S1uHZJRdN-ZCtv47f=pXTxbq4YaJgn_DALQ@mail.gmail.com>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Thu, 19 Nov 2026 23:21:06 +0900
X-Gm-Features: Aa3M54pK07kbY1LM2qYIEccGv9secMekg3Dfzg9Ys1fOO7NnwNajglNV0FmzpIw
Message-ID: <CAKFNMo=LGQMgGK5_dj+wgByYBx8YxkOH13rXcqZ-cwAjff0ZDw@mail.gmail.com>
Subject: Re: [BUG] INFO: task hung in nilfs_segctor_thread (fs/nilfs2/segment.c:357,
 v7.4-rc3)
To: Zheng Zheng <fengaojigui88@gmail.com>
Cc: slava@dubeyko.com, linux-nilfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 11:07=E2=80=AFPM Zheng Zheng  wrote:
>
> Hi Ryusuke, Viacheslav,
>
> We found a reproducible NILFS2 segment-constructor hang on v7.4-rc3 with
> syzkaller. The supplied recipe reproduced on three independent fresh VMs;=
 no
> state snapshot is required.
>
> Repository and reproducer:
>
>   https://github.com/Zheng-zheng-codes/nilfs2-segctor-thread-hang
>   commit 2d94e07741d28d2dccaba174d06d6a5255ce0134
>
> Hung-task report
> ----------------
>
>   INFO: task segctord:35823 blocked for more than 183 seconds.
>   task:segctord state:D stack:29568 pid:35823
>   Call Trace:
>    <TASK>
>    __schedule
>    schedule_preempt_disabled
>    rwsem_down_write_slowpath
>    __down_write
>    down_write
>    nilfs_transaction_lock+0x25d/0x410 fs/nilfs2/segment.c:357
>    nilfs_segctor_thread_construct fs/nilfs2/segment.c:2601 [inline]
>    nilfs_segctor_thread+0x600/0xa60 fs/nilfs2/segment.c:2716
>    kthread
>    ret_from_fork
>    ret_from_fork_asm
>    </TASK>
>
> The blocked thread is waiting to acquire `nilfs->ns_segctor_sem`
> for writing in `nilfs_transaction_lock()`:
>
>   for (;;) {
>       down_write(&nilfs->ns_segctor_sem);
>       if (!test_bit(NILFS_SC_PRIOR_FLUSH, &sci->sc_flags))
>           break;
>
>       nilfs_segctor_do_immediate_flush(sci);
>       up_write(&nilfs->ns_segctor_sem);
>       cond_resched();
>   }
>
> The lock dump also associates `&nilfs->ns_segctor_sem` with a task in
> `nilfs_ioctl_clean_segments()` holding `sb_writers`, while `segctord` is
> blocked in `down_write()` on that semaphore. The serial log repeatedly re=
ports:
>
>   NILFS (loop6): error -28 cleaning segments
>
> i.e. `-ENOSPC` from the clean-segments path. The reason why the
> clean-segments ioctl holds the semaphore
> for an extended period is not yet clear. We have not established
> a circular lock dependency or identified the root cause.
> We would appreciate your analysis.
>
> Reproduction
> ------------
>
>   git clone https://github.com/Zheng-zheng-codes/nilfs2-segctor-thread-ha=
ng
>   cd nilfs2-segctor-thread-hang
>
>   # boot v7.4-rc3 with the supplied kernel config
>   # using a Debian trixie x86_64 guest
>
>   # in the guest, as root:
>   syz-execprog -procs=3D8 -threaded -repeat=3D0 \
>       -executor ./syz-executor reproducer/repro.kernsight.prog
>
> `-repeat=3D0` enables indefinite repetition. The recipe has 227 entries: =
226
> replay programs followed by the testcase.
>
> Verification:
>
> - Main KernSight pipeline: attempt 2, `confirmed=3Dtrue`,
>   `status=3Dverified`, 226 replay programs, 2026-11-19T11:10:28Z
> - Pipeline verification scope: `snapshot_restore`
> - Independent external fresh-VM verification: **3/3**
>   - run 1 hit after 422 s
>   - run 2 hit after 257 s
>   - run 3 hit after 320 s
> - External serial logs are in `external-verify/serial-{1,2,3}.log`
> - Runs were counted only when a `nilfs_transaction_lock` frame appeared n=
ext
>   to `segctord` or `nilfs_segctor_thread`; checker:
>   `external-verify/verify-logs.py`
> - C reproducer: not generated; the syzkaller recipe is the primary reprod=
ucer
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

Thank you for the feedback.

I have filed this issue at:
https://github.com/nilfs-dev/nilfs2/issues/182

The issue you reported earlier was related to GC error handling, and
Wang Jianjian has just proposed a patch for it, which I was about to
look into.

Since this one also appears to be a GC error handling issue, I will
look into both together.

Thanks,
Ryusuke Konishi
