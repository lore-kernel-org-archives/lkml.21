Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943953;
	b=Qg9PfZP2R2NmyZpWtFGkPULIcni4t8plYZKPMulNlnYNpWI5/opw3vxkzxD5ZnBasdiJ
	 MTLjnEicsFT0YH362gGuAJiKbhoSzNVE2yjZ7EzSYt3W0q7na7PA78nPNRVHC791pBdeB
	 fzrV6+1Ya31I1unATZvkMSFM2dzm9Sa0QKp4GAcam1XVGkXZOpcS93aH8qRdtvrCsMRH8
	 yf9PENsjVflz/m/6H1TNZwXNLTKxZSFg0gS5kgnyWphkMDzS7lNfl0z4eywdX5v6E13su
	 i0UUQS4HhetkxCdJRbwHrOadnrfzzzjGvi0PUIPBQ6EC0DXYo0dI4FeS1AOvMfXfKiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YsK4Y+BU4X8VndX/eSmg1WPSyHEdb+T/zxsyGWkS3A4=;
	b=pIPwXguWFh67yhYyho7ihZAYRFmeEzxVwAdNl4SfVf747KIdUL57jrrtSr7LQb7p9ilq
	 ad7eesnxmquq367eRAxiTO1Xvttv+3hLUlQgADgCXHM7a2uzDi23BUovbVYhV0XKNW6a/
	 pYfMUOGcEjObz+ZzZ+DW5Fh7uj9FfBaB4rKZ2awOWUlq7AucNrapD7BO8VSlIYZ8RyqPN
	 7EKLiarKtryE0gyqeomiCO8Pa0vGFzff18qnY7xhG3vm13hO85/k+cH98/tlwWFE4ck2x
	 TzkwI379+7mNro7Int1C0x9uUFH5Phy927KS8GYKDgYYKP3lndHgUUUax+04mLJu/Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aNBSzMwq;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFE8606A8B4
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:32:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FFE8606A8B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aNBSzMwq
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-38133db970bso641814eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794943952; x=1795548752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YsK4Y+BU4X8VndX/eSmg1WPSyHEdb+T/zxsyGWkS3A4=;
        b=aNBSzMwqJvL7RvAsj9+PMFFAHFi8r5eXOc8W2sZ9i+nmUJwzdb+fiMg9wWiFjRt2Pg
         nVEd53x4hO2391X7hU2IJzcw3S25KYPDofkd7DQ1l5zwavmv+bE6MNvsmPR/LT5YRVgl
         XJJet7PNjMaNwH2tkPF0PgHmT3NTGIqoqqsANNdlJFiKM9VobK/MVZZ0SX7vyK4WqhHc
         rfUkp6kn2m+0U8Fl+RbN0Ak41DkqxYfqQH3hmlvlxYBmQ/SkuWYcup66+TeALuQ0tMFR
         fGfM5+RhVrNoRDU/1b8Iy92c2GatmyCGzr25qxivF2lnFSfPupALqgoF+G27y0ZRpfim
         ZH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943952; x=1795548752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YsK4Y+BU4X8VndX/eSmg1WPSyHEdb+T/zxsyGWkS3A4=;
        b=I21M3WFdp6vzTMvA/frbWqYDk3V21uUv5OTjz8+ERQxPA3DHRS6CZx7l47k1iIS3+F
         gYgwPFh5NoL4vrlSkyELz3UcN3FvfWzvG3oMRysm7vHC5mv6j139C39lwc0SWcYUwpT7
         KZnpJc8TQ8TNJgfx7zoXMUwtD59ziKzGxVitPRwgln5QZUEpi12diSXiJv4wt/OjF6hT
         +kVXNGonEjQ0LORKYOeJjQ8l4yGs156ONyK9fZzCEw9zbo73LEgjodB0V3sobBUniO9A
         udoJythRT5pKTba+D79re3GnQc+49kUCdsyWsxEMBZKqcTZXFabxUJ7XiACXIH+/GRUg
         npog==
X-Forwarded-Encrypted: i=1; AL+hErFbRY0Mw4OxbKwb8znuJhDDOL/SsJozwUPhkZJ/zNU4H420GsjtAyjF/+byrR1GQRyUdy/QVRKA4fs0E6Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lwn7lpHSGYYW+unDh7kw4SH0Oe9fwxHYgApJQcTdd1pMI+IFr
	yJQvIu0a2f04aKrozsJLpGGkfamerXTNkoEbCRvRc8oGUq8/j/fPzoke
X-Gm-Gg: AZFdTZfpUPwcXpJD9lnTeqCukr7PXwxjuYDjCZcOWvIkAVTa0UqeXyD0vfP2gJHZJnq
	AdFLdNbWjw2sthn5hiKsmuPoHNCoB7Y/5P4h/c612YHzeTL4IYOAeaf6Kvm0132gbEJ+TSOfzde
	bztraiZ7WqJE15MZQEvBjZFXcyrGE1nbdCCck+7UZCtyG5SSNSlJoxKZ3vUOW3oX7XfyiT5bHa2
	QSvtLGrUBY5XVimMWtjaX7y0g7+WmObDY0Iwnmu+tayQ/b/29flrWBf/9Xk7cFMUagxmoVMxPlb
	prW1dWGMBdefa7Co7DXUQFTfruED3IKQPHNRv9mFkW3gKXzp3KosiIJP4ECgqxKYMsWkSFAl6qG
	DVhFU5B1lxICMFo59l+jca6r42l/ee1VXaAwcR4OPNrV3LAs/QGTkKXv23lpYmKMPHzEuwbP6FD
	sFjg6wuifUfZF2c03QS+E/7iwVhDoJzFCJgS5jKERyohUath5ZIcsNrjrfsrZxXBOa2PkcEC/cc
	m43NJgV3ePxcR489wbW82uAVVMrT2AQwhgnU2AODgVpg/rP7JX/GspsbPwW8uaKytTLzm4XDkYY
	fkXnK48/
X-Received: by 2002:a05:7300:8aa3:b0:378:314:4033 with SMTP id 5a478bee46e88-38281afbf16mr383068eec.32.1794943952170;
        Tue, 17 Nov 2026 11:32:32 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059e3sm173376eec.5.2026.11.17.11.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:32:31 -0800 (PST)
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
Subject: [PATCH net v3 03/10] net: au1000: disconnect the PHY before freeing the MDIO bus
Date: Tue, 17 Nov 2026 11:32:16 -0800
Message-ID: <20261117193223.2795612-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117193223.2795612-1-f.fainelli@gmail.com>
References: <20261117193223.2795612-1-f.fainelli@gmail.com>
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

Balance phy_connect() on probe failure and removal. Otherwise PHY
interrupts, device references and the attachment to the freed netdev
survive teardown. Disconnect before unregistering the bus while its MDIO
callbacks and MAC registers remain usable.

PHY teardown can re-enable the MAC for MDIO even if the interface was
never opened. Reset the MAC after PHY and MDIO bus teardown, before
releasing descriptors and register mappings. Skip MAC control accesses
when mac_enabled is clear, since stopping an already clock-gated MAC
hangs MTX-1. Always clear the DMA descriptor control bits and TX state.

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

