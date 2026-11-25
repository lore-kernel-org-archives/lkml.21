Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604909;
	b=jkxpbJHxmtM0ZPwmWZ8jMPYj4YfZmuXN+Ocf6T7hRJetA04fQGRQ1jNzmS7rcHvGRMS7
	 JGgZrx1mLQwaVtClfOn94BjCzvSJjGqB7Bag+cdAkcovJcAunoZybBDrLjYlbzGgDO1Ht
	 U0o1fUPRvSOidz99GMX11ddSJe+erNRQJHWpcvCe+yOgCa4c5FlY5+4L5VJc/NFurYra5
	 KFv9LvEp7aGv1hkcF46cskwPN5FY+BBWGx74J9GMYUUq0DdIhFvsSY5UkW/KkCd3ohcet
	 us7ZruYVxP8cQ+h5j58SZrMGjM1RLgahZm0sYrq7d1HlAYZO9YUHaDUFiSapf/ub0Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FbeBc8Xjd8EXP+769RalNkVenzdVJuq6UafMvhubpeQ=;
	b=1/Nck5JPrQa5poU3Xj2ESIW/MuO1KCRNvu+QFVIN1j7lGZBjIdeaWRjvRJsm53rIM616
	 AUyPLGlxsNaawhx9AVUcMHuqzFMURErAivBp4sG2gVaEdi+DTpnFdLbLrA4kV0wadz5KR
	 /QKITkxXVBshzPW9Kht5x5/qj65Vtl3iI0mhn0ZXwEO4CAfzWr4h+/W2Xale4dbQ08bwi
	 M7u3GXrl5JdS4klCeXQwpZkg5VmFwwtg5zBi4EZSoVg+vZVElTZSHQre51G81GUCF62id
	 LobT/EU+TLFXzePAB83sPL7ROwYePm+xQxNI8FDDdTm06sqhGHRqa+PHWHaAt0Hzrng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHz5TOqV;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7284606A339
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:08:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7284606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHz5TOqV
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c5188e4980fso54300066b.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604907; x=1796209707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FbeBc8Xjd8EXP+769RalNkVenzdVJuq6UafMvhubpeQ=;
        b=CHz5TOqVYPuX2mfZeJtdw9oCoXrqneAWxSeSJv9oYAuXBhwKY3Zw/rVi1CYbwu2u/Y
         z1nx+NS3szCEfEjP+f3PnnoyTj0jDh1RStWaSSEpjF82/BjaaHXy5b0vFXoA4jP0Tpwp
         KAF47GK5DtIW5bJYEosSqbPo3pDu6G0rgK83lbrhbBH8YKUrc5clfLF1o5OXMRlUVnfI
         rdFB4GabdnYOrP9R1L555kAr1OwUTw6sUlqu1si3LJ7GFc0V8tErRUjsbatbw2SW02wK
         NDhSfnLmeNkmJ+Lu9y1AMne99AtJQUiFaP62WXWG6azy6n4eR+qrFtWCtzHZAoH0BjqB
         ZB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604907; x=1796209707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FbeBc8Xjd8EXP+769RalNkVenzdVJuq6UafMvhubpeQ=;
        b=qeceOO/efb4/OEVZFgPR92qQLh7Vv+45E7esdFjZ7zs+TVuh8yVe6NFTq8LrFtlTGq
         qja5yrLSFODAOPi5y7uH3cDTv6pT63+owgS1H9V+cw4B/xEjqbvfkoDhSUOXtXVFLgmf
         U2ljjUWJ4nrbVfyD8dNavm96HjWOWf8lh6XhUSkxJWIEr1sFvVMNkd5K2nIKRqfgQfi4
         w32LZ/uP4/0hs6Jt0jbAu1vb7IgBvXjana/vGvdlG0hUVATlGl7JCmCNm8LkMeN81ZQo
         N+wVD3hD1ylEQPvmUgSkCDQJaApo44ynfjuXWo6qiwO/TN8ynrMpRVQrPXntcjIk/bpt
         YtdQ==
X-Gm-Message-State: APuU4Z+jN1B9mjVRl6+NDpGY5g+N/uOc8L7Ln9mzofBn2a/+SFLGflKC
	xMjM2wSM6+2dW0lpjRKBw6Zbrt/a3Tnk3GiP/JIryF/uEf6MqCOE5o1m
X-Gm-Gg: AZFdTZdYBEIzKaxzS7LIPSW+iod/uvspyPrCsRncShGBwtSVjz31nqb/b6Z0zfS5mhY
	4c4keNFuB/HTNtAiEN/GQeOLd3mk60oKNCuUwfzHUSGEndAJfRZRElRheJNvqmersHccxDlBGtz
	NeYJTxeRaNqYArbAdJ22X6wBaBaYxWst6OQTIgwMoEkE4haTjfHJqJwbjGIx+04Bc42dPEjy93D
	GImS21c5dzscC9Mu7gzg+qCDSn5/chjTZ5Tr8fnXvxC8AsukMlz47xn3o9Tje+4Ii3DPwSVIbLh
	VhH4FCtTeOm6mP1U4HBjvT9fizwZOaRh5/MYGYFu1SIT4yEQc/bdoPGaueqfetIkiGxsRlpYEuX
	e2BPJODCmUL1G1TGRBmL38WxsVLgI4BG8ZhMq8Ca9oYe1D6WY1s/4HPlTGt+p06gX7yVz4S1MK9
	PVSKbjejz8PgAWPOyWbVJF49ZD96sKc4lt/6bnfmeeE3RkuN5Fu5U35uoFORzhrQHn7Hx3U2Tcj
	enSMYdr3+PHMIQuTQPFn1EFvek9sF0qev7M9QgZq/N/MeTWVGfjzmPBwUNDpzEgD91swWuiUZYk
	06wMLbDFuoIN35QGFZF9cLIQRdHomxO53qoTtrD0esSnpZ3Dq2xjr/LIymqp0iOIHDZCMC5GXfq
	NMjZFXDXOuw==
X-Received: by 2002:a17:906:115a:b0:c1f:983f:d8a with SMTP id a640c23a62f3a-c513a89ec1emr1095743666b.24.1795604907065;
        Wed, 25 Nov 2026 03:08:27 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:26 -0800 (PST)
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
Subject: [PATCH v1 05/13] media: tegra-video: vi: Implement link_validate for video entity
Date: Wed, 25 Nov 2026 13:07:42 +0200
Message-ID: <20261125110750.223628-6-clamor95@gmail.com>
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

Add tegra_channel_link_validate() and attach it via
tegra_channel_media_ops to chan->video.entity.ops to verify that the
remote subdevice pad's active format (dimensions and media bus code)
matches the channel's configured format during media pipeline validation.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../media/platform/nvidia/tegra-video/vi.c    | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index 376f53f44b90d..5b38bae648686 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -558,6 +558,46 @@ static int tegra_channel_log_status(struct file *file, void *fh)
 	return 0;
 }
 
+static int tegra_channel_link_validate(struct media_link *link)
+{
+	struct video_device *video =
+		media_entity_to_video_device(link->sink->entity);
+	struct v4l2_subdev *subdev =
+		media_entity_to_v4l2_subdev(link->source->entity);
+	struct tegra_vi_channel *chan = video_get_drvdata(video);
+	const struct tegra_video_format *fmtinfo;
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.pad = link->source->index,
+	};
+	int ret;
+
+	fmtinfo = tegra_get_format_by_fourcc(chan->vi, chan->format.pixelformat);
+
+	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
+	if (ret)
+		return ret;
+
+	if (fmt.format.height != chan->format.height ||
+	    fmt.format.width != chan->format.width ||
+	    fmt.format.code != fmtinfo->code) {
+		dev_dbg(chan->vi->dev,
+			"link '%s':%u -> '%s':%u not valid: 0x%04x/%ux%u != 0x%04x/%ux%u\n",
+			link->source->entity->name, link->source->index,
+			link->sink->entity->name, link->sink->index,
+			fmt.format.code, fmt.format.width, fmt.format.height,
+			fmtinfo->code, chan->format.width,
+			chan->format.height);
+		return -EPIPE;
+	}
+
+	return 0;
+}
+
+static const struct media_entity_operations tegra_channel_media_ops = {
+	.link_validate = tegra_channel_link_validate,
+};
+
 static const struct v4l2_ioctl_ops tegra_channel_ioctl_ops = {
 	.vidioc_querycap		= tegra_channel_querycap,
 	.vidioc_enum_framesizes		= tegra_channel_enum_framesizes,
@@ -836,6 +876,7 @@ static int tegra_channel_init(struct tegra_vi_channel *chan)
 		 dev_name(vi->dev), "output", chan->portnos[0]);
 	chan->video.vfl_type = VFL_TYPE_VIDEO;
 	chan->video.vfl_dir = VFL_DIR_RX;
+	chan->video.entity.ops = &tegra_channel_media_ops;
 	chan->video.ioctl_ops = &tegra_channel_ioctl_ops;
 	chan->video.ctrl_handler = &chan->ctrl_handler;
 	chan->video.lock = &chan->video_lock;
-- 
2.53.0

