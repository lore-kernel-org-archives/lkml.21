Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133128;
	b=WC3U9MtbbQDPGJnzZdT11vsQkXMxVWtGHpMuoL7dJCClOf5UncEupXR+aySfjTbErmHz
	 JP+qQ1l59GKviiewqAN+FwavRyo9hraOTnWfOXciJnbABzAY7NETFJpMtH2ZvxFkjI/Ed
	 4iFmH7YudZxTaeo44uA+PtlGN8GFZTc2sRF70RUjk8xWzaPjwuza9VpNsjW2va49ZC1y1
	 0OPzmFZvoIUQI8j4jFOg0NOo0HWH2BQkRnFhHFioc/haU+PKu+VCPL1tjyjwCzVnC1u/O
	 r1qZ5J8AKYg7RQ9lrPH9WFC/Vz7BEMg5stdL6x67wCnKy5n3GxZfx5F9nJo/vZmYMtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133128;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=cXyCG700Zn8B/A3AKY60YijbmL+VK+ke6En77/mukFw=;
	b=uevebwHRUODUt9FDiexIdHaF+FS+4ku2lobZXS2SSW3vZV5fcW3gGogHfi4zlS1Thp42
	 +8UIK6lObQ6z/wwmYVCuPMQ8SlWykFsuMePfA2TcaJxRENwaamEn1DT079FkMohvpckRL
	 cLCONN9nHINBxjRY6SYRAYLTwalZJC5eUtvuPvQ/oYOPtOr7q4j4/Dtzp9WmNgoi+G2aW
	 bXJSqI2JnVgC1lWFrIa0ocuy8zmQdoQSXhEAk5YLAJGc5nGyK5154S6ZVNM0a4dnndC0r
	 v5dMDfdiqwC/FcuBGf10/hAMLizUjQUC2WG8aydyhnht2uq/ESEXZb9u/9flMbDBLmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BCE606A331
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9BCE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUC82-000000002Cw-1vkk;
	Fri, 20 Nov 2026 00:05:22 +0000
Date: Fri, 20 Nov 2026 00:05:13 +0000
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
Subject: [PATCH v9 11/14] drm/bridge: it6505: reject a too short
 link-frequencies property
Message-ID: <8637b7d008dbeb04ebcda1e6ff18260187ba1089.1795132452.git.daniel@makrotopia.org>
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

of_property_read_variable_u64_array() is asked for a minimum array
size of zero, so a link-frequencies property shorter than one u64 --
a 32-bit value written by mistake, say -- returns 0 without storing
anything. it6505_parse_dt() reads that as success and derives
max_dpi_pixel_clock from an uninitialised stack variable. Ask for one
element so a short property lands in the existing error path.

Fixes: 380d920b582d ("drm/bridge: add it6505 driver to read data-lanes and link-frequencies from dt")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> # Steelix Chromebook
---
 drivers/gpu/drm/bridge/ite-it6505.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index e271ca625a393..7737e6ecc4bda 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3405,7 +3405,7 @@ static void it6505_parse_dt(struct it6505 *it6505)
 	if (ep) {
 		len = of_property_read_variable_u64_array(ep,
 							  "link-frequencies",
-							  &link_frequencies, 0,
+							  &link_frequencies, 1,
 							  1);
 		if (len >= 0) {
 			do_div(link_frequencies, 1000);
-- 
2.56.1

