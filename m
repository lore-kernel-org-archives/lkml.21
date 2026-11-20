Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134651;
	b=feqCNgbQL3YdEPZEEaMLJMiZmsOvZqOCm7HrD1cBOGq8BYoAtBgY9tmQKFbQnl7wc/Aj
	 tjQgNXLO9pRLVvHibGe+EM0lS0gMQpt7wxCFtHBIgk8qrwLMjr2ySDD615AKGzSF0go7S
	 IbU4QtPbxsRiVOv0yJMXNbb5MovmS9YCl+pDGktklmM0QlsoL0b7JAlcgKfq9kF0L+1zm
	 IlrIa83UNorByle+S/a52znlPqgUCpn4cHrZQEj29VcJKN4U8/AJrGM3ob/UJCdrpoVww
	 30W/NmfQnzciuqwKfm1doGbXamE0fIlETQqXSAUSjW9T1yXEUq5J6zQriWqFYq+3DQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134651;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=hPlycAUHIGpsb7zDfAw9s4lP79BdcT6PyzBpqKrDoxI=;
	b=XwNiWy0E1lez+5wYKuZjzsvsoNEYBrEL49SYFOiKZcczZzC91+sCozUkUjTu0ErJtiXA
	 u7ovXXO84ruAotNnL7B44pnQXkOJq5aiRIIcFwtSq64HIvUARSkaBguPL+pPG/JC+TYN6
	 Yj+iNxAYZB8SwDs4wJb6PZCuL82/fiqXiSTa87hHOC5llQJEEJyhTGhA/sZbD1KSvakyR
	 oFN/0/xMcxdjuBuzy1flynL1drYEE379UXE0098fZtM70wfQmvsWlCPEePM8q8l2YnDBB
	 F1c0jTRFZ8JlYLa0Zij9eeBmxJLtub/hai+D+IE8KTPhTpXzdNwLPXsP8qPGDzk1Y8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=QV9Knicy;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6355606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6355606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=QV9Knicy
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so333159a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:30:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134650; x=1795739450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hPlycAUHIGpsb7zDfAw9s4lP79BdcT6PyzBpqKrDoxI=;
        b=ftyuzgXn9YPOkRJJ8WAnr0CzhPN0h0tFooy5XTLMer5WYgfrYnNiEvteLIRmlLWW+u
         obTCLVa0K6kC91ZKjhX67avPkQooSTwoxvBVSvg6tXRlgUw/Uae6GKAqLdZ+BHBMtuwp
         uZutl2vIckR2/D1MwW99/hxH9AmqDUSYVcM4yaB3aqgd3IKT37rkl2CCXbb9G+W59GI/
         SkhKmAT4MfUR+XfDoz3VpfstnId1lowBenpsvluc61LTVSaOlIiZ3/DSocDuiEzk6s1l
         B310+j/OXezW+ma5MXcamyUN1AygnNOHjiuSvjZcY8DCHpSgCwwEv9JPtlr2Ht/enGaN
         hfsQ==
X-Forwarded-Encrypted: i=1; AL+hErGdOXJotKBbvvAoMPL1kGw6IbgdKMKdulzuUVs84bxnlazjkHIZnhr19RKPrgojwGnXJCAamK8cOpFAQ7Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RyOmOBwubguSzP90c6ekKzlxvDMVtaa1fO96o4W5++01refzb
	tl1b4nTkoUHf4ohyVksOAzEV0ewyjCwj73LKqjQ6bScJRrMeSNTlgqgwTH/hRRkaBYpJq7zHuaj
	bTdmQKoFTMpI8Tk2iTocmXsiFJ+XZyBDcf7P39EyXGcjqSi+fCLgniyJsvFyxHM0IPHXmNJUeOU
	XpdUpi/jXWu5zkCoJWyiDF9psogBFBUVWK7iagGBdB5eGxwEpLxLHsqTUUEmpF0cnHH+xHy96eH
	hV8CX+hbR3BmmSiwau3GacH
X-Gm-Gg: AZFdTZfpXuVoUqLv9FHHnkn2oU7aEUllbO6XaQ9YPL7CUS/vxEKOnfmgl1jwafMntkc
	A/y2Oa4fcJV3TS81GaXbULQ+igpLV+9C2p9Tu7YHphw6ZjFbiCfh45JnIWkvYV94qTRVre/3joJ
	AaRvE0L9aeWGQX72zimyygXTg6audATe21Zm/zIB0nTR3joli4cvM7oyMDfamLJGJIboQCkyY/G
	+KUgNEN4Zq0nSzIsBX0MzRYE4dOZXAj7FuBC3c1XiDiONCFaYsPLv4f4hSxfsOHROpPr4RoCRkd
	wsKT+TMqmuh85WkfK8MhNerFzTna5Cvgtjj7+UDX83hfq2m878MkTNXzSKROCNrzcBVvLSJNjRk
	Ky15SFqDAMOj1sPYyXWiqXR+MMxvYi7YCbkyFp/P+EBv29NTdPc/tzJpq7lHhnaAq+3FpVhgRXJ
	HfpWOKzZjWnxnahP458RGPfYUyBaE2CxJYMtg4F1UU
X-Received: by 2002:a17:90b:5109:b0:3ac:9c37:942e with SMTP id 98e67ed59e1d1-3b41c953f98mr971057a91.49.1795134650022;
        Thu, 19 Nov 2026 16:30:50 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b4062eb7cdsm1981736a91.8.2026.11.19.16.30.49
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 16:30:50 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed02a00b24so2594835ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795134648; x=1795739448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hPlycAUHIGpsb7zDfAw9s4lP79BdcT6PyzBpqKrDoxI=;
        b=QV9KnicyEfaQj76sJnxi2YQzpcTwpyJUm/TCluleXgKshsJQF0IwK3BSAmPbfOzARD
         hiLltTC4mbV0DUAdqNC3OILem1qR024965aDhT0DQsOnD/+vkXbXIWAXRVnhDqLV2oG2
         GZen+XuXhbgME5F9n/O7cZR/mJhWGtrJ42pY4=
X-Forwarded-Encrypted: i=1; AL+hErH4GEQZKjBWJbeTZ1id5p1qxf9L1Wn61SDXxrsmqDMH/scQHS7FVBM/mvGRrRghjeYhuU66+MkOcuzDFRg=@vger.kernel.org
X-Received: by 2002:a17:90b:4ccb:b0:3ac:adce:60a9 with SMTP id 98e67ed59e1d1-3b41c7b6038mr1046176a91.9.1795134647830;
        Thu, 19 Nov 2026 16:30:47 -0800 (PST)
X-Received: by 2002:a17:90b:4ccb:b0:3ac:adce:60a9 with SMTP id 98e67ed59e1d1-3b41c7b6038mr1046147a91.9.1795134647328;
        Thu, 19 Nov 2026 16:30:47 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm4008003a91.11.2026.11.19.16.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:30:46 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: rosenp@gmail.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] net: bgmac: unregister the fixed PHY on probe failure and removal
Date: Thu, 19 Nov 2026 16:30:44 -0800
Message-ID: <20261120003044.2366432-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

bgmac registers a fixed PHY, either for a chip without a PHY with
bgmac_phy_connect_direct(), or through a fixed-link device tree node with
of_phy_get_and_connect(). The error path of bgmac_enet_probe() and
bgmac_enet_remove() only call phy_disconnect(), and
bgmac_phy_connect_direct() does not release the PHY when connecting to
it fails. The phy_device is leaked, along with one of the limited number of
fixed PHY ids, which can make a later probe fail after repeated rebinds.

Unregister the fixed PHY after disconnecting from it, in the same way
as other drivers do, and when connecting to the PHY fails.

Fixes: c25b23b8a387 ("bgmac: register fixed PHY for ARM BCM470X / BCM5301X chipsets")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/ethernet/broadcom/bgmac.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
index 9ef7307edd41..54092bfacd18 100644
--- a/drivers/net/ethernet/broadcom/bgmac.c
+++ b/drivers/net/ethernet/broadcom/bgmac.c
@@ -15,6 +15,7 @@
 #include <linux/bcm47xx_nvram.h>
 #include <linux/phy.h>
 #include <linux/phy_fixed.h>
+#include <linux/of_mdio.h>
 #include <net/dsa.h>
 #include "bgmac.h"
 
@@ -1475,6 +1476,7 @@ int bgmac_phy_connect_direct(struct bgmac *bgmac)
 				 PHY_INTERFACE_MODE_MII);
 	if (err) {
 		dev_err(bgmac->dev, "Connecting PHY failed\n");
+		fixed_phy_unregister(phy_dev);
 		return err;
 	}
 
@@ -1482,6 +1484,22 @@ int bgmac_phy_connect_direct(struct bgmac *bgmac)
 }
 EXPORT_SYMBOL_GPL(bgmac_phy_connect_direct);
 
+/* Disconnect the PHY and release a fixed PHY registered for the connection. */
+static void bgmac_phy_disconnect(struct bgmac *bgmac)
+{
+	struct device_node *np = bgmac->dev->of_node;
+	struct phy_device *phydev = bgmac->net_dev->phydev;
+
+	if (!phydev)
+		return;
+
+	phy_disconnect(phydev);
+	if (np && of_phy_is_fixed_link(np))
+		of_phy_deregister_fixed_link(np);
+	else if (phy_is_pseudo_fixed_link(phydev))
+		fixed_phy_unregister(phydev);
+}
+
 struct bgmac *bgmac_alloc(struct device *dev)
 {
 	struct net_device *net_dev;
@@ -1575,7 +1593,7 @@ int bgmac_enet_probe(struct bgmac *bgmac)
 	return 0;
 
 err_phy_disconnect:
-	phy_disconnect(net_dev->phydev);
+	bgmac_phy_disconnect(bgmac);
 err_dma_free:
 	bgmac_dma_free(bgmac);
 err_out:
@@ -1587,7 +1605,7 @@ EXPORT_SYMBOL_GPL(bgmac_enet_probe);
 void bgmac_enet_remove(struct bgmac *bgmac)
 {
 	unregister_netdev(bgmac->net_dev);
-	phy_disconnect(bgmac->net_dev->phydev);
+	bgmac_phy_disconnect(bgmac);
 	netif_napi_del(&bgmac->napi);
 	bgmac_dma_free(bgmac);
 }
-- 
2.53.0

