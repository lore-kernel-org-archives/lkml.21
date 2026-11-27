Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795796548;
	b=oQZM4IjfXIO42LwccHO+nT4Cqu37DDi5HcSMxiEzOMd+0gHd9cPsk7X3qNQe7h+AMf8f
	 bT/m9HB/GE7X2oL2U9xo66AvzZVViXzxvtteyHybVPm2G7aqybZSo5217Xcfk4zDN0T47
	 whnKAs92w5kd6nmcgM8ZhjozRWVBB7yyO3KjLUk6v3n+mc4NJoUpuporlYG5jUiJhjSlm
	 U1mBgkAjnDQuKckqi7RYnWirwkeBsAXbiVSCGmrUKLTpmS1vNbj/nbftsOZBnENNvIX9R
	 u2aje+enrbVeicYfWGYj6ghlpuWGofv0OGMVElJz36kBtkQkA7s3nTj8up9YHcHl2vQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795796548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=xGF7E8bL6eqxE+DsS5vMeqDfnm+UP74XOc2nxISqzRc=;
	b=Xs5YuodphhRVLrCPfKDLSRz/9dhke4YvTG5bpwe5iHYOocCb09B6Y7uSqVlD7GeyDjIo
	 Y73jgYqDf1vElPemWumcuKmr+T1eEbCXe43jwWl37ECW9XJ8oqyY2ysIrBkvySqjzj87e
	 NswX6t18PYnD0SXIEBJsfCJwsoK+lmqE258RiioCfwLaJQtviyd24I5KUl0Hu7KLTgJft
	 9jGcGkz8Dd3KXM4S3GALg65GO9qPP6yXqAJ9YffYcmyfi1seNZTz/YZyxXLsGKaFx5XHy
	 yNeCiN45L6Meu/GI4KnuJm58suyjLR6HftdpvAjfoGr4RSAHsQ0lPbF86GoRo7QPnKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=edhb7M1n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4ED606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E4ED606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=edhb7M1n
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b87408c797so2567718a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:22:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795796546; cv=none;
        d=google.com; s=arc-20260327;
        b=SEiCh01zWIATBeoWL2qgLOoYs2VXJfUpIfbMZji/3qZtNYiFLyzGnE20el7e60we6E
         M+VLlOsbfqKVgf8c+iWCYUZdb6XtjrI0z5TIj8sZrNQEB+fPPz4nnuVAox1HgdwaO70A
         1XWMsjhlJlCey7er3pqas2Un3L8x4oYDIteo80LlbBt7Bfevdl2j+MO5knMTaY7+8yHp
         WkWxDCpY+ACimakuyRrWdCs+a71SgOMmc6dlEAyoCatQfH/UNwmn3QcmA0aVSb9fgjRC
         FevbQLGxGlPWewIE8nUN7lmA8xagRiHSJFjpiBBifLHz/UY3rzbS/5RXCkNKbXAgKgAR
         tPcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xGF7E8bL6eqxE+DsS5vMeqDfnm+UP74XOc2nxISqzRc=;
        fh=sGgrIORc5nQWhmm5WsEKDhslp4F/A1Vf1kwKY5GNnyI=;
        b=WU40dLP21OTiHh00pFxTa23SVKODZINdwAMe2AeSQZtix1Xl86HkGKqMjTknRdZA30
         VktNmCNWENkK6aLnoI50gslLlufXVoJuvTQjncxSt0OL34Z9/2yJqaCkqOIufKRDGjL6
         /tmQiuQpLu1MdlQ0sqcbVabqrN3JCrD+OTBKgksvyFL++fTmejdTQEA93yjZbl6c2jVx
         iF3o/mFmcTLL4DVVLjzjT/RQ8+w5j9koGi6u6bRVQGb3ax/mPtG9+OobJCn8bOEeHGSm
         Tuc8Z8ML1dQiM1CGPqtA/NAQ+XJguB11Mq0jhfpaW/1gpn1KUW/ER095/pw3OD3ewJ8C
         kYCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795796546; x=1796401346; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xGF7E8bL6eqxE+DsS5vMeqDfnm+UP74XOc2nxISqzRc=;
        b=edhb7M1nZUhi4oVxbok9hfWpYA92FcmUhvDUrnAWtUqlFF9iFs1GGMnpR6ULJJjsxX
         LEXYIUWzaClgcf6FS9o/3/tkGmcpS1fmwOWo+hv/vWLljKeaSij91mIvI60++5lR409A
         pledBsf59fPSrcPJp9BN+Y2hJDvtr5+vwNm1hxUkGIMThlaAWKxu1B78lEjNI8GERhQI
         u91bg8ihSMHKmIgkEP1k3P5DplijAXmRcOFNtDaltanGKEjV8cbOLhGFYTUTcB5ktz9A
         Uk4kA752zgf+GkjlG6hXTydkh/WENaiNZMkx2Wjd3Ws35rUojC05jLBn4yd6vD/DYDQ/
         cfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795796546; x=1796401346;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xGF7E8bL6eqxE+DsS5vMeqDfnm+UP74XOc2nxISqzRc=;
        b=XkLUH6BtaYilLux7zeT7e+CNSdcfTqFkEIde6cc75Bvelk0UBw8MNSUjEhjajC3AVt
         DvVY9ZESOWi+2Arv4ITiv5+Hx0i1HmlK8qiNJKt3z3MSZSqXkRiGCYPx5ZPz9tBbENhL
         sr1TjIjGNyqnhc3JoP8Sze8cj8wnSys9AemTz869nkUZ43LIkWY2UuCUM2YageR6BcXv
         lCwA/KrhUXPg8Tx4qJRBjEBx38wif2yuYklI5QWzoN6ZVFeXukXgOZNBEANAnxBoxQw7
         9Ro4KSGFciIS/xdaOTBjKsJRv+cTsRqr4TVEs5EkqhliDl7E2KNyAEHebjBzDiogCsZP
         dV5w==
X-Forwarded-Encrypted: i=1; AL+hErF7ApeRXHexRFm9PLBaaMvhNHBHIGTEt5P3/XpcPGsM+JXw6DzHBTIDEHwnq9GNHM6s1ny7ypMI8oICovY=@vger.kernel.org
X-Gm-Message-State: APuU4Z//hgGUADKWsgvqp2x/ihAAGGjrI+AXyk59iUXjwM79O/n07Owb
	VlbxgrUliquWP7Qqjflb159IfiI0I2rDs6BYZQFOimnxiY8uSBV7E+YrZ3CImfYIfth/t+nFwDN
	CLgzIBMFO8k/0ehnBe1gu4KS8W5pjiC4=
X-Gm-Gg: AZFdTZfYji/eNZhzi4FJObEYnfl1DPxoKDvV/IHyAdUHHv1zVPVG6n9hPNpy/DifSh5
	+dZOMYJkgJu5aQUP/I2CuyQWqE1NmCo+SYI2rumLdtyNAH+hRWF4o/mmhlSAcvnGvKt/cgHAG9j
	bb5Ama5Se+7c6IAI89DII8zEgGaUUSPyfM0lB+hyx2PNZs+6pMhaU5EaXPmhto1ZCu4AoNCtKyv
	oT4aZ9JsrWShWAc+1jT+TN1xxV3XBsOgUIJxPpwF+oT8AHc2viGDNmV0FfZQBUFj0JJy+1cuzzt
	lmmgkOc6WWSPfDMf9D3tR/j9yjnL+bzAJv8aNc+nuBURT1dQxCBpzjuPgA22KZXEr0F+Ynlvg07
	Bc3JwdKRYpintFklJRN0Gq+CtCkd5IF5sXJQ=
X-Received: by 2002:a05:6402:a307:b0:6b8:7f14:dded with SMTP id
 4fb4d7f45d1cf-6ba37ea7705mr14055793a12.34.1795796546329; Fri, 27 Nov 2026
 08:22:26 -0800 (PST)
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
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 27 Nov 2026 21:52:10 +0530
X-Gm-Features: Aa3M54qbxpABrphlzhxg9I2Mo9h5VFuq3p0P6kC8_azVaeYz0HCPXkRvM1DueFo
Message-ID: <CANAwSgTFJDGT5pR=Pv0v4RSWqTZ9q6YeP14TANRUrBrg6Be_oA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Add SpacemiT K1/K3 SoC timer support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Troy,

On Wed, 25 Nov 2026 at 07:54, Troy Mitchell
<troy.mitchell@linux.spacemit.com> wrote:
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
Tested on a Banana Pi BPI-F3.

Reviewed-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand
