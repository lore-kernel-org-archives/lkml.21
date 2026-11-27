Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795793222;
	b=qCTn0ZqKnmrBGz9th9sr2nXnZ4dvf5gfV+0a4MIuayZvyBGzetuhG2ct1xjI/Ce61DVo
	 itNfwp1GFfhr8TvT4CcXMJooFveibcK1oabmICsdJf+5Iwzsp3Z8k1wP91n776iBoJQyB
	 EUgpig+jY0qH6kBBVSoT+7Arqg8UstWyN9CrMoFCqeWFNwKDV5kCM0FydUR7zxmN9hd8u
	 QZmlVVpmLS0Eq+TK+ij830uZUpxq1ifXn6nMnReSRrR4/1/3toO7IFKATmHhJTa+u+5LE
	 uRPUrDtaySfKaC821Tv6Oc5af3dmlMJUnli1dP0igWCAjOM6/wksQzyXXGqPJJWgyHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Wctjo3j5xh+nTDA29yMIw47VYYGkIaceGn1gzPZ4u50=;
	b=VFKMBro9XpbOOiUv76ffDbSw2DzBPDRbvrZ8UibzjAEUGh2IcV7+SpYgY9Qc9OsE8gXD
	 eHcopm+F36ZoQiOK66WNf2YEqgag2PZnLNH71ny3JXgj8uxVRw5BXRR3foJQR5ppPWOkI
	 TDA1lMLmvVabYoDa3egWos8rUB5rgpPRNeHTSK8UXV/PhuC3+5+BgBMAUuy4seZcf0S7P
	 Na172jqtUZYb3O6dMouH9lQj6DtABKapM1Rm6EiIUCejjmh08VlZC0rPhsp/fb+5NeQbn
	 K3Q0RnmBrXgMXJCeNlKYPWAJBSM9ODqp59rXTTpcj/IFBRxGIRehQLvkxc2POV/HhtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NRTGBcYH;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FBC606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04FBC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NRTGBcYH
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so67306385e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795793220; x=1796398020; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wctjo3j5xh+nTDA29yMIw47VYYGkIaceGn1gzPZ4u50=;
        b=NRTGBcYH40OSOj7TusSpvA4p0svJSrQ9oAhOaBvt0nicfTFuA4nYQ8Uv2pdW5LFytu
         QjukufKnKP0Od/xhPv8wVvPeqTcdVvkOh9jeO5hzOKRC7/gX/TWQ8ipMubBe4oHCoLPC
         WnZTHqA7DxE7wg6zQ5VkfqMVjp1SFz6KGArlYyONXGmpsCj3MgFiiyWa1fbxjJBYfeW6
         dZO+8m0T81GA81OEpe4onpAYU3fCFGFvy7YpA9k1X/OzLXf6XIO6ZAXqQz8gVZYsUJSQ
         FUKqrbceNRKMOcpXPps7fomzzy+8ELsGJ88Dp+fuutZDbZhQG4ozVSqNHiiPYVtjeCYF
         5PTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795793220; x=1796398020;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wctjo3j5xh+nTDA29yMIw47VYYGkIaceGn1gzPZ4u50=;
        b=Gr+FnK7Pc9g1/FiN1FIoKUf8dF5QT7PcPJfYxCBvc6t8LPclZBQmId+eTAzzC3oZq+
         J/OSbw+YSK01wdukD4vvla57Tvv37PN2u7W2qZU3PaYpi0AD/C4i4l2Pz/aDDyTM9iae
         /O/BWNVblugyNWAG9lioFkfCMdJdD1G9v2y7uL6zvHA5rvVbIdSw8ir7tVF5utop4dv6
         t+nN30ZeJwJW6w1zxultZ8IKKMRN68Zr2SsaGlzkJED/PKB+VFjplOHCbckNWyoexga5
         7LqDSU0C+vHel0EuOd1+u3HMVNQxPo14CxeMO+dLVWpwFMAZG4qr7CsEMH18CaZX/EGv
         KPLA==
X-Forwarded-Encrypted: i=1; AL+hErE8rBH2sBTiQMXssf1QiFxpEN0Qb/j4XYTF3Zab0lYKxQYByq7zcNTJmamBtjcDS+mxMTNHVFpr1smZXgI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IhBFIqaoQc3MhO1aigQ/xtRGlAmL+g9Tqm+D1nxUviZK6GrZC
	hlxDMBRKDmMLALl+Ze0TurAeqoVp/+bK7MgSLclUG9o3pE50hFSoKwkO54RhQaCMjHs=
X-Gm-Gg: AZFdTZdrGqbd6bdpT9XEo5obQwS7TZ7SguLcNerU4CMkQNUvrCCkwvuBI7x8Ko52unt
	nNIdH1jE3+Im+x2LTd55xBFh3aa6laVAEeR7C7MdkwSK+lPq1FSj/ig0BQj0oMv+U/+0uuDHrKc
	xRrUpHW5WNCva4Z8g3JfhO/0sBJj+gCcy7dc3GVJjKZZ5coxu0LWfy1djNqkSF68XulglohbfWN
	o19Vp6E0AZz+EqgMTsbzlbmVOhI5rWLiiT1ylIp/iUSDXXoH0IoBb5+EapFZIpuk0Mg1mwzQc1K
	kKkc6WkN0IxELy9X5HeEGhYdL9a10afZlUW2ppxqg6iuwZk7FDjPqX+Crb0mVseJKh0myhFxMaF
	mjYursGwYsQN1xx0pzfJw80gbWMkiJuXbinJPXb5IydnfVxkkAUhCdPHz63HJFnCDKa/2MQ1cT7
	RPJhowchGqdoviqHnCfkrXmVZ9Ihjyx/pdu07EocmenRJ9s76cqdIu6F8h5pCRJDETWuMBPjFMr
	DgKNvHnGfFp72CLB9sIWNgP11fshXif3lbRFk+1iFH2ZydW7PJLqVvwwLOWXGERs31Y11z96+BP
	PsQBYUesGNapgKMZXyg3TyIjb2GKpW7iAw==
X-Received: by 2002:a05:600c:638f:b0:4bb:6752:8400 with SMTP id 5b1f17b1804b1-4bb8881a2bbmr466455455e9.17.1795793220422;
        Fri, 27 Nov 2026 07:27:00 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm638871535e9.9.2026.11.27.07.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:26:59 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20261123112053.20400-1-changhuang.liang@starfivetech.com>
References: <20261123112053.20400-1-changhuang.liang@starfivetech.com>
Subject: Re: [PATCH v3 0/6] Add System-0 CRG for JHB100 SoC
Message-Id: <179579320502.2809466.14495045547675312839.b4-ty@b4>
Date: Fri, 27 Nov 2026 16:26:45 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=831; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=KeTHYnFw/STnF4LfJvFYzXH+5eeixkax9yQCIss38Ls=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcC519mZ7s3PhhjdU1Ta9iDvb9EsnX9J9MS7zT9yyI+
 4TT7Z7DHaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZhIiAIjw8IVoqazU+8J5G9Y
 JieY8cJhmswq+5Nv1gu6McxPsV7F5MrIsLR9Q60Jz/nd+2Sm/a0K+P+s4/ASfdE5PDVN718s29b
 GyAUA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Applied to clk/linux.git (clk-starfive), thanks!

[1/6] clk: starfive: jh7110-sys: Fix memory leak in reset controller register
      https://git.kernel.org/clk/linux/c/42af5dd8aa0f
[2/6] clk: starfive: jh71x0: Move reset controller registration to jh71x0 common code
      https://git.kernel.org/clk/linux/c/fee5538fec1b
[3/6] clk: starfive: jh71x0: Add generic CRG probe helper
      https://git.kernel.org/clk/linux/c/32d9081dad72
[4/6] clk: starfive: Add JHB100 System-0 clock generator driver
      https://git.kernel.org/clk/linux/c/682283b20e90
[5/6] reset: starfive: jh71x0: Support discontiguous reset IDs
      https://git.kernel.org/clk/linux/c/b93db125dbf0
[6/6] reset: starfive: Add StarFive JHB100 System-0 reset driver
      https://git.kernel.org/clk/linux/c/d856a10191b8

Best regards,
--
Jerome

