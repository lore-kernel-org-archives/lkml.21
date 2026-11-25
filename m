Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604905;
	b=WwzyZ3h/gFCnXABgfBJoKQij4YVJQqlSlGCGiXxte0SHoaD7aczglVC3vVJtw85VLT2T
	 Zl2Kg/+Kr0A0jOSq/uUBAiZcLdLb5GkL9/BZ9pB4Z71Nq/IBTReaXi0JHhhw3JpnvUs4y
	 wGUgTu9jNrvu85J6JEDPWXooZe8JrhnGlCKb6YEQ5KZFYo60UD/wirOushLVaaUFh/R3i
	 mdsePQg/eZxkwAIj6iNr73CFZinNziIN1mhSWzp+a+8GNjrEfcRORmtuz4itA2wNj8YFv
	 0L2TG5G88osdzCYKDRv1VK8dYCioP2DwamoYcQrtoo7e18piIoI5DBVw/UuMo8/kw6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XXRJcpTU9QjIzfFe4B7wSxdmLX/xKKkJafzMNhCePhM=;
	b=fElQMDG/5nQCgWDIT74fCfIucJfSCEBm2bsLlIS/PP8E460jJGButEz5ReGOXCVPXQse
	 o/B913Hme1Ms6121v8r1mPB6qCgT7w2bzb/R/wC3Twycv4nxG15zp3/rTbMmVPKzSXSf6
	 IwaEK15Af9x4IOfAZEqJj842fR9nJ44TPRGv8HKYzAFdoDgOiIyLpzMaeDUcisZTkzLmv
	 2Hqx/6pYilTsaplO5t8bUfIKOoD1UMKrYi691VviLhsuO+1YM+v6BxpCyv3eYsylddZLT
	 XCnkOiq3JTYDkH4ffFzm8Gc3CAYfdCboqGwu686o6koU1Og0JGsJPxbS/yCFaYNrCng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fiinHlSZ;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5311A606A336
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5311A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fiinHlSZ
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c516a192844so509484166b.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604903; x=1796209703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XXRJcpTU9QjIzfFe4B7wSxdmLX/xKKkJafzMNhCePhM=;
        b=fiinHlSZ4d5n4rtusOLKpKA07IaP8NmNIFpIRUj8t7HuqheUUlByO7nqIWPntp0r+E
         1ZpuiitbvDscUgOjtxsZQcWVuBYSCosRBBJUrZR0Uuz6vgcr/V1jW/77sq3hTniMk4nC
         NBSxkCCDBtkczMdkpJZeCRAFIm4rgQS0ld9c6+QBpgL9m+dSzQWLmSyacyP5TVYsX57b
         6LVST4FiTxHCtjs85cojinGlIaxEZpcyj19cqEiemxobp/zGGA2928l6rdmKT1kCQSzz
         ZtZc+DgZFBIifyGg3PYWbagWs++3PaqRCdccoWHvUbkn+D5zUy6oy1I3bnz+yV1y+feh
         jTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604903; x=1796209703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XXRJcpTU9QjIzfFe4B7wSxdmLX/xKKkJafzMNhCePhM=;
        b=SUro7EIlFp3vqlq4CbC2rGj7X1mDyKvYc5oq9mFy+MdkFSo5oFDFcxKio8ESpj9PqY
         2X+d2aCTFIpE5TjmmGaqmi35NX+Wn7QRlmP9OTFNnYTmWdwO9qFvAZqInGN4qKGx+67H
         reOyiP1TseoO3yJzv+dy/GlCYBQ2BxrkOxp/xMAn4nq8kdXtOttfCygo+ao8yA4x95Lo
         GJ7kzo4pqkPvRNn6EPcJG2UnJCU9HfviQ9G4dWx5zMp2JYOT88t0Ef0MDMluYJ7RbLiN
         9SfxX8DbzZsRyUNvc0w2L0eWPunlLIGC2i4U7uhHrQs4HZcGY4JrFuvMXRl8uIKcZyzM
         4vXw==
X-Gm-Message-State: APuU4Z+tFwXxDhsEtvaPpTOLkYPcdM/XclUJhw9i15p0WGUBhDgzb41H
	YwrYFZ7yQpDjO94VK5AD7tHVjDEDhn+ZMUm2VwYAAMhbFuo/FH0ogJXZ
X-Gm-Gg: AZFdTZe68bHAf9zy87hu33mcPixV/ap+9AwY3WY5T2g/5yvRb+lwsrnsIjzd01sOOYF
	55ERRvYz20FVkm2wTJAyPbqMgGP/sJvo/e0IquzGFzcvCWJ0MYFp5zqnZohP/AZjd+SQ4ozgpm0
	NEsCbKNtdrDZlqxWCjCW2sv1kdsiCzicHQCQnUib92ZfpsjQJgFeQUNlsmdSD9EQMKwyqL0FD54
	NyvGX4ft0MpMCeezIxqb+pVNSDYi7YFnGQMj+6SBjzmuu0axKuJoca0vvruB5AK0l7+DgPJy5l2
	IIZGYTWoH/AGaWg/eUuzEBFC5tdcY3B5zmeAs+z2H35WdhMAcSEcx/8LXlOeu2BvNtSlmZyd2AF
	axrLjvk8iv8oktnaAjgu9t7moNFD/mQrwMFkrsjdJkvJEfYW3yJraL81s2qs4oY6m7aw/mgUjbk
	NU/1IIeLVymGLkilLfDV1m7ZbfqhEcfMRara/u8NBXrOC5EisIE/Xz7YgpscJpvqyDKieFpMZR1
	HrqEoGbdJYAMseUy7o/oXS9Se6G0sUPl1UgjvkQnDtlyj9ZXfp0kTqhri4t/JELpYMTspNUM5bH
	irHydIFRvnfTBabr6bzRcXt7DLeWyV1xywGwebujWsoMac3tM0GrpF0ocEutpLeJUsfeSnhCaiM
	bMLvtj1D29iQ=
X-Received: by 2002:a17:906:4fc4:b0:c51:24a3:208 with SMTP id a640c23a62f3a-c513a5da66bmr1367694366b.9.1795604902648;
        Wed, 25 Nov 2026 03:08:22 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:22 -0800 (PST)
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
Subject: [PATCH v1 02/13] media: tegra-video: vi: Drop controls consolidation into VI device
Date: Wed, 25 Nov 2026 13:07:39 +0200
Message-ID: <20261125110750.223628-3-clamor95@gmail.com>
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

Like any video-centric video input pipeline, Tegra VI combines all
controls from linked devices into a /dev/video*. This behavior is no
longer desired, since it causes conflicts when controls are duplicated and
does not allow including controls from auxiliary devices such as a VCM or
flash LEDs. Remove consolidation of all devices in the pipe into the VI
device.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../media/platform/nvidia/tegra-video/vi.c    | 24 ++-----------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index fa6114f4b9c8b..71921931457be 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -960,9 +960,6 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 		return chan->ctrl_handler.error;
 	}
 #else
-	struct v4l2_subdev *subdev;
-	struct v4l2_ctrl *hflip, *vflip;
-
 	/* custom control */
 	v4l2_ctrl_new_custom(&chan->ctrl_handler, &syncpt_timeout_ctrl, NULL);
 	if (chan->ctrl_handler.error) {
@@ -973,27 +970,10 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 		return chan->ctrl_handler.error;
 	}
 
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	if (!subdev)
-		return -ENODEV;
-
-	ret = v4l2_ctrl_add_handler(&chan->ctrl_handler, subdev->ctrl_handler,
-				    NULL, true);
-	if (ret < 0) {
-		dev_err(chan->vi->dev,
-			"failed to add subdev %s ctrl handler: %d\n",
-			subdev->name, ret);
-		v4l2_ctrl_handler_free(&chan->ctrl_handler);
-		return ret;
-	}
-
-	hflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_HFLIP);
-	if (chan->vi->soc->has_h_v_flip && !hflip)
+	if (chan->vi->soc->has_h_v_flip) {
 		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
-
-	vflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_VFLIP);
-	if (chan->vi->soc->has_h_v_flip && !vflip)
 		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
+	}
 #endif
 
 	/* setup the controls */
-- 
2.53.0

