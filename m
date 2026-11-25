Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604921;
	b=l5R3PLI/u6w11wuAKDSTF1VW3YxlTJ1ygML+T2IS6pKRzJ5HHDPuhERqTjRb60xXltpg
	 xlRiEy2EkK/S/d8CKHnf8cThWZkZcav50ikT0IHfV8z2CuiacvHHbaN7zbf74jlsV2sAW
	 bN1B5sPt97cQvLQFXyuyN1tGnLT+FohfC8AeRsIGBwgFn+2fwSn4rksHO+b0NnUN0MOgI
	 wid8pZtSNjQ9wAbCEXKhUQccl2LSkmxRfC02/UcsGiQdQwXT2FuCE01bHSoBx25oX36du
	 8DsFkif0vk5Sd8lJsluSrdt2rFyPDfLGXQ+kNKfdaQOAUGAS4WweJjzIHT1K53XQeuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NM1ahoT0Xghla9vcxTFJwnAsEHzEgH5Nw3CBVxZQulg=;
	b=QYE3m30R8T1YGUINN9gFLneRsNLmcPgFyQo12HRPkDY4wLADb/KnwIQHZA81dx7KYQPT
	 +f/oGkSrbtcs5hufGHowz6dzO+Qy7DQZuWTyYEypE8pPfNH9VUuUcvs0PiF/SC4E0bqFn
	 1rar2e9gXcE+Dm0z7v1N9xy12FCapD0cFBCVrGTL9LHeC5EpP5PEXPKdXuauvRfDBOk6h
	 0mFgrTrOPDK0GjSrlvL+qvyf1Sv0MbwY6HflVXIn30uREG0QzB3WSVUKesgrRWembUafU
	 fzRNIF9O+sMpYxkkvkWqLS8WSj6FBUnHB+m1eSAbLqUSuqsQg44g0w+b/uCeGhYkFtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YJYdb58p;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A288B60A3803
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A288B60A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YJYdb58p
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c50a4a2132cso824267866b.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604919; x=1796209719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NM1ahoT0Xghla9vcxTFJwnAsEHzEgH5Nw3CBVxZQulg=;
        b=YJYdb58pATWnK3y4qZJ3yF8Y0RfSUfDxyY+3QQ4uiDk4WChVS0DAkrUXVj5wZ9rMGm
         sL80yanT+91GSbIk90/ieT8rLvuqHCwXwEf6Jr+hNa2dHDCNhDgPeh048VnxOmdP8Tjw
         LSJSyJ3oeh3R62wkBgczzhfT06iKgHBGMqovnflXsmd7WL80/Jm5bQHB3Ah1+LK3DJXv
         DFpdhT/x+GpX5Z9ONtrCLT50GtuJ+UJru+NpyDEEYjYNneG5KZOLi/8RqCWbu9V/n4Gh
         FwavPl0D0UxIVogsOnjx3+t5R9jrni4RrAV5ldHTP7F2XMr4d9amadxvhu00brBRdtkg
         2glw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604919; x=1796209719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NM1ahoT0Xghla9vcxTFJwnAsEHzEgH5Nw3CBVxZQulg=;
        b=GeDAJk+slKkZU0p/OakMNxSd4dF55jvTNnP7GPL/N83muQ44jYcF3kZmSdWkbevfsI
         Nufi8DrFk7+efGk3p6AARizeBGSvPfYYiNS5RlwV0F8fyX/j7UOEihYQfEpIyNaKLLzH
         ouZiGmr/4VKnQFLhp5EtGDZFELKNZAz8YzFfHuheqkZmfbBtGc8c3WpQX7ZBQ4kMg7EM
         2RPUyNfKMr+IvzKJo52yrkto/KZxU1dWrXxWbjCXvO7jY4KUAVQkP2zTSWctZZLfbt6A
         BRKQ4/oa6HQBHsmZkptgUla8itadj+iB+OevT5K/o+5PY0MrPNQIzs38g9XFPBQYhJVc
         C6eg==
X-Gm-Message-State: APuU4Z/rRAbNfbPEh1lJhBy9ICmqm0XNIak4cux4LcSq4gLoIQKStHiy
	aqecHk4pcf8QzPkXBBQ7ijXQkJJif+A2e8mjlB607r9X46XKXz8iPbGm
X-Gm-Gg: AZFdTZfyaCZ9/jq66nWeIh/mpuT1X/gQMWoytrccy7pgHw83fOudSnCcD6SZS9AP7K9
	vBm6hBSHK++Sf4ZjNUe8jCwsJihw7EqByPwEVH8WtgfJLPCIubs1nje/0lxJ5UalRycJHlRkbWf
	mw5SQaphGTwQxDllW3/YJupbD0s1CGC0BAjtYjhEwU1AvW9ih2cn3kAbZ5CLmbtR/jnookf7nnq
	kbvO7Dnsz0yK1VZ1baoq8FLRqHeVqAPtC7I70a0E3tx3HYXWinSXwQg1I+DIEvSm4MOP3oUPcCv
	77AkqsVfM9gnoSfZoUUXQID0Ni1B5n/HUL69UdQ9mhvDdupRK0m5zq8Em07amsVDif4D70af9VE
	Pd4BXFOFvX3IDbZFUKUOwvqs26P3uiVj0f1PMawzAxMO6q14PM49DmSgagc2mOr6LEKYrUt4jxK
	kck9Jq+fE5iDWBegMuyeuhXRUVhdnR0qj/8F+cvgMVz/qQSKxMc0CY+UvsnpQrOqBGrpmId+/rs
	rY+bF7Mdc2iCgjzOUCFxx5CyA9w6FQ7ZYuM509aPSZ0qtmZcZfApmbSyLsnYhIcirqvRRXFm7lr
	jVXxeJqR/tNsmAVQ+I2p4YrpfEA9uLAVSyk7HUFI4AQ4IYDHU+q3mcu9GooVSSvFWdbe0YQUkQL
	iyny46Xt8IQ==
X-Received: by 2002:a17:907:3dab:b0:c4d:212a:192a with SMTP id a640c23a62f3a-c51a2a75817mr234496566b.48.1795604918938;
        Wed, 25 Nov 2026 03:08:38 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:38 -0800 (PST)
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
Subject: [PATCH v1 13/13] media: tegra-video: vip: Add pad and media operations for VIP subdev
Date: Wed, 25 Nov 2026 13:07:50 +0200
Message-ID: <20261125110750.223628-14-clamor95@gmail.com>
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

Implement pad media bus format enumeration and format setting clamped to
SoC limits via vi_fmt_align(), and attach v4l2_subdev_link_validate()
to the VIP subdevice entity operations.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../media/platform/nvidia/tegra-video/vip.c   | 101 +++++++++++++++++-
 1 file changed, 100 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/vip.c b/drivers/media/platform/nvidia/tegra-video/vip.c
index 040776775aacc..969966f3227f2 100644
--- a/drivers/media/platform/nvidia/tegra-video/vip.c
+++ b/drivers/media/platform/nvidia/tegra-video/vip.c
@@ -21,6 +21,14 @@
 #include "vip.h"
 #include "video.h"
 
+static const u32 tegra_vip_mbus_formats[] = {
+	/* YUV422 */
+	MEDIA_BUS_FMT_UYVY8_2X8,
+	MEDIA_BUS_FMT_VYUY8_2X8,
+	MEDIA_BUS_FMT_YUYV8_2X8,
+	MEDIA_BUS_FMT_YVYU8_2X8,
+};
+
 static inline struct tegra_vip *host1x_client_to_vip(struct host1x_client *client)
 {
 	return container_of(client, struct tegra_vip, client);
@@ -48,6 +56,85 @@ static struct v4l2_subdev *tegra_vip_channel_get_prev_subdev(struct tegra_vip_ch
 	return media_entity_to_v4l2_subdev(remote_pad->entity);
 }
 
+static u32 tegra_vip_get_format_code(u32 code)
+{
+	u32 i;
+
+	for (i = 0; i < ARRAY_SIZE(tegra_vip_mbus_formats); i++)
+		if (tegra_vip_mbus_formats[i] == code)
+			break;
+
+	if (i >= ARRAY_SIZE(tegra_vip_mbus_formats))
+		i = 0;
+
+	return tegra_vip_mbus_formats[i];
+}
+
+/*
+ * V4L2 Subdevice Operations
+ */
+static int tegra_vip_enum_bus_code(struct v4l2_subdev *subdev,
+				   struct v4l2_subdev_state *state,
+				   struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->pad == TEGRA_VIP_PAD_SOURCE) {
+		const struct v4l2_mbus_framefmt *sink_fmt;
+
+		if (code->index)
+			return -EINVAL;
+
+		sink_fmt = v4l2_subdev_state_get_format(state,
+							TEGRA_VIP_PAD_SINK);
+		code->code = sink_fmt->code;
+
+		return 0;
+	}
+
+	code->code = tegra_vip_get_format_code(code->index);
+
+	return 0;
+}
+
+static int tegra_vip_set_format(struct v4l2_subdev *subdev,
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
+	if (format->pad == TEGRA_VIP_PAD_SOURCE)
+		return v4l2_subdev_get_fmt(subdev, state, format);
+
+	sink_fmt = v4l2_subdev_state_get_format(state, TEGRA_VIP_PAD_SINK);
+	src_fmt = v4l2_subdev_state_get_format(state, TEGRA_VIP_PAD_SOURCE);
+	if (!sink_fmt || !src_fmt)
+		return -EINVAL;
+
+	mbus_fmt->code = tegra_vip_get_format_code(mbus_fmt->code);
+	mbus_fmt->field = V4L2_FIELD_NONE;
+
+	/*
+	 * VIP and VI have same size restrictions but they are SoC specific.
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
 static int tegra_vip_enable_stream(struct v4l2_subdev *subdev)
 {
 	struct tegra_vip_channel *vip_chan = subdev_to_vip_channel(subdev);
@@ -104,8 +191,19 @@ static const struct v4l2_subdev_video_ops tegra_vip_video_ops = {
 	.s_stream = tegra_vip_s_stream,
 };
 
+static const struct v4l2_subdev_pad_ops tegra_vip_pad_ops = {
+	.enum_mbus_code = tegra_vip_enum_bus_code,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = tegra_vip_set_format,
+};
+
 static const struct v4l2_subdev_ops tegra_vip_ops = {
-	.video  = &tegra_vip_video_ops,
+	.video = &tegra_vip_video_ops,
+	.pad = &tegra_vip_pad_ops,
+};
+
+static const struct media_entity_operations tegra_vip_media_ops = {
+	.link_validate = v4l2_subdev_link_validate,
 };
 
 static int tegra_vip_channel_of_parse(struct tegra_vip *vip)
@@ -165,6 +263,7 @@ static int tegra_vip_channel_init(struct tegra_vip *vip)
 	v4l2_set_subdevdata(subdev, &vip->chan);
 	subdev->fwnode = of_fwnode_handle(vip->chan.of_node);
 	subdev->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	subdev->entity.ops = &tegra_vip_media_ops;
 	subdev->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 
 	err = media_entity_pads_init(&subdev->entity, TEGRA_VIP_PADS_NUM, vip->chan.pads);
-- 
2.53.0

