Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604906;
	b=QDSCFT/aycfZntNNLJI9xYdpGEV9/2Jva7CzVEji/N1aaQWbdD2wCDtjYfI3bQBNHBCE
	 KxSSR8v6zUqBL+e1P8lyTIwQOZvfErnbPeWQIR9no66DUfqGjbnSzmQtH4xf3DoWnpUcx
	 D5GaxK99BhIXyfrhUbawfrg/cfPnaB4t5fHun0+zshKSrUdMMNMOW42fMOoTGP3OeS3Xt
	 LjEk700NvON4XOC4LezaX12ZG8iDzOvPrwMVDcvw/lRiIqBzTwNJ7Oko/69C0tr90CFVK
	 UuBGJv9RrJVRMQAeOX9SNUt+EHS/4Cg9NbU7Z5FKuIQ+KS2+g4DSQnQ4WDHtcYD3UWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FPC7WvKQPOHddTcCwt5ZfmTpugqnrOt4y+DtQtGxVhA=;
	b=CzTNf4yNmGp3hJMkR8UvDDWi2r0UezpAOFWpPhW5KGv+o9b5Q3wYPVLHuUNk773xseff
	 1LLORVELVEguiSxc32phXFXgOg2+fi7Gl3yPctZNI9SZ9Oix0fGwj1Enpq9nVd9EsD5kY
	 nToufE8CIZAZZIQMSiYboS3o4bbf5O+UE0UxdlI2qz8iNOOaigZ9g8yzhIo34qSv8mYOE
	 qHDtjrsUNg30vb85MZM9ZSlnf9knGQZG4iWRsmWOHImbh/5oCCT+zCHYzhg1fBEJ6CYb3
	 5hUbN9NuiAsmsmWbZPz/YC9ALiUMZO1/qsDQAV1t97X0svvD/xEBTmnPL9w3yTCDHWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ev60ytHr;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF957606A692
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF957606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ev60ytHr
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so932403766b.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604904; x=1796209704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FPC7WvKQPOHddTcCwt5ZfmTpugqnrOt4y+DtQtGxVhA=;
        b=Ev60ytHrSQHBeKtyq7piY+87HV9Q/sxLiGTZ4oeWGaolpSyEaW6VlnhSpdTzUIwDQb
         ls+ObkI2VjYUuIecEQDlc/xVy6VwW8JODj3Kgxd3HgYN2P4sTiktqjPLgWuXa4tbKb74
         LumBod3hO3BHfEdEVC6IUqpTWtBa6+7rPObDTH6wg2KGrJz9vK0Rb2Cp6DjJZRWtJrXo
         kCh7JB40eZsAZj4QhwPeBbi20BJCV5991KT93D9PpNUQSpEkG+hgehgX9aHmIpDZGdqD
         r/EswOL3D1tYb3v6VnwdntKheFyeO88MHO2rVo0YZXlANKrvVCgXLYj3JJAU/OZq5iOZ
         qWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604904; x=1796209704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FPC7WvKQPOHddTcCwt5ZfmTpugqnrOt4y+DtQtGxVhA=;
        b=aa94W1BzIdgsGwgcnByXGjbkMP5MVGdCpSmmOCWqmoF6M69ZqudN2LBAQZl1nyn4oA
         iERfl8YNUm2ZEswm0tdwJIMlbeIzzUYZmUYLcJ7urGVnd5eCMD1ijT0qXHlqeASvGIqM
         zC91h6Z03BIhiokAf+NtIvAq8ZMgEMOPwc0deFVoPC60YF04ZtiYDB2E6qixf6ywP6Ly
         bYQlrpnLDPXtPxFu5RGxUR0x65AvBlJED6jrc9wpK4mgZJstknh9v4lLWqC5QY88Hyu+
         iCZ1OoHTM0w8BwepcRXBDM/6JMoK+MGfJuTpxqYneayfR3nnWddaeZpq38bid78Bzmcy
         t+lQ==
X-Gm-Message-State: APuU4Z8bqs5Wibolemyku0ceinbepl4AalyxEsuR9H8o61DQEPXWqsWo
	u+U4bKSEPLQJt4GVEn+QGRhYpi15hudnF5bc0gq4x5pstxEMPYgGDy0F
X-Gm-Gg: AZFdTZdltMVDSwEb9Bx1glpVP/Yggw5ubNmwFUfTf4XOxvcOd/nJj/B2Fyd2anf8Ba3
	xkzfig03OZPIKnW26hOnw4usTOf/SaAxOfOKiC9xFl+ExoK+ukKvb6omjUMxCYVol/7FSoyLk8a
	uc2pwj7xQG6R9nX02Obve7ChiNTrZeGNjD3096D5bQE65pGXlqzA6QWkJGEQB5qdm7jHcKb5z2b
	AHL638chpK2b39oq4WQ3wWwYx1ETLJh7d9bvEbQuCXQkCAySB/MjhliUtZafGEmN2v8L4CT+Tc6
	mXQwW3RIAVZFE1rqNauUOTa0edVWk9G4g/AZ3I/q/23flipvrQEEQtd3Wvl+ozMNBTWExAT8IRC
	8l/zIgRpp583zgm7cQuTiqI+3YT9Cwr3/Nex7k97LiuW8VZt0uZuT3wxwhppXcQKsVTIDHmftUu
	VMGml2sQksPt3GNi1DvjihZH+TlHo5zl9nonQKAISQ7ik7JQAxi8pr2aUs7D4FjzRTK6fJnuitS
	GUnzR9mWIGgCKcIOZHLOCq7SXG2ahIoYCHAcYoWBB4oXiW94scS+vS5HQ/8MAgTj23b98j8MBEH
	8jqOIMZCtjC2NuBlv7LK/iEINwrGTCokB9M1bhm9tmXsUh3bDv+Gc/OUBeza0KcYIq30LxjySbu
	rnbgz7z8+lw==
X-Received: by 2002:a17:906:5006:b0:c50:5e10:71ae with SMTP id a640c23a62f3a-c513a5e2124mr1216666866b.17.1795604904078;
        Wed, 25 Nov 2026 03:08:24 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:23 -0800 (PST)
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
Subject: [PATCH v1 03/13] media: tegra-video: vi: Expose all sub-devices in the pipeline
Date: Wed, 25 Nov 2026 13:07:40 +0200
Message-ID: <20261125110750.223628-4-clamor95@gmail.com>
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

Add support for exposing /dev/v4l-subdev* nodes for the CSI and VIP bridge
sub-devices to userspace by setting V4L2_SUBDEV_FL_HAS_DEVNODE flag. Call
v4l2_device_register_subdev_nodes() in the async complete notifier
callback to expose all devices in the pipeline, including auxiliary ones.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/platform/nvidia/tegra-video/csi.c | 1 +
 drivers/media/platform/nvidia/tegra-video/vi.c  | 4 +++-
 drivers/media/platform/nvidia/tegra-video/vip.c | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/csi.c b/drivers/media/platform/nvidia/tegra-video/csi.c
index 44bd53dbbf7fd..add526de536f9 100644
--- a/drivers/media/platform/nvidia/tegra-video/csi.c
+++ b/drivers/media/platform/nvidia/tegra-video/csi.c
@@ -680,6 +680,7 @@ static int tegra_csi_channel_init(struct tegra_csi_channel *chan)
 	v4l2_set_subdevdata(subdev, chan);
 	subdev->fwnode = of_fwnode_handle(chan->of_node);
 	subdev->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	subdev->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 
 	/* initialize media entity pads */
 	ret = media_entity_pads_init(&subdev->entity, chan->numpads,
diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index 71921931457be..4753ca89666ae 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -1548,12 +1548,14 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 	struct tegra_vi_graph_entity *entity;
 	struct v4l2_async_connection *asd;
 	struct v4l2_subdev *subdev;
+	struct tegra_video_device *vid;
 	struct tegra_vi_channel *chan;
 	struct tegra_vi *vi;
 	int ret;
 
 	chan = container_of(notifier, struct tegra_vi_channel, notifier);
 	vi = chan->vi;
+	vid = dev_get_drvdata(vi->client.host);
 
 	dev_dbg(vi->dev, "notify complete, all subdevs registered\n");
 
@@ -1610,7 +1612,7 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 	subdev = tegra_channel_get_remote_source_subdev(chan);
 	v4l2_set_subdev_hostdata(subdev, chan);
 
-	return 0;
+	return v4l2_device_register_subdev_nodes(&vid->v4l2_dev);
 
 unregister_video:
 	vb2_video_unregister_device(&chan->video);
diff --git a/drivers/media/platform/nvidia/tegra-video/vip.c b/drivers/media/platform/nvidia/tegra-video/vip.c
index b73ba0eab5573..040776775aacc 100644
--- a/drivers/media/platform/nvidia/tegra-video/vip.c
+++ b/drivers/media/platform/nvidia/tegra-video/vip.c
@@ -165,6 +165,7 @@ static int tegra_vip_channel_init(struct tegra_vip *vip)
 	v4l2_set_subdevdata(subdev, &vip->chan);
 	subdev->fwnode = of_fwnode_handle(vip->chan.of_node);
 	subdev->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	subdev->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 
 	err = media_entity_pads_init(&subdev->entity, TEGRA_VIP_PADS_NUM, vip->chan.pads);
 	if (err)
-- 
2.53.0

