Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996081;
	b=gpdTaQgTiRPpGhdnyozbayqqb8XUYlaRXOyvocoLIoJZ2MrXj4BPaCB3pFZIgJVQqImi
	 NYEIBYScYssa6W4XYc+n2ODAqVT1+OQr/hOgExQxsl8xerR1EBPOkwzjFp3CV+Hc2lU4b
	 txjHbs8Vp49WvHrrT4XPI/lsKHNKjMnVue6CPElhvnZ4DKtt/LKyccyJwet3zD22Jg3Od
	 0HRE2YNQNsGtvLtmH3cbQBoPhynJ/9v22CNC803KDBzK7HguSFFw0fJhf8AGaPv7fBUHd
	 4buH8m7VeFC7X/sj3fYh///4yoNNu7kHYG9UVwvf/BsXS2i2Winzr9aBWDHit2HGEgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Wn4TlR8eLWxM319hKeH/ywNfQ03IMDmVqaFVXSQhsp4=;
	b=ttY5W4lBnZyyAGQssrHDI6+bHjeB3o+y4q7z/pzDnoyJlYSWdlv92Qqu6y+CSt5Y7Qwm
	 1qAksdI0Eq1WuymIE43d+9vGxgWgiCZE/HXiZaH1hN1UpW+dvmreIdRB8iLH0M5o3ceFZ
	 RV20KLTZXyIjS38my224KoCiUH5GdsxUj539oYYy+P5oRWwZ1ZsxTmqcl0AnJireeyZEb
	 ei0StEyThWxsRuH/B0Uw0B4rpDRQKkm6eezrHPdtVmFKK9vJJqCLg0nacdj8BkUnlcqb/
	 fmSsYVXbd1y7dZM2H0buP0hZZ28B38FRZCVmKUdVgUuKzz+33gyJo0aSaZ9rl51+H0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Cu3dNoaO;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89A6606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:01:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A89A6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Cu3dNoaO
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-492f563d1c6so227551f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794996079; x=1795600879; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wn4TlR8eLWxM319hKeH/ywNfQ03IMDmVqaFVXSQhsp4=;
        b=Cu3dNoaOROvw8Z0X0aYoedt9cHmkWdIUCopqCk0FznPH6BTlJS6lkNA5ZuolQQzRSb
         gCwWmWglTBjy6D6Pxzb/dZTR9iLgq5ASnYmnjk8HWJC+tUEfuDP03qA4rvAP/DpNhUpD
         /4tEe5bgC/rVib/o/SX57mVsJyjT0HV0BEETlS+S57j9owY7Hb1Sp0YFtVDIJw+UYIIh
         cg9BzaDbSTpeVCd5czphc7fz+/NX6M1qNvsdIQxNqXI81QMAU8EHCTfuDnKk5damCqFL
         wAbdceW4r/L7L/lcrENwsNPAqS9wpiq1Y1G2FQp7h80V11fI8vBuE0mK09MzshIcFNj0
         Iozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996079; x=1795600879;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wn4TlR8eLWxM319hKeH/ywNfQ03IMDmVqaFVXSQhsp4=;
        b=FV3EWTEHXinuIGWu34qxyn/J/ssUQTFN1+c6xq7o0zztkuQeWyNa5W140XTEoGO6HA
         HfgkFM9XBg/35r/jY/IkBkKdmZ1t9qoFSRaMdy1U6KKLDMu59T9ib2zhaEMCHm3Z2+dP
         LamC+Tgc6MDEcpeDgzG3va9FX6pkcb7C1Ph2yr3COYGqDTgEJo+3dsLZ41bBN1Yy21D8
         zTXo8xBAQcgDXuD+jGWDJc/FcGIGn+pcVrxEm4W2yd+aNN9zCZxpJRqeEK+VNyUZ9Fhx
         gM8vYdn6ko8rb8QnXhy0h2x2sfvTXw65Yo4rSNAvO/k5dVMz1uznEGhi3gt7fBNY0o/r
         YwQw==
X-Forwarded-Encrypted: i=1; AL+hErG9q6hOD4YFOj3AjUnIUC5sUYzfi1Xkli4Bk5iad9XqH3STElWE7ibbcxDCcge8e2yjXJopmpBlWGRmCLU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+B759NwknGxzzWzHAEy4Q9GGG//9xDInaBRpyksnD2Iuj+/auW
	UgqYrXZFXmU1z6bcsWUgsPh7Mz7im/obJSnYUjxz60BoO4eDQaW1QhwEt8Ldl0jrnRs=
X-Gm-Gg: AZFdTZdy/froBdXEd/B3XW8VzmxjSE8O8KWyx7i9voFVt162HcLzU2E3nILhWREHzR2
	xGd4ZLTf7fqt80P07W+w0M/g6lQ04gKpnv4iZPLchBZ1eLqHWdzq4AIxpnN7awkeh9OHXTkzFVy
	N6Fhia4vkPQAqCkOya3KdtRsuCFUXHxwuQSrsgWclKYf6qiiqG7jGKY42Wn24EtFkWb8TnR+vTo
	olry1GPXN8sHaspmlChZ1IzxA+IqugiG97W3yBbE7ndjlpuIOW5WkjZ6b5emEK35XwG5CQVh2Hv
	B29xh0wSca1p28YVsPT1dw4WQbo+aQLXwNCTPKbprtP7t7WK4plggpv5p4ptjaR1xUrKjU5dVA3
	ILbeH8LDV5NUtJxPyFeOI1zLrooCl5AHq5ES9M2EEPi+K9A7d2tuembHgsNuJq63sDwFBakpw/f
	iBleTLL585OUMhcy1pBj+JfoRYLw0DIhedp5q6TeLLHSn1rLDaJX5whZr89q+XQBezVFwrQKAU/
	Ts21WTl0Dy7dtnL1cV9eO/SLQTmCN9HPUL9otJTbAnCXAUO0hBvUjpIBeuKQ8HLXoNG0rij1+Qr
	fEcHAmhwRIlz3HFOVg15RMK9sy8sytDGAAn6hS0lmoBP9cLK
X-Received: by 2002:a05:6000:4812:b0:491:ef0a:1f5d with SMTP id ffacd0b85a97d-4a63c0938c4mr4292105f8f.39.1794996078453;
        Wed, 18 Nov 2026 02:01:18 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65100c6bfsm3712254f8f.2.2026.11.18.02.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:01:17 -0800 (PST)
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
Subject: Re: [PATCH 2/7] clk: meson: pll: Support PLLs without a
 pre-divider
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261106-upstream-s7-clk-v1-2-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-2-7d501d62621f@baylibre.com>
Date: Wed, 18 Nov 2026 11:01:12 +0100
Message-Id: <179499607255.413320.2562080050432015678.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=867; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=5EHyC5MxoGvHsCcV/VC2od4aT2B3tCgL0d4UTk1LaZY=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFl/y3OMtyjNXN+x6DPTga27pnxbX7qy1DfK8qqpoZ13x
 EfpYP64jlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAExkRivDP5ujDMWqq/wiOi8w
 7dgxUSuhNjf2xpWV3VtVUp2rknN+XWdkeCgxYdb+ymrWX4mWglrTe08XrHBQCr18n71wQbN1tIY
 PKwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The common PLL code assumes that every PLL has a pre-divider. This
> does not hold for the S7 HDMI PLL, and the S7 GP0 and HIFI PLLs are
> meant to run with theirs set to 1.
> 
> Make the pre-divider optional so these PLLs can use the common
> implementation.
>

This change looks like the intermediate step Jian needed for its rework.
It leaves some problems open, like a PLL without a predivider could still
pass a prediv in its table which would lead to inconsistencies.

If I take it for the S7, I still expect Jian's to rework to be finalized
for the other SoCs. Note that I will not accept more SoC drivers using this
intermediate step until the rework is complete.

Regarding sashiko pre-existing issues, You are free to ignore those in the
context of this series but you are welcome to have a look at them, if you
want to.

-- 
Jerome

