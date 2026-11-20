Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194387;
	b=w2fQW7EfEYrLDNkhbcEvB/exuYlptUaHj6Un/9dCLytCezEs3y04pseYvmUj+fNyzDaK
	 QNIsOY5qDM+YmgvMGyEk5omUtN1rF9Z2yXeNwK4IvsOUxtd0zzJI6u9RGHiRNOshSSCWl
	 cb0PUxLyNgzWoXsPk/mkiwpEKJsmTscHBey3/PAt3Duzj8sEliS+iMExKlTe0QwZbQnTQ
	 Xj3/0mXO2B++kKI7g+0Wvt+M+c5yR/2qJu34F4/4V6JsC89BeLOllbj+tCWOte1X5cMWc
	 DEdxDEbzH+0v9N4QdG/WwFnfQPb+/6xw2Hgrfo/tZZKJ1OI3wgy/ytb4g1cfE0KGcyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194387;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=4vwM6XqztWNYMY+TBr9EYBnPNku0R2arptlP206EJkw=;
	b=z3k1lyDKBV8PQnDvyBQNC1p9nTwHApCkpbyBjLfOl9Lo9e0LZii220dDSbGlFjnGXsto
	 Kx302xCdf3dB5J1G2NYwNR8iir1jAJ+kxOwRTZro2QfrFBG0ESDt1kghyOBTY7DwN8Qla
	 Ew7pY3ggn4NFNk3JXbB7BvoHXv6F/qLLAwQJDP3qzaODq0ox041x1XisQCJOb+s9mJNhf
	 iIbY+nqSI4Fls6SSAH5wFDGNJ6J3G/mh3qNPNReLrx+UJjBH+YPNuHsCbgl0DIQC3E96n
	 Jdy2cD9rCC2tYOS6cJU3WmFwaxBZ2yD/aFjlxHLqkj9zWCQiF0T+SW6EoLscTMJIZBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cDg66DH9;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF5C60A261E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FF5C60A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cDg66DH9
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3D3D84E4168F;
	Fri, 20 Nov 2026 17:06:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 14079601B9;
	Fri, 20 Nov 2026 17:06:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 63F2711BC04A2;
	Fri, 20 Nov 2026 18:06:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795194382; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4vwM6XqztWNYMY+TBr9EYBnPNku0R2arptlP206EJkw=;
	b=cDg66DH9raiF/U5GW8c+GNWuNh3ZMFjrqgQyUbvZ5fcH2tejwKFVNOXjW2cU5Nbc2hCdAh
	DfebcL1KWJdSqB2WashWR3mNDaQtWLfMFkWJI7ztDRuKXegUpR5ycNMHJ7g52H132rz6pQ
	0D9/Db3Mny03g8dvHhLzSq7O7Atgg7ljQgekenn4XgDPsoIQ6XfXGioiQt7S43c3sxL456
	qF2wkpSqKrbaWSbiedvEuuc5ut4J1q3phPkJukVIC0I5w99dbOTXwfjaN29oBsI3jXewzh
	ijmsZWciqqrJqEwhwgLbj+ZC2ZjzKRpyayA1fgjJisKnMLInG5hKeQvA0JxXcw==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Fri, 20 Nov 2026 18:05:43 +0100
Subject: [PATCH net-next v3 4/4] net: phy: marvell: add RGMII-to-Copper
 mode configuration
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
Message-Id: <20261120-marvell-phy-rgmii-v3-4-c11c99798931@bootlin.com>
References: <20261120-marvell-phy-rgmii-v3-0-c11c99798931@bootlin.com>
In-Reply-To: <20261120-marvell-phy-rgmii-v3-0-c11c99798931@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 "Paul Louvel (Schneider Electric)" <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795194355; l=1133;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=PqScS2uAOJlc5NVDrqh78eZ6vHBQpdHGo8mxnFn5vcU=;
 b=G9T3378ygOD2Z3x3xElfHgjxd55vOw38eao8YnpAd+VCTR4ypgeKp8hquw+dQShyEiE61C8Bo
 JLdFIAMe/HcB35ElJd3YVb/w0swHgwEsgz6jp1Q8RKK6T37dOhAdo2f
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

The driver currently programs the mode only for SGMII-to-Copper, based
on the PHY interface mode.

Some MACs connect to the PHY via RGMII. Add code in
m88e1510_config_init() to configure the device.

Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/marvell.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index a72d307eaf12..423d146426ff 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -1403,9 +1403,11 @@ static int m88e1510_config_init(struct phy_device *phydev)
 	if (err < 0)
 		return err;
 
-	/* SGMII-to-Copper mode initialization */
+	/* RGMII/SGMII-to-Copper mode initialization */
 	if (phydev->interface == PHY_INTERFACE_MODE_SGMII)
 		err = m88e1510_config_mode(phydev, MII_88E1510_GEN_CTRL_REG_1_MODE_SGMII);
+	else if (phy_interface_is_rgmii(phydev))
+		err = m88e1510_config_mode(phydev, MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII);
 	if (err < 0)
 		return err;
 

-- 
2.56.1

