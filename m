Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034036;
	b=knPSU0p5n454WzG27iKJJfEKfmg5KPsKczfFBerdiFU71K1Ko1fo3uvmiURF31EwOfzq
	 IbYHUqtuPmKbxFh7/7d224cfs6FW1wsJPBCHLPM2GceW9BrejPgxbQ5uaL8CkxIVKz2t3
	 hgVODvmNrcJ+Ioo1oGpjrUzXQRr160kxmdOfg+smkI+UWiAqUjgoF3k5EXOKTEwRkrKmX
	 JDi2iZaPnE6zz+M4V4eH/PCNEM3fQ6PMJe8QvT+3f6me18a8C+KwWqWIPbRXWuAqmyNCc
	 QKsztcvsOVess4C26v0u2kOH/FRUCAx9+KkKWNRhKNB+kjSDy2VVbFRNj+rDtSh2B4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=y75oxAwlO6c2EjPrPmHn9WTGzz0GY9XzQAVscbqDFeA=;
	b=3ULv1PFWtc8aaoMeoRwQoIgFC9+uUpIOaWV6aimDDx+YPuq9in+JCJp29mOUA4llcFQJ
	 1d7L2cW1k8RwIsoOnM5O3q1/J+CB+mak+GBuFEHGef01+DQlIK5Ij9i8MdaerfazyZ3kk
	 OkGEdsq7gA2+hX59BxT3WDXkbAnjRwtzFOJfPOvQQ5i3BtZLn0H9asPp+aIaW5Y5Q46EU
	 ZHJdiMuRkOuOilVSYgajnbu/f+gk8LLiBym7JNPLwjr6djWL8QlIQxfAwoAoRLhOdnoss
	 vEt5IdEtTjb/8n53F/yZCxNn0crZ3q0njhSJSl0H7y5CORzVM7kyIkTc7lHDnzOc07Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IT0rf2Xw;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1266606A334
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1266606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IT0rf2Xw
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2eb33b5c067so1119105ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795034035; x=1795638835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y75oxAwlO6c2EjPrPmHn9WTGzz0GY9XzQAVscbqDFeA=;
        b=IT0rf2XwWbiio13LXq7KyJkWQNoIWiijTp48nMi5T6ueuGrgtY1PBglE/RdJCvX0Im
         7juc8JSJLSkAfMCZ9H3N82I0W5AdeOPhmauznoH02N2CMGp4YdQKloI8VTKIo+s379kv
         Oz/HPtzzg/yxibLtdkQNdWMCFVqw/1D2s9brGEkJG070BHalDyyvrR2CNP8egVDfVzaX
         cxRoR7nnv/e0hJoSbHP21dyLlZU7ilgTj6MomkGg6fUk+vcIOxSVZsopu8ISyIlepLzP
         U4U7xiconxT0fcmi2CHIIqXs22Mol+C3EWuxBknt7w1LsMPTCGOeXi6ApOnVt+BUnFJ9
         kDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034035; x=1795638835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y75oxAwlO6c2EjPrPmHn9WTGzz0GY9XzQAVscbqDFeA=;
        b=LsueXOcFCFDdJOf1Ogz0xwGciNsIV2/wQDBHHb9TOMLJ7+XkPd2T05cYadmqTPQqzr
         UEJpIxPJOK57+e16sUs36PupFtDIE/1CMHmQnSEEpF3EjiVNahAf/+B5+Gl6Vp9xmRGR
         VpUts8Xu9XkFIgKMs6c5SUJGJIOAkNwQ7rFn+WCvKhcD0x8RldNxKhbQSB7wxiZMDMYk
         Xz8fL7PJjHoZs0pgtaqqeC9QJHxc1xPqUDlDwNYJ+X9Ox550XwAk0EO+SI2Ok/jENNtd
         9yYinfuY0cqhr2HxgSYJwGekhhokwI7n5BKKJTzv9gWk2muIJCBRWGk082d7ipM62ZDi
         527g==
X-Forwarded-Encrypted: i=1; AL+hErGX90C4D98oJAW3y3FYR28y/VGTTQVOodg5HLxT5KD9wbfv9pv1EIlmRXhqJ2ZickcawlPZo+CSrZarmE8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+Fj4c5vHmfHjowEXT0iWy1ykcGBkFY216RwVLb6apEvqQa6qc
	sgJh+toorWtFpr1gWN9pS+TxIQXy8FmBGXqEPzsYJ2mHun1ZCJNt9o3D
X-Gm-Gg: AZFdTZeNG1hn+DinOzX1UELJHHNSWw8rDWAUPYO8QX6yI37bSnI8FBkx2OG6Y30O4fs
	ZJ/j1BRXd1VAFjaNG0tBXMIYl8p3VBNR8FqkYeLjOwFGobpQfZWgaLV0ChCWvefcVJsRGb7eux8
	Mh9OZyQVlxIMKGS5MnJ7fnyXDiZjx91Yn47TefWrjvx18hptJJt2BfJGhxZvzwFFw7e1AS1Gr1o
	rwN7sQ2TDfJp8fWSLl7++cC0BX2kj7Z5lHsT20S+BjYyzws5IqUfVGHfh8gmeSLJmTPlqhYCWHP
	GbevBvJMjYaTIcXkFAcL9IOl1zMFQGUIU2FY1bmzctbayYfz4NHUyXCFmFDdzBWgGjqm1BjQjdq
	gvHNZfsGQjyDhzDj6eu4gTI0DcUTOOcDFGUeQH+5DyN5VcLT4Klm8SSYq7FnWXo3xsB3Wl75WMy
	mVvfMAf9RLjtWf9/vj5I6DqsLhBvWSQf8PHcMGuE1wOAqJcQ4hSwNAPS7tUTFxuQU6tZM0EvUvY
	sqy+R29Pv2TANU1dj4a0kAFtEiExhjo6G4jseTBzn6fADDhj1YzfuWNRAMJxvRwPxz1zEvxyqeD
	g3kPvJqQo1SunsPvdVNZKRH6wWSrpRFkcLHug0UVQ61fhISizxZ/fjmufoA3mjl43OkFYTWOPbU
	NillkKcE=
X-Received: by 2002:a17:903:2b0d:b0:2ef:d8ce:83e6 with SMTP id d9443c01a7336-2eff6f850b2mr56986735ad.0.1795034035036;
        Wed, 18 Nov 2026 12:33:55 -0800 (PST)
Received: from FAIZEL-KB.. ([2001:569:52f5:4b00:cfaf:4885:b023:6316])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2eff6116331sm19166825ad.22.2026.11.18.12.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:33:54 -0800 (PST)
From: Faizel K B <faizel.kb@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	libcamera-devel@lists.libcamera.org,
	Robert Mader <robert.mader@collabora.com>,
	Faizel K B <faizel.kb@gmail.com>
Subject: [PATCH v2 2/2] media: rockchip: rkcif: Honour the requested bytesperline
Date: Wed, 18 Nov 2026 13:31:34 -0700
Message-ID: <20261118203134.315591-3-faizel.kb@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118203134.315591-1-faizel.kb@gmail.com>
References: <20261118203134.315591-1-faizel.kb@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DMA uses bytesperline as the line stride, which must be a multiple
of 8 bytes, but v4l2_fill_pixfmt_mp() doesn't align it. Any larger
bytesperline requested by userspace is also replaced with the minimum.

Align bytesperline to 8 bytes and honour the largest value requested
for any plane, up to the limit of the line width register. The Y and
UV planes share the same line width. On the DVP, program the line width
from bytesperline, keeping the current value as the minimum.

This allows DMA-BUF importers that need a larger stride alignment to
use the buffers directly.

Signed-off-by: Faizel K B <faizel.kb@gmail.com>
---
 .../rockchip/rkcif/rkcif-capture-dvp.c        |  4 ++
 .../rockchip/rkcif/rkcif-capture-mipi.c       |  3 ++
 .../platform/rockchip/rkcif/rkcif-common.h    |  1 +
 .../platform/rockchip/rkcif/rkcif-stream.c    | 48 ++++++++++++++++++-
 4 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c
index dbaf7636aeeb..64a37d6877e2 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c
@@ -20,6 +20,8 @@
 #include "rkcif-regs.h"
 #include "rkcif-stream.h"
 
+#define RKCIF_DVP_MAX_BYTESPERLINE 0x7ff8 /* VIR_LINE_WIDTH: 15 bits */
+
 static const struct rkcif_output_fmt dvp_out_fmts[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_NV16,
@@ -689,6 +691,7 @@ static int rkcif_dvp_start_streaming(struct rkcif_stream *stream)
 	val = stream->pix.width;
 	if (active_in_fmt->fmt_type == RKCIF_FMT_TYPE_RAW)
 		val = stream->pix.width * 2;
+	val = max(val, stream->pix.plane_fmt[0].bytesperline);
 	rkcif_dvp_write(rkcif, RKCIF_DVP_VIR_LINE_WIDTH, val);
 
 	val = RKCIF_XY_COORD(stream->pix.width, stream->pix.height);
@@ -827,6 +830,7 @@ int rkcif_dvp_register(struct rkcif_device *rkcif)
 		stream->interface = interface;
 		stream->out_fmts = rkcif->match_data->dvp->out_fmts;
 		stream->out_fmts_num = rkcif->match_data->dvp->out_fmts_num;
+		stream->max_bytesperline = RKCIF_DVP_MAX_BYTESPERLINE;
 		stream->queue_buffer = rkcif_dvp_queue_buffer;
 		stream->start_streaming = rkcif_dvp_start_streaming;
 		stream->stop_streaming = rkcif_dvp_stop_streaming;
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
index 53e62d059764..d5eaedd2c43b 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
@@ -24,6 +24,8 @@
 #include "rkcif-regs.h"
 #include "rkcif-stream.h"
 
+#define RKCIF_MIPI_MAX_BYTESPERLINE 0xffff8 /* VLW: 20 bits */
+
 #define RK3568_MIPI_CTRL0_HIGH_ALIGN  BIT(31)
 #define RK3568_MIPI_CTRL0_UV_SWAP_EN  BIT(7)
 #define RK3568_MIPI_CTRL0_COMPACT_EN  BIT(6)
@@ -1026,6 +1028,7 @@ int rkcif_mipi_register(struct rkcif_device *rkcif)
 			stream->interface = interface;
 			stream->out_fmts = mipi_out_fmts;
 			stream->out_fmts_num = ARRAY_SIZE(mipi_out_fmts);
+			stream->max_bytesperline = RKCIF_MIPI_MAX_BYTESPERLINE;
 			stream->queue_buffer = rkcif_mipi_queue_buffer;
 			stream->start_streaming = rkcif_mipi_start_streaming;
 			stream->stop_streaming = rkcif_mipi_stop_streaming;
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-common.h b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
index 08a213438d34..63e5a221cd73 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-common.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
@@ -145,6 +145,7 @@ struct rkcif_stream {
 	struct rkcif_interface *interface;
 	const struct rkcif_output_fmt *out_fmts;
 	unsigned int out_fmts_num;
+	u32 max_bytesperline;
 
 	/* in ping-pong mode, two buffers can be provided to the HW */
 	struct rkcif_buffer *buffers[2];
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
index b117ba57bc75..f700b40ab099 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
@@ -23,6 +23,7 @@
 #define CIF_MIN_HEIGHT	 64
 #define CIF_MAX_WIDTH	 8192
 #define CIF_MAX_HEIGHT	 8192
+#define CIF_BYTESPERLINE_ALIGN 8
 
 static inline struct rkcif_buffer *to_rkcif_buffer(struct vb2_v4l2_buffer *vb)
 {
@@ -334,20 +335,63 @@ static const struct vb2_ops rkcif_stream_vb2_ops = {
 	.stop_streaming = rkcif_stream_stop_streaming,
 };
 
+static u32 rkcif_stream_plane_lines(const struct v4l2_format_info *info,
+				    unsigned int plane, u32 height)
+{
+	return plane ? DIV_ROUND_UP(height, info->vdiv) : height;
+}
+
+static void rkcif_stream_set_bytesperline(struct rkcif_stream *stream,
+					  struct v4l2_pix_format_mplane *pix,
+					  u32 req_bpl)
+{
+	const struct v4l2_format_info *info = v4l2_format_info(pix->pixelformat);
+	u32 bpl = pix->plane_fmt[0].bytesperline;
+	u32 total_lines = 0, max_bpl;
+	unsigned int i;
+
+	for (i = 0; i < info->comp_planes; i++)
+		total_lines += rkcif_stream_plane_lines(info, i, pix->height);
+
+	max_bpl = min(stream->max_bytesperline,
+		      ALIGN_DOWN(U32_MAX / total_lines, CIF_BYTESPERLINE_ALIGN));
+	if (req_bpl > bpl && req_bpl <= max_bpl)
+		bpl = ALIGN(req_bpl, CIF_BYTESPERLINE_ALIGN);
+
+	/* The Y and UV planes share the same line width. */
+	if (info->mem_planes == 1) {
+		pix->plane_fmt[0].bytesperline = bpl;
+		pix->plane_fmt[0].sizeimage = bpl * total_lines;
+	} else {
+		for (i = 0; i < info->mem_planes; i++) {
+			pix->plane_fmt[i].bytesperline = bpl;
+			pix->plane_fmt[i].sizeimage =
+				bpl * rkcif_stream_plane_lines(info, i,
+							       pix->height);
+		}
+	}
+}
+
 static int rkcif_stream_fill_format(struct rkcif_stream *stream,
 				    struct v4l2_pix_format_mplane *pix)
 {
 	const struct rkcif_output_fmt *fmt;
-	u32 height, width;
+	u32 height, width, req_bpl = 0;
+	unsigned int i;
 	int ret;
 
 	fmt = rkcif_stream_find_output_fmt(stream, true, pix->pixelformat);
 	height = clamp_t(u32, pix->height, CIF_MIN_HEIGHT, CIF_MAX_HEIGHT);
 	width = clamp_t(u32, pix->width, CIF_MIN_WIDTH, CIF_MAX_WIDTH);
-	ret = v4l2_fill_pixfmt_mp(pix, fmt->fourcc, width, height);
+	for (i = 0; i < pix->num_planes; i++)
+		req_bpl = max(req_bpl, pix->plane_fmt[i].bytesperline);
+	ret = v4l2_fill_pixfmt_mp_aligned(pix, fmt->fourcc, width, height,
+					  CIF_BYTESPERLINE_ALIGN);
 	if (ret)
 		return ret;
 
+	rkcif_stream_set_bytesperline(stream, pix, req_bpl);
+
 	pix->field = V4L2_FIELD_NONE;
 
 	return 0;
-- 
2.43.0

