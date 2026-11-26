Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795726287;
	b=szQzoT0uZShwn8nbC3cMgGO9ktjOPKnLudgiucLbJKFaMhXUdnUv3FOqoPnpKwA1a9po
	 FLQl6YRwYvP9NiE+gpKgl2r6EX9Szdm7BbmlPLiKe8TMSZqPRVe1BQAjy+BhSdXSf2BEc
	 i4oV0PREAuE2clTdv6rz3GozxIvta7hrb6BGx17s1pCyhIz0ZNaraFxIbEaOz7xK8HzVu
	 gpWiHCVG6kGpB33L43UrFBU68qjRgXTimM2WuAKKQLxRIf/vu3oI2enS9cUrwIBAT/giK
	 ZP+CfMh1G3NFnU7HQRbGv9J4MGnkf4Sspd5hnoyfHSvjV0HotMi+qt3phFEdvzL+gyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795726287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KjPQo4q/k3/IK7cR8RIRgyLDoYYjcusaTmDtFIYgl8E=;
	b=Buu3LX/9W6TRurz1GFtg2/Nh0fZ9Sq5kzQPsV3IuN628w3HL/q83rcuDD8AS1HU0wzOR
	 T7OEgpv8qF7k17eWU2If1HfwGQU4uW8gwyEMNx0S6RP/yhxwd1ydWBUNJ9I2JX1cVW1In
	 R9hP2fpXilyjDOybLMAln+gK6QwFnVEfL6ujPIdx1caE4a7pjDF2LAV0mv7X2D4HyMdWk
	 KH3jhrXkI5t8G3Rc98QnsaZ+JZrKRbLv4/f/RW2ZEkVABAPUfb41+Cky+ZR7pUY1T28jH
	 SvRsbcevH6BG/CaPHBmdyVDTy9GxHeb2czplwrqYi4d5h176N4ln+f7aWhOLl4Z4XTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="pWUFz3/M";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0855606A688
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0855606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pWUFz3/M
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f03920c477so62071285ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:51:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795726286; cv=none;
        d=google.com; s=arc-20260327;
        b=TGhBSUM4tUP5O24kwZvA/cPkPJbLD7JWvFSN6KsbfmtG8a6ZTEWbXHcNDlOuria4QP
         5xLgRXB3fldWi38KjGYI6nfJ0byNCqF11KMLQdrKKz7WYANG1hSVCUgv29mLr+wav0Du
         i6lVmA6PFyl5X7/G0uoeRJJa6tOada+gc9pnCMyJfTE6HcZJqRgTYuDO03g7GpxMbDju
         +7qxgj/w4yHh8qnZw5VrUChTAFU+GJrc9f11crlBPz+8bROJ9T4Ofmc6lwMey2wimp0I
         z+cn2RYM3OPsqnziNkTaAgeSyt9EA1+LQ3eo0oTE9mHZY7+VunQNpdrVAFM9He2LaLYQ
         SVJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KjPQo4q/k3/IK7cR8RIRgyLDoYYjcusaTmDtFIYgl8E=;
        fh=qXVLNty2weEhklchGD4YZFYvKPDsqiDP0hOXpXujTBo=;
        b=B9e/3QyinVKAo6zIQ2auGjQQjhoG0lIpUeKfzcacXMQL8tSq4FhLgE33ADgmoL3ff4
         VDqMFpnWjTBLUXBD08M93UrUD4xrmBCdtW2HBmx738JAWfNvzV2QlJaeQqwIQ26TkpcM
         u6xPaZP8ZH9sACl2Jge7kpfOvoykC8HJxyHA4F8U9d2pZpyOORYLzRBk1WK6Ns5My1pp
         fFY1dvdSNoEma5Ch1Lz8WTUE+RR9KOsiu4WeVC3x9TVD2i/fFD4BeU2duVPWja7e2xM8
         2cVcJNwdZdN1VH4tdvSiVdxODia0PmeDCfVtBu813zVk+a/8yDjmOWfTCHUVXzKd2e5n
         IJ1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795726286; x=1796331086; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KjPQo4q/k3/IK7cR8RIRgyLDoYYjcusaTmDtFIYgl8E=;
        b=pWUFz3/M7EmWEuXYofT9Wlt8PQb5LVGmCJejjLrN282r1F9m9LUgcFTgW/6gC1bDG6
         BSCD40lsLsshlKT/UGRAuVdbcwHEcnx01DVyOl5rkFGOLZnG9lAGhCZ5D9E4pJg7YB/a
         tfrK2fkOEt8VYi2X8jUMBiNAa3Z88xXWfdb3dnq7HGORnxK3znS4NyvDKjYnHuV3CXjD
         FidYpBONQH9MdrhOraRPikIVcNlRJbqjsQtZUzZAt7Wn1KlnCozlO2qVkUHfQJJtWDBs
         7MoCa8znYJOSQSgsyMWNN/DTuhfZ/DYQS1BFWEV4nd8vLIeXEbZ/dZ18aQwnfV3XROtt
         NVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795726286; x=1796331086;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KjPQo4q/k3/IK7cR8RIRgyLDoYYjcusaTmDtFIYgl8E=;
        b=O5oR3KB22OK4Nd7XGvmYpycZGF+fUePvnYah/4ZYdHq8WNzOvAdpu1Mli3/uFhBT3o
         mknaZ9y0gPaOPwxsbto+9yFTwlNhWuCq4A8FoRNY7j0GrhRBc+OLT+EhTbayGA3o581P
         weyYNFJWKShAgVu14fiu+LSvEmvmSpTDGoBfse0oFkKFoc/+AyF5r85ivlsHMW6rVeT8
         7zqYvns9dndj7JUSn8FQpCAXMdS7gKtD/QuoYKRpURFc4WHeENtHyDQjrkSGfRe0UH3e
         BX0MVqRiFCzEucRL89KLH5PQo3ccc1yJbyZHFr5t79nz3a3vsbAHJ3A9H0o91lVIzGl0
         73FQ==
X-Forwarded-Encrypted: i=1; AL+hErGKxiScOwrr7DEt+n8CRxlym9rnsOdz1cK6J677daPnpRFXzSRw0/i6ey+EO3MSo4MKqO17zssnSRFPfzQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lGZkCX93SHiNviafsdOI8ZV1DwtfS9VS8kD6XUOOXmMdCAiTt
	Vn9Uc7lajGqlz570mfgOAl9Oz047Q3RUS1jFA53s6CqbkTG9H8tRL9fc4H/RgHUkh1xuhjF6Wu7
	ATRu6U4IgRCAzsdCuo5ETM9xt1oQoSYo=
X-Gm-Gg: AZFdTZdAp5xTSHOoociDhktoilgKSWBKxI2F+Bg4HOtAfZ5nX9sgfQ5OgrfqURJLpQz
	NmgjY2rcj4NFb9jcUYRot8cIXMm94qiKvaLbm8hvuYu2h0u6F3N4P9KEcunWxG5qtDT6cTW3vwR
	VkYEkN05Zae+M/VU5ZpH0uCd9nWQ349WWuKa9vyN5uRX5ln/1DuHKlJrh9t/XamztfgUr1nIsDU
	TKQN5MtiFsNFobbXcRCYKXKSHwJ1+V7JUkWhfMqx26R9Bl797vvM1gI/Ho9Mtm6nC5P6UAhxni2
	6OEqbc6MZY8t7L2qXkmGXLR/w54qfONes5Ji7PUdrdLaEzYpwwmSIsA48C1gap2U3dK2PLN3Gnj
	bZts3Dk1OvyV1p0ysC9fBmNNWx0f1kUEpbZ6q
X-Received: by 2002:a17:903:4b0c:b0:2ed:352d:c619 with SMTP id
 d9443c01a7336-2f03f16ca83mr215219965ad.46.1795726286102; Thu, 26 Nov 2026
 12:51:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-spacemit-soc-timer-v3-0-e6390f3ae4a6@linux.spacemit.com>
In-Reply-To: <20261125-spacemit-soc-timer-v3-0-e6390f3ae4a6@linux.spacemit.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 26 Nov 2026 21:50:00 +0100
X-Gm-Features: Aa3M54oEPweJV68Vjz8cVs_U2wRf_Iqv5S5UWB4zm__2yBgEw8WUCZAIeYKD9Xg
Message-ID: <CABdCQ=OHaicMvAC=S+To2pQgFXupoUEY72TF+NUNF7ywM1kj0Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Add SpacemiT K1/K3 SoC timer support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Series looks good. All previous concerns addressed.

Reviewed-by: Iker Pedrosa <ikerpedrosam@gmail.com>

El mi=C3=A9, 25 nov 2026 a las 2:39, Troy Mitchell
(<troy.mitchell@linux.spacemit.com>) escribi=C3=B3:
>
> The SpacemiT K1 and K3 SoCs have APB timers that run independently of
> the CPU cores. Each timer block has three 32-bit up counters, and each
> counter has three match comparators and its own interrupt. A counter
> can be clocked from the functional clock or from the 32.768 kHz clock,
> and can run in free-running or periodic mode.
>
> This series uses counter 0 as a oneshot clockevent. It is registered
> for tick broadcast, so it can wake up CPUs whose local RISC-V timer
> stops in idle.
>
> K3 uses the same register interface as K1 and falls back to the K1
> compatible. Both SoCs run the timer from a 1 MHz functional clock.
>
> ---
> Changes in v3:
> - Drop the unnecessary RESET_CONTROLLER dependency (Philipp)
> - Link to v2: https://patch.msgid.link/20261117-spacemit-soc-timer-v2-0-9=
264d0ea7755@linux.spacemit.com
>
> Changes in v2:
> - Use named constants with comments for the counter sync latency and
>   the minimum clock rate (Iker)
> - Link to v1: https://patch.msgid.link/20261103-spacemit-soc-timer-v1-0-3=
6722421db6e@linux.spacemit.com
>
> To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> To: Daniel Lezcano <daniel.lezcano@kernel.org>
> To: Thomas Gleixner <tglx@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Yixun Lan <dlan@kernel.org>
> To: Philipp Zabel <p.zabel@pengutronix.de>
> To: Paul Walmsley <pjw@kernel.org>
> To: Palmer Dabbelt <palmer@dabbelt.com>
> To: Albert Ou <aou@eecs.berkeley.edu>
> To: Alexandre Ghiti <alex@ghiti.fr>
> Cc: linux-kernel@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: spacemit@lists.linux.dev
>
> ---
> Troy Mitchell (5):
>       dt-bindings: timer: Add SpacemiT K1 timer
>       clocksource/drivers/spacemit: Add K1 timer support
>       riscv: dts: spacemit: Add the K1 APB timer
>       riscv: dts: spacemit: Add the K3 APB timer
>       MAINTAINERS: Add entry for SpacemiT timer
>
>  .../bindings/timer/spacemit,k1-timer.yaml          |  71 +++++
>  MAINTAINERS                                        |   6 +
>  arch/riscv/boot/dts/spacemit/k1.dtsi               |  12 +
>  arch/riscv/boot/dts/spacemit/k3.dtsi               |  12 +
>  drivers/clocksource/Kconfig                        |  11 +
>  drivers/clocksource/Makefile                       |   1 +
>  drivers/clocksource/timer-spacemit.c               | 317 +++++++++++++++=
++++++
>  7 files changed, 430 insertions(+)
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261019-spacemit-soc-timer-cadf3088d286
>
> Best regards,
> --
> Troy Mitchell <troy.mitchell@linux.spacemit.com>
>
>
