Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795132781;
	b=vTegRXzLegYj3RJQYO6z0+Xd4SIm/80NFxDulLidNZeWGx4w2oRD0V/M55mDoQJjREmi
	 4SqQH4XGnZO0bP8kRdihzD0rlyfIsYpN6dwMocBb/AgIQhLmmhPJ6uWmQsLbUJnEP526b
	 YmmmOkw4Px6WdH3kJXGi3b3/7+wl610xB3oy/vkev0bxmccEvrnOuggW/eqF9v7C477pZ
	 ZL4wtz72RBsKz6GP32iidGp8mdSC8HFF+32A1Ahdnmh9DJaYoAaWu3rgO/9hWh9GzcIo1
	 crl3jMBJvt3u4fpoL1Q0sU8ChIjj379rDgjYOOVweHjYmUX+z3racljZmmJQ2ZoCdDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132781;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1+/PxKhMGcAt4tZa1Ap8Pe0zZTOMhB2536j9sSqefQY=;
	b=k0MLtVvjUGYwWGNJgVvxU72VUxD1lLOPYw8f3yuK+1lbTSt1q5/2L4zCJjaQTEwOprZo
	 mYogGpAXfPnsj9EFo5m4DzexhUBXYXrNf53i77c2EXDAcVEOQlGHMIFjICqIoYkJrXC9m
	 AeFWcXeNXXQ8AS46FZE3fV08IGQJlwocvHw4yx2C/bH783oDlBmGKG25js6l9yNAUbvgq
	 vkmjj/+vc+Q4qUtOHf3DabjTwvzW7hmZuU8AGq7ju20h/P3NFkhs7jQ8esE8x/T2FdBHS
	 uIr85xxcTK92NfDDaQNTNsNuAeeHdQXBX/4be2p6FwR14cf5to5Gw4RNmRFMbTJGGwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A059606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:59:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A059606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUC2T-0000000022Q-0MlX;
	Thu, 19 Nov 2026 23:59:37 +0000
Date: Thu, 19 Nov 2026 23:59:27 +0000
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
Subject: [PATCH v9 03/14] drm/bridge: it6505: balance and disable runtime PM
 on remove
Message-ID: <6069e4e9a713e5879c679c5eff8485cf7a8d5f6c.1795132452.git.daniel@makrotopia.org>
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

Runtime PM is enabled in probe but never disabled on remove, so
rebinding the driver warns "Unbalanced pm_runtime_enable!". The
extcon work also holds a usage reference while a display is
connected, which unbinding leaks; the count survives in struct
device, so after a rebind the device never runtime-suspends again.

Drop the usage reference held for a connected display and disable
runtime PM in remove().

Fixes: 10517777d302 ("drm/bridge: it6505: Adapt runtime power management framework")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> # Steelix Chromebook
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 52d7d818a5ea3..9c4aae383c1c5 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3663,6 +3663,9 @@ static void it6505_i2c_remove(struct i2c_client *client)
 	cancel_work_sync(&it6505->hdcp_wait_ksv_list);
 	cancel_delayed_work_sync(&it6505->hdcp_work);
 	cancel_work_sync(&it6505->extcon_wq);
+	if (it6505->extcon_state)
+		pm_runtime_put_sync(&client->dev);
+	pm_runtime_disable(&client->dev);
 	it6505_poweroff(it6505);
 	it6505_remove_edid(it6505);
 }
-- 
2.56.1

