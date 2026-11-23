Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452532;
	b=gk2leDG1d8pthHLip7QAh7BpTk5U64ULmd3tQhql+H6ojwDw+qpy4xhfC5k4/lcgbmpC
	 epDfoRJzGUD1Cjr8JVSlENzUH4pR9LAD3qOaUifKpvZ3fleDrZG0VN9bTQlq0WpiSk7B2
	 k8WdW1+TUm5p4QiMSmFucYKKUv8oHuP87VJEM0hJT8PMWoyMUzRC3tBncftuj6A39Je8f
	 9PS6nCg3Pbkq9CL2P9j+d4ufIKNJMw1ZCBZlCdevprgToA9OTbxST8BMzjHrVyPfcCusH
	 +0ZmckWstQh8kDj19686mcbfOp2TMirbx1apB+pwW33tt94uk2jfzAq2qEtuxTT7BVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452532;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
	b=0e3+tinrMNTBMARlNXa1QyZftUt7WX5E1oPZ/x/b7cvkJicaRStZv/VGuXWR8fm8LyV1
	 q0i4GC92Zopj9dGCvCkUyLk9P8xr0jc0D8STfKFJAKf33WyKyZ43OUNJMliBiy6FbbApr
	 dYwf72ct8x63wqhpbJiHCRf08cydOgv5H5TFErY0As2W3Bt9Hgds/gNW9WFzzOj/7UbwD
	 xthZLPuJ2BcgGiwAOg4g79+kVhbOvCDMa6Gt5vtkuOCckHvy6/ZtTGXg61BuipOlk5IEM
	 EmAUXFQOy4AEh8uFTcWc/yMnaUpZy5tHzgKJK09dlYwPocSE4eDIDhC3n8vgvsrRHvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=efmFVNQy;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223C7606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 223C7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=efmFVNQy
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso1490469a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:48:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452529; x=1796057329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
        b=ykuEJVmaV7Gm5X5v1H0wz1DB1Wjr+9JN3MK+hTrqDd6lamflQ/9pzCrp1LLEMaCSPF
         SP0el7hvGUvCGl3H5PiOtaSlY3fcKTs26FkvFzWWpHy2Od8m8QGiFwOupxeOcOFZjOhU
         ZS3xzhIyncjyrGAiIf+mTfDdUvtIuPBGtb7ljo0MlufuvlMRqcBQHVhAA/7sg63G5ztY
         qudhIgQvG7VvwlVncluCBp8VZSWHYExTMJ3Oi/5iqZuPequIU9qJoG7PbRc4uovT8WEX
         HKyDHmxtaxS1Cxda1uf7t/IVfIiJXL8J/i3mpaIGQz66uZmLnTqsL8aqYJ7SBMYz5ZtK
         tSXA==
X-Forwarded-Encrypted: i=1; AL+hErHD5n7au2zJM/sS4uaExbwOc9Fwh9/L/iHifNGSzsoLSAdEi8Bgga7DFJt7b0G0SRgr+PZyXSmoZoZxkJQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9l6lDBTrICYsM3p43K1/Q25Ayk0d0OTz53L4ThPRUmGhVxNsAV
	J0giUwkAWG22F+e73uF1qjzBmGCvVP91jXZwP2bo5E21ohYfRA1joq8+VxTxQKTj2BhlyhWJt/K
	C2DVoNZkUKD76/XCXa73sYJBo8SFbtkOsvpAasanNgqa0C5e61Pg7XxM0SwD+SfR8Rt1JqqYPpN
	oJGthRWdzjh/FXSUI0NUSB8n13hFjDFqggV2LdPUCm5FuBx2Tle3WbZzO9LP5TQOzBodCaCoEFA
	B7BNFXQzqvyWmXYS8rjYIz5
X-Gm-Gg: AZFdTZdKwwoLRWEV+xOD9IqjT9EAlfI+5LlA/dsR4JMOf915OZNBegYkYppBJ26K9q2
	40D4KKD+cdOYVxS0dPRhI9PD6/wwXRmuDyyZOSMVoavAE+4YXO2aOn6Rb08OsVVkghFvdHwf2aZ
	ZiMI8A9W3p89g0LSjZZr+zxTYdmJQolcR2mhK+kJfCDthQrsh6x8UhYX+CFDv4EnIgWBE52wSSh
	fA1ol1HIu1mi++RCRcx2GRRCu+1+oRHGBxCsr/hFp06q3DFWr5512KZFJp1zMSwfzRK82kAeQYZ
	yF0PZLZXJLT6bQdNR1wjWUyGiiulPABXO/nLxloCU2BR8xtTqxZ7axIswkgGX1YjDUHrJIHya+U
	NAXzDshwaaY50NRo4iwyyTe1Ok6AqoDk9VNuU4jd4/sW19q3FCGpqLcfghOLapgmDEnDkGM3e4W
	IBa24FweuFHj+XIltKajU5abuH1dOQi1qvTC09mX1vpzU=
X-Received: by 2002:a17:90b:4490:b0:3ae:a531:4e73 with SMTP id 98e67ed59e1d1-3b41c7b606cmr11148800a91.7.1795452529137;
        Mon, 23 Nov 2026 08:48:49 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b411775fa6sm9574539a91.1.2026.11.23.08.48.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2026 08:48:49 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9493e89d4f9so515004085a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795452528; x=1796057328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
        b=efmFVNQyuaXx7st7qoOjIl5ImWhj87JkZZpexxAup4OjvVq3JzqJbA4R6MxuKxa+v2
         OGyfdQbtctzsmaE+c7kbxvS1REH4Bw43vwiUDP66+yzEoPRGS794JYnVnj62BoreyfxR
         cA8tIGtt7kEneFXZg9WzXvC2Dpmv/6s9eYjzw=
X-Forwarded-Encrypted: i=1; AL+hErFsSddbYyGtEVjCdgmGtBYUILZStS0bGgNOewfvfzlqHsmA3iMfVjEg8tuRKtuIKv86b4cVwbFD5VixbU8=@vger.kernel.org
X-Received: by 2002:a05:620a:6011:b0:947:b201:fad6 with SMTP id af79cd13be357-949bab48436mr1794771885a.68.1795452527737;
        Mon, 23 Nov 2026 08:48:47 -0800 (PST)
X-Received: by 2002:a05:620a:6011:b0:947:b201:fad6 with SMTP id af79cd13be357-949bab48436mr1794766785a.68.1795452527266;
        Mon, 23 Nov 2026 08:48:47 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb0354a9sm853020785a.5.2026.11.23.08.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:48:46 -0800 (PST)
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
Subject: [PATCH net-next v6 2/4] net: mdio: mdio-bcm-unimac: Define MDIO_OP_SHIFT
Date: Mon, 23 Nov 2026 08:48:33 -0800
Message-Id: <20261123164835.1733304-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123164835.1733304-1-florian.fainelli@broadcom.com>
References: <20261123164835.1733304-1-florian.fainelli@broadcom.com>
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

