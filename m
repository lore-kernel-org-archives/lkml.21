Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795029091;
	b=SQ3QxGvoV3fb8xHDqF55pCB3PUH5cXopgXMCGZBJoZnURPK6OZgzVwKs8+VPC702QEJ7
	 kkuwAw9lqPGjJrSVfceotlcW4L2c4GR9fcp6ChzqZm9WH0bf8OI2g77aRcN7ozBNgbFdT
	 /YxGqT5D8wlsowkW3cXhTmnRkt3kJoIJ8jx2cFIe+9bvDjeZoq+bvIDRrMHfiYsrEnAaa
	 ob2o2piYx2fhYRTbUcD73AU3toSVqPiQ83OjShHign/NZY9KYVvpZxmXrtRaGg4ualDTt
	 mPTlRXFjX5pUn/97hnMxKkylHfPdULP3bfZ343UVreJeuYd/lOmpNCV+zBUtz2E45uQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795029091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LXEkYGgvMWa5pDFl9sPPUTFtCXHqqa1pcN02A0ROHOE=;
	b=HHKd58USy8/ocda3apV1muq/yLD5LHw8TnnAv3WR0NKhvSXHClcy13O3TozsBRoFAb4p
	 P7ow0aAdD8PdfXNBw1THDK2ZZVyDur3t68qy+VM5uc61YQE5ZZbt47jJgs4LiOq3aw0tQ
	 Mh/MsKkxX7BHlwrWuTd7FKe9OdSrEH1HzDx6BVurT7kk4yopRTLcsxr74AekqlezXHx1x
	 /a+gsyEfeG3HHl4TtzYkSDtLHKjBqC9gNM+a0R1Hz2/hufndhC6uKzkmo9Pgjwri8cjMw
	 OnbPDRWOMUJcd8Y2xmYMJhck5vpEisGNDpatkff0rKAB/Nu6hwA/4FJJsCyuf41iyHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YLjDIpsz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78D6606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E78D6606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YLjDIpsz
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-99e09f4c44bso426824241.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:11:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795029090; cv=none;
        d=google.com; s=arc-20260327;
        b=b6/20tOukNjjdJgGR9LyWv94+y5nf142GQyQQT6FEE5uUBD6bpZaLfg1T7ruVjILrf
         E59f+TIF6K6RbZzZxWtQGkB7LjMm0w1fyVxMCMV5YJ0qUL/p0pkyFEnNLAxTJeiNBuek
         ucJATnc6smzYYtKfSbBrVkwblrsl2b5V8iLsG697IkA4JIQiVlqQ/zHUuyKFM78CHpsP
         kvJWkB/XDsYnlCwf0i1C3jbD6PSOV5lTXWDWAc2OucSN7QyBq+fXB71eMUYjxjxbpIKi
         RsGt8F8H1nCTLhW5YfDCb/fHGWrw4ZV5fuRyueDKuldpnEjPYlge4obnE+vX7tqGJKpc
         tlPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LXEkYGgvMWa5pDFl9sPPUTFtCXHqqa1pcN02A0ROHOE=;
        fh=YZjK6jlLyhykOjFVIfi1ydXXQxP6W9DRn/k/IXt1Qwk=;
        b=Pprcm3X888abl+UQ0ebxpCWTMHDh6eQ/saKQ4hTTJqQKklv/8ZATBo9uHRx1sCYylt
         5oV941ttLwPNsljfr9WuIrk37SFiLkkRXphuPinsZ/F5jZnXOJ3UGxEE+65RAqE/kLPU
         1yTqb75ZldZmr4L1f82hmTrDYC/tmIZlOxzJ0r0eNt5w2Lv0bNqP8b8ZbiWjk9M3gBuK
         9B9I2ZZ2kL+fJboKSeCtLGVxbjdhGlCt5GcxGLfmjzOoaP/gsfLuzJbJeEyk22tuPwhz
         xXJo4/LU31h0TuuQ+B2OZ6G3/hBgPSJa/lsLEyKrU2LM3WxpO6IJCsH1BVs2f+2KeKXE
         krQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795029090; x=1795633890; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LXEkYGgvMWa5pDFl9sPPUTFtCXHqqa1pcN02A0ROHOE=;
        b=YLjDIpszO0YirWAVHA7ezgPmsJYMNtK/wtHWgCgBirL8/MSHi5w9E6KvRZcxzEjQCW
         Gscq017bpWxhjGHI8sQCqUWcWJpc69KoWydWoc268OAinddGhG4clmc2AwmWXTYj9bUZ
         UsHcQCEqYoS6zCjLlNHUKjRZbBs8MaKhbuDfFn6LcSvhOvxnuGFZJGYzJ6tyagCfHPfI
         jqMH389N2DL5wCJ3fL0rhKw8u8U+LYtv4APlfGx2Ak6t5oRvZ2kFw8Y6/4mVr1l+yCWg
         syimTGD5UbdXhXwAi+f1W9MZ6ZWkW8QARBpqq4EWkgLm1cK9QpcNUBJwz+H7mrpDtegJ
         qaEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795029090; x=1795633890;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LXEkYGgvMWa5pDFl9sPPUTFtCXHqqa1pcN02A0ROHOE=;
        b=qRu0TI5gt9pwKiccXr2OnzImxZYvdTNWysjX9hqJe9zGNFei46kz0Xlh6kTiAQvZ0n
         CexREK9z2K2X6Dd5WJjTQoP6yd6JKLj6J9D6V5OeCRb1hKN7LnF9IE8su6BE1al0Cte5
         YK3nVSH9Xr9lTv2EIEsXQMPWil1xOmAQoog40AyaMjDZOLbX2Adg0+vqc8cCxRNcVfim
         3RxRJq/cfTpABQugG2xhFxh35z2HmyIuK0BMh2ahxCz29Eiql6xPmvgOFiF1H++OKiU+
         YCL6nZIAAjoaMb+0Uc17sdK0WTH0rRzmzd29nwmIYks1RwWjHj28eJo5Fgoa6KqBnuOR
         PPkA==
X-Forwarded-Encrypted: i=1; AL+hErEtYH297pv1UQNEIy8Cfelb908gQgqz46WQFRnE/FmM8UyU3E/R5AYAV5Ib++quzpijRQ8+OtdvHlLNHP8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/d9A8zshNiNwj+LrEdtVBS3qTJIW5GrWXOh/aHDmiQgDXA548u
	wzBCebT2t5AB9h/jkMvApjPyYOamJHqDWJzvANXCVjRV5zZej/JerfEaiWS8e8f8jodS4eptiL/
	3Z6GazEmbe2/ynZoaMwep5aeiZbQVn4M=
X-Gm-Gg: AYBFou0iJjuOSptB7wVeHP6WXLIfif+tjvoRW0th/+mLjIWeWxDchk58TXQ2rvXevA1
	MRdlCXlD79WBxd0vGsNUqDBhahYPCbXfLmrRlDoTJaaGTncjt77MI75JLnH3czlgFzCp5DUj6Dp
	wU7/XCOSbS3wiwiqrJ9E5ybJCpV2kWUz2V06u09cLitswa38m/sWe036fYOljXgMh+0ESG8mkAs
	2JTICLQhkfyyuLELxJtzKWg9Rf3+coWbN0f4c26HnECwdv4yKgCMkD8a1bwzM5bnzPpjOrCniuE
	ifrluSnZSDnd5Odd1R4P9G3Ts4MS2VmlmfxnEwOdrUc9c+fIdzGvtiD2gkP9VUTc2vxxKb1btvO
	Xt6kdhnHM2NNt48cWoJcbmGNgRuelxWscVRX+Cfpn/ClTcEL/EEktc+s5fLJyS3fR/D7/4JafpR
	t5coapTIpC1Yq8OUep9T1Zh7o86OQgDhCVGNA4g7DmDFgLG+Kd+Df6vDrmGTcfQIxE+o0UWI99z
	heGHjZJlYETzaqjGhVVpLkmDD06hw==
X-Received: by 2002:a05:6102:14aa:b0:7d2:d45e:5c93 with SMTP id
 ada2fe7eead31-7d6ba3e9fa3mr1819932137.9.1795029089923; Wed, 18 Nov 2026
 11:11:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-submit-rawnand-bbt-scan-error-v1-v1-1-0bef8334198c@gmail.com>
 <87fqwyjwvk.fsf@bootlin.com>
In-Reply-To: <87fqwyjwvk.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 18 Nov 2026 12:11:19 -0700
X-Gm-Features: Aa3M54p2_ByIWbVJYkEEnfzHCTB6JzDSXDEIgLPfoD2Cp1gkQl0pFmaXqwRwPHU
Message-ID: <CADvTj4rY=fN5=RYbhL_X56O5kbim-NZWRoRMQJAndZAxUZUo+w@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: stop BBT creation when the marker scan fails
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Thomas Gleixner <tglx@kernel.org>, 
	"Artem B. Bityuckiy" <dedekind@infradead.org>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 2:45=E2=80=AFAM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
> On 03/11/2026 at 22:52:39 -07, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > create_bbt() returns an error if reading a bad-block marker fails,
>
> This sentence does not mean anything.
>
> > but
> > check_create() ignores that result. It can assign version 1 to the
>
> That's also unclear.

It's just stating where an unchecked return exists along with the
potential consequences of continuing without checking the return.
At least that was how I read it.

Is this commit message phrasing/style weird or something?

>
> > incomplete RAM table and write it to the primary and mirror locations.
> > Unscanned factory-bad blocks then appear good in the persisted tables.
>
> Here is a proposal which I believe makes more sense:
>
> mtd: rawnand: abort BBT creation on scan failure
>
> create_bbt() can fail on a non-ECC OOB read error, leaving the RAM BBT
> partially populated. It is preferable to bail out early rather than bump
> the table versions and write incomplete primary and mirror tables, which
> would mark the unscanned factory-bad blocks as good.

Personally I try to avoid terminology like "preferable" when describing
code behavior that's clearly wrong, as "preferable" to me at least weakly
implies that the code issue being fixed could be more of a style issue
rather than a correctness issue.

To me both commit messages seem to be equally understandable.

>
> > Propagate the scan failure before changing table versions or writing
> > either copy. Keep explicit NAND_BBT_CREATE_EMPTY initialization unchang=
ed.
> >
> > Fixes: eeada24da8bd ("[MTD] NAND: Read only OOB bytes during bad block =
scan")
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> I would prefer if you could write your own commit logs, giving us more
> confidence on the work that has been asked. You can use an LLM to
> improve/enhance it obviously.

To be honest I've never been great at writing commit messages in
general and have gotten a lot more complaints about commit messages
missing important details prior to using LLM's. I can barely tell the
difference between your suggested commit message and the original,
both seem more or less equally understandable to me, although maybe
I'm missing something that should be obvious?

I did use your commit message suggestions to refine my commit
message style guidelines so hopefully that helps.

>
> Thanks,
> Miqu=C3=A8l
>
