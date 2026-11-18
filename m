Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.206.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794973522;
	b=DXEsKYtTC/Azx1WzVFPsxdF4I0dYnKBvq7lztEFoAVQaownNW5+3sZlWjLo3mA3L4G7G
	 LaVv6wiIu8aZlMmBxVqvbW+jKxnIDuWg8NEPt3mYdjWljubrbTfxGBbCPW71HIPJYSk9A
	 TDT3pqK+1v3h1Ukzs0Fv2jVXuDUg+aGoj39dXiwQZC9zqMjuqz+E8dpnizRKkWuZGHf6R
	 vywe8ajZorSjgOHadL7UM/lBCnenBHlkygqr5uCtD1vG1XCHfh0muOar/m0wqnY5bcJQr
	 Z3cfWTv/DiKCq9cwTTqp1hLN/cQK+it4yClV0WcJv/mmerkg452RDbmQzcOOqPljHZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794973522;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Received:Received:From:To:
	 Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-Smtpcorp-Track:Feedback-ID:
	 X-Report-Abuse;
	bh=QD99YV81P86vVsdVhSCsb3s1uatJTfxI+KZieoslfgw=;
	b=zmBkcrNNbjRhRoOV8lRDSMvuUkuAoJGDHRIIhPAWf/ctPOxiFGszkv/dQnqK+tlWOidO
	 n58alEiYBURIccQqQNIe9KX0jmLWVdxMt7KLog35GuYFsRwZ6zSAJbwIaXlqgXJLAJCHg
	 zk77+ymG0vVaEisR7XT4ZLsqz6Pjn+GHRuS7a+KjpSEAi15h0HfZDhfIYhoXkYxS/xsz2
	 MccbsW7pZ1sFDvNnQfaEeIIJLd8kD5TR5w96Wy62ay2lSa8FLo5ub+58TzJY2NDokFqXK
	 2oABXvmjjWuyy03iXwIXct2QmbQT6QkAFbeEI2aC+dXsua5MBgU+myre+MkFtfmQtuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bumblecito.com;
	spf=pass smtp.mailfrom=em1130875.bumblecito.com;
	dkim=pass header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=mo8l70.a1-4.dyn header.b=jfqrugP0;
	dkim=pass header.d=bumblecito.com header.i=@bumblecito.com header.a=rsa-sha256 header.s=s1130875 header.b="mpeAB/UI";
	arc=none smtp.remote-ip=103.47.206.45
Received: from a2i557.smtp2go.com (a2i557.smtp2go.com [103.47.206.45])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29C8606A332
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A29C8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bumblecito.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1130875.bumblecito.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=mo8l70.a1-4.dyn header.b=jfqrugP0;
	dkim=pass (2048-bit key, unprotected) header.d=bumblecito.com header.i=@bumblecito.com header.a=rsa-sha256 header.s=s1130875 header.b=mpeAB/UI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mo8l70.a1-4.dyn; x=1794974421; h=Feedback-ID:
	X-Smtpcorp-Track:Message-Id:Date:Subject:To:From:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=QD99YV81P86vVsdVhSCsb3s1uatJTfxI+KZieoslfgw=; b=jfqrugP05Ga+TdKRjzf8ELjJCU
	NH4T9RwG6A5ZA9Ehm4omoK6Adpv+684kCJII2f9B7C/OcKKoAFmmffxqGuHcLKRUJgkme/GsFJs8P
	EToldbjQl97ojx432tK8+lBZebL9F0tVjTTuXU/vM87yumVuxoXKHLqN4r0Fuhoezdl6ld4IkCE8W
	8il7kPco5TIlbdrcLAiwCWzqxYleeyNp7/8bCrMdQLJxKbctp7rcVYT4GGGrzGlpJOaCfmTTpkA4f
	rf3O1rAfSP4n3UsQnqXbVk4GZ+9u+vFkVpBJkfgc+BhpCFA+rmAFbyj342e5A07745ShvEOm2UsvK
	HESGHQTg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bumblecito.com; 
 i=@bumblecito.com; q=dns/txt; s=s1130875; t=1794973521; h=from : 
 subject : to : message-id : date; 
 bh=QD99YV81P86vVsdVhSCsb3s1uatJTfxI+KZieoslfgw=; 
 b=mpeAB/UI+7mBoLj3agMQDC0/ml6gm/n600i3Ns0A2ZiLHvct+YPdUzOmKKlztZcVWY5oQJ
 8vU4YfucoDhpbGDh3JOfgHnpjpnnAjeI/aossA3kXH4EP7sdqy9gnAlnbl3v95CaskXzqJXw
 rP1KzJqf6UlBpI/sb/Lu3tjb7TEsQTJpAnzkIho+bF//3T+0hHdOthM0i3E5d0WKOH3hV+EV
 /Dz+9NlBK3BmxqtCWJhiCAoRt7v+V1HC4d3rfWe5Hd/05yOn6psj71ZhbiXet8eC4WklUpHz
 vpLcNtonFcJlpLmAmt5nF4FRzDF5RDGD2cM+Abf2+jf0OA+/PYHrFxZg==
Received: from [10.97.107.137] (helo=SmtpCorp)
 by smtpcorp.com with esmtpsa (TLS1.2:ECDHE_RSA_SECP256R1__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <github@bumblecito.com>)
 id 1xTWbm-ED51UL-HR; Wed, 18 Nov 2026 03:45:18 +0000
Received: from [10.168.248.187] (helo=ubuntu.local)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256:X25519)
 (Exim 4.100.1) (envelope-from <github@bumblecito.com>)
 id 1xTWbl-AIkwcC8uCsz-oD2F; Wed, 18 Nov 2026 03:45:18 +0000
From: github@bumblecito.com
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux@armlinux.org.uk, andrew@lunn.ch,
 hkallweit1@gmail.com, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, Israel Cueto <github@bumblecito.com>
Subject: [PATCH net-next v2] net: sfp: add 2500base-X quirk for ODI DFP-34X-2C3
Date: Wed, 18 Nov 2026 03:45:10 +0000
Message-Id: <20261118034510.434732-1-github@bumblecito.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118025602.171615-1-github@bumblecito.com>
References: <20261118025602.171615-1-github@bumblecito.com>
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
X-Smtpcorp-Track: on5y3zDPl_zz.Ze0lqBV3OQy9.3qLPtwukmmv
Feedback-ID: 1130875m:1130875aWStQz3:1130875sEYp0nQxb6
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
Changes in v2:
  - Move the ODI quirk to its alphabetical position.

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

