Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795217758;
	b=5tzhp0acdifdiqUrsAzauTl0lHr873p9R7l/O65bpRX4Zqu1LlOrT19dboB4zPRnre5O
	 iwf0M72niPadqKPdG1AM9Tvbr2yVts/LyKKXdF3LUel4xxYTJVtpPVDf4jp130UFP78M9
	 d28YLFUPeq/nMVwneUHaQDPSbk1oN0w2z1IY7PwoHIvzjQnYGgDHTHUK1MkG2yyKGVpUK
	 AkSi+hXtjVFjnisrVDLQfW0JgBaUzbj01/1Lu/+bhdslqhDDHVlk3ajCCdio7ZJsuhDDO
	 EpMNQvND6h6NZTlliOKy6PYT2JT7cqhR022l/BySdxfdCrU4Nh3kp/j9GESYv5dGzug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795217758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vM8WZhbKmN29nQ6mO4DJr0H5CZ8GyUYQkfSPTP5P5Kc=;
	b=4T6+Q0rY552N6Ph1FCc5TmXyl/yewo33JTNpr5XilWikDEyrV5lrTcz6ck2HUC43OxT8
	 G+sNpOqD1txViHv3ScNSdik0NbNnZtyNA8ZVTut81rUJKyt4JBrA6dJ2nXu71qvOtBerI
	 QmsEuR8wNDrRI3jM5Mxo8kf7bRTS1QUrwRhuOEoCjnGu6ti6EvhJU9bPenzkwaPVT/cIF
	 rnbqBk8WARlsR2uxuZOg6rGVwZLTrGkP5dbrYEjzhEAGT3yanbEy+SJIPjt8sUDJFOC2F
	 N1bORSXPGGp+TLpPJZYzF+2UDA0SbVrUwPt62TJU+poScawI18mmwEPr8eQ+mRxJ7oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HfkQXrHz;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F0A60A260A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69F0A60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HfkQXrHz
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so1004250f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795217750; x=1795822550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vM8WZhbKmN29nQ6mO4DJr0H5CZ8GyUYQkfSPTP5P5Kc=;
        b=HfkQXrHzrjOE8TLe9tFLzg2TWy0FtmrnWZfm9roAjo/wtSVKw9PY4clHBwC7XJcy0z
         bwWPqzohcKLPGNz3AQ6QmXPemTGXrdylbNfHad4YyGLWJM5ORw03HxhsHGXohfToV41i
         3uBryz6X8UECS4RiAnOF4I0liXDW6wAFaLo8vCnzzECgY7BwHpObbkIJgpOPff03LGhN
         +B7cmmBY3NA3JY/3NJwvYL1w8UirxVVGH+FxvvSEDLwVz/1CspoUgooOXMdAmt5FF3bM
         xXJmGCGlYKhbxN/+r5YWoooGLC0C2lPFAx5gM907VJyxWFmBTQqn7YQKT+ZtyXqtO+4/
         jpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795217750; x=1795822550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vM8WZhbKmN29nQ6mO4DJr0H5CZ8GyUYQkfSPTP5P5Kc=;
        b=tWNC64E/rbKIFxMF/ZqZOzRztJHTLkC86z0rgYgb/kjqFoS8NmWxJfPXElVvQRNcMD
         tg8jLWOs0EzLq9v32jmFr5ryGv51VqGK4yW39EuJ4JTpATAG1UP/Zo01Go+utCZrlzI5
         wioXqgACdHmA4N0e4dPXis7ZCpfF1zGaVfwIkxubhESFC4SfaMMRM6x4pfD1GNqGRqER
         12Oywj8ebeziJ1Ui961UMSl1WQEhqfo8wWC36NIj+rrM0uXCUoqxfO6flhnuVK6dzDHs
         EwLqHmsR3hHxRRQd4pG7LHoYb5gAQvPmt1BHgxVP4SECz4hi9W60WjOe+rkBpziRc2Yz
         D+/Q==
X-Forwarded-Encrypted: i=1; AL+hErG3SSaHpBpB3W38lyo3UtakrsmsTiM6L3timboeVH6EIMvp9nnRh2K3Q7SNf8C+ljpJ+2DomPWRMlIT1J4=@vger.kernel.org
X-Gm-Message-State: APuU4Z92yHjMTZEy/Sdg/NP04A1XlB4Zdr0NXoFcGxLn0MShokq0fczV
	6Bg55ExElxBi2yiaKxVjEvQd9xS+VWC+iunSB2J3GwVEs4NoNCa4CWJh
X-Gm-Gg: AZFdTZcIvhT4cd4KW91JQW6jnHTDCXpb9Z8ydN1pL4ltexOPFXdrThOTV9zl+IdMx4c
	wJjimVwWvfegNv6a20vXGJxgzYAPSHZJH0hf4SFyGVjXbgaPzuXYCiYAA5hoPomUsnXnA7qjCgQ
	nBYqZ/u1vxTXkPwIP5D2RDa3XwFJfQcrihzBltPMzOalVNYPyyM36Bkcy5GTZJgr2wM5aLz5FDM
	eE5t1lWSBGjNUGtSFgPsb3NktsroLU2tkpyrsKlq4amMx2fInL+DlSN8t4aSdIe8qjNp3OEid9l
	UVGMayPef98xUaRCf6oMXacTXkjqn/xV33LagKrpaIZt1dwYQIymCldhFX3yLHCuHk58Efv9rY5
	Wblcvq4VqVCbmX1ENw9jT2HbDw4Gds8ITrWFOLvCihf59eB5YqGhsPE0LiCRb3WLyRQZH2d6P9x
	btGuGg4SaalXc+LTtKqvHzFpfHOMfXvn9arDIwtp/FWUkvtGS4a75ho3bTj3SrYuXY6sopzT9uT
	n4uqVXyIQK0y5jFXtnFdW7tslQ9u61a9VnP4bZtyUHVoTgrG3zvIVaymXR6D4tE3nr+nOzxHyas
	+Evpfrih5K23CXhh3IJz0nh5plyLdetfc+AzV6AYrbf0KO5UqQ7WZfw1MQb0aZJ61GdasI71enA
	fGJ3+bBGsB/LfYrIEL2SmGMnLEbIUqMcgPKXYQ0Tr1b4UTlurHkHmonJ84lFWSn01RrurZDaEgg
	==
X-Received: by 2002:a05:6000:41d2:b0:48b:1296:52ec with SMTP id ffacd0b85a97d-4abb0c5d65amr9454742f8f.18.1795217750385;
        Fri, 20 Nov 2026 15:35:50 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-95-234-253-103.retail.telecomitalia.it. [95.234.253.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm8672390f8f.53.2026.11.20.15.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:35:49 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v14 2/5] clk: en7523: use devm variant for clk_hw_register and fixed clock
Date: Sat, 21 Nov 2026 00:35:30 +0100
Message-ID: <20261120233535.164885-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261120233535.164885-1-ansuelsmth@gmail.com>
References: <20261120233535.164885-1-ansuelsmth@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm variant for clk_hw_register and clk_hw_register_fixed_rate
to correctly unregister the clocks on probe fails.

This should never happen under normal condition but it's better to
handle these cleanup.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index b38d7b5dc0ac..9e92586f207c 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -651,7 +651,7 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 	if (init.ops->unprepare)
 		init.ops->unprepare(&cg->hw);
 
-	if (clk_hw_register(dev, &cg->hw))
+	if (devm_clk_hw_register(dev, &cg->hw))
 		return NULL;
 
 	return &cg->hw;
@@ -707,7 +707,7 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 		val = readl(base + reg);
 		rate /= en7523_get_div(desc, val);
 
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		hw = devm_clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %ld\n",
 			       desc->name, PTR_ERR(hw));
@@ -769,7 +769,7 @@ static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 		}
 		rate /= en7523_get_div(desc, val);
 
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		hw = devm_clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %ld\n",
 			       desc->name, PTR_ERR(hw));
@@ -1103,7 +1103,7 @@ static void en751221_try_register_clk(struct device *dev, int key,
 	if (WARN_ON_ONCE(key >= EN751221_MAX_CLKS))
 		return;
 
-	hw = clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
+	hw = devm_clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
 	if (IS_ERR(hw))
 		pr_err("Failed to register clk %s: %pe\n", name, hw);
 	else
-- 
2.55.0

