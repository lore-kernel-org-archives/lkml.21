Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014480;
	b=y6ugjwwrZo8rx/mHUWCl85BMO5oWof57+tMd4PYLgDoC6DGrpv7BFwSAglBtsfw/N1Ci
	 uWIpKPokq+njuU9Gn2vUJxggjUOo8QeMjiPoWv5hegTptKNl6RQxjMyW5aElPmGGIQ5I/
	 GqEe29UgQ5zjt5P2E/a5Rigp1zWfqk47z+R3FLAkukH2xzXEN63O6e4Ji8C0N6ortkULJ
	 5CMsChqEwpo2yfI96zA+6mtxv6cCd0EUh2kA1zaAtiapzhNj8t32HkHzXhtSfF3k+U1OT
	 F7dR8Im1Ron80feVyrCGUrTFMTTlz26eaBl69wx2YRpyuI0HJ9+hqAnbdAxBK8c4c9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KOAjgx6Zer7vIvv4MB7qnnpefygiP8K8bu1p1D5WY1s=;
	b=sDSdULiiiG/mTGiXFWOKcQmWBW5fshiHVqy496ux1ZpMoqkz9Z+harR0hp82Gu8pgzP8
	 YpiNwOnBOOEa3ws+tG8vKOFN1pFqcZOIGNWWm9MWVSbwfHaUnBL+kv6YBoihcRlctOy11
	 ActtZ6OTIXfKUYoT0BSw3QmRv0zuhlVAkm2kqM50B9nWAFO0saOeIgbR7cjVeqHg7z9cc
	 srRGoy7xCMbs8s+f7KFdi2R9Og+QfHr8o1ViOWX1yKpHQ5Mab+AunKcKK7E2dufbv1cAg
	 TOsbvt1RUfUMvJRVJGq87pZjW+TdisBScheVGiB2nc2bVJu/IKMA5ibVyosJVIRPaLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="MywSp9/M";
	arc=none smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB23C606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB23C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MywSp9/M
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3acf82fdcdbso11101821fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795014478; x=1795619278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KOAjgx6Zer7vIvv4MB7qnnpefygiP8K8bu1p1D5WY1s=;
        b=MywSp9/Mu/NivggbV4jAQ5W8/LXE0Ed8J53gf4pnkttSPOLxuM78HZzLgCGMwkHe3R
         xgZHV1t/NOhWTH4CSOwf3J2m4bznULlYw1uO3XRaE9ksMH0/bZedatN9G4tjwq0xUAx+
         PpeaTgrCx30rOXCTNiZ/cqDOvc9YhFLLdr8QMQnV5cKwt2qFfMx770cSVahuJJXrUKDi
         QXGXkwljhfBEQHErIYgGky1wxqJzmooYhedu2LR46oCkFPtFsLZLlOYclgtzTt2JDtdy
         JIWR88mo9/znTAjmaevBS3cx6nEBpMsGVE4jWDaqMV9Oec71NhNag5Hs0ej1l9YrrQ4M
         HbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795014478; x=1795619278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KOAjgx6Zer7vIvv4MB7qnnpefygiP8K8bu1p1D5WY1s=;
        b=CqWhnyA6kchAIDkrAbwPg3XNWjnodIHAMzuH+ZxQhy1YO9p1qRPRHyUIJZrucaag5U
         tvcgynqQ5cQl4rAJOkv65+q0kzfWnmRvWexjvoR8ux/32Pca3wWRyCyXlPfUWSOBobao
         il7d8vqkxsO62zcDbKS3w+n4lkAtThb/rQx8iS0Z1sEqbOg7CC/2ulXfFfkDgj/nGuwU
         pMhL5wVRV9FjRib41+8Bu7yFZOWpuVFgg1o3jH88lfkfCFBSBCbqWa5yVuHbQn6NOq3S
         tXqbUnbdCqfbFKUw1wEeX/Mxl13u8qGs6sPnB9Lj9ab0GPj1z7cqgdBBIclskLvVAJZS
         dM4A==
X-Forwarded-Encrypted: i=1; AL+hErEVFwtG41rd/ZqDzGwyG2dZSgfz2N7YzGwDVKuJbVAKbbU9nub0R5wux2JVcb3l4JKsYnTXytkxdYa8RPo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QCLvZ2XY7r/MAb31WL6IVFXc3NBSREQGNm0WY+MOFLl586UwQ
	UKe3t6iITySwXLnG1YEhKlFYLDWNEbvEXnxViu6v8rXHSmlYGLJ/HX5tEDfOJkvz
X-Gm-Gg: AYBFou3qsDdMAEv0UOPeRPxWgtXr2nTP+cfGL8inxWfQwZd35PJDUAWmuCrgC4XAGuO
	6p5nct/jTMGbiEj1feAPxblTBJ0ydvCpxX1TMopBxk6Sn1ER1gmAgCtbqfQaYr6UJT3VZ3ZASMT
	BRNtCuzuyQlkRaCrfmh7ZK0To9UVbQbXC40BqO76ylosJAdw7M5hfbjUax9r2+mghKZz0QdKaS/
	jse2n1Vr1FulxKX0iSMq7vhMGDPdan+r4NKmtp0XVT+rDP+OTyMO9ewA3TK0574IuiA75cgElji
	bdUZjHZGLAUipJCiiqRXSO/m7rw9Zc/6UPCB+xtaNWyScSUcHwy4IzdW3sP41RZmFApboYfrXdI
	4F32PVLr1ia8yRshUrxiJYEhs6tObAkzUy5W0UPh5mTtPj2cGvjxwDJl8n2lS8o1vXkFdZUxF3i
	5dw0VmaOidP7CgWCPjobJMikNhBo9IID+Z0kcs72A/NW0rvhYkCg2hmWyKh9cy9IUW5ouD3BZWg
	brcy5tbt94/EOoASvumyf3kiKr8jGCd3+5WIxd76Qwrv0QcmvXd7kV9HZaaPKmvTz69viu0Z+qq
	T/0B/wAozJjMOEFppgx5nZ90BWxwP0nUtA3Nq1POiQMfILzQOsRRGHlYYJJ0ugCWharRofq6Dv1
	RemGh/TI=
X-Received: by 2002:a05:651c:a18e:b0:3a9:a2fd:5931 with SMTP id 38308e7fff4ca-3ae670b66eamr11800721fa.6.1795014477838;
        Wed, 18 Nov 2026 07:07:57 -0800 (PST)
Received: from DESKTOP-93012OO.tail8ac4f7.ts.net ([83.245.241.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae6eb98beasm420771fa.18.2026.11.18.07.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:07:56 -0800 (PST)
From: Elias Pukari <elias.pukari@gmail.com>
To: netdev@vger.kernel.org
Cc: Elias Pukari <elias.pukari@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3] net: phy: et1011c: don't write an error code to the config register
Date: Wed, 18 Nov 2026 17:07:18 +0200
Message-ID: <20261118150718.16924-1-elias.pukari@gmail.com>
X-Mailer: git-send-email 2.56.1
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

et1011c_read_status() can write a read error to the config register.
Return MDIO errors and cache each PHY's speed only after configuration
succeeds.

LLM helped

Found by code inspection. Tested with MDIO error injection in KUnit
under QEMU/KASAN. No hardware or kselftest run.

Signed-off-by: Elias Pukari <elias.pukari@gmail.com>
---
Full builds unverified due to warnings on the unpatched base.
https://lore.kernel.org/netdev/20261115180735.649299-1-elias.pukari@gmail.com/

 drivers/net/phy/et1011c.c | 37 ++++++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/net/phy/et1011c.c b/drivers/net/phy/et1011c.c
index 6cd8d7758..77a6e8dcf 100644
--- a/drivers/net/phy/et1011c.c
+++ b/drivers/net/phy/et1011c.c
@@ -44,6 +44,12 @@ MODULE_DESCRIPTION("LSI ET1011C PHY driver");
 MODULE_AUTHOR("Chaithrika U S");
 MODULE_LICENSE("GPL");
 
+static int et1011c_probe(struct phy_device *phydev)
+{
+	phydev->priv = devm_kzalloc_obj(&phydev->mdio.dev, int);
+	return phydev->priv ? 0 : -ENOMEM;
+}
+
 static int et1011c_config_aneg(struct phy_device *phydev)
 {
 	int ctl = phy_read(phydev, MII_BMCR);
@@ -60,25 +66,33 @@ static int et1011c_config_aneg(struct phy_device *phydev)
 
 static int et1011c_read_status(struct phy_device *phydev)
 {
-	static int speed;
+	int *configured_speed = phydev->priv;
+	bool was_up = phydev->link;
+	int val;
 	int ret;
-	u32 val;
 
 	ret = genphy_read_status(phydev);
+	if (ret < 0 || !phydev->link) {
+		*configured_speed = SPEED_UNKNOWN;
+		return ret;
+	}
 
-	if (speed != phydev->speed) {
-		speed = phydev->speed;
+	if (!was_up || *configured_speed <= 0 ||
+	    *configured_speed != phydev->speed) {
+		*configured_speed = SPEED_UNKNOWN;
 		val = phy_read(phydev, ET1011C_STATUS_REG);
+		if (val < 0)
+			return val;
+
 		if ((val & ET1011C_SPEED_MASK) ==
 					ET1011C_GIGABIT_SPEED) {
-			val = phy_read(phydev, ET1011C_CONFIG_REG);
-			val &= ~ET1011C_TX_FIFO_MASK;
-			phy_write(phydev, ET1011C_CONFIG_REG, val |
-					  ET1011C_GMII_INTERFACE |
-					  ET1011C_SYS_CLK_EN |
-					  ET1011C_TX_FIFO_DEPTH_16);
-
+			ret = phy_modify(phydev, ET1011C_CONFIG_REG,
+					 ET1011C_TX_FIFO_MASK, ET1011C_GMII_INTERFACE |
+					 ET1011C_SYS_CLK_EN | ET1011C_TX_FIFO_DEPTH_16);
+			if (ret < 0)
+				return ret;
 		}
+		*configured_speed = phydev->speed;
 	}
 	return ret;
 }
@@ -88,6 +102,7 @@ static struct phy_driver et1011c_driver[] = { {
 	.name		= "ET1011C",
 	.phy_id_mask	= 0xfffffff0,
 	/* PHY_GBIT_FEATURES */
+	.probe		= et1011c_probe,
 	.config_aneg	= et1011c_config_aneg,
 	.read_status	= et1011c_read_status,
 } };

base-commit: d6816d9a93b66a12bf01e10037e377f3333ad6cc
