Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009113;
	b=xWjV/0toAtF2+hcl0uR4LB838uYBnTqCZCn8B2Lf1chih692azukfxy9tfd8zNYgQD98
	 boir1yisA/LNX9KD3rZ30qkIG2chP/8iwFmHkppOhaJRGsgK1czGCHflyivarqkqa9KSX
	 FQAhuu9SDN+QiA97B2Js/s14fwFHZ5uzcryEQu2xUNcbc6TAJoe1rTdRLoW+N8XpqAm2i
	 5eYF2rMpztqPn/t+8aFZcKsIwhbMqVdtSljOdJ0mz5Are99vlXkYfEhmI9GT7DJyxB71G
	 h6rS6KEBFLJLSNMmIXNqHasnmSC0t9oBCkKL/FEy12i5IqhRQf2+dd88aGuj0LanpKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009113;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=tRoiMPf7bc7glgn8sxiDt2fd8OqUIkdqotnoRF5JNCg=;
	b=JFVAsBp5xZ/R+V1yfnfugi4xLAgZMhPbZMbImc8JwTcalF3iN9F+nJYEhG2Yl7eNfDe2
	 mizOe6hrsTkpXf1pEWUgZGXbm87YkWGGaXbRdGIEeA0i1URhCoivZ3z8VHhbHJpVrcNny
	 q15kOR2E3Xkn/jBCDVmEcmNrS2vaTE61b+WjrQgzRx7NWkrr6IdH3ZMeRtf68XNUFEfCV
	 TQIluI2kIgvZC177gms3sNP04DHlCm+Db/tbp3NuM05x25pkgW9nKQlqIUJfesUlmAa7L
	 fEscuw65+GgFJ6Fce3O/FscEjui0jxdA28nEnnBpZQ/PxflbwLuz+Tkhnc7WmKgIYDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=WtQ6BEBh;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA00606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:38:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCA00606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=WtQ6BEBh
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A7B801A16D0;
	Wed, 18 Nov 2026 13:38:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 768B55FE9B;
	Wed, 18 Nov 2026 13:38:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 811BD11BC1FF3;
	Wed, 18 Nov 2026 14:38:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795009109; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tRoiMPf7bc7glgn8sxiDt2fd8OqUIkdqotnoRF5JNCg=;
	b=WtQ6BEBhdGQ4Wt3gDfXBZLiEJKbVeKUy1I+YDYe9za9XuSECKqmAQiePKNvZWDALgAoSTN
	uqUeYs1PTi/Jn0HXbVipAPayC8QcwJTbpYd2AGwIbKAAa+z4V9MqtLY6OrBiEWZxKZgt+b
	c2v3WU+hl1c36CXmoc1e72uRyfGc2nNyK2GrOQZURFOH8lY0qoejkzC3zQ67MlkJPjfSgp
	XwMCyhhvvEDLXWZhWCRR1IpXtKWwbMMbS0oOHI2oKB4La6SnO9IysRokaldbCZD7s89mlt
	hv5XQIJkvEa2YOqIsgefHC7Vlfo9fdNK3CtguxPQCKZyM7tFiHjutEDWXAbkAg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 14:37:15 +0100
Subject: [PATCH v11 08/10] clk: nuvoton: ma35d1: Reparent SYSPLL correctly
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
Message-Id: <20261118-perso-ma35d1-upstream-clk-v11-8-bd1d1e060926@bootlin.com>
References: <20261118-perso-ma35d1-upstream-clk-v11-0-bd1d1e060926@bootlin.com>
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v11-0-bd1d1e060926@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The clock tree is still incorrect. SYSPLL is derived from HXT_GATE, very
much like CAPLL, DDRPLL, VPLL, APLL and EPLL. SYSPLL has a fixed
frequency, but if HXT gets gated, SYSPLL stops running.

Reparent SYSPLL under HXT_GATE to properly define the clock tree
topology. After this change, the frequencies are identical, but the
clock tree looks (again) much closer to the reality.

Since the TRM does not explicitly shows that HIRC and LIRC are
internally sourced from HXT and LXT, respectively, I haven't reparented
them (even though that was tempting). This can be done later anyway.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/nuvoton/clk-ma35d1.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index 8fab3c563316..3015c49ee852 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -139,6 +139,12 @@ static const struct clk_div_table eadc_div_table[] = {
 	{13, 28}, {14, 30}, {15, 32}, {0, 0},
 };
 
+static struct clk_hw *ma35d1_clk_fixed_parent_hw(struct device *dev, const char *name, int rate,
+						 const struct clk_hw *parent_hw)
+{
+	return devm_clk_hw_register_fixed_rate_parent_hw(dev, name, parent_hw, 0, rate);
+}
+
 static struct clk_hw *ma35d1_clk_fixed(struct device *dev, const char *name, int rate)
 {
 	return devm_clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
@@ -286,6 +292,9 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 
 	hws[HXT_GATE] = ma35d1_clk_gate_parent_data(dev, "hxt_gate", hxtg_parent_data,
 						    clk_base + REG_CLK_PWRCTL, 0);
+	if (IS_ERR(hws[HXT_GATE]))
+		return PTR_ERR(hws[HXT_GATE]);
+
 	hws[LXT_GATE] = ma35d1_clk_gate_parent_data(dev, "lxt_gate", lxtg_parent_data,
 						    clk_base + REG_CLK_PWRCTL, 1);
 	hws[HIRC] = ma35d1_clk_fixed(dev, "hirc", 12000000);
@@ -297,7 +306,7 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 
 	hws[CAPLL] = ma35d1_reg_clk_pll(dev, CAPLL, pllmode[0], "capll",
 					hws[HXT_GATE], clk_base + REG_CLK_PLL0CTL0);
-	hws[SYSPLL] = ma35d1_clk_fixed(dev, "syspll", 180000000);
+	hws[SYSPLL] = ma35d1_clk_fixed_parent_hw(dev, "syspll", 180000000, hws[HXT_GATE]);
 	hws[DDRPLL] = ma35d1_reg_clk_pll(dev, DDRPLL, pllmode[1], "ddrpll",
 					hws[HXT_GATE], clk_base + REG_CLK_PLL2CTL0);
 	hws[APLL] = ma35d1_reg_clk_pll(dev, APLL, pllmode[2], "apll",

-- 
2.56.0

