Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466051;
	b=Q6NkY/ROFqB27ySZA4ID7m7qSh0nNbgP8htRLDALTt0GtaCr9I3T2BZsgwRKhhiDGFfV
	 mePFlUfkzO8v0ZAf83qUCfN3wr1BeqWbDnlC5pegJoxv5ZbjkXSNdYbkLzRyXRs22jgws
	 tT/P+pnZvA4cG/LKHRWeMuKCKRKtHYfld41EkKs8X/2gB0KdROCvnbdVj+wkY1T+0sY82
	 RDhrODsCldMj7L8nYPeCAYXkBy8vKPnCUUlItAfs20F+O9DbSgOOa9UUcKMbjJo8R1yNl
	 TabTSW3LTfrAfH0ZFSmCN+9glOcxLyjaMj3tZVpzSzLkgzOi/8c/Py/S7XV6p+kAWaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=aIw52i3FBNaM3JlX95PdSZS9UEeuj75BOGnG58YJQCs=;
	b=L/HnotMhostWuMNQYFEGODENP/vYeGB3nc869l0MgyMH+TJUcmVBFDBdbonyhGaZbyLE
	 hdGwvLp2o0kxkqp2BNfFy6y3YJi2FbqyScnQwyOBAashe11E/JHC0GtAzXDKOWJh80kGa
	 bsYxLkfVacARuKnYqDtEpzyoboRBY4lssSfsI4NSa31xLbI5CegQwg7PnHcY2P1InzeEW
	 ilnpqwcqYpk36vtCaKchhCni9iE6VwuokslT/J1qrHGXK4rw5TTY+bBjYJzYIsXAqKkmP
	 ZyvA3qqMhHSctg6IkeGCGQV1eOR8ngu0IIyWaH46Uq3lk0TcfQeilJFZ1U0O5zVPIuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aIdd2c40;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A89E606A33A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A89E606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aIdd2c40
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so35171395e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795466050; x=1796070850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aIw52i3FBNaM3JlX95PdSZS9UEeuj75BOGnG58YJQCs=;
        b=aIdd2c40s7v7UqrYtMn/jdUeRjG7uf8VxYLfXRlPixAm9l4+qo6Zry/e6kW5iGuQXM
         4/4QjacbUa4z6jrFzYieNIM7FCZYdR5wA0z1BdcOXepZG+ucsqAktjaO4/HLL4LowQHL
         pWwSA/9NXB6tx3Muc4nGbSrho2WWMRPvv7tGDpOO86m6ixO7BgKtDgcdPGcK1iTp33OF
         P2RLNpMUhxb9Gyng/a2C6ur7+sxnjgVZvD1s0pvNxm7fBq/XCKdduImgG0m6BNW34Rxa
         7i7bTPnLoc0cuzhpnbEz4wD1Wmm6q3whg+F1cgcb2EbpIzVh16l8mf4QVQOpu306DGtM
         9mWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466050; x=1796070850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aIw52i3FBNaM3JlX95PdSZS9UEeuj75BOGnG58YJQCs=;
        b=HxT+PET8XRV1B8GwnJvGRQvulzUUDjId9dSlOxjLpuLDVBzbCgStzHlpfYqyb35Vb2
         7PZ8g4QN+xRL5OA2vj1fpMfcdxvuw7TwLxDex6EjcK50yn1x6ySwmNkJ2C/OFDe6jsqE
         AAvon933XnLHYPQJ3E0Ji45zt6jHpVg8I+Df3euDTjap7x6cMB0+E2YL5MIwwSZOtDSy
         H4A5mtGmp/dKtyHAu9eaJNa8IVhs1TmUoloz33OagRLoTrp/4DshJmj70JTKKqVystHy
         EdgdljWKlRNk7uPaU8WUxTU+xXqLqXOFIw86PDpSDkv6EPQ+aYx5egIsSqnhJCXrpa8d
         E6kQ==
X-Forwarded-Encrypted: i=1; AL+hErEvzfDicbCxz4RCOTqfdwVwfs+8qIL0kAPFKEsMXTqXu9nuOGr4TZokcKH6f9F+P8afb3P3deV1kWlz5w8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EHhmcTMLez8H3yT/NUAFU7/y/RozRuABj+mZ0sqaTf5zUBfOS
	6BO8EK6S03cHIp4Ir36IM3Es9N28ly3HPlyyPyMX+KDZkG7d77GR/dvS
X-Gm-Gg: AZFdTZfhqjv9RWPoNf3Lb89lQvDbTAkTIE/OTJo4r5RsTeKpFzDsqakljkfiyPu+dPp
	HCU+/cHTHufToqvUB6Y+3AUFs+5xaCdb36z9uDd1B5YWRfRjqd0vFWwgssoU7DRzU26woPmckzz
	c8vjNc0FWKsZBuceZIvszK+jpq6S7Mxf3YZnkcyJtFoRo7iIlN0XHapYz1neCyqLvpxtItFmS98
	s81HgxVVB24yEv9iv4/2XvWQIEvL6h7wG0YlipXpyds+vqoce+Jwo+LBS8A+KreDoJHtdn5BvWH
	G/vLRp2Jfaj/91nYlpEhiJsTxJccfwXOs+0v3G/2UOYDWlznuoLhy78+o3+fbNoA/1SCdhxKb/G
	wBYyWyo4gUIVkZu8EoIY0Blqxm3OlvSwrhMyDh7OGDWd34jKX97mtmmFMD6Y5ubVROq6gI/ciVf
	JI3sTENalyde77rFFCQIZlVKBGjmGAHKj/VEEagsP6Qvaa5TtpDhZkfy4fYSEqpCwI1Aqv/8nXO
	zQej8kU4ow9TtTpr3ZtX1aEjWo1sFfb5YVKPoqEADJ8rT+JbZVJMU69g5WtNKWn3FxsoU4Yv4lv
	mevJbFzUQWTFIxkGDnZCDEvMIx7dfEWPrfRbGfY3u1TeUw6rtws=
X-Received: by 2002:a05:600c:37c9:b0:4a6:eca1:7d5c with SMTP id 5b1f17b1804b1-4bb888251b4mr232152425e9.32.1795466049774;
        Mon, 23 Nov 2026 12:34:09 -0800 (PST)
Received: from unknown.local ([151.34.53.154])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm515946805e9.13.2026.11.23.12.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:34:09 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
Date: Mon, 23 Nov 2026 21:33:53 +0100
Subject: [PATCH 1/5] media: qcom: camss: Don't stream sub-devices upstream
 of the sensor
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
Message-Id: <20261123-b4-ccs-imx376-v1-1-2b26850a6f11@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795466045; l=3624;
 i=morf3089@gmail.com; s=20240402; h=from:subject:message-id;
 bh=0Cz0qn0VW15LMMWXLllItkJYlosLYSu3ppAkBWYN+0E=;
 b=TYQR3uZ0JKNjjuCaIe/VTJRQvP3xRFLWYplEX4zBGUU1wNIBU22W0RXaFbVTKX689Platxtbd
 SSsPUfocmrCDCd0Et1KHBXKfdNGLdxFoh+XhRydbOr2NydckOtFuRjh
X-Developer-Key: i=morf3089@gmail.com; a=ed25519;
 pk=HsGrEQ3ia8BGGGO8/nUM2K2UX9JKvRPV+nbrVDGrYhA=

video_start_streaming() and video_stop_streaming() walk the media
pipeline from the video node upstream and call s_stream on every
sub-device they find, including every sub-device behind the one that is
linked to the CSIPHY. That is fine for a sensor that is a single
sub-device, but a sensor that consists of several sub-devices gets
s_stream called on each of them, not just on the one that is linked to
the CSIPHY.

The MIPI CCS driver is such a sensor: it exposes a pixel array, a binner
and a scaler sub-device, and the scaler (or the binner when there is no
scaler) is the one linked to the CSIPHY. Streaming is started by that
sub-device and covers the whole sensor. Calling s_stream also on the
binner and on the pixel array is at best redundant and, as the CCS
enable_streams operation only accepts the sensor's source pad, makes the
pixel array fail with -EINVAL, so streaming cannot be started.

This is not specific to CCS. Other drivers that have a sensor on one end
of a pipeline, e.g. ipu3-cio2, rkisp1, ti-cal, ipu6 and rcar-vin, start
only the sub-device that is directly connected to them and leave
propagating the start request upstream to that sub-device.

Do the same in CAMSS: after the first sub-device that is not part of CAMSS
(i.e. the one that was bound by the async notifier, which is the one whose
host private data points to the CSIPHY), stop walking the pipeline.

Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 drivers/media/platform/qcom/camss/camss-video.c | 28 +++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 0852eb6f1315..71ca16f15dab 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -249,6 +249,28 @@ static int video_prepare_streaming(struct vb2_queue *q)
 	return ret;
 }
 
+/*
+ * video_subdev_is_external - Check if a pipeline sub-device is not part of CAMSS
+ * @subdev: Sub-device in the pipeline
+ *
+ * camss_subdev_notifier_bound() sets the host private data of every external
+ * sub-device it binds, i.e. the one that is linked to a CSIPHY, to the CSIPHY.
+ * CAMSS sub-devices never have it set.
+ *
+ * Streaming is controlled from the video node, one CAMSS sub-device at a time.
+ * The external sub-device is the end of that chain: the pipeline upstream of it
+ * is not CAMSS' business, and the sub-device is responsible for starting and
+ * stopping whatever else it is made of. Sensors that consist of several
+ * sub-devices, such as MIPI CCS ones, are not expected to be controlled
+ * separately for each of them.
+ *
+ * Return true if @subdev is not a CAMSS sub-device.
+ */
+static bool video_subdev_is_external(struct v4l2_subdev *subdev)
+{
+	return v4l2_get_subdev_hostdata(subdev);
+}
+
 static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct camss_video *video = vb2_get_drv_priv(q);
@@ -284,6 +306,9 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 		ret = v4l2_subdev_call(subdev, video, s_stream, 1);
 		if (ret < 0 && ret != -ENOIOCTLCMD)
 			goto error;
+
+		if (video_subdev_is_external(subdev))
+			break;
 	}
 
 	return 0;
@@ -325,6 +350,9 @@ static void video_stop_streaming(struct vb2_queue *q)
 			dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
 			return;
 		}
+
+		if (video_subdev_is_external(subdev))
+			break;
 	}
 
 	video_device_pipeline_stop(vdev);

-- 
2.56.1

