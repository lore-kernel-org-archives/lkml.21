Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700010;
	b=QrnvMl9Bid3ND7R04dNaKxI9RuvIM0AVy1twJJsPfaa0r4FcopJa4EKOTTNhwLJkknUV
	 muSNf0UqFNgNFbB8uAJDRK2b3l07SuGng2AQtQ280T2/CPmL3CVA1qBu4AsPFLHJUxykm
	 HY1D7dxbXfbHirmMzq6wVvAIkHC93E3C8KfgzQkN6XMEnhM11F80HztX6u7vNAPRhdDwc
	 me3gkESK1Hhcy4AqbWSc3C9mWW9wTbzuloPpbbyAhr5PiMHpdF6FdFtumGRsUuHF2kX/v
	 44Ic0C3+orEUh9d1pLUhYZHjDGXDW/0BEkGsTLcfrHhW8GqzDInoECplB7S+46wm2uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700010;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HcwFZv9BM0w57FN62L5UyDAXYgvPAV25zeOmEc/ACiU=;
	b=MzNwnqwLuVCSqWlQIREy6dvml+eyF0eI0VSpEfW98C4yADt3E3OM30CYUyBjECI4Dlj9
	 GLq9y5iV3alisf+uvBJ8v3uG8Z1Cg/IwXs9iYhRQAFpqOfdnEh2rnDX6xnJmc6ztBMdJf
	 uVYV6Q+k6if/NH/FP4stWmKl02/Br6NEOFXx4HX4dNB5nS09ulxk7N+HlotIgA7Nd1Gbb
	 8PeKR5mIVVz2M0P4VhB50Uq9Ti2Z7kTB+lGj/RNxVd36+YG7vUT8i6PNbw3r1OKqBdmd8
	 oFiAVTf/RbXTy1iuZP7MWoMQ+2+vw4X9oC/jncRrqrx3BZGOGaI9C3ZO/KXMOqZ0r0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D86F606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D86F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5eadadf23e5so4924014e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:33:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795700008; x=1796304808;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HcwFZv9BM0w57FN62L5UyDAXYgvPAV25zeOmEc/ACiU=;
        b=mD61/n5oD/qO3RRh5rgEfrpH9P7+rSIxYcIEYHcHdh2BPGOOVykEzgqC03ESn6VJr7
         NUcgAReS1j6cZeCj8y+cncpiLRyf5Y9HHGqI2hsmDD8z9K97AvkMmMLvlp9AmK4cTL/1
         iR78qTUkM+t9fVLCpwhMTGX1zwqQdQxsZPdtjWt3OnV6ls8i1q1qIwc7MdriKCawJReL
         ZFAVm4nWQSirV7Kn6d9RCa4nRuCY773Nqp8sZYU6RiwghZrHOD1A66XS1pdf9L9/ZGkb
         7cGW+fJYNRVOvodqX24YMHufwgcLfhnCbqNXDy3CJ78buEXXvzIQws1nkCYPF4ud+op9
         J2ww==
X-Forwarded-Encrypted: i=1; AL+hErFzd9lzLtLsZsptwy6oNDXXnuCU3gwuGPOlaNsW8+5kn+bunzKIzBqeUqZBX4x5+/WsbASCpuSsT6IhNsQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Zh4sRlUQdKurz9VzjTB2R2O7nMwbmybkwwSsUqOO4CiPrZO6u
	Xw4tsSgcnJspi6Aoqc6Hp79oeghgfYhqivnrnZPUxhylfP9lgbimhNQoPixQpPb3
X-Gm-Gg: AZFdTZeMjFDeXA+cYaQArT6KoNiUfZv99JIigoMGZVs27b+xctGrDSUKrgHmqYOQG8x
	y0eBcZ3yZu3PLYvlI8VMgQAiz1iGUBdCnDw0vKEjUnvbRB1fHb73wxu58ctWXf1JHgAcH3UR0Xb
	S7Mcz4cecavyVkmBDpL9PekVJI8ZYUE99L/H6aYtVGZGEWZbsjkfwrmv2opLBcpiOc8K1jS/4cr
	OHyT5mc62VRXNdnUniwpYSOIk1iMrsRbkJXEJsTmo5Pqs9EAg/u7Tl6C8OaBfPP2GbZVZPPhfGv
	zgovWcka60KxO7WWKiFOShiXdmMKVgmir0h6AARzG1PVeswBjAds3x/FlQa2D+Gw/9KeLAG1wma
	pTpQWSXYhAvlE9BbAZt5QF5HJF/WQ6oskobVIjiv+29PVo3GKiiPEjFTcf1W6iPZOESdyUe9yfL
	+85/tylqUPOePRrKk7SbNqdl+c3A0irm4baY+DYJDIKPywS/+2KOAGfKjHuZlMhucU0+XfvqXGF
	Ig53zrCgsQrfGJEsdFfstsw4BUTesgjFy0jzkbjpICZ67GSG0xOdVc4M0NYk748k8ZV9X8W+LSo
	AFb70Ok8io3w4WU0KrNVtvHsqVduFEc1T0d43YUV9wbHdyhZPjo2toyp4GmIrykW28Y=
X-Received: by 2002:a05:6122:1d55:b0:5ea:c90d:d1b2 with SMTP id 71dfb90a1353d-5ee8af14e5dmr13075967e0c.13.1795700008414;
        Thu, 26 Nov 2026 05:33:28 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee91b6b057sm18878122e0c.0.2026.11.26.05.33.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 05:33:28 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-74ab99038afso4574156137.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:33:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFUzMUgxb8WMsHJ5hX1bSY+vayeLVcfUriGs/oLcXTJ8+tk2fZDRkKqCepMF/VUP5kee6TRNuQt3908lm0=@vger.kernel.org
X-Received: by 2002:a05:6102:3f94:b0:7cc:2674:b78c with SMTP id
 ada2fe7eead31-7d739391bf3mr11259967137.7.1795700008033; Thu, 26 Nov 2026
 05:33:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110080727.2377040-1-niklas.soderlund+renesas@ragnatech.se> <20261110080727.2377040-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20261110080727.2377040-4-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Nov 2026 14:33:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWpZfsaJOcTEBCugyDgKDXNRje68n59OrGFx-0hJXG+4Q@mail.gmail.com>
X-Gm-Features: Aa3M54q5_iVD09yTxiCPbutEOoqFTTuL8Qbh52NAGvGv6cSg6_A-6RxSK9Zhqcw
Message-ID: <CAMuHMdWpZfsaJOcTEBCugyDgKDXNRje68n59OrGFx-0hJXG+4Q@mail.gmail.com>
Subject: Re: [PATCH net-next v8 3/3] arm64: dts: renesas: r8a779g0: Add gPTP node
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "DavidS. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, Sergey Shtylyov <sergei.shtylyov@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Tue, 10 Nov 2026 at 09:10, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The gPTP module is shared between the RAVB and RTSN Ethernet devices on
> the SoC.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -606,6 +606,15 @@ mfis: system-controller@e6260000 {
>                         status =3D "disabled";
>                 };
>
> +               gptp: ptp@e6449000 {
> +                       compatible =3D "renesas,r8a779g0-gptp", "renesas,=
rcar-gen4-gptp";
> +                       reg =3D <0 0xe6449000 0 0x500>;

Can you please remind me again where I can find this base address in
the documentation?
The size looks too small to me, though, as there are registers at offsets
0x500 - 0x788.

> +                       clocks =3D <&cpg CPG_MOD 2723>;
> +                       power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +                       resets =3D <&cpg 2723>;
> +                       status =3D "disabled";
> +               };
> +
>                 tsn0: ethernet@e6460000 {
>                         compatible =3D "renesas,r8a779g0-ethertsn", "rene=
sas,rcar-gen4-ethertsn";
>                         reg =3D <0 0xe6460000 0 0x7000>,

The rest LGTM, the bindings don't descripe the two gPTP interrupts,
so they cannot be added to the DTS yet.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
