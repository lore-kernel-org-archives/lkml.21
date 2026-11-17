Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939977;
	b=SzGztSKoNGVDc+Sy6G+KS3N8rJBeT7yyvJ0s6/UOHMfhn6/3l4qTRiJyQxnZXeom83zN
	 1gRvdR2FViWVLgu1VPTGvIsb1Oz0wqyZU4GimR/s8ABiDCjypWrZ8SA4wInSVFt0K30fL
	 C22Qo4e6LkHidi8fgiVs4l1kGkUAxqnwEMqElCXS7Ho0yS/G8aiTHTs619f4rYJBcgt29
	 Or8QkRq1q8l3YgG+kP9iLhBSyX7UUwTzAUcskVYRf8dldN+8ajeRYm/algd2oNyEPimQ7
	 TNy2lh8l3OuubIGxcvPbXHKnHsEkYNpmHF+cpTty7k5YZHnbDsiwvfMIjITvGdNn5/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ul8avXQobHMQCgtgHYaeZ3hLQKdlpeIZoIBnaJtF8Qg=;
	b=BgKaMXXHBl3ueUv5HRd6taL80tv5RRDgqWiMDWP772N2mgOtOUvd0dekNSbS6lhR3L6j
	 BuGRRuAiiHVWsfAf1d0JJ6ho6xYAHgxzvxfjO+E3VaJ+pGAdBot3ck0a2XbIn6NC3msm6
	 rQ9SPLnP08zX6dBIV51lrRrmmAb8a/9HHhB5Ke3FRxB+epAFyQM9l9n2inv3w6kUU4mjg
	 tdJJmW9E4YQkjiG4rz77u1C/DHR++Ke5+rcBbn++bqiAjXX+wWyFj4ZJzO50e3pDi9WY0
	 Y2TPcCCelv9p60qFXi/dZrdzlm/uytShTj+SnQRFqqKjiZ3YcVZaRQAIZipxw3inAOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AdFNjqyC;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446CB606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 446CB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AdFNjqyC
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36d73027aedso36909eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939976; x=1795544776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ul8avXQobHMQCgtgHYaeZ3hLQKdlpeIZoIBnaJtF8Qg=;
        b=AdFNjqyCThVdzees9+8ELX2UN7gZFx/WwLfYt0iXhQe+cXq8QeN/mULX8SM6CLzfZ1
         6I8DyV5goFqZiPhc0VYqP2OA8td6xK4R+3a/U4n+M3HAF4FhOeR881smLcNQbUOYp4ep
         n2YLiSVoJcap5RVfcz9KI1JoDCsrBxwe/H7rhXcVvPLLEj5lRyyWuxkD9L8JFtFyvjFJ
         1XfHd2uwnX28Y+TA5PqEURm42ayTMnI6sFFG6MRqrr4t3FYj+a0B2/wPNsz1/NMBBSwt
         eSl65BfDw76YK0mQF9z7eku29ZWdyD/6Hdy6KuiRBjFQrHnGpoXtEO51HthOgGtY2Umx
         C0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939976; x=1795544776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ul8avXQobHMQCgtgHYaeZ3hLQKdlpeIZoIBnaJtF8Qg=;
        b=Ft28xBMdTB4ZZNdjWafPa6OfToBGuIY6oFpanHm12cMGOEE2fBE8qXWd/82nVOAltg
         G/tH3ilh9Lluw+wonwp+0FYCwbsFYb7ZTxsBOOkqCTGoPM10yGk63xShaUOEi/g42AAH
         vBA+u2wLoD0NPF3amIj0xFJKsAfpazz52waLN7vLZQQ2/kB475diwD89a/ejEy1DcliA
         SvIU64TTuN0brwhXxwog5XhxpowQtJbyB83xyTjKFVdnHBW6HncIbHCk7lbWQdCE0gj6
         R6YOMlv8ACJSunlOBg+iMAAGQkUXDLdTxpHjHXGpdtQWOtv+b2EYQwBLuC0Fujh4Uvv8
         4ooQ==
X-Forwarded-Encrypted: i=1; AL+hErHTRrI2AXBkhMBQdqmXE3B8MqB/0UuxmSxu+l3bXfkhe5ykYe7dm9YSwr3J0TKmEa2oK+YwCcphbpo3uXs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CQqERAGI+mtbBSqDFeuQC7CpBqAJzvKf0+bfkb2Pk+l+eCncN
	5BmNfmNnHvsYPsRvrphNbrmyEW06Ay4IgzUItIOf+LOen5cMQaGEgKCt
X-Gm-Gg: AZFdTZdU9XjVIrOVm1t6QCDDBHykioE7q0Kl6BfPThZEmSKHriki3hSjKpb4Y21onDO
	v5289YZoK6ccNfSxDLf8CVwRI0xgpf3z2fwSCGuWGWeq9FlvlcZgPEnhPh8z1Big2p7o/OSi6FD
	RjYW7pzHpUYp6qdo17HJOTivVOOOLSeEaid/opnYsstKqR9F8TcRqlaHltFD5pHNYQHvZFtikt/
	suAZm6Vwx4VqtsgGW5DZbM53ZLvMVlf49uMkdddg6eMbsOUi3dXvM/UBiUXeB7f21fRPilVQ+B4
	afYRaPu1bD1nrHtromBZ2nQF0n/w+i786CEHIA+L++uC8C47b83tnzsY9Xma1Atj3x/qqXnN/em
	uC3l5f0EL/KYlFELDv1Rd0DFR1WwWJrDSFrQAFd/zDrAqYZ0HtQB58pluxBP1peA8nsQZ4R827X
	Ax+V+w8oVZEOHSxRxqNZkmLojoonjF1xW2Fi4qF785Dz6rT6Tkg5rZYBgf2e3PUuuI1Gdv++LzD
	zI+N0zTUOtxsp50+5U42cJIuL6uH/dLPVLlMwzDE3cevHfDlK6Ap2QLuPsQpF26cHMlLmvLLypw
	YpFl8H2ebSN//d/dlhkwGi4O3DqWSPMs0r0ZsscLJ00a0E0ulrmkbvCRD2g=
X-Received: by 2002:a05:7300:4307:b0:376:c352:2fcb with SMTP id 5a478bee46e88-38281020584mr279305eec.9.1794939976302;
        Tue, 17 Nov 2026 10:26:16 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d73dsm45641488eec.2.2026.11.17.10.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:26:15 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiko Stuebner <heiko@sntech.de>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net-next] net: stmmac: dwmac-rk: split gmac_clk_enable into enable/disable
Date: Wed, 18 Nov 2026 02:25:03 +0800
Message-ID: <20261117182502.3045841-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
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

As the great Linus Torvalds once said in
Documentation/process/coding-style.rst:

  "If you need more than 3 levels of indentation, you're screwed anyway,
   and should fix your program."

The gmac_clk_enable() function previously used a 'bool enable' parameter
to handle both clock enabling and disabling. This resulted in deeply
nested if/else blocks, which made the error handling and rollback paths
cumbersome and prone to bugs.

This complexity has led to bugs, such as the bulk clock leak fixed by
commit 8db67bb6a1ff ("net: ethernet: stmmac: dwmac-rk: fix bulk clock leak when the PHY clock fails").

Split the function into two distinct helpers: gmac_clk_enable() and
gmac_clk_disable(). This flattens the code, removes the boolean flag,
makes the caller's intent much clearer, and simplifies the error
unwinding logic.

Additionally, this refactoring aids compiler inlining and CPU branch
prediction (trust me). The reason is simple: no branch, no prediction.
While the compiler might optimize it, there's no guarantee it will :P

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 67 ++++++++++---------
 1 file changed, 36 insertions(+), 31 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index a37df5767d84..78bc8c71ad10 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1178,43 +1178,48 @@ static int rk_gmac_clk_init(struct plat_stmmacenet_data *plat)
 	return 0;
 }
 
-static int gmac_clk_enable(struct rk_priv_data *bsp_priv, bool enable)
+static int gmac_clk_enable(struct rk_priv_data *bsp_priv)
 {
 	int ret;
 
-	if (enable) {
-		if (!bsp_priv->clk_enabled) {
-			ret = clk_bulk_prepare_enable(bsp_priv->num_clks,
-						      bsp_priv->clks);
-			if (ret)
-				return ret;
-
-			ret = clk_prepare_enable(bsp_priv->clk_phy);
-			if (ret) {
-				clk_bulk_disable_unprepare(bsp_priv->num_clks,
-							   bsp_priv->clks);
-				return ret;
-			}
+	if (bsp_priv->clk_enabled)
+		return 0;
 
-			rk_configure_io_clksel(bsp_priv);
-			rk_ungate_rmii_clock(bsp_priv);
+	ret = clk_bulk_prepare_enable(bsp_priv->num_clks,
+				      bsp_priv->clks);
+	if (ret)
+		return ret;
 
-			mdelay(5);
-			bsp_priv->clk_enabled = true;
-		}
-	} else {
-		if (bsp_priv->clk_enabled) {
-			rk_gate_rmii_clock(bsp_priv);
+	ret = clk_prepare_enable(bsp_priv->clk_phy);
+	if (ret)
+		goto err_clk_phy;
 
-			clk_bulk_disable_unprepare(bsp_priv->num_clks,
-						   bsp_priv->clks);
-			clk_disable_unprepare(bsp_priv->clk_phy);
+	rk_configure_io_clksel(bsp_priv);
+	rk_ungate_rmii_clock(bsp_priv);
 
-			bsp_priv->clk_enabled = false;
-		}
-	}
+	mdelay(5);
+	bsp_priv->clk_enabled = true;
 
 	return 0;
+
+err_clk_phy:
+	clk_bulk_disable_unprepare(bsp_priv->num_clks,
+				   bsp_priv->clks);
+	return ret;
+}
+
+static void gmac_clk_disable(struct rk_priv_data *bsp_priv)
+{
+	if (!bsp_priv->clk_enabled)
+		return;
+
+	rk_gate_rmii_clock(bsp_priv);
+
+	clk_bulk_disable_unprepare(bsp_priv->num_clks,
+				   bsp_priv->clks);
+	clk_disable_unprepare(bsp_priv->clk_phy);
+
+	bsp_priv->clk_enabled = false;
 }
 
 static int rk_phy_powerup(struct rk_priv_data *bsp_priv)
@@ -1453,7 +1458,7 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
 	if (ret)
 		return ret;
 
-	ret = gmac_clk_enable(bsp_priv, true);
+	ret = gmac_clk_enable(bsp_priv);
 	if (ret)
 		return ret;
 
@@ -1544,7 +1549,7 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
 	return 0;
 
 clk_disable:
-	gmac_clk_enable(bsp_priv, false);
+	gmac_clk_disable(bsp_priv);
 	return ret;
 }
 
@@ -1556,7 +1561,7 @@ static void rk_gmac_powerdown(struct rk_priv_data *gmac)
 	pm_runtime_put_sync(gmac->dev);
 
 	rk_phy_powerdown(gmac);
-	gmac_clk_enable(gmac, false);
+	gmac_clk_disable(gmac);
 }
 
 static void rk_get_interfaces(struct stmmac_priv *priv, void *bsp_priv,
-- 
2.47.3

