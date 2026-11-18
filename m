Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794965850;
	b=CtYXpjMd9ggccYoxTGWwy0upcXMxwI0GdljFLl8bbg6XSvLjHB0AOUwSfjTRai41/S7M
	 nAyM14qh/3kMIhdB9U1WiFRc6nZhmy5B8Re/al6Io8+9CIaVzdRNkHJtp2RRfDm/pR6Ie
	 vk8+vkkii1fxLt0jpyPbVpz7TUl7a+7GP/2VW0aDf7y74Kd8hsPkvKUhIRLl1q2rIMJEg
	 f1yg2O2J0c/gaLE7+axqi93Ltnb98a5a/WL5VsTSvMpQ1jGUnEvtNp60EYkdx+53Tgrvs
	 gEZB8ANYkj0uD8INlMMMWm7f5JTxZTEhqAmL9vbl0UCu4H14HPgA9RvMyBuuOdkhzPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794965850;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tO0MH60ba1ldrxGt0MxvDdieNmtu9s2ZdUtt/ix1PUE=;
	b=GkPRcnj+4CRwopWmvahNxW3gCFI6Z26BSeka3UYFqg9IceqUDk+77z8vIXKEr7URLuRY
	 9aSKtA//wi0xYnPeTnm0pYJA2kDiXTeXeWF0S0KFk94M2mk7PR6108kK8lbW6hYq++kvN
	 elrlFdp10FYtu2wUM++pZGzI2zSnpj7zeVzhXZLafgCYkKh9FRKRyUeCRgoQL1nmw18lB
	 SC5DH3DrTQuKgHpYlUY2boGXqQYS15zEkvwaWYJs09QDML4fIX4ler/rGWJd/IUTMG522
	 2nuTyZlzq6X0njMVnc+txngiKryoX7WMe20yNEc/Ist/ZPrGvy557eI+I+bMcAZ26OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b="cSrj/jBq";
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875CA606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 875CA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=cSrj/jBq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=cSrj/jBqk0SuDTMhVLLoU3s26qmxRpaisfDbBKfHMOirb0hH2PALyqimSSSgbldrAY7iH86+4oNXX
	 ZT9TUI6i35r5yqnfpHPTilKJHeKP/cclfD0fOnw8uB+5XF9qwSXeunQ0RMfrA1W7rvE8Y5GdlHxZGd
	 dLGCybOD5F+3KlLw=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46afd015573d-adafe;
	Wed, 18 Nov 2026 09:37:25 +0800 (CST)
X-RM-TRANSID:2ee46afd015573d-adafe
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46afd0153bb3-c42db;
	Wed, 18 Nov 2026 09:37:24 +0800 (CST)
X-RM-TRANSID:2ee46afd0153bb3-c42db
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: vkoul@kernel.org
Cc: neil.armstrong@linaro.org,
	mani@kernel.org,
	narmstrong@baylibre.com,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH] phy: amlogic: meson-axg-mipi-dphy: fix clock leak in probe error paths
Date: Wed, 18 Nov 2026 09:37:23 +0800
Message-ID: <20261118013723.232-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

The probe path enables the pclk clock with clk_prepare_enable() but
none of the error paths that follow (reset_control_deassert(),
devm_phy_create(), devm_of_phy_provider_register()) disable it again.
When one of them fails, the prepared and enabled clock is leaked.

Use devm_clk_get_enabled() to get the clock, so the clock is disabled
and its reference released automatically if probe fails after it or
the driver detaches.

Fixes: 76aefb221146 ("phy: amlogic: Add AXG MIPI D-PHY driver")
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---
 drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
index 5e2b7d93b..8a132b0e7 100644
--- a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
+++ b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
@@ -355,7 +355,7 @@ static int phy_meson_axg_mipi_dphy_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->regmap))
 		return PTR_ERR(priv->regmap);
 
-	priv->clk = devm_clk_get(dev, "pclk");
+	priv->clk = devm_clk_get_enabled(dev, "pclk");
 	if (IS_ERR(priv->clk))
 		return PTR_ERR(priv->clk);
 
@@ -367,10 +367,6 @@ static int phy_meson_axg_mipi_dphy_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->analog))
 		return PTR_ERR(priv->analog);
 
-	ret = clk_prepare_enable(priv->clk);
-	if (ret)
-		return ret;
-
 	ret = reset_control_deassert(priv->reset);
 	if (ret)
 		return ret;
-- 
2.50.1.windows.1



