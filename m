Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.206.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019066;
	b=VxI2ypR7Zqfphem8pYPtVWFKeKebxbcwDgSDRFfEkmekXD6pkqipYsX/+cFimmGSV4TR
	 +GLnXCUnzEVs3N1ljLINmdI2LU9FmuJMvgQ4qr0Sm6ihS/Ggz1N1kbzmfI7us9s9eGJNY
	 b9bY0NN7eXngFrtcU9zHPDk7I9HMtus8uGOCYZx9StQUCvWaMZaI55iAGPEJvA/QlHYZU
	 i+b5cmTqAY0gdNt+mUDTu5qEKtDNl+4ZPXYfza7GU0NVJ2rJoLkh+JltNpeYf6mVY8kGZ
	 HiPoy8W+jjs05pioh5ZEg4oRAjhQZHVHQZsSkzkUlErzdFBaJVsi2XSwuOj3mjGKIww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019066;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Received:Received:From:To:
	 Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-Smtpcorp-Track:Feedback-ID:
	 X-Report-Abuse;
	bh=qxGoztvwPd53oxXWJ4zhA1LfAUTegswU0wgNrnxAQtQ=;
	b=5fe3pkKsZvmG0AY3gvDtBvjBOVZ04/beR5uqI8Rgqbe0viXbodf8SF3aOvNYUwGUATrO
	 1P50v/HOhp2EA/9gXVdZWsYRea1gl0ftDZvGbzHkTofuaLRYfpByDUNOk6B7N6pjmnh+A
	 /zTZtI0w93mBLIN4+2fgRdCMgR9RNH3S0vp6HXiPJLblxnvlDfVT5eByEL2BOCmvg6n3i
	 0wdjNT46TJ9L3zS9YSxrCtPWDXkWONzxNKdimJmUCYcU8dZdYhaYlKBmuo8o/S8QRTvEg
	 3mTp9M1XlZ34wN3MYKUuL1jCB3I5Fp4JDs5aDWK5pQRxFboxia/BuAaSnMttqebqV/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bumblecito.com;
	spf=pass smtp.mailfrom=em1130875.bumblecito.com;
	dkim=fail reason="unknown key version" header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=mo8l70.a1-4.dyn header.b=chrVqilK;
	dkim=pass header.d=bumblecito.com header.i=@bumblecito.com header.a=rsa-sha256 header.s=s1130875 header.b="BT1fMYN/";
	arc=none smtp.remote-ip=103.47.206.45
Received: from a2i557.smtp2go.com (a2i557.smtp2go.com [103.47.206.45])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0780606A333
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0780606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bumblecito.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1130875.bumblecito.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=mo8l70.a1-4.dyn header.b=chrVqilK;
	dkim=pass (2048-bit key, unprotected) header.d=bumblecito.com header.i=@bumblecito.com header.a=rsa-sha256 header.s=s1130875 header.b=BT1fMYN/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mo8l70.a1-4.dyn; x=1795019965; h=Feedback-ID:
	X-Smtpcorp-Track:Message-Id:Date:Subject:To:From:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=qxGoztvwPd53oxXWJ4zhA1LfAUTegswU0wgNrnxAQtQ=; b=chrVqilKm0UaYlKy8J9PdaIhn5
	YgxAZpRUB3UQ4buNxHE9GKiw8HIkr7xlKF60uOFm1M5yjmH11/Q588SJan+TjBAYMYigpal0yTQQT
	20hvidgElwD0485Zvf+Q6qm67ghHRQdt6r7+8QpggBxi69Z6qqFcq/0VbTRho1LoGF6lFonrswNrl
	K0xPwDEQetsWldSra25kzJuWOzhy0S/peMfVwYJ1wbRDQsFwmF69C8xgHoGqPlcMA6y2idDtjjX1y
	dqzrNycKzpQ/xuan5DqpkvUDkcMvE0dV8CBzUjvy0Z10omo1Aac5nmWLo6E4WCmSHhqjlSUAEvNsX
	ghCH9oyQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bumblecito.com; 
 i=@bumblecito.com; q=dns/txt; s=s1130875; t=1795019065; h=from : 
 subject : to : message-id : date; 
 bh=qxGoztvwPd53oxXWJ4zhA1LfAUTegswU0wgNrnxAQtQ=; 
 b=BT1fMYN/oLbgaqOhuBrUM3xgdtKutjV7W3si7RZ8WA0u/ZiAbeFdqCHEkGezFDP3kUG6Q8
 i/1/eL1QXLNACCmt0hbHO1iiJrAEvrdX6sZW2/OwrsCErWP6IobBv/Z58AOOMlqkiin3Kk7P
 rrnxqfHDDhTls8wY/eN5FS3fnFc9Uhbd0kDIOWygg5mb5Vh/Culpc1JUrl4zeEkcY1bSDb4Y
 oVKUkdaY7zGhARkDutGE68Ja/C9yWTN3mujG9Yq+ycXjuDVlKn2lx44DUQHGLfoXkpF0h71O
 LBzzMLsZcr2bNmzUsntwHNoVbGO9pU6nnvnDO+A3n/71iBmW57waTCPw==
Received: from [10.143.42.182] (helo=SmtpCorp)
 by smtpcorp.com with esmtpsa (TLS1.2:ECDHE_RSA_SECP256R1__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <github@bumblecito.com>)
 id 1xTiRw-ED4xvI-2P; Wed, 18 Nov 2026 16:23:56 +0000
Received: from [10.168.248.187] (helo=ubuntu.local)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256:X25519)
 (Exim 4.100.1) (envelope-from <github@bumblecito.com>)
 id 1xTiRv-FnQW0hPuZuh-iDkW; Wed, 18 Nov 2026 16:23:55 +0000
From: github@bumblecito.com
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 2/2] net: sfp: sort OEM and Turris SFP quirks
Date: Wed, 18 Nov 2026 16:23:23 +0000
Message-Id: <20261118162323.436219-3-github@bumblecito.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118162323.436219-1-github@bumblecito.com>
References: <20261118162323.436219-1-github@bumblecito.com>
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
X-Smtpcorp-Track: pU3T01zRTTOr.fUEVmxcsONVX.Zda7lgDCwc0
Feedback-ID: 1130875m:1130875aWStQz3:1130875s0erM8GP3B
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

From: Israel Cueto <github@bumblecito.com>

Keep OEM entries together in the vendor table's alphabetical order
and sort the OEM and Turris entries by part number.

This is a table-ordering cleanup only; preserve all existing quirk
matches and fixup functions.

Signed-off-by: Israel Cueto <github@bumblecito.com>
---
 drivers/net/phy/sfp.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/net/phy/sfp.c b/drivers/net/phy/sfp.c
index 960ac89cc..33349c355 100644
--- a/drivers/net/phy/sfp.c
+++ b/drivers/net/phy/sfp.c
@@ -617,33 +617,24 @@ static const struct sfp_quirk sfp_quirks[] = {
 	// ODI DFP-34X-2C3 XPON stick can operate at 2500base-X
 	SFP_QUIRK_S("ODI", "DFP-34X-2C3", sfp_quirk_2500basex),
 
-	SFP_QUIRK_S("UBNT", "UF-INSTANT", sfp_quirk_ubnt_uf_instant),
-
-	// Walsun HXSX-ATR[CI]-1 don't identify as copper, and use the
-	// Rollball protocol to talk to the PHY.
-	SFP_QUIRK_F("Walsun", "HXSX-ATRC-1", sfp_fixup_fs_10gt),
-	SFP_QUIRK_F("Walsun", "HXSX-ATRI-1", sfp_fixup_fs_10gt),
-
-	SFP_QUIRK_F("YV", "SFP+ONU-XGSPON", sfp_fixup_potron),
-
 	// HORACO HC-10GE-113C uses Rollball protocol to talk to the PHY.
 	SFP_QUIRK_F("OEM", "HC-10GE-113C", sfp_fixup_rollball),
+	SFP_QUIRK_F("OEM", "RTSFP-10", sfp_fixup_rollball_cc),
+	SFP_QUIRK_F("OEM", "RTSFP-10G", sfp_fixup_rollball_cc),
 
-	// OEM SFP-GE-T is a 1000Base-T module with broken TX_FAULT indicator
-	SFP_QUIRK_F("OEM", "SFP-GE-T", sfp_fixup_ignore_tx_fault),
+	// OEM SFP+ONU-XGSPON is a XGS-PON ONT stick with broken TX_FAULT and
+	// LOS indicators and slow startup, just like potron.
+	SFP_QUIRK_F("OEM", "SFP+ONU-XGSPON", sfp_fixup_potron),
 
 	SFP_QUIRK_F("OEM", "SFP-10G-T", sfp_fixup_rollball_cc),
-	SFP_QUIRK_S("OEM", "SFP-2.5G-T", sfp_quirk_oem_2_5g),
 	SFP_QUIRK_S("OEM", "SFP-2.5G-BX10-D", sfp_quirk_2500basex),
 	SFP_QUIRK_S("OEM", "SFP-2.5G-BX10-U", sfp_quirk_2500basex),
 	SFP_QUIRK_S("OEM", "SFP-2.5G-LH03-B", sfp_quirk_2500basex),
 	SFP_QUIRK_S("OEM", "SFP-2.5G-LH20-A", sfp_quirk_2500basex),
-	SFP_QUIRK_F("OEM", "RTSFP-10", sfp_fixup_rollball_cc),
-	SFP_QUIRK_F("OEM", "RTSFP-10G", sfp_fixup_rollball_cc),
+	SFP_QUIRK_S("OEM", "SFP-2.5G-T", sfp_quirk_oem_2_5g),
 
-	// OEM SFP+ONU-XGSPON is a XGS-PON ONT stick with broken TX_FAULT and
-	// LOS indicators and slow startup, just like potron.
-	SFP_QUIRK_F("OEM", "SFP+ONU-XGSPON", sfp_fixup_potron),
+	// OEM SFP-GE-T is a 1000Base-T module with broken TX_FAULT indicator
+	SFP_QUIRK_F("OEM", "SFP-GE-T", sfp_fixup_ignore_tx_fault),
 
 	// OEM XGSPONST2001 is an XGS-PON ONT stick with broken TX_FAULT and
 	// LOS indicators and slow startup, just like potron. On cold
@@ -652,11 +643,20 @@ static const struct sfp_quirk sfp_quirks[] = {
 	// match the part as a prefix.
 	SFP_QUIRK_F_PREFIX("OEM", "XGSPONST2001", sfp_fixup_potron),
 
+	SFP_QUIRK_S("UBNT", "UF-INSTANT", sfp_quirk_ubnt_uf_instant),
+
+	// Walsun HXSX-ATR[CI]-1 don't identify as copper, and use the
+	// Rollball protocol to talk to the PHY.
+	SFP_QUIRK_F("Walsun", "HXSX-ATRC-1", sfp_fixup_fs_10gt),
+	SFP_QUIRK_F("Walsun", "HXSX-ATRI-1", sfp_fixup_fs_10gt),
+
+	SFP_QUIRK_F("YV", "SFP+ONU-XGSPON", sfp_fixup_potron),
+
 	SFP_QUIRK_S("TP-LINK", "TL-SM410U", sfp_quirk_oem_2_5g),
 
-	SFP_QUIRK_F("Turris", "RTSFP-2.5G", sfp_fixup_rollball),
 	SFP_QUIRK_F("Turris", "RTSFP-10", sfp_fixup_rollball),
 	SFP_QUIRK_F("Turris", "RTSFP-10G", sfp_fixup_rollball),
+	SFP_QUIRK_F("Turris", "RTSFP-2.5G", sfp_fixup_rollball),
 
 	SFP_QUIRK_F("XikeStor", "SKT-2.5G-100M", sfp_fixup_xikestor_2_5g),
 
-- 
2.34.1

