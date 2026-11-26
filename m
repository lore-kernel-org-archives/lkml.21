Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678523;
	b=pAdhvcZJ3+9ofIykBHpkNUIrDW90EcnIHL9tSSRiZq/awacWdUijQpwrieVWWY2pDR4Y
	 5T5nA17MLcrGsLCUIt+qgEb//dg1GtCupFF0HFLhMAOnwey0q9JtR7wBcJ/27oTuhkVQW
	 7EHEO55UOsjq3XSw9dIHnfxTyoOVDHGQnltuPknB00WdI1KIBR4Q4WOXmStGXJAEFKyPD
	 ADjoZ3aLqEf5RzTQSKNH1jbY13tz1nYOu6G5GxA5teT9GSMIRXXNnQ960MCl6GDsOD6gJ
	 Pu3mcOMBlePTt+OUnFHrduqL1aRXlRRqIDuAOX3YK/6ZAq9fdEam2ib9ICheIluUm4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678523;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=XUSJGTide+xDGpIYleL0SwfRegZX5gU/UVkOK9ZOXc0=;
	b=wRMdR2gzUH6ZKRSwFf4TAnQS2mhkTHTKIsmabaOI1rjdVZKw533IO2JWnFnn3lLwrLdT
	 61lqnFzVW5kyIoidbr29/tnZWjeFmuUzFyvo4gWE4EsKWkbAKfPc+j1CNwywTjU628uuX
	 wYkxgaRriWTEfpoZL3kEQw/fzv5nHG4Ov08B+Igs3l0IO38hj65ZapBB3L0giyqX2/4ob
	 9UNSjlwFOGAehnc+nqo1dlXYVpwTlyGM3/FdaemtdBam+zP0shfzMhltEo8MUVEgT2mEi
	 e18Evk+M5nbm+Q6ung/LAn6pw6cn7JpSOAzWxgLvUwwKbTLSfuDmrmZuLLKlmtlgVFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=mtM9STWX;
	arc=none smtp.remote-ip=109.224.244.123
Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12BB606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D12BB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=mtM9STWX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795678520; x=1795937720;
	bh=XUSJGTide+xDGpIYleL0SwfRegZX5gU/UVkOK9ZOXc0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=mtM9STWXKAqD9WGspzMlHKmC6U4qA0TSAq53ucmxbzOIASs2A7rXAYkYTqoiAm35v
	 xTKZPc76zxQPDHAA6sbS0mkDMDwY8XHGl5OimhViNuEwG5c7UkVDDtLaj9oGjW6L6G
	 r5N/m7aUP/LY2kMjM4VjtMiBVlzWjCYuLvDG2U9spFA3d6796bSicAk/l4b3R2wVuD
	 tcc9h3bK+rHaZ/YzJWhiEzHzNh2y0t46Mcw5rk4LiRa/fncrRFEdH98kkxY2ia7LB4
	 RWDr4t9g/9LjPcxHaMOs94wo1+FxqiLl5IbGi4s/wqhRCRNgeO0ooxx/daMPvnm6Gc
	 d75jHqlB1vdCg==
Date: Thu, 26 Nov 2026 07:35:14 +0000
To: iasnezhkov@gmail.com
From: Roman Vivchar <rva333@protonmail.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, linux-iio@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] iio: adc: mt6359: fix MT6358 VBAT impedance resistance ratio
Message-ID: <RyeVHYGoYxuKtlQ0QPskoF7emL4yakkPeBUW--rPVYqvaAM4Q5Pm1GACcF4t-1DjyxPPOMNyfAiMnTxVqugYC2MBKxUBhRiDDjtcPNK4Z7Q=@protonmail.com>
In-Reply-To: <20261126031013.27701-4-iasnezhkov@gmail.com>
References: <20261126031013.27701-1-iasnezhkov@gmail.com> <20261126031013.27701-4-iasnezhkov@gmail.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: d24a110af2aa28dfc2cca5959e1a53a29ffd220d
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, November 26th, 2026 at 5:11 AM, Ilia Snezhkov via B4 Relay <de=
vnull+iasnezhkov.gmail.com@kernel.org> wrote:

> From: Ilia Snezhkov <iasnezhkov@gmail.com>
>=20
> On MT6358 (and MT6366), both BATADC and the battery impedance VBAT
> channel use a 3/1 voltage divider (5400 mV full scale with 1800 mV
> VREF). mt6358_auxadc_ch_desc[PMIC_AUXADC_CHAN_VBAT] erroneously uses
> 7/2 (copied from MT6359), over-reporting VBAT impedance readings by
> 16.7%.
>=20
> Change MT6358 VBAT r_ratio from 7/2 to 3/1 to match MT6358 BATADC and
> hardware.
>=20
> Fixes: 3587914bf61d ("iio: adc: Add support for MediaTek MT6357/8/9 Auxil=
iary ADC")
> Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
> ---

Although this change looks correct to me, it's a no-op given that it's
not possible to read the channel.

~ # cat /sys/bus/iio/devices/iio:device0/in_voltage13_raw
cat: read error: Operation timed out
~ # [  243.402155] mt6359-auxadc mt6359-auxadc: Resetting stuck ADC!

You might want to fix it in the previous patch.

Best regards,
Roman
