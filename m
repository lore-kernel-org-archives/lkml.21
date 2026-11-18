Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795020062;
	b=tyUKCznRD03+U6p90fVmCO+n4WQqStFXvMza0BrQRC635RFUedVGBYxMJqDKcGsJZXym
	 Y8UBwk20M9qoUdBUqunZqrIzlGjjvSLLVhh14FpJM9miX79QeA7yjo36p2JloK8lvtHHd
	 IocFPfMCZg4iC88J6NUqEw29sRSs3gEc2HyaaABEZepJn/JCyW5WBUw6ENYqtcqlea4vG
	 ieRyRAutUUjV4zGCBqlIG9G/O9cJygF4YA0zA9QYiYIAYxob1NjcErqmPXWXm0KshKQ4Y
	 oIR3t1gyjHEp49X6Bf2DF5aoORtICL3pPa7v6qtsKvciUDPlAUdOR2ZcF4HN3+nRung==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zNj1ZiOii4huTkwwxrEikQoB6e6UFur9DfGbzo+0Afk=;
	b=d7FBYeIF/23GMT/fdcvDYtQieiS9n+9C6Jpx4zHvmSETYXfqf6Do3JIPHGzwmba5YPqk
	 CP+eNT+QygLpKAGhSoB6BiFQtpGDQW5e/hpO0iu9eV3mtKAV9e0BY+bp2sLf/dqqhPguD
	 bvg1VRyUVUm1fIynDCctwKh7OX0OlY0f/CnMDuOxByUTvP2zcBybI7Zh4wt7yMPODAFQf
	 jDT32unZ7wDXl1OThVNO5jCOY1PAgbBU7Lg3GbchWG/5EVPozKqWQeUYToKEhFTTYSX9I
	 Qjhg32ZBjbdcYUqWeY8b865GLJ+/s84UmodgCkFGD+VFO1AlsInXe1D6bEiY2CtwXxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jiCp4X7d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF547606A33F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:41:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF547606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jiCp4X7d
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2901932eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:41:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795020061; cv=none;
        d=google.com; s=arc-20260327;
        b=aDiPOHx9W5aV4BbdFomw0Cc+RGqWUdYP6fOv/HnI+MVxnGfLUfmM3urrVw7UxOCIme
         fUkg/BM2/PogtKQHjBXgPpF6LSF+8vs4SywUGHBVxRgK6Bi365peQ0jtb8HBZcHr3OEp
         Vd3+VaUh3+Td3Ehd7E/8jUp3mmjF3F3KOJXbKL0+9+pFtu4plN7bt0yQwZji4V+kw8Tg
         6qh1aqLioLudbZXg43BMLyspgSjDiitWCCFkRHUi8rpFQQO0bP+D19iYepoMrWhCkZJg
         GS8fu8/hQRmBJhh1V7r495G45LufBVQKTBf3ZEmnlrL6fo9V4v9VYCWZh1gmQxU4MH0f
         2LvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zNj1ZiOii4huTkwwxrEikQoB6e6UFur9DfGbzo+0Afk=;
        fh=/lFgw2HikQQ3x7j17DUOJ1FD7Whqw4a4KS8kjI1HQ9w=;
        b=S+bfuAbSlDTFRHdLkQO4LDD42eslFX8PmNAZIMCnxzzpumcOxM0IBx7B10Ewt+ubmY
         EIS/zbFNSCHbVyUvLRLqTjGkKRm/RrR3p8OC++OeXZoq/jsBDhrAN3FinG9SOi8dWnsH
         KnAm2XM+CKFMDzbahqYbjyKMUN8lID+iw8bPLrucRs5mMAmnMfAJABINqKB5jN8Two+w
         ybeOvPBpAkmrWHhb+tlim7r3aGKPG2pHiiNKDAPswb256bEpdgMuPHOq5PM8faXRDuy8
         ysTy7kVZtUXj3k6DwmBUrnmD0+g1x+/6OkubVamgU6yYU8/h6SYsn2JpPFeI5U8ysq5V
         oUIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795020061; x=1795624861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zNj1ZiOii4huTkwwxrEikQoB6e6UFur9DfGbzo+0Afk=;
        b=jiCp4X7d/JQEMhM6ZkEZrAXPNUliV/kw+xXLCjjNzUEdURSYlpXUCoaxg47mgCuX1t
         hhgmiC1Blo3JKGyuC7qafAC7ofVUDtKDgSGDT1j3ozlySq+RiEesBgU3FyEvCyDErAoY
         yWC/jt2DpWMpgp/KdYkS7L0QNMWHss7lzApj3v4efvmXczOPfGMf6pUInvlnqR3cwjey
         1hi/aQoIMZc1LIOSdM0Ys4cKAeeYi3sjz2/YY0omV2K/tZ9F4iDxsjRUmlo8/cXF9+Qr
         I0K2QeER0T+0sIlT8wxIOn77bpWQjXWFOVO9/jMacjO4xnnE+iRAbtjxCKsFL9ER8AQu
         hPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795020061; x=1795624861;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zNj1ZiOii4huTkwwxrEikQoB6e6UFur9DfGbzo+0Afk=;
        b=pl/qcJfGS2zW7xl+KelStecIdj8bbx3Mctk97wSoIehUYULeWpy9bvc5AXY0HDNrNx
         /h/Okgl/HuU8akBplJU7qSxVSdlGME9PvCFInz/d0QP+Ttjjro6FzJ7Pf7imh+eo844V
         L+feHD4Lc/KrXXwxwwbzygU45lWPTxV5xIbTILL8spx+sC0akFzHjRXcNEam3JPhrUUQ
         3NXid6Uaps0gzsellMTv5+8WX+/S0vTaJn5Rv6Z0jmtAhXf6jSNCZ6ev8Yh8S5EUt0i5
         W5LTntojAtLZurgazfYJnOhULD7eiY+5j4yH7B6LLoeIPaoTzEljRENx/VAmMh+1+Fv9
         rJrQ==
X-Forwarded-Encrypted: i=1; AL+hErFIOQV8b00RQSiWoo5JueeDvVk8zF04SPuwgz9PI1reD0vGhZevBAOg1Gu7g3G19Fjx4+rU8AqsGSqIajM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+E/H4cqwRxCHyVGN4sxNA49/LuI0clakJjCPs82/etioajIhhx
	jP/OGhkRPr3sBSghiBgg+g5Z/dr1OGiV+Psahitr8SvdVLGhwMeLP+yjWT7znfQhDG70i7BX3h7
	QaweBmdXrrEq9osEh0GRjsrArmrLSQcw=
X-Gm-Gg: AZFdTZcFhB1hBkQn/gnjynwhb4GpN3svjYiKPBIAwoT54rDmrKlxFDpDWTd+2xpYFzg
	PtLBJ1szxwmOqXp8+Jeyvxt2N2J9yXSM1JB8+l+TeZJJqXyy8L48gLdkeauho3nm3VIaKPZaBwX
	CeBgxNm9Otv+G17Vu73TxiCFomLBNCN5pcWKEqWXrzvwSSftWADPCGy1FHar6dNCt+96zuNTcGA
	6aUFggKLszesqxVHUN6qKAw0neVn5ZA+w04AB/ayw18LpzTv38yVW1fAK7rfePOqugkRVp7SAtm
	n/HIj4YLHieko6g17ZK38ImJvQ13kGcQXzj8fWfxnQGC3/04I/SvkqPoSZPgo912nOur2jw4pBK
	KKsE6bIOtT8Z4hFUxLT1Y9G0DUnhTl60tB4y/KmE=
X-Received: by 2002:a05:7301:18a3:b0:378:314:4042 with SMTP id
 5a478bee46e88-3828016fee6mr2937643eec.14.1795020060831; Wed, 18 Nov 2026
 08:41:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028164539.3471833-1-henryzhang62@gmail.com> <d76571d7-6c5e-4a36-85e3-db5a5b0cc2aa@igalia.com>
In-Reply-To: <d76571d7-6c5e-4a36-85e3-db5a5b0cc2aa@igalia.com>
From: Henry Zhang <henryzhang62@gmail.com>
Date: Wed, 18 Nov 2026 08:40:49 -0800
X-Gm-Features: Aa3M54qe_yD0XNC9GaTofiJrDb-PQ0zcKl37JpPx5Zb8JNEkYSkgfuhaEqLV0WU
Message-ID: <CANTW0yoj3VstRJ_omwyc=7xBk+VhovWH6wG9xJu5ObbE_nqk4g@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] drm/vc4: dsi: Make failed reads visible and recoverable
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: Maxime Ripard <mripard@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 6:35=E2=80=AFAM Ma=C3=ADra Canal <mcanal@igalia.com=
> wrote:
> Applied the first patch (1/5) to drm-misc-fixes, thanks!
>
> I'll leave the review of the rest of the patches for Dave, as he has
> more expertise on the DSI side. Anyway, you should consider addressing
> Sashiko's comment on 4/5.

Thanks, Ma=C3=ADra.

Sashiko's comment is on 5/5. It concerns the single reg_dma_mem buffer
used by the DMA write workaround on BCM2835 DSI1. The threaded
interrupt handler writes INT_STAT through the same buffer as the
transfer path, without serialization, so a concurrent write to CTRL in
the timeout path can receive the wrong value.

This race predates the series and also affects the existing timeout
path. I sent a separate fix the same day:

    [PATCH] drm/vc4: dsi: Serialize register writes through the DMA workaro=
und
    https://lore.kernel.org/all/20261028181720.3476629-1-henryzhang62@gmail=
.com/

That patch serializes the shared-buffer writes, while 5/5 keeps the
interrupt handler out during the reset itself. The separate fix is
compile-tested only; the RP4 tests do not exercise the BCM2835
DMA-workaround path.

If you prefer, I can resend the remaining patches as v5 with the
DMA-workaround fix first, making the dependency explicit and omitting
the already-applied 1/5. I'll wait for Dave's review before doing so.

Thanks,
Henry
