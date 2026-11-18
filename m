Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021606;
	b=2vZ1YttZv2E5w/+NMcFLvsunT0Lwt83pnNn81kaiDcz+DT5ZYsrAwy+JbDC15d3yapMV
	 Y3eKFAKWyjF/5eMFGjBJE65nlIG/OBkgXivDC9WMowQ1/JveCId0HcxDy+u9vX+oS+t2R
	 NPy7LtRUfTuk3snLIrNdBcD1KU0embmERziN9lLnAsvZSzIUJjRHqTVRkm2C1/gyiqULd
	 UbQYvJjjFDya2Ek1BEDaplHDvy01Q6EGqE5TwzQ3uZrAgReqs66a1GlU/6rBCt6wo89P9
	 ARpQGIcFuSW4Uq6fQXnsVxvPjAe9dClq/qkWV3UDbROKkX/edjeE3bJar6GEDI+4kVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021606;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=tGR1Pheja8UX+q7j6BPbOePxrbdEA1lKf+oSFzTuAy4=;
	b=TZ+r4ut0vt1DypXCmP0z8zY5bkcP88CXJiDDxUJyvB8Xiv8oIuMIJxdcCKazP2aN3xYu
	 KvOEWz9e4ANtmRXB+fkWfYwKSzu/yaEvQvbqL/tferlb8RXG0a0B6IxGm+k99XiztXLPs
	 d+CbVDi1Q4bpWO5AMf1Z3MOYkkG8DqZS9dWxICDBUIJaxJf0Cd3MLj2KRmxfnMVR/+95Q
	 gEuS8OTxWmGjaKJ1EfHKbEs+YB34KGgq1UKwb9Bce9dMluP2J+qc+iwXKd+IQDiIi/rTC
	 a7KL5azx2rq3jVm8dEv7/s2qwVtiASt8PkUo4Bj5JrPCiU7/a31tKSsfG8PSh+/p+wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=N7tWJTXq;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B34C60A2603
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B34C60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=N7tWJTXq
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 03B3CC4F77B;
	Wed, 18 Nov 2026 17:06:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 18D525FE9B;
	Wed, 18 Nov 2026 17:06:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 30A7811BC29F5;
	Wed, 18 Nov 2026 18:06:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795021603; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tGR1Pheja8UX+q7j6BPbOePxrbdEA1lKf+oSFzTuAy4=;
	b=N7tWJTXq91CmHZAVeUCRic974Wak36ycLZYVPBV19l92gS7EePUMS1QnL3VxQ1UwyxXGj/
	a637ctUnvyPT3jQEj2+XKFQp72QJXDfmxVBX5B8E+eebxCN+gfh7ZAGztl1uzH5/RkHkV+
	bUzI0fP5YKlTBwOHwa6cJblkbW4dcoerCq2Ifu8kqroQ5P2D9/wUe6x1QJSga9PAOBmlvs
	UdYaczEBb91ov+wceS8QCAlrTfce89d26ARjirGNOgoWAKL32rQvZjIHGQ4O3qDvAKWlMU
	ZuxPzQfkEHw4+5r3VE10OydcUKq6QhFafH3AbGFKMm1oSgB2xlhj1Q0GnG/hQQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 17:59:18 +0100
Subject: [PATCH v12 09/10] clk: nuvoton: ma35d1: Fix CCAP muxes bus width
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
Message-Id: <20261118-perso-ma35d1-upstream-clk-v12-9-bee2c8dad4e1@bootlin.com>
References: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
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

Both CCAP muxes are registered with a single bit bus width which is
obviously wrong since there are 4 possible parents. Fix the mux field
width.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/nuvoton/clk-ma35d1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index a5a36f88d973..97a90cdb48c7 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -424,13 +424,13 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 	hws[EMAC1_GATE] = ma35d1_clk_gate(dev, "emac1_gate", "epll_div2",
 					  clk_base + REG_CLK_SYSCLK0, 28);
 
-	hws[CCAP0_MUX] = ma35d1_clk_mux(dev, "ccap0_mux", clk_base + REG_CLK_CLKSEL0, 12, 1, hws,
+	hws[CCAP0_MUX] = ma35d1_clk_mux(dev, "ccap0_mux", clk_base + REG_CLK_CLKSEL0, 12, 2, hws,
 					ccap_parent_idx, ARRAY_SIZE(ccap_parent_idx));
 	hws[CCAP0_DIV] = ma35d1_clk_divider(dev, "ccap0_div", "ccap0_mux",
 					    clk_base + REG_CLK_CLKDIV1, 8, 4);
 	hws[CCAP0_GATE] = ma35d1_clk_gate(dev, "ccap0_gate", "ccap0_div",
 					  clk_base + REG_CLK_SYSCLK0, 29);
-	hws[CCAP1_MUX] = ma35d1_clk_mux(dev, "ccap1_mux", clk_base + REG_CLK_CLKSEL0, 14, 1, hws,
+	hws[CCAP1_MUX] = ma35d1_clk_mux(dev, "ccap1_mux", clk_base + REG_CLK_CLKSEL0, 14, 2, hws,
 					ccap_parent_idx, ARRAY_SIZE(ccap_parent_idx));
 	hws[CCAP1_DIV] = ma35d1_clk_divider(dev, "ccap1_div", "ccap1_mux",
 					    clk_base + REG_CLK_CLKDIV1,

-- 
2.56.0

