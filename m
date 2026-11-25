Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593046;
	b=TiWmzI4uZu0LbT9XYI+UAtH6Qig37Kq3f6t6RUfNW1dliDNfSi0JYTrEeVIqDGABDvCW
	 c/JIWXOyyXWoPjS2tYlSzplXGCglPVsjTy/nKjKBzk2vECRT4hS9t3+ha2trl9yrQc1kJ
	 IOTlMsUTA01/yTGXXrR0ez5umJczv7/0LuN3kDDWQ3PyOWuIvp5W/Fmr4JyrGLAkTxmn6
	 JKVdt3VViQeRRaQWTjPkIe0Yc0m2AQ103makGLDQVCnZPvC31yQTyTFUBUDvQ1NuFh36D
	 oBrE2bsEIwI/vv1/2pVnQdJPXUQdnWZAdmQSRq0mkdDNHpZPFHr+k6sXM0G0zenO/0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RoGfdVKoLAwGf8hBsFOIgO1GBBzJky9wJZFQWuH3Kg0=;
	b=CT/8MaUMgllV55XNnP8SWAk0rDzYtsoUc8Tnzq4dZM13qzzIw5mKL/UUQBKL+NYR9UTQ
	 2e/hesl53PdkwnMUhNgCNy09fnwa2ppdxjOIvqyNdZDD4wJjD2AHe0xUnFiW7NYZFBL3E
	 tngI5h66Ej5hLdZv6LVJpfbmCYXHS4pYikK2h8SbvDjsjm7mFUhJli02LW9DydFnGZ2Pm
	 UpZhXZue3bAvXJj2tjvR0Ouqd2mvpqsDM8NiKZ4VggYK6eJI+/A0zb6/5LXl/GQuEqcUO
	 RMdXMW/S5wopiPvNyp/ZZ0Kd5zvm2mEKVSiWMSPhKWv2VK3TrJYvaApdR8sBQ9a/QpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FQffE2mQ;
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A37606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3A37606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FQffE2mQ
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ab30b3212aso42382681fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795593044; x=1796197844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RoGfdVKoLAwGf8hBsFOIgO1GBBzJky9wJZFQWuH3Kg0=;
        b=FQffE2mQ2P25rO3ut5p+5WVLyoXys0IdcPrk3UxOYiiwifz5T+Y0Ed8RzkviTr19cs
         t1l92nGZciGC5CFiqO9ookwfTlhxAGdhW/b7xlR31axF9Ebb12xJfB/S+HSZrUM5CJa7
         rXc/3p0/nrMXBjwYJ614/y3VA673f280JsqLw/cKvP4qLiKvtY5mg+HTj9MrTkZsMGQ2
         W55BvFKiwOP3Hti9J7LwAdd9CVuocDhQNbHX8u333MixMMLPq8YR1wT+lnYiiR9NgOmF
         W0g6xnNgAsVw1YGU7urpo32bQDZZRJ0HmFkBbMCM7wsgvHTtdoB97kBxhpJuxRY1y2+d
         6UxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593044; x=1796197844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RoGfdVKoLAwGf8hBsFOIgO1GBBzJky9wJZFQWuH3Kg0=;
        b=01qId9ed32PlpL1RCbyv0I88pFnVbqA6b5WF0ep0b3OXMu99yDOarcwdIdReAWLepL
         aZnCEV3ebLPJrRXuKWqmicy7mzNSEwG3y1oalJwhgDMiCPYDlrzfGE3B7nir0KiElwD4
         Slnyj3XCTwsYi140FXpI1mQlPiUPbpLi2yfpJlTK4B+tFbok3BFGXLjbzp91IjG68x2n
         N3sdLMje/QDGCBarwQ9DdKMlq7SAHT3N/5VW/3w9Kb2afcEg7mTZx+cxT/YM+ZiYMq/c
         JoxSBE0s46WULPfEoY2MYy/KTFQDqGOCTe0Z8gvMHlgplGdVXYX5BIsVtvalwXJ7D4aG
         rOyg==
X-Forwarded-Encrypted: i=1; AL+hErH/hSs0lRfj2L50n1vprW2+61EfywXj63PWkgwjBDhsd0IpGqz2p+OeDLTntIfV0NQCaPqA0s08vFR0mRI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sv+INC6zS+r2zmeUWs4Jlj2I5TmQChjVnCEj5GgZU2B4zr7P6
	VvfDmTNrO4XuPoiBqg0v2lL7UcwA7mkIG6Lj14a4HNcg+m1xea5tFzqI
X-Gm-Gg: AZFdTZcLNCNWn9OXM3L9sgbEk1TS0EgpiKol8POurWvhPlsmOAOqdMoUThBptG3bDNx
	8ui6tEeTyMWYp6TnmcOMvMMx2mTwAxheYPA99iCiD57T6TqHvVTOdcIrmJdm7/+4ahaPIJTzP2p
	/wIaMVT72binTEAMtwk6g2K7LE8rF9EvvsItkIPAON/nX8hCCVwabbwUJs+FibHHhho0dKEHGjW
	kZtWsOIzLm6yaCJ7Tq2Yhs+yJp7xSKZXePa8Jp/lakn6zxFs5QkENf+X+0cj1CqX01yQVwLhcgL
	h3qf6ZZs5QB0s05a6yWBm0NdHB6Oo8OKWKxLooBQfP9SUMzEGsoJrwpj6G/rjsYojlRBcTw+pth
	ioehAMpV0mHl2+VWEJiiWTd70haEGJlM8LT2XfZEjKIVm6esVWe6MM1vQ55RVrjykusKsow/f6T
	qwu4S9Udakp+ZSyLtv1N8syPOwinvYYVTEGYn8oiKnsEHEeIMtxIvfxJ7pbpkjtFnMwSC8RV07J
	Sl792sxtVz9AM52lW/L0xvdG1BzXqjD3mG8UhWGjTYf01MLRS1c6akrHnmviRVVoRu4cNsApnuw
	mL1gNKiImLMO0JcqjX9qEUkZhMJ6/Fx9ddecfIhZd8+Zu8D9FqSpJTfI2bvFrCs5cNRi/pgorEW
	jh4cfDPpZxhZZ5FOcXPF/EJ6C46UT8QTS2iWCh4jSrYA0ZHOyrb8iTSOV1xQ=
X-Received: by 2002:a05:6512:1244:b0:5bf:d1e4:a034 with SMTP id 2adb3069b0e04-5c1bc7d025dmr5262307e87.21.1795593043584;
        Tue, 24 Nov 2026 23:50:43 -0800 (PST)
Received: from yantra.. (nekmmqvppk9cj8danf8-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:f131:5b16:1fac:1214])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8044df03sm41686411fa.1.2026.11.24.23.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:50:43 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: andriy.shevchenko@intel.com
Cc: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] iio: pressure: dps310: sort register field defines low to high
Date: Wed, 25 Nov 2026 09:50:36 +0200
Message-ID: <20261125075036.37378-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <awVHFUVYPE6W4izB@ashevche-desk.local>
References: <20261123220649.36887-1-zoone.rupert@gmail.com> <20261123220649.36887-2-zoone.rupert@gmail.com> <awVHFUVYPE6W4izB@ashevche-desk.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Nov 24, 2026 at 10:13:09AM +0200, Andy Shevchenko wrote:
> On Tue, Nov 24, 2026 at 12:06:43AM +0200, Rupesh Majhi wrote:
> > Some field defines run from the high bit down, others from the low bit
> > up. Sort them all low to high.
>
> Have you checked which change is less invasive? Can you do it locally and
> provide diffstat

High to low is less:

 drivers/iio/pressure/dps310.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

Went low to high as David asked for that, but datasheet lists
the bits from 7 down, so I will sort high to low in v2.

thanks,
rupesh
