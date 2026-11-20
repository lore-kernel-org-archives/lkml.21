Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795199129;
	b=YMdYwaJOP7+TE1PVILvKD8Dcb+oEUt6Uy+d3Ml442KVlx0iEI1zs01u3g8gvQzIyb4zC
	 XSSFT+4Vmt7W45neU30oRUbMtpxyk4PRa2W0FqjfkAbtKiTMZLhRcXHlGkfmIzmelIspc
	 8yQ0n02TrnPHdQjFv+KR94AQCj57dkcPO0ZcgrQ7F09Xr0ItcCeZaPDYMaiU2Ucf5IWJO
	 3MunnUNR6L30Oe8zW87qYlvE7Yhm+sJ3V4KnGtpSY4jOlHMCrkKQK4IP0Xi4epvr763nN
	 Q+Os8ZivUi3mr/Zhlt9w/0476+dqI8RrvsCny7pBEEBlLDUYWwPpdHs2R4kbmGViG8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=vdsl3Fpj96ajho6n1JE8US+G3gvmCNGH4Zwy+J1ofWw=;
	b=UY/6sArx0MEWTlmt72ObQcxuUoi67lxQfosaX3km9l1ws9NftVsg/4nknSmikoOXxIdP
	 CNUCsPaOortFIxmFJTdqWeO63MtzNMQGFx5JOWn4GVLmpA95Td+hqGtDx0uP5LjSK9J4m
	 19PMkWTs5o2/ZdEVEayMjo0Oym21/VpBrf7UILxTHA5i3gxd8HfUW907AkpNsJDQcvYUL
	 6q2CrWV+3kKWCuIW98hbhqVB4HrV+M3DkUqMQpzUBkc/W2DbnJ2q/FZjeLcehNBMIWXxE
	 VJ8uNDSWRpzPOxFZhh+cepbyV+6gD6j2en3PwMl8k8xs6slwrshd5kAx/UZJibrYBzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Q09dThmH;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354C7606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 354C7606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Q09dThmH
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so11851925e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795199126; x=1795803926; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vdsl3Fpj96ajho6n1JE8US+G3gvmCNGH4Zwy+J1ofWw=;
        b=Q09dThmH+AfeATpANJTL84Inm6iYWArhWDiibkRE935RvaUta54OpB8h9ocZUlmMrq
         ///onBpV0ngantSEkrqsIVWvU0cQY0/t5H+JqEbch+9tE0vWGfK/GDvZXyf8/Ng6k8Hx
         Gm6UyDSt59Edfky74CyUkF4Ec8m2jwOC7XIRZLhYrI4VsdaSGVyP8FyUGFiJdl28NXFg
         NwQjsOJjt1ShLPXjthsxJo9KOIlOZTjTeFXK+7WdtV6WKMToHolFaSoCx8nGOC3uEXGT
         LZAlbwxbm+BKohETc0ZxaW+59vm6/ExDRfWuR2MYrMnXMbnYz3Xw0M2RJiWPQnJ9xKl2
         XyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199126; x=1795803926;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vdsl3Fpj96ajho6n1JE8US+G3gvmCNGH4Zwy+J1ofWw=;
        b=PeT+omPI5DvNJcMyZfGadb1oPk3ZypM9NamaAwTUSzxXpUJM9NTbT7nnvAVCd6fhTk
         z/s/U2kq1nFAXcZaJuRjTq0cOmdb8tSzs70828z+cQKq3VTX0+ykywLw7XS1gyJSNmSy
         zc7Irjg+Vk0EGHdcdDcjuvnwjs1jPH9um6jEDNOif422ihEfVxbBizNsNbxUiWOz/hR/
         YEXXAAt9wDUxZxI8Q3y8tXni3O3HqNMjdER9vrXAiYm4CNG+Pgass3/eQr/U5F8P7eF6
         5ULU2WA3vhOknbPRZ1M3Kt6eSf8rntYzCvV5QuTNHMaYlogLC7afgeIaLgai4WCGKWGq
         BkVQ==
X-Forwarded-Encrypted: i=1; AL+hErGwYRkVax/fSabUrGWsSLRumM9vZ5cNGNpNw5nnFmz9PgPxVma1KPhzPXX2THpV1ggcJfQjiIJ6HGXXOF4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DZ0KGkbr0omw/dNBovyoZjPKc/TtUnKy/a3l+e+IJbgWqagJR
	KKLo3rUzG8p3y3P7Bf+ssNSeE6eWkc4YNOCvugb9OpaC6fXhOUMBtAHFaL+izE0CXxBjEuX8hnG
	wCln2
X-Gm-Gg: AYBFou3GN2JW0z8xUjvpfTAnOOaThHXsjIS/Ajv4Vuz850nlllkifI68r9YfYCh8i4+
	uhcgbV8/eBzzUrgSCDQuvf3QdXo+8iCPrqMDJpA0DoR6CLuq5zRH65NWKEtzzxtbwT36246txqA
	uytngzvJMY04v7cn68lrlNc4o5mTahi8vISzDAOiy8y0ZPpxPH99wfRaNQf9jLW0Y3AfF2uBwui
	Tn2QVEcYdzCADN/yY4AhEAClskiEjC4/6mfQbnkcxq21PSP+1ifMePfQsEcW97GZ2Ha8uOlW5l7
	Xr5pna9v3AHOBHg8AneYsxPNy+9PQbmyiTqPb1Sb4yYCas7JgrmnmkJCnrupfxLOY70DNFek5qL
	x6iPZaUc4AOotabAiyLL7/ghLVQP4ArmVHvdv8AKdLwMAylSb/6JkgB+6ohyR5EJ9ioaLOQvsRC
	8sENEUdC/WlJLJn42wE7wqAd07aLGAuo8G/HL5CkSh2DTkp7JEWD4qlRuVqkOrju36WydFlPFqL
	vo3ODU4/6Ihoxw48ckz6kzu1y/ZgJjMISo7w1BZt1vRQeuR1jQOCq6O9mFdij34V1qFeEJXUGBT
	l3u+fKtRSFxE/a4omYXyVud7g3ziq64ZXnM9+BSJgd4A1wpJ
X-Received: by 2002:a05:600c:5395:b0:4b1:4017:c4f4 with SMTP id 5b1f17b1804b1-4bb8880ca2fmr90364855e9.20.1795199126650;
        Fri, 20 Nov 2026 10:25:26 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm150583125e9.11.2026.11.20.10.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:25:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v9 1/2] dt-bindings: gpio-enabled-clock: Add a new
 binding
From: Jerome Brunet <jbrunet@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Jyri Sarha <jsarha@ti.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <20261120-oversold-enlighten-48e6c36e74de@spud>
References: <20261015-feature-clock-guard-v9-0-c1c05a498d9a@bruker.com>
 <20261015-feature-clock-guard-v9-1-c1c05a498d9a@bruker.com>
 <179519084920.3795820.18319787881002052092.b4-review@b4>
 <20261120-oversold-enlighten-48e6c36e74de@spud>
Date: Fri, 20 Nov 2026 19:25:24 +0100
Message-Id: <179519912461.3795820.175908509395869639.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=950; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=TlQ1YVhRz7S/iXBfoIv2gcjj5oVi9Rudwy+CoiFSaI4=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNkME6bwFoXnX+DeqK4aoN0p2Gxx+cTExA3xGSl60xxL+
 t4nzLPsKGVhEONikBVTZKnhrhZ/J6n1ZdZ0ndswc1iZQIYwcHEKwEQyfjD8j9i87bzj9ZfsxQY6
 TB8/z0ryqrvybO9FRaV1mdbuOwXOHGX4n3f276w/f/99zBWq2zyloKY8/0HCcf7JxdK+p5Zs0FD
 8wwgA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-11-20 17:18 +0000, Conor Dooley wrote:
> On Fri, Nov 20, 2026 at 05:07:29PM +0100, Jerome Brunet wrote:
> > > Add the binding for gpio-enabled-clock. A GPIO-enabled clock provider
> > > exposes a clock (can be any type of clock) whose availability depends on
> > > a GPIO status signal.
> > > 
> > > Some hardware designs provide fixed-frequency clocks generated outside
> > > software control, such as by FPGA-resident PLLs. While the clock rate is
> > > fixed, a separate GPIO signal indicates whether the clock source is enabled
> > > and producing a valid output.
> > 
> > On v5 I pointed out that the input is not fixed in general. It might be your
> > specific use-case but it does not generalize.
> 
> Does this mean you are asking for the commit message to be reworded?

I would not have asked for this only but since another version is needed for the
driver side anyway, I'd like that to happen yes.

-- 
Jerome

