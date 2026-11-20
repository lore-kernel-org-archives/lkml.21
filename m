Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172455;
	b=MY794emWwGMbe90oFNC4amBdJsf0rvSpo45EinBMAATJtcExfBo8BOliY/PpKGijYkuQ
	 xXPj5W1goTtxT8u5dhD486fKoJHYWs3YVNt0DXZ2CFjNPC/nbKTmHtRIsBcyh26oYr5kb
	 7nOrqcIQC3SdRUdNeuSfP5tXEPUztYQcfDaSqQ8jJccdUeex71YAeFhr/a/nKbX3Crahm
	 9YF6WYV0yAtRUCEV4yIz0qvhA04zjQjNm+FZlxWZMbpqZjMrJkMX7EPyfCRJck3739d62
	 3Xiv9za0oUKVxqbJuMGDgDwxOndYux69pki22VCOMtArdvuZoviystpeLdQN7gPMA5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172455;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=XC0FYvI7J7PY7eGnEaiuIuCRfsjCJPAQuXRpzV9YviU=;
	b=RGv5lXqwWHx3XV8LgvGcy2peluZfDxS6VSPecbPwI3IlQ4B5Ld69O0ceLcsMbVdIykMz
	 7TQsWdpIn03Sn7XrHXE9yXqE4SGPRF2YzIflSUSA6plA7dJl4Hx17DSABrBzU/TLM4VzY
	 1YQNcxW8X6P1t6+68vfi1BgkRh81HecBoTr0pXp+IZPQJT7CQwmLK4PzE58GVkh01/BB0
	 xJn1LTn1886uIGVX4IFhFhhSi5hE+oXHu3ytrDrFB0p4GalJESouN1g5qN3oWnTgDCWTM
	 HQ4YFYBrifbB7t8NHiBXdxL+yei4U6dvcC/bJxYvu4wjyY8oe59g5GuhiZ96CdY2hdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.43
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33F3606A330
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D33F3606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-745497ac8fcso275459137.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:00:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172454; x=1795777254;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XC0FYvI7J7PY7eGnEaiuIuCRfsjCJPAQuXRpzV9YviU=;
        b=xKOIdWoDF/TtlLgx7ZdsS/TjVvfVeXzd4aXKnkuMNBzn/tgqyUwWjJ6QuForYGZ8ZL
         lAYCOOXHmFMOCtOIEZeTFZHi95fTzKIkoqIrCUZ0VbUn0bIhsMy5KcLP40smopgJ3730
         3fcl3WKIRm90buQsT2AM4xKQEPfFHqP6sVTRDkAzuSRPeoyiXcIbOt+zHAwx34kTEyT+
         RLjYbpMcX6P2OfYPaK7UIErenxJfC0fpspql2FXAfF96iOLhJwFwEoKp4mx4/R6yV8fz
         ZUWpYXng2/YuN2lmJawCjHrdT5KEzNp7v57fLMjnsV84BoZe/yAaDHQk1YUOpF+2aNHf
         lf1g==
X-Forwarded-Encrypted: i=1; AL+hErHxN2zF3j379m7TYtE5fpVLf52RVug/n90M8EVLBz6NRMBDMGfEObvXC3zJA8a7Mr1oCvr0JyJpBCXsuGQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VXAKF9HmTJaIQrBDnWjpgAMMU7sOGv/H1rSFJMq2NSui/LUb2
	N/DVgz6YGI9qHNA2aqUToUfRlxHtLZZdiWjYRJLHoGjCUoHER6TxlflP0RU4n2v0
X-Gm-Gg: AZFdTZf3hpQaVOldxsLQ+JrlPSrzE4OrFJGKFTQjVtcIiWIsMVxAFP1VVrOA9hCO6i6
	FJu0X9ZGjAujLdfnMM4Rd5ZZJotINVyK0xXUjHAtaRhYhKia29DLfjkQA9YS0qaCJAvDch5nshc
	AM4exHqDF4CF2rp7BhkxtQBsJpkAjV77sdMqtMAQmDCnwLUNK9B4BdsN4BzQFWyCDnwiiMEuu4K
	fh8862EVY/WMCnPKBHVpP/UVt/B42Vkv1YGwBC4W/xzl2tBbGiZEhDX7Z6RQ/9Bxm6pi8F7KX9D
	8q+qsRsXT0qPS0k+1x84P+3hGMMaaooGHZocgzSSjbm+3sr1/TyoLFPwAilXMrakV33Sdns71bJ
	l85YVW59ZAQjFCx1aBDFshvNTFrN6by5/j4L4zSU0SizXIgvk9npeKSjtbpSdPc8TJmZ7cco5fx
	GgjifyEY0quii/1CGeAkI178jnWP5HpL8mVmnV0aydyuyxPC51kxgkyIIqZ5M/tqvOu8+8ccMqR
	pV8Iy4718YiIIjXz71KL/adzy8M+9pt/gcOF6WgTIijPOCGlTH1IeN/fWV8eB2SfdDhQ4Ojkw3T
	WchCmt2b5aYDS5jxVX+DBIOmjZF/v38UB3sEPMhJhVMqH0GP7rAa/cqDkJKcKbyILx4=
X-Received: by 2002:a05:6102:6055:b0:7cc:95ed:3147 with SMTP id ada2fe7eead31-7d739689235mr857791137.34.1795172453526;
        Fri, 20 Nov 2026 03:00:53 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7b12eb7sm2660209137.0.2026.11.20.03.00.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 03:00:52 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7cc0e865dd1so253671137.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:00:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHn4Equ+Ua0WN9vIQbigwmfPQIpLOllnJQKAIAWreux1uXjV4cl6/gOK3MfnrhEnBFUFVieauqBWxrU0rA=@vger.kernel.org
X-Received: by 2002:a05:6102:6055:b0:7cc:95ed:3147 with SMTP id
 ada2fe7eead31-7d739689235mr857768137.34.1795172452194; Fri, 20 Nov 2026
 03:00:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-canfd_rzg3l-v2-0-89e06c46f40b@bp.renesas.com> <20261116-canfd_rzg3l-v2-2-89e06c46f40b@bp.renesas.com>
In-Reply-To: <20261116-canfd_rzg3l-v2-2-89e06c46f40b@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 12:00:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVe5agtLEH=EhD1Jfok8h19Or42u0GAkbxoK1juaJj2Xw@mail.gmail.com>
X-Gm-Features: Aa3M54rO1S0UF9YXcKOSJOhVHRxGaMtumaKHweYg3txlmV2R4gs_ta_WfKp8DhI
Message-ID: <CAMuHMdVe5agtLEH=EhD1Jfok8h19Or42u0GAkbxoK1juaJj2Xw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: r9a08g046l48-smarc: Enable CANFD
To: Biju Das <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 at 16:33, Biju Das <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable CANFD channel0 and channel1 on the SMARC carrier board.
>
> Channel0 is always enabled, while channel1 is guarded by SW_DPI_EN
> since it shares pins with the DPI interface. The CAN transceiver's
> standby GPIOs are conditionally wired up based on the carrier-board
> switch settings (SW_GPIO8_CAN0_STB, SW_GPIO9_CAN1_STB).
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Reverted the order of the SW_DPI_EN and SW_SD2_EN, to match the
>    signal flow order.
>  * Added missing check for !SW_DPI_EN in standby-gpios.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
