Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514928;
	b=ZcwSIpKjOUVhdFfK8tzVC/ySBC6H1Ljeh0lOAOpdvYeDYnfpGAyv9m1mU66NdVbWR0VV
	 F2MJ0Gknuw8j4MtspGDqEgpsT8sA2EmvUbh9RmJ2DYrzsi8vSZjjbUJKKijNWaGVnrheS
	 sTO1xMi4Ko0hdGJI+PV9Wm1IZbK8foOyEvlso6oPvgOjf8yXrOBtgLCVlsSgEO0h1N5Hq
	 Z8Gmw4sD6f1wMpJONxdpI1OAbfvGhABZB6MYSy3hJ/LNgWTFMOgzdnTzlirSzII3gJ5ZM
	 NKOsLFf0wXfxeFYdXNQD8a4JDAwFrYUeGgArEtQoe9J8kuARmVNFpqtg6tZIotHcbrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514928;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=oB8ZAsSRTz/5ke/9FdlTKwmNzkDcpACTPXrDshhX8EM=;
	b=FrSDM5Erhdre3kj5un9sTQcB24yBg8IBef+cWAceYjhS8sRRhdPch4w7MLWc96HU2kVM
	 KN0OX3H2Iz+Mt5gMKfdCtZsGJFVvTSI6wW7PzrEy/Vwun8bryVLd1SlOIlMDiCKnPS8BM
	 DDhvLXeSiZ/n+gUoumXlkxXoUu/iXig0v4+YBGLlelCcr43r3giTTe0igykvvMxEeIt4Z
	 Jf0pZuUJub5Q1yi8TZdF8R59yfii12SzwT/x9n8eRVE97gh48bC7joRjyI4ByUJ4zX/+s
	 doWWmGr4u7q+8i9Z+ov2BLmEqJV/jtFCL+SCtDTKdNVUk3jwQMreAQo+qkt4RqllwxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=dozl7ZWe;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF6060A2617
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BF6060A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=dozl7ZWe
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B45172336;
	Tue, 24 Nov 2026 11:06:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795514769;
	bh=4x/nDGiS+SvkZO2uIXuVfjSAzrKF37lywGFnV+U5Yao=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dozl7ZWeQsl7k9CdZPTzMCnUjr4uEsjSGeGQRynccsFfIZ9INb84Kh7HlrRZsDvtj
	 hRU2DXfTUb/jOmTN1/eulUKRSh6+9YFVFH3hrBttaIDLUgNDQGuSHxumRj06Gd46M4
	 30aafyvBbMS9gwi7kYLrk6viFC6ViP7/MTz2QDkg=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 24 Nov 2026 12:08:04 +0200
Subject: [PATCH v6 13/13] drm/panel-simple: Fix powertip,ph800480t013-idf02
 timings
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
Message-Id: <20261124-tc358762-fixes-v6-13-bd38fed6460f@ideasonboard.com>
References: <20261124-tc358762-fixes-v6-0-bd38fed6460f@ideasonboard.com>
In-Reply-To: <20261124-tc358762-fixes-v6-0-bd38fed6460f@ideasonboard.com>
To: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andreas Kemnade <andreas@kemnade.info>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2487;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=4x/nDGiS+SvkZO2uIXuVfjSAzrKF37lywGFnV+U5Yao=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBrBWIaXZmfgXk/4mcMWllcamiG6gtK3iw/6hTCG
 MliVYSB7pOJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCawViGgAKCRD6PaqMvJYe
 9fF2EACfrkqM4xXlvlOlSp9FKYWvXSTnvZMGXLWPwil/FX8IDIxgaYT7Tk02HtsEaMMMgfrvuIv
 GgIKYBVSQbY1mysvitREbJkToLopi1XJ0reRWj2/tT/jG89aqe3mpoxk3LPQm+5pux0+e6dFwHN
 hz62e0GUB7DngG9olIyihfJ8AAuyRYK4EuWuElOSP72OjHsF/+u/Ai5NpiiymMWqi8d3KA/9Yqf
 cXXuwH4JX78ClZNSsVMyIa2QQuBKPcCslkEFZ3gAlGrSfODKT87km2MyihkmzdKgxa+AQ+iuYPi
 QLRDo3BO2x52wZ56TrfZxJzEVp4I+GNazFxvmQ8lXQyfhYndcQxRC9TbYyaNzy6h3m4CYN42DO3
 Nn+9imybm/mR5IIOyih/cCzew8ZlV2Lwm+zIE9a9g1qRsfMxi025Gj8+F424HTLRHnXT/ksUVnn
 RBZGUeVny3NewszO3lmk6NL8kOuu2X8bzUsWkDP25D8EDcTALZcOruIsaB9bDxrZtEnMF2GT7Zl
 UKMg7UaO12+rqcR/EhTU9433CUxOuiT9tsT56lBl7pE2GN90dY7vkyP4RqOMpV1PvsmvMVbJWUg
 WvZ1vB5zMRw1TOBL3NTJdhIy9OHBwvBKvs76zQXwS0JbpkV8yCqUibm0zmKO/GtU81YxqSAT/0B
 S54BQorpK6Sfzsg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The powertip,ph800480t013-idf02 panel was added to panel-simple, and
with the tc358762 driver, enabled the use of RaspberryPi 7" DSI display.

I have been testing the RaspberryPi 7" DSI display module with TI's
BeagleY-AI, and I can't get a good image with the current panel timings.

It's been quite difficult to figure out exactly what are the issues.
Possibly RPi DSI TX and TI DSI TX have their own quirks which affect
this also. However, now that the tc358762 driver has been fixed wrt. the
signal timings it sends, this patch makes the panel work fine on
BeagleY-AI.

Fix the timings according to the datasheet:

- hsw + hbp must equal to 46. This was correct in the timings, but the
  hsw was very tight, and at least Cadence DSI has trouble with such
  short hsync. Increase hsw to the middle of the hsw range from the
  datasheet, and decrease hbp accordingly.
- vsw + vbp must equal to 23. This was 24, resulting in slight shift in
  the image.
- The upstream timings seemed to aim for 50 fps, but this is a normal 60
  fps panel, so adjust the timings to get 60 fps. As there's no strict
  rule what numbers to pick here, I used the "typical" values from panel
  datasheet for pclk, hfp and vfp. However, vfp of 23 instead of the
  datasheet's 22 give us a closer match to 60 fps, so I used that.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index bf2e1dd88f40..ecef52ec2985 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4216,15 +4216,15 @@ static const struct panel_desc powertip_ph128800t006_zhc01 = {
 };
 
 static const struct drm_display_mode powertip_ph800480t013_idf02_mode = {
-	.clock = 24750,
+	.clock = 33333,
 	.hdisplay = 800,
-	.hsync_start = 800 + 54,
-	.hsync_end = 800 + 54 + 2,
-	.htotal = 800 + 54 + 2 + 44,
+	.hsync_start = 800 + 210,
+	.hsync_end = 800 + 210 + 20,
+	.htotal = 800 + 210 + 20 + 26,
 	.vdisplay = 480,
-	.vsync_start = 480 + 49,
-	.vsync_end = 480 + 49 + 2,
-	.vtotal = 480 + 49 + 2 + 22,
+	.vsync_start = 480 + 23,
+	.vsync_end = 480 + 23 + 2,
+	.vtotal = 480 + 23 + 2 + 21,
 	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
 };
 

-- 
2.43.0

