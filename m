Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795546713;
	b=ugKHXElb/VJWlxhpTYGZXG9VLt2bDij8Mg9l4u0CZfwqpUgAykM6i16Hn2MixnL/w2sG
	 QosuxWPNJTBR9g1hiHOGeju3VfOIp5yGzSubocPbdG1vMyXLa/86ABSQnQLQNj0Kojb9H
	 kI8HhRtTxyKcVw9YpvHAG/lyZVCHztgsYkiVaP7ggzIllMFziQq9X4n2dk6KZ4LRnUU3X
	 //Vb8Y5/ELxIEv/NIMkeWsW/WSXV7/LcYtjrdlr/qFsJYKdl7P0WizAgP50u2DN4hQmUk
	 vP8yAPy7hJxMrkYAOmBxNRR9P6aPSNaJ3YHKzje47RirI2LvgpOA31MQh+D7SQPH/NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795546713;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
	b=rwtA5WzVn74sYAT90mWy0/jgbOv3+J53ddTmIzc9zAebY42qGNsAhU0fqjAiO6GjRHDV
	 Pzea3PNV/2oRstQVN9dyBQR+Kw/9x41qrJSHUN68oSaL7q0qTf2WAjIk67/e9RJ803wsl
	 Cl35Sqes9ODbItn0H8rc+lOKqZco6zhm5gKeIZuv1hj/NLRvxYXojc2AVv/WNhQnTpro8
	 fVDGuQ89N/HOawQsxzunVu14S1gRVO73xPNPdqAEFuZGOjgzlyf2/jwsy1nHc6GsO8Y5k
	 vIaJiph64DQ/ez5znImV7tU7LKKq8PENJLIdjq5falQpUfEc+KT1IB9dSEgiaXPQUGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="Li/aPYHG";
	arc=none smtp.remote-ip=209.85.217.98
Received: from mail-vs1-f98.google.com (mail-vs1-f98.google.com [209.85.217.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C7C606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:58:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7C7C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Li/aPYHG
Received: by mail-vs1-f98.google.com with SMTP id ada2fe7eead31-77bf892b496so1764874137.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:58:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795546712; x=1796151512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
        b=NIcxK6lPvHBPOBI4xfH1ig2hbyMB/4a4XdR984TcVhu6hpxpzn/QLXJAx1ruHLfPE/
         xCy6g7m+GXWoQhFJixh4njq/O3z8urTeLZhV2cV+DPDyqguWKC6XkJH3JHeWvtSMHq1P
         ZUG+YMKr5OX0OR35QiWXV9yDLL4uoVQJ9lxqQCBsEvRA3Jd9yekgDOq099NqFzEY4d8N
         4t5lz7H9cDAODfBXc2gT+zS9nmLEh4XRnd5cuF5exn00M65KDLqKueQVxm4L3lXvMyuq
         qpY+Gg8IKWMLuu33ZzLzCMg+TgcwYWcq/yYiG8CJJhntS/bqFZxZM2RywJ8rbcD+DXX0
         MvEA==
X-Forwarded-Encrypted: i=1; AL+hErHJpKJ3I48zBPS8aP2H8w1bU4ieBeMaeO8b6Lhp8kF3FX6omlFh+EcHLbNWRIxZhr0SgZvoNg9hyS+sEVw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tXRxOt8kQBXJU+nYo+7KE9vUBy2wPxtxG4y6KANg3/HGR/MOz
	/Ng5nhJl+GR/3OyegU6MCX6433hFYfbV5pHKYuQUNMnaEoBTo4FoNKSpXl3RKZGKBzp9d95o4vG
	yFSFC5qUhVmCnbdm4tGreiqS9kPkZod+Bj2EdhwofpgDQerNKJS6PNzjJRN84O8uD6pOyfs+BQY
	nSRGhhj/NOL0TPezl/glHQGJeZf9xGWhMeBjFne2+BPiP6FJqBViU97ItODfVwaJGjnRTDW8ZCj
	lcDBCCaz0JokeptAI1KKlrJ
X-Gm-Gg: AZFdTZedpq9OthwmiA24Ows9bDZxvuB09ilnSbYxLGQtr1tfFxxd2ZDqyHWhMFeEWeV
	c7gY1xOuuiBCMOSDcV2jT35xCSz0162MWDi5yicCEnVvetmaF2Cvdsd2b4+HihImtvHGlCr52D2
	x5UerTeBcA+yWGHz4/JS3muiO7QGMoACzLX4U4zwGqNC1rP8clAVOP0/H/BwazavL3dwoD1XYOE
	5+g0ENHOW8jq2BbX/YBxoz8yY/jEerY96SAB+K93hX9auMnbJqBI4b5p0lPBxd4m1aVuEatcwjx
	Ck3AHcKKLKrV3e34XTYW7rydHf9YzfAm0h4wBf47HEHj4K7TPXXJkFc1KF3ZF8C0TJRWy/9EYOI
	5v5GT2lpDOieWc/6BY80C2UlcFr4hhOZoiP/NoVolEhnFbjVElCzEJMVBLD/aysOy9hM7mK4Tm1
	IG46Lonq6dSpF6AAhdcmNxStxt2aQ2hYp+/RDNohpAm50=
X-Received: by 2002:a05:6102:1610:b0:7b7:3acf:bd3a with SMTP id ada2fe7eead31-7d72b36bf3cmr6716384137.4.1795546711563;
        Tue, 24 Nov 2026 10:58:31 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99e6e0fa957sm1664888241.3.2026.11.24.10.58.31
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 10:58:31 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b56c696405so4725798c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795546710; x=1796151510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
        b=Li/aPYHG1qJpLvZzvgu1M7uWfKUx3TzzYrjZb2Ww99epOyAoy0FNixxCbuzapFLFTi
         Ph93+rRLxbrHob3XJLoZ/+qGUahBvs7ONiblzwSLq1FuaQOVYmW2d40TGO17blDyhmhF
         UvXUQTp6TW5gb9IbTCXRN7cKEahQX17IUDxSg=
X-Forwarded-Encrypted: i=1; AL+hErEjY6YrtOT4gs3Y6X4kNgvMsbdwltnBgDE3fPuZxs14E1te1vjWcxvtUL2p/vPOj4J9Eb4A8zKY5k8cGNg=@vger.kernel.org
X-Received: by 2002:a05:701b:42c6:10b0:1ac:91b6:8dfd with SMTP id a92af1059eb24-1b55690919bmr18198109c88.31.1795546710105;
        Tue, 24 Nov 2026 10:58:30 -0800 (PST)
X-Received: by 2002:a05:701b:42c6:10b0:1ac:91b6:8dfd with SMTP id a92af1059eb24-1b55690919bmr18198061c88.31.1795546709359;
        Tue, 24 Nov 2026 10:58:29 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm41712779c88.13.2026.11.24.10.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 10:58:28 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Doug Berger <opendmb@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list),
	Mlody12 mlody12 <kudzo51@gmail.com>
Subject: [PATCH net-next v7 2/4] net: mdio: mdio-bcm-unimac: Define MDIO_OP_SHIFT
Date: Tue, 24 Nov 2026 10:58:18 -0800
Message-Id: <20261124185820.3954716-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124185820.3954716-1-florian.fainelli@broadcom.com>
References: <20261124185820.3954716-1-florian.fainelli@broadcom.com>
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

The MDIO_CMD operation code field starts at bit 26. Define
MDIO_OP_SHIFT for it and use it to build the opcodes instead of open
coding the shift.

While at it, rename MDIO_RD and MDIO_WR to MDIO_RD_C22 and MDIO_WR_C22 to
make it clear that these are the Clause 22 opcodes, in preparation for
adding the Clause 45 ones.

No functional change.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/mdio/mdio-bcm-unimac.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/mdio-bcm-unimac.c
index 80fb3b5b52ab..5f79f31220f2 100644
--- a/drivers/net/mdio/mdio-bcm-unimac.c
+++ b/drivers/net/mdio/mdio-bcm-unimac.c
@@ -21,8 +21,9 @@
 #define MDIO_CMD		0x00
 #define  MDIO_START_BUSY	(1 << 29)
 #define  MDIO_READ_FAIL		(1 << 28)
-#define  MDIO_RD		(2 << 26)
-#define  MDIO_WR		(1 << 26)
+#define  MDIO_OP_SHIFT		26
+#define  MDIO_RD_C22		(2 << MDIO_OP_SHIFT)
+#define  MDIO_WR_C22		(1 << MDIO_OP_SHIFT)
 #define  MDIO_PMD_SHIFT		21
 #define  MDIO_PMD_MASK		0x1F
 #define  MDIO_REG_SHIFT		16
@@ -99,7 +100,8 @@ static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
 		return ret;
 
 	/* Prepare the read operation */
-	cmd = MDIO_RD | (phy_id << MDIO_PMD_SHIFT) | (reg << MDIO_REG_SHIFT);
+	cmd = MDIO_RD_C22 | (phy_id << MDIO_PMD_SHIFT) |
+		(reg << MDIO_REG_SHIFT);
 	unimac_mdio_writel(priv, cmd, MDIO_CMD);
 
 	/* Start MDIO transaction */
@@ -139,7 +141,7 @@ static int unimac_mdio_write(struct mii_bus *bus, int phy_id,
 		return ret;
 
 	/* Prepare the write operation */
-	cmd = MDIO_WR | (phy_id << MDIO_PMD_SHIFT) |
+	cmd = MDIO_WR_C22 | (phy_id << MDIO_PMD_SHIFT) |
 		(reg << MDIO_REG_SHIFT) | (0xffff & val);
 	unimac_mdio_writel(priv, cmd, MDIO_CMD);
 
-- 
2.34.1

