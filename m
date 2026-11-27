Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795803207;
	b=py5lXI3js5oous9i+SToeXvLQNTJBHXTyU/9x5WYqvZWvN2m1GhiVj/mp+8zPup7F9oT
	 4bSMIaZz4+wdQ723pahX5sqPGzjEhaZMfbVzLJeJrOSbaBz+yyn3aycGKOmzxFszbxSW5
	 EbWLr+0buiS3rTuQC2RysS+klMnRl6q5dI2/LKeDhFZMBz5mkIKT4OJflywxyaQYIGQhM
	 4n2ZZL6UCmCql2O79SqgXUdn0tO0gu5u4qoPfmj4SCGYRAX8kuG2VX7ETdaOM9JchlzOI
	 2xGlAh49D3Fbbv6OSXgVmHmor1aMynEaNRi1unoYgeh0u5S1obDTxk3w+a+v347pu3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795803207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=NkLTUIIO313pp0EiOsoebSJHNHDab1zuALOhubz4e0Y=;
	b=HCPkyEpKJq9Gzf/8lGDmQGG+krM6X+YvVbx696aGgkkBjUmj34v85ZZd+61tYDkC1L+c
	 Go47mpKEtE/Swg8UmGBqoWZJwvMIM9jrXZOCiAr5H8x+lK2Yyy4S9sz+V0ACRuczFwf2j
	 XxDnmbmwEqdR7kA78uOkmdj1gDLHmyQ8C4QgKKfOfTCdaPrPUJXn7Ws4ea7Uil6JSQwum
	 SVg4TEQCnEiiprVC4m2vKLmvNn6ydPvhwt1aYSiM2edA+Ivj7LgK50I4/wcro/JMxnv0s
	 TEkwRv49foqhxSdu8TMi947J4yFfTk4m7wLozMrmBvFVRkOqiUgcaNEr8EszmjGQwPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BfHCVtCX;
	arc=none smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CD6606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9CD6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BfHCVtCX
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-679aeeddc6bso8121750d50.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1795803206; x=1796408006; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NkLTUIIO313pp0EiOsoebSJHNHDab1zuALOhubz4e0Y=;
        b=BfHCVtCXep/3cyhQ21Fp59JDev1kjnIKpRteUDVzLpkBG1NCaXqYRXrFGMTWlLK+ig
         35a7TAcKTkm2SMl0BJ3HG/zzJi9gied7gJoDRbqJA1suq1xreKODkzvbGd/zgj/5RclO
         NiNRKdPN4h5YDCpWMELNyDip3ug6ist/AmHKQEHeQAAcnlUCYsJtqLrcC1M6Gfkwj3lZ
         kV6/TAslioi07DOaA0H8NXCN1YWlVjEF5IFgz7KyZchJJ/Aa9/LvjEO3LfhxwD1Lcfcf
         bU7stOJkWpKILjp04QWsR19KsLOFZCCtz4tKUWtVhUmGAErB+WBANMrWrJFdVYvbV6zy
         MHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795803206; x=1796408006;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NkLTUIIO313pp0EiOsoebSJHNHDab1zuALOhubz4e0Y=;
        b=DX7eWrsLVPQXUCwJSKdFUVGKXux0o91I4OJAG7icXcbOTwkysq2GOH1MXcGAi1Ox35
         abljhZ4FfI1JiJ751KwAXoKci35aLLRU9CA4pS83EzjI3biF/U6fr2mZuGTU5orcBL8B
         X3buUpxP1ygjk9axhNUo1Pq8JGKaJvo5ZYhQdSME8EEtBhGzg+lJiMmXpsaR0+QDzie3
         SloHF+yxLbPGYYbz2yfHYKdN7FrYuQcMZo/B4Ai4fhaTbCNHiCPRMemDZmuazgh9YYKA
         rHk0M3bnLE4qb376WNAvN+PXHWJlB1ThO1FfVUj27EBiEjGqUdisPKyOzsADEWU1ScDx
         E0sg==
X-Forwarded-Encrypted: i=1; AL+hErHBh+ZvOkwBulVODpOQ0BtaSMupiKO5xBQyFtVaIZuulZHSLoNN9XsZ5lHj0PDRqD7xFiZoW1riThemQ7c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9acV8zsHkmPqInTsYUBX7O+q2T22xHKxSK6FOUwLQWmbQ0wYN3
	cSQY1oByDvN8KwV86vv2OtRCGb0XY/UycWW7dghMFwLXd7zzI2hEGz8DA+ipUY8y4t8=
X-Gm-Gg: AZFdTZfhfy53yfGV505A3cGHtgOiRjy2ucZcIhXPyoQedF+J+L2Z/yRBf05mc72AD0j
	5ErMK6+0gJK75Aw2WBibhb7UMYXw/0gpR2x3AE9nj8WmFEossB9oe+uDA4z1ngMjoDw9RnaB9IQ
	TmgaJLGUF5EhAYw7OXGRDf5MVushrIw/pCQsMLOYy+LUwTVmR+/8q2Grat9A9LRgONuKmBtiR4+
	XFqs440iaFg+/YpHKkpalEB8nxgN8/HH89jBuqTGaj0DDztEguv3YgUFGJxMVYOxw3so6VLz+nc
	QvGO/CV2XG7uT3Y9PSKB1DjdsjniA/WbC/9QmNotjVaEvzYU9Rtu6paKXAGnGu0yL4hPBCjFjk+
	10dAByy7/oyGvXpgodG9ZNYXIUHW/xubqf6zI6kl+4nMB814iJskaAT9dF2iGEIAgEHVPb8eSfU
	pCZbaFe55LlUZosWLkEb4E62UIleaEPWgIvH6RUFRJCXOe70z8zDpJS4uv8Uc8HWqX3jHOiTgQl
	UpakpEWnl60Kf7gx082ITCmEu7ukZqjNSlw/QMqxu3O6iXYNVB9Qd52a6h5Rs9up0iB7Jswsfe9
	ae90bQXDfib8BKnNb/2t+r3xwzK/D9HfMq94pnQd8xQQBQ6ORr/YXPURWvTsZ1aPr9t6V7o133Z
	PLqxwxuCdrUozmZ5Ta5SFS7mdAUTSKEyFNlxfyAOwyU7mJaQNHeiY9nm/cc9llwpLLLcqGE0TqL
	CvPlHQ635gCgfgmXpc/A==
X-Received: by 2002:a53:ac99:0:b0:67d:ab75:a921 with SMTP id 956f58d0204a3-67df4421045mr8438046d50.34.1795803205486;
        Fri, 27 Nov 2026 10:13:25 -0800 (PST)
Received: from system76-laptop.attlocal.net ([2600:1700:6476:1430:1a5a:d5f7:70f5:514b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33b7502sm11574001d50.20.2026.11.27.10.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:13:24 -0800 (PST)
Message-ID: <5e9c9b70801f18beacdf30f9bfe78741cb1ce129.camel@dubeyko.com>
Subject: Re: [PATCH 0/8] nilfs2: support GC error rollback and avoid
 infinite retry hangs
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Cc: Wang Jianjian <wangjianjian3@huawei.com>, linux-nilfs	
 <linux-nilfs@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Zheng
 Zheng	 <fengaojigui88@gmail.com>, Joshua Crofts <joshua.crofts1@gmail.com>
Date: Fri, 27 Nov 2026 10:13:23 -0800
In-Reply-To: <20261127044231.37630-1-konishi.ryusuke@gmail.com>
References: <20261127044231.37630-1-konishi.ryusuke@gmail.com>
Autocrypt: addr=slava@dubeyko.com; prefer-encrypt=mutual;
 keydata=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
 NFdvziOa4FgUBC4X71upsZIoZJeii2V/Jtc3B4g==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, 2026-11-27 at 13:40 +0900, Ryusuke Konishi wrote:
> Hi Viacheslav,
>=20
> Please apply this series for the next cycle.
>=20
> This patch series rectifies an early design flaw in the garbage
> collection mechanism itself and fundamentally resolves the task hang
> issue seen in the GC ioctl (NILFS_IOCTL_CLEAN_SEGMENTS).=C2=A0 To make GC
> safely abortable upon errors, this series strengthens the error-
> recovery
> and rollback logic for metadata updated during GC, specifically
> segment
> usage information (sufile) and virtual block address mappings (DAT).
>=20
> Historically, NILFS2 GC was designed around a point of no return:
> once
> the log writer started, it looped until a full-format log (including
> a
> checkpoint and a super root) was successfully written out.=C2=A0 Because
> GC
> runs exclusively while holding ns_segctor_sem for writing, any
> persistent error during GC blocked the log writer thread and write
> operations indefinitely, causing filesystem hangs.
>=20
> An initial fix by Joshua Crofts (commit ce5a5ad1a833) took the right
> direction by introducing an escape path when the filesystem
> transitioned to read-only mode (-EROFS).=C2=A0 However, two issues
> remained:
>=20
> 1. Cached GC inodes were leaked when GC exited on error, which Wang
> =C2=A0=C2=A0 Jianjian addressed in the first patch of this series.
> 2. Persistent errors that do not trigger read-only remounts (such as
> =C2=A0=C2=A0 -EIO or -ENOSPC) still caused infinite retry loops, as furth=
er
> =C2=A0=C2=A0 reported by Zheng Zheng.
>=20
> Whenever GC aborts mid-way, however, an underlying issue arises:
> bailing out of the GC loop leaves irreversible inconsistencies in
> on-disk and in-memory metadata.=C2=A0 While this was previously masked
> because the escape path was only taken during emergency read-only
> degradation, expanding error exits to general errors exposes this
> problem, breaking subsequent GC runs and causing userland tools such
> as "lssu -l" to fail permanently.
>=20
> To build upon commit ce5a5ad1a833 and make error exits safe, this
> series implements dedicated undo mechanisms for each metadata change
> performed during GC before allowing nilfs_clean_segments() to bail
> out on general errors:
>=20
> - Patch 1 (by Wang Jianjian) fixes the GC inode leak on error paths.
> - Patch 2 makes physical block location updates in the DAT for
> =C2=A0 GC-relocated blocks (other than DAT blocks themselves) reversible
> by
> =C2=A0 restoring them from the shadow mapping on error.
> - Patch 3 makes the removal of GC target segment usage entries in
> =C2=A0 sufile reversible by saving and restoring them on abort.
> - Patch 4 fixes an issue where stale nilfs_redirected flags remain on
> =C2=A0 primary DAT buffers when GC is aborted.
> - Patches 5-6 make the deletion of obsolete virtual block entries
> from
> =C2=A0 the DAT during GC reversible by saving and restoring them on abort=
.
> - Patch 7 defers this virtual block deletion to a safe stage so that
> the
> =C2=A0 freed entries cannot be reallocated while GC is in progress, which
> is
> =C2=A0 required now that GC can abort mid-way.
> - Patch 8 updates nilfs_clean_segments() to bail out immediately on
> =C2=A0 errors, retaining only a minimal bounded retry loop for transient
> =C2=A0 cases.
>=20
> Thanks,
> Ryusuke Konishi
>=20
>=20
> Ryusuke Konishi (7):
> =C2=A0 nilfs2: cancel the relocation of GC-targeted blocks if log writing
> =C2=A0=C2=A0=C2=A0 fails
> =C2=A0 nilfs2: restore segment usage from the save buffer when aborting G=
C
> =C2=A0 nilfs2: drop redirected buffer flag from DAT when clearing shadow
> map
> =C2=A0 nilfs2: save DAT entry blocks to shadow mapping before freeing
> =C2=A0 nilfs2: restore removed DAT entries when aborting GC
> =C2=A0 nilfs2: free virtual block numbers just before collecting DAT
> changes
> =C2=A0 nilfs2: avoid infinite retry loop on GC failure
>=20
> Wang Jianjian (1):
> =C2=A0 nilfs2: fix leak of gc inodes on error
>=20
> =C2=A0fs/nilfs2/alloc.c=C2=A0=C2=A0 |=C2=A0 14 +++-
> =C2=A0fs/nilfs2/alloc.h=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> =C2=A0fs/nilfs2/bmap.h=C2=A0=C2=A0=C2=A0 |=C2=A0 23 ++++++
> =C2=A0fs/nilfs2/btree.c=C2=A0=C2=A0 |=C2=A0=C2=A0 8 ++
> =C2=A0fs/nilfs2/dat.c=C2=A0=C2=A0=C2=A0=C2=A0 | 181
> +++++++++++++++++++++++++++++++++++++++++++-
> =C2=A0fs/nilfs2/dat.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +-
> =C2=A0fs/nilfs2/direct.c=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0fs/nilfs2/ioctl.c=C2=A0=C2=A0 |=C2=A0 36 +--------
> =C2=A0fs/nilfs2/mdt.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 41 ++++++++--
> =C2=A0fs/nilfs2/segment.c | 108 +++++++++++++++++++++++---
> =C2=A0fs/nilfs2/segment.h |=C2=A0=C2=A0 7 ++
> =C2=A0fs/nilfs2/sufile.c=C2=A0 |=C2=A0 27 ++++---
> =C2=A0fs/nilfs2/sufile.h=C2=A0 |=C2=A0 37 ++++-----
> =C2=A013 files changed, 404 insertions(+), 87 deletions(-)

Applied.

Thanks,
Slava.
