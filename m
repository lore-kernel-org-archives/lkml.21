Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179398;
	b=qx4MFkaQIu9c5s8beuJBZaaAneDpWQ7LeFUV+cKYsT7LI2ZNKOrmxD7GhXSf2XcJe96y
	 4c5HNW9P262ws+/XpzXjePnBMq5vSikRusHmBwCvZckA8uTKT+cOzI5utcd1SYn0wru9Z
	 0FgA1nAo+VvOIz5EmjU2k7HLIJUGuh85+hxJ3cbpF9iOzfeWZqxeyLfR86mnW1hsafhWK
	 hMsJFrYIL7OQl740TfLPk1T1XHrzyYdqZFiVA6xmt40hfFVateQ7Y2mxB7VOVR+8yrDKI
	 eO8E4/Fl51pqCVHsTkFLFIMJR2F1jiLk+t9/jSlnWNnNSLXlVqjHIal9wE54UAoVXBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179398;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=UGgNyp7svh7X4XAI34FVv4NHd5d512BAdv477CcIj7Y=;
	b=lOdj08y38fxiuM617NTvtWApRDS4Pgirq5IxZrDrNXLSBlNsXz7qSIzn5K65VpsW7pVf
	 tNsLWwCZcatK47FJ8M/OMpcLOSIN1I0kZYBsO0HSvujWFGOU0geU5EZ4G5HH3SaVfRHT3
	 18ZyskcwIXmjY56NlYWG3OUw08XqApjj2aud4TTV2KRUPNchArn3Je6iRVRPKnWYiG36s
	 7we8iXeQ9+r1Y9Rn24E+oh060G/2x8y57CuliQJ43ormG6kfawgy+mrAOo7QIwF/3ecn3
	 zhOwviwreQwCNKgZcLHStlPIuhZEkctRklVH1G2LIb5adubFlagp9X9cemB/S36YVPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BWjzVm+c;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F141606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F141606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BWjzVm+c
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D9D191A174A;
	Fri, 20 Nov 2026 12:56:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A28FE601B9;
	Fri, 20 Nov 2026 12:56:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E8B4A11BC017C;
	Fri, 20 Nov 2026 13:56:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795179392; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UGgNyp7svh7X4XAI34FVv4NHd5d512BAdv477CcIj7Y=;
	b=BWjzVm+cZUWQ9mNygpkvKADtuX7/Q6GCq/hzSWSf16hs5Up55nfy2SN3mGGyMGFbdCXibk
	FJ6IQn9FSOVZTZBUlhLJCaXNBPz2HVM122BwVevchi4wv6hIlSRc1B7qJwIdxFSUYtIE+A
	JigaCIKCVHPaIqzxmVO4ILhrSab5zCNsDxumKTHAiw/G6qU+mHycuZ6SqzyomQsU6kFZcD
	9VEZu+1mBlkDQOLl7dyh0iIc7afYrop0kj9EgGJppKK34iOqWRNUxIsislEqu7RU0A4E09
	08Ebtw/6S0SlorSDGvuAppgyaFksHvtGN5gFessULZa0d1/1ygGrObgUUXCPAA==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Fri, 20 Nov 2026 13:55:51 +0100
Subject: [PATCH 3/4] dt-bindings: phy: cadence-torrent: add phy-mode
 constants
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
Message-Id: <20261120-phy-cadence-torrent-ng-v1-3-da2db7125cd7@bootlin.com>
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

Add the `CDNS_TORRENT_MODE_*` constants to
include/dt-bindings/phy/phy-cadence.h such as SATA-LP and 2500BASE-X.

These constants are used by the new Cadence Torrent PHY driver and
are referenced by the `cdns,phy-mode` property of the Cadence Torrent
PHY binding to select the PHY mode.

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml | 9 +++++++++
 include/dt-bindings/phy/phy-cadence.h                          | 8 ++++++++
 2 files changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
index 8e845e2373ac..17a8343ac899 100644
--- a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
@@ -101,6 +101,15 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/uint32
         enum: [1, 2, 3, 4, 5, 6, 7, 8, 9, 12]
 
+      cdns,phy-mode:
+        description:
+          Specifies an optional mode of PHY for which the group of PHY lanes is used.
+          Refer include/dt-bindings/phy/phy-cadence.h for the constants to be used.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 63
+        default: 0
+
       cdns,num-lanes:
         description:
           Number of lanes.
diff --git a/include/dt-bindings/phy/phy-cadence.h b/include/dt-bindings/phy/phy-cadence.h
index 0671991208fc..94945b843288 100644
--- a/include/dt-bindings/phy/phy-cadence.h
+++ b/include/dt-bindings/phy/phy-cadence.h
@@ -15,6 +15,14 @@
 #define CDNS_TORRENT_DERIVED_REFCLK	1
 #define CDNS_TORRENT_RECEIVED_REFCLK	2
 
+#define CDNS_TORRENT_MODE_NONE		0x00
+#define CDNS_TORRENT_MODE_USB_G1	0x01
+#define CDNS_TORRENT_MODE_USB_IO_11V	0x02
+#define CDNS_TORRENT_MODE_XAUI_LP	0x04
+#define CDNS_TORRENT_MODE_SATA_LP	0x08
+#define CDNS_TORRENT_MODE_2500_BASEX	0x10
+#define CDNS_TORRENT_MODE_QSGMII	0x20
+
 /* Sierra */
 #define CDNS_SIERRA_PLL_CMNLC		0
 #define CDNS_SIERRA_PLL_CMNLC1		1

-- 
2.56.1

