Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604913;
	b=c3DAnjiOY6DBD0kkZtyKt0CKP/azhg+VkGfbB3Kp0Nhr+PJelqYdGZ2+Q6/OomRkhS/P
	 CrKMWYh3WKHDAA4rHkXQzEob3CyjBQ6pM/rbfEGak/9Sqd7jZ4t9LpoVXm9oiTVMERxmv
	 kvM8DaqUxRJ92tp9qdiFSRg4XIJ8mQJvNdrdF/mcfr2CR9E3/9ttlYT/bimUKJwhq9Jo2
	 GanLGLKIYOJtOtKHzGKc7B8wG9TTwZ19aEaa3gxxQBEtiwe1kh8IGVHAEFphd1ejsZI2G
	 R3xdUyqTZ9FO4wQr04YbkA++0VH94t0+HrmQEDN3+BgUjhzpMQVid9+Aze8j2od/H0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CFqYsntHtwylKvZtbDDfdQXJFQjCt/BFqkQvtplVZsU=;
	b=Lo45uhdCtVGXYZuYdPG1aVButwgsX2Ha1npzvOi9iU0FEtJyVkG+uR3qVNY46KWBEmGD
	 fGjAruGlom20jTu3PT2oJfZ6wQldHg7Do7fep60VBsJgXhKLlV9TvWj9lttPp2cCSV1ux
	 TuvdYj/0rghzOSuxTvhxRqklFrOZN7c3Wf3qlhuLDe+axFEU5W0Upen96qCbXIq68ZiBl
	 szLoP327C7PjAT/8LgP1pWx6DJXmvLMSIy0+LCHwk/dtetL0zhSGH62YPZCd3ZW3JB4Cw
	 XYveTqiwO6GxQHGQreQ0/yzU/vY3Setsw7/9lXxHdDEPwlInjZjY4IYrvY89W933SzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ePuopdgD;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B3A606A6A7
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47B3A606A6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ePuopdgD
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso826359666b.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604912; x=1796209712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CFqYsntHtwylKvZtbDDfdQXJFQjCt/BFqkQvtplVZsU=;
        b=ePuopdgDECGMtQQ1stg0qd6VS+CZ7FevZw5GDRFnoUpa2cZAaPXpGxKt5++IvW4iNO
         ADVrR73LhxRf1+BP9kH5pY0cTTDuzGmgS27yvWeOeeOLPYH9k3gcro5QEHuVSuzm6VH6
         KN5p70JGoEi2kM532HdvfMrb6IWiNJXjy0IgCzD7dsQ84NSFArMlUM3ajnYFBv4FSoG4
         TOuEXgVatQ56FrKH60g3m3goT1sApQmLKTbvKCwaXVGs6uxeVjU5zLMQItKjoF5RsHzl
         nvsuhMfsq13oKc8NHTiVft4NZ9TjElbymJUGHq5/6cKVw+YZg4h+gwqK3EHR6h5fW93I
         h4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604912; x=1796209712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CFqYsntHtwylKvZtbDDfdQXJFQjCt/BFqkQvtplVZsU=;
        b=MT+dwSMLfHWjGVRRoS7eOX/8iC95sDmMSdunlHNlz7wcK+P6OHm3FOeLODJMyO4qpl
         OH5pVypfIxjNNALGHHf9T/u+DeOwlfHNeZECstkrfujsJUTKaYriVfIyds91qvDabwgW
         fJo0l5SgyFaRBOmLVOubvTKkZMjd3JjyU+TieWezBrc4MGEJVN3K2a50xEalXNzum1vf
         aVKl9j1T2ZUGWAphXe7JFLNOMyi9G+VpZGNkFV+Z0m00DGufW2+FkrFZkV9THjxzw/VG
         KlDczFITyTa7sTgVovIyaCTJs2SZzIDZJB0EdaVLFu3FdG1dwudKMWo1CRKIWr5iZMBh
         yzmA==
X-Gm-Message-State: APuU4Z/wlJyS2zjSi5MQKAIIN2AyldbH3gqeoNc8SHDPk6VtBnAw7pu2
	8ufBLERsb7Lc745/nwvMoN3entjTafSJCm7Xm96522FLEWb9NKBTpgY3
X-Gm-Gg: AZFdTZe5oAUh0XRvN+DST0+PCfytNGjlinCNzR2IBPWhz11u/UfPtF72txQ0r7tGJPK
	RLr39EUJYEpbuOrTazbLG7epXSE623xFp9uN6huY8/r2ix91ZU9wcIC69OcHpSJ/mZpWRzE+iD9
	85O93hjuvoRxL8/k4gZS8VpvMWldArMJF3D56RlS8q7uII6UI11Fpi6De4fUxwabxKsXTSxBMYI
	LjeB/TqKeyCrNmNrgGKtCOH+NABZGMcfrWWlJjnn3o5DSWs/H43bcB7s7RI89c4LM4YwsvSse5L
	EfkbHdSN1Msgf2kvKEFdkJHjgZURf+g44ehLmVoqsvqFENQduj097mVrRkANU8P0od3loGh69fV
	sAynFTOMrw7+sp6tQBZ/PqhDiNDyhAHqonZe5Yt1N3ZxoZX+OoMugGvCL0d5TiUEswZ41yNccWd
	N6E7Vk2u61a0/WoUz5Ewsm9WBoIhw3QcAqgy5Pfd3POa6b8JmWJupT7DeWoXYTT9JgO+F5JGuex
	lLl1ipVoP2EzfAfiTay5C+o0J8qYflbasrN5D3WoGGxbo5zAsBPZzR8tx9yd6vBDZo+DmMR/1Pm
	vMomXWcVzZnFgPc76QoF5MzhYuNQW9BgKV/JQ4kzLkeVmnG9THEJMMiYA+iZgGb4ThnQ61I4qf6
	3BwzVL6cMXcLu2XxCLq40qE3vUIsU3PtY
X-Received: by 2002:a17:907:a712:b0:c4d:a05:a2e4 with SMTP id a640c23a62f3a-c513a9ae26fmr1334376466b.20.1795604911581;
        Wed, 25 Nov 2026 03:08:31 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:30 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 08/13] media: tegra-video: vi: Enumerate supported formats instead of building bitmap of compatible formats
Date: Wed, 25 Nov 2026 13:07:45 +0200
Message-ID: <20261125110750.223628-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125110750.223628-1-clamor95@gmail.com>
References: <20261125110750.223628-1-clamor95@gmail.com>
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

Enumerate pixel formats directly from SoC video formats (filtering by
f->mbus_code when provided) in tegra_channel_enum_format(), and remove the
subdevice/TPG format bitmaps, MAX_FORMAT_NUM, and
tegra_channel_set_subdev_active_fmt() so channel format enumeration no
longer depends on subdevice media bus enumeration during graph completion.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../media/platform/nvidia/tegra-video/vi.c    | 161 ++----------------
 .../media/platform/nvidia/tegra-video/vi.h    |   6 -
 2 files changed, 16 insertions(+), 151 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index ed3e1e91baf12..4a0742b514a2b 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -64,29 +64,6 @@ to_tegra_vi_graph_entity(struct v4l2_async_connection *asd)
 	return container_of(asd, struct tegra_vi_graph_entity, asd);
 }
 
-static int tegra_get_format_idx_by_code(struct tegra_vi *vi,
-					unsigned int code,
-					unsigned int offset)
-{
-	unsigned int i;
-
-	for (i = offset; i < vi->soc->nformats; ++i) {
-		if (vi->soc->video_formats[i].code == code)
-			return i;
-	}
-
-	return -1;
-}
-
-static u32 tegra_get_format_fourcc_by_idx(struct tegra_vi *vi,
-					  unsigned int index)
-{
-	if (WARN_ON_ONCE(index >= vi->soc->nformats))
-		return vi->soc->video_formats[0].fourcc;
-
-	return vi->soc->video_formats[index].fourcc;
-}
-
 static const struct tegra_video_format *
 tegra_get_format_by_fourcc(struct tegra_vi *vi, u32 fourcc)
 {
@@ -327,19 +304,26 @@ static int tegra_channel_enum_format(struct file *file, void *fh,
 				     struct v4l2_fmtdesc *f)
 {
 	struct tegra_vi_channel *chan = video_drvdata(file);
-	unsigned int index;
-	unsigned long *fmts_bitmap = chan->tpg_fmts_bitmap;
-
-	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
-		fmts_bitmap = chan->fmts_bitmap;
+	const struct tegra_video_format *vfmt = NULL;
+	struct tegra_vi *vi = chan->vi;
+	unsigned int index = 0;
 
-	index = find_nth_bit(fmts_bitmap, MAX_FORMAT_NUM, f->index);
-	if (index >= MAX_FORMAT_NUM)
+	if (f->index >= vi->soc->nformats)
 		return -EINVAL;
 
-	f->pixelformat = tegra_get_format_fourcc_by_idx(chan->vi, index);
+	for (unsigned int i = 0; i < vi->soc->nformats; i++) {
+		vfmt = &vi->soc->video_formats[i];
 
-	return 0;
+		if (f->mbus_code && vfmt->code != f->mbus_code)
+			continue;
+
+		if (index++ == f->index) {
+			f->pixelformat = vfmt->fourcc;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
 }
 
 static int tegra_channel_get_format(struct file *file, void *fh,
@@ -489,39 +473,6 @@ static int tegra_channel_set_format(struct file *file, void *fh,
 	return 0;
 }
 
-static int tegra_channel_set_subdev_active_fmt(struct tegra_vi_channel *chan)
-{
-	int ret, index;
-	struct v4l2_subdev *subdev;
-	struct v4l2_subdev_format fmt = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-	};
-
-	/*
-	 * Initialize channel format to the sub-device active format if there
-	 * is corresponding match in the Tegra supported video formats.
-	 */
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
-	if (ret)
-		return ret;
-
-	index = tegra_get_format_idx_by_code(chan->vi, fmt.format.code, 0);
-	if (index < 0)
-		return -EINVAL;
-
-	chan->fmtinfo = &chan->vi->soc->video_formats[index];
-	v4l2_fill_pix_format(&chan->format, &fmt.format);
-	chan->format.pixelformat = chan->fmtinfo->fourcc;
-	chan->format.bytesperline = chan->format.width * chan->fmtinfo->bpp;
-	chan->format.sizeimage = chan->format.bytesperline *
-				 chan->format.height;
-	chan->vi->ops->vi_fmt_align(&chan->format, NULL, chan->fmtinfo->bpp);
-	tegra_channel_update_gangports(chan);
-
-	return 0;
-}
-
 static int
 tegra_channel_subscribe_event(struct v4l2_fh *fh,
 			      const struct v4l2_event_subscription *sub)
@@ -713,78 +664,6 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 	return 0;
 }
 
-/* VI only support 2 formats in TPG mode */
-static void vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
-{
-	int index;
-
-	bitmap_zero(chan->tpg_fmts_bitmap, MAX_FORMAT_NUM);
-
-	index = tegra_get_format_idx_by_code(chan->vi,
-					     MEDIA_BUS_FMT_SRGGB10_1X10, 0);
-	bitmap_set(chan->tpg_fmts_bitmap, index, 1);
-
-	index = tegra_get_format_idx_by_code(chan->vi,
-					     MEDIA_BUS_FMT_RGB888_1X32_PADHI,
-					     0);
-	bitmap_set(chan->tpg_fmts_bitmap, index, 1);
-}
-
-static int vi_fmts_bitmap_init(struct tegra_vi_channel *chan)
-{
-	int index, ret, match_code = 0;
-	struct v4l2_subdev *subdev;
-	struct v4l2_subdev_mbus_code_enum code = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-	};
-
-	bitmap_zero(chan->fmts_bitmap, MAX_FORMAT_NUM);
-
-	/*
-	 * Set the bitmap bits based on all the matched formats between the
-	 * available media bus formats of sub-device and the pre-defined Tegra
-	 * supported video formats.
-	 */
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	while (1) {
-		ret = v4l2_subdev_call(subdev, pad, enum_mbus_code,
-				       NULL, &code);
-		if (ret < 0)
-			break;
-
-		index = tegra_get_format_idx_by_code(chan->vi, code.code, 0);
-		while (index >= 0) {
-			bitmap_set(chan->fmts_bitmap, index, 1);
-			if (!match_code)
-				match_code = code.code;
-			/* look for other formats with same mbus code */
-			index = tegra_get_format_idx_by_code(chan->vi,
-							     code.code,
-							     index + 1);
-		}
-
-		code.index++;
-	}
-
-	/*
-	 * Set the bitmap bit corresponding to default tegra video format if
-	 * there are no matched formats.
-	 */
-	if (!match_code) {
-		match_code = chan->vi->soc->default_video_format->code;
-		index = tegra_get_format_idx_by_code(chan->vi, match_code, 0);
-		if (WARN_ON(index < 0))
-			return -EINVAL;
-
-		bitmap_set(chan->fmts_bitmap, index, 1);
-	}
-
-	/* initialize channel format to the sub-device active format */
-	tegra_channel_set_subdev_active_fmt(chan);
-
-	return 0;
-}
-
 static void tegra_channel_cleanup(struct tegra_vi_channel *chan)
 {
 	v4l2_ctrl_handler_free(&chan->ctrl_handler);
@@ -1115,7 +994,6 @@ int tegra_v4l2_nodes_setup_tpg(struct tegra_video_device *vid)
 			goto cleanup;
 
 		v4l2_set_subdev_hostdata(&csi_chan->subdev, vi_chan);
-		vi_tpg_fmts_bitmap_init(vi_chan);
 		csi_chan = list_next_entry(csi_chan, list);
 	}
 
@@ -1319,13 +1197,6 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 		goto unregister_video;
 	}
 
-	ret = vi_fmts_bitmap_init(chan);
-	if (ret < 0) {
-		dev_err(vi->dev,
-			"failed to initialize formats bitmap: %d\n", ret);
-		goto unregister_video;
-	}
-
 	subdev = tegra_channel_get_remote_bridge_subdev(chan);
 	if (!subdev) {
 		ret = -ENODEV;
diff --git a/drivers/media/platform/nvidia/tegra-video/vi.h b/drivers/media/platform/nvidia/tegra-video/vi.h
index ac86f11588f95..fb377d428d510 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.h
+++ b/drivers/media/platform/nvidia/tegra-video/vi.h
@@ -29,8 +29,6 @@
 #define TEGRA_DEF_HEIGHT	1080
 #define TEGRA_IMAGE_FORMAT_DEF	32
 
-#define MAX_FORMAT_NUM		64
-
 enum tegra_vi_pg_mode {
 	TEGRA_VI_PG_DISABLED = 0,
 	TEGRA_VI_PG_DIRECT,
@@ -172,8 +170,6 @@ struct tegra_vi {
  *
  * @ctrl_handler: V4L2 control handler of this video channel
  * @syncpt_timeout_retry: syncpt timeout retry count for the capture
- * @fmts_bitmap: a bitmap for supported formats matching v4l2 subdev formats
- * @tpg_fmts_bitmap: a bitmap for supported TPG formats
  * @pg_mode: test pattern generator mode (disabled/direct/patch)
  * @notifier: V4L2 asynchronous subdevs notifier
  *
@@ -223,8 +219,6 @@ struct tegra_vi_channel {
 
 	struct v4l2_ctrl_handler ctrl_handler;
 	unsigned int syncpt_timeout_retry;
-	DECLARE_BITMAP(fmts_bitmap, MAX_FORMAT_NUM);
-	DECLARE_BITMAP(tpg_fmts_bitmap, MAX_FORMAT_NUM);
 	enum tegra_vi_pg_mode pg_mode;
 
 	struct v4l2_async_notifier notifier;
-- 
2.53.0

