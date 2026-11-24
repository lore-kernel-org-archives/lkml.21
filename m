Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795553233;
	b=oNMtk9c240oiLlDr+cP4ICnQ0S5BWySbY0lQ10A8FwWyNj3/kwMBe64tGJWdXVAAOWSa
	 BwONRTAbR3nygMV9WpZjDHdv/hv21U5NN5DtVFNT0Kdc2rg4Y/pMoiO2l5dSGfCdp6vSV
	 JCr26NC9WRlKcvQCJLFCkRboyiBE0oUx+B5opllsnPtrdYSU7CS21m+JQAIsFeO3kjNMd
	 upC1wJLEKO8OHwBM6jPkv/RdzIgT1n0N4TMooadfxjTZsgDjIE8rhElKZRybMatGIKx2B
	 9mg0NzLGlGbrHN5IzBu+cPWWoCfwAJ5XZ0u6JLV3NFMUjZuN8OaNy5iHV2HZP0hZpOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/lbzr5VuUouDiq69BqZ6eFV3fJrAmKd5QRsGlHOj7D4=;
	b=nyul9ci415UhC6lzuR9Z8JNRtKNyqmh5BYvT3F4xPFzbWM7e/hn5lzyo59vjdHaoGqyo
	 eWZhsAvv+3qyjvrUyYOOMVJiMHBzlJeRS9YSApx2cQFOwoUrAVBPu8LxVxN6JIPaN7raD
	 MknmwhD6c5+I3qzf/koEzkk9dw98VQJW3dipz7hK7ckNnknvX9Aw82BOArzrdLwOpdAmz
	 rnLIXoX7keaBe3V23tl7a8JyFLnjDvCFn92Hl/KnTpPmPARSZs2VekgufY9FHsNXUIem/
	 iknjj2tyo2XFevURq8bz2wxD1Pb92AxunzDfOtTNyUBr+6ayIbdGAkW5xqV76bN/ikw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Q4iX0BR8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C489606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:47:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C489606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Q4iX0BR8
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b4e2fcc300so44191817b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:47:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795553231; cv=none;
        d=google.com; s=arc-20260327;
        b=K2MJ4YXaU7dBs8xVhAZVtc2OaTdvoXmlxBv0jjtzi3TD8xifLT43YC8BqfTsO52ZPU
         zSqSG8dUZ+4V59Xb2t8DnvRiQbCobvaEh+om1MHWCkpFKBbA14gaWrzqB9hXT6mOgVdZ
         1e+6DDuKYRJ4fXs36TE2LHJKeClDYHDB4JZ03aj5owkMVE8+kOTx6UHvQbJ5m9RspTo1
         AfM06ozJxAam6CDgPHlLag+CJFiJ48cWprgRBHqrf0zfvo72P0dsMSbv1GZiGDyQaKRE
         q1e6U1sKzWNzb+vPB+Yelx+S9PkWLzn47ZuoPdwhDme/fuxgI8Pv4/a/Mg8vM56tM2tG
         CKqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/lbzr5VuUouDiq69BqZ6eFV3fJrAmKd5QRsGlHOj7D4=;
        fh=8JI8X+Iv6uHjWdhfwBECLusewISp/F5E2JEdCzOb8bo=;
        b=M8KOnAC0JEFv+hsejHEEjjsvXU/tRCo/BqTZQrkir035OCMVQfqZvZMX6OOhSqBUDV
         f42AZgC1xOqZp5XlhLAaEFEjpBgdQ8fHw0GfQqC3Yh+jm+RHOwf9CuhsTiw51nHjC+bD
         R1+22mfsGHgAPctuwGHQP6WJm5jvxSg+eM5L1JiFF+4N0iqhvyzD+we7zXvyZ+nh83hu
         q62eS4BRZ6EAl48e3iTImgpDH2C/iZoBLDYBsdz/xyPIqJR1owBOdeLzxaIx0kwikP9S
         FRT9PjYPok+r8+HgZATvRVoB43fP/TBZP4idzqcjO3VROXxfoQT86tjvr56o3RhMv20Z
         muuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795553231; x=1796158031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/lbzr5VuUouDiq69BqZ6eFV3fJrAmKd5QRsGlHOj7D4=;
        b=Q4iX0BR8BJUhYWYquTncu3TaeCKrkudjb0ok+EmQyinm9YTQBUaKrl3kzdKa1BcyFM
         n5559g9SvmGhifoEikw4w+YFfXVjU0X59B0WlTE05El4jdxf2eHwwlFTmeH+mowecYjm
         VreCo6Q2SO3LoF5mP+jakPMSsIgYx/OTH5q3vs6Ee1nIyM3lhrCBxdgpl6cTw/eq1B1t
         yVVJEdp1qpQ5aacLGwpMjQZkGVZupGWwgX0pq2sKtwUxo/hOp9aBNqCdIIeJAFVjdnLE
         +frrvo1dePM2eQRnE+2dahRXJD9EUlfygtQagmRUKifdWLrLTu7/FhIMCRLDi0L6R3cf
         TjKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553231; x=1796158031;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/lbzr5VuUouDiq69BqZ6eFV3fJrAmKd5QRsGlHOj7D4=;
        b=tzblUnw5zbW74I8rnn4NgSpPZ6w75Rxe2tqNOmXuvgYDtSkoGacaQpXrbAsKt8wMaE
         r/BiX9l+ScWZsA0tRoz2wgMcJgUZ2uQGtYrdFVuP8p/ANiysiL6cQNgiUvoKKvfmMjl8
         JMZbSvQ3q4xjI3Pxnqo4B5d3GWhHvif3TIrxiHyFa23RPfppaH4EStgxcKGCEkAu5t9M
         siBtAx/NIbAuqTcJrAOV3DH1WWrru8fPS8oKBAPosSH9M8czGOW7GJZpLsP2dnOquWwC
         8VVNoO+yhRtbrUmo/5ZeHYg0BG57iiPFwjjBibQ1z6tEpfOMZRRPjQWh9RqG04jfgnQB
         ellA==
X-Forwarded-Encrypted: i=1; AL+hErEoOOR0tKJI0Tr0/t5Yr6+PEEn3rZ/clmZJvyJMLaSK1wSPl2Nyf/wwkgAPYAd+hvum6oHei1E+mn+x3Zs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9ajfvBq30Qcrjj4gUHe6odMbZDlAKwOYNs+b/Grj3dDqaDCWd
	u5JaU8uqHmxrmbY8aSURy+F0A5EcNs/0HesDg/u0atUADun7uZxJ2H6tSnhp8YW2elnNWpKnqBh
	9ft8718FpJmHG2EaNM7ffDhHomBd6BZQ=
X-Gm-Gg: AZFdTZfqeaL2KiIMC47bvTbzv9NLChAmSkLQhGTVD1sIkW6KcPYYLv1qPg+FVjb/P4R
	7f1RFq8fcF9c8h7VR0ACo5/zNFc4VRGPwnV1u5QlDCrHlESBGjLboeH+bsBHk8pfTGLfA51tZLK
	WHmay94yx+qs6qEeyhL2Hn1ovFrrOlV+cMpNSSEIHYLroY+URtn2PAzo+ljc08fZsFJhtB1PXW8
	tWS/tFV4VqdLO54h6vT5svtZcM+uITzT6BISHZsDoU+tqp42yYf6jYTfj0OpyDHUoscTVdAi1y3
	dvW0GYtl/9yjdSzj8+trdnw89GFB1zddAWDAE1EQbIfBhTofRVEzyE9jgdtRYkhZtn4pqlKM8T5
	+aTh9shIahHN327+kSFp3XM2TgrVVB5AYytpYO0eJendX+Bqarlazo4aDTPqNri4y9a6GqA==
X-Received: by 2002:a05:690c:6c8d:b0:8b3:2d65:2c72 with SMTP id
 00721157ae682-8b52047a894mr61098007b3.42.1795553231171; Tue, 24 Nov 2026
 12:47:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121213102.143130-1-tanure@linux.com> <20261121213102.143130-5-tanure@linux.com>
In-Reply-To: <20261121213102.143130-5-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 21:47:00 +0100
X-Gm-Features: Aa3M54piMjiC5eZa2JiYOkn7APdjKphVw0p4pBUTRqSLCMVNRfh1PWCBswFg3JY
Message-ID: <CAFBinCDVe5njTaO9xN-snXRQGKHDpsber4hi9P+Fq5SD2jMUEw@mail.gmail.com>
Subject: Re: [PATCH v8 4/4] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
To: Lucas Tanure <tanure@linux.com>
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

On Sat, Nov 21, 2026 at 10:31=E2=80=AFPM Lucas Tanure <tanure@linux.com> wr=
ote:
>
> The board carries a Realtek RTL8211F gigabit PHY on the external
> management bus, connected to the MAC over RGMII. Its address pins
> strap it to 1; it also answers on 0, the RTL8211F broadcast address,
> so the vendor tree lists 0.
>
> Enable the controller and the management bus multiplexer, hand the
> controller the ethernet pins and point it at the PHY. RGMII needs a
> delay on each of its two clocks. The board traces add none, so the PHY
> adds both, which is what rgmii-id asks of it.
>
> The PHY interrupt is on GPIOH_6, so link changes are reported, not
> polled. The reset is an RC network on the board, not a SoC pin: no
> reset line.
>
> Signed-off-by: Lucas Tanure <tanure@linux.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
