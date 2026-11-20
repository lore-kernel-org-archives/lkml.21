Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795173328;
	b=rVWOaWqYgS2I+1O0+TMU3jr/ZIxMqW3ZnpHYBDKW9h5lDb3YSJUtTBfhqBJxneQFxv78
	 NswwL4LK7tFQpeNy2xdaUKuoTgdznfDBJlo3AgInZV8dUHVvyfxH6OdicKMHPILToVeR6
	 p1cBGWh17s0Aihta00t/BJ7mc51FfKI1kXPa1p0mL/H/6evctJ7/fgxbr6PozGA5K2I0v
	 AZNPecudFBhlJ5PWnCmyYY/C2bWh7cwsvocYFAvoEaT1BQtHkgAo+b8AJrWxdAjKeaAO1
	 4GeEWX0Cyi+9/g15LhDv0cxYd3qjpl6DWQ7P91nNy0Ndf/aOvPQ0Vte1aUxFp/hAgJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sPLFwhIcT/MvzLNNSK/4rlL74eBqG/2kXsTllYHm22A=;
	b=P9Fi+Q4ZnyatnO4KojEVrH+GEbtJpDU/IN3mJGDX93nkEQqW0SNFk7zENGeHyuFlTwzN
	 K5+WOMjdqrs+q7X+dM3827aly9RhRXzmY3EOyRsCNdwo6WJ2zBT7E3JCc+SN1qJS6vA8A
	 V+mEmcouqNLxGzhWyg3jXkvZvsCgp/W+81t/VAM+xeIrbcjiKWrbmA/ntNnDxNjYAYI4b
	 S19qIp1Zrk9fbqJ7tGDWF7p7+8KsViPLZi8wxSMJuxy0cFytUihF1SfiBZOcNE9wUcHpN
	 JH58Xsa2rsXRCWjvumaY1i6Ur41UphVx8fiktq9PI85gdja7xL46QeDCHdZ2h5kNoyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=JY3ZWdh9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7BF606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE7BF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=JY3ZWdh9
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b0ca1ebc8bso6593807b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:15:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795173327; cv=none;
        d=google.com; s=arc-20260327;
        b=P94A3e486aP+zRklxlIxO2n/660mMgjeZyZH2FII/SWu+8Ur3ZTU8dW5m/jUg9J4Xo
         CNhDw3Aegg7zCv9uSjyZZ8X6bI1FzaUWAPjtOKBtuTBV9lu8VcN/zID3rHDXhzkVsEsY
         x59RC7nmxc+1gh6VRHs7xObfz+0bYScz79Mo1T16NTxdUxCOcDm1vyatGlqks5oIoKGB
         5eoVKxHOlw7dTX5j6nFLtMIMEPgGPI0DAOvGsDAcbtgxFnnJsC3TSqgwu7NJkjyrxQw5
         PwgE3vsZZn4mrCuDDi9kzWtpm9kw8iKuhKE53VQgrSbQ0UHKke36sBYqsLcNKthKK/Wu
         Ykiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sPLFwhIcT/MvzLNNSK/4rlL74eBqG/2kXsTllYHm22A=;
        fh=45HUKINtXT5l1eWp+7eyUyt5ipp2YKra/67qW2zF1cY=;
        b=GpfnsiVIaSGQZwwhf/Gc6z3b8rIDApb6ORIf/1ke2uQpjJbwfaFnIpDygnVexqM1lP
         fJEg8jJaCef+DmjHWcZaq11yNCxuuWdTPuyVDuTmtI/ayJl2kRglB6ggTpEE78V0txoW
         04fiknQN3UxlKo36DYZihTROD+oFFM0pANrzdaX3VmuLI9oqHM2dRemlLpTzuI1USEkX
         o/YJe1S820QeKTVlFeIPZQPr+eFRW4duxm5KXhgJ8w7coK2bOqI6pUvHD+0Xn7apl/lh
         c3A2L4v+nUE2VSS/GCKnh8kjDg1MpLbfCr2krwM7qFHsS+rflb59PA4GmzA0W5yKQC9X
         cRyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795173327; x=1795778127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sPLFwhIcT/MvzLNNSK/4rlL74eBqG/2kXsTllYHm22A=;
        b=JY3ZWdh951njZ9iamsk8qCyeR4LJpvY4QzOsQU0Z1/9fsl8gjOhf+NjPzsKLsTtzKS
         S28y/JBu3gbrX0c1S6FU/D/V2tczzIHs5cx9Ryad5CDgvGc8AWJD6vEfGpMSGqMVpEaN
         aUCQs/Bk6FB9oYc8RDwH1UprPksFb/pW4GoTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173327; x=1795778127;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sPLFwhIcT/MvzLNNSK/4rlL74eBqG/2kXsTllYHm22A=;
        b=CrmyUjOSWwg4HXO93M8zDJNLDHoWNryYFafg3GJN+N2dG4pL8xZLztT7pXIVgUswSQ
         F4etgmwq3ymuaQi9N+c7HnKv0CoiCCZL7RZ8QDOsxTkGc+waPSbVIi9WQ2+8orVCUWSp
         q7sa9GgL0duijlGEg6pGsfONeb+N32X+6DjvajeSPMhCsXrLJh6HhEmazNzZ42ZoMAHC
         u31Teky6jisydfADlKucDV28JevwUsDgf1Z7eJFmjKFTtehzL478m3eUolChM8LwFi8j
         g0eE1Lqg2nqMQOXzR6g9N60K0O/LYJiQ12cyfwoZo19pkOm8cik8G7UaTUclr51Jdbqf
         18gg==
X-Forwarded-Encrypted: i=1; AL+hErGeVfQfdEFFmwotFoLfy+1YmECKQzPBMObhD88CbrkXO89s0eVvaDBQB13G63snEmeQQ7LQtVP+vBN1P7k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ty1fquaKsng2qb4sI9yD61EP+xhJFCtn5rEHT4W0BbgooReP6
	eB+KxHvVudMXjnOK1Terz2Mk6AhyamiKm0oTmN7jYpyx5lfGM1uzr7sqBJA5f9oqZ2AFRV6m2d6
	6Kb/V3bJyzBnds7v7vL1uhz3nJZXEfU40rT8ripO8HQ==
X-Gm-Gg: AZFdTZdBq2aQn34qpbrbWYkWVLe7Wa/Qbg5af+84lM04vB+SPm71/HH4DLmSCgajSOr
	jaYydpNJPgZBWiUFwaclGaWZhZ+lWk4cOtQ7zGBRdNgoVjD4Q2+gHFTC6BWapugVNwY7hc6Jp/9
	7fi9s+tNvnXvLHxM4sWgdX3ejIWLI3k3hQJd/48H49ZitjNOIN6EG+jABmGQA+ZNocTZBFgOEn6
	KcilqAQtD0k7Y/zhVPnYU7oN4lKDEaQa43WKENr9JrOHIY5K3WSn9f0kVjAuWuWHSPM2W84w85M
	QzTjM91PpUpYzFAW1pHZ3slnOjVc18YYKr2nshlf9FcB9W3/JxMa0UM22DCltAZfDazvL/tKq05
	wEs74W4AExwM9R2BEELKoOEGXanXbL/JG4YckkcZW688TELF3/h5D9jNyGN2vOrEIy6E=
X-Received: by 2002:a05:690c:f0a:b0:8b0:a8c1:b203 with SMTP id
 00721157ae682-8b5204a4d62mr11865107b3.29.1795173326740; Fri, 20 Nov 2026
 03:15:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028105807.2567225-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20261028105807.2567225-1-dario.binacchi@amarulasolutions.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 20 Nov 2026 12:15:16 +0100
X-Gm-Features: AclHuK_lul2WkB_GKijVQqX2Biher4WJINl3HIKsyICsb3rvDVwYFNAUZr7v3UE
Message-ID: <CABGWkvq_iUWQCVphJa1yuCJpekseUEHwme-Uj2Wpq7z8A2TKag@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: st: add firmware reserved memory to Engicam MicroGEA-STM32MP257
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-amarula@amarulasolutions.com, michael@amarulasolutions.com, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

Gentle ping on this patch. Could it be queued as a fix for v7.4?
The SoM support went into v7.4-rc1.

Thanks and regards,
Dario

On Wed, Oct 28, 2026 at 11:58=E2=80=AFAM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
>
> The first 64 MiB of the DDR are used by the secure firmware (TF-M,
> Cortex-M33 firmware, BL31 and OP-TEE) and are protected by the RISAF
> firewall. Without a reserved-memory node Linux allocates pages there,
> and the first access triggers an IAC exception and an OP-TEE panic:
>
>   E/TC:0   stm32_iac_itr:197 IAC exception ID: 137
>   Faulty address (IADDR0): 0x80000060
>   E/TC:0   Panic at core/drivers/firewall/stm32_iac.c:212 <stm32_iac_itr>
>
> Reserve the region, as done for the stm32mp257f-ev1 board.
>
> Fixes: c5ce8d7bcc78 ("arm64: dts: st: support Engicam MicroGEA-STM32MP257=
 SoM")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
> ---
>
>  .../boot/dts/st/stm32mp257-engicam-microgea.dtsi     | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi b/ar=
ch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
> index 5b4287e86def..6cd64587ecdc 100644
> --- a/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
> @@ -19,6 +19,18 @@ memory@80000000 {
>                 device_type =3D "memory";
>                 reg =3D <0x0 0x80000000 0x0 0x80000000>;
>         };
> +
> +       reserved-memory {
> +               #address-cells =3D <2>;
> +               #size-cells =3D <2>;
> +               ranges;
> +
> +               fw@80000000 {
> +                       compatible =3D "shared-dma-pool";
> +                       reg =3D <0x0 0x80000000 0x0 0x4000000>;
> +                       no-map;
> +               };
> +       };
>  };
>
>  &scmi_regu {
> ---
> base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
> branch: stm32mp257-engicam-microgea-fw-reserved-memory
>
> --
> 2.43.0
>


--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com
