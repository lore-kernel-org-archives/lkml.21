Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795742945;
	b=hpKrpSd8MmgBDtmAsPJUnlPIwMkXAQPuhtiyxS6/YuHfTvWg+batQ9+PaMVpE5dFpp3U
	 qpCqsnen2joaH+DSz7A0vkJiBJs1Mmgl3dBxfcmU1FAm1iPkDl4I4vB8GqhL747sbexhQ
	 lcoHlohYkT+bUU9RfZ0hERT6h3L1c2Qd8vCD5zO7CE0cfdQF9gyVyg+L0NvOYHbuoM2Z4
	 d3zxtSV9i8Jw52qNTaCHnfq3l15BFRsMkwxi2zog3DzZNNdxD+p+eCHSQIucTGq/VQEMD
	 XBklVkp0jetu475k5Bt7qdWFUvyvgGvLDHJJSZYv7qFec96b9WbVTHWMofaH7qz+V2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795742945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Content-Type:Date:
	 Message-ID;
	bh=wUIsqG8/RLQKsMia7zi438qJ97LPDSYrylra1EdJHEY=;
	b=vUZHDp8mQ2k4ZwIoVh2B+UEiyuy0f6Pw/dtCmFb0nuC9JbHoLo+R4xDuSdrUZMZ74zQV
	 qfFjCPWvLqgkzRi5cDCPdz8bgm0abeJQKHyMrns70Q53vSh+nBfPlKyujVPhNdrZHPSWq
	 sOWw2/Zp0rGoYdvOf1xEQPPL5LAgyd6sCNCP5j2NmwdfUctw0o5AoVu85m5Ng7lHx4JSh
	 cW1XaGF3uA/vVenSZKXSBUpSmIqO1k9/90r5G33QM7GyHo8v88aZ/a000S0LJXTOaaWsS
	 ebJjB8j0tHREwTms4vaQ/3cd6Xryvzmmy5AwKrHlchwUb9Yzo8HHf84nZD5fDcImNvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Cfw9r/6R";
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF44606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:29:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BF44606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cfw9r/6R
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b271e573adso3235078b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795742945; x=1796347745; darn=vger.kernel.org;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wUIsqG8/RLQKsMia7zi438qJ97LPDSYrylra1EdJHEY=;
        b=Cfw9r/6Ry+E5fNa6nSjZsyERpgDxJZykCKiC23vI5LN9jaTgXXlgYP7ywCcdv76H8H
         ehvXrGb6Nywumz5ntCxs+JLJ5zELKIBvk5Yv7SSoZPOJBaBfJaL14rtmd7JXRjvCLnQ6
         SCkY1AqKR4ccuJCP6foSAtdar3W1v+idWXhj1v+7eFy1VdoPExOx//4IryCmyT1pTwka
         IQ1kTNqPnTtPfDKfoD0zjTcXla+XUUKAa40MrDhFIe1FAQ/Rm+j/Z9VliV2Q3PxV0vUG
         vsKDR+llb8Qp81miY340f/x0HN0s1eLHvgpIujfNDZRmF0iqJOEYs5CekKZoImRRhrWq
         +MlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795742945; x=1796347745;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wUIsqG8/RLQKsMia7zi438qJ97LPDSYrylra1EdJHEY=;
        b=t+zjoY8ED/eMm5BUukJyOH2wHZCJLReNoFi6N+IHrkImO0MhzuTUJlJKsH6S8usPOg
         zdrZ+MJg70gXMv5x6/Uyt3MlcBMYEaQhjDM9ZJIcvbOYP4nk76SsQBmYvb6DBGlPZTIS
         1edSjRo6Jy3Q/CLPVWYM3sIRguoPIlYQHyrqQFcrPuUXYmbFpIroNi/EDvtsoaTZ+n37
         hkUJwS2VcW6mpy0RkPPoyWMxDL9SMREB/rJHBjTys6EOMpgWhgWHS62g4Kyi6unjKlYH
         d4auRUOY83tX9Wszq6lL7MRSewyevizeKBKMhdYzn+cik74tozK+85VFXM0Gj63cJpLC
         sR1w==
X-Forwarded-Encrypted: i=1; AL+hErGFO1vylBu4m5KCaLGthnJ7Jyg+BraRM96qT+hFPXWOFPgHn8IXQz3L7UzBFpDb+LcBn2lBJT7k/v/kUaM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+mXMycWvK3cEwPP6AAMtclbD9vhQcQcjhAzL5oq22Yn3xDdtU
	psR77/SCs0bwEsWZuqph7WUkxZSgkHdjeHnm5OU1pYXrmJHKLIbe9FOi
X-Gm-Gg: AZFdTZc8SOnnjsbf/2gZlSmnGjiJpj+hBY10kYbMW/xPhqSgJ3BPMmDoO2TXSyU6wkM
	j+V5PBO2oegx702Xck1Xs70LtUNBWpQU6z1BQBeOE8dLqJpRY37i9KVuoZoY6KPIaRtdvHnE/Ys
	lbAh5JCGn7DIshFG1hqQ1JTFTqSZPplaGdm6UDsQX45dp7rpiNLEBeLbF1GMk40rBq6SvCpQl7/
	agYnXmh1tCvAAcR5pIiqU3/3NufXuntQmK8qz/Mt5KcHcVbDiNDOoyI/wmp3CQB33QzgdkfljdR
	eA1fDO67TyN0W0glg6Gme1X9csXVjtQWMA4H97ha2ku5LS+KbFlmVsUrrY3a5f/49YPbjVMJH3J
	Lvl1COLnB9ISvQvKQ3pH6uu7maGCIOsAeWVNiu6cNum1tdVIVOBLPAX8/UacyIgPb1E+JvYcHzB
	4PNT9b8wP8VLNh1I6LG757eAQu99EZlZeobNbf6A47PWPTzQwStp6qkGGLCyFRtKR3rPj3gEXCh
	rkmRuZ/6p5uuKpFhpPjlWHp4Tp5TsIohmv0bV0xvPdlhkSkfal5Th2iIa/dzvfa2fW5o20b0Y4s
	wjZKt8LbQuTcC7VdSAu8NDjEUOeAvZ7dJGeYQscUXAfuKQnnFKtansSQEDkIXBQ4QzzFl9nY0wH
	S
X-Received: by 2002:a17:90b:3890:b0:3b3:8094:3221 with SMTP id 98e67ed59e1d1-3b41c981a3cmr21244869a91.59.1795742944639;
        Thu, 26 Nov 2026 17:29:04 -0800 (PST)
Received: from mac.lan (114-45-165-38.dynamic-ip.hinet.net. [114.45.165.38])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c07sm35760912a91.13.2026.11.26.17.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 17:29:04 -0800 (PST)
From: Ilia Snezhkov <iasnezhkov@gmail.com>
To: Roman Vivchar <rva333@protonmail.com>
Cc: broonie@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-spi@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: mt65xx: avoid division by zero when speed_hz is zero
In-Reply-To: <UsigaM3gd0dy3bL2g5S_b22RuZ_wwX5dQycDFYjkyLdeI1wdx_2divHB0qOXJaSQF54AZXolxH84aoupe8F27HQomLvpAuoMWhehxOFk7aM=@protonmail.com>
References: <20261126003314.49090-1-iasnezhkov@gmail.com> <UsigaM3gd0dy3bL2g5S_b22RuZ_wwX5dQycDFYjkyLdeI1wdx_2divHB0qOXJaSQF54AZXolxH84aoupe8F27HQomLvpAuoMWhehxOFk7aM=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 09:29:00 +0800
Message-ID: <179574294061.64665.17856396829842029470@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Hi Roman,

Good catch — I missed the second division by mem->spi->max_speed_hz in
mtk_spi_transfer_wait(). Setting host->max_speed_hz = mdata->spi_clk_hz / 2
in mtk_spi_probe() lets the SPI core populate spi->max_speed_hz,
xfer->speed_hz, and op->max_freq across all paths cleanly.

I will respin v2 with that approach and move the AI note below ---.

Best regards,
Ilia
