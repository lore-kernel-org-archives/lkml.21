Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795097249;
	b=QYCkmeoIlWazG0/Zt+SqlsIJ5FQXRe/utnoSv4eSnUV6+i9gIz8Fm9hxVdPMGH/z700p
	 1SReSdFrSEgjYBMFNDvQbVIrqV6X13oGEiDG7s6PJFeSU77D2uWgzbs0d9ywCONI9wQCl
	 zi6i0e5GQAcqjtm1j6XBhLFsbs8TrQcnDgbe57CDXZTXZcWdp6ulLGqCxkMEsN6HDrEma
	 9IkEQhI2Sz5WG8k0xhkmMfMYHbe0SEk+ONhdnjpREj3R/rCm30x+3ChBe1+x6vbCyoSlB
	 UHpGyJETbBFsipPtXX7AE2K8nP37Fp9p9UCnw7BBdxmXeAQbumcPQ9XY0+CHrVzuUlg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=5fdfxp+3cN1O7P0/cteggQR2R9addmyAbUwlKtxIGuI=;
	b=258lBmtmCG8fHHseG5d+e+KuHQJsb5xSWsZemYFfkI0mth4yhMD22Unm9JhLM+lNlNeD
	 cDfY4//MbOmzzTfrPyCP/mkxKMiQX5VA72QAqT22bTDEmep70H8iP8ok4tT1thXpIZjJd
	 wgh+BCgyzxOVATbluHoARQ/XVzDJ6iKkPNf8iQ7vl5LlwdpQiA3bCOdvc7sYxdEsvcG7E
	 Gaj21Z+d6HTh7pOHELWJO/ipY435aU0XVMQiCyHjP5qwS7B35LEDVma/kkn9+XLZ/tbvQ
	 mtBCGulI0kfzYHqF+m8RoopJumwsCz4Bv7vVSVD/xK1LaG2UIpZHKffJ8z3YSpvB7Ww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=apSCs1mR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.71
Received: from mail-lr2-f7.google.com (mail-lr2-f7.google.com [74.125.230.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950D1606A335
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 950D1606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=apSCs1mR
Received: by mail-lr2-f7.google.com with SMTP id 38308e7fff4ca-3ac5c86570aso734701fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:07:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795097248; cv=none;
        d=google.com; s=arc-20260327;
        b=iUbDNnd6kx+zNv/Aa4cXY1pV4WVqGyAgw/kxUULLyNmAP/KX76yKct4kXgnwsuyiLc
         FNj8vgQ6gQhjuZuZtUb6eocx/HlUSvwIIrOF/X2Ev0EGsAIWiOIsTvorHJZZEQpirvTG
         Vy941tf7O6vfBxj6aK4AW2QQdFC58wk1iUx95ISqswejbrQKwK7H3KFGcalmoJbBkXXz
         pKCGQgDQC6SpZB4G7Rw28AJWvnFkvFGnf9O/KOxJyhasDysEoA+ICIFPDbFOWnIJgafI
         Eqd9bQEiR4XG0ClQqZfUikkyi74uiPXIReZm/lLQ/KWuC5/uOHkHcdDqLvVqHEB9XmrN
         SV7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=5fdfxp+3cN1O7P0/cteggQR2R9addmyAbUwlKtxIGuI=;
        fh=ovNYKv1BscFUJz1COqVy7XZutvcDBkdCTfwEjpADdWo=;
        b=sHFrh6pbmDQeGNlwNbgrbmHe4q2pPDMw5M19+NaDG84eZmx2ak0BrcV7aWnKHcmIKX
         ZbzdpiCL/EjDMfJbmcUKEWeZAYcRGG/a0Mf2P2dXnuGQ9V4xMW9jzSe9la69Cqejy2Q3
         XDq3u7kVe6poL2xJJhK9fIO4ZaRztri6k7+AScyBoWNTIXEWK+MEW2m+bfLAYZoGvuTY
         SMEHfVvMB8AxTETmE2cVeij+Pqy2UogVXaBfELMCYst2AqJ8tDZc2rOLCiQ6d7P1FVJy
         FoDaerkemU7cykT62fAQZIB+uYHCcbIKLRGglYCv+RGm4tz6F4LnajNZRLKF+GkDcNWP
         aGGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795097248; x=1795702048; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5fdfxp+3cN1O7P0/cteggQR2R9addmyAbUwlKtxIGuI=;
        b=apSCs1mRbYfiyuOplCR30hz6MbUxMYh93+x2cpTBQxkIrqhHyPOfu03EV9FN9SyUzc
         g8F0ElaX571dOfSmkhssW3ExTSEbPitJw/hWlwoN5aZk7mMMclNinfzG03Hd4XqD9zAB
         9Oibl2aZyxObNcMzHt5OY7pL6UvxVwDosf/MNfFrrj8C/lI5/kmOXM7kpAq95K8u8TG9
         i5414Nz9Qseu8tXH9DZPMf2+fQ1SWkdHCUUzYHqqLK/gAOZvixGnpV5EBsXuw3Hd51+/
         vVl5gXDeSqVAqiyh+9VAt8mFBqntpq5S28BxgBbavYRi9P2kqQ16/oS9wlxDFryhPrQm
         7Vjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795097248; x=1795702048;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5fdfxp+3cN1O7P0/cteggQR2R9addmyAbUwlKtxIGuI=;
        b=Ycsh6uKrKiaJGUe7Bls3g9dlbj3GWLYpg2j2yOcF7h6UqAG1iT5XkJ7Vb4kbKYl/Pv
         b4dVgI7sNhRDi7sym1HXpTVI1NeKVfFM7owB8Ik6AN9N/AhTbOAYGdsVbwVUOzXeROXs
         lF+b5r+BsLr+4DOs06RF9TxnwOJHtYYZ7+SURStEzDTM8XfzweMRvBp7KFcNkbvwJZ0K
         Rc3FPyIj3A6Yxp9opW3LqYFohmNXw+RStqqehGKtLGQXLpKKGTiN2kW5Wzuk0RMRTbEb
         ebDnAyILb5Itg2KvXhH359B8mFLX7PdUw7074OTy8Z2cdgtAkZbHjCrfmDDCyv+7+bDs
         4kxA==
X-Forwarded-Encrypted: i=1; AL+hErFD07P0xgbGP6DNs64p9XNBs9p2AxKtAtztotf5YJCZamJEDsNAEfKxX1PVmQ5+QH/tlsyzsLpTC5hh3LU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/YoIWzmpapqVXAtFmifYeBGHzzS3n17eJDlv5lofPLnktAiXU
	BcEPv7y7Wtu00PdlngtqVuvPZuMB7XAfzy1CKeNBxdzQQXVtIXwqxZvgVnGXXBfScl8aVbR9BlL
	rYl5i+i3iWoOPmXjti+myJK05ndYkgjvKOIXzt9fdn0A2
X-Gm-Gg: AYBFou1D6ZbfEtdigsSYSohHBfIdrWsJ0OmHy+CDCqdhIgm/JhtEt60LFlCuZascJAD
	BKBiCWPpV542WHCbpZAyu6XTpWjvXz9gz6MO849+mgudLmVUQX/iphDkHgSjEbRGUCsIuk1DKoV
	aCUrFMhFaj6j+f9UE9S3u8vwgvbLf12yGtq8BZvpe3MsYfDZuxUQle8G9P9pReT2XdwK8NOa6rc
	Ep8+ydZbPpwbtoRG7JeuK5and5V8TDWuf/DH3x21jpZx3c5DqyI7BtNGujb0T06l+JnbcqNHB4i
	PL1ZaUwFXYkkIUWPnWd0u5pBRKdOLuTCJ+K+w2F58+mAD1eTe5VdLPM7XDvtRdkZ+aHPv8ggCHy
	4ss34ytOa6qnZwd/a/CrOPdZK1jiI0s5Mj9b+n1ra3b+cbEu0NQ7cT2v4JbtgFZgyClM=
X-Received: by 2002:a05:651c:2105:b0:3aa:f4c5:8920 with SMTP id
 38308e7fff4ca-3ae7b7b4759mr3971431fa.12.1795097247395; Thu, 19 Nov 2026
 06:07:27 -0800 (PST)
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
Date: Thu, 19 Nov 2026 22:07:12 +0800
X-Gm-Features: AclHuK-b4i_d8VXZZJ0Fe5n8p466ow-YpKHzxH9f5HZX4zjZqSLG9FFtE1oPG30
Message-ID: <CAO-4RZ1Q-HzRCd+S1uHZJRdN-ZCtv47f=pXTxbq4YaJgn_DALQ@mail.gmail.com>
Subject: [BUG] INFO: task hung in nilfs_segctor_thread (fs/nilfs2/segment.c:357,
 v7.4-rc3)
To: konishi.ryusuke@gmail.com
Cc: slava@dubeyko.com, linux-nilfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hi Ryusuke, Viacheslav,

We found a reproducible NILFS2 segment-constructor hang on v7.4-rc3 with
syzkaller. The supplied recipe reproduced on three independent fresh VMs; no
state snapshot is required.

Repository and reproducer:

  https://github.com/Zheng-zheng-codes/nilfs2-segctor-thread-hang
  commit 2d94e07741d28d2dccaba174d06d6a5255ce0134

Hung-task report
----------------

  INFO: task segctord:35823 blocked for more than 183 seconds.
  task:segctord state:D stack:29568 pid:35823
  Call Trace:
   <TASK>
   __schedule
   schedule_preempt_disabled
   rwsem_down_write_slowpath
   __down_write
   down_write
   nilfs_transaction_lock+0x25d/0x410 fs/nilfs2/segment.c:357
   nilfs_segctor_thread_construct fs/nilfs2/segment.c:2601 [inline]
   nilfs_segctor_thread+0x600/0xa60 fs/nilfs2/segment.c:2716
   kthread
   ret_from_fork
   ret_from_fork_asm
   </TASK>

The blocked thread is waiting to acquire `nilfs->ns_segctor_sem`
for writing in `nilfs_transaction_lock()`:

  for (;;) {
      down_write(&nilfs->ns_segctor_sem);
      if (!test_bit(NILFS_SC_PRIOR_FLUSH, &sci->sc_flags))
          break;

      nilfs_segctor_do_immediate_flush(sci);
      up_write(&nilfs->ns_segctor_sem);
      cond_resched();
  }

The lock dump also associates `&nilfs->ns_segctor_sem` with a task in
`nilfs_ioctl_clean_segments()` holding `sb_writers`, while `segctord` is
blocked in `down_write()` on that semaphore. The serial log repeatedly reports:

  NILFS (loop6): error -28 cleaning segments

i.e. `-ENOSPC` from the clean-segments path. The reason why the
clean-segments ioctl holds the semaphore
for an extended period is not yet clear. We have not established
a circular lock dependency or identified the root cause.
We would appreciate your analysis.

Reproduction
------------

  git clone https://github.com/Zheng-zheng-codes/nilfs2-segctor-thread-hang
  cd nilfs2-segctor-thread-hang

  # boot v7.4-rc3 with the supplied kernel config
  # using a Debian trixie x86_64 guest

  # in the guest, as root:
  syz-execprog -procs=8 -threaded -repeat=0 \
      -executor ./syz-executor reproducer/repro.kernsight.prog

`-repeat=0` enables indefinite repetition. The recipe has 227 entries: 226
replay programs followed by the testcase.

Verification:

- Main KernSight pipeline: attempt 2, `confirmed=true`,
  `status=verified`, 226 replay programs, 2026-11-19T11:10:28Z
- Pipeline verification scope: `snapshot_restore`
- Independent external fresh-VM verification: **3/3**
  - run 1 hit after 422 s
  - run 2 hit after 257 s
  - run 3 hit after 320 s
- External serial logs are in `external-verify/serial-{1,2,3}.log`
- Runs were counted only when a `nilfs_transaction_lock` frame appeared next
  to `segctord` or `nilfs_segctor_thread`; checker:
  `external-verify/verify-logs.py`
- C reproducer: not generated; the syzkaller recipe is the primary reproducer

Kernel/guest details:

  kernel: v7.4-rc3, bzImage sha256
    0c16409f8aec508ac44a63e631c2bd352536401f3fd0856df1d839fb953a1882
  guest: Debian trixie x86_64, 6 GiB RAM, 4 vCPU, QEMU/KVM
  boot: oops=panic panic_on_warn=1 hung_task_panic=0
  config: CONFIG_KASAN=y, CONFIG_PROVE_LOCKING=y, CONFIG_NILFS2_FS=y

Thanks,
Zheng
