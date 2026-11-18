Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.206.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019067;
	b=iYBsZ5QfHnPg8Pl+soJU2iqMdxTWFwSlTB+ys79JoDwu+X4sWAcKxcZoAYHAtRa45YIU
	 Rg1dk4jDwOgxraCOoH/+3MY6AQDP/IHF31DXDMrUR7muNVp+wuuW6pMnVRrKePSQwsqYg
	 V5uXOwBB96Czf6fYdER3PnK8CBhDoePMUXqLerqj9bPZ6xoyyNCWQfCJo4XmmrWN24G4P
	 f2JUJwZSVqNuiVpgqgZlgKj4USS41yW2O5WvZ3njXRoeaI1AATg8salyrOweh5n5K1S4j
	 I97TKWhmLvLGYdbW6xEU6MOBQaaE4rzn96JcIbI2GFarGY+cVkObgHnggq6UidIodKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019067;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Received:Received:From:To:
	 Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Smtpcorp-Track:Feedback-ID:
	 X-Report-Abuse;
	bh=GXcmHeUKm0j2WWfte+u3KR76u4Q2nQBU7GMgPEePmOs=;
	b=08yFgwKFgJtO4HsldL5H/JDalATfdrTJ7O0NTLr1BoYR3rHr4WPbrGjxxqYexcsQPnIu
	 gwThNE3I4C3Kg8zJUH2Qxt34y4Riq+vPgJLMTD7/B18iHceMgnzX70CbrKCsLtNAj/QA+
	 oAs1uXvufakZpb447Ea3R3M0zxHAQ47lFIrV/2AiUxRDN4dr5fc8WWDh2iHR4t/NNdBue
	 qkZO877sepOBoWZKDiFyVnE3/rXqeLGz/QmtjS7i1EO4986hiWfWD3MVeGfNLsISI0oYY
	 AuKULTdWPERpM/3s03x6R81b1LdIIRY38ujwOV5xdMm1S/E80wrv/7ZQFfxpDzEGifQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bumblecito.com;
	spf=pass smtp.mailfrom=em1130875.bumblecito.com;
	dkim=fail reason="unknown key version" header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=mo8l70.a1-4.dyn header.b="wYvmnRv/";
	dkim=pass header.d=bumblecito.com header.i=@bumblecito.com header.a=rsa-sha256 header.s=s1130875 header.b=DrQIUbO5;
	arc=none smtp.remote-ip=103.47.206.45
Received: from a2i557.smtp2go.com (a2i557.smtp2go.com [103.47.206.45])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4192960A3829
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4192960A3829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bumblecito.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1130875.bumblecito.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=mo8l70.a1-4.dyn header.b=wYvmnRv/;
	dkim=pass (2048-bit key, unprotected) header.d=bumblecito.com header.i=@bumblecito.com header.a=rsa-sha256 header.s=s1130875 header.b=DrQIUbO5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mo8l70.a1-4.dyn; x=1795019967; h=Feedback-ID:
	X-Smtpcorp-Track:Message-Id:Date:Subject:To:From:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=GXcmHeUKm0j2WWfte+u3KR76u4Q2nQBU7GMgPEePmOs=; b=wYvmnRv/LAMek3tgeWVrWXPXY2
	vGTErHPoqC8E9sPFvLNDBrJEZ1dEX075p3DW6dLk0KvGsELDSqSeg7M92/3T3aOvugTN2K+j3k3NS
	r8m/1UEitlFRyIAfHlTm9UnuWqYbdWIOpCL+OkR/GSYJJE0vuDBteruyzA5WI/e7riWQBz/b2/rIW
	i2KO0X9W4TTEEEEoszKzK621LJMLAmOtUoLh/DKPp8bSLLWhnu8wcP5wx76mS+TthpdVc3foToh2/
	IF4PxYfsd6yuZwBtneSEvZGY2OgPzRBlC0i+Bk573778mlJcGErNVbUcYVD75hH+wDEbBV4MIL/o0
	tyWpEP7A==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bumblecito.com; 
 i=@bumblecito.com; q=dns/txt; s=s1130875; t=1795019066; h=from : 
 subject : to : message-id : date; 
 bh=GXcmHeUKm0j2WWfte+u3KR76u4Q2nQBU7GMgPEePmOs=; 
 b=DrQIUbO5cyuyN6U0a9rkn+EzkZIcuNdTfjrSpCATYjlft+OoAzEy9y62iECZwNtW9399w3
 hyRRwDN81hsc0RrnpfNB0seZICZXzOHZxweDiOFfL9HV40+EosKrh8sLoJ0ry6SRM21WX20l
 73Pt1N5dqFMGG94gyyZ9mNxQu8h1GqGiLIStvEniffcysL2n5Y1w+oc+fBNY48dcgE5VF+5J
 TDfT+QKK9QoHcq17Lv8OeniuNBlDmmLLmwKWe3p3ei9+xvF27X8z9ANRAO4krE+qNRZb5tDn
 DHZfV6CvyzI1nt1ZvwRuhi7L7llMB6Mr1Jm3+L3CAWR9YiNj8p6uMrxQ==
Received: from [10.143.42.182] (helo=SmtpCorp)
 by smtpcorp.com with esmtpsa (TLS1.2:ECDHE_RSA_SECP256R1__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <github@bumblecito.com>)
 id 1xTiRu-ED4xq0-4q; Wed, 18 Nov 2026 16:23:54 +0000
Received: from [10.168.248.187] (helo=ubuntu.local)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256:X25519)
 (Exim 4.100.1) (envelope-from <github@bumblecito.com>)
 id 1xTiRt-FnQW0hPuZuh-idGh; Wed, 18 Nov 2026 16:23:53 +0000
From: github@bumblecito.com
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 0/2] net: sfp: add ODI quirk and sort SFP quirk
 entries
Date: Wed, 18 Nov 2026 16:23:21 +0000
Message-Id: <20261118162323.436219-1-github@bumblecito.com>
X-Mailer: git-send-email 2.34.1
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
X-Smtpcorp-Track: Mg9CvtP_4Dct.fkGVkpOVkxvz.3XcSpA-PpOM
Feedback-ID: 1130875m:1130875aWStQz3:1130875sFcvEtkfJ4
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

From: Israel Cueto <github@bumblecito.com>

This series adds 2500Base-X support for the ODI DFP-34X-2C3 XPON
SFP module and performs a cleanup of the SFP quirk table.

The first patch adds the ODI module quirk. The module was tested on
a Horaco ZX-SWTGW2C8F switch, establishing a 2500 Mb/s link with
speed and duplex forced and autonegotiation disabled.

The second patch is an independent table-ordering cleanup, sorting
the OEM and Turris entries without changing existing quirk behavior.

Thanks to Andrew Lunn for the suggestion to include the additional
ordering cleanup.

Israel Cueto (2):
  net: sfp: add 2500base-X quirk for ODI DFP-34X-2C3
  net: sfp: sort OEM and Turris SFP quirks

 drivers/net/phy/sfp.c | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

-- 
2.34.1

