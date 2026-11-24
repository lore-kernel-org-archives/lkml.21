Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514918;
	b=wPJ6svYm4p5nF6kF1nApwGzCNFK3onI0x/vYmhye63fa4pVsbL48Jj8M9/eh5XOzmfCf
	 5RZkCkq5B8MSZr/rNZ0viWDicm1V4YipTf1BXklqLzusUNgsen1TnDhvMTysZ2P0NpYsV
	 tAuKkYVPB2/dw7n0nBr62JCXxffs6Fd3vUt4yypujrqRuP5P92YsDIDa6XUM8IV/a2LAI
	 eOsQCL1H+boPZsywCHtP4ra1cnqOyqBndAvYQ2564WW55Wn6qrQw09Rx1ogyADQ2oCW7A
	 T5f7iRjXeRlkqyuXjrY+7+sgwOVk+DiWcaGhjmaHddLOUkWHzu+GK+Ze/wshlarkdUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514918;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=2MYIYUSFIxWgBZ0dn1odR2ZDSbTa3g/YgNpBPROubVc=;
	b=Qd+ArN9miENSOmJWeE+tGNzcKIoOK6FOE3kNndnY5mw86/mE0L3Tvn1sigToUoWsv+6y
	 URw2WWjfk1sN3gsjHDQzM4E+Rtu3kR4X1dX7g0Jz2LXV5tTckxzC3NjSMxigwi2qg8cKT
	 MHK322Q/jnq3Lf+1lHIkNFQEHB3oVB37IJD+acvT/PAmhLUmv2sXxsXQXy/ig1kr9ohUS
	 xYVG3utU6lyopRW7pplE1TZnNbX56QwRmz5CY/dgYv3Eq+xmizPesE5/4hq+t3HaHix8u
	 CZDrKK5dFWbH7pf0Gkav2qNraM5yC2rAzkRBPIA4JTn9ic5tMyEsicTHuJckxrTKviw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=SxtcvOkv;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191F060A260E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 191F060A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=SxtcvOkv
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 438DE1D0A;
	Tue, 24 Nov 2026 11:06:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795514761;
	bh=ltZBsbuuLUgLruugJggBgV13oqzFIQW+pA1XxlBJnRI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SxtcvOkve28bs3tsVAdkcKTPqn4J6dd+mr5psdT3aAQPEHip4GV9hLsc+KY1MQM8H
	 tJxdIE07M3TVYECDzKETvdZuIPo6GQGKuRnidKX0YcyMbHmV2++hjXEyaQzmIbEw6g
	 G8z9RBcdYm34Kdl+sD+bVMO9lqlFCpz7V/XkpwDI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 24 Nov 2026 12:07:56 +0200
Subject: [PATCH v6 05/13] drm/bridge: tc358762: Drop SPICMR write
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
Message-Id: <20261124-tc358762-fixes-v6-5-bd38fed6460f@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=959;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=ltZBsbuuLUgLruugJggBgV13oqzFIQW+pA1XxlBJnRI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBrBWIXOUyPoe9xQIjhc5ZTtJRvuBcvt9j+licSc
 uFW5ITGyGaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCawViFwAKCRD6PaqMvJYe
 9RFTEACX0Gl+X5BHPetvJp4/9G/Qw/OKrXJ0FwiQO+wTv6LpepuFZm9mmnuW31JhB4ukRif7yce
 jaMtHhS9lYUrGN3bZBJ3JBdrAxV3swPTWY2ym6GXMf0pGSEBBU4fAK3Oy97LPwtAGqixZ4yNErV
 UzfNXy98sjNwQEOrQ5n600Nx9aJk+pvx8H1dLMJe+LjThYq9OrHAnsFAqu01zOCfZNMxW7nFov9
 jeuqQkLMOGjnyi230cX/af0RuBzzflmr+UME7/I8mshFiAKDJKEpcYsHpLptOMZD4kJiZlxKTJw
 cvqGY2Z7VuLJbfGP0QPOnvLIYdzDZc+bMhLIQxZJjeIJJcpUCnmxEfa03ioAKDRBwVNoiCppc9L
 bSS2XyqlAjsK9PoTlAb7ZgaOKhr6SoBsXnq+P4e5n/p7hxJxB1+IB5/VdbsDjhc+SFrUjLKneqz
 t2qzqJOMXdYjImwxExNeOlxQdvJgvremBuaz6S+MdwapdcQwnJcyJljJrLGcOnKukMMq2rwm2qC
 g98L7sxhlXUdT+j1y3ybHX7eBhmCsh4jfefVVxRLHJfAZFH+B8b50oX1wZXbl/D7H6unw9jzXes
 aG+GKkBudAOhFQ0MbI9dpQ59p/Cvog6jxBKkKOvdfU9DBWWOrKXQ19OQBXajUV4wiDvsxDn30qJ
 aGO7yKpnWi9n2fw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Drop write to SPICMR. It's unclear why the write is there, as SPI is not
supported in the driver, and it's mostly just writing zeroes to already
zero fields (reset defaults). None of the zero bits written disable
anything wrt. SPI.

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358762.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index f5ee781275fc..91bc79d36a74 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -149,8 +149,6 @@ static int tc358762_init(struct tc358762 *ctx)
 	tc358762_write(ctx, PPI_D1S_ATMR, 0);
 	tc358762_write(ctx, PPI_LPTXTIMECNT, LPX_PERIOD);
 
-	tc358762_write(ctx, SPICMR, 0x00);
-
 	lcdctrl = FIELD_PREP(LCDCTRL_PXLFORM, LCDCTRL_PXLFORM_RGB888) |
 		  LCDCTRL_DPI_EN;
 

-- 
2.43.0

