Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180655;
	b=ZDCoLOMW7amK6txi1Z/evs7tPJZlXo++5PKpZ1DEUmTCycnkVmd+IqfMHgREsPOShqhF
	 54U58SB54+kkA2Kr2Q87MTcEzKB3T/8z73fY/Nu8Is7NsgyNnvRXwNf/npHcCDtjkLNgA
	 gkUxA7iOeRB+jD+0NL82BDQPg33rnyDGA5+tPlmov1fKr9hbFoFgpY01Yq6pqxUXCspfx
	 yNm2lUCs+FiJEd94WBpPPiFhtuQsPJi0EUwklP9Cs8yIi3eZUceWghUqZAOgJRBh90kht
	 njBmVoHGeqEKtMcygWdxSdTAYx6yXkyKRlcEXJ7dC7oUkZVDPXS4S5HgU0gqRKCTdEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180655;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Q6IKWBXLobC5DRUy2DzuSRlDF/SVfDMAiaTqttRtgzQ=;
	b=xGr7DHxCZ+oq6EEX5wSTNDicm/dk3pc8HTnyDhiSWJBxBc1DBZsebE8TEHL2p7mZYQiR
	 YFkqdDxeCopjn8RlaXOg2GLnLA4mg9Oa3D0KIuK7qe4PYsL6w5zqJO26mPqgdjzDLkXmK
	 DDO2PzCvVhLBJLuOKPt0xSJv9djmQkZJDaprTJo54IcGt1+XtxPK+Rhf7rguutw7QtKU1
	 iOojwHtyx0klTnN5CcIrIme9Z0LW06FT8VnvFBEwDJvJN8fP+TPs+tYphOTIg674YnGle
	 tkD3DitxDiWw+ZinqDbVnKGRP1sWf89JKIGWkSCCTES7KI4AbWwP9rc/cVyhzaLvTaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.45
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B06606A334
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67B06606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-9851592ada1so254820241.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:17:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180654; x=1795785454;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q6IKWBXLobC5DRUy2DzuSRlDF/SVfDMAiaTqttRtgzQ=;
        b=SWSiLwx4uL5BjhFeQnuo15eDQxJ+uXyO9KRwG0bl0ebmfAbyBPehkyv9pA4td2yDyf
         n/d6rcUeHvR4rOmPEnd6lNJa4bXd2MlJcob1tdnwXDq4KpPrnQdRj87BH00iad5GuZpV
         qPWR4sgZcTO/l578O+50uD6pKrjMFmBBx4rTXwUAcms9LtwQoGbZYCpkJdW5peazvL9c
         bizitVvW7HY5Exi9oyT7OayuNxjn1gmjtW53FR14DTAAyYiNPZR+lPnPMX29YvihCtO9
         an/ebgNZqlR+pQT6qajmLDYCH41KaWm0BBeYRqPD/4hyH+bWXfJdMJuPq2zrq7o+76Fv
         yVMg==
X-Forwarded-Encrypted: i=1; AL+hErFUGCttB/wajQkRRPI75fXMfFWR1BUigodRUulsoUfs1P5b3x6exJhDdpbIDqlG8SqLcnE5jUcLSoTKx1U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7NKsz4UdaDNeViCkOj77mrfH/2UU1oPhJOzqJtI0bJlnrsy7v
	U/kcshSWqiex71J01G9qyVamXPMg34jpEow9F7WtJauzpPP9umkzsrlKBCsSGTnu
X-Gm-Gg: AZFdTZe42PVmVfZDeJyaDCW5P9tDUxbtBC8tBUzIw0q2stVcv7fGfMRTNQSqDoH3ZiD
	mvB9Zng+TFw57COVezLvcyWwqHOtyiRx9Cs2cJ/LcAT020WoBgadbTEmMg2sf1Y/YpHosNybMd4
	nW9DV3h0kMctmUCKP3EXinEQ47z0zf2uVHFnEZu/OG1uE77XBPGZhI9ktbi6O1NRGy1yW/8RIl9
	5iDNG3LK+xS/IR21fvBqUu3gUb06kvJDPrt6RYUv6k3ZxyutupvMuAqqiHdau6TddAofqSyGMv4
	nDxQKDT1MYU1UzKVh8CE43nmph5/epr7chriZxkK094kQ3RNhDezZC/xBODonpFxGFFunbJoBU8
	86MsW45dLZKQtW36jrIYDSq38OeNwjticjr4eGgi2595hQ330dmcglWf+WevPieTkGcVPXU9+MJ
	UV31U1snTddESlx24dhvmg7gos/puN7h5UL3fOKyOfQkjvppnioREYU/EWLIoPMhv7Chafs32sQ
	ljmw946pTfcU4DGoigT/6zHxKsj2c8O0jbgGVANyGRk+1kr1Iq/hC7O1w2M692OrpI/eLR+yazP
	8hnGzVtuRxQsQ5OL7aTi1ifX8Wwxyn9HWez8PyAv+Kq9PpSS6igeVKuPnDdLmGpF1gI=
X-Received: by 2002:a05:6122:328c:b0:5ce:76cf:fb2e with SMTP id 71dfb90a1353d-5ee8af35d70mr1467844e0c.16.1795180654271;
        Fri, 20 Nov 2026 05:17:34 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6df8a280sm3037256241.3.2026.11.20.05.17.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 05:17:34 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9851592ada1so254816241.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:17:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGIslyTPEepXro6oYtUTWEzkXPt5GF3OrSJuFxNL6+UXsPo1Jmc5uvCEQacChQcuZQP2nmLWlpcoYWXsJc=@vger.kernel.org
X-Received: by 2002:a05:6122:792:b0:5c7:a9ee:dcfb with SMTP id
 71dfb90a1353d-5ee8aeb7fcemr1220332e0c.5.1795180653844; Fri, 20 Nov 2026
 05:17:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com> <20261112-sdhi_rzg3l-v1-3-ca30b209615d@bp.renesas.com>
In-Reply-To: <20261112-sdhi_rzg3l-v1-3-ca30b209615d@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 14:17:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVepu0jANzDL552TKrFueydG3AHtd4v9MMXBsw6AK83kQ@mail.gmail.com>
X-Gm-Features: Aa3M54qUvfxgceZpYCy0eGd3okw1JBrjE6O9xWtztWGDRZeQ1eigXq4aiI1_wUs
Message-ID: <CAMuHMdVepu0jANzDL552TKrFueydG3AHtd4v9MMXBsw6AK83kQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2
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
> Enable SDHI2 on the RZ/G3L SMARC EVK platform using the internal
> voltage regulator for voltage switching. SDHI2 signals are muxed
> with I2S0; the selection is controlled by the SW_SD2_EN macro in
> the board DTS, which must match the position of switch SYS.4 on
> the SoM. By default, I2S0 is enabled.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> @@ -42,6 +42,7 @@ aliases {
>                 ethernet1 = &eth1;
>                 i2c0 = &i2c0;
>                 mmc0 = &sdhi0;
> +               mmc2 = &sdhi2;
>         };
>
>         memory@48000000 {
> @@ -355,6 +356,74 @@ sd0-data {
>                         power-source = <1800>;
>                 };
>         };
> +
> +       sdhi2_pins: sd2 {

> +               sd2-pwen {
> +                       pinmux = <RZG3L_PORT_PINMUX(K, 2, 1)>; /* SD2_PWEN */
> +               };
> +       };

Just wondering: why do you use the internal voltage regulator for SD2
 and GPIO hogs for SD0 and SD1?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
