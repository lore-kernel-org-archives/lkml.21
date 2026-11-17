Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943955;
	b=OD/fS6g/CAqjMzKZey+M17FMzZQCQ7eZqRVByLvi1K8v354Jwt09hTJsGAYZbJwjqz48
	 A+Bc6xKFLdTszzFUEXROGjXaEpvpbyCJqm5VmRW/rnE65rAKKh1qHmuxvu5Dh9fap24M5
	 gWOVGmpaPU7fnXyB6ffU84zkDegSwNEsy/BhJGYGx7KiRv2LOCBczggW81wObk/sYAPMj
	 9tWMkmhf2fE+7+aFijfK5uoScAtehvyIUPHUYVtAZHGZr6nWUd+IV51telxuRrjQp9ddG
	 VO/NAL+v0pnqodr+7uGrShSuSgVHnTjx8oHAQTiusYIeO9b63xPQVmqOBFEftm9H6uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QRb7JywDaOBMPCH2tWj2QCwMr3VPEjBdd/ccyMn80sc=;
	b=BHFW1opdMDTMrW5bP/1tIOQ64Y2BR7AglmNx3ZD+lJRczqAH+7vkKxnuJT6JGJu1IE++
	 4JkNIb7xlW/ruc+884ZcdNoE024ulR70SCqcBgjfqhwHcsMAEZrBy0Yxh9sbA7Pobw7xy
	 OPDukKhMco/T2XwoJNlxshKVueBSy2q1Coz/Lq6casIcaCLedaCdfY+lR7g+TBRasehyp
	 ATNqgk1p/X7ouJlJVFViMM+I9LEmurpwey53hZkWgVTNjBSsMrbR2iyuFuuF+z/wDfXtG
	 CDghAwzHmSw13LiiDv2MqEaofMGPfE5u2ZqI2fy/ESfBTcvwuHV619tVRYCapV26jgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E0k8dyV9;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1BF606A89E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF1BF606A89E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E0k8dyV9
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so324417c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794943954; x=1795548754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QRb7JywDaOBMPCH2tWj2QCwMr3VPEjBdd/ccyMn80sc=;
        b=E0k8dyV9EW/OAdU3DOJRo8EKjc1kVidZQjzanX0ozQRgWHftHd4k+vjxEvxt7/TMdy
         CcLD3BH3WgOkSJuFjpTOYPBw+C20B6lsIHc6z1yKY3MHhzYH06+RYI8TwW/awHs/5xr+
         iXppTGmsEAxny8An4TWQxV3X9AekLZ4YnPCpEz0nnPAKphadqSUgbCPDqRCtNWM9v4P2
         xdCm0P41xBF8VEyMJJeVa6z6UB0EEv2yW3d+9XTgHN2UROgjIquvRylffsFAavjm5Fms
         EiGe749qMzCdl46DS26XR0ODm79og8HIBtP3qQz6YUBcAmvEU+6Iiw528tW5z+idCCS2
         YH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943954; x=1795548754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QRb7JywDaOBMPCH2tWj2QCwMr3VPEjBdd/ccyMn80sc=;
        b=YKCFEPYaX8QTuQO0HKSDzyzdZV+2n7ecDL1K38xx5J59DlSXufZBmHPisZTwdZmJHK
         o0HbIlkfkvFY4pjNgO32VYLfrzcc2oqP9yr7bR+ScP/1M4gaUKN7bAaJDZj7gIF955c3
         5cUTf6xAIE/g9Ks9oIQXNPzFC3oAPbQVrQthcwWx5ISsY5X0ZO9N/KGt/GiIfHJl2toc
         P5vxhmdedBTSTJ90WqNWG0tuOAsU382Hh8RXVO1AHYciWozEwFLnrIoS4oLu0x82dvwD
         BgsKPk/mb7TJug3N8kDrTyOanYdYiQaKmLeB283y9AE6iu2zU3ofYARXSf2Q5yYzkpa7
         /QGg==
X-Forwarded-Encrypted: i=1; AL+hErH93XLp84yC2nesRcfo0wxUuxjwV31jhwgcFshcPrkIluhd8gvU+AeRmHarG8kZYKKVxrXiRD/S1fPTPh0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sxTzo1zxRYYOH0qo/Syq3jyujAspK5/Fa3l6i4ljX6eI8kwBS
	B7PnQMjPvs/r1VtPAV1sDKZSWVj+/IK18VRO+Xs69qH9Qay6LEDQFTb5
X-Gm-Gg: AYBFou3Hqwigfj419s5KrMfexMzB1Rk774pdGkfJ4UjqjpmqsJN2GsJLuTI6cepsdvb
	T5d1IkXV4/OgARMaAAPsUtuZTTohPastReORUFHczDbdy1M13c8BjR+ioF6fE63H9B2bsaprtwB
	yvROFntR/axNbiVAOIC4cyCG8X+cn/ynoaYwEkYXws3SWG+ONG+MslucwNdG/Dn6tdjfL9y1g4q
	lnrsAjChm8u5WjbsZGfLnQ4Dd5rcn+st9y4W6P6VozuPAl2FxSBLS6yPIk4ByMLH52i2KMNH2bT
	UghrPEa6e1Xuo71sTCjCwHDIQLSwwVqzOaw3lv3NhNNAa9HBFnQpvwDiAOB+ciXVaZRCOBRb3Ph
	cCWAUAku84uEut9ZiVlPmV0YECfeARvXjQK5i2kW9vKvCxvMSirff+ebR5Tg7zBVYETqJrB08i2
	+8hDc0Kx+0LCKsFN1oTfJbvee1OYYXJVThAejPtqZV0E6WwV881ol3jXpNalJETHAefhjnulp+v
	7OV02Ve36k8m5X/gWDFH9cBbiiEs81WQGlOTq9TQjsqPjCFXMDgZPTvBi9aizYkxaBHP2MkQ3To
	o/jU0U1C
X-Received: by 2002:a05:701b:418c:20b0:1b2:6a01:f55e with SMTP id a92af1059eb24-1b543d2cc00mr528114c88.34.1794943954025;
        Tue, 17 Nov 2026 11:32:34 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059e3sm173376eec.5.2026.11.17.11.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:32:33 -0800 (PST)
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
Subject: [PATCH net v3 04/10] net: au1000: report MDIO transaction timeouts
Date: Tue, 17 Nov 2026 11:32:17 -0800
Message-ID: <20261117193223.2795612-5-f.fainelli@gmail.com>
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

The MDIO write callback reports success even if the controller stays
busy and no write is issued. Propagate timeout errors and wait for write
completion so failure of the final transaction is reported to phylib as
well. Return ETIMEDOUT for read timeouts too.

Use readl_poll_timeout() for write completion with a 20 microsecond sleep
interval and a 20 millisecond timeout. The MDIO callback runs in sleepable
context, so avoid adding millisecond busy-waits for completion.

Fixes: 0638dec01e89 ("[PATCH] net: au1000_eth: PHY framework conversion")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index 7063f9e5bc7c..1935b1d4b173 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -41,6 +41,7 @@
 #include <linux/platform_device.h>
 #include <linux/cpu.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 
 #include <asm/mipsregs.h>
 #include <asm/irq.h>
@@ -278,7 +279,7 @@ static int au1000_mdio_read(struct net_device *dev, int phy_addr, int reg)
 		mdelay(1);
 		if (--timedout == 0) {
 			netdev_err(dev, "read_MII busy timeout!!\n");
-			return -1;
+			return -ETIMEDOUT;
 		}
 	}
 
@@ -292,26 +293,27 @@ static int au1000_mdio_read(struct net_device *dev, int phy_addr, int reg)
 		mdelay(1);
 		if (--timedout == 0) {
 			netdev_err(dev, "mdio_read busy timeout!!\n");
-			return -1;
+			return -ETIMEDOUT;
 		}
 	}
 	return readl(mii_data_reg);
 }
 
-static void au1000_mdio_write(struct net_device *dev, int phy_addr,
-			      int reg, u16 value)
+static int au1000_mdio_write(struct net_device *dev, int phy_addr,
+			     int reg, u16 value)
 {
 	struct au1000_private *aup = netdev_priv(dev);
 	u32 *const mii_control_reg = &aup->mac->mii_control;
 	u32 *const mii_data_reg = &aup->mac->mii_data;
 	u32 timedout = 20;
 	u32 mii_control;
+	int ret;
 
 	while (readl(mii_control_reg) & MAC_MII_BUSY) {
 		mdelay(1);
 		if (--timedout == 0) {
 			netdev_err(dev, "mdio_write busy timeout!!\n");
-			return;
+			return -ETIMEDOUT;
 		}
 	}
 
@@ -320,6 +322,13 @@ static void au1000_mdio_write(struct net_device *dev, int phy_addr,
 
 	writel(value, mii_data_reg);
 	writel(mii_control, mii_control_reg);
+
+	ret = readl_poll_timeout(mii_control_reg, mii_control,
+				 !(mii_control & MAC_MII_BUSY), 20, 20000);
+	if (ret)
+		netdev_err(dev, "mdio_write completion timeout\n");
+
+	return ret;
 }
 
 static int au1000_mdiobus_read(struct mii_bus *bus, int phy_addr, int regnum)
@@ -344,8 +353,7 @@ static int au1000_mdiobus_write(struct mii_bus *bus, int phy_addr, int regnum,
 	 */
 	au1000_enable_mac(dev, 0);
 
-	au1000_mdio_write(dev, phy_addr, regnum, value);
-	return 0;
+	return au1000_mdio_write(dev, phy_addr, regnum, value);
 }
 
 static int au1000_mdiobus_reset(struct mii_bus *bus)
-- 
2.53.0

