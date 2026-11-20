Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179865;
	b=yyCciDCdKIHP5RWx8h2YCykVihChMHVndwp9iAQhWDt9tlQZKcOA1bxVtBxUId4FSOLE
	 R/efdpf+LSrGPs9iAzvcuBdemh+BvkiVYnptRo43iOOAQgKgfQhgeTYkk3LJu0oU68Oaw
	 YudB/HVVivecrPjRssZ13ANPY99VGjWo8K7G4HfeguUZpZANQDNJ3+XHPKdZP08+oSpJ3
	 53ywRpleFsSbHtCvHgf/xe1z0QUg2t7KdLbPor2r/Oq3so3ruiCR5EAsGu7am5xhRJP/m
	 w2TgA270lIP0H3BVUg9vG85yaSSH+8q4kbbUq+zn61xGvyu1F2DLN7lzcNTgkNBIEEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179865;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=+h9WanPVyW95i/jM7vLnjP8yYqwXvUbwgQl9DDxnzh0=;
	b=LFCQhswrbY8TF29Xl+hIAx0A15pEO46WxEZVHFP8GVBk7FpIjuQ7CCimzlS/iS2z+GPS
	 XBMFW7ujbr6Sl7Z3v8qA4y9JmovWAxHij5Z7HAOCccORg+C+/4wWb8F3cawOulmhKcBfI
	 BIBfaoKm08TprY6VHhFiw0G9o52ilT1sV4LyLNhszbTZ19dl9aqxwQtjFXEvtzJ0+3nKx
	 b2FaZjkROLAZkoQMNZvwv9KAxAOOqbC0LeDx0hdd7ywsuyQho+qEyUCLv3zfaKFczbMGZ
	 5oVHdcU5hLZq/JcArmIxLXAwm8MPsrj5OK5I7vEvnuk20/h4Au8m7n8GE9hZrWbRj/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B101C606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B101C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67db35e7953so1087404d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:04:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795179864; x=1795784664;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+h9WanPVyW95i/jM7vLnjP8yYqwXvUbwgQl9DDxnzh0=;
        b=iHyZoUvTjTN4LPNVDPoQEgXy2KwZCtQHEx4LRRwLzYo95NwfbV04iyxH3zEcyk+gkL
         6uqLaK9PpUiMirz6F/77+qhLICyX+Etv8b71pPxfvxirQ+KbbXTZ2b4ihWExv+9Rvszi
         /hpHuNmLtUoFje0f5c+Ru6ZSjGxTAUUxIm1gX+2RgzFHTPM6+yIuRlA7SbBeBJHqmPqr
         z74bj7xn2sl6XqmHxHeAeZedpo9GGmV/EpAwQqHH4iVTRHxouOSCh8zRHEdZ+CEvbhHV
         Aw/rb+lr+uAI7mZ3dfxwZr7pt/rthlgzrTiP0GFRv4pk2q0E2zzN8eacVRhEbW37NMGe
         PQwA==
X-Forwarded-Encrypted: i=1; AL+hErEfZh7YdQfWIJJF58CNO/ZK4IfZwRl1AUKz0lxD50/PAZQpUV2+EkxmMcw19IAlLeGKTHU4PitRUAe4Ztc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Aw3d3kNUQvaA4R2slU1+IqArNBdeXGlRlGMZizQdIsKp3xc2a
	rtxTwV+6k9Hdlgm4SA01PO8pCqPOevmxr28lAFLsiV1QgEBezS0569wB/4zJcJ+c
X-Gm-Gg: AZFdTZeBHI5ae5d6yjVBm4/BANFW/iSm6I4W30dXOO+gHZKzDEcFMzPvaiC8Cd0guZk
	2llL1kW8VZ++z1/TYXjEORL4njOz+6WMV9HwSnAfd8NOeRGz/B2Rg6iweco6jDRskVtHJLM3Npt
	juzBZwNR49RqefHnlK3t5Vn0HCmSCzOpyZprXtlIAoapXXb05oymJMDQgmd4P9gxpieiFFe5BJ1
	+pymbO736KGZCS1Y4M5XschO+X4GNn8PUXQL3fuhFC874DUTYuINWYfDi5WDe/6DHZs5Iy8Z4Tt
	zKJ3o5FjSm0I7Yo2WTaLyU23UK46WNXEM1N/D0SKvNrcSvi9Q8aNqYJD7ohLVvWGAyy3Wwv5k/g
	vlS5fKkPG4mBa2b5hs4DMjFWcHHeUrfBsPY8JsXoHqzKLArWG62nkYeRan5L1wXmfImkxs0oi18
	xoqrEtiKVH0rsFVvc5tg62WUhBTjGZKAAp8DILpETv2rDgm7uQoYq2lSPAU/ybmUmeT/Lo//4zN
	d4BC13CLPU0M8YVwr1evUdT5nV6yqqh+PCeZ5NNWG2wrtYSZZBcd9GeOEHa09wDHo4XhII6Por4
	jp+6Y770qweRhc88sZOzHN6AFXnvqczoS0rIDX47hgtklF5E8PMQTqiOme82VC0v2AbfsI4=
X-Received: by 2002:a05:690e:128f:b0:67d:c8a9:c607 with SMTP id 956f58d0204a3-67df447fee9mr1300158d50.58.1795179863815;
        Fri, 20 Nov 2026 05:04:23 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33b498asm1519821d50.19.2026.11.20.05.04.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 05:04:23 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5ecd9a400cbso575105e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:04:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEASTo8IaXaljHQb3LHXCe/2NNd7+QgARJXUJTG1dDbXibJZKmRth0uiqYw2ubxT1taQJqE7LyxyeI0c9E=@vger.kernel.org
X-Received: by 2002:a05:6122:488e:b0:5ee:415e:3f41 with SMTP id
 71dfb90a1353d-5ee8af0e00bmr1534352e0c.7.1795179863003; Fri, 20 Nov 2026
 05:04:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com> <20261112-sdhi_rzg3l-v1-2-ca30b209615d@bp.renesas.com>
In-Reply-To: <20261112-sdhi_rzg3l-v1-2-ca30b209615d@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 14:04:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUKe9XBEzJjGq756FBh_7KxWTm65zTzCYG_ciKeJ+pGWA@mail.gmail.com>
X-Gm-Features: Aa3M54qZmgJNvwjJpvCbf1Dypm4EnLng6ZEIN-JT-GreMyTUTy4luuL7Zr9nQ7c
Message-ID: <CAMuHMdUKe9XBEzJjGq756FBh_7KxWTm65zTzCYG_ciKeJ+pGWA@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: rzg3l-smarc-som: Enable SD/eMMC
 on SDHI0
To: Biju Das <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 12 Nov 2026 at 19:48, Biju Das <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add support for enabling SD card or eMMC on SDHI0 on the RZ/G3L SMARC
> SoM. The selection between SD and eMMC is controlled by the
> SW_SD0_DEV_SEL macro in the board DTS, which must match the position
> of switch SYS.1 on the SoM. By default, eMMC is enabled.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi

> +
> +       sdhi0_usd_pins: sd0-usd {
> +               sd0-cd {
> +                       pinmux = <RZG2L_PORT_PINMUX(5, 0, 8)>; /* SD0_CD */
> +               };

> +       sdhi0_usd_uhs_pins: sd0-usd-uhs {
> +               sd0-cd {
> +                       pinmux = <RZG2L_PORT_PINMUX(5, 0, 8)>; /* SD0_CD */
> +               };

With s/RZG2L_PORT_PINMUX/RZG3L_PORT_PINMUX/g:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
