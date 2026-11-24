Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514914;
	b=06WAoh75DH1YZZHBbfwIn0AKh/nY+OyMflwlNUzsGtHxLjaC7eIoiQb/JoFE/V8J+MCq
	 Zoe73ivYLZJhO5CErWw4TyloG3/EzGzuIRdV69sQDfUWhRYo575Lj1A6a86OXb91BU6Jz
	 iBktJq6x/GR37JHnAkObu5T+z+8ueR6ObsXehNjvNjjFgY7nfy9E/yHQ/vzc/smjdgqXO
	 Un8v8FEfy+I3CiUxJzjfiA9yIUzetTLmnb5VM287gCvAja9cxhcLTes2+zWMLx84a1VMJ
	 v9xE4M5hqInrqphGFpr4rX243OyQ4+7iNC7qZaY4obF4L0Z+kg/7z+JbkuQxOYVa1vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514914;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=yLmbCnIzwX/ysBFtfZMsby49iJlwe0G7SWznrkEb6+Y=;
	b=myUVl2IkOaOBUOZN0+DhWoufEe1dufAq9vMsaozZBwtte8ORdgzGX7IDbyWgEC9KZqp8
	 GHV7cMeBZwQHqAaTNbi93w4b8oo+aB+f5LY47sI//wrcta/Jyo20l0SCQj4zUmdDXAa8R
	 n8bCDee6eOfWwyTooVGBfZAS7ui1EqAF6fkZ1Ap1GOBI1lKNCor4X+3DLAXvv1CkDs+Am
	 ZujpLtl03rLaBkR6wolUWVRZAmg9Ljwv5jBeP75f65DUx/6VccZVVLJJX39Su+oC5OAzk
	 IhX1VFY/guZEc9lDckVdV6wHgu/j/WQiGkz/ouIHXcMWuhTBlF2OZr+ASP+dp89rdkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=PcAlb0O2;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B7E606A6B1
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0B7E606A6B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=PcAlb0O2
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E1D6177A;
	Tue, 24 Nov 2026 11:05:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795514759;
	bh=HjY1Jit5MOe1m04ersiQVCkKniAXMUZXAH64XmY7Abs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PcAlb0O27tqRbmRPZ56+Ejp/C7oM07zV2us53LC1Wus9Zx1y7D0hxBFQUUsActNUX
	 IgvDxEAI47dDvSxJnEKTb1rBhO5ykbkpMATJ2E0X36fgsOJw7TvxNOd2B3oTHweRxl
	 GleeH74QOv/qbL7Qdt8ZhkXep/a9Tuyz2+o5Bm4E=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 24 Nov 2026 12:07:54 +0200
Subject: [PATCH v6 03/13] drm/bridge: tc358762: Improve LCDCTRL defines
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
Message-Id: <20261124-tc358762-fixes-v6-3-bd38fed6460f@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3058;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=HjY1Jit5MOe1m04ersiQVCkKniAXMUZXAH64XmY7Abs=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBrBWIXJP/a+DGGPNC5HD3A+JkmK2F7VIYzGMgh1
 UfQw/ESwvWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCawViFwAKCRD6PaqMvJYe
 9UjyD/4tkN99svkaSNZZAT4p/kmaAP513Cm9I7xtGrDCubVhmUgX6Y5NVSPzfIVr2+iq25/gKpV
 TJLv5RzroZjhram5VgeCU/012Lx6d9ULsCu6Do5mwUXTsJTzSTTt/zkV2qF6e2d5UE9XbLAs+/d
 9KRnIsbpAz9R0ck8G1SyUtPBgmGRdNIOTRfKD/wzvzSjN3OPDqB+LWG1hOhk1AXJKIrfMO6UwgE
 UcQPN6NH1pxxCzIkLpjWgfZHYOUM2wDvHQ4dRBLYZ+0REQCJBokHnlhEhD9vI73f7M/aJsZwx4w
 vgUnOMtNF+RoQITD+FUN6iWLp9p853No/1/aRYi3Q6oedJRZfB57tBaNCGyuymaGS/7qVvPfK1i
 /8ITJmCS4386kr6ONecUFu+Ee9cGO2cgzxg6ac1HIcafNrbcVBAL3Nqfx1hw5VFQOlSQwszAqeO
 7K2sZHKcB04eotsdfsgZVgalJFkbZbGbUmnOOphZFprx3VIiTJJ7ijzsUqKc0Z3P2Hxn0KZq2Gc
 RwuJbk8soD4F2ZsNk6hWEC5HNVeD3go6O2ezFNvpkY4iIwJOOeB6/YFxAfhvkFUubZH8/0C7WE1
 M53vNtBA5d9fILVxOl90sjQCz8p4t/M040qh0B47xwnKc0563npTonEkduSDJrhWn4se4pSh3uo
 0zj53jTf3sZ8jUA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

LCDCTRL fields are quite wrong in the driver. Fix the field defines.

A few notes about the wrong fields:

LCDCTRL_VSDELAY(1) actually sets LCDCTRL_DCLK_POL
LCDCTRL_UNK6 | LCDCTRL_VTGEN actually set LCDCTRL_PXLFORM_RGB888
LCDCTRL_RGB888 actually sets LCDCTRL_DPI_EN

The total still resulted in a working display even if the defines were
quite wrong.

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358762.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 59c68432f8e1..26671dc66874 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -46,17 +46,22 @@
 #define DSI_LANEENABLE_L0EN	BIT(1)
 #define DSI_LANEENABLE_L1EN	BIT(2)
 
-/* LCDC/DPI Host Registers, based on guesswork that this matches TC358764 */
+/* LCDC/DPI Registers */
 #define LCDCTRL			0x0420 /* Video Path Control */
 #define LCDCTRL_MSF		BIT(0) /* Magic square in RGB666 */
-#define LCDCTRL_VTGEN		BIT(4)/* Use chip clock for timing */
-#define LCDCTRL_UNK6		BIT(6) /* Unknown */
-#define LCDCTRL_EVTMODE		BIT(5) /* Event mode */
-#define LCDCTRL_RGB888		BIT(8) /* RGB888 mode */
-#define LCDCTRL_HSPOL		BIT(17) /* Polarity of HSYNC signal */
-#define LCDCTRL_DEPOL		BIT(18) /* Polarity of DE signal */
-#define LCDCTRL_VSPOL		BIT(19) /* Polarity of VSYNC signal */
-#define LCDCTRL_VSDELAY(v)	(((v) & 0xfff) << 20) /* VSYNC delay */
+#define LCDCTRL_VTGEN		BIT(1) /* Use chip clock for timing */
+#define LCDCTRL_PXLFORM		GENMASK_U32(6, 4)
+#define LCDCTRL_PXLFORM_RGB666		0	/* x:R:G:B 6:8:8:8 */
+#define LCDCTRL_PXLFORM_RGB666_24	1	/* x:R:x:G:x:B 2:6:2:6:2:6 */
+#define LCDCTRL_PXLFORM_RGB565		2	/* x:R:G:B 8:5:6:5 */
+#define LCDCTRL_PXLFORM_RGB565_1	3	/* x:R:x:G:x:B 3:5:2:6:3:5 */
+#define LCDCTRL_PXLFORM_RGB565_2	4	/* x:R:x:G:x:B:x 2:5:3:6:2:5:1 */
+#define LCDCTRL_PXLFORM_RGB888		5	/* R:G:B 8:8:8 */
+#define LCDCTRL_DPI_EN		BIT(8)
+#define LCDCTRL_HSYNC_POL	BIT(17) /* Polarity of HSYNC signal */
+#define LCDCTRL_DE_POL		BIT(18) /* Polarity of DE signal */
+#define LCDCTRL_VSYNC_POL	BIT(19) /* Polarity of VSYNC signal */
+#define LCDCTRL_DCLK_POL	BIT(20) /* Polarity of pixel clock */
 
 /* SPI Master Registers */
 #define SPICMR			0x0450
@@ -139,14 +144,16 @@ static int tc358762_init(struct tc358762 *ctx)
 
 	tc358762_write(ctx, SPICMR, 0x00);
 
-	lcdctrl = LCDCTRL_VSDELAY(1) | LCDCTRL_RGB888 |
-		  LCDCTRL_UNK6 | LCDCTRL_VTGEN;
+	lcdctrl = FIELD_PREP(LCDCTRL_PXLFORM, LCDCTRL_PXLFORM_RGB888) |
+		  LCDCTRL_DPI_EN;
+
+	lcdctrl |= LCDCTRL_DCLK_POL;
 
 	if (ctx->mode.flags & DRM_MODE_FLAG_NHSYNC)
-		lcdctrl |= LCDCTRL_HSPOL;
+		lcdctrl |= LCDCTRL_HSYNC_POL;
 
 	if (ctx->mode.flags & DRM_MODE_FLAG_NVSYNC)
-		lcdctrl |= LCDCTRL_VSPOL;
+		lcdctrl |= LCDCTRL_VSYNC_POL;
 
 	tc358762_write(ctx, LCDCTRL, lcdctrl);
 

-- 
2.43.0

