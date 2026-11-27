Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768988;
	b=qHoJ/+eDoHpYZzNyWeBV+OiaexPiH5iFHTNLYgJPCLU8U0rfdo84k3FWbQ/J/YPGgTjJ
	 qIlsSb4+u0q+2sdBYzRUFlPdkblvUrIuuAe+5wIRgYRsBSVd41FN+l0PL8ZHMxlTqaYbj
	 5lyo3p7XewGSM/EUDvYV10vfmvJUj1zgKHenHAON+n4IooI6E4bsUqjPrm6dDHYQPTdzT
	 rWK40y/fT02B333lEfdN2TR9bVoM78vU7mds5UryftZcHg3thfIJowipLbfUXp7qaeBHl
	 aiB7lrQ6z4CPzK03+cSIdun/DKIqetK1XP0S/AD2JGc2mAZTxQbphuVp9FGnr6lrajg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=q/a49TQEtxVoc/uj7/LlLfKe4HzfqdTDH8dyZw93gQQ=;
	b=tG3WE8U4hIHmfEWr4wkqU3VJBvSI0qfo8pRipxZFshuZTa+h4G1yE+3XRDlyaL5waZ6s
	 pHHxnriGBVxZuAjoPnBiBSwAcJpXyf8bAgSrlo+/pxiDDVYGS0UZ+ZkDAsdMn0irbQh2b
	 Renxv1AVRFlv/ZWFLX9I0fd/Ru/7U5VjWnpBQADH907huDwZnDcf2bkAhuFNBuSyhFqBY
	 u5Bj2WSkiq4GEns0WCXPyxa5KCTOngToUzwqGVon8U+ypUbzMgB5LzFWZliuJl8tRWZYd
	 muzTykftdf35E4FYiQerijKLIC/oy1ySUp5yUJje2wlIZe6qtaLGZwcQgG/34fvRmuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=sYHW4TbX;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D641606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D641606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=sYHW4TbX
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c5198302d38so576252866b.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1795768985; x=1796373785; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=q/a49TQEtxVoc/uj7/LlLfKe4HzfqdTDH8dyZw93gQQ=;
        b=sYHW4TbXNzzMddM3SvLwgM4OjqhF60h5M0aoctPt/EUH8XuFKxYNDux3nEmlnY0YKn
         9ApYguSt21yJeEzHwFz9e54UPhphwadDBvgG80W4FF+/lukiTwYzJnXeUhyfyrdjckup
         2M+Xql4myEPbPAv9BvyyaOQa8aLOeXROtpM/eAXX/+Xlxpl49KhkE3elOgA7JCr+cK10
         vmbgSWCE/KrcYP/ZvNHf0gjHY/dZKBdRnF+Hr/FWrjrLIT4i8GKCFH8TapaEIjJiLlK5
         IO5FgJEjJ0XTwQG3gjNtEALfISczuyEbAbIJ13UenAS1vQ0/xqQSw1omU/ZCQXXYENj3
         angg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795768985; x=1796373785;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q/a49TQEtxVoc/uj7/LlLfKe4HzfqdTDH8dyZw93gQQ=;
        b=aP6bWVrqtqgBNCLtfxlAIbt1UJ/K4rK/qFn4V16u/sgMhxn0yOQpsGbZMk6mUJ1aHn
         Q4XRRdau0uSYpqFTX5GNUdS66uiwxqoeSJpfXKcUXUWdMnITyh9MNck4FBcM+JxkQnkV
         /5jKFV+Ojk9q2GxFnPzB+m6rtVVQMz3XfnJPMWCpuxtHll3htukNnVVV2BLT23DnPFIt
         IIMUFkRnhUjmtTwZV6V75+e7SIY5IqgQIgz6aCtnPZe1qaDMFqlWS4thOIFvcVvv2sew
         FHGqqKgqBTC0NQLwnSOAh13PfU0sa94TF5OTvHw6gmPDI0uFxDoxsBrjrgXDBzj1y/u0
         1ZWw==
X-Gm-Message-State: APuU4Z8UXNBhEEkynhWQckmw2SDi4t8+MXrdmLiDlFV+Qd485IOlnA79
	TENhOE5L5GE18Yk+mrYM7v1JVZj5BI4BxX8HM/E2gQ+w2xnFJY+4ceaIhTucVaxhXvX7
X-Gm-Gg: AZFdTZdmHyXKZVMm7PL2Plb4qrQW5qM1huYgyr/U6WP4AIcWsxzzrKR5PxYxadtLBF/
	ehxjvVrfORDRYQL7RVI21HR3NFCa5j//6s4aWrWAtbmFRuNTtoI9kjOjzqatik6NyqEl6OaA2fA
	gv1pjYYiYJsHsdmj6L3jccgkZ780hCnpnHZ/uG0+x6ivCRo6i+rdfJX/iR5oJoTSRmT00ngMCRo
	IbauTltdd2YoiIj7Dq70TLaxMoIv0WOcd1gSHIhwWJAKiXNhpqTyek6q6ttz21cTUTevSbhEYBd
	63j4WBiLU3/H/Rr2PngmDTV2k2BmluO6/hIQbJU2XuKU+B1gSH2Cl4W04VUpaeYWK8QoaH8hacT
	kAVma+Muohr6M+0WWxUwPRY6Q0UEzXd7NJMV8qzw/9j5vrMTxVsX+TQpUCJWsG7DgYsfnY/gDpu
	Rgla/7lWCAyqs693eF7D5hiaUM2blbfa9sNbQMLvXmFl89FMneBZGoO10hAdnPQmBmamwCb0nSE
	mv5u//59LjSKKfj2Wu2ighlGFl14PFKASQH41z2hVfywTN/X0T9VOR/3WgP5okrCBs6YadFxmH+
	PJYZrdWKkgLZ3s44NqBoLpTqrz3slro6lyGUfJK0eOJcYdhzgGCW4w6vz8gWKdPByQ==
X-Received: by 2002:a17:906:eec9:b0:c51:5589:35a1 with SMTP id a640c23a62f3a-c515589d211mr1535450966b.5.1795768985487;
        Fri, 27 Nov 2026 00:43:05 -0800 (PST)
Received: from [10.0.0.233] (tmo-084-240.customers.d1-online.com. [80.187.84.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad01b0bsm839818866b.10.2026.11.27.00.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:43:05 -0800 (PST)
Message-ID: <ecba7d29cc3bfb0e18ad72d2a9690da41f66c832.camel@amutable.com>
Subject: Re: [PATCH 0/4] fat: support O_TMPFILE
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, OGAWA Hirofumi
	 <hirofumi@mail.parknet.co.jp>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Date: Fri, 27 Nov 2026 09:43:03 +0100
In-Reply-To: <20261126-work-fat-tmpfile-v1-0-3bca7b2dbc20@kernel.org>
References: <20261126-work-fat-tmpfile-v1-0-3bca7b2dbc20@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, 2026-11-26 at 23:15 +0100, Christian Brauner wrote:
> This adds O_TMPFILE support to vfat and msdos.
>=20
> Currently, every O_TMPFILE open on FAT fails with EOPNOTSUPP and
> userspace falls back to creating a named temporary file and renaming
> it
> into place. systemd does that in bootctl when it writes to the ESP.
>=20
> FAT can do O_TMPFILE just fine. It already handles files without a
> directory entry: when an open file is unlinked i_pos is reset to 0,
> writing the inode does nothing and the clusters are freed when the
> inode is evicted. An O_TMPFILE simply starts out in that state.
>=20
> The only tricky part is linkat(). FAT has no hard links so I added a
> ->link() that only gives an O_TMPFILE its first name. Everything else
> still fails with EPERM. Adding just ->tmpfile() would've been a
> regression. systemd only falls back to the named temporary file if
> the
> O_TMPFILE open fails. If the open succeeds it calls linkat() and
> gives
> up if that fails.

Hi Christian,

>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

For the entire series:

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

Kind regards,
Alex

> ---
> Christian Brauner (4):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fat: add fat_tmpfile()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fat: support O_TMPFILE on vfat
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fat: support O_TMPFILE on msdos
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 selftests/filesystems: add FAT O_TMPFILE t=
ests
>=20
> =C2=A0fs/fat/fat.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0fs/fat/inode.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 31 ++
> =C2=A0fs/fat/namei_msdos.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 70 +++=
++
> =C2=A0fs/fat/namei_vfat.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 46 =
+++
> =C2=A0tools/testing/selftests/filesystems/fat/.gitignore |=C2=A0=C2=A0 1 =
+
> =C2=A0tools/testing/selftests/filesystems/fat/Makefile=C2=A0=C2=A0 |=C2=
=A0=C2=A0 2 +-
> =C2=A0tools/testing/selftests/filesystems/fat/config=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 1 +
> =C2=A0.../selftests/filesystems/fat/run_fat_tests.sh=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 41 +++
> =C2=A0tools/testing/selftests/filesystems/fat/tmpfile.c=C2=A0 | 324
> +++++++++++++++++++++
> =C2=A09 files changed, 517 insertions(+), 1 deletion(-)
> ---
> base-commit: 2dc60bd9975fc8666a13d58410499e06e6799ba9
> change-id: 20261126-work-fat-tmpfile-0d0f49e95d8f
