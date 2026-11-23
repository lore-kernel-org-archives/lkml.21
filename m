Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466053;
	b=vxGQBiEpjsuCoMOkZgadApjFOUKuYkQ8eDeiLIvBaybKuwlrFWl/mk2cGbOCdyBroKZN
	 KHcVf9EnCtmVQxa+3T0nXECCwlg/zngIB5l1zwnuWP44RSacP6ee/TAA1nwjlFUMm8EgG
	 h5mR/jcT9oojXcB1MYfXuVvvgbdmIKtf4gbeqgbIBqVbIVK/8bJ8/zlqtLePcmrhurIf6
	 z9082Mn/oLdOQTrDCQ7BpRirwoMze8GRyzwFhTqf03OFBKt9Bg3Bm/upGfal83325VCg/
	 e8bJr+se2ry3dtdg/DVRqAbEe13qct4RDp2qdVx6aWOzmWKnbHnH1VBg2vT3OtDlsNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=veXzAwmEVfaxeQ226TGV88z3qOLGC1lncdwhds4Uw+A=;
	b=L7eSloy1Iz/cdbRaZtyX2OCetBLbmnyZE5BGpegki44pwYyyIl36MzdCzx2TRdtCbbcL
	 uk8//tUWPBi6fLFmMNlqXIv5PYlxjDZawkpBazaYCYF0sFi96D2UbVxsTz56VZxc8sioh
	 djl3WKyJ4q/ZQvDQ9nZEqIZ8EM1l+he2fpkTVgs8dWUwPsSBbV96i8Kg5Y336zi+dAoRu
	 o5BxhYohh3qJCVZSD9CSGbC0JXBvHA/btbYbZsshDwX0MR7kxMlnXkwUcxo8c2M8W0F+X
	 iXIA+8mj212dlOttW5aMKBMbip8j1tSuarTXiEf86JzdURIqFbwf9te7wG6ZpVlkYUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j9Lonnad;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAAD606A69B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFAAD606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j9Lonnad
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so37039985e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795466051; x=1796070851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=veXzAwmEVfaxeQ226TGV88z3qOLGC1lncdwhds4Uw+A=;
        b=j9LonnadtBhcTf4uh0U0BZsh53ugsoPcyeMsAx4M8zEVoUIQZWgx4sd536/f4ke42W
         lzpj1Ltt/hVcEt2NDsDcjBsjhL6TXdtnvHQMM6vxeTXSbmsmCnrbv9f2vKNLe2soN22A
         xBSpTQBvE0IWZwTBwqSReay0ZHWtXtnruWfGeur0k1HgM0c5idG2KW8x5QJpC4dNUx2D
         nLCHdA9w2UntGxU/xuBNR/F2HFG3eohxP+9a9N1MJF6/6vo9XkTN+coK4w3WIriaiLOu
         pPkMuVQgWIesEeKg7fWMjPwkWRDjfxCg5grGIMotONuHmg050PYWgRr4AFL7LyhxCeFn
         Pc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466051; x=1796070851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=veXzAwmEVfaxeQ226TGV88z3qOLGC1lncdwhds4Uw+A=;
        b=Iy6Zovy0W4JzRPYTS2Oxj53w3wCILirwPxUw0TdkuDtWQjHawZ9431m5FWvLYmva77
         6br/q8aRrSKEZfPItfRYqW+udEcHuYNG2iskl/UrDIaPZ4AVvVsiueKpjfJzLmJZCmlQ
         ob/GM2An/C4Ur4MHS4OBFIdX9RLf0g2prsWjw1JSwk9l5dudSTtQWsZOrC9jXyhEP9CK
         lIMKsn8syLIIP0TJTE/lf5hNqqCxhuI6yFeD41lkJTfBYuQB8jNjJJaSYczvNSWxgHA1
         l5dyC/CeZk9DpfW6GZDg9vl9pEZkx9087p6SjoZDcBQX9FGtSjphEGnic93GQ1HXqhtN
         kgKg==
X-Forwarded-Encrypted: i=1; AL+hErHNlKpziZvGjVfngyoskAouEHDs1zd9p5Dp8kQKdp+lvwigNsdxmY2TAxBjDRa7IWmao9V5EdnE4+QOfL0=@vger.kernel.org
X-Gm-Message-State: APuU4Z91HExwAsEHmibUtp8AadjcFJFDcoYnwDiXqjj0j0lMGTtE9g6G
	7gT284A0HktidCOBU/64JKROrHXOIvIbPPycPsz7p5wpNWX0URIlNrw4
X-Gm-Gg: AZFdTZfqOd9X2+w0XIlQGDflxbKrys1FPe7Th8xi2fbSjzJg/WKSLuicTbj6LZ8EIL5
	ZTGv1fW2iNTmXvjiiJ/xOW7qo5oAlvO+3C8KEU8i5mPoJ6a0QHGLsOCNaVcVKaznv7PZNmr2AUf
	771TFWL0q8TmYqyTalOUY/wlFP+0/vDLt4SfqFvA+zZRY2Qd143rXi50Ul9jqIQfdz/Vm+onahp
	IG1m0d0G/7ArJ+hUBcqlW7iZHCKjw5Z4bGyWadsj2zts0rucV5xQt+lOsZhZcDRv6LbzwGmnFDl
	K3ufR9lBeY+uhyr0UJFZzW/qfWlrDhkzCCe7OkL20EXYuI9xJiEXWcwmOtlfdHCqWzWzcUYONQN
	yIWlRMi7pKO4jVND7MqsMBFyEa9x0OvRcVNJ17ZGFEgpI1y9ybX4oL13mI15GT+Ce2I2Y1qwPkD
	BcrW9rBajk7KF0zzZWkGaobvP6/edmZiws6iupurnGvRf3zxY6ooFRHz8imErZAVKip2crGnFhM
	VfeBjuGcGcIB0IgioXmAqth45YEWH61a8snjdLYLeCEr/8SD7pgP1n+i9FEKtn+w2qaCjNHrXHd
	lu0GBoVBeBXKRMhmZYDISK4ffpyE3d1vOv1GAE3E/c/io2QSBVk=
X-Received: by 2002:a05:600c:1548:b0:4a3:5aea:21e5 with SMTP id 5b1f17b1804b1-4bb887fe7e0mr275033015e9.9.1795466051182;
        Mon, 23 Nov 2026 12:34:11 -0800 (PST)
Received: from unknown.local ([151.34.53.154])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm515946805e9.13.2026.11.23.12.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:34:10 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
Date: Mon, 23 Nov 2026 21:33:54 +0100
Subject: [PATCH 2/5] media: qcom: camss: Look up link frequency from the
 sub-device on the CSI-2 link
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
Message-Id: <20261123-b4-ccs-imx376-v1-2-2b26850a6f11@gmail.com>
References: <20261123-b4-ccs-imx376-v1-0-2b26850a6f11@gmail.com>
In-Reply-To: <20261123-b4-ccs-imx376-v1-0-2b26850a6f11@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, Gianluca Boiano <morf3089@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795466045; l=2505;
 i=morf3089@gmail.com; s=20240402; h=from:subject:message-id;
 bh=SE9OTwNvO9+JP6HZCDsYQZuthYLCpe7RvJgDUw4zQ8k=;
 b=hp2zuUZq1Czsv84vJJBNUjKi1nRxNsBpPpdGFETpRZzJgomrKPLSiFPYImHQcAeT+XcHEeqRD
 dUfY47p4cu+CtXJ/2yK8asGvU6efWWj6ePDXG3u1MfbzlagG0IgUUpw
X-Developer-Key: i=morf3089@gmail.com; a=ed25519;
 pk=HsGrEQ3ia8BGGGO8/nUM2K2UX9JKvRPV+nbrVDGrYhA=

camss_find_sensor_pad() returns the pad of the first sub-device found
upstream of the CSIPHY that has the MEDIA_ENT_F_CAM_SENSOR function. This
is the pixel array for a sensor that consists of several sub-devices, such
as a MIPI CCS one, and the link frequency and the pixel rate are then
looked up from the controls of the pixel array.

The pixel array does not have a link frequency control, and the pixel rate
it has is the rate at which pixels are read out from the array, not the
one on the CSI-2 bus. The link frequency used for the CSIPHY clock and
the settle count and the pixel clock used for the VFE clock rate are then
derived from the wrong rate. On Sony IMX376 that is 800 MHz instead of
400 MHz at a 500 MHz link frequency, and the kernel warns:

  v4l2_get_link_freq_ctrl: Link frequency estimated using pixel rate:
  result might be inaccurate

The controls describing the CSI-2 bus (V4L2_CID_LINK_FREQ and the CSI-2
V4L2_CID_PIXEL_RATE) are those of the sub-device that transmits on the
bus, i.e. the one that CAMSS has bound. Return the pad of that sub-device
instead, as the other CSI-2 receiver drivers do.

For a sensor consisting of a single sub-device the result is the same.

Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 drivers/media/platform/qcom/camss/camss.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a..cf86bf04dfe7 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4513,6 +4513,10 @@ void camss_disable_clocks(int nclocks, struct camss_clock *clock)
  * camss_find_sensor_pad - Find the media pad via which the sensor is linked
  * @entity: Media entity to start searching from
  *
+ * The sensor pad is the source pad of the sub-device bound to CAMSS, i.e. the
+ * one that transmits on the CSI-2 bus. For a sensor made of several sub-devices
+ * this is not necessarily the pad of the pixel array.
+ *
  * Return a pointer to sensor media pad or NULL if not found
  */
 struct media_pad *camss_find_sensor_pad(struct media_entity *entity)
@@ -4530,7 +4534,7 @@ struct media_pad *camss_find_sensor_pad(struct media_entity *entity)
 
 		entity = pad->entity;
 
-		if (entity->function == MEDIA_ENT_F_CAM_SENSOR)
+		if (v4l2_get_subdev_hostdata(media_entity_to_v4l2_subdev(entity)))
 			return pad;
 	}
 }

-- 
2.56.1

