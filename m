Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179391;
	b=Ubxo5lwutzPykAWW3zEO/geeLD7KKunytua0JYVtfE0nUF/hxTDqXtHpwFnpC4lCJMG/
	 gfIYUsYMAwA5bJLrwMF7Jaw+szMz3d07ddMkp6m8ui5mK9kh1y4ihYVunCjijURvIJ5Lx
	 cHzxxbug0E2yuP05dHLdVrVm/SDD8yARklLPc55Yuxc1AYH9joubn1IOPpYK7Zc3QmBKf
	 jgCoQLLdG7BOSDTlA3afOP3wuL0TkP+NYumq6sH5OCrIBOX3dgAS4zQmtvS17NzB1GTi9
	 I1FvmuGkZy1BssUqX3wXbldItqLwp3RiwffkyZDX2CPEqEXq3U08SRCvyy8dPoarb5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179391;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=a0pVAM4i2Q/5zRFX/d555/UXNJbQv06b7Ai2U1kyUQw=;
	b=Xm43FRXitLaSnEymgYi0kQgauFMD/n7UPE1i1EvSCNlx0TS7Y12vWrmEwARJHXSTdEVf
	 /uYsgQvfL0QJt+Kq9bMBjkBd5VfPH2A0gQc6pvDI2YJDnZokN1iWLqwLKioepSQzi76yA
	 E/aZkl/lZv5xdQpwLcNwHHTkCpRosF13ryXdJ3wNGeUI0gge0xuxTIjhb9ntHobr5kemK
	 0huWlSgoOBkUzuVZboleHiFPOYdjOXhX6Oqac70aOCkpQ/44SKMoPERsROJiNF+RZ4DTy
	 WesVdp+eL5X3MWELxPLOvRM3X/Zo/xDjVN9mLkO71vDdSlIPh+6F0BHyaNJLY3bGvKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=N4QDfg9H;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BEE60A2601
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3BEE60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=N4QDfg9H
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DC506C62216;
	Fri, 20 Nov 2026 12:56:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D644601B9;
	Fri, 20 Nov 2026 12:56:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B7E3B11BC003E;
	Fri, 20 Nov 2026 13:56:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795179382; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=a0pVAM4i2Q/5zRFX/d555/UXNJbQv06b7Ai2U1kyUQw=;
	b=N4QDfg9HzUsmfowSwbd0ENGWDUnrPtjb+QVmhdIQGdRN2UsgjJm3/aRR1kflioXQA++Z/s
	3pG8QdQLYczgWZLqvA59ZxoQ+gY2pvcXu+GE96ti07bysdSKoxkRAMqTy0CARIOl7573ky
	nswJgW1Fc7TykA4MhpidOToUBzLtsBtOtUKSvlMVP4b9gvs5mA+yYVh9YyGAtaQg7VyGov
	lvlgr1TDgHMaJF/IXNbROSrw0OX4hshI3/EVZnui8l2Wjn1P+kus+ab4XH/CVDdGna/wv8
	Bcl8sYcllG21J7G/euALbxoXu+Glevx1xmE1a2D9dKcbzH60bF4ygNynHodOkg==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Fri, 20 Nov 2026 13:55:50 +0100
Subject: [PATCH 2/4] dt-bindings: phy: cadence-torrent: drop cdns,num-lanes
 default value
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-phy-cadence-torrent-ng-v1-2-da2db7125cd7@bootlin.com>
References: <20261120-phy-cadence-torrent-ng-v1-0-da2db7125cd7@bootlin.com>
In-Reply-To: <20261120-phy-cadence-torrent-ng-v1-0-da2db7125cd7@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yuti Amonkar <yamonkar@cadence.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Andrew Davis <afd@ti.com>
Cc: Vinod Koul <vkoul@kernel.org>, Chintan Vankar <c-vankar@ti.com>, 
 Abhash Kumar Jha <a-kumar2@ti.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Swapnil Jakhade <sjakhade@cadence.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

The driver treats cdns,num-lanes as mandatory and refuses to probe a PHY
sub-node that does not provide it, logging:

  No "cdns,num-lanes"-property.

A default value in the schema wrongly suggests that the property is
optional, which it is not since it is listed as required. Remove the
"default: 4" so the binding reflects the actual driver behavior and the
mandatory nature of the property.

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
index 9af39b33646a..8e845e2373ac 100644
--- a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
@@ -106,7 +106,6 @@ patternProperties:
           Number of lanes.
         $ref: /schemas/types.yaml#/definitions/uint32
         enum: [1, 2, 3, 4]
-        default: 4
 
       cdns,ssc-mode:
         description:

-- 
2.56.1

