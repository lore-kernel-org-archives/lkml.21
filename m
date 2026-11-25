Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604917;
	b=Uo24WvYhlXBSSqO6Gn1ix7ig2qP6PQSbyNeP7QxCeElV16p+NY7pFgJY4pHT9yejqKpm
	 0LhdyHGA9UZ8fIoqvpjHqVd1plAdZNUFmdQQSvdE5MdREyz23tiQvmptOqEjZsERCJnMY
	 Z9GROfSYqJg6q6woR7tALuekQycF1b7fhFEw29reX71MJWC3YUuh7R301dRIlZSSH/8Hf
	 SsDwVerFYgJAf0UVD4j2gqy63Bf2My1DDlXW4q+uEdD9pdtMrTvxOLNC3Do7a8e9W6OP/
	 y3nL3vrQMsD2d9G2p5vONYjeeVNzfiuSOlnGUclFmkFSQ1uUUtQpPSIbMc14BdorI8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604917;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EYa64r4v9WS67AE28HTR6GMnmq7I9DrwDxtBYjX90f0=;
	b=O4CvUmqPaLLO9thk1b5ziaxnQ7FqX7htgJ22cB/2DIlpgCmYfAsbxzmoijEL087NevZE
	 P+epzFg9RbjGINioo8QbxHxQ18PlcGQ7Xzs+ZoKdy5vbm8LfAEjL3M9Cfg4dTbdLhTE3u
	 cUN8qY38EEffBTM+b37uBCXnSVPI+EW4OiGQCOpjvRZBRLct73YmjDKuLE/WsB3l8wIGW
	 B6OadyHSxLMyoAgT/xgzZi+BQycdyCaj7zXHhXIrVEG21FtPkgyRfY2CKABgaJfaz3uWP
	 6QUUh6U1LnxgV2CH64NPg6DxiqBc75fCLkZ7OXd5uGRooWHZM1/wwmyUY8d0XNTkCrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rzAG+R7O;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4807C60A262C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4807C60A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rzAG+R7O
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c5198302d38so245322866b.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604915; x=1796209715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EYa64r4v9WS67AE28HTR6GMnmq7I9DrwDxtBYjX90f0=;
        b=rzAG+R7OGfpYIB/vSK+nQS4fg2mopqaaQ0Qp5Qllc74eeHmK1+lDCrrlpjg7HyHofi
         7GfjB1s0hnYOgDPEE77jMewmS7uFpIV/3y/SD6t+tMmZUOYN0BUiHRhYVgboxEWAEylA
         FjfJKgW+r4nWCiTMN8QkI9KJ0XNK67dI76UtIRcrVEUA7HbF4DzWar1AHVKiFv0i2ncZ
         oGQvrMZXUpbnFtPkDNmmxIUb5Ql2fy2ACutBgOTUrWtdDR4jr/DiO1xKEXh2USUyJHp0
         Oxoo5xIYLijF9tD/cdW1sU1mffHtUI/UHKQZf0ZxU8go2fESc3MKTRdXF8S3Mk3g4WkN
         Ps4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604915; x=1796209715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EYa64r4v9WS67AE28HTR6GMnmq7I9DrwDxtBYjX90f0=;
        b=bKNUQb9rGeBdPoFLBfy3BkmcrLKdP1Q9LaxfJOGfQZmawwt3391yRtjfKxwZWf7u04
         /bZIRHuchXWZ1fbZFFOeqI8+l0AAoabxSuAxmvriXLdC6LhnWX5CcJOJ/5ceuEnwJyiN
         5fHE8wbEvV5ce74tkg78NIho6d108MyZEY9EdlZe8g2jqhKRefCo+zYcgqf167kOywVb
         VxKqK6h+kWP1LWYhJigEbTR/p7DZHm8dnl0b7xLXBxRFEs8B8CT7Foq70ByEMqF7EiKq
         enoa3ucR1ydE7wLA5zzfxiinc4HMtMdILGivH/azcydJISi5OxWk6SG+T9KSpfr9SANh
         S+UQ==
X-Gm-Message-State: APuU4Z/KqxzfG7Y9SJhP13mL92YHfhiSGRv0GeJNfj/WJ4X7MKFuSgFI
	15ieBdpnmkDUaIGVagugWfxeEGkaQJcZ9fSzehk4+80hQTq6mYLZyfPL
X-Gm-Gg: AZFdTZc45UJpopPDs9Ew6xjVaTcFuV+p8OUHTlV65xXLRvC10kNdKYW4iGYmy2OSKEo
	k7ngmxSlLW3DbPFhVdyiOzkjboBGuWoIskeSnrE5oslYgFd8DX9q3WEW37bVeJV1MzuWE0heWov
	SAQfGFs+1DazM+A74w2GztE+3x4+039cisi+Xx3i1sw7qhB5pV4Ti5kwrQIyzi9uPfrDkFDLLin
	4L44/c8nZKW0WxNkc0RCo3CFNqh3AeMk0R2ycRrnFqWvezbBcGU1umiG9kELLieggnsWomARaID
	Uk6nXvLruz12SXaJpILeU3Dpuwmn3dD3aXKCmPJxzYxf7tP1v7sV43Tn/ds1GdVhMenTpPBFfI9
	+HParxoAxaX0qVLiEB/2Ea6FScaQn1UZrv8NImnh84afNZXmxFyZ1yScvCq33NfETFO0dmw8aV7
	IQVyfvSG5F/3l9AQKkGlSdWAQVHbUhtGgzoxCcfDdy1UBhW2yGnfIF/eg3xWSQAC1lH02FcUPjX
	1TRYghrl5Xq01EogwhDM1b+WHPjuFx46f3X6L0fFDJU09kOJKmyqzw21wd6HGFnSy9Pclfvta3q
	8NzZUtbmfLPlchxTPJeGM3SdOL+Ns469wb/wHFCUTOGjEU+aGc38ZGJjM9sligYLj1D3ilPZgWd
	q602hN1Pw1ZHmB786sGcXUBDCDRoW6TMM
X-Received: by 2002:a17:907:9111:b0:c4d:31c5:cda with SMTP id a640c23a62f3a-c513a8140bdmr1037767666b.21.1795604914542;
        Wed, 25 Nov 2026 03:08:34 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:33 -0800 (PST)
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
Subject: [PATCH v1 10/13] media: tegra-video: Remove remote source subdev helper
Date: Wed, 25 Nov 2026 13:07:47 +0200
Message-ID: <20261125110750.223628-11-clamor95@gmail.com>
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

Look up the remote source subdevice directly via
media_entity_remote_source_pad_unique() in csi_get_pixel_rate(),
tegra_csi_enable_stream(), and tegra_csi_disable_stream(), allowing
tegra_channel_get_remote_source_subdev() and its subdev hostdata setup in
VI to be removed.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../media/platform/nvidia/tegra-video/csi.c   | 28 ++++++++++++-----
 .../media/platform/nvidia/tegra-video/vi.c    | 30 -------------------
 .../media/platform/nvidia/tegra-video/vi.h    |  2 --
 3 files changed, 21 insertions(+), 39 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/csi.c b/drivers/media/platform/nvidia/tegra-video/csi.c
index add526de536f9..ab6162720ab78 100644
--- a/drivers/media/platform/nvidia/tegra-video/csi.c
+++ b/drivers/media/platform/nvidia/tegra-video/csi.c
@@ -282,12 +282,17 @@ static int csi_init_state(struct v4l2_subdev *sd,
 
 static unsigned int csi_get_pixel_rate(struct tegra_csi_channel *csi_chan)
 {
-	struct tegra_vi_channel *chan;
+	struct v4l2_subdev *subdev = &csi_chan->subdev;
 	struct v4l2_subdev *src_subdev;
 	struct v4l2_ctrl *ctrl;
+	struct media_pad *pad;
+
+	pad = media_entity_remote_source_pad_unique(&subdev->entity);
+	if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+		dev_err_probe(csi_chan->csi->dev, -ENODEV,
+			      "failed to get source entity\n");
 
-	chan = v4l2_get_subdev_hostdata(&csi_chan->subdev);
-	src_subdev = tegra_channel_get_remote_source_subdev(chan);
+	src_subdev = media_entity_to_v4l2_subdev(pad->entity);
 	ctrl = v4l2_ctrl_find(src_subdev->ctrl_handler, V4L2_CID_PIXEL_RATE);
 	if (ctrl)
 		return v4l2_ctrl_g_ctrl_int64(ctrl);
@@ -383,6 +388,8 @@ static int tegra_csi_enable_stream(struct v4l2_subdev *subdev)
 
 	if (csi_chan->mipi) {
 		struct v4l2_subdev *src_subdev;
+		struct media_pad *pad;
+
 		/*
 		 * TRM has incorrectly documented to wait for done status from
 		 * calibration logic after CSI interface power on.
@@ -392,9 +399,12 @@ static int tegra_csi_enable_stream(struct v4l2_subdev *subdev)
 		 * CSI subdev stream-on triggers start of MIPI pads calibration.
 		 * Wait for calibration to finish here after sensor subdev stream-on.
 		 */
-		src_subdev = tegra_channel_get_remote_source_subdev(chan);
-		ret = v4l2_subdev_call(src_subdev, video, s_stream, true);
+		pad = media_entity_remote_source_pad_unique(&subdev->entity);
+		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+			goto disable_csi_stream;
 
+		src_subdev = media_entity_to_v4l2_subdev(pad->entity);
+		ret = v4l2_subdev_call(src_subdev, video, s_stream, true);
 		if (ret < 0 && ret != -ENOIOCTLCMD)
 			goto disable_csi_stream;
 
@@ -425,7 +435,6 @@ static int tegra_csi_enable_stream(struct v4l2_subdev *subdev)
 
 static int tegra_csi_disable_stream(struct v4l2_subdev *subdev)
 {
-	struct tegra_vi_channel *chan = v4l2_get_subdev_hostdata(subdev);
 	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
 	struct tegra_csi *csi = csi_chan->csi;
 	int err;
@@ -436,8 +445,13 @@ static int tegra_csi_disable_stream(struct v4l2_subdev *subdev)
 	 */
 	if (csi_chan->mipi) {
 		struct v4l2_subdev *src_subdev;
+		struct media_pad *pad;
+
+		pad = media_entity_remote_source_pad_unique(&subdev->entity);
+		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+			dev_err_probe(csi->dev, err, "failed to get source entity\n");
 
-		src_subdev = tegra_channel_get_remote_source_subdev(chan);
+		src_subdev = media_entity_to_v4l2_subdev(pad->entity);
 		err = v4l2_subdev_call(src_subdev, video, s_stream, false);
 		if (err < 0 && err != -ENOIOCTLCMD)
 			dev_err_probe(csi->dev, err, "source subdev stream off failed\n");
diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index f2de3aeb05bbc..98411c3f4a037 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -150,33 +150,6 @@ tegra_channel_get_remote_bridge_subdev(struct tegra_vi_channel *chan)
 	return media_entity_to_v4l2_subdev(pad->entity);
 }
 
-/*
- * Walk up the chain until the initial source (e.g. image sensor)
- */
-struct v4l2_subdev *
-tegra_channel_get_remote_source_subdev(struct tegra_vi_channel *chan)
-{
-	struct media_pad *pad;
-	struct v4l2_subdev *subdev;
-	struct media_entity *entity;
-
-	subdev = tegra_channel_get_remote_bridge_subdev(chan);
-	if (!subdev)
-		return NULL;
-
-	pad = &subdev->entity.pads[0];
-	while (!(pad->flags & MEDIA_PAD_FL_SOURCE)) {
-		pad = media_pad_remote_pad_first(pad);
-		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
-			break;
-		entity = pad->entity;
-		pad = &entity->pads[0];
-		subdev = media_entity_to_v4l2_subdev(entity);
-	}
-
-	return subdev;
-}
-
 static int tegra_channel_enable_stream(struct tegra_vi_channel *chan)
 {
 	struct v4l2_subdev *subdev;
@@ -1134,9 +1107,6 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 
 	v4l2_set_subdev_hostdata(subdev, chan);
 
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	v4l2_set_subdev_hostdata(subdev, chan);
-
 	return v4l2_device_register_subdev_nodes(&vid->v4l2_dev);
 
 unregister_video:
diff --git a/drivers/media/platform/nvidia/tegra-video/vi.h b/drivers/media/platform/nvidia/tegra-video/vi.h
index fb377d428d510..44893c5c6e651 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.h
+++ b/drivers/media/platform/nvidia/tegra-video/vi.h
@@ -300,8 +300,6 @@ extern const struct tegra_vi_soc tegra210_vi_soc;
 
 struct v4l2_subdev *
 tegra_channel_get_remote_csi_subdev(struct tegra_vi_channel *chan);
-struct v4l2_subdev *
-tegra_channel_get_remote_source_subdev(struct tegra_vi_channel *chan);
 int tegra_channel_set_stream(struct tegra_vi_channel *chan, bool on);
 void tegra_channel_release_buffers(struct tegra_vi_channel *chan,
 				   enum vb2_buffer_state state);
-- 
2.53.0

