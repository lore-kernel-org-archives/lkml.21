Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514920;
	b=baxnTnqbgRwTaJ+ahbYx5k2DTUF+0ZRDICvxJNyvOSd9CtC+d2VMR+lnXt84dM9aC/Tm
	 awhgvqZ6l2gP9OGTL4/1Wvfe3AMCRv26bJOuGIogPmZorzQuvpDM4aDUN26Z4vD7xqDLm
	 wGSy17LugmisD2Dtl0beljAuXNukG2IkFg2JaQyBlAeZ7i4JD2CCKwHGfM7aya2IJpzya
	 p6/MUjZ+K9oD/SLLKB6ciJ2pDUSb7rmf0BCVRtjWGZVR7GFxfgOjeRHuYWXd7B9XzBqQw
	 fq9FOdLxszO00UJoaQmgs4VQcgPjp7Vj0wMMu61HP4Rho/FbJGI1IjJ8Fqi4O8XKxVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514920;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=mN6eejifKpzjqwhKjRr7PX8rB3PHI8F7ntoUHmZRDZs=;
	b=dGLk1mwrGSgrAt4eRpE1FtmnTciI7+t5azRkxO0/EJOJo5YCMQ+3Nn7YNMU5WYzMRIOU
	 HjE+5Bamko3Qy1ddB+2R6tR2hxDQu9hOogwWmPkEYu4Fj7DA4G03fVwaUmxohsv+NbV5i
	 1e2notlspVPlozeCvnoFXv7xCJvV+XvU1sP5MxgdbOrntVhMaOiScFRBG04VED1m75jVG
	 E2sX6/c9XXlOLzXlQ8vGgi//SHqSXaSdFicG5xEKelpPfQx4SeGzLul76iAEiEX1kLUGJ
	 8xAju4Vl+Zz+x43plBOA9BJq9q4dWd34kpujTLJJJblEuJ/lIcGECYv3zQObEFhRy/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=cxjL4YKb;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028AC60A261C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 028AC60A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=cxjL4YKb
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 573E22082;
	Tue, 24 Nov 2026 11:06:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795514763;
	bh=CWUq5Ef6O4fjXDdCF7Z4ZeT2vzhvSq1EHxE/RYS8yjU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cxjL4YKbm+4dtJncrjg38BQ3KJi0Nkf3M6W8P3OaNEe8aToFp5NFNPf2/pPaJIua1
	 YxV4IbAq4+0oqQpyEsmd1xbHIpolfApGgorrSQRvATnCjj9iUIB+2y1oI2aRZU4I8l
	 T8w39XF6po5XtSFIDDDEJFgS7+DN8PMngGTYZaMs=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 24 Nov 2026 12:07:58 +0200
Subject: [PATCH v6 07/13] drm/bridge: tc358762: Update comment about the
 number of lanes
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
Message-Id: <20261124-tc358762-fixes-v6-7-bd38fed6460f@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1174;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=CWUq5Ef6O4fjXDdCF7Z4ZeT2vzhvSq1EHxE/RYS8yjU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBrBWIY3UoKmHpQgw3Fd98/qRtiPO+lNbIa+5gqH
 HDlXQ4n2TyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCawViGAAKCRD6PaqMvJYe
 9c4lEACWNqgtEDX1g0+jTdJ1U8GsriiNiXaxOpvVYSWicwZQlFwc8nzTOVKebMe8WGu5nLP1s53
 zmGyLTnsbtNRbaTwYi9pNqR8BTluGNxhCEgsiQV1w0+A/yuoENw6RRut4NnLbJr3YNzdIy2x+Eb
 aQQ/UAnhY5S6oy/aEXA1uTrGfnDkDmrNxueM/KmOssCePYYufvFEGBnf8kePUxY1aP7d3446GAf
 EBYbg77Q01IuWunojrQEwg+tp6uqmX1tTn7m51hQ2cQq0QvfttL/tuVdUvBsKV004RCbMAVqZ5S
 Eqe9jexN4QHrEADr52UFMpftKshM/Ii7MByNAs7zI0lPPj2rgKSVXKkhbAyVhkCTtdkEkKif7Zc
 feyB+uc+ze7dYP7t3C3AGgSag1rT3scD27A/6ahvjn+FEsnVAadBPHAUtIAKwJK0Son1BqAhSmX
 urc+q3vfZ0b1DR6eYCJUMSHWG/aOfpE/tE75ENY094H73DMA7nLVDkvQJ17MD+QtVLzMferKyvR
 605CY7Rv8K60cyxFG2fMG0BhUi7LuwrMwDUygiou8GT821hJ5oNNJLnDUkLrZ6IGdqhr1SWlWov
 TsQRcNW4ROaIa19hOuOoNlve4VCboPJ9o/I1OwfBtXCnADaBn7nEDtEHMmxdpKhx0mpaUwuTE7s
 qPFcoz0SjOwnJNQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Update comment about the number of lanes.

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358762.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 0933fc974a7c..59323f26b2d2 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -309,7 +309,14 @@ static int tc358762_probe(struct mipi_dsi_device *dsi)
 	ctx->dev = dev;
 	ctx->pre_enabled = false;
 
-	/* TODO: Find out how to get dual-lane mode working */
+	/*
+	 * When using DSI clk for pixel clock (only mode supported in the driver),
+	 * the pclk is derived directly from the DSI byteclk via simple divider,
+	 * which is either 2 or 3.
+	 * The required divider can be calculated with bitspp / 8 / nlanes. Thus,
+	 * for RGB888, only nlanes = 1 works as nlanes = 2 would require divider
+	 * of 1.5.
+	 */
 	dsi->lanes = 1;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |

-- 
2.43.0

