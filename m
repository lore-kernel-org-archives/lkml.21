Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778467;
	b=PPoH/JSYpc1SLuxgvyzFrl6Ma1B2xx2oo+aySxBzbmIMy4pYhVwYN2SCP0yMrbz6HVzo
	 pC737CWBT4nNEAmQX5mFMd1a4uiTNMF5c7b45o9sM2EoiuByDQ31sak5IqdRnVs3on+nL
	 AI/3cDjwxZBvYb5JrtWg4/UdypSY+0EwDXuPHvUuGTyKAsje5yUA2V5qWFAbUpy0S0Oc9
	 BsCgey7Nwqn3nqkdbBdNTzgAcSkWP3CohvWSbxVi3MaEi6R7Oj+JmpWVp5YMw5Xmd4wHX
	 BZjXdKcWHwr/+jPSjJM8yk/4Z4tnft6ExtiT5dedhLVgDybsVzK6EQkT6eAV0BwBAQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778467;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=LLm6hMsQBQFbf768oUzPJc/Sb15c553IoVLWEezd7kY=;
	b=Kv+fAb3sl+gIvTi0cgPIkI0ABHIvJCztLI9e7qwcu0V2GSmP+D0nfBbCUHNMTkwU/3Z3
	 du1bJVPBabc/YGNHyNRMEIfNZ0bypQjxqodSKa+u3ElskZpB/wM0x8Xck8a5bwoBqSDtE
	 1yJBKgBiT4UkgY7OhY4Iv0NqX5G0V6dYYhAsKn01b9ZT1hQCFawvxqBJbTcx8J1ozi3Tm
	 kFhk0kBXHS2P7H07lYh8n86MYYBFYZyImT8wFcb0lY/vE+htPqO+9zGVCxCGGIuPK7Svc
	 mcUOEUJmdICEXhkbMTcGX41Mv59WkNt+epTP+/SKUIXTpJ3DH57VNf11WqkoL0ndEjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=PzxejwKi;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A709606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:21:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A709606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=PzxejwKi
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4706D1A1832;
	Fri, 27 Nov 2026 11:21:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 114256049C;
	Fri, 27 Nov 2026 11:21:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4ED6711E6930D;
	Fri, 27 Nov 2026 12:20:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795778463; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=LLm6hMsQBQFbf768oUzPJc/Sb15c553IoVLWEezd7kY=;
	b=PzxejwKiRCMoTKGMyTjO+0pLn54hlw4x4yMaiYyygReKdsMd55G5nr8oy4hlOhrxSBd8Yr
	8G8b1k4s4qiLbuP1QROoliOrpSCNcd5X6AfQIgTu7v6MA3bsXy/3dfA6IKzH/dFA4JH6Gi
	jHT1w88GEFIVsJIDqNRcoH7jHapai0d1vfQ6JPhs0ll1U6zZJ1MS7xjr8wrJXo1OrF1iyX
	oIJVsVGohx40gLuxmfxffEuPcRCG7gQN9vVH1tZA5/8MI1Wbskdy8sxYxPreJUFLJHlCWh
	+/iz9hVImkb9zVJHV8arqTE3qDXZiLqqgnodvrlORCo54yD7WOFQWtaPr026rA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v2 0/4] drm/bridge: ite-it66121: use bulk read, improve
 probe logging
Date: Fri, 27 Nov 2026 12:20:35 +0100
Message-Id: <20261127-drm-ite-it66121-log-probe-errors-v2-0-dbe9b5a3c5df@bootlin.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQ6CMBBFr0K6dkzbaAFX3sOwgDKFGmDItBIN4
 e4WPIHL9/Pz/l9FQPYYxC1bBePig6cpgT5lwvb11CH4NrHQUhsl1RVaHsHHFEdjlFYwUAczU4O
 AzMQBSltYh66oc5eLpJkZnX8fE4/qx+HVPNHG3bs3eh8i8ef4sKi998fcokBC7lpTlheUDcp7Q
 xQHP50tjaLatu0LDyzv7uQAAAA=
X-Change-ID: 20261015-drm-ite-it66121-log-probe-errors-9c8cfef8a7f7
To: Phong LE <ple@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Julien Chauveau <chauveau.julien@gmail.com>
Cc: Paul Cercueil <paul.cercueil@bootlin.com>, Nishanth Menon <nm@ti.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

This small series improves it66121_probe() in various ways:

 * use a bulk read for reading the vendor and device ID registers
 * log errors in ID reading and matching instead of failing silently
 * on successful probe be quiet on !DEBUG, more informative on DEBUG

Note there is a separate series fixing probing on the BeagleBone Black
rev.D [0]. That is orthogonal and they overall improve probing of this
chip.

[0] https://lore.kernel.org/lkml/20261105-drm-ite-it66121-fix-reset-v2-1-02039d66af29@bootlin.com/

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v2:
- Split patch 1 in two parts
- Use just a u8[4] array for the bulk read
- Link to v1: https://patch.msgid.link/20261015-drm-ite-it66121-log-probe-errors-v1-0-7fd6994e0be0@bootlin.com

---
Luca Ceresoli (4):
      drm/bridge: ite-it66121: check for read errors reading IDs
      drm/bridge: ite-it66121: simplify getting the chip IDs
      drm/bridge: ite-it66121: log an error if the IDs do not match
      drm/bridge: ite-it66121: make successful probe quiet

 drivers/gpu/drm/bridge/ite-it66121.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)
---
base-commit: f210da5b4aace6919f2723586d22126b73c0e31a
change-id: 20261015-drm-ite-it66121-log-probe-errors-9c8cfef8a7f7

Best regards,
--  
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

