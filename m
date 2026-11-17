Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943958;
	b=dlZGp86PJh3myDoMkUFVGeHYBHGzB8vdRPzGQnBZI5JA8paUZxz7WotXTOG//XXjCJ1l
	 cfnjGGXwmsTRA9Yoo9vy/LZ93dCU76x+7ng/WkDnHsH0yuXuiV02N1KZk4mpOLCMYyuPt
	 jMkCfnRqhVCQSsxslpa6rzoGPXrKzopRkL+ULQBZXAGcPPsuqJXs1/L97YR0K7hN99vEa
	 9lQVYxlTEhANW2KD7dnhtVMCydVtC258Q3Aht/4lfCS8aoJF2uKqc6L9qhW7oIo0Mmync
	 y+AIMzEYnJsa7mj0fOu6a5SlhsO8cxfnKDyaVriCypIvuiDrSiEpQBQv7LoR65BxQwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Cc0UV+LLlNiEGw4tP3U3Ba/rogwmD2lXgIJkdmj3H3M=;
	b=0tSd1o6Jsx+jgXzsG6Cp5S/3nG9KUIX+7u4cLrnTux1Fqo8S41caF5w1ZO6GKp9DuLGo
	 sRFB2mtuy73VbYBzLZ3XZCUuflSQA36ZSHXVKn1U6CWwEWUsNTnXHa0HNn9EDZG0dD6Ko
	 VMN45OD7t/GZB1gwWugjV3/PuOygiWsKubus5Z5EYudlKZAQ0ZxmAqvjuMuCUrHADjsxR
	 uxP2OBUbCNkPCHCj8ZdVMLnKaDLgPieay5p43dTMO20qkh4QLMfYncolRI/Ry4muQvCil
	 jZG1MBXmrnQqkkRjEB7kwMGaRloBhe5li0Q/51Fvlo1ow4SKen5ARxg+z3LHqdmnuSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gyCRTk6o;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9C760A380A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:32:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A9C760A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gyCRTk6o
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3712b6d9843so339043eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794943957; x=1795548757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cc0UV+LLlNiEGw4tP3U3Ba/rogwmD2lXgIJkdmj3H3M=;
        b=gyCRTk6oB6Qz5KPm++QBSK2Kkd3D9lbUeLOHM2/R+cUPe0lCpHY3vtxMl4WANVMw31
         PzIazr54OeKX+CSyzI7Ur9WRxfGnJtsrAny/0p6Q0Jq5Z+mxaE/GJLlmHd+pVY3FOUYW
         RkgRmf7zWvmLH609rwr9FXsbAEG74PyHZ+BgZWp+xmB9T67f0RC9sCe01mVadfd+V9Zz
         n4XFfiitIOdR2DtnmY2rC1905eMjjBfY7v+9YnH/ukWD8MCHkmhextcVhgprbPkaUVLE
         8IImPiii3DZNCY7cXXq1TTbLzyEFX2MogRoQivmwQvXK7WKQVUtupm9DjFN7SSsNI5eC
         C3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943957; x=1795548757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cc0UV+LLlNiEGw4tP3U3Ba/rogwmD2lXgIJkdmj3H3M=;
        b=GmjGtWnQKvGvZnXxqpMZdNXKDi13tJ9aLOqRn64klt4cUtKidXpfqKoqD3x0ZZ7gOS
         W6yyDeIWNbpiIZDbNvlJ8szSLx8XjR0/Y93d1giXIsM0+Zpf7Dd0PRAY65r/9oiCASYW
         JjOYC0S8PNj9b1Uv+fv+6uj7nJinSrWxDjmVjHjhX0/YRvzn93RGCQc0gp1zRkCBnsfi
         3/5kHfvYBBTL2a96Vno3Pv298hR3JnUedFSArnnhDyUfFpU5LBbC4ClktwU1Ql7yuw3l
         MZTd+qbhpiWKkM2TQXNEdiw3emhOTX+MAo+DktmejWKkmXvcHjt+RPD9dM5217KI6S62
         FKXQ==
X-Forwarded-Encrypted: i=1; AL+hErG+T2Hq6W88cPhOCzf9Ea9LGjtSSqYJ9qREaYKFIilkUMPQK3Kcf5u6omrQ/xeWrm/ZgpaX4xmlf+KZN8M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9q2W1qPBahY7/Swe99kmO0IHhBFVRMjDY4k1YF6QCoj42l+MBR
	0/2K2MrFYouXNiZZv3BmVA1TsFrXb+/9gS5/1JsjZ3r3d5oa5UhrjLo5
X-Gm-Gg: AZFdTZfSdZsq328ebnKzxTgqDdcq3hNr379txwst1mXxxL7zxAuKBj5U3oDPESS4hSB
	OjKuolBQA0m9Kc0XsABU4WIPBdAhAahNGv9CxIw92TaJI00QcxxloqiiGvbM4o9t+uEIeQCU/ww
	/vOYKO7j8k7+rYrRPF5C66qSDbFq8KNjlUWpCd3UQ9MwD0tdPlVS9m4dz/CA0jiYQOKpBR7OnU1
	/02jiIp13X+pPOYErs0kuvPA5fIeN0F6DSeRmpBNShBEgd1aQ78rCFV7fpEjeYECgaEe3pYWM3j
	u9Xw4VDQK1apED+CVeTmuDI+rA9gqJssp9F5Uab1Zc2hY4kdIA6RwOmoLpz+SGReqrYb2JvkSvL
	/N0V4kmJ/5sumzGFT5W9R/817r+yhDlDT3gdkgK1Ian+aNPr0eIeezSlC2J00ZVpgxC39+1ZpC0
	CUef/ug1YEvZBER7Z6a25nvhy7SHkhpDg5QhvDJ1KPO/VN08K9n7kP59ng2QqwXNxBvCK+u6mzY
	/0odCm9VCRZTs3B4JIWhXniHQkVY2NSSrfYAfE5WFkhlxyApGJG1wo96bI4plzIkcdz6L5AeKwV
	OlJas8oc
X-Received: by 2002:a05:7301:da8b:b0:36c:f88b:caae with SMTP id 5a478bee46e88-38281022997mr399044eec.22.1794943957446;
        Tue, 17 Nov 2026 11:32:37 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059e3sm173376eec.5.2026.11.17.11.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:32:36 -0800 (PST)
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
Subject: [PATCH net v3 06/10] net: au1000: restore receive filtering before enabling RX
Date: Tue, 17 Nov 2026 11:32:19 -0800
Message-ID: <20261117193223.2795612-7-f.fainelli@gmail.com>
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

MAC initialization overwrites the receive mode, dropping promiscuous and
multicast settings after a watchdog reset without notifying the network
stack. Restore the requested filtering before the control write that
enables RX, avoiding a window with the wrong filter.

Factor receive-mode programming into a helper shared by initialization
and the receive-mode callback. Hold the address-list lock before the
device lock through initialization so the filter snapshot stays current.
Protect callback control-register updates with the device lock as well.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index 805aabc6721b..0e9226ea05e1 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -685,6 +685,8 @@ static const struct ethtool_ops au1000_ethtool_ops = {
 	.set_link_ksettings = phy_ethtool_set_link_ksettings,
 };
 
+static u32 au1000_rx_mode(struct net_device *dev, u32 reg);
+
 /*
  * Initialize the interface.
  *
@@ -706,6 +708,7 @@ static int au1000_init(struct net_device *dev)
 	/* bring the device out of reset */
 	au1000_enable_mac(dev, 1);
 
+	netif_addr_lock_bh(dev);
 	spin_lock_irqsave(&aup->lock, flags);
 
 	writel(0, &aup->mac->control);
@@ -738,11 +741,14 @@ static int au1000_init(struct net_device *dev)
 		control |= MAC_FULL_DUPLEX;
 	}
 
+	control = au1000_rx_mode(dev, control);
+
 	writel(control, &aup->mac->control);
 	writel(0x8100, &aup->mac->vlan1_tag); /* activate vlan support */
 	wmb(); /* drain writebuffer */
 
 	spin_unlock_irqrestore(&aup->lock, flags);
+	netif_addr_unlock_bh(dev);
 	return 0;
 }
 
@@ -1036,13 +1042,12 @@ static void au1000_tx_timeout(struct net_device *dev, unsigned int txqueue)
 	netif_wake_queue(dev);
 }
 
-static void au1000_multicast_list(struct net_device *dev)
+/* Caller holds the address-list lock and aup->lock. */
+static u32 au1000_rx_mode(struct net_device *dev, u32 reg)
 {
 	struct au1000_private *aup = netdev_priv(dev);
-	u32 reg;
 
 	netif_dbg(aup, drv, dev, "%s: flags=%x\n", __func__, dev->flags);
-	reg = readl(&aup->mac->control);
 	if (dev->flags & IFF_PROMISC) {			/* Set promiscuous. */
 		reg |= MAC_PROMISCUOUS;
 	} else if ((dev->flags & IFF_ALLMULTI)  ||
@@ -1063,7 +1068,19 @@ static void au1000_multicast_list(struct net_device *dev)
 		reg &= ~(MAC_PROMISCUOUS | MAC_PASS_ALL_MULTI);
 		reg |= MAC_HASH_MODE;
 	}
+	return reg;
+}
+
+static void au1000_multicast_list(struct net_device *dev)
+{
+	struct au1000_private *aup = netdev_priv(dev);
+	unsigned long flags;
+	u32 reg;
+
+	spin_lock_irqsave(&aup->lock, flags);
+	reg = au1000_rx_mode(dev, readl(&aup->mac->control));
 	writel(reg, &aup->mac->control);
+	spin_unlock_irqrestore(&aup->lock, flags);
 }
 
 static const struct net_device_ops au1000_netdev_ops = {
-- 
2.53.0

