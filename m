Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795873638;
	b=mQ8+G7tNa9hZ3r+IaZadJX5WO+79OAiSSTHRkyoespUXnPAC3coDjjJ1kPbOZhHr8nhX
	 3VkKVlRC+NwBr7oQjsQJZkEazUmeAvn9qBfyzl58oz7bgtQVqeTg4+5nvcpk4pD6vOv6D
	 jjffM549sfK0FWJV13G/58I9O1HoRe1YIIEss3YoML4/69lZNBBc6xKytcgrGDjJdXOxC
	 CVmoGQbHxXVyEcdE+Yzvi39ZSJWsaqXJrTEuhm6TyOY5sY8u114LJrRqlOhvhrXeIpS2B
	 f2OX5IhTPVKfpIXCJFzNEb62oTEbzghxPA08/sU1KpmTh0NNiF/JZ93g1iuot22mMPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795873638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=r0WbWTy8H8AEJBJ2yF6at8ZT6mtzoF1bxzPJALDoIu4=;
	b=z4y0tqXsvw28Zjp6c6PFgMckbJLrH7pYOp57dvLfMFp7oCJzSSrrzzML1Y6WXK+NNkUc
	 X8Bag4gfV1/DbqalP7dd+vplOXbV5bm1FmHcrkrW+Pli47M3bUmgfXftDnI+ezT2ljrko
	 IDHjqFRuM8GJBNaCvhFZ9j0B1llkXFU5AH2qr+8ybqx7dqHGRgPkXC/uj/ZDxsR3b5DuI
	 8J81LE2jPRgbN8kgzv8hV1IBcpDYkjhbO6WVl0B+ehfzp1bwXPUPgbZV5/KIMthqQmpUo
	 2AoPre0R/xI5baHgTaUHDmj3H5N3+ETArP4ReKZHmVyOP4LshVtvzyf5eEwX/C/sJ3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.tenstorrent.com;
	spf=pass smtp.mailfrom=tenstorrent.com;
	dkim=pass header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=D0uipOTx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AD4606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 13:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8AD4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=D0uipOTx
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67c0bd676eeso6213043d50.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 05:47:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795873637; cv=none;
        d=google.com; s=arc-20260327;
        b=BxRuZ7WiEJG5Irg2D8DH0NtHu2S1D98Ehn+KpkqFJAsntmXeBu0DF+WTVnw9oEbUJm
         1iAViOcMo9JXVZNwMQ1BIE0K+LltErEm460AsI51V5oOKrTs3T+7TxHl2YWC6mTkBScb
         B7cYMwev/VDRASuHVOUQD3HEoA8jS6+XUHeqgYDZnRmS9bH11CMR2vPL5Yd1LAlyZrHz
         bSC3MGJ8qU8yffsyvjW7N1+eVoQ5o2npcM9Exxk0xZ+XrlkQHGXGs6SU7hJj9m+EhcOG
         GU+gsqKwyt0Yzj4Esjui2bMl5kTtmWEoMx8TrnhzC+jgpJ4RpsGATwLOkYlk2FpZd1J1
         ppEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r0WbWTy8H8AEJBJ2yF6at8ZT6mtzoF1bxzPJALDoIu4=;
        fh=u250I5vhKXgPHmA9kXqkqGTBNBtQdZfW7ZweeiqVHic=;
        b=JplEDBwXh6Sr0SGV89EvPJpaFn1g4n5na0iD5dOe21eSVwTRf1411hlDAioxfLPi06
         3TOMsE9WiaUsgybWRwUywDYWK3bQnQsGTchC6Ff46AJbE7oSdo2eqnGV9D52ce85Pz56
         ElDnPr4H4VLviGMGkpl+uaGsZa37Z3Uya2V1EZxeg3SElN6NKiZD0+PVG91z4QZ9T500
         TVLn27GTeZk25JRbVnIU+MvM3pvILjkN9Ee/W4H5bfjVgPAEvdoNW/dYmtPn8dAwCujg
         BEknBgcWKzqji8kr/rM18HYmA0x5PWtrvdD4HtKPlLoSYkvlSlumWyfGMblPyzQOcCyJ
         l/yw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1795873637; x=1796478437; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r0WbWTy8H8AEJBJ2yF6at8ZT6mtzoF1bxzPJALDoIu4=;
        b=D0uipOTxbuZl5ilAGrum+9ZqBr4KKzd2qMCgu3VrnG+UshuBVBiKLPg8wU6BXkP9m1
         crPt1VtBMJHu3jkenaj9R8AyvtzusZGQj5jgW4+VDDRNsXdsKS0ljx+idJ9pBaZHhUht
         3gnuBgzbi+rd2EXSmmEH8f6MQ1z0FwbsLwEhQ/aUu1DSB40U+/bR4vOFLRpHY8e7j5Hd
         laesr+sU9v7zsRhhXwCa9kIgVofi33BFxqwDSUIAQTWjgngrWzrOeDukbsQrcTFKAJsW
         XOSwwZygR4sajBwd6WH9FH5/TiwOeW4iH3eQZ9getvF7C7OiiM4YBqE8C7IJViz2XcYs
         T1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795873637; x=1796478437;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r0WbWTy8H8AEJBJ2yF6at8ZT6mtzoF1bxzPJALDoIu4=;
        b=xSYgqlKAars8uo4LwGIeF3R+jz5t0FqebGZizhKxtxxzlJW2N+cMtO3bbYwm7mUwF3
         2DoJNfIy6AXc7vZ93d+XPXkN21JPdH3idOkTC+/rhqImL4fZ+2ckqwk3pfWuVJeKFvB7
         1ImQjrBkRE395ta8xNlAluKunj0hB/Q1LP/LMMJ+nRuMA8c+Lz/D4tyvanFxpimWuLUt
         rVYst8JPkMr5RpGaODO8GY06vMslI7HPURqwf7L2HT6YFEZhqHepxuUE5lZ+gy/MttQo
         91OYf3xUB8MGacv1mf46ni5kOYCUzV0Kb8tbkTWu0hGFBzRmstKzGn5YbfiJ/oN9gVJ3
         FG+A==
X-Forwarded-Encrypted: i=1; AL+hErGPMAcbAjEbgGlhYa+GrGerfXY6iJ0pPjkhUjgU3CkBz1eiudpT77k3Sr/VPXGigyvkxWifAtbdM6q0q2E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9erAWE1tZ0gkje2R3JegqSy6HQqPput4A+Gx/uWYE+unzip0FE
	UUX9Qid3vGuPBH6f1jh9x4P1WDa0JusvIpU/5cYJMDrKYD4VElsVBPA9f7vyocy5xT0I7pnWrMN
	7sJiKLmXRcQ4w9x/TSbfQr+qYtIxJuyhtTFACewazYA==
X-Gm-Gg: AZFdTZe5fq7kIozQi4+wQHk24DcsLdKCdCxOqDWynqJ7ouN8YEgy3vQpamuOTAaSUhs
	yYCdqUklLgaBiM4K4MUva6AYphbuYY33UMuRU7d+gUnQWKMA0ZwDZE+xXa2xXkAqmx809tTu0M8
	hBhXsKlCbF7tSn3alZp+ut+2KzpcJWWHAc382D6b1HFsc7kN4undGlVqcNN4qCeXnr/eDKGxCRs
	6ajdtkcIa0qLHUc8mZ9Vp/T0DUmrY3r3n7GVai20j/YnNJ9ZHE5f5Qs+WlP1mt76sfrM+OrEU1Y
	NwVZGj5RxX3TlFgp1tlt9UaufUDZgYs2LDnlM8hLMLRNFWhGXCCq/k3nCTQ2adFEGU7k/DZZrwc
	s7lnflwsFpqDPXzb0xaz+5GPd9wScMMo2kC5BhdZGP9/lHauA7P/VheqBV/hUvnidTxp3B63amC
	TDzUXqrxTCdFfljp8M3udPbVaQQQ==
X-Received: by 2002:a05:690e:440d:b0:67b:9953:2d97 with SMTP id
 956f58d0204a3-67df4479b3cmr7173129d50.79.1795873636887; Sat, 28 Nov 2026
 05:47:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
 <20260918-k3-aclint-v3-6-cf4fd4050e14@pigmoral.tech> <yf2dawzefycxhhs7zkua3v3hoirals3wtr6rheh4li33eq7r4i@yb7cem4r6x3z>
 <DN6QXCF5LYQM.1F5IA58ETMXVM@pigmoral.tech>
In-Reply-To: <DN6QXCF5LYQM.1F5IA58ETMXVM@pigmoral.tech>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Sat, 28 Nov 2026 07:47:03 -0600
X-Gm-Features: Aa3M54r7COSuoCAZh2e-0U3S35YxbgE_qpFJlIopzh7FxBeYqA4RHXPR262VGcc
Message-ID: <CAEev2e-XsKPkEuvvdQeOuz9YymoZ_MZ8zGod+AuUUxxQPzLWPg@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] riscv: dts: spacemit: k3: Replace incorrect CLINT
 node with ACLINT nodes
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, Radu Rendec <radu@rendec.net>, 
	Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Guodong Xu <docular.xu@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Conor Dooley <conor.dooley@microchip.com>, Bo Gan <ganboing@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Junhui,

On Sat, Nov 28, 2026 at 3:45=E2=80=AFAM Junhui Liu <junhui.liu@pigmoral.tec=
h> wrote:
>
> Hi Anirudh,
>
> On Fri Nov 27, 2026 at 1:27 PM CST, Anirudh Srinivasan wrote:
> > Hi Junhui,
> >
> > On Fri, Sep 18, 2026 at 12:29:38AM +0800, Junhui Liu wrote:
> >> The K3 implements separate ACLINT MSWI, MTIMER and SSWI devices. The
> >> existing CLINT node at 0xe081c000 incorrectly describes the SSWI
> >> register space in the non-secure window as a legacy CLINT.
> >>
> >> The ACLINT register space is mapped at two base addresses: a secure
> >> window at 0xf1810000 and a non-secure window at 0xe0810000. The
> >> secure window exposes all three components, while the non-secure
> >> window only exposes SSWI; the MSWI and MTIMER offsets are reserved
> >> there. Moreover, depending on the eFuse configuration, the non-secure
> >> window may be entirely inaccessible, whereas the secure window is
> >> always available.
> >>
> >> Replace the CLINT node with the three ACLINT devices, all using
> >> secure-window addresses: MSWI and MTIMER for machine-level firmware
> >> such as OpenSBI, and SSWI for supervisor software interrupts.
> >>
> >> Fixes: 56f37e391a62 ("riscv: dts: spacemit: add initial support for K3=
 SoC")
> >> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> >> ---
> >>  arch/riscv/boot/dts/spacemit/k3.dtsi | 43 +++++++++++++++++++++++++--=
---------
> >>  1 file changed, 30 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dt=
s/spacemit/k3.dtsi
> >> index c3f2dce0969c..74831974435e 100644
> >> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> >> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> >> @@ -1261,19 +1261,6 @@ saplic: interrupt-controller@e0804000 {
> >>                      riscv,num-sources =3D <512>;
> >>              };
> >>
> >> -            clint: timer@e081c000 {
> >> -                    compatible =3D "spacemit,k3-clint", "sifive,clint=
0";
> >> -                    reg =3D <0x0 0xe081c000 0x0 0x4000>;
> >> -                    interrupts-extended =3D <&cpu0_intc 3>, <&cpu0_in=
tc 7>,
> >> -                                          <&cpu1_intc 3>, <&cpu1_intc=
 7>,
> >> -                                          <&cpu2_intc 3>, <&cpu2_intc=
 7>,
> >> -                                          <&cpu3_intc 3>, <&cpu3_intc=
 7>,
> >> -                                          <&cpu4_intc 3>, <&cpu4_intc=
 7>,
> >> -                                          <&cpu5_intc 3>, <&cpu5_intc=
 7>,
> >> -                                          <&cpu6_intc 3>, <&cpu6_intc=
 7>,
> >> -                                          <&cpu7_intc 3>, <&cpu7_intc=
 7>;
> >> -            };
> >> -
> >>              /* sec_i2c3: 0xf0614000, not available from Linux */
> >>
> >>              mimsic: interrupt-controller@f1000000 {
> >> @@ -1305,5 +1292,35 @@ maplic: interrupt-controller@f1800000 {
> >>                      riscv,num-sources =3D <512>;
> >>                      status =3D "reserved";
> >>              };
> >> +
> >> +            aclint_mswi: interrupt-controller@f1810000 {
> >> +                    compatible =3D "spacemit,k3-aclint-mswi";
> >> +                    reg =3D <0x0 0xf1810000 0x0 0x4000>;
> >> +                    interrupts-extended =3D <&cpu0_intc 3>, <&cpu1_in=
tc 3>,
> >> +                                          <&cpu2_intc 3>, <&cpu3_intc=
 3>,
> >> +                                          <&cpu4_intc 3>, <&cpu5_intc=
 3>,
> >> +                                          <&cpu6_intc 3>, <&cpu7_intc=
 3>;
> >> +            };
> >> +
> >> +            aclint_mtimer: timer@f1814000 {
> >> +                    compatible =3D "spacemit,k3-aclint-mtimer";
> >
> > I think you'll need to also include the "riscv,aclint-mtimer" compatibl=
e
> > here so that this DT can be used with upstream OpenSBI. OpenSBI doesn't
> > include the spacemit specific compatible. OpenSBI boot prints this
> > currently.
> >
> > Platform Timer Device       : --- @ 0Hz
> >
>
> Currently, "riscv,aclint-mtimer" is not part of an upstream Linux
> binding, so I don't think we should add it to the K3 DTS yet.
>
> Your colleagues at Tenstorrent proposed adding this compatible in v3
> of the Atlantis series [1], but it was dropped from v4. The v4
> changelog says that the binding will be submitted separately [2].
>
> If the binding is accepted, we can then add the generic compatible
> to the K3 DTS. Otherwise, OpenSBI will need to add support for the
> K3-specific compatible.
>
> [1] https://lore.kernel.org/linux-riscv/20261109051050.105623-5-joel@jms.=
id.au/
> [2] https://lore.kernel.org/linux-riscv/20261127061432.17306-1-joel@jms.i=
d.au/

Sorry, didn't realize that this was the reason. Lets get it added once
the fixed binding is in.

>
> Best regards,
> Junhui Liu
>
> >> +                    reg =3D <0x0 0xf1814000 0x0 0x8000>;
> >> +                    reg-names =3D "mtimecmp";
> >> +                    interrupts-extended =3D <&cpu0_intc 7>, <&cpu1_in=
tc 7>,
> >> +                                          <&cpu2_intc 7>, <&cpu3_intc=
 7>,
> >> +                                          <&cpu4_intc 7>, <&cpu5_intc=
 7>,
> >> +                                          <&cpu6_intc 7>, <&cpu7_intc=
 7>;
> >> +            };
> >
> >
> > Regards
> > Anirudh Srinivasan
>
