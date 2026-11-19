Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115067;
	b=HOe5yhHDjItarIGP6FSctFlZxujmrVjP84P84euoxdC1TCNMAy8WL/YtCAGn8UF3sKp5
	 /QE1At7KQpkBezOMG3k91S9WT/qTrG0upJkswRbNFE4XgM4gl8qfBXvoIQd61iHuKVeJJ
	 9McwwN65Xj/WoWH+tfcNysoqc0U+GbBUytTJuAtvNXD7c95fOdG5DApWL3In2g8201YpB
	 V1O+d7Z23EFX0vLqJdEOYoNsfiWC81t6NG+oekvBM3c+LIKTmWnnABXhFHQ7EhqGrcTiD
	 h+yzJ5K1dr+of07gGqjBEpz/f7HENpjU58SgeWWnK/yyL4Rr7PdUF4Foqmaf8E3yW9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115067;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=LE/ePd9AqgVj4/hO/b86KqcyKMm0F5QDDk4eDLXTswE=;
	b=LsoTmqH25j6GsVf8Q3S/3Q2/c0TGbkvkpqWsE+/4PuRV2bmhFRrQkaKniveMOt7wwG+c
	 m3Iw+pSZF0MKCXR3CDoLMrxzHJesFwqiaM9etCNxvVbb9o81y0v/tZ0waKp9E8GYPNfSc
	 1b7XViQOm2zNC+ATJN2OHolGd5eY8l7PKDaBevfXgKQNy3ZurtUhLYdYIIR+PEVtB3Ome
	 6Xteru9FMoysj8nNF1lOW7gfB3dVeJwKiQox6iEbA7KWCm1dOhmK/0GdpoxVkSqR0gJJC
	 2jRoLhV47vKCZIxxIrjrYett+w5Ok/C+PFpbeIn8U191hhPlzgWadTv6w9ZVTJICRdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DUWBVLy7;
	arc=none smtp.remote-ip=209.85.222.228
Received: from mail-qk1-f228.google.com (mail-qk1-f228.google.com [209.85.222.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1B360A3827
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C1B360A3827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DUWBVLy7
Received: by mail-qk1-f228.google.com with SMTP id af79cd13be357-9496317b730so13660385a.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:04:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115064; x=1795719864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LE/ePd9AqgVj4/hO/b86KqcyKMm0F5QDDk4eDLXTswE=;
        b=aVHHk2EjJpxSpW4FaTYz02ouXrF8XJf4AV3lhAA8wmIXfGwv8nGz7G45Gmg8AcPNvm
         JIA+S6ioX7LQ7e4VUFNA050NJR659d10RyXszhnJQ8r4+vRovhAosNhbI2LUBxoS5SNQ
         Da4o9yM/RKexoNdUc1ZWGEcEWB0i4K/m7QTStOS6S0SaMM2TBiiLerpq66mKpjyA4CJO
         sxzTIElRuY2AQPr5Dwlxc7oBqTOszCG7PRr7eQKVEk7BJVE7w9XGpVnbtowQ9wY32Ncb
         WDlgne8tyKDqohMbxkCEIoGXDvvajWzvBhZ9VPJ4e/06T6UbIKb849fHWXiNMOW7WK7l
         uKxg==
X-Forwarded-Encrypted: i=1; AL+hErGjE01Vwvn9vPe1R7+XzAP5JSoQSs9PshRkQb7IAWvCDbfx0y1IcDVnrOaO+LPGLYMBRZW5zHvEpIgK0VY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8q+9AwaId5wnSPbzXV+jnn8fFKtD/hq2P0plEt11uFDh6F2zl/
	8yPCBezUac604HS9x3iMeqBiC7pOFfQWiSVAseODY/WRBqSxTYW28fKdXjJLMwR8JCItt8gKTlT
	z2AWG0exy6vkzXYJSszncS1Pm4COR+t9U5cmPjrIuNFD8hZXDQhAzH1b0npQ1T2Weg43edo9NIB
	lo8LTWP0PYA9T5EGFuUg4vw3T/UZvEBGHOTk+3w/cH+AvAgsWDXGkbX1lq9uWB2xEoB/Q44bok9
	x2UxUI/rfv3J+yhYWwzl6Nn
X-Gm-Gg: AYBFou3LsfHXdEE0h7EpHTVL8RoNvWekINJ4FfRyrkEI7brvd3Ib2zvLmghiKizOHiM
	00y4j4uLplL5YtipveGWoEnh+rJY+1d6+/06z7tmcnwz2BUVzNYRdrgd1fhQdWzAN0TBqdradcp
	ezIuUXYquFYszzAMvlgllB6Tmf6woy7QAOSRpLGe1feBeD5ODLiWM+u9MTlZbJyX8Mc/DxC5IUz
	aMbkQYHi+IlbHvbIZi8IWNU09zmx7U10Lwas1WDdzam5zg9yhUHNn4gq+fgNcwrry8Vk/7FMsZC
	k+2pDH4Ruu5Ayw4sxlr2gf9z6LaK0xUu//1hHLv//v3YCtA3cTnKyMc/1MJu8rBhzGk3BI5qL1P
	DD83gBpxkbHTSljYAHxM+h2WesUrpvorkCvYARAh+hidxieheJ7Qzi3U1iQiP8EnfWswhfbgIWq
	t27jrcntZOThfgZ5KmMO15JZUwNMrC5aZxXUz8N2/n
X-Received: by 2002:a05:620a:460b:b0:93e:d364:c9fe with SMTP id af79cd13be357-949ba9e35a5mr103867485a.40.1795115064149;
        Thu, 19 Nov 2026 11:04:24 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-949bb34d46dsm2180885a.7.2026.11.19.11.04.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 11:04:24 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-92104826f9bso2767736d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795115063; x=1795719863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LE/ePd9AqgVj4/hO/b86KqcyKMm0F5QDDk4eDLXTswE=;
        b=DUWBVLy7OOdmuyeVd4BcS1vq7fy4KgNJ3QvyV1cY4JbIcRUnU46yMeYbpbxRe+RdZA
         ZJwwsVkGATQEfmgQ391nwH2j1pF7RWXlB63dZ6v2yioIJHBUdzeC5OqGu9Mamx5RiAqa
         ZqRDM7/yM9qrHY/QCQYp45DrT5K+r24MWso5E=
X-Forwarded-Encrypted: i=1; AL+hErHxKcCWFoKWTrV1xVW+4ByuWZLMe3zxioxPfLXDF3ZkNb79T/2Qy3siqO4c8YgjbwWt7fbKpHYr1jYExFM=@vger.kernel.org
X-Received: by 2002:a05:6214:85d4:20b0:921:33e7:45fb with SMTP id 6a1803df08f44-92134abf93bmr7531356d6.17.1795115063274;
        Thu, 19 Nov 2026 11:04:23 -0800 (PST)
X-Received: by 2002:a05:620a:880e:b0:949:75de:b21e with SMTP id af79cd13be357-949ba9cea77mr82763585a.37.1795115051693;
        Thu, 19 Nov 2026 11:04:11 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f7cf3sm24063285a.31.2026.11.19.11.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:04:10 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v7 4/6] net: dsa: b53: use the correct override register 2 Gbps bit
Date: Thu, 19 Nov 2026 11:03:46 -0800
Message-ID: <20261119190348.2317702-5-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119190348.2317702-1-florian.fainelli@broadcom.com>
References: <20261119190348.2317702-1-florian.fainelli@broadcom.com>
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

The IMP and per-port GMII override registers swap the override-enable and 2
Gbps speed bits. Using the IMP speed bit on a GMII port clears its override
enable and leaves any previous 2 Gbps selection intact. Select the speed
bit alongside the register and enable bit so lower speeds clear the correct
bit and 2 Gbps sets it.

Fixes: b6a8a5477fe9 ("net: dsa: b53: fix resetting speed and pause on forced link")
Fixes: 41af38324341 ("net: dsa: b53: restore the NSP IMP port 2 Gbps mode")
Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index dac6013f8fe2..19e36e51be52 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -1427,17 +1427,19 @@ static void b53_force_port_config(struct b53_device *dev, int port,
 				  int speed, int duplex,
 				  bool tx_pause, bool rx_pause)
 {
-	u8 reg, val, off;
+	u8 reg, val, off, speed2000;
 
 	/* Override the port settings */
 	if (port == dev->imp_port) {
 		off = B53_PORT_OVERRIDE_CTRL;
 		val = PORT_OVERRIDE_EN;
+		speed2000 = PORT_OVERRIDE_SPEED_2000M;
 	} else if (is5325(dev)) {
 		return;
 	} else {
 		off = B53_GMII_PORT_OVERRIDE_CTRL(port);
 		val = GMII_PO_EN;
+		speed2000 = GMII_PO_SPEED_2000M;
 	}
 
 	b53_read8(dev, B53_CTRL_PAGE, off, &reg);
@@ -1449,11 +1451,12 @@ static void b53_force_port_config(struct b53_device *dev, int port,
 
 	reg &= ~(0x3 << GMII_PO_SPEED_S);
 	if (is5301x(dev) || is58xx(dev))
-		reg &= ~PORT_OVERRIDE_SPEED_2000M;
+		reg &= ~speed2000;
 
 	switch (speed) {
 	case 2000:
-		reg |= PORT_OVERRIDE_SPEED_2000M;
+		if (is5301x(dev) || is58xx(dev))
+			reg |= speed2000;
 		fallthrough;
 	case SPEED_1000:
 		reg |= PORT_OVERRIDE_SPEED_1000M;
-- 
2.53.0

