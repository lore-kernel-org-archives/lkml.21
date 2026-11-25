Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795613738;
	b=L72DogMCmjfLD5FyUvQ8M8HJ6XE80nX7ZxGoLm3U3E0q/lfzfi5nhYTct0cHC0aYQkvJ
	 tT8CDeSKwPQrP11GUbvbfom4O5EdKKeYIxxcJkMQemSqTlRx8WePrQY952su14HRctZ39
	 f4hmTzeLMn9X2sczX05mrQ73WsndnhVPrjjLaRpGAfnvrlEFcQiUc50fIyteBeHnUmVRp
	 KrTbidUfLGjFY+oHhHTysZGBfBCdX0OW33XHfOaV3we53MFp+c0+1a5m5V2s5wd89GScQ
	 mX4s1x9Nulvr+v/OV2aDCnjgiiHY3175gjWGAf+1L7pSGLQJTEDK5aVmZl1S5OOPbfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=b11yeBb8NsdwSRdCS1bEtxOsQoS49Dp8WAO/enSMFOI=;
	b=lCCayqAFpbPe6kc7NxfqSsZ49DTmlUmZQHaahN8cERVxkMR2xa95z5WVHiBzKpvqFXqO
	 +CSp3o2SIGA/2FKGGYoHvHX4uUU4kZBFP4akR+LW+5n3L2n/iFPHZFRu0XikBUF3WVsmp
	 9zlh/dzFdmPkbtB4T3cDkRZfdR3JRDutJMFKax3JtbjqxDptnunxyUWYGf/cyyI/9AOpP
	 lVv1MT1JUjDvUxPA+OI+16zw7mesftBto/OdzyODBk5L0ZHt1NsSwtLbKkEWd7Rxo4NRd
	 u8ZFwgwwk90STcg89GMRVzc74XGHqGnW563mrMdumvrovUmY1SJLmIKtPk4nu4MC3UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ApCYebdO;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171F0606A696
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:35:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 171F0606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ApCYebdO
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bfbc67991cso3914869e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795613736; x=1796218536; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b11yeBb8NsdwSRdCS1bEtxOsQoS49Dp8WAO/enSMFOI=;
        b=ApCYebdOtS1Y5UDBm0SEKX1EGlk5nzWMdbuBJ+LtuWy8mEXW4L5c9OlaCIx9HF3HKz
         Qu/vlaPip7Wm/HCXWNJV/tiZRaMIj7MZr+wyUug5syKufQ3bKyDlNsC8Dm/xDQKs6YMn
         DxVb0Z8rJobRGoNig7l1k80LKQm8S5fRLJM8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795613736; x=1796218536;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=b11yeBb8NsdwSRdCS1bEtxOsQoS49Dp8WAO/enSMFOI=;
        b=GQqSErI0jimdN+v3hSQ3u+Kvnt9NyvFvtYB4JJZ+MVz+msxQtUeTkLReL22RCvyOtl
         eBut1/p+HFYkYtVcaeOWWW8v/l0SKHGg4L6QuyIu0e1TJngEX0iZsYC4TTtruPGXxY3B
         EAEUIHeFjEKTXfXfK2CW76L5/Yg8wbZBAwSeCtrinrqgPpFWdIp9OOGsfth1UzMDs2iW
         Y4LwjPo8FGBDYDmc/AIKJLuCrZZqoGMdCsmBmXIUIpYofscDR9SjsijCidmaWep9rdt3
         23N0tu6pTzW0c9rfrXgLn3HAFAmITz5R8Xu7tnZlrJwu5kIbc+RlSjANZfekvYzz5PQe
         ldKw==
X-Forwarded-Encrypted: i=1; AL+hErGYtzfGwacWnjqzDL9KgOVuLykXCUIvz8hQhQ/cDOaGpe90UKNpzcLxpBOtbKU9KTx6zGD7T8+zKovDTWA=@vger.kernel.org
X-Gm-Message-State: APuU4Z89dBAxf6R4jfYfnFb5EdCHsNj5Wsvr1HU1wr3MVfN8lsMo0lwq
	PXp8pa4HK2reTT/Fv8fDFFBwoRLXUpNIjG7r0MnvNKed/c0FUeEbuU3l7Imx3IXahg==
X-Gm-Gg: AZFdTZfUMeLqlZ2DPCqS9fe72mpXWKK2Jz9Kw17l9NZz3S+y0MrjJCxcc4BSXOMiVhz
	KPc2XRc/h6o7c0Lu6RamzHojTQgAJuJBhi+TZp9YtTVZL7Vhf3lPlzYk86LZDJeUXbZptGy1Zue
	gd9f2z2J2iuRaBx9qNz8m9JhvAO0WYLmOEySpr7AE8erZlWuq8nvA85DNoKnAahCHMrpBY9s+fD
	yDPUGBh5cSzM/RVkvRRFJW7/mQ8eEJTOr6SwvjaYp5Pq9HupYtVbuw0aUBqFDe1E/FIhDpe4kIW
	xTAK03LHGbQJ3EBjdC9dDhTsKF3Mv4mLCjCKmuKJCd1OozTe7ffzYpXm037+hGm0BpMwtnPNUuq
	bclLMtjytWj77m5FakQvF+1HpCZR4Z5OLIxMxWHcmwfn03m+Q8cCiRInXXCTDn80+gZ70WMBhYt
	UnW2s8RM14zz/VAqs+XSWaP63Y5m5fEz4BCgq2N0/ZdQ4ORmej3XRlCQe/hr/vMJVfV2olAcZ2x
	AzycQiUUfL7lZFqehPjBrcUa5OPtMOBXShQmzq2FfKHoKj/zxYllTDzU7MDdAa5XMJ3jVjKM7jd
	YVJO3IOpBVaW4TR0L07RD8MLSgfHBQhZSNTcHpWvY8cfproVFWMfUvZcd8cRGZq449e+WbDRXl3
	g+Gcz8EFjDg==
X-Received: by 2002:a05:6512:1315:b0:5c1:4c0a:49e8 with SMTP id 2adb3069b0e04-5c1bc80b081mr5630295e87.45.1795613736259;
        Wed, 25 Nov 2026 05:35:36 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff7d6bsm4505000e87.18.2026.11.25.05.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:35:35 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 25 Nov 2026 13:35:33 +0000
Subject: [PATCH] media: uvcvideo: Return -EINVAL for ctrl_get errors on
 disabled controls
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
Message-Id: <20261125-uvc-invalid-einval-v1-1-57e34bd8ce06@chromium.org>
X-B4-Tracking: v=1; b=H4sIACTkBmsC/x2MQQqAIBAAvxJ7bkENJfpKdLBcayEslCSQ/p54m
 znMFEgUmRJMXYFImRNfoYrsO9gOG3ZCdtVBCWWkVBqfvCGHbE92SA3QiGEdvVid1QZqeEfy/Lb
 pvHzfD8hqXKxkAAAA
X-Change-ID: 20261125-uvc-invalid-einval-603b8f0bda56
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nezul Tairus <radwolf.83@gmail.com>, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

Some non-compliant cameras fail boundary queries (e.g. GET_MIN), so
uvcvideo marks those controls as disabled during enumeration. Due to
legacy uAPI constraints, GET_CUR requests are still sent to the hardware
for disabled controls.

However, userspace (e.g. PipeWire) expects -EINVAL for disabled controls
and treats -EIO as a fatal error, which can cause it to disable the
camera completely.

Match the V4L2 control framework behaviour in uvc_ctrl_get() for
VIDIOC_G_EXT_CTRLS returning -EINVAL directly for boundary queries
(V4L2_CTRL_WHICH_{DEF,MIN,MAX}_VAL) on disabled controls, and converting
-EIO from GET_CUR into -EINVAL. If GET_CUR succeeds, the value is still
returned to the user.

Reported-by: Nezul Tairus <radwolf.83@gmail.com>
Closes: https://lore.kernel.org/linux-media/CAFDWN6LPcz6CBOZzBVN-VbCce3g2wOrPZ8V45_=8xv16VCqzsg@mail.gmail.com/T/#u
Fixes: 649c033711d7 ("media: uvcvideo: Set V4L2_CTRL_FLAG_DISABLED during queryctrl errors")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index d2f722bc3459..9390cb642d30 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2645,6 +2645,7 @@ int uvc_ctrl_get(struct uvc_video_chain *chain, u32 which,
 {
 	struct uvc_control *ctrl;
 	struct uvc_control_mapping *mapping;
+	int ret;
 
 	if (__uvc_query_v4l2_class(chain, xctrl->id, 0) >= 0)
 		return -EACCES;
@@ -2653,7 +2654,14 @@ int uvc_ctrl_get(struct uvc_video_chain *chain, u32 which,
 	if (!ctrl)
 		return -EINVAL;
 
-	return uvc_mapping_get_xctrl(chain, ctrl, mapping, which, xctrl);
+	if (mapping->disabled && which != V4L2_CTRL_WHICH_CUR_VAL)
+		return -EINVAL;
+
+	ret = uvc_mapping_get_xctrl(chain, ctrl, mapping, which, xctrl);
+	if (ret == -EIO && mapping->disabled)
+		return -EINVAL;
+
+	return ret;
 }
 
 static int uvc_ctrl_clamp(struct uvc_video_chain *chain,

---
base-commit: b7ac871daee981f1963f632586ff9b9d898ce5dd
change-id: 20261125-uvc-invalid-einval-603b8f0bda56

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

