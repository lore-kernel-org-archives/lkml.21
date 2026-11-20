Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795186767;
	b=hgKtE4tTmzD3ScXU+ge35AI2Fpc2hN9gpBTwr8QkpeUmwK1MfD6jZpdoZQi8/ypmeXk0
	 kQVIci0BkJU9iPvNsKowG/t8zqKWGJ0sPZGk6uL+pnzZQlgfNeT2e13QFuZnKYTrWHkHl
	 qZ/qwewhy8QhHZ6CLipTsW0PFHzyCwQpxFlT+fOsIl4rTlSZLTxwYMHK2uMv4XAoiEqyc
	 DcddG7G+EpgkB1YZX/RfekHPi1YFWTIIvxM8/tS7Y8yZRFyrs5r+2hyBcaqtmqurwWVng
	 U7OVJ7pamefjXf6w+QDXR0wdRqhWiq9lKcaW9g4C/60ot2XyiUSB+9GsEEdHvRrPVtw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186767;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=Vz/9X/xDs27LNeUzfwpYSxQHLLpaMzHuDFNMaboauyg=;
	b=Kfz1hgyVDkbrQAhTrnPpjCUGYzlduwQ2avTlHW8c8sxAVoqjmmTYWuA+j1ZgmOGJaMLE
	 rYI3my0vAWOZHOsS/taJJqyl6YpH/m8rfPh+K63h0q1FPgLkRgit1imcL6y7Zmtu4QV6z
	 iOtm4PulX9ILQFu9oRGHO/uGh5BeFYzjFCOMQT2ojmvE7Aex1sO/MjfoKacblPIXSi2Dx
	 6fppBWBuHNlWxcIcfz0Xt2h262n9QNNdQ8u+boYBb519vNgq3JbUqk5VsTBa9Soll7FAm
	 Z94QofywiyI6E+EV2XMV9S0TGQlitH3GB5imcp/HwQx+zSxa4BmZdcm6dTRhyiigY6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z89hm29S;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=B0zBjARr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB8360A3812
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:59:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EB8360A3812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z89hm29S;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=B0zBjARr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795186765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vz/9X/xDs27LNeUzfwpYSxQHLLpaMzHuDFNMaboauyg=;
	b=Z89hm29S5CRJTe7acG6K64lxDlw9xcGkpan2I3lFQ3cjGeNWOeTzeosu6UAtq3sKx2015+
	/QXmSToKPlRJBLvsUeURhVQJ4d72cR/Qc6jv8zK8euPwt3xop8GkRRopXODfwMJaB5sEg4
	yp3X1QTYRupI30Bfe/LdDi0czKb7xpU=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-KivxY0H7M7WfWG8C3S4JbA-1; Fri, 20 Nov 2026 14:59:23 +0000
X-MC-Unique: KivxY0H7M7WfWG8C3S4JbA-1
X-Mimecast-MFC-AGG-ID: KivxY0H7M7WfWG8C3S4JbA_1795186763
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b3342f229bso30194077b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:59:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795186763; cv=none;
        d=google.com; s=arc-20260327;
        b=lh2UjKfSzZGIapJTYhz2ff+GPsmOrEnpQIV0bgXjfF0lXhg+W+zyCNALM2J9l63kGW
         vZCFhLBzHSpU1ds5OsXe5C0lEVQStGUtqNTjiVbuVqXIbgo9EXnpsqTWeX0bZKkv0a+M
         3ohj3/9FQW0t5ZzJE0Xyo9mPPid7byxQj1e9a8lzFTPva501Kvi6Hqg8byIv8r3yyVc1
         TxlWDcWxlakLFQynvAI+4blPAh34C0b5JwgjBNvQQPhknaIIH0TIe/ZpRmUkBH3N+1D7
         esSeXn+mZU1hdo2Gb205u9K8uGqfJgY3a0IUvgV4O8pDNt2xrrb2S3jqj68/24FL73Tm
         aL5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vz/9X/xDs27LNeUzfwpYSxQHLLpaMzHuDFNMaboauyg=;
        fh=/QFBOCAw0G2EtIEwSAsHt5fqoaiM/UfCeowElp2aMUQ=;
        b=d81Di8DJEV0YpBRHnWbrJyzyThCKujbuXL7dgJ9ww8+IiLmaoMkpLxOLsmhB+Sn3ng
         6th4cC/aSX6U4TIj468DzeLSBNw2/hQKgd/WvJYccc+lVq9AXsLEqbMp9XFofjaE/6Lp
         2lCWq4A+ULvtrtQ2nPJTYwGHYTwv1tp69o/DNZTGVcbHUPiArG8FTyH3avBlz3G32EaA
         QY5Ajelu0kN0TwiDaomJJhndh3LreevUKLfNEzPaJJxvzFlI25mYBdyv3anDCy4iYmDN
         Xg19PhUdk3FEUy6MADI3uYTBI2ofwBxwpZ0jj7a6d1h/GDFqizGmm1tyFp+n0eVvBlIe
         xYAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795186763; x=1795791563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vz/9X/xDs27LNeUzfwpYSxQHLLpaMzHuDFNMaboauyg=;
        b=B0zBjARrRRH2r0deOfQjVsuOqCKgolcPVXf+fD+/upNOm1SI2J0Fj+8hY+BByh77wi
         wIo6WP2LnzMYME0yMogIOBTnsGlCbXTUWkqCLZN/JjBfYyGQDmkk6dem+2zXSG4IUPU3
         sND/wM0H9VP8wTirnvgOKk/zDLalvg4W6C811EM3SZHhOhR26YoOGkQGlXbr8vBxl0Tz
         eVd24Zbi2NKaHoSIjtsPBgsJlBRlh4Hg2qkwO08OMdkfbZkDKRyTfNWChbo+Mqrw60e3
         PhGL+twPKIBOEX4iy9sNF7fJMakMUXlyuUxULFZvbAglQSPDpBzodxHyQ1ofF8MysWpW
         nSfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186763; x=1795791563;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vz/9X/xDs27LNeUzfwpYSxQHLLpaMzHuDFNMaboauyg=;
        b=bK0HmqyTCBzNHvMRMu9CAH+Mh6DlcH9tV0fa8d/eSmTUYtlSXY2xHdqEOaVOv8D6po
         jadYUZRqskVoQ34eOFDhoxn6Ly0Giybb7Jr+y9zyhOwt0wRp4SQg+2BOUubVEIsdV+i9
         08Jdy6Q0VMH+8kmhMWyJ0xv/s3XI1GubHrOLmZrpfdUeYbQtg5PzZCxdu/9nSssCRxkA
         7FQx0V9uotvWzYeqIahHoR62ms/1BY2EbAhP9yWWVqOZL2Ao5jfcrsc2+KkCiVOXlzoA
         /3nCZc97pbPD7DXRXi4cUtTFoQyvnHOfXdokTpSpbVffwGQkafNMgObVeoK1GVJPwmJd
         9neg==
X-Forwarded-Encrypted: i=1; AL+hErGnPGtb/4kqo0+WHsdxHcdVGw7I6WBKjdSUuF0BOvZVRXLjiq14rUPeLGl6RaFZF8SFHQSblutUSPsK0GM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9g7VdNLBXDLGK2CHhsfrfOfSY9V0ncIAI+IVs1hRkNal3ydAeX
	jljltWzZjzFP0hXMv5fK7HrDIlCKAs5ZdxHzl4ZSWq5WIxNM9Au0iX59WSRhCL3/d1DtGkQFbS5
	rgegiI0FACzfQcVc/6dQjorS+0tU6KJiLuFCOP1jmSDRcNMRBwXINIb5zRy4H674i+ERHsY2WpV
	HARQnDXLcIMc7F50koym4b8fo+CP59LdrzD/UKJ5Il
X-Gm-Gg: AZFdTZeOypSMFyKl6odlc5qWAXnI2DKeMzCTLwxrpMx2SdB0e23C1liJcSbL2xK5/9X
	58oqvO2CoUQf6ldD9dvpb9WYvBssfi28QgM5E4W/aMVscuQz5SlP1Jw+BJhrl5pwDDoBDTyp6o7
	MiWJ9PmHxtBOjAOQGzxHyYZbN66+XG1VU1rFIybYp+A/w6HywHnGsZ/8sQMWICmn8dHRNgjjJEV
	cqONy3+M8Ino3kgiRxGwhW+yHlI03rVRJb6RqzxIhWMlA==
X-Received: by 2002:a05:690c:6893:b0:8b0:8a77:e9b8 with SMTP id 00721157ae682-8b518d25cadmr18702517b3.4.1795186762656;
        Fri, 20 Nov 2026 06:59:22 -0800 (PST)
X-Received: by 2002:a05:690c:6893:b0:8b0:8a77:e9b8 with SMTP id
 00721157ae682-8b518d25cadmr18702267b3.4.1795186761947; Fri, 20 Nov 2026
 06:59:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120031305.3561045-1-huangsj@hygon.cn>
In-Reply-To: <20261120031305.3561045-1-huangsj@hygon.cn>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 20 Nov 2026 15:59:10 +0100
X-Gm-Features: AclHuK92MT1vYW09O4Urhd7Yf7t3vir7SJ2k6LlnKDbNPNtVZYsZ96-h_yHunoE
Message-ID: <CAHc6FU7URHetBU9XgP0DSEGjWQfq0tX+ohK8xRVZLEYzgJBeEw@mail.gmail.com>
Subject: Re: [PATCH v3 0/11] vfs: add inode iteration methods
To: Huang Shijie <huangsj@hygon.cn>
Cc: viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz, 
	hch@infradead.org, mic@digikod.net, axboe@kernel.dk, gnoack@google.com, 
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, legion@kernel.org, 
	aleksa@amutable.com, libaokun@linux.alibaba.com, ebiggers@kernel.org, 
	djwong@kernel.org, sandeen@redhat.com, zhongyuan@hygon.cn, 
	fangbaoshun@hygon.cn, yingzhiwei@hygon.cn, wujianyong@hygon.cn, 
	shijie8@gmail.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	gfs2@lists.linux.dev, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 4:13=E2=80=AFAM Huang Shijie <huangsj@hygon.cn> wro=
te:
> This series adds two superblock inode iteration helpers,
> super_iter_inodes() and super_iter_inodes_locked(), and converts the
> open-coded sb->s_inodes walks in the VFS to them.  The design is based on
> Dave Chinner's patch set:
>   "vfs: improving inode cache iteration scalability"
>   https://lore.kernel.org/all/20241002014017.3801899-1-david@fromorbit.co=
m/
>
> About the two helpers:
>
>   int super_iter_inodes(struct super_block *sb, ino_iter_fn iter_fn,
>                         ino_iter_eligible_fn eligible, void *priv,
>                         int flags);
>
>   static inline int super_iter_inodes_locked(struct super_block *sb,
>                                              ino_iter_fn iter_fn,
>                                              void *priv);
>
>   - super_iter_inodes() runs @iter_fn with a referenced inode and with
>     sb->s_inode_list_lock __dropped__, so the callback is free to block a=
nd
>     to do whatever it wants with the inode except drop the reference the
>     iterator holds.  The iterator releases that one reference per inode
>     itself, so the callback cannot leave a dangling inode behind.
>     It is exported because GFS2 can be built as a module.
>
>   - super_iter_inodes_locked() keeps sb->s_inode_list_lock held for the
>     whole walk and takes no inode references at all.  Its callback
>     therefore only has an existence guarantee: it must not block and
>     must do its own inode state checks and its own reference handling.
>     It is internal to the VFS, being declared in fs/internal.h.
>
>   - The callback is separate from the caller's data, so a caller keeps
>     its state in its own structure instead of filling in a shared
>     context:
>
>       typedef int (*ino_iter_fn)(struct inode *inode, void *priv);
>
>   - %INO_ITER_F_REFERENCED restricts the safe iterator to inodes that
>     still have a reference.  It preserves the "only handle referenced
>     inodes" rule of landlock's sb-delete walk.
>
>   - %INO_ITER_F_NOREF does the opposite: only inodes whose reference
>     count has already reached zero are handed out.  %INO_ITER_F_NOIGET
>     suppresses the reference.  Neither keeps the inode alive, so the
>     caller must make it unclaimable itself.
>
>    Patch 1 adds super_iter_inodes().
>    Patch 2 adds super_iter_inodes_locked().
>    Patch 3-5 convert the callers which cannot use referenced inodes
>            (dquot removal, nr_blockdev_pages() and the
>            generic_shutdown_super() poisoning loop).
>    Patch 6-11 convert the remaining callers (inode eviction, sync_bdevs,
>            drop_pagecache_sb, add_dquot_ref, landlock's hook_sb_delete
>            and gfs2_evict_inodes()).
>
>
> BTW:
>   This patch set depends a small patch:
>   "fs/drop_caches: skip filesystems without fs writeback"
>   https://lkml.org/lkml/2026/9/23/675

That link doesn't work for me. When referring to other postings, can
you please use lore links?

There also is no posting of a patch with that title from that day on
https://lore.kernel.org/linux-fsdevel/. You may be referring to
https://lore.kernel.org/linux-fsdevel/20260920072811.2064247-2-huangsj@hygo=
n.cn/,
but that patch queue no longer applies. So please post patch queues in
a state that applies and optionally, make a git branch available.

(Also, enabling "git config --global format.useAutoBase whenAble" is a
possibility, but it wouldn't have helped in this case.

> v2-->v3:
>    -the callers' state no longer goes through a shared struct, the
>     callback now takes the caller's own @priv.
>
>    -super_iter_inodes() takes @eligible directly, so a caller can reject
>     an inode before the reference is paid for.
>
>    -rename super_iter_inodes_unsafe() to super_iter_inodes_locked() and
>     drop the rcu_read_lock(), which the list lock already covers.
>
>    -drop @ctx->prev; the resume point is gone with the unsafe iterator.
>
>    -evict_inodes() no longer goes through the locked iterator.
>     it now uses the unlocked iterator with INO_ITER_F_NOREF | INO_ITER_F_=
NOIGET.
>
>    -each caller gets its own patch.
>
>    v2: https://lore.kernel.org/all/20261113115702.586594-1-huangsj@hygon.=
cn/
>    v1: https://lore.kernel.org/all/20261015093854.2082600-1-huangsj@hygon=
.cn/
>
> Huang Shijie (11):
>   vfs: add super_iter_inodes()
>   vfs: add super_iter_inodes_locked()
>   fs/quota: convert remove_dquot_ref() to super_iter_inodes_locked()
>   block: convert nr_blockdev_pages() to super_iter_inodes_locked()
>   fs: convert generic_shutdown_super() poison loop
>   fs/inode: convert evict_inodes() to super_iter_inodes()
>   block: convert sync_bdevs() to super_iter_inodes()
>   fs/drop_caches: convert drop_pagecache_sb() to super_iter_inodes()
>   fs/quota: convert add_dquot_ref() to super_iter_inodes()
>   landlock: convert hook_sb_delete() to super_iter_inodes()
>   gfs2: convert gfs2_evict_inodes() to super_iter_inodes()
>
>  block/bdev.c                   | 101 ++++++++++--------------
>  fs/drop_caches.c               |  45 ++++-------
>  fs/gfs2/ops_fstype.c           |  29 ++-----
>  fs/inode.c                     |  61 ++++++---------
>  fs/internal.h                  |  31 ++++++++
>  fs/quota/dquot.c               | 139 ++++++++++++++++-----------------
>  fs/super.c                     | 106 ++++++++++++++++++++++---
>  include/linux/fs/super_types.h |  29 +++++++
>  security/landlock/fs.c         | 138 ++++++++++++--------------------
>  9 files changed, 370 insertions(+), 309 deletions(-)
>
> --
> 2.53.0

Thanks,
Andreas

