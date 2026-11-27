Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795777745;
	b=dq8QGyIW+qZ0nJLwd/hmvWQTZIsFbtMkwiEQCR+m6SwkmGDk5XsOn6k4czGqWW9nk9Rw
	 fr+SsvqGR4PSemheXf8AfOtKceogzQMLxEDLfFi1hJWAUNEIaTB43VkpTDPwEjAUAChw5
	 RsIW+CTMkeuJM+CITRu+fIsNU6VICWsgLsPvwRRJHmEBji0/UVClEyCCevlaaJ+rLDxl/
	 V5jE3vqH0Ira+mNTm4pmbj+LoG38BfYEGKwDZr7zXL2RffUyX2uvImFKAmEtYobohEJA3
	 /zT0L/qcmtHtuFR2vLSADwnOYt89q4kv0mzO3O3xE9Gx61W5lsI8l8N27NBsxMt85yw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nbVQk9AKy8lstmppQr9dyYw5GQ/bdNQp4GNRHaf5JNk=;
	b=wZk+RtL5p9zVpRMA/G30xDRFM7yr+9RC59RLFEUFo5KZWwyz6dB0PP+qhvuuldjlY2m/
	 /TqH5aDjoxMq4CT5qRXOLvr4dTr2I1SlmaUxfCFNsJjuT/6OosSa8DzjpEeTM+jZu3Z6F
	 zyvbxGpHFfyhqKeN65modkFuYDS0IgiYN7EqI6RJ7WeWSILNGGDnv56Rxs+70pNfQQKgB
	 Jlsf+HvzZMNxQk5NAugG4otO9/A7xwcFukEkgjF4dMBSCf+TFTSF4b8EzXf8p0Yi7ff0K
	 WsRv4wnS+8/P3V8P2Qv5sYFU8DQBVHSEjgLh0+Hyq64/YtIoss9WLZ1ETiaL+uwR3lw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SdEOoRjY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198D2606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 198D2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SdEOoRjY
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b87a1a2babso15556893a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:09:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795777743; cv=none;
        d=google.com; s=arc-20260327;
        b=hbT3ndJI39iHVL5Hr3Q2C8F6S7ftqG+GIKtgEKWDU6W7jZAusjcHdYc7H89B97F29E
         ODAxVGUzfVmmIYlgiuzLTFbJ20TvyUbBCpZq6QJHmAHszU5+Bt4N4mZYJ9M8qjWRymxB
         Tz+TRkbt5Audm/N3zdh0rHCt/OuwyJN29H9Fq/jTiS2fj2UygSjv2xnTou+omJGuRWqQ
         HILf0tXb8pUeEcCZm0p0RmTdCyQi3+Z7zx0y0egTy/LiTG5eog7R7aizQAqRsgQjfYfR
         JaB3KaixNfLsfjthQp7aGz6Z1HLFlJFOpHdPPmXh26IWtpZY7VThABghXafVLMGBNk+9
         d9CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nbVQk9AKy8lstmppQr9dyYw5GQ/bdNQp4GNRHaf5JNk=;
        fh=bLn2+cv2Jvo3iH6St/uQiKJ7SdMzYa/n4Y2FitvQ1eo=;
        b=OJm7VMF4911O1PtBinvES14NGCQZa0kO780TtLGL6U61Ah4Vinnar7YpPX++wzibxw
         8MZP1gQilw2xea/YfmhlnG3CKGac6H0C5rxAy622H+JN9+r5WsJ0i79bmfztxmKZJyS8
         fHiAWWMhlRs1K3AR85nbdW6lZ6P+kXCUHEq2lpHPs0Sd1j5lYqq+0xJO46cM1mfZdFHe
         a2erUGudI7roAOtLBTVxP62bZFE4Y2Vx3CAJ9Dfn9tQtl/DtyH4c3Yn4PEQ0PfC6flvo
         mrDJyYtAtewmdHtigvSV/KKPhMAVvlvVCaX2DNLh6QPlN7Hx3eomwQS1U7jLxQ9lwqh+
         4X7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795777743; x=1796382543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nbVQk9AKy8lstmppQr9dyYw5GQ/bdNQp4GNRHaf5JNk=;
        b=SdEOoRjYQnNn09Ntlk+Iu/i4zYGtfu+14Qo+DHg2PTORnt65N0sNFDpM+cOHcE0epU
         AI6Xg/rxbiOGANycZMtWzlhEWBnTNdFNOuKdZzgyxo4A+Y3njWSgH2QsHCp7KOqQSBbB
         bC/jMotIMXaDdMnAxj+8SIBIay6MGOb+4aWYD7JMctUmYW/RgrhXuXUseWjGCg84FAfE
         Is+9YMY74nhGDAVtP10VmRCzhEEtHwF/6PKfFxYEdTHMVnK1x9a6COV51h2d5BbBkFTa
         Ofc022BY1u3srJCDIxMn87X8Y9SHtpgvsvTq+kkZVp0IZCu8vv2mcy99UUnh99OE1xux
         vSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795777743; x=1796382543;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nbVQk9AKy8lstmppQr9dyYw5GQ/bdNQp4GNRHaf5JNk=;
        b=TGVAnRWq2b8bHI3CVI+AWpk92N6YToAiuB7Q+4A9v5fd8eYO/q3E1A+DdaMDTZBSBs
         KXM1jxId2puX5yJ7SYOtmQZdttcBDO47FBw4R8ua06ocGdGFv8gB3DiZ4Afz/7eru68X
         Y3jjMp4Ku820oEYpsuLdaBLx9PaLnOG5gh3R701kPifSDzG4fbI0c3wbDG8qS0vkhGsk
         azi+/xGD3pkZO8n9Ind7ZK2qLgwOYe9o3Kwz/lS4V8miHQBrzysdSFXZUv5z2j6exmJn
         zso7WeT+aFAtnKiGwacnhsSNUeJZX/jVktKSQUqrnElLSNhdhiUtPzbJZYUSidtMWHuI
         vLPQ==
X-Forwarded-Encrypted: i=1; AL+hErEBpRtfgTVNaA8i9GPG7gBzV45qtPcOjKM0iLWkYa0aCW/0PEZJEzlQ4wg0oIc9MLtTL9176Qet3/7vsOo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jkHtr05eJR+AQ3oMEwb9nH3mh5UiQ/KVQXvg1y58aXuqTogqg
	U3RHLGhNh7CWGEVvo9WXDtHjF6ja12N1NzB9xzPVVnrXh3jHbbHtjDN+lXmlHclDhyVEwZR0FDn
	qYIBDubmciJLOhvar28+UMP8tDWtV1edqSWTYOBc=
X-Gm-Gg: AZFdTZf2Ujjgr/iqyNcH35WgmXXQ6fJhCUs1H5MXdQBcB38RMHSxHscu9bjCFJH/x8z
	neX2i44qyHUrjeuedGdHxNCpNwymfR6A4mCFTF/06IIvFhITH3wWxotlVuB51mEcEk2QyD2cLQ0
	3IiLG6tvlv6aYmdT6AsckOLx4HZEQhZ/Cpu1uGYoVKq95VILcvozodsDls3k5ym02EaAwb+4ucU
	4Sd1g/Gdrnfp0UxTUi8IuOn49wdsm6xIoVkeN5VkML90iIbzzD6bRhlcZVZZSgs4kX6l8nPn2Ib
	y/4pmBeD5eZt0vdWHMT+Ybt43y2Q918nGybIyAE5j6TVYwa8AfJ4oeGqDsVUJhR03KIm547BkZk
	c/chnKb8f4+f1ZuND7ZzrfaX9pMArX+5xCuRBoWc4IahbYclMbQ2JiVq8WdnBkPDZwxb+6GZB7V
	LyR0wEWE9FpsgO7qc=
X-Received: by 2002:a17:907:968c:b0:c51:205e:6e8e with SMTP id
 a640c23a62f3a-c51319b6e77mr2114253866b.24.1795777743206; Fri, 27 Nov 2026
 03:09:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121-pvr-hwrt-common-v2-0-9f53bdf954de@gmail.com> <7c3674188150b6c7e4da1a7a970c53b545e732e2.camel@imgtec.com>
In-Reply-To: <7c3674188150b6c7e4da1a7a970c53b545e732e2.camel@imgtec.com>
From: Wong Steve <shyckless@gmail.com>
Date: Fri, 27 Nov 2026 19:08:51 +0800
X-Gm-Features: Aa3M54rejmq1p0vEJLPwwFfXDeSKaDA7Ox9t3eoq8elk06o113XEjI9tEXBJlQ4
Message-ID: <CA+X8Sdhk57Mb+iazzBZinyzXeb3JupLWnim=3FCK097-PuBKpg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/imagination: Fix leaks in HWRT data set handling
To: Luigi Santivetti <luigi.santivetti@imgtec.com>
Cc: alessio.belle@imgtec.com, mripard@kernel.org, 
	dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com, 
	airlied@gmail.com, simona@ffwll.ch, tzimmermann@suse.de, 
	linux-kernel@vger.kernel.org, imagination@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luigi,

On Thu, 2026-11-26, Luigi Santivetti wrote:
> this series looks okay to me - thank you! I believe patch 2/2 might need =
to be
> rebased, the line you are changing got recently refactored.

Thanks for the review.

I checked this again. Both patches apply cleanly on the current
drm-misc-next, which already has your "drm/imagination: switch to
inline init of rogue_fwif_rta_ctl", and also on drm-misc-fixes (1/2
with a 4-line offset). 1/2 was already based on top of your change.

2/2 only changes the type of hwrt->max_rts in pvr_hwrt.h, from u16 to
u32. It doesn't touch the rta_ctl initialisation that your patch
reworked, so I don't think a rebase is needed. If you see a conflict
on a particular branch, tell me which one and I'll resend on top of
it with your Reviewed-by.

Thanks,
Suyuan

Luigi Santivetti <luigi.santivetti@imgtec.com> =E4=BA=8E2026=E5=B9=B411=E6=
=9C=8826=E6=97=A5=E5=91=A8=E5=9B=9B 23:51=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Suyuan,
>
> this series looks okay to me - thank you! I believe patch 2/2 might need =
to be
> rebased, the line you are changing got recently refactored.
>
> Refer to:
>
> https://patch.msgid.link/20261104-minor-improvements-v1-1-cc976128538e@im=
gtec.com
>
>
> This series is:
>
> Reviewed-by: Luigi Santivetti <luigi.santivetti@imgtec.com>
>
> On Sat, 2026-11-21 at 15:47 +0000, Suyuan Wang via B4 Relay wrote:
> > Patch 1 is v1 with the Fixes tag corrected: the error path that skips
> > hwrt_fini_common_fw_structure() came with f1f55ed3ffe4, not with the
> > commit that added the ioctl (thanks to the Sashiko review).
> >
> > Patch 2 fixes the other leak that review pointed out: the 32-bit layer
> > count is truncated into the 16-bit max_rts, so the SRTC and RAA objects
> > allocated for layers > 1 can be skipped on destroy.
> >
> > Found with a static analysis tool and checked by hand. Compile tested o=
n
> > arm64 (W=3D1, all files that include pvr_hwrt.h); I don't have the
> > hardware.
> >
> > Changes in v2:
> > - 1/2: Fixes tag now points to f1f55ed3ffe4. No code change.
> > - 2/2: new.
> >
> > v1: https://lore.kernel.org/all/20261121-pvr-hwrt-common-v1-1-784ce45b7=
82a@gmail.com/
> > ---
> > Suyuan Wang (2):
> >       drm/imagination: Destroy the common FW object when HWRT data setu=
p fails
> >       drm/imagination: Don't truncate the layer count in max_rts
> >
> >  drivers/gpu/drm/imagination/pvr_hwrt.c | 2 ++
> >  drivers/gpu/drm/imagination/pvr_hwrt.h | 2 +-
> >  2 files changed, 3 insertions(+), 1 deletion(-)
> >
> >
>
