Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.167.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794972009;
	b=K/taCpfQpazuQqFI+4UWMNplp9QUjftubcXeF1DDpcxSCPPjZLlw+mKqfeF+5dSA6waF
	 UT+XKOQtwdjmnpMxu48/2Z+RaxuhNXYjMjNsQk+g2Akv+tJ/wwb7FaN7z5zMm7YWYdZVq
	 zM/OBzlsv8Gymo7rR01kA27386IkTz32D/cWYWRStF5YB9TY3AtyluCSVQ4RKHxRF6u8d
	 RrWEfwObq2BlM7EYo/eDNX5g/laDofPdlqTdRtdThcpoZKM1FQ/ONnEcqdexfaM7JM/md
	 Wc/TKXfubOQDGRZzSoS7AkucCPbF39c90GMTQ7IkOlj83EAgn4m8qb6NKAIEi9T8LMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794972009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=pMB2AXoRBZXKC3VHrDoIQ+zmQluYyx7XzY5w5JiTaps=;
	b=eNrpUTLzirQfar9c+IJmBUy1eHOIreIIXb9pJVQmrhEfIt8Fp0i4PHOQWQoELH+Sd3y9
	 9OXp9cN0OJL+Co1cGKl9Rx0OyXp3ySq934TMA2HORWWLfFR7ow9Oi2aNffdkJMU0v1LE0
	 cXuobhpQPm3Jzx3Xh7WDP79B8Qwn+Tpiq62XB+oGgydGFlJHPoGVKW783siMCYlQ56+Yd
	 sAxrmkTX5Vp7xqJCo/XKbU0gMEJ/6Sm9ry2PJbTi/dWVGkZq8W6vdZYeE9ZboKHwZGOxv
	 ZuGnEM3ZPKhB9XoK/iyE5x4tmSNoB5YfCBHnhXmsNVhZK5gwzyHG0phe8WCaiOKKliA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="X3Y/HxCV";
	arc=fail smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129F8606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 129F8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X3Y/HxCV
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c0f0e04628so17951e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:20:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794972007; cv=none;
        d=google.com; s=arc-20260327;
        b=INDs/cf3gg0U5Q4EyY2PkymkqROngM0G6wgxU6jCy84F8FMoSDH9gfxgvORk+4yfsD
         omkE2XWAlzy6VI0RQVQJ7/zK+Rz/4nq8z1Fin69Ja3BsJTI/Nl9pLXGTfoT9X707tinI
         auHM1+K/ba3V546zWJx499hc5c53OGGOeZH30D5xyrhU5IyJ2hKryK2vjU0gjDUlaahs
         WqeBlfTYaIhfIc5KjmdYvyatWi4/XhgrpOoLmPY5gWhC6PiU/Rxe47rP4zouw23RfDCI
         qzRDRAl8Ij2KwiALF8kYIKGspZ0jlQu3NjLNs18pe2wA+lajjii3QJFWJLQmVpUalM5f
         6jHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pMB2AXoRBZXKC3VHrDoIQ+zmQluYyx7XzY5w5JiTaps=;
        fh=SAlPOalxybhextmdrrf3+gUazg1wjx7x4qpiOHDA5Y4=;
        b=LPUchKSqOjdvZ5cdlxQWJDUPGKpkfR5m8wEw3ntjDVhXXdPh3BUNJ472mjrjXJdoRf
         TwNYq/6RAifXiN9+z0KSxIPx6j8JEXpxqaWxe6UWSNy6dy6oDi56N0C0AW/gncIEfIkD
         uqwM90NnMGORQNOFTK3rD3HsBNnwL+l+sCtk8/qwzS6Dv84msHN5OrCfuA4YQP6saMbJ
         Kaj/Wh4AKRDFZUpNXC4rmqZqU0gmdiKcZ1pgYpdugufrhxCJIJ+Krw0A3SqVnAhUJbRv
         kJh5lg90VWjSTGg9zhWDSZBqUZB7hYY1awGgh/LK6QANiQsAxCHYkQ9JoknNDgC5KZk1
         OdWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794972007; x=1795576807; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pMB2AXoRBZXKC3VHrDoIQ+zmQluYyx7XzY5w5JiTaps=;
        b=X3Y/HxCVuTDUx9R85me6PZFrQG3f6LP1OBab+7S650tm5I/Bx7iT6OnvrBLlqvrn0h
         FeQ5JF3Emc15x8HPS1OcLdNQfydjMdws6W2iPc6SwyLwlYfDP/htrwo6p3uvHPxkw8NX
         S0BshhB3KuCyrMgTzdDQNvX86Nx9bfpjvgLFdqz75Zn/Lk++erJBAaiNzW6clxFLYq4m
         Hp68Hp9XXiGpiuh4MdJ31GRsHi2QAvpG9q94q+Iqqo8U1Q2GyEsav8nf0fC1hrPgme60
         WgEn+kMsAIdjqgG75vsdrQxo2lsXwkQubAm9cVReEtG1iqZmz7Iq5pDAlrQlDK38KYnq
         0F3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794972007; x=1795576807;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pMB2AXoRBZXKC3VHrDoIQ+zmQluYyx7XzY5w5JiTaps=;
        b=TI19wpfpGb+5qxbDZA89lJ457GJp7dFaAzOB7ypn7M+P0cApoAK1e7oNdtR3rZd4M2
         80NtTCeBcdBo4kUHIB4UR9OkbkJr6+ucVdzJBBdSBwvQANBvtwJ9feYqhqOwXfNccLj4
         1XDzTwuhUDkqxzDAUY+cNWnPh/YfnsGNwiyauBt+nQcUMfebkxh+monjkX2S4vO8wYve
         mP7WvumntJf3AuBPwxDcTsiDxRE99FrRyKLD7LWZ2qS4QyH75oEQAHD+CqmVbzYqpkCO
         DQ1c0abYdYu2wOi3ndYjgnvk45spOgV5uwRQdvyfWBog9MROYdRf9UTodRsNJuCtaRGs
         EZ1g==
X-Forwarded-Encrypted: i=1; AL+hErHk5dT3Z3rRMdeuKQxkIiIvKKgWkALzJx7G4Ucb84mOf6TuEcyTmqocWJwqmnRDVgtteqeui4aUnbiKYh8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9G8AEb2amKQZoyydvXNazdwgqcW8ifeocmpaOWIDoyuood/jyt
	ftLZUW9EfWGvOBwSX+oic2rsPNToCHYRfQ+aJidmmEi0Cbnaw9OKXa9hJ/8S2bikLikBBqxy5M5
	5t7j5vdm056BNpsi9hNQB8RvpG3lGtm4=
X-Gm-Gg: AYBFou3jtzncmWvIZ6oA0SHsOPMrsZtRePHxOZRcUVqAsCbH5yIFAWnLsLAMpLMjt2p
	LGzPHnA8nHv1zgZODVHQiydMsqiYm/+qU+Zj9TkNSuiYXcKKj4DDjo3EZcUxqAgf+1DffFhKmmF
	mhzb3CW4sioioBC281Sr5IYgQjPhQe6rYYHCLK7BesU9fKgHrayi4pdgur55AZZ2tSZSXXgCsHc
	wDgnKFMxRLaVJTM9d3PgM8H3bCVysmSqfM1egVfAksF0vsrJ1E4AU8e7Woq+fxORBS58CovOm1G
	ZfYPlKzA4DgQA9PJKXedJzLRfE7UoL/SsfzscJ+1A9ztaqkZKeB09ruRaWimpAEbpWugCaXorBy
	BJhar2xNHI9vtSfxaBr6r7orkH6C/xMaTTf1Ng0hOwvIuuw3e+H02W967bR6jRwvOgJVW/S54iX
	yhaKaBDCkACn7Eud0U
X-Received: by 2002:a05:6512:1326:b0:5c1:4e17:1ed6 with SMTP id
 2adb3069b0e04-5c1aa2d9e10mr388793e87.6.1794972006813; Tue, 17 Nov 2026
 19:20:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-b4-sun8i-emac-ephy-defer-v1-1-12a8591702fe@gmail.com>
 <179490321548.3136.12535368591168637116@kernel.org> <7b9a4fe1-a885-4ace-bad0-b819ac8b11b4@bootlin.com>
In-Reply-To: <7b9a4fe1-a885-4ace-bad0-b819ac8b11b4@bootlin.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Tue, 17 Nov 2026 19:19:55 -0800
X-Gm-Features: Aa3M54qlIUAd0hNudODtwjUM3vp3szpxLVn6rqxVCrMmIBzKBehn34SS0rG8Tt0
Message-ID: <CAEy9hNW=h41aoAaBQJzL80X4BgMM=xQe6Y4_sR6jw3RWBue0sA@mail.gmail.com>
Subject: Re: [PATCH net-next] net: stmmac: dwmac-sun8i: Defer probe when the
 EPHY clock is not ready
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev-bot+sashiko@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@kernel.org, 
	jernej.skrabec@gmail.com, samuel@sholland.org, clabbe.montjoie@gmail.com, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Maxime,

You and the bot are right: get_ephy_nodes() runs after stmmac_pltfr_probe()
has registered the netdev, so the deferral comes too late.

Yes, the internal and the external PHY are both behind the mux. stmmac
attaches the PHY at open, so today the mux is registered only after the
netdev is visible.

It was build-tested only, as the notes said; I have no H3, H5 or V3s board
with the internal PHY.

I will drop this patch and move the mux registration into the MDIO setup,
together with the probe and remove ordering that Chen-Yu raised on the mux
use-after-free patch.
