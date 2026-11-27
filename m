Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795757829;
	b=UJHfJUeb20W48Q1BpJ8vAXST9JIcrf3xJQEUGw9g3Bimh1zH6m1BFmT3I/fR9PZKI0fQ
	 k2imqpwLdCw/rAxqtVbJILH9QvATT+eQK1UyqpRJB1xf/Kxgn4c7txOKIXX4hauUp7oNR
	 JRcopuUCRbZmHgftpoottlve24G6ZUFSUTaIt2BsVvEQtYNQqUKuynL/7nXoH3+OLEf58
	 KbEUtOxzubla1ARBB073oqYS5lmkgtimZSarcFafh+GdggMX0GyubT2NXj8/yOEvHXaBx
	 eKFteE9B7tA272fimtLKkCrtzHagiitJhg5ltR06UmcZCDbaylDvafCxeQzzcVpY8PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795757829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=HcVK4QLyG35uHjO5ETCyA4fpt6MBDPBpxxzf/iYZMFY=;
	b=NAUr1p5j4+UweKtuRgXwL4G2KpXonvHxKCG0nLpUe0Lafug1eo1vvYKPQIvcSBnWtfG7
	 lxjXbn98g7WGixnxrkJyWurTloChPvLR8+tOnlgQ8Gs1uOo2brxBUnR1uM/zoFfLs7zhr
	 7+6Gpfbbs1/vIgAu4JuVtnG/nEet9q3jFfvBpsbmJ5PxyZfb5Z1AQz4Vkt3/8gUBSfqGA
	 ShZ81I1LQXm8POzi0GQZyvvQuWz+1SsNfUpsCdTkLBWCiG3Dl2GlalQMyFATdXIPIkFrk
	 CQOVTUL+7DlzAIjKVeyimyKnNzGU9LqJ/dtfnDRfY1IT9c5Jo7WcZOQaRBgnTWpQ8Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cLIaIfRl;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F4A606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81F4A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cLIaIfRl
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-386ab9ab619so10465957eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795757827; x=1796362627; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HcVK4QLyG35uHjO5ETCyA4fpt6MBDPBpxxzf/iYZMFY=;
        b=cLIaIfRl7yCH6R8qhN3YnKBdrqlyoUjPVSQzj5duPbQDhlBQu6+ZNA1RkH0z1xaYo7
         4vCMwBK/vgqvHUWcs+HKB+8EWydlQT69AMWsa63gbZUbnyhXa5vA7wIsoMU6c8e40gcQ
         cq+gQrer5qpxQRQ+aes9ygaKlLycAI34+LGtQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795757827; x=1796362627;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HcVK4QLyG35uHjO5ETCyA4fpt6MBDPBpxxzf/iYZMFY=;
        b=hFxfLTnP3Z0MYf+M0rOf8huAVZ30p/uJuJIAq3LTu49ricPAoCDOE9uUTQskNd4ghf
         GE3iQR+KfFNdJpASOqlAAsGa+IZEZIVSvadkFVJwPLLGpxavQE7sWNdrEyIuZI/8GZ9g
         1iHIYNEKKQf0g3WHyb1r/sxDGckMeb97w5ptw+pSOX5PKmWLDL3GWnG1MB6Ke4rQTEzI
         yRE9X/d9PGveckt1dMs17IMfFTxyHl3AfFGLA65ivcmlgBfOmzvidRvR4yX6UC8d5kKT
         So3eOv7aoIYP7TtuzH1M9M2jC6gOuzOodikpctpwidc0QIR+ElhvHWvDfzeNEpv3bEuh
         AxxQ==
X-Forwarded-Encrypted: i=1; AL+hErF/rSCPE6DnMNylXWdttkXEmKJ0spbio2m6nCo48B2dA/V+beRJQSRmYPeQjOIycEfBGM1T6DL0KioM1G4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+d5K4NQtrxQgdsJG/QXb1vvnywpBdfznlRexNdnOMCQtprV4Xz
	fw+7kXG+J0o5I6t90t7FolH64cBQS3uzltrFd2P7nOi2fOpAsBrX5qxYZNk25XS43w==
X-Gm-Gg: AZFdTZfD7GlaUh6nnmEg+16pEAOMhx2yXHOrK/Ph29rb6nU0CP0sqBF53w/3Es9wWzr
	zDoNQV72N2DreHQO7EIX/RTiKzqSOFL3rIr2MQr1rgeTWXxChurxjlgZ/ZPdAGz9yc53uHsvNld
	KdfbYinLesf1V02sSXZ00NpDRzojEcc5Ad6scvyhZrNzrB/bL1N/uXIaYUutd/6pRzgRWw8te3v
	aiTyOezwI/KB3Fppm24vQO8VacC/ZaFziNo4QdeLDynl8gjdTBPR92ULXtBX8nG1eyAqdNvJyH9
	DZ1r8SLgBCcgdIJH28zp9CcrEhLw62XdG7IGWrEYWHlWqh12kzo5PhYp43ZdIFi+m0iLUe2HKiL
	ADfh8fsjxrx5EbwaiIV7J0Co5BrEY8FniNbQqxCgV/IJoaz1xjCRZxW7yfqtRjItyUDCWbo7Pwe
	8f0vxEfpSwRPhscOyME1UP7THPbZMQapCFW8W7OvC8/PAAWI1J4pzTPj8JSOHezmwVojtu1H7Eo
	Ey4d79fgpjIu8ZjeJhbv4rYfvHmva4hbOocrwHCQg94WBqtj7HYx+lwFLUzTQVJj8jwCslORJVy
	fvzlkTYX0UVQnGQuooD1okb+KeTN/saYaqg1ufma/qo3Q6ptnIHOKsoEPasAfcsuAJSguVqDctq
	/e5gl9WYXoibNAp+aeAZ2cg==
X-Received: by 2002:a05:7301:391c:b0:384:df31:69fd with SMTP id 5a478bee46e88-3856fb6a672mr26792280eec.14.1795757827391;
        Thu, 26 Nov 2026 21:37:07 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm83106035eec.5.2026.11.26.21.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:37:06 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Fri, 27 Nov 2026 13:37:00 +0800
Subject: [PATCH v3] media: mediatek: vcodec: Validate source buffer vaddr
 in buf_prepare
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
Message-Id: <20261127-vcodec-null-va-v3-1-e24521086062@chromium.org>
X-B4-Tracking: v=1; b=H4sIAPsWCWsC/5WOyw6CMBREf4V07SV9SEFX/odhUcuF1iA1LTQaw
 r/b4sK1y5PMnJmVBPQWAzkXK/EYbbBuSiAOBdFGTQOC7RITTrlkjNcQtetQw7SMI0QFuqOUNnj
 qmZAklZ4ee/vahdf2y2G53VHP2ZITvXcPmI1H9RNTLmhdySMvhaxZQytg0Aej3EWbFLfLo3R+y
 G1jw+z8e/8beV75y9Bu2/YBVy2uy/QAAAA=
X-Change-ID: 20261127-vcodec-null-va-cd0008e9f136
To: Nicolas Dufresne <nicolas@ndufresne.ca>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Fei Shao <fshao@chromium.org>
X-Mailer: b4 0.16.0

If an OUTPUT buffer has no kernel mapping, vb2_plane_vaddr() returns
NULL. Both the stateful and stateless decoder workers only peek the
source buffer and finish the m2m job without returning it, so the buffer
stays at the head of the ready list and the same job is scheduled again.
In the stateless decoder, the media request is also never completed; in
the stateful decoder, vb2ops_vdec_stateful_buf_queue() also passes the
source address to vdec_if_decode() without a NULL check.

Add a vb2_plane_vaddr() NULL check for OUTPUT buffers in the shared
vb2ops_vdec_buf_prepare() instead, then remove the late checks from both
workers. Unmappable buffers are rejected before entering the queue, and
userspace gets immediate feedback.

Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
Fixes: 7b182b8d9c85 ("media: mediatek: vcodec: Refactor get and put capture buffer flow")
Signed-off-by: Fei Shao <fshao@chromium.org>
---
Changes in v3:
- Consolidate into a single patch.
  Validate OUTPUT buffer in shared vb2ops_vdec_buf_prepare() and drop
  the late checks from both workers per suggestion in v2.
- Link to v2: https://lore.kernel.org/all/20261023075642.3671805-1-fshao@chromium.org/

Changes in v2:
- Call media_request_manual_complete() instead of
  mtk_vdec_stateless_cap_to_disp() to avoid dequeuing a capture buffer
  that may be in use by the core workqueue on MediaTek LAT platforms.
- Link to v1: https://lore.kernel.org/all/20261019060825.4163770-1-fshao@chromium.org/
---
 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c   | 8 +++++++-
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c    | 6 ------
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c   | 6 ------
 3 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index d76e891f784b..a5c6b56be927 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -811,8 +811,14 @@ int vb2ops_vdec_buf_prepare(struct vb2_buffer *vb)
 					  i, vb2_plane_size(vb, i), q_data->sizeimage[i]);
 			return -EINVAL;
 		}
-		if (!V4L2_TYPE_IS_OUTPUT(vb->type))
+		if (V4L2_TYPE_IS_OUTPUT(vb->type)) {
+			if (!vb2_plane_vaddr(vb, i)) {
+				mtk_v4l2_vdec_err(ctx, "failed to get vaddr for plane %d", i);
+				return -EFAULT;
+			}
+		} else {
 			vb2_set_plane_payload(vb, i, q_data->sizeimage[i]);
+		}
 	}
 
 	return 0;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
index aa9bdee7a96c..fbd5791e78c1 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
@@ -347,12 +347,6 @@ static void mtk_vdec_worker(struct work_struct *work)
 	buf.va = vb2_plane_vaddr(&src_buf->vb2_buf, 0);
 	buf.dma_addr = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
 	buf.size = (size_t)src_buf->vb2_buf.planes[0].bytesused;
-	if (!buf.va) {
-		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
-		mtk_v4l2_vdec_err(ctx, "[%d] id=%d src_addr is NULL!!", ctx->id,
-				  src_buf->vb2_buf.index);
-		return;
-	}
 	mtk_v4l2_vdec_dbg(3, ctx, "[%d] Bitstream VA=%p DMA=%pad Size=%zx vb=%p",
 			  ctx->id, buf.va, &buf.dma_addr, buf.size, src_buf);
 	dst_buf->vb2_buf.timestamp = src_buf->vb2_buf.timestamp;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index ab1894fba0d9..3d5f9e11a49b 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -342,12 +342,6 @@ static void mtk_vdec_worker(struct work_struct *work)
 	bs_src->va = vb2_plane_vaddr(vb2_src, 0);
 	bs_src->dma_addr = vb2_dma_contig_plane_dma_addr(vb2_src, 0);
 	bs_src->size = (size_t)vb2_src->planes[0].bytesused;
-	if (!bs_src->va) {
-		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
-		mtk_v4l2_vdec_err(ctx, "[%d] id=%d source buffer is NULL", ctx->id,
-				  vb2_src->index);
-		return;
-	}
 
 	mtk_v4l2_vdec_dbg(3, ctx, "[%d] Bitstream VA=%p DMA=%pad Size=%zx vb=%p",
 			  ctx->id, bs_src->va, &bs_src->dma_addr, bs_src->size, vb2_src);

---
base-commit: a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
change-id: 20261127-vcodec-null-va-cd0008e9f136

