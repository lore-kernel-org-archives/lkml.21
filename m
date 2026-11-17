Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939648;
	b=rb5V69YilDLn817epkaJHZuOTUII+x7ngfU49pf1Lu9pIOKQtuDytOhvceSGhVNhdr1p
	 o2VS+dXpkiWWwyJw4slCw6KPWIeKLhGXxTAdExIHdtRDgJKA/SdOsLZi5CtviDng0WDul
	 r5TSaq2qHRaoF4h4EO4huyHxA/2M0cXTQztw5A7B6rUB/756qFN20w/tRrWy0D5btPt6S
	 ayJu5Zq0i3zPL5AfhG4W1iXRMcjzjidaanP6KQC8CeRD/XifgdABo4kL/a52RtdWVftdq
	 RzdtroEtFFwi16JE4CO+qya/rsIoe4bhfS5fYxnJW/EM5zs8NxI89l5Ij7+6JPnXOow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=gEpnTVL6/f36zmbCQlhINdIlM5qtOZv7QnnpCH/wsH4=;
	b=uuytwLUIATGu1FLYNa6turlYpiRvkEQx/4AWe0UjYn/MzQlGNq7FOqrhRb1jflBJGrAt
	 OaybA1T/e/Ymcpp4sL+V985bzGZzczTS8bosQLzRnl9w7IsaUVG7YTnKdIcN2wLsHoyMq
	 Kbb2Ju9gJFSpp2mKabhBq1SLDDC+vYoBvZe6aTD4FkUOLKsnA0mRTyQR8yQK7iSYMDFC/
	 jAS/u6TB0cMXhqenxsYKDNjge6sDsxkO2yxkX+3YEBjlA+LsH7rLGFpsMi1Jxax7o7lhq
	 WCX0qpvhPwcdQUNpjdlsLm7Nj1ewsMcDa4d1whz2rHpzWQfWUkXAmKOUDFpppfqH9AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=SG71CXL4;
	arc=none smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6A7606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:20:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C6A7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=SG71CXL4
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67db1f6f50eso3181891d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1794939647; x=1795544447; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gEpnTVL6/f36zmbCQlhINdIlM5qtOZv7QnnpCH/wsH4=;
        b=SG71CXL4MMSwo18OwqecZo7oLfa4OkacsopHwxwn/L+p1kHpbBCAfZ7+xrr+fsB09S
         OwnOQcNCziZAGA+lkUsFr8Ghnu7lCS+LgpzWO/NXdt5C81LFEeKQcDGJ01yBd/bRg+/1
         HBqRDx+zsU1z4FZj6ptg5ap/7q/8K8KjTXLUF7sL0VqFyPeBrYWFc9BCRStQUdma5zFi
         /19WPR4RNOAqOVTC9qeiqClrqIQC7PzBauuZDDKjaSqHrlvR6dmjqhSjBwSxJUUDqXAQ
         Sr42ycY8w8LNMW5f2FXnlCoCcNfw2SrQUqHeBBjoEP40Fxyt4nSFb1keje9fX2kU98mQ
         hRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939647; x=1795544447;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gEpnTVL6/f36zmbCQlhINdIlM5qtOZv7QnnpCH/wsH4=;
        b=fNRSGJFdzqt+DBjrK2BK6jSSNMN1b7UDjNW99EH4F2l4qiqkfajs61+U/HZ6U02/M+
         sIcSZTFX7n+qcZZ2cMYR5kRpi+j1j2DB5VyJRxMWZNXA8tXhQ9Db9A2EdViv/Fs8vH6y
         sxhDnCaSLkwDFT4H45hiDphApmNOiQUBHLxb077StLYLEqgGK0LlueQUtYRi6ArbYqw1
         FtWYKUrEvQ82kfOEVeXGHTKhweZ9jxsaineCDLp3vzoieR4AYnHuVqRLpp2SpOZfw1Sj
         yEarQ+/Kq+qeq2W4+eVVYlZ+G03YJFUnrY8YdfNwrxTL6BmY/FhVEVb5JN+pZCVB6Z2O
         Q2DQ==
X-Forwarded-Encrypted: i=1; AL+hErFpSCxxxXpymlrCQgsuzAFrE4fGrnNQ0LDxEBrHvtNHiu/2qfD4zdB1EMWvBY2BNL8+o1Z1UiIJCwfzJzo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8c/6z2A0ZRUU0xFqrnrYmeY0rr38Ua16eNEYzfwQ5A23U/l7x2
	XHYcOVSVT29rvGmW4tUT4b21qw6JKqU/Y/Ahm2aPAkXlTmG59h6T5XV9D18XFeqePCk=
X-Gm-Gg: AZFdTZf0Zg7t4bl7ddJjoApd9S5NVQOEEAtFlqoYlVX6f8ylf3U3nCFz/JWbm2SHCrl
	lMJsEt7R7mHc36diM6PijY5rzb5Qx03xJHBr/Z+nJA1VkWjcCb+yAz30ZxlevAn6FDEILkXDuDu
	MrE2ebFc3L9DlakXgbor0hr83V1/ZnKtzgJ3RhV7dEQlQ0uJdn2EsVzrycJSOaWgje834AfIG7V
	2WAAQkbtY5+OlHQAtvzWuMyszP80mTziswVgZxdvIvoIEqJKKJavRdAaFqZhrdXClTe8ju2HOvN
	kzUtpscjmWX8kOb3iCkuT1WjS8wgto8got/+SkS5uCOQ0O4X3il6BCqTZWimZxCnjrVi5ufNCPG
	qkqVy9MwGcoB/TF7PY+3nwuSSlpld73X/MbJmwa/8WtSgRKyf3HVtSQ44KghMrORhgeihyVq+x6
	BdttgKRpdcv/NGywj8PEP5MtjQVMKjo8Hks6ai2uxyLG415eh2qWEETRtnflX3/lB18bwooASFQ
	iejiDn2R1aa7DYvS9Y3dNqr96ynJFasUgwj++mXslXkHD3L0RAKcN9kNrFzo6/L1jxxpnjQY++X
	Lqk3GTbtnDIUrV6TWi/vHDnMdbU33gMWzGOkwsRhO9OdJBv2Ir9KqgUv6Q0D6gpLT6t4ms0geQG
	l09h6h3/brxnwXNT3CgbDlH7PCrYnyNJLEJvr3/6Jqq+FUst29Z4k7elOyCmccr+HIT9BxSzo7K
	IZjjq3gjJXfkDRGsafKoI=
X-Received: by 2002:a05:690e:12cd:b0:671:26c4:3ac6 with SMTP id 956f58d0204a3-67dd454764bmr145475d50.37.1794939646693;
        Tue, 17 Nov 2026 10:20:46 -0800 (PST)
Received: from ?IPv6:2600:1700:6476:1430:d1c7:8722:e551:bec4? ([2600:1700:6476:1430:d1c7:8722:e551:bec4])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67dd402aa48sm272431d50.14.2026.11.17.10.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:20:45 -0800 (PST)
Message-ID: <0318886d45a4eb49aaaa2af5227a3d92f558712d.camel@dubeyko.com>
Subject: Re: [PATCH 0/2] nilfs2: atime support
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Cc: Wang Jianjian <wangjianjian0@foxmail.com>, linux-nilfs
	 <linux-nilfs@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Date: Tue, 17 Nov 2026 10:20:44 -0800
In-Reply-To: <20261117065122.41553-1-konishi.ryusuke@gmail.com>
References: <20261117065122.41553-1-konishi.ryusuke@gmail.com>
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

On Tue, 2026-11-17 at 15:47 +0900, Ryusuke Konishi wrote:
> Hi Viacheslav,
>=20
> Please queue the following two patches for persistent atime support
> in
> nilfs2 for the next merge window.
>=20
> This series builds upon your original patch [1], which Wang Jianjian
> followed up on to address review comments and add compat_ro feature
> flag
> support [2][3].=C2=A0 I have made minor modifications to those patches,
> including filling in missing kernel-doc comments and adjusting the
> commit messages (such as fixing the Co-developed-by tags).
>=20
> To use this feature, install the updated nilfs-utils from the
> 'atime-support' branch of the development repository [4] (which will
> be
> merged into the master branch once this patchset is queued), and
> either
> format a new filesystem with the atime feature enabled:
>=20
> =C2=A0 $ sudo mkfs -t nilfs2 -O atime /dev/<device>
>=20
> or enable the feature flag on an existing filesystem image using
> nilfs-tune:
>=20
> =C2=A0 $ sudo nilfs-tune -O atime /dev/<device>
>=20
> Once the atime feature flag is set, the filesystem can only be
> mounted
> read-only on currently deployed kernels that lack support for it
> (until
> the flag is cleared with "nilfs-tune -O ^atime /dev/<device>").=C2=A0 To
> avoid confusing users, this feature will remain optional in
> mkfs.nilfs2
> for the time being, though I plan to enable it by default in a future
> release of nilfs-utils.
>=20
> Note that when enabling the feature on an existing filesystem, inodes
> written by older mkfs or kernels have their on-disk atime fields
> initialized to 0, which will expose the epoch date (1970-01-01).
> nilfs-tune warns about this when setting the flag, and image
> conversion
> (such as copying mtime to atime) is not supported.
>=20
> The series consists of two patches:
>=20
> - Patch 1/2 introduces the read-only compat feature flag
> =C2=A0 (NILFS_FEATURE_COMPAT_RO_ATIME) to manage on-disk format
> compatibility
> =C2=A0 for atime support.
> - Patch 2/2 reads atime from on-disk inodes when the compat_ro flag
> is
> =C2=A0 enabled and stops unconditionally setting SB_NOATIME on the
> superblock,
> =C2=A0 switching VFS behavior accordingly.
>=20
> [1]
> https://lore.kernel.org/all/20260219204343.70117-1-slava@dubeyko.com
> [2]
> https://lore.kernel.org/all/tencent_E3847A19056D4E914FACD269A3C77BAF0905@=
qq.com
> [3]
> https://lore.kernel.org/all/tencent_F3CAF2061A8AE294D88513588FD3DE1F4806@=
qq.com
> [4] https://github.com/nilfs-dev/nilfs-utils.git
>=20
> Thanks,
> Ryusuke Konishi
>=20
>=20
> Viacheslav Dubeyko (1):
> =C2=A0 nilfs2: introduce atime support
>=20
> Wang Jianjian (1):
> =C2=A0 nilfs2: add atime compat_ro feature
>=20
> =C2=A0fs/nilfs2/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0fs/nilfs2/inode.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 +++++++++--
> =C2=A0fs/nilfs2/nilfs.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ----
> =C2=A0fs/nilfs2/segment.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 --
> =C2=A0fs/nilfs2/super.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 ++++++-----
> =C2=A0fs/nilfs2/the_nilfs.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 ++++++
> =C2=A0include/uapi/linux/nilfs2_ondisk.h | 12 +++++++-----
> =C2=A07 files changed, 29 insertions(+), 19 deletions(-)

Applied.

Thanks,
Slava.
