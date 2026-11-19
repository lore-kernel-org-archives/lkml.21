Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795132812;
	b=y4qlmpNYe0DOvcdL8JaJnWdm3iyIohPOGHYhKHDz3gCyXNS3GRUnJYk0oQHN93txIFOE
	 s9uyOixAttQN+hgyXw/SLrq3d2r+sWcVFPkFnruDu7YO4TRlrQ6nS2xmKZLNBLvz+VwoL
	 Y163aqm6Z6Op0MbIUAwOoes2QFFN/L5GceiLrVy28CmfstCcpB1RQmLFJ4umDx0BUBUjH
	 4VJ5D5M37t03lYNBbWK4Kf8kwB0oH9rOV5Wo232GIj4bwPBIq53YJPVKhpWArCW8IVWOm
	 KKD1oZY6kv9jRNyIOQQIk+nzUxfVRSdhOhYa4UtmDB8OZ3rcjp63vEbFuf1b/klgsFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132812;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Tzhg2A7UEpmlPpmW52TCPu9PE7gKWbYpaRKV5Aelz4w=;
	b=m9i6/wRZX3ADjB7rwFxfHCY1btYJM1KHamb5aJw2z4TR/4ONov8US30djXX9RDOSpvqy
	 tasV3Vyt+EK7sHMWZ5S6lqQvOdxaq+LrMzska8rfbNGi9PMfmcrx0ScopBkY/Px4kJb3C
	 Fd69X+e5kVMtzaxt1b7Bw8tl/bbh75oa5HBgSiq+0iRUq7/kq5uDq2J1EcO4mnn2FpWvJ
	 Q3X5zy/8O6lfIyhwFHaOs6R/13i5+fgLaFCgoZGhL2shGxb4R6l4fykT1VjJ4m0UwkKCB
	 LZteZUau/le5NA8WanU67W80HGOMjHXX98YxX1YGmR7iSTZscziyAL4s7KYpf8ggeVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E28606A336
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7E28606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUC2x-0000000023P-009x;
	Fri, 20 Nov 2026 00:00:07 +0000
Date: Thu, 19 Nov 2026 23:59:58 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hermes Wu <hermes.wu@ite.com.tw>,
	Pin-yen Lin <treapking@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v9 05/14] drm/bridge: it6505: complete poweroff even if
 disabling regulators fails
Message-ID: <a7616431e8b1e690076e944ade8236aeb96bc36b.1795132452.git.daniel@makrotopia.org>
References: <cover.1795132452.git.daniel@makrotopia.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1795132452.git.daniel@makrotopia.org>

it6505_poweroff() returns early when regulator_disable() fails,
leaving it6505->powered set with the IRQ already disabled. The next
it6505_poweron() then takes its early return and never re-enables the
IRQ, leaving the bridge deaf to hotplug and link training interrupts.
The regulator core keeps the consumer's enable count on a failed
disable either way, so bailing out only adds a wedged bridge on top of
the leaked reference. Log the error and complete the power-off state
transition instead.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> # Steelix Chromebook
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 42fd24de9e147..249c616300fde 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2816,13 +2816,15 @@ static int it6505_poweroff(struct it6505 *it6505)
 	if (pdata->pwr18) {
 		err = regulator_disable(pdata->pwr18);
 		if (err)
-			return err;
+			dev_err(dev, "cannot disable pwr18 regulator: %d\n",
+				err);
 	}
 
 	if (pdata->ovdd) {
 		err = regulator_disable(pdata->ovdd);
 		if (err)
-			return err;
+			dev_err(dev, "cannot disable ovdd regulator: %d\n",
+				err);
 	}
 
 	it6505->powered = false;
-- 
2.56.1

