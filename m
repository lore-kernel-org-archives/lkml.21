Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009256;
	b=FLpmyPqE/60lBTynF0kUawJzgtwmCqFSM9Z6+iAV3KXAOTIsTHUpspq1/oxSZgH1V01Y
	 rxsZsvXP86AXjNxYfZzu47So1Z+WJ+gu00pkZm8urSFebQuXhpT2KYu3f6qe8xBQLP2Gx
	 44bv0CrLDsplgYM5Lu4fyLOxddTkZdGAiBEem/8DS7RYh1CsNID+xO2qu6E1Vr7MMyLFH
	 DXHuTzjSX6z2k1wJGNlffTO79/jKIBGCAT65dzFcy/GqFvovlZBAWLgokwB1XnUDUVBuh
	 wd6Ie/TLOxNWHQesWwqgxBjy+A9xXMqSxJIut+lHRUii10zfMAnJKc/XmEcDvucDNow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009256;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=pRFhJrtEbA59+P0bhkwyJkntkOBG5jIZd//e6sEb3E8=;
	b=tSZeSRmFIlry1MlIlsm7WAit2d5F/C9Q7kUtP1AOT0UCc7CUy/P39TNLxizTThmcug+U
	 SOpBHjYQd9ZFQF4KEE6WLEbRJnij81XvkRBEAeseoCaZSinTwOOQEraEAPNqzdAkIvEg8
	 LG+9HLQevgRBvupT3bMF+T8MUZCKD73yAJ9n5CFq8W2B2MBb7aj4lzlf+uIlyQ5WfMzfd
	 kEfT2RSl4EV+s9npACgJLVZQLdLpk/mN3gFjqzLyovEHl68PUNur/uwKj4ONT7/jaksqu
	 RZWDBT1uh+u+ogRXlw19JxRUMIq4GN8+g+wX9g5nACD4+XajYTwLKUYZoqXi4hAwzyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="n2b/RoMi";
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4C9606A333
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:40:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C4C9606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=n2b/RoMi
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2F55B4E41635;
	Wed, 18 Nov 2026 13:40:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E9EF95FE9B;
	Wed, 18 Nov 2026 13:40:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4203311BC20A4;
	Wed, 18 Nov 2026 14:40:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795009253; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=pRFhJrtEbA59+P0bhkwyJkntkOBG5jIZd//e6sEb3E8=;
	b=n2b/RoMi+zWPV5m4nL+jX1iPgew2lcTUyn0JEzlkKu2L/STPHkUk9FFe03luMk9Sjf5zuS
	O1DTsZU81hqCdCHgsOe6qVFxYKJIW+LGIkDyIeW19frNO8QjJS28WrxlSppuu4hV0+qQoh
	+eEuxMiMMHLzeNehvO2uL1/GJ7qupFWaTMDrZdKwnnY2EjtF5drlNF/s+BEDx+OfDE28CK
	ZuHMNSAGkdIJBEvYOULsYyrxH7MfJRX0DBGrYLj5eSrwFPQ+dKMCINLfAjLmPhW9LjqYhX
	iIOqV/82X4c39SV8vj0MpTP85HVZE/fqTWSbjFrjzsdQJ4SpxmxWRxhKO/VWgw==
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Peter Rosin <peda@lysator.liu.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v10 3/6] i2c: mux: Set adapter physical device
Date: Wed, 18 Nov 2026 14:39:12 +0100
Message-ID: <20261118133927.366482-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118133927.366482-1-herve.codina@bootlin.com>
References: <20261118133927.366482-1-herve.codina@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

For i2c muxes, the parent of the mux adapter device is the adapter
device the mux is connected to.

This parent is not the physical device related to the mux adapter.
Indeed, the physical device of the mux adapter is the mux device itself.

Fill the adap.physdev with the mux device.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/i2c-mux.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 53428098ddc7..c1836114ef56 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -361,6 +361,7 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 	priv->adap.algo = &priv->algo;
 	priv->adap.algo_data = priv;
 	priv->adap.dev.parent = &parent->dev;
+	priv->adap.physdev = muxc->dev;
 	priv->adap.retries = parent->retries;
 	priv->adap.timeout = parent->timeout;
 	priv->adap.quirks = parent->quirks;
-- 
2.56.0

