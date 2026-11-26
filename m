Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795653199;
	b=lyvX52Azx+fL/2/hYGesS8qSmwwWSIyLkXqg0oHp4lwfzBB6CvUoZH3uYslTsIrYpJOz
	 GJ9CG/un1AgvcxysDLw6w+62RFdP8N2sHvsWJwHdOItmlZMXhTN20/ZCQd55iIxTZTIH5
	 leBFtEX9xemHgI+6rBxNwbjgb/eheaD7YQsZi1MvIlRP3USeT/uDncQB1gqpWwDIvc0jU
	 b4YMC5UAA+3M+SYQMlQWu/yIaWPwCDkJciOzO9wv9NBDbkA2rhL8nSwKK/P4zT/DHOmi2
	 dR8fW/lRMK96GDkldQ9v7sXrEqYp09Vjjg9mgRAUWhlHpe6PfY2i2yieaF5L9PcBaLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653199;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=XKO1A7l/UzAx1PvR/i1+cXwRXwIwmnNN/v1HN2cfFf0=;
	b=EAxWWiJ9AaOGIRj6SeGWIhFdDRn+rIEs0OP5TjM0BzFkt+WsVKlZNcZU3pnFy+uxk8yf
	 R30+mHSsrD4DeyIWQPTTXYjenpH5E6vw4uVYU894sg+g7qFzivfWPASP1jwnTq6BSSy2s
	 pRdIbNQxsCyA3IdMu88hGbidYybGLSfOFuUHt/JV8+BL8EsYk5ZMOsL8L236OwSXmg1Mn
	 lc7sJcYQahMIRJiNI8/wzxVojhdB2MLwt4oAlWAgRzwx3Hl2yx6fibanglQX7g5btPM/+
	 rWRMGAhF/kYnntKA8BKgE/mzFbazo6NMRIuiXhYkEKgFGg+ezYRn0+RVFIZg8nREXrA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C+vq4J0G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB39606A337
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C+vq4J0G
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795653199;
	b=rrjDfoaYGP3LtecrsEX6l2RmtpUguk8xxCpCs5+Qk1IF45g685D9Fa1/fUs8cguoYsav
	 drv8uDv4Rr1pdUZBf8kski7RhYAPJsiMRoR/GaDIkD+an7ax183R0C3+VqmURzPwFL8lo
	 KfGOvmbovi04S55AO1hKIFb1eX4pA5Hou4E/uuQNRcqgoemLV7R+QvTsEg2xHQe/HNEoO
	 WH7mblpa/YmiqTYLYAxntJJwSb8t+5VN9HzFE5aeD+CI4msZRZOGZT37YlMrRKLTm5gPZ
	 AF5gjgTzYj5D9L6p55ZrA/939pHVhmtxVqch3az6nD0E/mmOtAMwVs0zOFOE5+akMUw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795653199;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=XKO1A7l/UzAx1PvR/i1+cXwRXwIwmnNN/v1HN2cfFf0=;
	b=2MiPQdssy+RwseH8oCuHDQUjHBOM4xdTH90E7JykhsaiGvDDfQOJpmyyO7kR0wetH35t
	 Z4jepM0QkKkY3DxJgE3ZSyhsLlxJRT32VR/byuT7yu1aXu5afL/kjOH2aJgwXzPxASBf0
	 NGjnF9oIJ6bDLOU5EJpXwICI2+uAnwCXuhRbGsMebH9f3ywN5FifpJFyLf98u57dQJt2a
	 l0UIfsnWT6IRoX150LI3CtDYJUfgs37HVEE+SjRxvAYNHOFDNFJPJ6gqct2Lgi3mjT8ZR
	 JIGH+liK0fqGeo09rAhcxdR6/6oa2Jm59EXT5/s9OB+aBv2r2NwslpV3+4nASZLPoLw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 534E11F000CA;
	Thu, 26 Nov 2026 00:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653199;
	bh=XKO1A7l/UzAx1PvR/i1+cXwRXwIwmnNN/v1HN2cfFf0=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=C+vq4J0GO3OKlvCUWfjrfJ4ujgbNNop9lC2jvTUeHeU3t2G4esLCz/E27c/n6DLW6
	 HVbFAGkY3aaCG77bomZRISXMOsVyvdn+GvL0co1hoVi3IUtWoWOrq9jlUXVhNEaaFX
	 NqtsqA9cidgeHx33yWbb4inQF6GJM6ueoe5H8gMM8mAfcRFlzBiIxHmidOFRsPuvRH
	 L4YkGmCO8KmRyY6sODY4h4zmWo9Hs8zku2oIXOfEIYxXNmo238I7eU0CuvDz9KMQDa
	 bdf9f1090Yc6Dy4Bg2uOkaxWaLqAbKbLXSfI+s73JjItjKQ78tx5XXv82J1IkIkO+g
	 ji6epheMPNEsw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DA40C4D107;
	Thu, 26 Nov 2026 00:33:11 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de
Cc: airlied@gmail.com, simona@ffwll.ch, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/mediatek: dsi: return tx_len for write transfers in
 mtk_dsi_host_transfer()
Date: Thu, 26 Nov 2026 00:33:11 +0000
Message-Id: <20261126003311.49008-1-iasnezhkov@gmail.com>
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795653191; l=1225;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=d9GTUwGLxs30Q2Foqvf23WnszilxicEoDpegYZ+sWi4=;
 b=/fZZBXK5jnT5BP/TtqUfZI5IQwPDnaE4fgeIwJ9Z81lnWz9ZALqBGiVUqXmoMC5TSkjDvWuQq
 N7m4jW48yBhAzS3lOhi2PIxBquPw7E7OhOKlcgfZqaWuypo5wDlZ/VF
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
Reply-To: iasnezhkov@gmail.com
Content-Transfer-Encoding: 7bit

From: Ilia Snezhkov <iasnezhkov@gmail.com>

Per struct mipi_dsi_host_ops .transfer() documentation in
include/drm/drm_mipi_dsi.h, on success .transfer() must return the
number of bytes transmitted for write packets or the number of bytes
received for read packets.

mtk_dsi_host_transfer() currently sets recv_cnt = 0 for non-read
messages, returning 0 instead of msg->tx_len. Callers checking for short
writes against msg->tx_len observe a spurious 0-byte transfer.

Return msg->tx_len on successful write transfers.

Found and drafted with an AI coding assistant.

Fixes: 21898816831f ("drm/mediatek: add dsi transfer function")
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index f82506e..e2179b4 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1156,7 +1156,7 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
 		goto restore_dsi_mode;
 
 	if (!MTK_DSI_HOST_IS_READ(msg->type)) {
-		recv_cnt = 0;
+		recv_cnt = msg->tx_len;
 		goto restore_dsi_mode;
 	}
 
-- 
2.54.0 (Apple Git-157)



