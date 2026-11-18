Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.206.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019071;
	b=mRKhcdeSl874b4Tma2N4gKu8gP4tKrKFrPXntChNa3XEFgMakpbwCYjnslXQFQXc8lh4
	 zHPaKLVwDde0mq9+6Sqhoc1zEBRjt6KcBGmM4uP6ny0pwqtMUB7orceBdVMjQfM59w1Pi
	 Z5qKlntx7IsAdYGRRkFobEYG5DTn+FDPb+5cDRSItMU60NQXn1tfEGRBuu6MYON95zSSS
	 WoHgj77CInh7ZNrrSlpYviR7P/8J3VvaSiX6qApGLbuSpZjUGWl5ArSX7ju/XtvUWQPmo
	 d9K2Kd2S37BGVUKa/4qSDgomE/fMHs3q723NPTXShJU9DYUZ09jlBdVFR9IiPDgbo4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019071;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Received:Received:From:To:
	 Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-Smtpcorp-Track:Feedback-ID:
	 X-Report-Abuse;
	bh=XOYmTp1Vrhbc19yqIzrUeKxVoL+mHARZX0vwQ/q/7mg=;
	b=KnTd/TNfvJ11/IFgFSRZnbBPTEITHUjfJZdJ3FDuso6bylDJgpjdfmfy72s+uxB0DmyD
	 G52/fYPS8EYRTlO3FHvCoriNZN9zoObWvl0AbwbsGo6qYHjaFWinLYwIjN+w2upDqDjKP
	 mNGHuRtNifjTJJDpMznL0yB/jgl1Yzob1kxQJeiYkFyZA8Ux5AzkNKKEhpgTLS9jq/iPF
	 +xnwdF7TW1LDtXURSvtBCEezxU9UH1kJOdP6bgMuRrPAAjE4ZdplNAgLOkABC6+6HthyQ
	 7hP71ceocReq7Vj0mwrB8zo9EelJ+99aTAhw50wNIHH3s9mJcTn1qRYwzxS55zeWSPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bumblecito.com;
	spf=pass smtp.mailfrom=em1130875.bumblecito.com;
	dkim=fail reason="unknown key version" header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=mo8l70.a1-4.dyn header.b=GtZamfy3;
	dkim=pass header.d=bumblecito.com header.i=@bumblecito.com header.a=rsa-sha256 header.s=s1130875 header.b=XjbBEi1Y;
	arc=none smtp.remote-ip=103.47.206.45
Received: from a2i557.smtp2go.com (a2i557.smtp2go.com [103.47.206.45])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8A260A2601
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F8A260A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bumblecito.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1130875.bumblecito.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=mo8l70.a1-4.dyn header.b=GtZamfy3;
	dkim=pass (2048-bit key, unprotected) header.d=bumblecito.com header.i=@bumblecito.com header.a=rsa-sha256 header.s=s1130875 header.b=XjbBEi1Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mo8l70.a1-4.dyn; x=1795019971; h=Feedback-ID:
	X-Smtpcorp-Track:Message-Id:Date:Subject:To:From:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=XOYmTp1Vrhbc19yqIzrUeKxVoL+mHARZX0vwQ/q/7mg=; b=GtZamfy3omreth+3B5+RCV7HKJ
	W9D8Xi6i+vckuXSX+VqoZv63yKIkDFRlowmDzMJhc+S4++HEsRGnO4aoruSx/Dy0psLWfCKyy9KJR
	Hhw66m2lnpqK3uuuEfAWUCMKlh4w5NUm20T86mw58a2gvTYQx9Nqwi4jUxpU2z2SrlpPdsrm3+Xfy
	qZhK50ufb8cv6CwoyXnfD8I6Vepz5LQk0fXBUwYDv2iZIq5k4+kL00uvy/kWYGU8Aoe8vC6iSMT+C
	/c4LaPgn25AhnHKOMyQ/20pHVQBHm1APuzbM5FDaOP12hNOMyHYhrIijQRIqTnKNHciHeMx0TCdaM
	XHwqPo7w==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bumblecito.com; 
 i=@bumblecito.com; q=dns/txt; s=s1130875; t=1795019071; h=from : 
 subject : to : message-id : date; 
 bh=XOYmTp1Vrhbc19yqIzrUeKxVoL+mHARZX0vwQ/q/7mg=; 
 b=XjbBEi1Y2u1sI3wJuVyKrr0jJCbCUL2iI3OEPEWgSDJont8do6bvZLWkfiIYHu8TVVxs47
 K7JHFZCr00MYEFY0+b44zonNJmCKFGz2Lic4Rm++g7T4lsQ5T//cMwaN/uo8oP3b8ZT2PsOX
 XYrZnRiMMr2KTljFtuYapcWEV/lEscM5BHMUImCvy7URbGiOzNUZf+ztPeiunKAlWxfTLtFR
 xT3pwwFskjzmP+1r5tXWQz+bxFwCduoX6lQFYi1SvM1dCWQfK+2DLye4WaqNzUbp85mL/egS
 VuCsyz9jD9agUP8WZbzbTvsulLsmAwZ4jeA0aZ3jGtDImOPZhtXilRbg==
Received: from [10.143.42.182] (helo=SmtpCorp)
 by smtpcorp.com with esmtpsa (TLS1.2:ECDHE_RSA_SECP256R1__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <github@bumblecito.com>)
 id 1xTiRv-ED4xtD-3D; Wed, 18 Nov 2026 16:23:55 +0000
Received: from [10.168.248.187] (helo=ubuntu.local)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256:X25519)
 (Exim 4.100.1) (envelope-from <github@bumblecito.com>)
 id 1xTiRu-FnQW0hPuZuh-iQFe; Wed, 18 Nov 2026 16:23:54 +0000
From: github@bumblecito.com
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 1/2] net: sfp: add 2500base-X quirk for ODI
 DFP-34X-2C3
Date: Wed, 18 Nov 2026 16:23:22 +0000
Message-Id: <20261118162323.436219-2-github@bumblecito.com>
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
X-Smtpcorp-Track: qOYtUF2ZGCAG.h3KyKUzenIgW.OENDEgWdVVT
Feedback-ID: 1130875m:1130875aWStQz3:1130875soaZ0uTq5X
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

From: Israel Cueto <github@bumblecito.com>

The ODI DFP-34X-2C3 XPON SFP module supports 2500Base-X.

Add a quirk to enable 2500Base-X support for this module.

Tested on a Horaco ZX-SWTGW2C8F switch with an ODI
DFP-34X-2C3 module. A 2500 Mb/s link was established
with speed and duplex forced and autonegotiation disabled.

Signed-off-by: Israel Cueto <github@bumblecito.com>
---
 drivers/net/phy/sfp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/phy/sfp.c b/drivers/net/phy/sfp.c
index 915156743..960ac89cc 100644
--- a/drivers/net/phy/sfp.c
+++ b/drivers/net/phy/sfp.c
@@ -614,6 +614,9 @@ static const struct sfp_quirk sfp_quirks[] = {
 	SFP_QUIRK("Lantech", "8330-265D", sfp_quirk_2500basex,
 		  sfp_fixup_ignore_los),
 
+	// ODI DFP-34X-2C3 XPON stick can operate at 2500base-X
+	SFP_QUIRK_S("ODI", "DFP-34X-2C3", sfp_quirk_2500basex),
+
 	SFP_QUIRK_S("UBNT", "UF-INSTANT", sfp_quirk_ubnt_uf_instant),
 
 	// Walsun HXSX-ATR[CI]-1 don't identify as copper, and use the
-- 
2.34.1

