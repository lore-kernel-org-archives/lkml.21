Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514924;
	b=oV6Nl+6lXNVjsYZavw/cDWpaFxpO/CQoY0pRod0AnYR28gXoZx/Z6uZ44f75eHqM9l3H
	 Wmpkzr84oOimCCnLjgm19nPz1YYEf6v+5Lw9TCPxdbu7Wy3elaPM8Mld4sVJVrbnH6H3f
	 NRFuZbEWL3/K1lZJEcIm0wFTp/HP9jXaZOzELOAd0DQNn6rJL1xh9XfpZEiMqkDF1qzlJ
	 Yv5H03/3/7IqhxN1AqF/6VAOABguA88hOFHujpeR2bTmRVTi0F48K1Ihf5L7rcW5lYWiX
	 yKby51t65aD99xfSelYFcCsGqRCVdFDQE85di7ncOduKmZYT6A/kpj/AuYChkqizN5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514924;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=fxbAA9omveLUdsHjqm0zsiPPYigRMTG9X0Txg4vbd6A=;
	b=Rwq5WJTQpMUec6Wgah0MV47yJO3m483GaMDKvDhExW7/Rq9RoFbvfGbMEttDderlz9kT
	 Akzp07r287m3/iI8PUvbNehIx7HO2DBewgahINK9oi2GcGCj/kSml4FDZHC6xqJUyVXfh
	 vINJvmn48lkhaXHb1Bs84jc5ASZL+g9ZWYY1n2iysVbAfV2CIQl0uVfQbUHueu/n+ykgd
	 pw+0Ucsrm6FIu5OECNQn/yGvtgrmY+dTus7fsilNzimSyHxLFmRnCJKYeCrTneQ8tdDxS
	 PB6JnSNLtyU8/MfEgsCiDgDC5WG86uqIT2HsfaLSJyK/F9u9lvzcbw+6pOWfFMRH9kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=FGHaRu2I;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92DD60A260B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D92DD60A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=FGHaRu2I
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 817D52169;
	Tue, 24 Nov 2026 11:06:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795514766;
	bh=AeSF9xATr/aXA7bcXDEkH7i4BWR+sahH7VjgB+rcbLg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FGHaRu2IlLnWYGxHCPT/vAQiE11Izi+p+zbeMUT+aovQtLGlqpGiUYTdcgTW4W0Lc
	 K30rNxEa6RZ0dVq2m82us+14PH4WFcZ191iP3Oq7Asbj1xfxEb9OnJCV6SiQGp60+G
	 shcDFkffz5nHsj8eQAl9UxoGtBlKxtXROOq18ntI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 24 Nov 2026 12:08:01 +0200
Subject: [PATCH v6 10/13] drm/bridge: tc358762: Move tc358762_init() into
 tc358762_enable()
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
Message-Id: <20261124-tc358762-fixes-v6-10-bd38fed6460f@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4059;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=AeSF9xATr/aXA7bcXDEkH7i4BWR+sahH7VjgB+rcbLg=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBrBWIZK+YCxMX/+g7GbaSd2TIb95J1BLB+iTHNK
 aUFVLer6DSJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCawViGQAKCRD6PaqMvJYe
 9TXWD/kBkPRtYBJIDLeOshENfyWJgRIoRlwaeNcw8gcL9xeLLluUsJW+ceGDU0Hcc7C658ZenGX
 9pgigh7nGY7WYHEpzqU/z2BJQw5RKpkDHL+9pB3V07EJ7Z3Rxonve/ONx4Dipm98l+yFrvW8yGI
 dcpSu6eVC5uiDpiLWSsjfF/AwrWkYOvFEPgyLC2KRjv7ssH5MK0EaAiAzN1TOUGY984kpYWgawI
 JDL5MalEFLlcntpJMHRSKU2GGPmgIpp8Shs2USVzjOSo/+gB6Vnio/kDpKZAL1XtuTxN6JFuwzL
 R9CyBUuWOl8HZQG0d9MZ1I0rluO9gnajuZknkogXFCWibspRDuT0NYO8hzqJnkhNEBa0dKEiNtK
 Di5eyJA2tvXlf3wcC55nqsgXCm3uonA5JUg2c3ttel4Lb3v0lP53SWcl2d0a9UFsecHmG38hEHZ
 1lLQptM3VXf0nDH4Zbfm5k20Mwy2mpBw4AtluYBlvVqLtWkKx5DW42BfmFIDvfwh/+q+vRlN/hd
 oECF4YdyKgaPWb32UigUSbvJenlDwsc0ax/6V/tRQjJbA9R7sCXhyN5lR8/4QAaNhi/W0/y8S92
 mbh5ukE7jF4wFNCBeHHKlW4BFVU/omppC27FhZmoJa+BSaqvXGkwaEUKloyX3QWRvehb/HlYtqc
 ChImxFjWXl3Q0fQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The only thing tc358762_enable() does is call tc358762_init(). Inline
the tc358762_init() into tc358762_enable(), for simplicity and to make
it easier to improve the tc358762_enable() in the following commits. No
functional change.

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358762.c | 110 ++++++++++++++++++--------------------
 1 file changed, 52 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 7a2658933216..85a0314f16c2 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -138,9 +138,60 @@ static inline struct tc358762 *bridge_to_tc358762(struct drm_bridge *bridge)
 	return container_of(bridge, struct tc358762, bridge);
 }
 
-static int tc358762_init(struct tc358762 *ctx)
+static void tc358762_post_disable(struct drm_bridge *bridge,
+				  struct drm_atomic_commit *state)
+{
+	struct tc358762 *ctx = bridge_to_tc358762(bridge);
+	int ret;
+
+	/*
+	 * The post_disable hook might be called multiple times.
+	 * We want to avoid regulator imbalance below.
+	 */
+	if (!ctx->pre_enabled)
+		return;
+
+	ctx->pre_enabled = false;
+
+	/* Turn off the DPI output */
+	tc358762_write(ctx, LCDCTRL, 0);
+
+	ret = tc358762_clear_error(ctx);
+	if (ret < 0)
+		dev_err(ctx->dev, "error disabling DPI output (%d)\n", ret);
+
+	if (ctx->reset_gpio)
+		gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+
+	ret = regulator_disable(ctx->regulator);
+	if (ret < 0)
+		dev_err(ctx->dev, "error disabling regulators (%d)\n", ret);
+}
+
+static void tc358762_pre_enable(struct drm_bridge *bridge,
+				struct drm_atomic_commit *state)
 {
+	struct tc358762 *ctx = bridge_to_tc358762(bridge);
+	int ret;
+
+	ret = regulator_enable(ctx->regulator);
+	if (ret < 0)
+		dev_err(ctx->dev, "error enabling regulators (%d)\n", ret);
+
+	if (ctx->reset_gpio) {
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		usleep_range(5000, 10000);
+	}
+
+	ctx->pre_enabled = true;
+}
+
+static void tc358762_enable(struct drm_bridge *bridge,
+			    struct drm_atomic_commit *state)
+{
+	struct tc358762 *ctx = bridge_to_tc358762(bridge);
 	u32 lcdctrl;
+	int ret;
 
 	/*
 	 * DPIENABLE has reset default of 1. Make sure we don't output on
@@ -203,64 +254,7 @@ static int tc358762_init(struct tc358762 *ctx)
 
 	msleep(100);
 
-	return tc358762_clear_error(ctx);
-}
-
-static void tc358762_post_disable(struct drm_bridge *bridge,
-				  struct drm_atomic_commit *state)
-{
-	struct tc358762 *ctx = bridge_to_tc358762(bridge);
-	int ret;
-
-	/*
-	 * The post_disable hook might be called multiple times.
-	 * We want to avoid regulator imbalance below.
-	 */
-	if (!ctx->pre_enabled)
-		return;
-
-	ctx->pre_enabled = false;
-
-	/* Turn off the DPI output */
-	tc358762_write(ctx, LCDCTRL, 0);
-
 	ret = tc358762_clear_error(ctx);
-	if (ret < 0)
-		dev_err(ctx->dev, "error disabling DPI output (%d)\n", ret);
-
-	if (ctx->reset_gpio)
-		gpiod_set_value_cansleep(ctx->reset_gpio, 0);
-
-	ret = regulator_disable(ctx->regulator);
-	if (ret < 0)
-		dev_err(ctx->dev, "error disabling regulators (%d)\n", ret);
-}
-
-static void tc358762_pre_enable(struct drm_bridge *bridge,
-				struct drm_atomic_commit *state)
-{
-	struct tc358762 *ctx = bridge_to_tc358762(bridge);
-	int ret;
-
-	ret = regulator_enable(ctx->regulator);
-	if (ret < 0)
-		dev_err(ctx->dev, "error enabling regulators (%d)\n", ret);
-
-	if (ctx->reset_gpio) {
-		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
-		usleep_range(5000, 10000);
-	}
-
-	ctx->pre_enabled = true;
-}
-
-static void tc358762_enable(struct drm_bridge *bridge,
-			    struct drm_atomic_commit *state)
-{
-	struct tc358762 *ctx = bridge_to_tc358762(bridge);
-	int ret;
-
-	ret = tc358762_init(ctx);
 	if (ret < 0)
 		dev_err(ctx->dev, "error initializing bridge (%d)\n", ret);
 }

-- 
2.43.0

