Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795188518;
	b=Jl6lsA3XduvpClj5B6thpwFAuSriAf6ME5vgBH+nVk6280b9DASXdBAiJ+6p0fjpfAYq
	 zwkXWPTmOuBts5AJBthkZoTARld3+9spJa670IohWeCO2/wM1R5zEvccYOge0AgpcNUwK
	 peRleTrmox3ItLQPET2rQtAgfiQ5wTUwjN3AFu21b2e54cb8E9GGGe7dVNU+SsMjuEwRk
	 aKtBwRQaI5SekqyI/KDhLOVBGT9HYm2rgzt6oWbf5yr02+5OoW1tvwX+ASKlYzyHcbZBF
	 R7kdzXnblMEO2JzzPbZEpsx0AqARz82isyiyK1hMqcpv5HD/MOFcGxvv3wvtwfvIazw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188518;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=E/o/DO2Od/0aki1gWxDvnFBe5Khj9rSd55fktQ951+0=;
	b=nGI1rWWJB5RurZDAe+ebeqyVsV+tjQ51vRmo1pOJ/Vponn/bOWXN+LJlztIJUaLNCyyT
	 7wDzA1A9IqGC+znyq3eEWL2d5ETRYex0BRLddXoa2NRzPthefyUlHhZYlGv89lF+1HiEE
	 Og2Jj27kkz14sV3ICP8vhRf/k6mmJyFxwQ2Goqc5e9k+Vdyt0PGwfxvtF5XoyY0cn4REk
	 HH6yGhx3wNghkhuIXLRvyzN9fsV5HL9cMxvpcOv/uB/Nmv9l9TvExn4y3U3EtiMluYsUR
	 KLejb4sdxhq+p+MhlFt9seXzQdnlijjndf+xth9xz0esvHA/Y2jYw8hfSld0z2Q/9oA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dpCi6kq4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B0F606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32B0F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dpCi6kq4
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so1306324a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:28:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795188517; cv=none;
        d=google.com; s=arc-20260327;
        b=DLcMYZ5+x4MnIws27vD9rqM82Y4kaRYxwpztjQgpWFVkPYJOYFPlDRjGhyzLlfe8uD
         Vpl/hn6Ja/NGgd9HDxAC0qU96+zuGym036xT+jn4+MSmoeIngZqAauxk4l9BxPcQ6gAY
         bIpLZT5dIvJjlwLIaCOjnk5EUkRljubZr7yn3YJRc8d5aPhfuew/HkbPvhJokvREKOzl
         HglHy/ZOKwWPCr3Sx0igFomhr1Q54epQ9HFw/jwhYwCYyd/hSFzlnrfdwPVBwDGyfNoh
         /Gn8GawwMtgYd3pkQY8rHzelok57DkwNHrZO1EfY8vynm17x5thA2m2P9upANBhDovnC
         kofQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=E/o/DO2Od/0aki1gWxDvnFBe5Khj9rSd55fktQ951+0=;
        fh=BdNrN34YgapQPoBfbh51EfdIEikwo+ftMnXZ7InTx4g=;
        b=JP+rLviKcnTJvycnsmJc+A86hgHxhMaYMxQYmaHNjfYdwm+gXC7a8oW9i0trmQ9Nyx
         7BuskxvkcaU+zyyKM+zFa4hFFkiVQqOZgOy+rgkUvZ58DAmhQZ4Dic1f6reH197vOuB8
         LYmmOymFcFlPnLKgB8m4Xi2DSpvTIM6N9tWvdTBdo+gKkz6oUUymZ+wJPFj5lAQnadMk
         Np9tRnCUgJhQYfcHU3v45PCyjjKMMXaPVYKMOfF/ClQzG7x227ROFrWiLaLFwlcp0UyJ
         GFxwwPhdgn1OhpclHUCs1PSuaiD9uYunD5FkmO9JlluJe1BA4iyUOKM0zrIbhRoxo9O6
         ns2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795188517; x=1795793317; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E/o/DO2Od/0aki1gWxDvnFBe5Khj9rSd55fktQ951+0=;
        b=dpCi6kq4CDyvW1thHF5TaHWlZS/A8ljmB+P9fRGWV9YNiFE2znpfEOiQUBp6s2tzK5
         xJjAjM0Ly8IaXS3GAbQ9AIsDzXmUPUhQw5HNK8RQvfaAf7J6EGKIwQz21cNw41YgKm0g
         NuW4+IXdYQ85MXbzQbV8ZkJtuVhZXXvHnGiio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188517; x=1795793317;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E/o/DO2Od/0aki1gWxDvnFBe5Khj9rSd55fktQ951+0=;
        b=YWwy1VAA9+XDlDRV07xPABQfvPp+XmLXk3S4g9z3y0VvowICvZFO2prKVMbSHlaVrs
         dez3sIxvqa5w/RR1sgS/75GNamqDqi9vprrkD3OAfBAmPOpGaHbZLHWY2jBOYwzFtoiN
         ekE2jzLfD3WyeZCyRT35qnZG87cvfWquo2KUJK76ang9AvseCaB2rQNLbqPq1rfX2exk
         OSKWFCH+czRNyS/44Q8JdjXOAlbWFt3rS+bb1ZO3JwBsK4ZW1lj1AhvivcMN2jJgc8V6
         xfrvKScqxQpUyULjv+xA2SytmdzHMsy/vPw/bVohpMyhKTdNdFe8zckhKTb040F69Qk5
         RmhQ==
X-Forwarded-Encrypted: i=1; AL+hErEjfr14tXgNIOF46zeIw2WX9zMf2Jc/JqfUjQoodMQjTQdzY3Ii7xk0snWE1QpiAzmiSVe9dp5qwE3xE1E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8L8KA8X7yqM+wZbpw5DmjPq+ibOnAxtll4eYU4JDLGp3ZkSLZN
	VdjXLfkc0PtADYYVpGhlxpizpcUzPrIu7w45iNQLX+L2oeTXFWnkkGwCbCNdlWOCLtVjnyCryeO
	zTcno0qgSXTGGKXz01b8Bhk8lYRMH6MfscdErzVlZ
X-Gm-Gg: AZFdTZdbyWJia2lj+8mGi8F0lF9JpcGnAMlpFJX71X1XNnvDmTxy+2DzcFT+a2rsxah
	LV91KOi+pRwgKsc+rubmGBBQNkVAYOfnDjbnv1lF0XyOrqRwPK5v6Y+vdXBVXtRApzaJj3bRpM+
	CaFd3k3PEFvGQ6dC9e8hEYFKD7iCZ1NQ6FtL1A3uaIxbbzaLKCT4mFFesf4UxkVc6SWtVXeET6i
	IzKLkiHkPr2PL1EVQ6R51FML04EJE0eJdlhzrCz1gNY3wxkfl3ZtQ4q2kKLmR992W/SJVTfllO4
	XE734Ax+FHCCQutc1E6T3bMxqU3kPvpEMuNWywsba6xgon3xdiU/nKbrP8LBSC+xLsJj3OrivAN
	5yA77jQ6SOYzLZsX+yEbVDWe10E6VBiLImv35aCDZTgvkH6AuRjViXxYcwJDdCr8sd+mYuB0=
X-Received: by 2002:a17:90b:1d02:b0:3b0:9f78:4c18 with SMTP id
 98e67ed59e1d1-3b40a613683mr3653287a91.41.1795188517468; Fri, 20 Nov 2026
 07:28:37 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Nov 2026 07:28:33 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Nov 2026 07:28:25 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261116205320.1621386-10-dianders@chromium.org>
References: <20261116205320.1621386-1-dianders@chromium.org> <20261116205320.1621386-10-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 20 Nov 2026 07:28:33 -0800
X-Gm-Features: AclHuK-qPItHO7bqTa5oLj6xwjAWer8yBK3PhZJ5Dri-PQsIA-QqfOCBITlcfJM
Message-ID: <CAFLszTiAJz=qpc0vLFaS_rNBy2QRx27fi1=fzH=vU040f0ctbQ@mail.gmail.com>
Subject: Re: [PATCH v4 09/14] libfdt: overlay: Update base /__local_fixups__
 on apply
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, David Gibson <david@gibson.dropbear.id.au>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-11-16T20:52:57, Douglas Anderson <dianders@chromium.org> wrote:
> libfdt: overlay: Update base /__local_fixups__ on apply
>
> When a base device tree is compiled with `dtc -L` (`--local-fixups`), it
> contains a root `/__local_fixups__` node recording the byte offsets of
> all phandle references in its properties (for example, so an OS kernel
> can identify phandle cells at runtime, so a composite `.dtb` built by
> `fdtoverlay` such as Linux's `foo-dtbs := base.dtb bar.dtbo` retains
> complete phandle metadata for tools like `fdtfactor`, or so a merged
> tree matches what `dtc -L` produces).
>
> `fdt_overlay_apply()` updates the base tree's `/__symbols__` via
> `overlay_symbol_update()`, but leaves the base tree's
> `/__local_fixups__` untouched. As a result, applying an overlay to a
> base tree with `/__local_fixups__` leaves `/__local_fixups__` missing
> the phandle references introduced by the overlay (both from the
> overlay's `/__local_fixups__` and from its resolved `/__fixups__`), and
> leaves stale offsets if the overlay overwrites a base property that
> previously had phandle references.
>
> Add `overlay_local_fixups_update()`, controlled by a 3-state
> compile-time `FDT_OVERLAY_LOCAL_FIXUPS` setting in
> `libfdt/libfdt_internal.h`:
>
> - `0` (`FDT_OVERLAY_LOCAL_FIXUPS_IGNORE`): Leave `/__local_fixups__`
>   untouched. This is the `#ifndef` fallback in `libfdt_internal.h` so
>   that size-sensitive embedded environments (such as U-Boot SPL) that
>   vendor `libfdt` directly get zero code-size increase and no behavior
>   change unless they opt in.

The test suite passes for me with -Doverlay-local-fixups set to 0, 1 and 2.

One thing I'd like to check is the 'zero code-size increase' claim,
which no longer holds now that fdt_add_subnode_namelen() is split (see
below).

> [...]
>
>  Makefile                 |   6 +-
>  libfdt/fdt_overlay.c     | 525 ++++++++++++++++++++++++++++++++++++++++++++++-
>  libfdt/fdt_rw.c          |  37 +++-
>  libfdt/libfdt.h          |   7 +
>  libfdt/libfdt_internal.h |  23 +++
>  meson.build              |   5 +
>  meson_options.txt        |   2 +
>  tests/Makefile.tests     |   6 +-
>  tests/meson.build        |   1 +
>  tests/overlay.c          | 154 ++++++++++++++
>  tests/run_tests.sh       |  32 +++
>  11 files changed, 780 insertions(+), 18 deletions(-)

> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> @@ -405,9 +397,32 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
> +int fdt_add_subnode_namelen(void *fdt, int parentoffset,
> +			    const char *name, int namelen)
> +{
> +	char *namep;
> +	int offset;
> +
> +	FDT_RW_PROBE(fdt);
> +
> +	offset = fdt_subnode_offset_namelen(fdt, parentoffset, name, namelen);
> +	if (offset >= 0)
> +		return -FDT_ERR_EXISTS;
> +	else if (offset != -FDT_ERR_NOTFOUND)
> +		return offset;
> +
> +	offset = fdt_add_empty_subnode_(fdt, parentoffset, namelen, &namep);

Since fdt_add_empty_subnode_() is not static, every build pays for the
split, including IGNORE ones. With gcc -Os on x86-64 the text size of
fdt_rw.o goes from 4610 to 4743 bytes for me (I have not tried other
compilers or architectures).

Please can you either avoid the growth when FDT_OVERLAY_LOCAL_FIXUPS
is not UPDATE, or update the commit message and the comment in
libfdt_internal.h to give the real cost?

Regards,
Simon
