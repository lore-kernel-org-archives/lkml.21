Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693502;
	b=rmcbpSb9QQ9H6kh4He8UPR2oq4EbwPLA7n6CQYbnzmrYXbysuYIJ9r9aRTAEUtWzDmjg
	 whDny7GbuxfP9cmn9TteSltjx4yxgZPAFMfmr0YK2gqYeL5E7Z5fAw1gJCGirvnXcN0Ae
	 tUETlcZdxcfhDy43LFJVmvi/3JN1jUmmaiop74ifogEfal7DbFUuKp4yQSVpJSA0xymTB
	 Xp7i2bnHU6Vj9yd7bZPOZhFloGN3pYbZaj0oipl1zdmoT5JGJ2S6/E94JQXWoFzWaTb3i
	 AvzBdvL7RV+OCQc6qlXGxgGFIH+GBFh1Esc4Qhe8WsorlzjGEh9F055Yi5h+hQ4+mzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693502;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=J/w9woKIDcG1KIzz6jIjSge7TDzANIjKjukbxSS5bGE=;
	b=ABq1/zTnx4L6lwBx5JJDGMwiv2Qb3QcFt7INBEDBuCTEsmOI6NF1+daNhLtgfKAiFqA6
	 8389JDjJg/MidMP3k+Vj4mfoswe2bWPRzatJE/26BohWCZ7EG9bEQ8BTA0huUsOMnHCNs
	 KvN0UX1PdypxCx1UAwfK9aDwd0IVb6dna0ELLpquPF4uQUM1oTR4JGwG1Wd8wt5I2RDi5
	 k4CENv5XJhP2gzBye17yjszWUje1hdsWrTxQTysgE17hiXkdHmcXjU7FiUsQHScB4qdnD
	 W/KDHqKyT7dwaEqUqU71u37pr+2t4F03NdO5ohddTYBmQLsOuQ2hPoc6xmuNZlQ+/6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCFD606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CCFD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b335ef6441so49452887b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:45:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693501; x=1796298301;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J/w9woKIDcG1KIzz6jIjSge7TDzANIjKjukbxSS5bGE=;
        b=tfYg3aDy0Nk7eglP0mvNmpQTu8q3VR8XMJPxCIMFd8HCc5fCubEPcu0QRDAhchVat6
         3PH6PfpVrJd2GCqAY7eYOO1LMkWnaOA5bcZbypWWz6+tS/B2Dtb2xL+Vo3lirKlckMQI
         iWN6ejO00c/VvQ1XiTysoVrCPOLsrAq0wfsI8XlNxmPMsYVrUkG8/91fSiYPn9e5ybd/
         eY9mKqae3ZVCHpmkKNR04gfSn13NBYf+k6R6vEiuIlGQ0azaKGYFcdXHF60iPp3jtOJ4
         p9C0WATz44Z8kcB3mLtg6ANuUFnyG8af5uSdZCr1R7wt1QtQUhb6GfU7WYFtmIfFiKHp
         CYyA==
X-Forwarded-Encrypted: i=1; AL+hErHqPIQR5RdeKunmGMQ1ewcK5iIAH4g6kcA7yPiwz1BC2R8M44WVpT58M0PoAt3ZMKAP/ptu9o+/lozLQaE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aqNVGPvDnBCh0Lg0HqeH8gdjDm3UBc4a8l5rm3qGzMZbqZYa3
	b53rCTY1XInfkDOex/DAkkkCHHKgePhLwUHlASpUOm9bTrk5IP1H42eYe4btaw==
X-Gm-Gg: AZFdTZfAUqgnuge7rjty5/chkBathgHfoprvoTbpRhtsKqo1NhgZW+yOZzWRxNyBn/o
	2aUChsFRn2EGameg3JmKthpFl/N9059BHe1uNlgBOVz7bSM3Hvb39vcynx0u0jxzMHswXuOOxzW
	/xO6y9K+oOL/r9/vBeIrjo/MAmV6YnCrGJbfsD7cL0JoCFIRFEmRtt20NZ5ICjNrYluh8wT3mNG
	PAiQb+U0tTO/I46uhAFTuP7DPQEq30zlYEf+f8QOn6yIhy5H43L834KkZbAyfgq8+XycU0ZeCXN
	HjEqEJxRWyQ9PT6VhYD41rx8cXZeEJWTGnJfihmYgiHhYFcBijV/tDiw5lL9CBLiQWp4dofLqoX
	TcyuXW+b4lEVbLHRv2BTSvQ35edeNCjahR+eiRz9x+0j5GgbIPBP17IAQQL0SMsS6l8XAvO2rBA
	QMqrodtt1ThTiFB5ql9ZyMoVBLDtoBa0psp5O6B1EDvDa4DVPmH30GBBXKs7U+WcXWvDOa8JRxl
	BFO7KmjzwnMLT+tDAPySBG+GzQ4yQlHeRsVugCqbR2Cc4Mke0w/tVGyUVE9wdVjIvzDYfnI68Fc
	lSpB7Rv/Zixt6PhPHd4e1L5FipPVTeYOW6MaKSG0oaVBZELwtunkIX49UdRXsMNmQBJoyOEQeRE
	NRLUvamEYzMc=
X-Received: by 2002:a05:690c:e1c5:10b0:8b5:6331:7986 with SMTP id 00721157ae682-8b563317b84mr17597217b3.42.1795693501374;
        Thu, 26 Nov 2026 03:45:01 -0800 (PST)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52028c802sm84852027b3.11.2026.11.26.03.45.01
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 03:45:01 -0800 (PST)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b4c2da74c0so44914277b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:45:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGNiZOsi21TuORAU6GDGdlHs3kjC9AwF5ciyq1cxzBcuq1eowg+QNRWIaOVwnxZQQMPxUtllPx5QuW5Vck=@vger.kernel.org
X-Received: by 2002:a05:690c:4985:b0:8b3:3854:c28b with SMTP id
 00721157ae682-8b520435d1bmr62048027b3.22.1795693500919; Thu, 26 Nov 2026
 03:45:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121213102.143130-1-tanure@linux.com> <20261121213102.143130-4-tanure@linux.com>
 <CAFBinCAzSgCGfXb_Q3FuwEmPAEiHSxzVR_ceyqMNp+LEZ18u1g@mail.gmail.com>
In-Reply-To: <CAFBinCAzSgCGfXb_Q3FuwEmPAEiHSxzVR_ceyqMNp+LEZ18u1g@mail.gmail.com>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Thu, 26 Nov 2026 11:44:49 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+1or5Eqe46hdtv0CtekSnLTJkfZ3UQY=RmfmYGeXd7YxA@mail.gmail.com>
X-Gm-Features: Aa3M54p7abSX0OPwjSGJJWzx2W6fGgqfMqyz9aVR061y3YOch6bS5dv9yFIyoYk
Message-ID: <CAJX_Q+1or5Eqe46hdtv0CtekSnLTJkfZ3UQY=RmfmYGeXd7YxA@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] arm64: dts: amlogic: t7: add the ethernet controller
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 9:37=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> On Sat, Nov 21, 2026 at 10:31=E2=80=AFPM Lucas Tanure <tanure@linux.com> =
wrote:
> [...]
> > +                               int_mdio: mdio@1 {
> > +                                       reg =3D <1>;
> > +                                       #address-cells =3D <1>;
> > +                                       #size-cells =3D <0>;
> > +                                       status =3D "disabled";
> Lucas, Igor (+Cc) has taken a closer look at the MDIO mux, see [0]
> What he's saying is that (in my own words):
> - status =3D "disabled" is unnecessary
> - if you had problems without status =3D "disabled": Igor's patch should
> fix it, can you please test it?
>
>
> [0] https://lore.kernel.org/linux-amlogic/20261124-re-martin-g12a-mux-t7@=
iav.lv/T/#m240f885979c7c3a84af26ee8b60d38f3092f0c0a

I never saw a problem without it. v1 to v4 had the on-chip bus
enabled and the VIM4 ran at full speed. v5 disabled it after a review
comment, so that a board enables only the bus it uses, and Igor calls
that ordinary practice for a new SoC. I am fine either way: keep the
line, or drop it in v9 if you prefer.

Tested Igor's patch on the VIM4 on linux-next (next-20261120, which
has it and the T7 driver) with the on-chip bus enabled, the MAC on
the external RTL8211F:

- both buses come up, mdio_mux-0.0:01 (RTL8211F, the MAC's PHY) and
  mdio_mux-0.1:08 (Meson G12A Internal PHY); link 1Gbps/Full;
  ETH_PHY_CNTL2 reads 0x0 after the attach
- while receiving 942 Mbit/s with iperf3, I unbound and re-bound the
  internal PHY driver twice (phy_probe reads the PHY through the mux):
  after each bind ETH_PHY_CNTL2 reads 0x40, SMI_SRC_MAC only,
  USE_INTERNAL and RX_CLK_EPHY clear
- the stream kept 941 to 942 Mbit/s in every 2 s interval, 0
  retransmits, 0 errors in 2.4M received packets, and receive keeps
  running with the register left at 0x40

So the data path stays on the external PHY across an internal access,
on the T7 as well.

Lucas
