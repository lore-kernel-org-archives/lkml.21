Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795637787;
	b=Yt3q6OSzcwMmxgTFKNs/x3P2Nr7W2s8ByNoAxD/Cx26CE0ZawsZhKveMSOr3b985t2Al
	 3zHaZHxbigHluk6ixJH30Y97fyyKL22AQ7F7w0m/V3skw0N2Dx+9O/TDujTX18tM5/M4f
	 JCP5B58VgyBeDcm2TCrG61t2hxd793kq5VXC1gF6Mnm1c7dvKvMcXSXxvm0EI1zvxPBIq
	 imcfsgVRbSaaxf/ZBjLAkaqLEzhKdgIQ8wJUE+1PeAyobiTpMfs8mw4kFXlqn2hmgtlFS
	 ASx8cJlU/bYVQTPOhauLe7DvDeP+ONz6gIHOi2E28CihVTTdObrPO8cnIO+VV+4T4hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795637787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=2/+Zf3N1CnddY8JlOrVc8DsTWkURHkyHGw0xs/XTPrE=;
	b=nwMoVgK1jE5njh8bFnt001o3/uQCNFWSTMnTwuXfvgiCXNsOvUKrJOPIeLgyOu829KBN
	 5PEV5N4AoaBUjX3pXpYIa/NGk2LVyIdD907eYu4rSHuzU3KTUBsAH4JTHySjoXyyxLCzx
	 1r/Kd4Dg9SLB7VHva3wpLyj7LjCSlU4we7wbZxq0iPuqb74hAlP3SYmYV4L3116tukQlC
	 ekAd0ar70/KarN34Us3KkaKaAQv+BC1EH2UrI3QNEMu3X/1Z2l0wEReOb4DiL+38pRpeV
	 MnFVhsqskQxOuHl/QkP/2VsH5K+TJgwFy23mNMm7t9lp0iQMs70ACOa/NJ+K+kbUCQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r6fxhiH5;
	arc=none smtp.remote-ip=74.125.231.137
Received: from mail-oo2-f9.google.com (mail-oo2-f9.google.com [74.125.231.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3075960A261A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3075960A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r6fxhiH5
Received: by mail-oo2-f9.google.com with SMTP id 006d021491bc7-71adbc33a72so1842156eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795637786; x=1796242586; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2/+Zf3N1CnddY8JlOrVc8DsTWkURHkyHGw0xs/XTPrE=;
        b=r6fxhiH5zAu2PhfMMK0Gi1gTW3Bb4bL8oGtJrVOoRfk7nRr1Tm9iBFMzdcHm8aWyh+
         IcJbOrq3Koh8vyV7NUiFSt9RtJQeP9AsNZZNfiSGgxhfjzfQx+SWZywsVQTBLwA1nKf1
         RqAzVdxh1YERFY9Tl6RZC68RjJQbMukMDrc4j2MXmzaDsTe7dVHNdL9M1i/K1x1A3vOz
         WGwO6pYSn+ZFQAjZq8xtmw/sYfdPfPxDg+pn3K1rnVMc/7VhHLbYsXH3p+mQz4RPTM0W
         ztRm7xgNaP8UbgGmui+cB7Z1MK2M3xwBLXg1h2kANDPLPDLiQUfi4oyUdthKdwwZgkAe
         2sUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795637786; x=1796242586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2/+Zf3N1CnddY8JlOrVc8DsTWkURHkyHGw0xs/XTPrE=;
        b=PJOl4iA4EqPOgrnN1MpfqYQcOlcibk4FoVX7IhuPUKhOrv5pDQBuWJP2tKTFpyaKRJ
         mtxpwDn0SIH9JD++hBzUZhQq9eilEXUBN3AXPokAoSyxya460eXEzjWNOICR8x2lEwHW
         wuYMB5I2QQG3/KCpY5soL2JmYQqVJUb0uE17vOz0kTxlC1dZeLIPPzU51vM3tUVxRMhK
         UJmIHfAVxHbs7JRHmTAYhxTjCY+RuVIzpD6QRewwSV7f0RnY/TypTIuqQXzT7EVplDIH
         XaxHDalBCNVa6fYlnnnZ1q2jAGMDUqYX6SxpMBpXX8F28N9KiOyceKWIrSNkSjLI2RnU
         f7SQ==
X-Forwarded-Encrypted: i=1; AL+hErFEtPQTenFTOR/FMC+zo1uX/m5/m8FTRAEhEMYQJOYpyy8/1sT6EIgHeiAwRAOkvO/YPTe668s7xK+VGwI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MxV78xrwvdWlaK0CE9WVjucCqPmoxwi9OziyLDmcN4J5ivHub
	yYb4HIxWH0rAkm6QySJngs5edMP2wzwd2thQ9z0VWwBjkvGctvkGAHf8
X-Gm-Gg: AZFdTZdprlvPYeZhOGJni7DQcxVcQbl7cM2BeZi4y7xUzOAVj5ObTAMbPMTGF+80JPM
	VSLYUxm8MSuSNPRI4G7MXkMPIt2ZDdW5mEqrpknxrHmFsRMMICyxtSz8Yk/ovFmiTsC8mtRyY7a
	A+xOjEXu1uKgs+eMMA4i/RbnMBphSXv2Ek9ZugC/QaNmfHU+XWTcRNmb8HTqlyPqIeJhaj/xQyQ
	gShYmaTBcL2MPqnl71hcd9Qqzvm3nCKNUVT2CGOmlYNECHUeJKXB/H818RJIinDNkiv6zPb3Mw7
	DzRW9WpinEDZredxxPWOyaKUFdVZXtawgl0JjSvCrU6mVq9LEiZPS70re4izYDYaHsXhbrgPOmA
	Mp/tY8g7/Ocm7+8xIz1b9xKKZ+L4/VRRQWdX5YrWGeZBjYnzwsrsXCBNtfvv7jZBknL542C5Ryb
	kyxJOxt7SNUEju9rLiI3U6bC+DtrnNT8mOfi6WFBtVanBfOCaOQOO5VReV1YopHiv1nGYBD34WA
	LCrVnc0BDOqfB9ewNldk2m8pGZXwWTXiEbdEHwgj0wvDYRNnlDcM7zaD5hlx/7fDWA3Ew8reyWm
	szBSVWx8uY7ON89c9NwNJW6Ca5rsU7vdKcV7dRJHG/VtNgSWXfPKtd4/
X-Received: by 2002:a05:6820:350f:20b0:702:6977:34db with SMTP id 006d021491bc7-71b395c579emr11640137eaf.72.1795637786196;
        Wed, 25 Nov 2026 12:16:26 -0800 (PST)
Received: from [192.168.0.98] ([50.26.120.197])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm11341859eaf.10.2026.11.25.12.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:16:25 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 25 Nov 2026 14:16:12 -0600
Subject: [PATCH v2 9/9] media: mediatek: vcodec: Flag the last buffer
 before a resolution change
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
Message-Id: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-9-fdc047cf75a5@gmail.com>
References: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-0-fdc047cf75a5@gmail.com>
In-Reply-To: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-0-fdc047cf75a5@gmail.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Eizan Miyamoto <eizan@chromium.org>, 
 Francois Buergisser <fbuergisser@chromium.org>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Youngjoon Lee <getfeus@gmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Ryan Brue <ryanbrue.dev@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795637766; l=5381;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=Y1SCU8OkUEdpQ3ilaD/8tRCyrFrvygGo3anBgXd8zNE=;
 b=Xymw8nTU27gApkcaTJe3iPpcMVrBpPIb8WcWK0w0YSKzWjrycv5MT5q0HoerLVJwtncP6cxbc
 lRpPQyXEkepCKrFLdP960Hof//sDKGkmtvh0aNmVF9i026i2WblqyJ4
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

When the stateful decoder finds a resolution change, it flushes the
frames decoded before it and sends V4L2_EVENT_SOURCE_CHANGE, but never
returns a CAPTURE buffer with V4L2_BUF_FLAG_LAST: the destination buffer
of the job that found the change is taken off the queue and dropped.
dev-decoder.rst has the client wait for that buffer before it
reallocates, so a client following it waits forever and a mid-stream
resolution change stalls decoding (GStreamer's v4l2h264dec, for one).

After the flush, queue the event and then return an empty CAPTURE buffer
flagged LAST, or flag the next one queued if none is ready.

Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       |  2 +
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h   |  3 ++
 .../vcodec/decoder/mtk_vcodec_dec_stateful.c       | 44 +++++++++++++++++++++-
 3 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index 71db692ed848..b8cc58e2a155 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -899,6 +899,8 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
 		return;
 	}
 
+	ctx->last_buf_pending = false;
+
 	if (ctx->state >= MTK_STATE_HEADER) {
 
 		/* Until STREAMOFF is called on the CAPTURE queue
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index c9d27534c63e..5c30a96c1ccd 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -170,6 +170,8 @@ struct mtk_vcodec_dec_request {
  * @empty_flush_buf: a fake size-0 capture buffer that indicates flush. Used
  *		     for stateful decoder.
  * @is_flushing: set to true if flushing is in progress.
+ * @last_buf_pending: return the next CAPTURE buffer queued as the LAST one
+ *                    (a resolution change found no buffer to flag).
  *
  * @current_codec: current set input codec, in V4L2 pixel format
  * @capture_fourcc: capture queue type in V4L2 pixel format
@@ -216,6 +218,7 @@ struct mtk_vcodec_dec_ctx {
 	struct vdec_pic_info last_decoded_picinfo;
 	struct v4l2_m2m_buffer empty_flush_buf;
 	bool is_flushing;
+	bool last_buf_pending;
 
 	u32 current_codec;
 	u32 capture_fourcc;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
index aa9bdee7a96c..6cff75cd9f32 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
@@ -208,6 +208,34 @@ static int mtk_vdec_flush_decoder(struct mtk_vcodec_dec_ctx *ctx)
 	return 0;
 }
 
+/*
+ * Return an empty CAPTURE buffer flagged LAST: the end of the frames decoded
+ * before a resolution change. Without it a client following
+ * dev-decoder.rst waits for it forever and never reallocates.
+ */
+static void mtk_vdec_return_last_buf(struct mtk_vcodec_dec_ctx *ctx)
+{
+	struct vb2_v4l2_buffer *dst_buf;
+	struct mtk_video_dec_buf *dst_buf_info;
+	unsigned int i;
+
+	dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
+	if (!dst_buf) {
+		ctx->last_buf_pending = true;
+		return;
+	}
+
+	dst_buf_info = container_of(dst_buf, struct mtk_video_dec_buf, m2m_buf.vb);
+	mutex_lock(&ctx->lock);
+	dst_buf_info->used = false;
+	mutex_unlock(&ctx->lock);
+
+	for (i = 0; i < dst_buf->vb2_buf.num_planes; i++)
+		vb2_set_plane_payload(&dst_buf->vb2_buf, i, 0);
+	dst_buf->flags |= V4L2_BUF_FLAG_LAST;
+	v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
+}
+
 static void mtk_vdec_update_fmt(struct mtk_vcodec_dec_ctx *ctx,
 				unsigned int pixelformat)
 {
@@ -403,9 +431,12 @@ static void mtk_vdec_worker(struct work_struct *work)
 		 * before the resolution change point ready to be
 		 * dequeued on the CAPTURE queue, the driver sends a
 		 * V4L2_EVENT_SOURCE_CHANGE event for source change
-		 * type V4L2_EVENT_SRC_CH_RESOLUTION
+		 * type V4L2_EVENT_SRC_CH_RESOLUTION, then returns the
+		 * LAST buffer, so a client that sees LAST finds the
+		 * event already queued.
 		 */
 		mtk_vdec_queue_res_chg_event(ctx);
+		mtk_vdec_return_last_buf(ctx);
 	}
 	v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 }
@@ -433,6 +464,17 @@ static void vb2ops_vdec_stateful_buf_queue(struct vb2_buffer *vb)
 		buf = container_of(vb2_v4l2, struct mtk_video_dec_buf,
 				   m2m_buf.vb);
 		mutex_lock(&ctx->lock);
+		if (ctx->last_buf_pending && !buf->used) {
+			unsigned int i;
+
+			ctx->last_buf_pending = false;
+			mutex_unlock(&ctx->lock);
+			for (i = 0; i < vb->num_planes; i++)
+				vb2_set_plane_payload(vb, i, 0);
+			vb2_v4l2->flags |= V4L2_BUF_FLAG_LAST;
+			vb2_buffer_done(vb, VB2_BUF_STATE_DONE);
+			return;
+		}
 		if (!buf->used) {
 			v4l2_m2m_buf_queue(ctx->m2m_ctx, vb2_v4l2);
 			buf->queued_in_vb2 = true;

-- 
2.56.1

