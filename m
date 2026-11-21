Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795222111;
	b=uvjOBO7zGLArmt98f8qgeFeY06uZ6m9n2EgYA4JuYB0L2yuNO63GO86Mh4h50CE8XTsh
	 2wuP/cMssob7Q0zwOwb3mZxW2CvLICBPWUUtUrdEP7k81pLwkuaCdLNwmkdriNRnBcQFT
	 75ahlkZczqT5/f3zHiQd9mu0LNIDDfqbOssbHm1RfUlFYninYC2UapzZJfW2wl8xT308I
	 CCA6fbwAqp79F9QGZ24DlDOVYcHfkgeNtc1A4Lu0jlgJTPLBtUz+1FTPk26bI+V1hAVdq
	 m+kdK7IqYudNvm7CtqlbPec8CjlixfpFtCkC7VCBxWlJCL0qsmrDpU6NiKyKPnPGNtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=b9PJJIu4bQ9HMFN1+jSlbTCxBQdsJOfTqw5Ep5NdiLI=;
	b=wCRE3h96lp/16beZeaiXCwaS6NIik8FMwVdOBF2Da//xXAZqR7Vv00cdPRJkR2GayZaI
	 N9L+RNGu53WPvDJUI6rI/2+iFjs78wi1MvMNJOkoVh53BplDQL9R1lWUBb/VkpOenKUcz
	 tayFyJ7vLHiFNHDX0hXqNt/kTCG2F16jBRFTuHpYBRpto6N99YvaBNvkpgNLRXmf0sz/K
	 sjNOH3gOABJDrrEsbdTxQVEYrLPlDiHEOBKR8wfN70Q6cuO/pafHILrCdn3DzHyTQ973N
	 ydCjjrRF4LhPoP4PjWf1sa/cIR+plaJKTktCdjYbOkbg7s3gzcn+nksMU6gpb8/xbXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lk0IXWCF;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D282C606A33F
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D282C606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lk0IXWCF
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a3c08d6928so2026801c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795222096; x=1795826896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b9PJJIu4bQ9HMFN1+jSlbTCxBQdsJOfTqw5Ep5NdiLI=;
        b=Lk0IXWCFbmm14RCo3EdmECAtEr9YUVkbpnKYl9EZuVqfVRUi65y5MTw5hC2wEDsJZD
         zhZDsBwKRnrG3x/Pi/9adUQv6qpBh3lYOOjdWgoLnTZ8MHY0QrIrg4aZzGnt8xaH5A4x
         OuGdVkTvpTOOjfnIKTecsBUKuDOE7cHSxH8pl20uGjH6rigRDId5KN0WiONJqUDefzPX
         9gWKRlsVXUfp9wdMgmZBswv6kmiyy0CuwLe/XRoek5o71ivv3gxfo0VP+KODO4TcsEaf
         QdV7MIpfUI2ZGUQG5z0HmyFXDS5Qs1nA30tiivwe46ZQU6x1ri+hVx7GsPYVmKGouNWo
         sEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795222096; x=1795826896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b9PJJIu4bQ9HMFN1+jSlbTCxBQdsJOfTqw5Ep5NdiLI=;
        b=bkubAf2qJToV5r8T2wW2lFPUvOox8f1vuAMZKqzl1nndGEX7WWVVYeGd6VXP7gUYHy
         bQlzAfn/Le2eaFXDmt8KFnn7mSZf4TMrsTgesKkOSywPS+tAY3ubMMczsZuBAB4yPq1p
         sDFeOdnGrzkC3Udk4P85lw1WDemyZWkDVIdeqlfstRiQfbdX57w+pf5q5xzYYk8H0roQ
         3+4UYHCarxlhSeQ1/IQ7q/84m/9x/BXub3mYHe6pFeuS4vTGqYMwZusmS1Zhh6VrOC7f
         X3EX7ZBmVa5YG+hbOCJwDys91JgTkLZydP5CxlpcK66j4iWRjckCn7fJON0CnDMNiUxB
         Q+ww==
X-Forwarded-Encrypted: i=1; AL+hErE2UzV9EjL4Ih2bOGbqC0hjXowbfEqIaatk0yNWVZD3IsFwIFsuiwoy/4h71rufaUgtcLjnxTvJB8AjX4M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HFFkJUNjGzH1+BFzfhgUSDM9Uv/g0UK87Pab3lPsHEWohmdRK
	3djGH1lKmvvwXpbhPPy6Tw4t3zk9EO11DKQygREvhYePscqXwWYcr/HP
X-Gm-Gg: AYBFou21Y4Tzhmu7n8Z020UhSL5tpb2zzmNv3SbsxH+CQ2JhsWfE8TsAQBCTio5FvX8
	f2n/JR8LNCngj7+7BMezxgRPy7+r+6FAbIMhyq6GPyJWA/o6KWS6kb8HL+LmkABCFQE9hjZzUtU
	tb7l8vv7aQzoz17KoIhME2iMgkSefdaoTu7x5SFbk/h2TuQARXassmAc0EDIsImmVPhywmzueVE
	sRalqql1JmlGkvsytP9gYo/25Ta9mOqlVF3Ha28Wz8cjEIyZcRfb9hHCMsBzXfx/BK36+r2UCuV
	2mA+gqNbL58TMvJM06rzE0Ys3rp6JT6wQP16bOQLSlhj5dDzv7YYZ7lKT3MsPbQaAR+1GxRWy2H
	6jDPMqLF2sQPDqw6AdYtB1grCGpqwaN5g/u5EDbkyJEmSG8hI0iKYXz1d1IueLnYA9lv9FY0BdP
	0D1VUa7woO8cWbi4r9HqWJXxxYM+W88Geuu0GEyTRYLPt5KaWOZ1C34q6wSHw85MngMeD0VC1n1
	AwLHvPiOea2ADtABY2qh13GhvU+5htiHEIxnYS2MNPnzkHq1criHFjq21CHzyAajztK/w6JbsvG
	yaOf3NS3DJ904S4xA1qjhrpxTembdQ==
X-Received: by 2002:a05:7022:1e0c:b0:1b2:5884:a020 with SMTP id a92af1059eb24-1b5568700c2mr3779611c88.6.1795222095951;
        Fri, 20 Nov 2026 16:48:15 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm11462472c88.13.2026.11.20.16.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:48:14 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jijie Shao <shaojijie@huawei.com>,
	Simon Horman <horms@kernel.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	David Yang <mmyangfl@gmail.com>,
	Herbert Valerio Riedel <hvr@gnu.org>,
	Danny Kukawka <danny.kukawka@bisect.de>,
	Mugunthan V N <mugunthanvnm@ti.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH net v4 03/10] net: au1000: disconnect the PHY before freeing the MDIO bus
Date: Fri, 20 Nov 2026 16:48:02 -0800
Message-ID: <20261121004809.1690280-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121004809.1690280-1-f.fainelli@gmail.com>
References: <20261121004809.1690280-1-f.fainelli@gmail.com>
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

Balance phy_connect() on probe failure and removal. Otherwise device
and module references taken during PHY attachment leak, and the PHY
retains an attached_dev pointer to the freed netdev. The attachment path
uses PHY polling, so there is no PHY interrupt to release. Disconnect
before unregistering the bus while its MDIO callbacks and MAC registers
remain usable.

PHY teardown can re-enable the MAC for MDIO even if the interface was
never opened. Reset the MAC after PHY and MDIO bus teardown, before
releasing descriptors and register mappings. Skip MAC control accesses
when mac_enabled is clear, since stopping an already clock-gated MAC
hangs MTX-1. This guard also covers the existing probe failure path:
au1000_probe() resets and gates the MAC before register_netdev(), and
registration failure reaches another reset in err_out. If no intervening
MDIO access has re-enabled the MAC, that second reset must not touch its
control register. Always clear the DMA descriptor control bits and TX
state.

Fixes: 0638dec01e89 ("[PATCH] net: au1000_eth: PHY framework conversion")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index 58bc8e1b539d..7063f9e5bc7c 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -584,14 +584,17 @@ static void au1000_reset_mac_unlocked(struct net_device *dev)
 	struct au1000_private *const aup = netdev_priv(dev);
 	int i;
 
-	au1000_hard_stop(dev);
+	if (aup->mac_enabled) {
+		au1000_hard_stop(dev);
 
-	writel(MAC_EN_CLOCK_ENABLE, aup->enable);
-	wmb(); /* drain writebuffer */
-	mdelay(2);
-	writel(0, aup->enable);
-	wmb(); /* drain writebuffer */
-	mdelay(2);
+		writel(MAC_EN_CLOCK_ENABLE, aup->enable);
+		wmb(); /* drain writebuffer */
+		mdelay(2);
+		writel(0, aup->enable);
+		wmb(); /* drain writebuffer */
+		mdelay(2);
+		aup->mac_enabled = 0;
+	}
 
 	aup->tx_full = 0;
 	for (i = 0; i < NUM_RX_DMA; i++) {
@@ -603,8 +606,6 @@ static void au1000_reset_mac_unlocked(struct net_device *dev)
 		aup->tx_dma_ring[i]->buff_stat &= ~0xf;
 	}
 
-	aup->mac_enabled = 0;
-
 }
 
 static void au1000_reset_mac(struct net_device *dev)
@@ -1287,6 +1288,8 @@ static int au1000_probe(struct platform_device *pdev)
 	return 0;
 
 err_out:
+	if (dev->phydev)
+		phy_disconnect(dev->phydev);
 	if (aup->mii_bus)
 		mdiobus_unregister(aup->mii_bus);
 
@@ -1334,9 +1337,14 @@ static void au1000_remove(struct platform_device *pdev)
 	struct resource *base, *macen;
 
 	unregister_netdev(dev);
+	if (dev->phydev)
+		phy_disconnect(dev->phydev);
 	mdiobus_unregister(aup->mii_bus);
 	mdiobus_free(aup->mii_bus);
 
+	/* PHY teardown may have re-enabled the MAC for MDIO accesses. */
+	au1000_reset_mac(dev);
+
 	for (i = 0; i < NUM_RX_DMA; i++)
 		if (aup->rx_db_inuse[i])
 			au1000_ReleaseDB(aup, aup->rx_db_inuse[i]);
-- 
2.53.0

