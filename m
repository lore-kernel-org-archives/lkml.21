Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604912;
	b=qbt4NTwuJN9JwOlnYkSGXljEDqmvKBQUQ/m19l9p1ZBk0ZG5rWTubq0xX0vMHwBK/F8A
	 72zK0f1WevE7BqygM4O6D+8W3bUgo0nXweoP8xuG8Id18helYts4InQLZDp5Tydv3f85a
	 udVXYtzVcGegO9Wghc5SsyzzlSZRyTD1dAXwZPlzpnIeRLZOj0LkcSdKSTLrhhVLLgxl+
	 dfhWDs/s50bR99l1rZkTNBSWmUng5aUZnU0Tg0e0+58kkeIpcpDQMAj2nCkNMllRPagtc
	 V8W4un2gF0pJj5RvMfeUtIT+GeW9hqXwjVgEk6rCvf4ZXQtRjdBodzBOp+T98GKXrEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LbKQrYeSQQjIG8o4PeFfuBxBDq4T+YpBKC3L5X8LsTY=;
	b=gZNdJ6V2W6YsedxgVLhNR5e9XmXwLWEJsjGj09CCBu9nb/ZbNUD5CGdPm9pe+C5L5S6x
	 aTsKdQHq/Qy5dXPZKwcKarWx9WBlmY1Gv0i+EgWKr1C3rF7GJD3xrqS7ne2ovRBPLecOq
	 wEvWdNf31jmsBQ0ZaMEiQPHlqAITjeLvioS5wn6f2Y+dj1WKXzIYoRgj2o1WmQq5CmFsY
	 y0ItSjpcdM99IAIbpzwBTP6ZaDW3ZnUT+6yuw/yu4vODeIGspnMM7cMcYvpfaGjHZobNb
	 036oTEvuSIu8Iim+IAA2ubJJt1BFu1TVS8vJ2z81v8GLgnm98oiLgAMrDcgVjezKZ5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jDl04GM0;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC08E606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC08E606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jDl04GM0
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c50a4a2132cso824242366b.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604910; x=1796209710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LbKQrYeSQQjIG8o4PeFfuBxBDq4T+YpBKC3L5X8LsTY=;
        b=jDl04GM04SUvczo1Inokqv8zZl1+LPyhzAvzrssrJVHMKh5h4HAtetz5THXEN9r5Jl
         23djp7SiAZKlGJ4msE9uSBT7Vy4yf3Vl2P/5w9iaVr5b/O0p58q1DTB7zFue0Rcd435W
         zDgdn0wg91yg+0r1tZhw/UJEE4wHT9QYY5VJApULT++uryUXC40omFv6GxVSWvh83g4P
         C89jpRezO0P3Edi3WQInmgAfTZGCXX4Xd6GXJ5BpAegvevJsaPas5TySxpkasLb/5JuG
         RQ/1usTNG7/my5XvbZZ7ALJ1sr/Gw8ew/4LwvE6kBHjJT9M8P8JYrshgkoQywQ4hTa/e
         is1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604910; x=1796209710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LbKQrYeSQQjIG8o4PeFfuBxBDq4T+YpBKC3L5X8LsTY=;
        b=qQAA07pCgssw+sR6Kv6uyxfPQJGvho1hgxR3WnLZVIPzTHIsgZG/vGOMFAvjVyoFqv
         h7IHtOYHa6Ar9sOgePfk0bWP1gBd12dxQXy9gv4A4kh1QIB4zhGDOeL171JTDB34c+ct
         uYFm+RPoEiLDmlzTb0ai13WYnSozvuBsjwhCigEEY9M/b9popBZGr5JQ3wPkjAmkzr8+
         wLg2PnAbrADQ17GBQ/v3AqBreKIogNU1p5ypTUxdThv3GkhosMKyJR7OLDCUR+9DbNep
         XfimT5RZUNGVqv8MrfQn0L7zWxnvOVyZUWLKhQdnYnqtMRHZBkBKYZQxc78FtOlS18U8
         X/+w==
X-Gm-Message-State: APuU4Z/WZPPZ++tYCNlwF0IAE5L7PNeMx0o6DIYZEdPAyks1R6MhYYVz
	xO2Lstm7sDOpSlxCcnZrmXMnZE8rMdd8KVD+oaxGpQVWXUE7FUWwNXdy1BiAMA==
X-Gm-Gg: AZFdTZczryG6/t5EWe6vKo8L6DjpTusyTvMNk5osBzNknnSBXJEqz2/Ccf2IxWx6IVQ
	YWPMQG2TZWMOiYTj8ITDep1yqvxGg3wQDlGL85tPGgvi1cOgCjmAhN4TKZarWnSmqGMdSoBp/jj
	tM0RDkR5ZHksvYBMbwkqRW2NGHIM7VcYO1q8XHWv6oSAbE27d/jwN4FB+CTg133XMNSOtyIx9eg
	1aneIIl0Yw3xBHl7YwNbdob7fhWSEElcZBtTd86JOs2/NiclICReueZedCXthuBOFG49XXZCnPS
	+qZ9ArhoGM3M3CItnOPlPqmdAM6qa6Vcr4TFLtCzIV5+ZL9OVsbxc0s8Pv3SV/tQfFLRLEqumnD
	bc/4UyCqOnHhPq6Av6MtkhjOIPlvhvdGHF0M9kp0PhmWrc7ns5AwgJ8lRgppQIAVPpdAfX02StT
	/OvwEflYqc3XPLDDZALX3I9ZavdwCw4t8hSky6Y8lbPhZlcj2S6EHMESP5sXb3NnxNqS5Nl8ERm
	Ipf4IArmUoFSfSBN0FN8rHdfgcpKhcdyHf+8sjZnQWMxG1bx8z0/ssdY8IbELGlJI27uWseog5u
	L/T6sXcBhXu2TPAQMflKHNPeMNBoEXseccDfwedXn7ByFm/FMy6P62RGx3GeWCGIbghwNPV4SYb
	/TmiflHlL1w==
X-Received: by 2002:a17:906:5593:b0:c40:91fb:b76 with SMTP id a640c23a62f3a-c513ab48008mr1115543266b.33.1795604910057;
        Wed, 25 Nov 2026 03:08:30 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:29 -0800 (PST)
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
Subject: [PATCH v1 07/13] media: tegra-video: vi: Report stepwise frame sizes instead of querying subdev
Date: Wed, 25 Nov 2026 13:07:44 +0200
Message-ID: <20261125110750.223628-8-clamor95@gmail.com>
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

Update tegra_channel_enum_framesizes() to return frame sizes supported by
VI instead of forwarding enum_frame_size to the remote source subdevice.
This also requires switching to V4L2_FRMSIZE_TYPE_STEPWISE with a step of
2, since Tegra VI requires sizes to be divisible by 2.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../media/platform/nvidia/tegra-video/vi.c    | 23 ++++---------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index b523750725254..ed3e1e91baf12 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -311,29 +311,14 @@ static int tegra_channel_querycap(struct file *file, void *fh,
 static int tegra_channel_enum_framesizes(struct file *file, void *fh,
 					 struct v4l2_frmsizeenum *sizes)
 {
-	int ret;
 	struct tegra_vi_channel *chan = video_drvdata(file);
-	struct v4l2_subdev *subdev;
-	const struct tegra_video_format *fmtinfo;
-	struct v4l2_subdev_frame_size_enum fse = {
-		.index = sizes->index,
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-	};
+	struct tegra_vi *vi = chan->vi;
 
-	fmtinfo = tegra_get_format_by_fourcc(chan->vi, sizes->pixel_format);
-	if (!fmtinfo)
+	if (sizes->index != 0)
 		return -EINVAL;
 
-	fse.code = fmtinfo->code;
-
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, NULL, &fse);
-	if (ret)
-		return ret;
-
-	sizes->type = V4L2_FRMSIZE_TYPE_DISCRETE;
-	sizes->discrete.width = fse.max_width;
-	sizes->discrete.height = fse.max_height;
+	sizes->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	vi->ops->vi_fmt_align(NULL, &sizes->stepwise, 0);
 
 	return 0;
 }
-- 
2.53.0

