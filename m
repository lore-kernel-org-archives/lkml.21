Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794958343;
	b=hmAGE8SLxumUa9qy8sCxPak2mIKgenBAwukArBixKrhrViBiPJWUVf1G0pnyLO7fEBpO
	 cYMy9HlFbnfC/lYIxHO11j+DtB3gqEi/WWpvCkw66dOnJfTP7qMsmVxfLynWzNEX+kdCZ
	 zA32iFTKOEspTx5A5J9o0+PFNrqeExX+sPrnpakNLbuWLPMXUmWhoSKtbeh3w6kbTunmM
	 qD0D2n2DpCU2h7CY3357SLHb5ezZYBFNXOthEfGBTZmrl+WzbpdRZn4jEyZPMpuHfFmnc
	 gcMUeW73cb/BAengPX981BGx0q7DfcztZoYt+Z+dVsZdo9EcRq1+BGXe//Pk8t15Oqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794958343;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
	b=lFM60dRTMlg7u3Xi9JCo/kg0GDC2sp6M31cOintYyIDVLXDNzWhLE7nmYr6fci5m+clP
	 7e8OAhY0yeZrG4M/TwUN9JZfzjcOV1oHlqh6uqscDFcIezQ1UhQ36o8+2ATCO0et1j1eu
	 T3JQnN1hbg1yDz0GunBVrCLFDAZv4tHGVPDuXeyXMNmBnx+d+GLokH0aQOMH1gq/4YXtk
	 n/PUvDfN+5qrD+dcr/E/8NZFPdepWJBXgDLTebsrkurtXMxKPcZLSEutquGrxRzATcHGe
	 3x+ZfKq1A47qj4AcHmeW9Et7i4RAgu6EbY3zt7iOgCcNHwGXSqtWOm3MWSxHxuhUTjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=E8RPwI6J;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB49606A33F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CB49606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=E8RPwI6J
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cc758830601so302201a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:32:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794958343; x=1795563143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
        b=Jy9NktbvBxWgJ93PrpdcanCtksL7VqAX/pZc4MEWyIBfJNBmdlBFxMieTayQdfB2zN
         aC5pdqbkp+9HioNeyzC3hNKe1GdNBHgtI4H6jTJlsIi9LfqnJ6DomAv1Q0rdYLg13uf/
         iMrbDTVZGzacWKUst/Dj4Z+dhbuPGfUknCbnDci4aIIiZCa0Q9mgnKDVErilHbVUlEk0
         eqCMgo5Q9PZ1Rti2aGNCKf2tJvCo/tXWLoNAKu0XCzFLulNc77wGhunC8yDR4eqYdSCs
         D5VWmftMfHyvQh22+igcQ/EQWlGBr67vsHG1VLe81L/Zzw8bajXUg5StIvCmCNoRArZ4
         knHg==
X-Forwarded-Encrypted: i=1; AL+hErGlEavmiucu+UwbOLKzdqxd66U8sOjqdy5wzErsveo4QPez1+ovjhE1xb2RqMVpZegHxHTEopWfram3FgM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CU5ovt+vAIiZxbmfRUH9mJumXsLA8hpUh7/nPPCNixPYVnMik
	HOYJ2sSMp+FCsECZxkIbyqJs3obzM4pHh2RBeINUBeoBmehaRJJTv8x1SE5A96X5jTo1jirfoEy
	ATY0NJ878+i55BoFETt1b9dWYq3tWPzCZ5h7CjSsWBWuxyDxVJkhDq3Oeh2y5ak+GD9qH/d6XTJ
	I6H54Wf9Efibksv0qO6cTUkuIrKNG2QnhnWZEoBSjRm6Pz0xhDQb+uKuXmuqs3CoQJ7fGdlrIN6
	bgUcCbwNhEdO6NXsrQGyjGx
X-Gm-Gg: AZFdTZf89rw2zyqT9mMHxz9ucb4ZULZhNPAhyA/2vH/RpkBVxwUiO933mDu1vSac71I
	iXBA5JWPbr5xBJkgUSm7dBO8OY9laF9W/iUSNMi5ZFBU+7nkLfA6t753v9x92p0Pl4knJc1EyEq
	B5y4+FQxyqDL7q8btaTsnjiHsW4lEfy3LmEzPEtfENt0sUCtfuN8l1G3YJQjNQcDeDKemygthv+
	+zajCGoDbM6TQKQfZpwVW5Ut47bAUrWh6CBSVI2aaSymz+Xo4GvlnS5um1Gxcae3zXADGAaqTSJ
	IcsDZq0OT2odnyp/+oD6pFgBlP67f6qoYSDD9mc154h0ZmuVKzVGaS/IQa0xMBinc11qLNwIB01
	9bXzjn08YTnuveRyxgxy0QSEkB6vjZlS9AqxgcbD7bA+x9qIZlQhy63sFjMGpQt3dlrb1KSii88
	62o6MAf/D1fc3cuJF+hpynYqtXMhe1oGbMJAHFFEy5
X-Received: by 2002:a17:90b:1847:b0:3b0:9deb:d991 with SMTP id 98e67ed59e1d1-3b3d07bfcc8mr820461a91.35.1794958342583;
        Tue, 17 Nov 2026 15:32:22 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abb84fe8sm2888183a91.2.2026.11.17.15.32.21
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 15:32:22 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-154e9d2d94fso730860c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794958340; x=1795563140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
        b=E8RPwI6JUlQoJPX5Bmn5WiA/1nsGDi2nEkalKJTIPqBsxqADMkTwaPIc2eA3ifNAvG
         NskD2gspWn2I6NxVSGgl/T3EQHYqmx/ODeWudb62Kh9E9TJG/Djfare4/M0lYrFqON6B
         e8DJ9IiGwsAdwmZXtFt5qjQaqG3Ll4vq5lULQ=
X-Forwarded-Encrypted: i=1; AL+hErFbgwl1E0zio70tAT7UPLGpzMnywTOR7wig9PzTmMK/TVZ5OxS8/c/d6xmkJHOWSmjLhmu9n1Zv7um1QCQ=@vger.kernel.org
X-Received: by 2002:a05:701a:ccde:20b0:1a5:9abb:fdd7 with SMTP id a92af1059eb24-1b543ce5e34mr966102c88.9.1794958339616;
        Tue, 17 Nov 2026 15:32:19 -0800 (PST)
X-Received: by 2002:a05:701a:ccde:20b0:1a5:9abb:fdd7 with SMTP id a92af1059eb24-1b543ce5e34mr966079c88.9.1794958338991;
        Tue, 17 Nov 2026 15:32:18 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447c1193sm1389095c88.7.2026.11.17.15.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:32:17 -0800 (PST)
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
Subject: [PATCH net-next v3 2/4] net: mdio: mdio-bcm-unimac: Define MDIO_OP_SHIFT
Date: Tue, 17 Nov 2026 15:31:47 -0800
Message-Id: <20261117233149.1693881-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117233149.1693881-1-florian.fainelli@broadcom.com>
References: <20261117233149.1693881-1-florian.fainelli@broadcom.com>
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

