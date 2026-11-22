Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362241;
	b=2910UZzoV4duX+9NbEou6K0GnPubR7kzYEvljK/u8SeRRnkx1fYlpcqxTbCsmswK4Kzi
	 oeScuvSAX7YzCs+NqjVIOA5TsidfElHM6msqlE1jE4Ro1SWc2BrbPvO2jodiT8QSxUr3B
	 DLKpzYDvPsiSHm1G+cB5Odf4Pw6G6qIh0SLIuEHDgiQXyOQ1qUpPKxswdevU+m1aM8sb6
	 RStY3U4PV1jMJRpjiRAUdVUWEG/EwKt7cTH0wPwBH2Z5YJb0K2/SJNXWlF5eHex5yVvWK
	 GdBnfq2QXyXNM4fCRFzBCNgWTsLvVdd5WE5t/+1aaQu1RVWTVBSwfLP7XiO5gB+cjoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=0GuOEghrFkpLs2B/T6fa1CzO0Yst8Aztd6pT+6L1xBU=;
	b=sjpN/YoqqWEWgqLHp5BBLv+Du25SiUOobnkaDXVFlRhx1dd8SQVQJh2u1cle8OQEfOUf
	 120GGT4yFZFfz8Eb63g6wksylEu3pTW2aux8+f+VT1NLNuASRYJ8ccPFDw++2krZtgHxD
	 dXnjIVOk0FSXoDw1eak2/KfrCQiEOsSSr4YMckpbpZELKPqSRF7+zWzovA8QB656IeYKY
	 htwKA7umL3YCGWYAh97LaEQNpw1BWkqKghUzWYkzayDPqCDiQPCz3iyB0Is5zM++KpzxG
	 8cuY3w/QztZ04qMHRqL7l1gYvc1leLNR/jCpLAEAKVjV9Z80+HUfigXg7lC0zReXD/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aZXM4oS9;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA50606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DA50606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aZXM4oS9
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso23720965e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795362238; x=1795967038; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0GuOEghrFkpLs2B/T6fa1CzO0Yst8Aztd6pT+6L1xBU=;
        b=aZXM4oS918gG+eUP05Y1qLbGllYfPqBjYyT9x6LIH5yay0JrLpnkpGK9KckLhxkHtC
         1bsAhDtYfv4T55SvQ1e7FwEBzZBg7ABHX5uRZFhAfiFsM7Exr/RhOgPQTmQzSju5aD4G
         UDRPONiDsHybe2H3/zRgtsHE9H7AleRGGsYYajwkDMtf28T2yr3a2Ni6JqDFIXiqa+Ws
         0rAhzAzl4Wgiw4+rh6Aja5/tq+3VO0sRqsxG6xsWQ4uq0xG6cH18dH555BfFawxT4BhP
         MB5Z1GyO5is330qD5bRHpTQEbEQyPIGsk/6d/weZnfNLLTbR2k/0gyeUqkDaZoxJDgQ3
         EcWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795362238; x=1795967038;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0GuOEghrFkpLs2B/T6fa1CzO0Yst8Aztd6pT+6L1xBU=;
        b=2Zjq5NkgDikJkBOTbcF7S8QLzAIqXdLq2P3s/mAaKqbHiX1Nfxn8slPKuV/LPOlY9k
         9GrW7e1YqXSmfSJ9S05LwQb1U9/ZflZTpChS32y/fRf8cSOqoujhDE263m8FrVvW9iRt
         lHonM0Rl/4x1CITJAo18Ohs2Sw2153lRiHmN8xNKLnJ3eDYNqsy1ZsZpXG+MQbQg83tc
         MvV7AiRdIdRp07KT2aIXf6Q8XRitwIRVLy2znlqo+1EHVsxpk2JOK7eJdH3tKuuOofDS
         JbevDeyg1gh+7Rw10oXCZa4eeRM94dlgkl7T/8qmTQFXQlp56WAHnIQF1BVdrE9IEC/5
         XctQ==
X-Forwarded-Encrypted: i=1; AL+hErEqEIc5wLblGeXzVL4CVVAaZkeUOJJQzFRCvizyFRqEAqIYdpTZyFSQTDuWM+pag2oG0NlhCgS2PYws+SA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QGKROf5Qu69RMMOs6n6X/pxCo13JJj2N6IDcu6c4FoBCxmUeP
	8Y6xx441F9uSR/5UUUP7Lz+j5rUVpXxmuOck4ZabSc7cWpoXPTzd2XOx3TlPjbuk4gkv0AZiPuK
	G5SbeZBEQhA==
X-Gm-Gg: AZFdTZcmcbspG01nVsWR5OVO2zfalYAw311mj8/quMWQar42ZDRcNOpWZT7chdj6gAb
	xceRKKR0wX5LOhdc2JKsdds0zOAXW/oulL1hGARxspscN/BvSQqfqTET4SutWqf9q45rnmQBvTe
	c6Z3re7HwU30UNSV1Rg+JLEKxf7vrtCRYtEMQ8gJ7/HowhNSYuO6Ux3N2wb+3yFYgTMjbonVATa
	ON09ZllC2+SDTdruOo0603qtqL35vTU45QtMqgK+fcuAyTousTTqi1jcdJiZ3CBbZoU8FyF64VU
	oOqb6AQzXiLuPF5P2uUWizVXWyphgZH5fkk6is4MGcXZT9wz9X3G0s2h2OzJi6OlmjidsUX1+vp
	ecj4kcMz45lfEcDk7oXE3jmwB3F3UTTXbPGl+pgLfyRcAXZu0VTksyU1kLnM9ZaUYo8g2v5vyCq
	Q0Ic+C8Kr6uKhUT9GqzfHtf/j2ZkMEFVUrzXk01sPrHaZEU5H7nrEMu9tkgbrNQso6zIuDCHmSQ
	FZoYp3thPRcB6ZB1ay9J7W/y48/fXB3qWJUHStDQINyVQr4mi8Qloz26nryVkY6qPKZi3YTztKU
	i0+0ZrWcRZ7+in0jGbwFoNi2WEkTo4VTvKLvgT12ElGUXeoV
X-Received: by 2002:a05:600c:3f0a:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4bb8880cde7mr182572615e9.22.1795362238621;
        Sun, 22 Nov 2026 07:43:58 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066e34esm129786485e9.3.2026.11.22.07.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:43:57 -0800 (PST)
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
Subject: Re: [PATCH v2 1/6] clk: starfive: jh7110-sys: Fix memory leak in
 reset controller register
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261118100523.11395-2-changhuang.liang@starfivetech.com>
References: <20261118100523.11395-1-changhuang.liang@starfivetech.com>
 <20261118100523.11395-2-changhuang.liang@starfivetech.com>
Date: Sun, 22 Nov 2026 16:43:54 +0100
Message-Id: <179536223421.2728475.2551074975231928125.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=416; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=qf7fKlC7xQ5OvM7XPpMsjo0fjKrbdU4orK1COOHrhak=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNnMvHsqQm4XN/ZYbtt4xPoXk4RTR6/I4nABFSO7pWpPE
 1c9Us7vKGVhEONikBVTZKnhrhZ/J6n1ZdZ0ndswc1iZQIYwcHEKwESWH2b4H6i5IWbTi+a+3ocn
 UzdoicyytWfgM/3r4Gcps1W75b8tB8P/mub8vdGWJkIF8dJHN+wU7023DPlsHnpU/aLS1X9Zgi/
 4AQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> auxiliary_device_init() returns an error before device_initialize() is
> called, so the release callback never runs on this path and the rdev
> allocated in jh7110_reset_controller_register() is leaked.
> 
> Free rdev when auxiliary_device_init() fails.
> 
> Fixes: edab7204afe5 ("clk: starfive: Add StarFive JH7110 system clock driver")

sashiko is right about this tag, this needs fixing

-- 
Jerome

