Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745714;
	b=2GRRLpTLoFK71Lev97F4SWj/zMf8TDZ9J31Cp8jEc6m0SL0wp1qKvTAIm1cNe0L15mNa
	 ahsCB4Atjhyk0uxh8YxGAZfNhq+G/k+kVFsawiDC0RA3EhuAfN+r77zL9nCItEsAgVIXu
	 ptD1sO2E/Hm5v6XVmJQFXaGtNPXConFZANFrd3Ai5mizgzxXZX0dUkdIzDlmlnEwxjDUk
	 aD1hidi2L4z15E/l3rOkGOQyuwL40ptW+Aa4JLC/Cmm1HcvR/R6w0UpC+ZmO99L4toTN6
	 r2pbfJyQ1ivYlywx/GsV3o+07LhxG9nXHVfRUbyaNQXPTr31faQYc9JBvnLLc+MkcBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Content-Type:Date:
	 Message-ID;
	bh=h1ArAbbh+Nj6+8II10ytomm7q9koo3eQf1sW7tmJxyM=;
	b=vrwcDHUfWbN671/mfBa/wi1ucrLjnF5+ecGTGG402UwGal3AQ3+sQ/OTGYC8zBJ3nwHh
	 mNvnHIoLLk37tX522dHrycMTij3+aGcR3fRisaNTPsXxJZ+f6j/5TFuF1Kq62Lm2jc4fc
	 p5VYjnf3GDq83IhXm1Qy+8LnONmkVO6fKGKzF4YHtm3ps9Ypra39lUHKbc68h0xukVe/O
	 OZn0N+YnQwem/ZawtplGfSZSU0djLdk2M8UgdsF4PMAQC7MgX4C3Dppd7BKxb+TtkWK0E
	 Rbm5huFqg9rBbovVhvIqQQGxm9bfGUusVSR3wE43NYNTuz//9kWY4evoJ+eX0fyfSNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sdsq5qhN;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76852606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76852606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sdsq5qhN
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b904d10882so3163473b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795745714; x=1796350514; darn=vger.kernel.org;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h1ArAbbh+Nj6+8II10ytomm7q9koo3eQf1sW7tmJxyM=;
        b=sdsq5qhN5dmS7dLj4XnR8rPB3KKvR8KbIHitgjRlB7ObsgQgM4C+622YeHltjcGIaF
         zBJgLrIRJuVzPhP8rGXpv2INY7HE/mx8unNhyIZ+nMmHNkrHc7pD4huKWXoh/uo/QfZu
         8Mk4qcTbBJw5E6CWpI0LvzKm6pRdcnNwJxtN7HNfTVA4JWTHr7osJ/tfhHfe2xTUFyLA
         WH8lcSxnLDpJAfZvMfq4BE5igGr/MbDFYeBLkOQzuFc6Q1pNzCDohFPFf4Ky0CmaaW9C
         DPvN43vMLcU/VFj707tmQ4T1mEbYpTaldm+ZNOqhpMmGJQJ1EhcTsUTe4HIYgH+CgWx/
         w8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795745714; x=1796350514;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=h1ArAbbh+Nj6+8II10ytomm7q9koo3eQf1sW7tmJxyM=;
        b=IgpuaobNL6+lc2SH7C7OKxBPawa9Lly2myoOiM+VgMz+6JhAy25jetSI16aGeIUXFf
         rCqm9LOWrHwZ2mzVaYjGp8QyeS7VzBSQZPYP4vk3o8OqugLzCMh5rUsDoX4Y0uU0xHeS
         7uY+CPk+C/+W3xKVeUIufOXho77WBOLDXvDVO07/nfRbMAUSxWSAbcL5af4+VgLF/Lx0
         OWmFqjX1p+xP3ou7+5EaKvq8IDRS8rMY3OSgFlbP47/oRlEjiiknWlbz6c9ptxfom1VT
         JLvj+TX/aqxJiex4NglL+KzoS41HW9ABit4+x1QSyJ/1/KXwHCJ5G897qqAkVLfO3nJn
         AnQw==
X-Forwarded-Encrypted: i=1; AL+hErEJv/ZVb2zYS5YDFH1XAV3tSLQ9Bpcok/r4lkbpHvbOIfA4hJGLQrTimutuIGiXoUWbRekQjHwav8Riex8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hGw9eJNJXweC1MmU5saLnSBRMNV6kWNyD5NZQzNlofaaOkq5O
	iNjqP5t63LT/i7bkX7Mm1B59mo1ITKZq8AItSs8oCjNm16xHyHsxX5to
X-Gm-Gg: AZFdTZdD462v/luOgePaBTMVAw3PqHVT2s/QuJIHQDL5Y1v0asiErl1oOgzMiyAJy6Z
	rgmpl+9RewzR3rPR2FoxQsOzU3LKTP1EpLCHNSr02LdEHrbNDneEG2qVbATp2s4GBOFrKYrSe7J
	iDJR+ebeFmOHRy43UWkmoJCB65owR3v4JcFpl6OXci788AX+A5Imx7IwiRA6X6eEG9RRq8GC+xC
	EA9Te2SCR0FzVvWuryJNF14nPPMYfXMUyV9NiyH1D/McmFcfop9VkMS526YfT9VtxpWgJOX8ofN
	yUw5bnVZzgaIroXwS4DD1qupNbabSEGaOpoW7F4hd6NQvx2GAf6keNBzcNjA1lDXWb1eOhpxw1Z
	ch01EnJTAL7S76EFlvdtvKUof+PLtqkNtBZEv+y4j7uOBnznJywtql1ctTrkfOxwGk8LC0Q9A8b
	2zQARa8xf/WRlYmMmPHT1FBsNQBBfuNXsudcD0k3JHoBCYmx4LvdR+xRL22UOF6W2c9EzxtsH68
	llxvEEOLm8QDQZIz1iAkBOFc99m+cOZVjmkAV4UHeoXfxi+6uXDwOPpdhJU54R+Wz3pUuMA+k3J
	9pR7MFQ8NwaMASh6bX9qL4ESyEWFYTPRHgHtumbGB8HBuVxNyZTvoVlzjxGgzVzrMx2mgOV5aRg
	=
X-Received: by 2002:a05:6a00:c4cb:b0:882:2b16:c314 with SMTP id d2e1a72fcca58-8c922b00017mr13559729b3a.52.1795745713852;
        Thu, 26 Nov 2026 18:15:13 -0800 (PST)
Received: from mac.lan (114-45-165-38.dynamic-ip.hinet.net. [114.45.165.38])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077babfsm11807929b3a.5.2026.11.26.18.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:15:13 -0800 (PST)
From: Ilia Snezhkov <iasnezhkov@gmail.com>
To: Roman Vivchar <rva333@protonmail.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, broonie@kernel.org,
 amergnat@baylibre.com, leilk.liu@mediatek.com, me@adomerle.pw,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v3 0/4] soc/spi: mediatek: Add MT6789 PMIC wrapper and SPI support
In-Reply-To: <0Af_vuU3D7JCxCsHmjyJZCQhptiOPd3Y325yrg4ufwjT3C5cz6cgJxU4CHY4qfES7Hhzcb-sxm0o7dj-diOzMJPCcw5bSyrYi5CWUNsXQus=@protonmail.com>
References: <20261126031001.27288-1-iasnezhkov@gmail.com> <0Af_vuU3D7JCxCsHmjyJZCQhptiOPd3Y325yrg4ufwjT3C5cz6cgJxU4CHY4qfES7Hhzcb-sxm0o7dj-diOzMJPCcw5bSyrYi5CWUNsXQus=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 10:15:08 +0800
Message-ID: <179574570832.2422.15788597758077074271@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Hi Roman,

Good point — there is no dependency between pwrap and spi here. I will
split this into a standalone pwrap series and a separate spi-mt65xx
binding patch in v4, and move all review-history notes below ---.

Best regards,
Ilia
