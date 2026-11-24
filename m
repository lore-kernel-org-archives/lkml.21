Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514912;
	b=FymPuY1fzOCY3qPQ53VVQ6LD8t5Wmw+SI8DQvU3V/ICxSZyidSpgUNaopweY9svom96k
	 OGwkaYr0A0EX4V3JW5wo7NU8s1+wnESVZcsiRWHYGbv1He9DDlKxDa2E1MtfrgkdE8+BZ
	 cUJhWm9hqoQQCDzcHsTTHcRefD7nZF4ASs/oRk4GedXO/h1LaUXw9ibJxGGcjoQOUEHNj
	 HqZ5YH0s6SWLEX92WcRgYfuE78a3DtS0N4S3QmdhhVVy0HOEs8gR81Fk9eTxjx5h1kFgr
	 MYIZcZFVeCAkkaGqOXnveNHakOBzJV8W6Iqu5zHTXRa59QZkbN6scVsfeYjkjBv9P9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514912;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=lf3pDx5Kt0lLgKFNiiVCKVaMz/13YCk68QFJq5XO5X0=;
	b=d6xQhUXlrHR2FTXi/8QFIFXOJpvZmMF02Vcr3uyt5+T99ameIQCjnIidzXSK12bnfS7/
	 L04vrek3EhxOTx7IBeKg6rjOS2IwOu++mnSvhvt4OHC5HSW1vht29n8FNTjMes1QLsKEf
	 D4fftVHYGh6oXNyyvcq39jmhpSuRK8MVuUzfgTm4aQpCNSwSbx90ThICA9uKplttuMBXv
	 AP8hHGkLpNq+q04M7Rc5iov54PqrsDoEYPxWLHzFPguleNj1SH5PTfpqwVcg7r9NBXhOC
	 OqIXo2TFVCE/7eYDCof62kZqppLDze11+34xhfTzCvspswe0QK/mX647g5lAMyJWScw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=p4047XVX;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99E9606A6AF
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E99E9606A6AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=p4047XVX
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C9D7C4B;
	Tue, 24 Nov 2026 11:05:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795514756;
	bh=Wzm+2G7ZhTDmlnb3cHiFmM+c/LOyGBrEXeNjvVxi3GU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=p4047XVXzr5yyMPyO9rW2XsGkg2LQYBElF+y7cFNwE8kiXvjvcSEDLjUTyxWtLFx6
	 ZVWzzomfSKvhgmh0QEchZ+wyzbJ72au3cszta5QCl8BAN31YNeu6g6mD4XYk9+nhHb
	 ydZgu5AMRRNVUrNmRsnlG97rpJ1s0wOvxz6qEQME=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 24 Nov 2026 12:07:52 +0200
Subject: [PATCH v6 01/13] drm/bridge: tc358762: Clean up register defines
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
Message-Id: <20261124-tc358762-fixes-v6-1-bd38fed6460f@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2571;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=Wzm+2G7ZhTDmlnb3cHiFmM+c/LOyGBrEXeNjvVxi3GU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBrBWIW598nC87EXlcVgp2o9encD6VL1e2jkTp+T
 oZQIvk8eriJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCawViFgAKCRD6PaqMvJYe
 9RtLEACS1bwbgQ+ZHHIJONqs8v+0R8YIimdmwjmnWGVXtXewiQpxYdgPv/ZXcynTjxF7eZN/Kip
 78anjXuQd2sMCoOj/yqYOcvdvj07oqJFR0HIWg1dH1Y1MFpAH7Sf4HbTmlP53d/e/F81n5HjUvM
 VFmCC3hCfxz05ZvtS+lparTdkp5a/kUGHh70vmpBCyE3P49FmYIYWistV2S9mQz+9ouFB8nd3qe
 wm8WRwkJaznUlHEVtybHfcZd2MP3m3m5PHhzkinyc2mnM9kG1dm+ylpcBWvziiWZQ6ae54n+N0e
 ZeYGmvjZ/bgZx/LVk+6BLXdgrghfDXRmTTI2NDYxVInAV3Z5UI30HZidU/zIqBemOtThV0wsD99
 y8Diz+sP+JhZOn+NZ77Kz4zlcd27/GuqJ9thqxvwNBEriczDlvEpxZqhKJQfX4Ye4fjEImB87Hh
 ErvX/uGjuw1T2SdfgE+wq4zG3r3SgOpWUbjVwGZYj25+AzfqEfA7ZUbo/jjJP4tjiRPaHrG6YAG
 gibdDHm+bIRrU6jBlnlRX+TiMs9T0HoBqR/RezcnzVI7PW95Jgc82UqwB5CtZw9iuBV+vEY0+35
 p0gXMHS+6HKmL3FjQ7H4F7WAeE/QBhHkKgwj/2V6ljOxBXoarvRPXNn2KqPyC7KfgvwcBgBD00u
 NlvkijAd3kEjY8w==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Move the defines around and rename for clarity and consistency. No
functional change.

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358762.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 76564d5e4f69..097d2f331a16 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -28,17 +28,22 @@
 
 /* PPI layer registers */
 #define PPI_STARTPPI		0x0104 /* START control bit */
+#define PPI_STARTPPI_STARTPPI	BIT(0)
+
 #define PPI_LPTXTIMECNT		0x0114 /* LPTX timing signal */
 #define PPI_D0S_ATMR		0x0144
 #define PPI_D1S_ATMR		0x0148
 #define PPI_D0S_CLRSIPOCOUNT	0x0164 /* Assertion timer for Lane 0 */
 #define PPI_D1S_CLRSIPOCOUNT	0x0168 /* Assertion timer for Lane 1 */
-#define PPI_START_FUNCTION	1
 
 /* DSI layer registers */
 #define DSI_STARTDSI		0x0204 /* START control bit of DSI-TX */
+#define DSI_STARTDSI_STARTDSI	BIT(0)
+
 #define DSI_LANEENABLE		0x0210 /* Enables each lane */
-#define DSI_RX_START		1
+#define DSI_LANEENABLE_CLEN	BIT(0)
+#define DSI_LANEENABLE_L0EN	BIT(1)
+#define DSI_LANEENABLE_L1EN	BIT(2)
 
 /* LCDC/DPI Host Registers, based on guesswork that this matches TC358764 */
 #define LCDCTRL			0x0420 /* Video Path Control */
@@ -59,14 +64,8 @@
 /* System Controller Registers */
 #define SYSCTRL			0x0464
 
-/* System registers */
 #define LPX_PERIOD		3
 
-/* Lane enable PPI and DSI register bits */
-#define LANEENABLE_CLEN		BIT(0)
-#define LANEENABLE_L0EN		BIT(1)
-#define LANEENABLE_L1EN		BIT(2)
-
 struct tc358762 {
 	struct device *dev;
 	struct drm_bridge bridge;
@@ -117,7 +116,7 @@ static int tc358762_init(struct tc358762 *ctx)
 	u32 lcdctrl;
 
 	tc358762_write(ctx, DSI_LANEENABLE,
-		       LANEENABLE_L0EN | LANEENABLE_CLEN);
+		       DSI_LANEENABLE_L0EN | DSI_LANEENABLE_CLEN);
 	tc358762_write(ctx, PPI_D0S_CLRSIPOCOUNT, 5);
 	tc358762_write(ctx, PPI_D1S_CLRSIPOCOUNT, 5);
 	tc358762_write(ctx, PPI_D0S_ATMR, 0);
@@ -140,8 +139,8 @@ static int tc358762_init(struct tc358762 *ctx)
 	tc358762_write(ctx, SYSCTRL, 0x040f);
 	msleep(100);
 
-	tc358762_write(ctx, PPI_STARTPPI, PPI_START_FUNCTION);
-	tc358762_write(ctx, DSI_STARTDSI, DSI_RX_START);
+	tc358762_write(ctx, PPI_STARTPPI, PPI_STARTPPI_STARTPPI);
+	tc358762_write(ctx, DSI_STARTDSI, DSI_STARTDSI_STARTDSI);
 
 	msleep(100);
 

-- 
2.43.0

