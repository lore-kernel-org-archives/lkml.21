Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461337;
	b=Zrz9tcxOXCQ3+8DeTK3cMZQX/Roxf3T6zuGS0a7smXgETJ0UXpxhJTjyZIiuMMWlGOdX
	 hfjFaIgB1VAI2mHZABdzdI1eBakamOCPrF4v3/BhNAQZVC20N0pDMAT2JXpPhW6BQLFls
	 HKFF5sEfrCi3yrRZt5Di46Y3bzXySzE8bRqFWma/NjrOHUvIjjyTmtrFFTKVs7Ex083QO
	 IAP/K7cKBhkWnHxjf0Busj9KF9JAomU9asekeMGJI2wakgqLgBF0ePFYzTMf+TyilhDBc
	 uQ6mBls0VI6ddV93vAiSjq7TFS3CBRfb/DkbjY1iN8HwYRGIrVbSw4FTcthXIhl2fxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xIfLP4TvL3JwjjTh8/f5cPWGdzjswtvoPPK4nfCYMWc=;
	b=TDpvMdXo3g3sVFxLfUSZ9GKQoMmHb1pEPkDm75MMFUP+Qtdzuhz5Zu9K7bEM5qCZImAi
	 iZxaqjDphZi5yeV2iyjO3eL6oE1w78oT3XmFqTVbxA1NoorXsKPnvSh33RdIKwzsrqEGt
	 XfKbeLtb0N5b+A2EKfWG9kJoJuBPUaBe5YA8eLtEn94mobIvaynACP43yqkWR9qGlobIa
	 d3+5LDfTan3BPzKwJrrTy6OGibanX8db/4f7VdlroBhn2mu6QXxxi1WFZY0tFzqGf11zp
	 QDIZ2FQtv8TWSoauDm+/ZWqsc/mWoPPTUR1o9Zr8RqiJjoTdZ4KWBBpFgkMz5l5Cvzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="Yw9w/oFP";
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1E2606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA1E2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Yw9w/oFP
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c513a854320so608923466b.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795461335; x=1796066135; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xIfLP4TvL3JwjjTh8/f5cPWGdzjswtvoPPK4nfCYMWc=;
        b=Yw9w/oFPvu1PiV1BgkmCGryn2el2h9iRZiwF2ZZQabr6uvBx3tSqIO2BIQHm4bMbMm
         0NQz0A7VWEQbud0xnpdQwkTNaht6/T9qdjLs92+dt4AL2/Lje3glJZcAnXzImjgjqZ1u
         dH22HOfxIz01XPg4T+wG6v26vqwQ+tzDd1mNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461335; x=1796066135;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xIfLP4TvL3JwjjTh8/f5cPWGdzjswtvoPPK4nfCYMWc=;
        b=upsNOYUq/1db1EdK7nSwIxlw6qIqeRJo3Sr/x7Bu0zeICqIBPF8ibcEB1muIG3bnS3
         KnlAreruNpfCwsaIUpOrxgVwXY/3EorJ4nv+71Fn8EYOkgsvY5VkAFiZW40HVSBzvolk
         mEj0NdPh/aYpDssumXN7zwWOwNTNxjPc8PPfIsftflhzb3fdQ75650EJp4BF8w2sxx4L
         7rit1dgJY1cFLdPdZez6rwvum+JBEKZllUsOpjrhH93lP36rAjieFk0gRwbg9FJXD7oI
         Llf0bcYKdlVGPkvCzHmuNa93vxbCtHXTUuMaylNuSxMe5mIiNg7Ll0Jc/p9vYbtvtnk/
         v2Hg==
X-Forwarded-Encrypted: i=1; AL+hErHpSXnmkLAx7+jvPr0j//IYSnK51mry3QsU8CnSvvc9KFvrVY0yNprPT/F5cMPVi/p1X3q/pw0hJ865xQo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/A3RjJnwfe7awQp8RrelIjG1a3IzU60xli5lI3+H3vXvLfMBEk
	HcggoqZTqDd/Ct1zJZVXFzuEEIg8jiVzl/S3v0Dc2RuvfB7j9F5N9RXHNeDiNG3q0KTJFchbJMd
	PYf1WCcfE
X-Gm-Gg: AZFdTZcmqS/4yT7Qd6uoTQ6HLL/arV4WJL/WfwcXjSCqhbsdOUuoTkVxDzT9tSxrz03
	MaJL4fOYPQxLMuLhfTePMX5iMek5F6RkROhatIT+sxXLP7KszGcO+02Gk5J5HswZoWspRf3oUjc
	Hc2RjzO3sU5y8O19P3sOL15QkwxSh8QfgQmb4IwI9eqqxmR9LY/boFZPDaBsHeyU/2NWcEPVv2V
	5QkpN99m2l/lqg1+TCRiK0PJwlrEpUqvILepIHzsUGgtjYj4VCWoDZy9ROwuQb114dC8Ygzp9nL
	IMqxf77l3MufGrDX/lwzppROuXxPtnE4PQDZnHcl79DRGN1wuIGauXT34UuIzDKQCyyzITNjKwx
	2xgZOX/Kzta+LvgYgkbG6VmojGlMQjG9WYmfKfMxDbXVxqH4YIn5CW+5Fhz2um1/X4wDAGN24NI
	2+HKXqijQIZd1KqsCoaZsrs7wWrpIFnf+ZeTrpC1OGyE5dGC3c/OQNlnMHU6qzzTPuiQ1uCECJ+
	MbDMNlwq6/DgUMWIC8RYRUWvndFtJn/1IB5dHowxKEA/U5dIqrTnG4d3+AVfcibMuu1U25aHqV9
	JxE6ZdPxjeP+8HaNJ/2BmBK/2Sr7PXhJLc02BKeAnZTveCGOns7rOPEQy+uT1tc/gmsU
X-Received: by 2002:a17:906:1b15:b0:c40:6ed9:b962 with SMTP id a640c23a62f3a-c513a9ab46cmr811631966b.26.1795461335022;
        Mon, 23 Nov 2026 11:15:35 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afed607sm432819266b.77.2026.11.23.11.15.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 11:15:34 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c51373ae637so563490466b.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:15:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHb7XrmSxijj164CrfC7ijcnZHvqH78GIJnzE2HsDJcK2sqp1bAQ5wSZCGnepGNZM9/L9Z90547UjL5oqk=@vger.kernel.org
X-Received: by 2002:a5d:5847:0:b0:49d:1ce3:1849 with SMTP id
 ffacd0b85a97d-4abb47b2449mr22428102f8f.21.1795460833131; Mon, 23 Nov 2026
 11:07:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116205320.1621386-1-dianders@chromium.org>
 <20261116205320.1621386-9-dianders@chromium.org> <20261118095418.51d30ee8@pumpkin>
 <CAD=FV=XZP5ZD8J8k5wD5XgQP-sF1SEoZNkRkXyYL1ZeuU187_A@mail.gmail.com> <av6J47fOAYxejSgr@gractus.seuss>
In-Reply-To: <av6J47fOAYxejSgr@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 Nov 2026 11:07:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UQ-LSqJ0m4h3nvatYOV6Jc_gezOb+SHTzUcx2twytEaA@mail.gmail.com>
X-Gm-Features: Aa3M54rVuIOpXpREPYHEaLP2UUxHM1aMZ8x1gcb9luvKIP99K21qY4Li68E5VW0
Message-ID: <CAD=FV=UQ-LSqJ0m4h3nvatYOV6Jc_gezOb+SHTzUcx2twytEaA@mail.gmail.com>
Subject: Re: [PATCH v4 08/14] libfdt: Speed up fdt_find_string_len_() with memchr()
To: David Gibson <david@gibson.dropbear.id.au>
Cc: David Laight <david.laight.linux@gmail.com>, Devicetree-compiler@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 18, 2026 at 9:38=E2=80=AFPM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> > Agreed. Since `p <=3D last` (`strtab + tabsize - (slen + 1)`), `p[slen]=
`
> > is always in bounds, and checking `!p[slen]` (i.e. `p[slen] =3D=3D '\0'=
`)
> > before `memcmp(p, s, slen) =3D=3D 0` cuts the `memcmp()` call count acr=
oss
> > that 855-string replay from 187k down to 14.3k (the exact same 14.3k
> > `memcmp()` calls you'd get from scanning for `'\0'` with a `*p =3D=3D *=
s`
> > pre-check, just with half as many `memchr()` stops).
> >
> > Timing 200 replays of that 855-string (11,259-byte) Qualcomm
> > `dt_strings` block with `gcc 15.2 -O2` on x86_64:
> > * Original (per-byte `memcmp`): 3.45 s
> > * Scan for `'\0'`, `memcmp(nul - slen, s, slen)`: 0.45 s
> > * Scan for `'\0'`, `*p =3D=3D *s` then `memcmp`: 0.36 s
> > * Scan for `s[0]`, `memcmp` then `!p[slen]` (merged `c954f9dd8357`):
> >   0.27 s
> > * Scan for `s[0]`, `!p[slen]` then `memcmp`: 0.21 s (~20% faster)
> >
> > Since you already applied this patch to `main` (`c954f9dd8357`), so
> > I'll include a 1-line follow-up patch swapping the check order (with
> > `Suggested-by:` you) in v5.
>
> Uh.. "you" seems to be referring to two different people here.  I
> applied the patch, David Laight suggested the optimization.

Whoops, that's embarassing. I definitely glazed over the last names.
Who could have expected two people named David?!? I will read more
carefully.


> Fwiw, since this further optimization is essentially free in terms of
> code complexity, I'm certainly happy to apply it.  I am absolutely not
> keen on further micro-optimization of this.

OK, fair. Do you want me to drop the 1-line patch from my v5 draft
then? It's basically this:

-               if (memcmp(p, s, slen) =3D=3D 0 && p[slen] =3D=3D '\0')
+               if (p[slen] =3D=3D '\0' && memcmp(p, s, slen) =3D=3D 0)

While it is a micro-optimization, the code is no harder to read so it
feels like a nice free speedup. ...but fine to drop it, too. ;-)

-Doug
