Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015018;
	b=dhVFXcCtUNIfTw+U6UycuA04NijFiWriDU/BWDaWVKQ2GNyITbcBFD1UADH7oImtxwIf
	 u8mHhrb0FfOJtS0wCVCpycVyhvxrV45JGG7zjBgNjL/gyOhR2OEPzuvTJ27qI66IArW5g
	 VcMAf2sns4+EkB0+90J2FfdC3W8zIREVRSZk3bafVafIet9dGjQFtG9Qj0n5Rx+kKmNal
	 WWXyuZy5BRiXDlqF3iLrDfvB7IyuAl/mF5xPq7xfUmJpFF6idGJlTJjsDcjEr9qyVJa1z
	 /M43g2Lpj6IVEj7RvUnjmcf0tmUYHkqSfhil74mPI0VGGrkLYonnOhEtJqtI1Cl/SLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=rOY+wdV3n8VmzgrzAHcUOOBb9IyWYRHS3lQymwFtS30=;
	b=M5siBMeuFqZ+206JVvv96XfPTIS5DNx90OWBL4eroOspM4L0vLLvW2lEma8E9nAgSKr8
	 /gCV8Jq26POZnwLNvDe7n0jh3S+udFHNKF84dL3JCSefTiu/FcB8LxEaC2yzVgdB/ENtK
	 gPDqvszYg9REjPkZo5JBGqW2dbY0hrnxcBGa0O7ljbWL+KU38QkDvXVfaL9YkhASglWgf
	 vLRFRUAU6R471P0y2Ibhn4t84Zo0XEHD9YT7tX/6PCwSdVCQuw5Yjk+KGMZcdeBoiL8Dh
	 ET/20BvF2ju5Sm81gtOwO/eKwglI+DrPRAG1L9vFQTN91cPMY3eGTIsSL0kKJb1VokA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=iEWjEnyL;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAF0606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CAF0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=iEWjEnyL
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so973164f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795015016; x=1795619816; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rOY+wdV3n8VmzgrzAHcUOOBb9IyWYRHS3lQymwFtS30=;
        b=iEWjEnyLaCvEhk5M1AC5NQQlDysiyvVk+m/XObmo5r4yFRVJsV74x/mhSkir4B7qMz
         KtA2S2cd1SPHmCasNEl3YXtyCltDHfHkQAUr4PM2xp4ys0o+luBMLN1PJAT04ec0CfEO
         J1ue4dlADD98xco42qsvWjY8TeUYJ91pJNlpG2HzLaUzHGgigZ7K7BJVsf/iRHcd3/ze
         1p2ldMgEy8WXbZamZrds69/CExGXM4jkrb8GBZFPllc+UCMfN/cuXZkZBwwee6elg9GH
         /8ejWlKpm3hSAazBTMqC5VZicJkOW+eBUWv6KXgh3TTCLik9m+6JsizSQzNiQapg+xCt
         6jsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015016; x=1795619816;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rOY+wdV3n8VmzgrzAHcUOOBb9IyWYRHS3lQymwFtS30=;
        b=GM/AJPULnXhvmTnKqXMUalknSzjvRyJhE+x+OeDAlKdTopOZnfW3L+FwrXONZix2t/
         hW0kR/KngOjb9aNwpwEfnRgGbOqHr4aNV2IynPjcd6VnEXHw1ebgLlbyNMoU2FymXPbh
         7qCRPBoNe9iKpBRORlW4uO4JyXKIPfFvOYphjtXR+8ixtlBfFA8B4p8sdgIMd+Yo6iKJ
         VnkLf0WABGYnjl1tRt1lSOGD1nevVTSZH5yFt+GrvIT1QH1gyip8LBO/3szxT3mW+v4j
         aMBZblchpfBI05yj8nq2P9w6eBJgG2z6tyJDFEjBwQzrYGsjpXo/VY/qn05cOehToSca
         TDqA==
X-Forwarded-Encrypted: i=1; AL+hErHmlM33xuE8Dot7D1kVvLe4/RPEY32z+iwOIk4d3OvrPEo0+sZ4MreYFh11oX7fRDK5JBv61+TDsYOdyXI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rVMEHXO3c7E8/rYytFZVOESiiuenxyZyaXOL43kPybQ+jwRze
	RadzRHFyNOg+kj072rV8JFz450ft1enHdo4AJVVL3LAmsZOSJWULp+e+Z5FYeiaJRgU=
X-Gm-Gg: AZFdTZe1kfRDxWKU/4GrnrWnuPIuzThytGf9fr152xrGZWOHC6JnQfL/uv08lFPcFwD
	rzijjg/o57u+4gG78ErP8zg4NXnHtCT6T1c9CnK+hqWezvUr0HLlXsb26+CuUBAIlRJC5aZoosq
	AnjRfU0aZZuabJke4kktnsXv2LxSk27zO1dWmnZ1A23oDjcdZ4ZYuO1iEjEuYFMN4XhOofeyXh1
	2oHSZKp/U7T2ahOfeoI/5se2kYkc1COlGc96woFBnf0KnfTSy6x2h6qTi9FMz2Qyx6fJQFe7otC
	dzKwf7emER2Znn6CowbkIdwDMyc8Vbg3heqHj3jChmUdfZ6GIVGX9WX2cMaY9nBCDz3rLlCuINr
	hsTt2Ko9QTkKuEh/UoB/f7Wj4b8FqJ4tpOk71gwxp7eIV8nprb8PCU4YsQU1iDoNLkQdj1/ji3v
	aFL0VxHK5VQ2vKw3hOvngfwLWjTsO///302Tic/+dx99JS5GFQiucA/Odyd/V2GgA0TjzKNGmYQ
	NB75mwvZj78QqrbdGGeVtn9mPXWIcRyDrj7cJ0vkc3BAhZNQuaTRTiMBOHtzNenineWYauCR8Uz
	GNt3lbpRYHtC9fw7iksTEvRyQWUJF151kuJntjho5mWwgM3e
X-Received: by 2002:a05:6000:22c5:b0:4a6:ed6f:7a6d with SMTP id ffacd0b85a97d-4a6ed6f7c2dmr4688498f8f.28.1795015015881;
        Wed, 18 Nov 2026 07:16:55 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2f682sm5148396f8f.6.2026.11.18.07.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:16:55 -0800 (PST)
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
Subject: Re: [PATCH v11 00/10] clk: nuvoton: ma35d1: Fix mux parenting and
 peripheral clock rates
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, stable@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v11-0-bd1d1e060926@bootlin.com>
References: <20261118-perso-ma35d1-upstream-clk-v11-0-bd1d1e060926@bootlin.com>
Date: Wed, 18 Nov 2026 16:16:50 +0100
Message-Id: <179501501070.639563.9357303541273366380.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Ze/lWMxenuMFFinRWmaSX0IcexmH1tvXM9t0DvMowcU=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFl/D6bpy/0tV5+lWL51RkjKPQXn58FtMoH+f5SuWOVVn
 Q0z+7iko5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABM5Z8bwP3716cfT9okus2OZ
 8K++LlbF6Pn25IUzVn3Zf0aba1HEyhhGhjdSSyMeLDnMVr/5vvLSWKM/unu682QdT776tVq3cnv
 vJwYA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> I am in possession of an MA35D1 NuMaker board. The SPI controller has
> been contributed, but at this stage it does not work with the current
> clock driver.
> 
> The clock controller registers its muxes with .fw_name parent data,
> which requires every internal clock name to be declared in the DT. As
> the DT does not declare them, all parent lookups fail: muxes end up
> registered as root clocks and most peripherals read a zero rate.
> 
> This conversion exposed a first issue with the WDT/WWDT parents which
> were actually missing in the clock driver. I am not using these clocks
> myself but it is worth fixing.
> 
> The second round of reviews raised another problem with the
> crystals. HXT and LXT are external crystal oscillators wired on the
> board, while HIRC and LIRC are on-chip RC oscillators. HXT was described
> whereas LXT was not. The series now also takes the two crystal inputs
> from the DT: they get documented in the bindings, described in the
> boards and looked up by the driver (with a fallback for backward
> compatibility).

Hi Miquel,

We've had to base clk-next on v7.4-rc2 because it carries a treewide change
around devm_kzalloc. This was triggering a lot of conflict in linux-next.

I did not look at your series yet but it does not apply cleanly on patch 3
(maybe others too) because of the same change. Would you mind rebasing on -rc2
or clk-next please ?

https://sashingci-clk.liltaz.com/builds/555/steps/3

-- 
Jerome

