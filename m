Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197103;
	b=IEWBtl+QcPlsdWUypwQBZQXh+GqAg3wBYBZKYkS7zIW98vfEmCymg8Rt1Cn0a88mgA4U
	 wgWREjyOsWy+pQuuxPO7YC7pP9rhLq49KXcYAPjQuQJUBHOp6SXto3RAxmQ2rF2NFDllS
	 mcDgNhDIVFOQgQ+sUY4SOb5+1aHTzRKCURwfS7f/IM41SOkGkanbDy1k5AXZEn+wRORxe
	 NCXwlg77VlXVb2jkCjJL4x43KEKM7+ya+H8VHoT1S1RnLyEscsOZjQZRkp4IULhkItUnM
	 6kt4mIZlUjVewAcJRZqMUVFLyjGGw7CW+P0RSuqIWuu588wQAK27iyS7fDDXKlHyWEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=kfWnuYyvEsTMkO5AVcaCTU5urGp2CGEcByvXShlC8zQ=;
	b=YvAscMOZbrRQ4lZTlfQRPvs26dpRldZy9EMGXTtL6gFiPOsRgiz4Dp4qga1cXDWB5Gn3
	 +TeZkXct+9UnQnjXsyFQQ4P3H+Im2SHiqMk+KoFDlP5Nvd9pyehBrnSbx1mVd5RuitQnE
	 pAB+o0p1NIrWe+mQbW8zlRzQbooBqvesa8G9rj8p0GSXleatRMhhV0Ga0JcL/uqmc+8MY
	 qE6zzOSIfy4qcO3c4hv87SfATHq6qTiQ4y6YUSRd84B9G2RNjPKohE5i9Z6aHOJRdI1vl
	 oLQllX6DchEhzeQpMQJLNxmksZLwanujDg+WQ+p/f7LyqeEcg0+fN6jbKNRel00m4cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SolUXp4V;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40038606A334
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40038606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SolUXp4V
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d427836e9so186712266b.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795197102; x=1795801902; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kfWnuYyvEsTMkO5AVcaCTU5urGp2CGEcByvXShlC8zQ=;
        b=SolUXp4VEorkJKad9upjK1vgwQSin0LjlGGy627tlxhPv7uaqkjm5Fv+r9c1/c8C0z
         qwGboXLY/R7+Dz8fla+swHf9Vpt+bEHYxUWB5NEcWI+XCt2wFsUetnuy+vWQkLwpiNbk
         M55lP8g7uBt5OBmbANp5LX686eGwzkvm9QIvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795197102; x=1795801902;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kfWnuYyvEsTMkO5AVcaCTU5urGp2CGEcByvXShlC8zQ=;
        b=a5xV+3sM1svPxDjnZ5o4QrX2gz0ElPaTwbEZrKE2Q/NGk3gGTbVKa2Hs3eq2vehvjc
         NfteD7ENgF5sd9BwCKxBe0V0KBK8VRHNm+E/vyy5dAjDzKDNZp+Sp2MdCpYh0xxiAQkM
         fdSyfaavUgEkH1fejWJn8mTB0IA18n4+hztVjOmQXfOWwThJNmsW+d5C8cqcHnXmpMRz
         F/U5wlNpUOU5331kS4ia4BECRsKpHl0Gkri4ThpsgkyyLrzv9Utw7HV5rinHr1+153Cv
         aToKoMNtgWJ9UpYXyKvG8kDB7s3NbRa9jPbUzlM9fX9iqJ1TH0BBFL6k9tzMmTGYMzDT
         8rKg==
X-Forwarded-Encrypted: i=1; AL+hErHl+5ck2HIUzqxoi0TvUYrgl8Ym8DRIC4+BSIodzd3ExDg7SKaxMKDCXmZC7fXfOM5/K3HbFlD6MP3qTE4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1pkUmuoWwabNglDXI7q7oo319ixs1mEEwhn2P2geFHdXJT3hq
	kmSzlWAZk/bIOdk8WeIEZrK5pSeUxVMct7XpNKsJs3IJYT60XtB6Vya9dF7XjVX7sIRb9Hc2mhW
	BnhJ08xAD
X-Gm-Gg: AZFdTZdILOQtckvoKo+oq9OxGX+qBKLp5dROoNslxlCQdZfK575Is9m7PC/EW+qSP+l
	FrGDvHzf4FlvXAI0vaYcvja/3IwL3HdobHtERtjvlq7Vo7JlubBdVeA2cEBRF5i7X3csLcTRa78
	xtFtWsOu/ZgwPT4UX10rDsP1uVbvQvaK7gVd7F/23uJKKZMn1+H5fVewPQnQUr91llIKBKMbHVS
	E+z0ChBy+phBM7akpOE6WV+W54xz539aXc4BYx/+WjrHoAAQ8/T7p9xKQZkQaKOEG1eCsL8i3Dv
	VDYjDPx/EHmIxKzQax598/HhoWTDimhBnzAfrqS3rhzl8K8HljFVeJIg9r4yM/IG/UWoc9BjSns
	5WyfRoGL7lOPzUdSHCVvDxb5B9hspwUHzUWVRA7VcvodnPHR0M5J7XSr0LY7aeiaS2hHIwYN2at
	dpL+ymBfZB1CO0jgTBfHr49JvXua0AZY2WLu5f4D9rYEdFucJI5DGEjQ4LHmCmomW0ncMCwHlb3
	HAWlEgizwViK6gwqBdPz9zsfl67FJHuwuJNFpgkmcaPqUdfqH/oQ6JCk+CsEv8mBr2SToxSWoLC
	cT94ygCGcKWDaCEheWQ4eQqWT7HuxSJxj+15CV3dKgXmVdVJoBa9LC2sHFUkZNTixAYW
X-Received: by 2002:a17:907:7f91:b0:c50:c747:a4ce with SMTP id a640c23a62f3a-c513a4b083bmr412187466b.4.1795197101650;
        Fri, 20 Nov 2026 09:51:41 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae66053sm125428966b.19.2026.11.20.09.51.38
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 09:51:40 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso699341f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:51:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGc5mV1SA6WJ4rUuRJak/eiYciZAKLPiRYZsG/iKN9335QGB25W4h/HCs0e7uTzG+P3Tg1WuKjZAZpnrH8=@vger.kernel.org
X-Received: by 2002:a05:6000:4607:b0:48e:69ff:ba36 with SMTP id
 ffacd0b85a97d-4abb2fc3fcbmr7271207f8f.28.1795197097454; Fri, 20 Nov 2026
 09:51:37 -0800 (PST)
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
 <20261116205320.1621386-10-dianders@chromium.org> <CAFLszTiAJz=qpc0vLFaS_rNBy2QRx27fi1=fzH=vU040f0ctbQ@mail.gmail.com>
In-Reply-To: <CAFLszTiAJz=qpc0vLFaS_rNBy2QRx27fi1=fzH=vU040f0ctbQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 20 Nov 2026 09:51:26 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VWy3wJOFA1O4_S8WKZx5mVX7j3tYMkqdL=o0s3-3EOUA@mail.gmail.com>
X-Gm-Features: Aa3M54og9uNzW7OTwraRJ_B2FTsV1ta7iDBWw_xV6LJGkyirIXgcCMCsJjFCpNo
Message-ID: <CAD=FV=VWy3wJOFA1O4_S8WKZx5mVX7j3tYMkqdL=o0s3-3EOUA@mail.gmail.com>
Subject: Re: [PATCH v4 09/14] libfdt: overlay: Update base /__local_fixups__
 on apply
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, David Gibson <david@gibson.dropbear.id.au>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-kernel@vger.kernel.org, Brian Norris <briannorris@chromium.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Simon,

On Fri, Nov 20, 2026 at 7:28 AM Simon Glass <sjg@chromium.org> wrote:
>
> The test suite passes for me with -Doverlay-local-fixups set to 0, 1 and 2.
>
> One thing I'd like to check is the 'zero code-size increase' claim,
> which no longer holds now that fdt_add_empty_subnode_() is split (see
> below).
>
> [...]
>
> > diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> > @@ -405,9 +397,32 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
> > +int fdt_add_subnode_namelen(void *fdt, int parentoffset,
> > +    const char *name, int namelen)
> > +{
> > + char *namep;
> > + int offset;
> > +
> > + FDT_RW_PROBE(fdt);
> > +
> > + offset = fdt_subnode_offset_namelen(fdt, parentoffset, name, namelen);
> > + if (offset >= 0)
> > + return -FDT_ERR_EXISTS;
> > + else if (offset != -FDT_ERR_NOTFOUND)
> > + return offset;
> > +
> > + offset = fdt_add_empty_subnode_(fdt, parentoffset, namelen, &namep);
>
> Since fdt_add_empty_subnode_() is not static, every build pays for the
> split, including IGNORE ones. With gcc -Os on x86-64 the text size of
> fdt_rw.o goes from 4610 to 4743 bytes for me (I have not tried other
> compilers or architectures).
>
> Please can you either avoid the growth when FDT_OVERLAY_LOCAL_FIXUPS
> is not UPDATE, or update the commit message and the comment in
> libfdt_internal.h to give the real cost?

Ah, right -- `.text` itself grew by ~37 bytes from the out-of-line
split, and `size` also counts the second function's `.eh_frame` unwind
entry (plus `endbr64` with `-fcf-protection`).

For v5 I added a small `VISIBLE_IF_LOCAL_FIXUPS_UPDATE` macro in
`libfdt_internal.h` (modeled on Linux's `VISIBLE_IF_KUNIT`) so
`fdt_add_empty_subnode_()` is `static` when `FDT_OVERLAY_LOCAL_FIXUPS !=
FDT_OVERLAY_LOCAL_FIXUPS_UPDATE` and inlines back into
`fdt_add_subnode_namelen()` (+12 bytes of `.text` from register
scheduling on x86-64 `gcc -Os`, zero `.eh_frame` growth). I also
tempered the wording in `libfdt_internal.h` and the commit message from
"zero" to "negligible code-size impact".

-Doug
