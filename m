Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795136677;
	b=4DZR3IefM3xWZqTkZ2LovSTiSx+Pl+VxXhsP3QMpD6Uf1mLyZt/LlHm7dheA8eXdMMDN
	 gvKMZeKpaSiZGaR7acN/GnZMJGg1xVChxz1TBYFnLXUsVecJcpczgTul8QpEE+p/Ekxt/
	 qmUAWpc0YqyiNwirskYWeKyssL4Xgajgh1lZ4rs9xduam4De4IpS+a7p8NZDQOhBo7PLS
	 rsFfRl8ecYaNAVJQgpHJsrRuRPpLVNB1EPIdaieOWyp1ZIc12+YqbTPLJJY6LR9F1B0oX
	 wqlgWEu9iHWVD2wVOgf37SNd4f5IiC3axEn0yLuTsrWEtGozp3Bw+g4FcPduaUVFo+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795136677;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=+GRSYw+eVW91K/ZQO+BzEBFhG1XRSg4Wq0Me5iRIbCE=;
	b=At10QF1R6cm5MsOputbT1ga2gBco7Hwe8ippd92N+5lk8w4oay70RlslUbDswHgKgUS+
	 vsI8SWGMV+CcRYKFQPgJjSAQ9C/cdmC/7lXbcE94tRDgo+E94zysaSwwFBBV5Fq1hAiqb
	 gZUk+BJfvs0301J/c8emYjdZmCrqAyI9XgzZ+dit1xrx9AO5irXL0sz9wicpKFTKFI6Kn
	 ngHMfKG/3OtWCRDUXIvRdTPupiA/HJOldZgX4iWJZnfHoUbf+/Y6pvREiwSkehWdBtYfx
	 aLnhKMiUaq5NTwQJOhZwnMCZZ7Bsm0gf5NC1wCY5pAbMnK9o3uyISb8lcW99fkAuyXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A205C606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A205C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-5587351d419so422960b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:04:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795136675; x=1795741475;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+GRSYw+eVW91K/ZQO+BzEBFhG1XRSg4Wq0Me5iRIbCE=;
        b=qaNMZ17FMb8iI+Abs+grJH8qBWD0DIMDmXVqD8PJaLlMl7l+fQESjkf2quUr4jJ7lE
         dYP882nfYHlKCYBJBzuwfj9IL+jubDgJeKkqGAKEveozEcZGUfZVNKUKJfyIQ4kegyBo
         DGYoVvPumkDYUJseLR8GPNYNoZD0ZE9g1pVVbwYE7rPTLfg4MANeAIrn/L2c3n/BpmZL
         Qo4s21wyj9VIauaY8K7gewbPYE2AlIdPX7G4c3aS2dwAhBGbTdlvJw/JztNQcVRX4p3Z
         1V7RJ+AbEELhRSbafmj+Ccui/UXc0n8LU+u6BIjsQt17sT2RHipLPfKicGPcJ/LHr38B
         wS6Q==
X-Forwarded-Encrypted: i=1; AL+hErFhSftnUFKkoUxdX+xK4f06NSzJ6b0KNsHQF4AWvX1dWg2LNbZBuCXZ252L6UWR6AenLsHbSm638X1xlEA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PvEBV7jh/8f+zibOHZ7IpIhMBJw7R0yFUhCuKHsjzEn+B8yms
	tU911nvPKvSwScv9z2KHfPd9t8DCS7cHRhdjIevAfIju2Q4c2bUX/uN1OTW0CsZ6JHJjML2w+dK
	IWDrYVB/pqWJ4wyR52CAwIOurw5X0pRXBPPUSJXCGXoSdlB+pjWfXSrFRqJ8=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4fc9:b0:573:4ad5:7e4d with SMTP id
 5614622812f47-57a0ac2fa3bmr2495724b6e.35.1795136675612; Thu, 19 Nov 2026
 17:04:35 -0800 (PST)
Date: Thu, 19 Nov 2026 17:04:35 -0800
In-Reply-To: <tencent_7590135AEEA7D2DC2CE7F27E4DF5B8936208@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aff9ca3.a159c4fa.1dac72.000a.GAE@google.com>
Subject: Re: [syzbot] [jffs2?] KASAN: slab-use-after-free Read in jffs2_xattr_delete_inode
From: syzbot <syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com>
To: 847807867@qq.com
Cc: 847807867@qq.com, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, luquijeffrey@gmail.com, richard@nod.at, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test

Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

>
> Hi Richard,
>
> Gentle ping.  I posted a fix for this on 2026-11-03 [1]; it resubmits
> Lucas Jeffrey's September patch with credit, as his thread had gone
> quiet while the bug kept reproducing.
>
> There has been no response so far, and the bug is still live -- 44
> crashes recorded in the November monthly report [2].  The fix is a
> one-liner clearing f->inocache in jffs2_init_inode_info(), consistent
> with the other pointer fields there: a stale inocache survives slab
> recycling after the previous mount's jffs2_free_ino_caches() and is
> dereferenced by jffs2_xattr_delete_inode() on the evict() error path
> when jffs2_new_inode() fails after jffs2_init_inode_info() but before
> jffs2_do_new_inode() assigns a fresh inocache.
>
> I've verified with the syzbot C reproducer under QEMU + KASAN: the UAF
> triggers before the patch and is absent after it.  The patch is inlined
> below so syzbot can re-verify on current master.
>
> Note that the syzbot bisection points at an unrelated block2mtd commit
> (7b09acdc "mtd: block2mtd: add support for an optional custom MTD
> label"); the repro mounts jffs2 on block2mtd, so that looks like
> bisection noise.
>
> Could you take a look?
>
> Thanks,
> Shuai Liu
>
> [1] https://lore.kernel.org/all/tencent_A21BAE90D8EE04A5FB98B4168BA73C695306@qq.com/
> [2] https://lore.kernel.org/all/6afbd91e.e6a8accb.234e85.000a.GAE@google.com/
>
> ---
> --- a/fs/jffs2/os-linux.h
> +++ b/fs/jffs2/os-linux.h
> @@ -55,6 +55,7 @@ static inline void jffs2_init_inode_info(struct jffs2_inode_info *f)
>  	f->metadata = NULL;
>  	f->dents = NULL;
>  	f->target = NULL;
> +	f->inocache = NULL;
>  	f->flags = 0;
>  	f->usercompr = 0;
>  }
> --
>
