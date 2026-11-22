Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795360316;
	b=xhaDO/ZH5Niygmbx3nyy5xCKsoQUBI1Q4XtuK4bZGdXC9Um4MYDiJKg1qXSVFFS5pM5B
	 g4P38UOxT8Xn/nD9P0zAAoNdAbhWCNsuNr+NjzX1Dh3Bhx6cBEjT1r4BSoQI8tX6xjka7
	 H+fkVKswqk4+5+NrMaJIHe+gXOp3Xx1vCF1S6Oy4KOW617+/KL7nCBsd9SfEG5WUMLKIj
	 sPsUpCbp66Db12gtOWX/Ah5LKW0+6SluTPt/oIyQfFCzQFmOaGsPA+FGcXOnuMiBHycSX
	 7q5gXKxgQvra6/UP6cgb0ohR0jNjq5wjAtWhNSIIlbeOI2xaLjWmVgE68xcCHFcmJIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795360316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=5Z291C558lsUtUj4LPUhpkrr2FrLmzRC4TeFBwuiY8c=;
	b=nnaPohUhg50VQM3mTNH8+8psIFwjYEgvy7jW+SxQiDg/nXB3vdEEhoJ4/rcvpo3F2uUf
	 +Ww4UdMYAU7+mtGXtNJ2XlfUoL/BOxUqn35U3qSoN/i3f096wUGyxRzoSwLtwh0uGUBC/
	 H4LxBAi87nd8XtYuvAeD5XepVjKuSWw6IqIZnRolFLOor0+9AaNwF+N0oSvgWUI5hgodb
	 XbcNjvEqHpH0IBPoxXXWrpbfVXpyL/BZs/Rveth1+w2P1O/+mnsUmylcw+4DiXZNQOFXM
	 fFeaE6ZO6UyttPiONcJ7kd1cXZiBmqOhyURkp5bMgoEwFb//+QwDcAM6VCJGJPMhWDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dtXtggfE;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6CE606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:11:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D6CE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dtXtggfE
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so23467595e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795360314; x=1795965114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Z291C558lsUtUj4LPUhpkrr2FrLmzRC4TeFBwuiY8c=;
        b=dtXtggfElS/AHPYflC+EBM6ex68Vz4KSSe/5VUUMaopzAXpDT5crcrLRZxByLTfcXm
         Pfu4oVG1dioy8Qzk2Ph4pceT+Uz3/GMd5oH+7hGGubpk0AIn3iv99XAP3zimU1m/cZ2d
         /GQrGkAPq2deJbVwUAe8LHZttix9sp9PZ9BDFAw7TMEqxkGBFNG/oUbcmCw7W8Nq0Ntu
         6fFZahSCUc3oYOov8DzGTvQzXAADUBNpVj17BaBbmcmCbh8VPHfsvnDOuAc2f8oiN/jd
         olSdDnux5EQFbpLwefOeoqiFs3R9SLkzCQTvLy2sb0RSNdBE+FU6Q9rs9NET3MCa86O1
         L4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795360314; x=1795965114;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Z291C558lsUtUj4LPUhpkrr2FrLmzRC4TeFBwuiY8c=;
        b=rdGPWu+kuiN4CYne1sutswQseIR3D41zcyjA5S87lxzveA2YX0xXSYQzdZFY7fK4Qo
         2WbnzUoA+k9aO2dzYAumngj/rZrNCB5E69KFJE5mTyuTjlcceKlW3+qfN8LGsQxKk+Js
         hAa6XAtuwatAA2VXiO1ngct0sVzCMbb3+L6ysgLpUzdotGelaE2Rkg+V0KhR8qiTQP7B
         wAseG/7BfHc/6ZTUO6W8LfmGonX8ewpbMXuBHAI9+DtxmOrEgJ5sBr/GX5z+UXPeE2el
         NE9oZBDOfiZZdW3XBOt8NL1wEVpgeSMqJ3FXZH/Gk9LhAKDw2MwZhFAQl3lsmVtzK4ga
         lH+A==
X-Forwarded-Encrypted: i=1; AL+hErFP9SvHRCOfCPekNYsIxtfMhtS4rAmEOMTxpVmKsWbGuPySu9dKNj0Nt4IV2RuBGqijqx5gJjNuPhiQ65M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yegQuP8rOkTksDq3OgtFzivvV3GiIuW0PSsN/hNp+q689Bsnw
	eUPGh8NSHK01uXGZ0a64EhEgFm3p2PU9Rv6zukUH0cn/BR4feZZJGmPq9rpolo3ytJE=
X-Gm-Gg: AZFdTZe/NqGF5gGdSAgbo4/Wwy/55Do/j/WkLXDL+Sbs6WtVKGPVyY87uoHbzgwD1hZ
	+8RcwguXHCyWYGApr+YqIhleAOUU3v2f0EXT786rQkyh7VoVryZtpcVqRJ5RCjoxU8MmVWr1G+o
	2DpRNVwmiVfKtoBdD64UPJ8f8cjfkc5baL4+oZBsCFnJ0NNJ6X4rELwV5P3EN5VGMM4HljWekDA
	0xd18FAzsJ+Ibmp7sZAJr3qzTzJi2bWNZU7+g8SBXDGZDTt2Sgm2Z1MhwQyJS3JuBm1yfJMdNfE
	KrD3tuN10VhaWbs5PYvUyM8yhmiBw1dnmW8+Y+3YbTr7AifLj4UiIubiguZTEaD7v4qKC614uK7
	lS2mKx7a2HKeYOclG6R1r+K3U8kCFt7tyOzcU71b+x80J5V9sqj53/oJULmZGYGa9tO3OZNUtSo
	A4wMnXDGTZS4VD2ysFEbeqnIyqk6ciDf64IvS5i+xE+2rJCBwGvNdEo7Y4dSK85U5FMrSlJeiH4
	Haa73m1ETz4NTopRelgnHIgzcnX0j5VaMvhhO0m4bywneOlMg0B8y9wNUUcDmThNyN7sS3xLECd
	QTTMaTytnLu+gWdUJtuY6TOkooiOx7hpJSKxxJ5CajL79j1Bt+s5GNdiBvIYoDp4PGtg7A==
X-Received: by 2002:a05:600c:3484:b0:4a2:133:45e1 with SMTP id 5b1f17b1804b1-4bb88812f16mr189053065e9.24.1795360313921;
        Sun, 22 Nov 2026 07:11:53 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2050f1sm16789049f8f.38.2026.11.22.07.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:11:52 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
References: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
Subject: Re: [PATCH v2 0/6] Add Amlogic S7 clock controllers
Message-Id: <179536031124.2724645.9771781564056139591.b4-ty@b4>
Date: Sun, 22 Nov 2026 16:11:51 +0100
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
X-Mailer: b4 0.17-dev

Applied to clk/linux.git (clk-amlogic), thanks!

[1/6] clk: meson: pll: Support PLLs without a pre-divider
      https://git.kernel.org/clk/linux/c/0068f78e25a4
[2/6] clk: meson: pll: Support active-low resets
      https://git.kernel.org/clk/linux/c/288015e923df
[3/6] dt-bindings: clock: Add Amlogic S7 PLL clock controller
      https://git.kernel.org/clk/linux/c/7230757fd4d1
[4/6] clk: amlogic: Add S7 PLL clock controller driver
      https://git.kernel.org/clk/linux/c/19206e1b1299
[5/6] dt-bindings: clock: Add Amlogic S7 peripherals clock controller
      https://git.kernel.org/clk/linux/c/ed4da9fe19c7
[6/6] clk: amlogic: Add S7 peripherals clock controller driver
      https://git.kernel.org/clk/linux/c/20c6003759a5

Best regards,
--
Jerome

