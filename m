Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604919;
	b=xdMxhDkYB1tEhPFuSyMTgQUa5SlYVsxyqEJ3KHdpBzU8uZTWIDc/T+7s9sDGbBbA8KxN
	 bLudJ7CJqts7keKgdmYS9jdkYqvV+EinFslKxE+G9+LWRtBZOwqskv3BrLKB1X3RXkaUZ
	 j4R7zVUcOfdVueopY+9clPugeJRF/lWxXY7RBKyxP7I7Jntp4WZws+bbmNRC1DSw/kBIy
	 9jGSZqM7oFbZIrDAFNwNVuxSlTbn4gXOtRlvXBuI21USkmUQ/80jn0cACP7j8EksZBpWi
	 251iLOLj4iyrwPuM74NJ+BQ7G4o05hJ2bYuETpxx0qVrQ3LAU2p2n+KR6uT7oMNvqKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5DO0x7sKjKjbUoxBHjrsjRS6Z9YOvewyvxNNPFbGyv0=;
	b=p7ngRuBIGIP5u3iXEzWT1jCR6XzpGmwLmxLFIBwfzH/qcC/CJ2718eUrgpWgjEiUqdA0
	 zXOALDJPAEp1sP2akMiNWKaxEKxsVjFNwGuaGB3+k+rwVJgw0FzR51jTT8exobSv0txyD
	 K5uHF3f/lWDj5Ip7lNpMSbF1PRKnaG81msLGMg/yl6DjVWomaKPO/Tl5mFvjdF+mnWsNQ
	 igvStoXpZNxql0opwyzbSteXbTfKYPThda7wE/CcEVi2MALa7MzUQViFjJ2ilWRkLtpwE
	 Cvf+7SLO7ouHOCBXBFdoy3cHz4K0Cw5tA+jPZALnd7Ii8I9cThLKKB0doyWnvPkDJEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gc4Zwuyg;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4EB606A6A0
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F4EB606A6A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gc4Zwuyg
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c50cc7540b7so790949766b.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604917; x=1796209717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5DO0x7sKjKjbUoxBHjrsjRS6Z9YOvewyvxNNPFbGyv0=;
        b=Gc4ZwuygJB2XjGQcNsxF1ZNKcZ4bhPUiQ/ULna7jT0wgxm/r2q0Op6MkCmMWWvTBrq
         ZJ9Ahrd9AW3JNPR41AaB+AU4b1lz2xNb3JyQliTYquK76oYBKalHmeCQ/11O5wHFBAoD
         VMb1xvfv8YcJ7EndWuquS4YDEJ4obXeK1DYtvWUs+7lUQYw9dX+BiAhMJC5uxXiOoF08
         GlY9MP7YyE190MBFW4DpNpkl47VpJVBahqMhHAHTj+gurjNdrXEfWtHOOTh0EKJWVK4w
         VhhpV7mNcni9dyDOnJato/1Z6S7gjnM094fIFznE1w6hRK0hypbNZYXd1KEmr9X1Y9qc
         wdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604917; x=1796209717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5DO0x7sKjKjbUoxBHjrsjRS6Z9YOvewyvxNNPFbGyv0=;
        b=UkipzzKGOu4UXhimPYBhrZHzkpUuQ3rXriV9MNS59grrL0oP2IAn9777sf62KKNaSS
         FnZuUoMvFm0gg4aa7U25v6McOCUFjad4hR1A4T3gQ8doGVB33/6lNDUi2YxDznD0BlsQ
         0Ofx5gVEYb/D7O5tytfulsXXoHI6bhwjMxm0r2ooEnOVv4PMEhaK/+TvTMFl1UUzxrai
         3u/klL5zdnucf8jtfW8BpFFFmgm4VHakK1w0ov+1Lsialoa0/8mjfVzdTRWVVxvGz5yO
         lAggVf/znglWDvCTorFafrtSZz9yTH3OPfQpRE9xPQKmJPWJSLD1K8KEJWfIWpXEtodi
         /e5A==
X-Gm-Message-State: APuU4Z9tSOviaxjfX5my8Z0n9prx+h09JIK7tTbqOshVRO/IunEOel09
	v9If3AwDUAws9luf/iF9LRku76D9v5ej0I8PM5iIEnUcrn1njiIFgZsb
X-Gm-Gg: AZFdTZemiy+F44sYy+cFcXCOtk5vnUyDnsFSLukG1Skq+Iin5ma7qizKDC3VWLg4+BN
	mj9iD+JtiDayQYQTau1p8Vs1T46rHZcGzIT7tqzyY2WYSLrSfSbsDRuvrFsW+KS2o1XOLEQKvSW
	UzcxS+rXPL5yuGxA2ACrzgwbShdC63rZVkYZ+EB7Q05LosbMEimBWTLq5//S01KPfUqU0cQp7nQ
	ggp0ANlI6dGYfs/Q8jR0Oegj/zsr9jMfvi+djyCZNLOrT61GD+Uaqp7ZUO51wdCwbbaCL4/dReg
	WKWvADYME7eUPyCH++tra8359m8dGrgppV3lr94Ge9MrKp0hOrCSHySz+Qljp+9d7YdGieVl+ze
	FKCUK/fVIa7UTE+AiisjouM56BBdS/43GdfrN/+NhjaxtYzRziwLmQBe7jNnyqpzdsJ2F2y8r3O
	07Jpmto/fcU9J9QQ7F4Zab5K0Rjh85ZbCE+I23vrzv00HH7L9IEmy9Q7gnNuAm+lbhaKhwa5oaX
	v60f01mIJyrmJiXACJG43U8oU2TJ9dDsnjAXAwx+8mMTE3c+bxdr+mcb1e6zIM+kiOhZ3/v3SW3
	5MeHhRkVKleg6SeccA5b+e39avw2s71TPEsAzHTFmq/J/3VXVKRbxymFqkfv40xygJ+eXoFXS2n
	aPMGAptLMyQ==
X-Received: by 2002:a17:907:940a:b0:c33:dbe8:291c with SMTP id a640c23a62f3a-c513a807be9mr1670811966b.20.1795604917491;
        Wed, 25 Nov 2026 03:08:37 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:36 -0800 (PST)
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
Subject: [PATCH v1 12/13] media: tegra-video: csi: Add pad and media operations for own CSI channels
Date: Wed, 25 Nov 2026 13:07:49 +0200
Message-ID: <20261125110750.223628-13-clamor95@gmail.com>
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

Implement pad format enumeration, format negotiation clamped to SoC
limits via vi_fmt_align(), subdevice state initialization across sink and
source pads, and v4l2_subdev_link_validate() for CSI bridge channels
when TPG mode is disabled.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../media/platform/nvidia/tegra-video/csi.c   | 154 +++++++++++++++++-
 1 file changed, 152 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/csi.c b/drivers/media/platform/nvidia/tegra-video/csi.c
index fb6608e0f632d..aaab884d99f54 100644
--- a/drivers/media/platform/nvidia/tegra-video/csi.c
+++ b/drivers/media/platform/nvidia/tegra-video/csi.c
@@ -322,6 +322,138 @@ void tegra_csi_calc_settle_time(struct tegra_csi_channel *csi_chan,
 				   / (2 * pix_clk_mhz) - 5000) / 1000;
 }
 
+/*
+ * Proper CSI configuration
+ */
+
+enum tegra_csi_bridge_pad {
+	TEGRA_CSI_PAD_SINK = 0,
+	TEGRA_CSI_PAD_SOURCE = 1,
+	TEGRA_CSI_NUM_PADS,
+};
+
+static const u32 tegra_csi_mbus_formats[] = {
+	/* RAW 8 */
+	MEDIA_BUS_FMT_SGBRG8_1X8,
+	MEDIA_BUS_FMT_SBGGR8_1X8,
+	MEDIA_BUS_FMT_SRGGB8_1X8,
+	MEDIA_BUS_FMT_SGRBG8_1X8,
+	/* RAW 10 */
+	MEDIA_BUS_FMT_SGBRG10_1X10,
+	MEDIA_BUS_FMT_SBGGR10_1X10,
+	MEDIA_BUS_FMT_SRGGB10_1X10,
+	MEDIA_BUS_FMT_SGRBG10_1X10,
+	/* RAW 12 */
+	MEDIA_BUS_FMT_SGBRG12_1X12,
+	MEDIA_BUS_FMT_SBGGR12_1X12,
+	MEDIA_BUS_FMT_SRGGB12_1X12,
+	MEDIA_BUS_FMT_SGRBG12_1X12,
+	/* RGB888 */
+	MEDIA_BUS_FMT_RGB888_1X24,
+	MEDIA_BUS_FMT_RGB888_1X32_PADHI,
+	/* YUV422 */
+	MEDIA_BUS_FMT_UYVY8_1X16,
+	MEDIA_BUS_FMT_VYUY8_1X16,
+	MEDIA_BUS_FMT_YUYV8_1X16,
+	MEDIA_BUS_FMT_YVYU8_1X16,
+};
+
+static u32 tegra_csi_get_format_code(u32 code)
+{
+	u32 i;
+
+	for (i = 0; i < ARRAY_SIZE(tegra_csi_mbus_formats); i++)
+		if (tegra_csi_mbus_formats[i] == code)
+			break;
+
+	if (i >= ARRAY_SIZE(tegra_csi_mbus_formats))
+		return MEDIA_BUS_FMT_SRGGB10_1X10;
+
+	return tegra_csi_mbus_formats[i];
+}
+
+/*
+ * V4L2 Subdevice Operations
+ */
+static int tegra_csi_enum_bus_code(struct v4l2_subdev *subdev,
+				   struct v4l2_subdev_state *state,
+				   struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->pad == TEGRA_CSI_PAD_SOURCE) {
+		const struct v4l2_mbus_framefmt *sink_fmt;
+
+		if (code->index)
+			return -EINVAL;
+
+		sink_fmt = v4l2_subdev_state_get_format(state,
+							TEGRA_CSI_PAD_SINK);
+		code->code = sink_fmt->code;
+
+		return 0;
+	}
+
+	code->code = tegra_csi_get_format_code(code->index);
+
+	return 0;
+}
+
+static int tegra_csi_set_format(struct v4l2_subdev *subdev,
+				const struct v4l2_subdev_client_info *ci,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_format *format)
+{
+	struct tegra_vi_channel *chan = v4l2_get_subdev_hostdata(subdev);
+	struct v4l2_mbus_framefmt *mbus_fmt = &format->format;
+	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
+	struct v4l2_frmsize_stepwise stepwise = { };
+	struct tegra_vi *vi = chan->vi;
+
+	/* The format on the source pad always matches the sink pad. */
+	if (format->pad == TEGRA_CSI_PAD_SOURCE)
+		return v4l2_subdev_get_fmt(subdev, state, format);
+
+	sink_fmt = v4l2_subdev_state_get_format(state, TEGRA_CSI_PAD_SINK);
+	src_fmt = v4l2_subdev_state_get_format(state, TEGRA_CSI_PAD_SOURCE);
+	if (!sink_fmt || !src_fmt)
+		return -EINVAL;
+
+	mbus_fmt->code = tegra_csi_get_format_code(mbus_fmt->code);
+	mbus_fmt->field = V4L2_FIELD_NONE;
+
+	/*
+	 * CSI and VI have same size restrictions but they are SoC specific.
+	 * Use VI operation to get them.
+	 */
+	vi->ops->vi_fmt_align(NULL, &stepwise, 0);
+
+	mbus_fmt->width = clamp_t(u32, mbus_fmt->width, stepwise.min_width,
+				  stepwise.max_width);
+	mbus_fmt->height = clamp_t(u32, mbus_fmt->height, stepwise.min_height,
+				   stepwise.max_height);
+
+	*sink_fmt = *mbus_fmt;
+	*src_fmt = *mbus_fmt;
+
+	return 0;
+}
+
+static int tegra_csi_init_state(struct v4l2_subdev *subdev,
+				struct v4l2_subdev_state *state)
+{
+	struct tegra_csi_channel *chan = to_csi_chan(subdev);
+	struct v4l2_mbus_framefmt *fmt[TEGRA_CSI_NUM_PADS];
+
+	for (int i = 0; i < chan->numpads; i++) {
+		fmt[i] = v4l2_subdev_state_get_format(state, i);
+		if (!fmt[i])
+			continue;
+
+		*fmt[i] = chan->format;
+	}
+
+	return 0;
+}
+
 static int tegra_csi_enable_stream(struct v4l2_subdev *subdev)
 {
 	struct tegra_vi_channel *chan = v4l2_get_subdev_hostdata(subdev);
@@ -483,6 +615,12 @@ static const struct v4l2_subdev_pad_ops tegra_csi_tpg_pad_ops = {
 	.set_frame_interval = tegra_csi_tpg_set_frame_interval,
 };
 
+static const struct v4l2_subdev_pad_ops tegra_csi_pad_ops = {
+	.enum_mbus_code = tegra_csi_enum_bus_code,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = tegra_csi_set_format,
+};
+
 static const struct v4l2_subdev_ops tegra_csi_tpg_ops = {
 	.video = &tegra_csi_video_ops,
 	.pad = &tegra_csi_tpg_pad_ops,
@@ -490,12 +628,21 @@ static const struct v4l2_subdev_ops tegra_csi_tpg_ops = {
 
 static const struct v4l2_subdev_ops tegra_csi_ops = {
 	.video = &tegra_csi_video_ops,
+	.pad = &tegra_csi_pad_ops,
 };
 
 static const struct v4l2_subdev_internal_ops tegra_csi_tpg_internal_ops = {
 	.init_state = tegra_csi_tpg_init_state,
 };
 
+static const struct v4l2_subdev_internal_ops tegra_csi_internal_ops = {
+	.init_state = tegra_csi_init_state,
+};
+
+static const struct media_entity_operations tegra_csi_media_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
 struct v4l2_subdev *tegra_channel_get_remote_csi_subdev(struct tegra_vi_channel *chan)
 {
 	struct media_pad *pad;
@@ -544,8 +691,8 @@ static int tegra_csi_channel_alloc(struct tegra_csi *csi,
 	chan->of_node = of_node_get(node);
 	chan->numpads = num_pads;
 	if (num_pads & 0x2) {
-		chan->pads[0].flags = MEDIA_PAD_FL_SINK;
-		chan->pads[1].flags = MEDIA_PAD_FL_SOURCE;
+		chan->pads[TEGRA_CSI_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+		chan->pads[TEGRA_CSI_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
 	} else {
 		chan->pads[0].flags = MEDIA_PAD_FL_SOURCE;
 	}
@@ -676,6 +823,8 @@ static int tegra_csi_channel_init(struct tegra_csi_channel *chan)
 		snprintf(subdev->name, sizeof(subdev->name), "%s-%d", "tpg",
 			 chan->csi_port_nums[0]);
 	} else {
+		v4l2_subdev_init(subdev, &tegra_csi_ops);
+		subdev->internal_ops = &tegra_csi_internal_ops;
 		snprintf(subdev->name, sizeof(subdev->name), "%s",
 			 kbasename(chan->of_node->full_name));
 	}
@@ -684,6 +833,7 @@ static int tegra_csi_channel_init(struct tegra_csi_channel *chan)
 	v4l2_set_subdevdata(subdev, chan);
 	subdev->fwnode = of_fwnode_handle(chan->of_node);
 	subdev->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	subdev->entity.ops = &tegra_csi_media_ops;
 	subdev->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 
 	/* initialize media entity pads */
-- 
2.53.0

