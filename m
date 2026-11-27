Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772044;
	b=odzGmcwIRoUhRxssq9HmSp/DcHWK2+9Ip9zVmV4Ik/GbeV+nuq2mwcF7s3ZIuLL/sVIg
	 VJ3T53IYJP7ST6GnSJ8Ycelj1yyMjg7TVgEu1U7hPoG06a5HULQ/hE86I8K3ReMNfKyTz
	 7YB57ynTf4PNTmOFy8idJOng5EsAPggT9XTrddEMAWK63nL4ImpfPaoIV8aHOrvoCOItF
	 znCTPWIdxaq2t8cTACXx9QUoH9Ps4yoqyqHt4/OMOBwOnfMaG7tJcoTk2SCewbthzSmdR
	 IniIbKpVN4Sdny3Ebd6eZ5TsjsiR6/Vlb9OolkOJRr9V+olNk87bVYmPpPi6p+zn31Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=Jn5vbA2HA26YYZAVHurR2qnRXvY7PEKSS/j0oDB/fbA=;
	b=gLP1PZns3lUFUcZrm5aZiuiuEfbZ0gZmgAxsqMhqYKrv7CTczBoBeTvpeEVNCCHFWmrT
	 sZrUQoas5Vv/xQt2QadgRbvjxhbmdpcwRkOI+iOPfgtOMTAZE06omOeJZ/2RxVGW909/U
	 uO4w3fyYF8wE3ABa1JT4uMuUnINszdgN9CJkP6I6fv7YNn50yc0sB35BsnU1irxCDttwJ
	 7Gp98x5R+RQ+qBYdSier7j7m+3f/shO+u5Tzl3WbIKIzwtzi6Oq9eNGR51CiAjsveE/kS
	 mUczsDPLVBr6RVnGuwNplDRVFfCq8OpoMeu5IUIisT6RS78Uf3iE4PD7pDaPDS8pe0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="nV0+w/3z";
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B28606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74B28606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nV0+w/3z
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so12232047a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795772042; x=1796376842; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jn5vbA2HA26YYZAVHurR2qnRXvY7PEKSS/j0oDB/fbA=;
        b=nV0+w/3ztlgeQuzORjR2dnh44aZed2JE8zRP22/HHWUbwHP+zSm1yZyM8VjGmh0pNQ
         kjgnWkZOEo4Be5y42ZWPGrgkicDWr7bVoeAwh2GR49W1kMDsigxuermYl6vAzk3cRpuW
         vhyvhMMGyLGeokT2gf9bj0QB8oOhXduFm6FeAYvxU2JHEmGleoKRr8frBc4L/CiOqYMX
         BOKdGePRDWlR6j7RUiCLChrlNjzmO38Bi4G6uBzJ6KTcKSTw3ZytjyCoaCNQBu1tEz/7
         YTWaquLX7Lx4SbfCUasGbgcOwmegnpDSBOOEFvfYiXdL7flbNy+npJeL8c/rzjRsUbjO
         LZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772042; x=1796376842;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jn5vbA2HA26YYZAVHurR2qnRXvY7PEKSS/j0oDB/fbA=;
        b=Bs8XqNvO6nflNX4wMMGDliWrgapbUr4VR1atSD22FVDrgKXKuU4/61f6oyXf20R+ky
         ajQzHiCVe2ttDDnNgfHbqkVjv8aNGHcrqX/0SQmcba3smmO8ZIRooottPUtjPxO1kIaP
         581mTZEgH3gp6ZZr3oQO3iTutsTpg2P0nPbSXjaXAdZYPGw4VBkK05bvC2lNpkc5a20Y
         U1QXQia15yBaKmoXevNnA/W9lnqw38p3F5SBKY7XBXgDFvnR2/Ej2r6uVZ+w7+/immRe
         L1V3GhcD6yFmUHw8hyQHJO02VAIFbR/vFLefeoMf+m37zpturgCB0an0UE5k2MhTXUFk
         vfRQ==
X-Forwarded-Encrypted: i=1; AL+hErHpN8VYfUCRnY61+g9EtyspRUkG5vqIIf8hEFO6J3Fsg/E0h3ssVz3/1nMN7CnofF8wkADFOl+dzcZbDww=@vger.kernel.org
X-Gm-Message-State: APuU4Z8j7xfYKf3/LhYZNxgf1716vXus0dHEM8cfe3fR/XYEh+tnnfbW
	nwD5AsvTWn4F17Jh4f4zgtLY3PUoBN8so6/QxWreMnD4DfX9VM3nWjbE8fk58GOQuDU=
X-Gm-Gg: AZFdTZc9z/EJNsyOqCIwkp2nvr8164YKm7istGsYcgtW4K0ZsECC5gvriDFSCUNs7Ul
	ZGa1XUaxj6nskwenbOQLOWYToLhNv2BQDjgEr8PSPbisdLWlHPwIhFCRs1cMuUBSW42uArZGNMU
	vRD4w+q/iWTeb6IuOWUwjraqPvBklC3gqb71C/QjapAnUKNJipnXmgIFxohwex9av5C2owHBam0
	s6mocqxHKQv0tfJ15MARBDzallW6v+aUHXpCFWlhvg889g8p7RsV+awHBHsoW/7vZPlnBxi7Dcj
	KU6F2a9vvx8HQKqcFLxDo3hOpg5HOtA+7zITuyHEcksmV/YU77uex3L3gK6cne69bCV+yCS05i/
	umf1mJXxC8ukMhZk1grqZqOLDjMd34wtrlrkXNy8t21Z3OW82MDn4KwjN9DsQJxIR5y1eUKv0YG
	343OJmf0DLvvFqUZMIk+LUe1Rsb4fxgib3Y+8iwfI+sHAoF8z4in/jFJrt4CgBbUs4h8hJZle/p
	f0nkMObr8zcAna6Fk/gs5OJLcS3YpzroaDJN8/l3dITaFDjhHIy1BekhrNEJ0MlqW1CMW1oKppC
	9wginVdUlzeDp3LI/X7oeyfmxjGMQJsF09xdKlj4oV75nE54VaBIOKe3LhWlaqp21kNL3Q==
X-Received: by 2002:a05:6402:2403:b0:6bb:aaf:5d94 with SMTP id 4fb4d7f45d1cf-6bb0aaf5f7emr8353882a12.25.1795772041771;
        Fri, 27 Nov 2026 01:34:01 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fc020sm10607522a12.25.2026.11.27.01.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:34:01 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jiebing Chen <jiebing.chen@amlogic.com>
Subject: Re: [PATCH 0/2] Add Amlogic S4 audio clock controller support.
In-Reply-To: <20261127-clock_audio-v1-0-cf3ccf6b2bf0@amlogic.com>
References: <20261127-clock_audio-v1-0-cf3ccf6b2bf0@amlogic.com>
Date: Fri, 27 Nov 2026 10:33:59 +0100
Message-ID: <1jmrquwrco.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On ven. 27 nov. 2026 at 17:11, Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:

> S4 uses the existing AXG audio clock driver and reuses the SM1 and
> G12A clock hardware. Pad clock and data selection is done by pinmux,
> so those pad clocks are not registered. The controller has an internal
> reset line, like G12A and SM1, and an audio power domain that must be
> enabled before use. The new compatible is amlogic,s4-audio-clkc;
> power-domains is required for S4 and forbidden for the other
> compatibles.
>
> Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
> ---
> Jiebing Chen (2):
>       clk: meson: axg_audio: add S4 support
>       ASoC:dt-bindings:clock: Add audio power domain for S4 soc

This title is messed up - Remove ASoC and proper spacing please.
Also you did not collect the trailer given on the v8 by Krzysztof.

Next time you send something like this, keep the series numbering
please. This could either be a v8 RESEND or v9. Like this, it looks
brand new, which it isn't.

>
>  .../bindings/clock/amlogic,axg-audio-clkc.yaml     |  17 +++
>  drivers/clk/meson/axg-audio.c                      | 165 +++++++++++++++++++++
>  2 files changed, 182 insertions(+)
> ---
> base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
> change-id: 20261127-clock_audio-76eed7ee7ca2
>
> Best regards,
> --  
> Jiebing Chen <jiebing.chen@amlogic.com>
>
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Jerome
