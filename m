Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514794;
	b=C4oMBrZQJ7n5V3G2BpBQVeyvv/LNiSYbL0rWjIsvod5nqW4ca3muMaEYpvYKwIp+VUer
	 BNeGbDboZ095Jdqx6imBghtac306iCZ+XDsg3L64Zp4rEpQBYGZ1cf/brO38o9Yws/Fja
	 F/W6kMse4AT86BsaZNa6mLr3mpTBadIuw8SX3AKmaYTONEyh+VVyhlDLKUuxT1/04jGI8
	 lfWmFUI89DJV/iWbdr6lob4teBa2bGHNHfDD2u8yV86SAG/qydMMcxDfsgWs38D2LYfVD
	 QzmMDDk6rNyPwkQL78bLuHm15r42qUWcgGXhxiSCaG3YFRWcgTl+cbeMKtmfzYKtcxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514794;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=r7DitdOlHqA5mEYHwEterBTbi/yNYMUAPnVhvFCyj2E=;
	b=5SzgkmYQ4+uPVmnas9oLsZCqZqHAi6mwJaF80wRjpEJZzG78d0u3d7vQtC2sJF3c0NZO
	 VIovdBn/rPqcOHyTvHtqWTfiv3hgwTaQmtjEwxElHv8WYc0zKLLf3TquDIuJiWj4UKyny
	 M2lpqeR7zl/ZIZLMpD4HcheDVYLlb4Z1B/k3mXrl1OPKQVSberINnrR4agEzRJlR5UEjD
	 5saDYgNmOYLuJ8fAkj8GCVhxPOvSmpuvuDbTFSHygDfCm1AeOwExcoWB5aucJOAGSY6qx
	 5sBGJKt1OJdM8R27zSUslI97XNCyyzmXu6KJKWqsw9JuX35VySo3fQQ8K1a6s26ZU+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=cKv1l4nC;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D650606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:06:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D650606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=cKv1l4nC
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EC6943FE35
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795514786;
	bh=r7DitdOlHqA5mEYHwEterBTbi/yNYMUAPnVhvFCyj2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=cKv1l4nC/cZA1617zkIKmrDHFPjpQljL67xewC+/wTyK6Pki5BdB0JNBS9dRx6c5C
	 an5gsXsvorHRYUtUnzEZ4DPJ5f+S4rVMir2n00UxNc17z2x0xyGnWNS4H7uEdcra6z
	 gybD9IeLjjpn7Z+2Dv8UOcSKhM0NsUoCyTrGngmoGWFIb8VVNBiRanaQtKFp/iz2u3
	 3RYZOSndYfI4O69QK5XDokCwOwdpgC2n3Ly+AbZ+yKabKXeJp8xuoVFbFfhdwJCarv
	 cn9mEz5VwDyOMRqDpvNV5CGbw2wyNlfkrm/qyvF7/7OCJPwWHu0Fth9gLjg0WuI6BJ
	 3BSgm6VbpGI0+EqIPx25ua3Kqh27yvPzvqGO4ErAFdGil1EpUsPtDoofaV2Lc1tV/6
	 hVaR1f0r2Pm15WC732MwDOMpssoWKIeMa0eCk1Trm3d/jTM7vDAnFne+CKBuoGDAid
	 1qP8aXeo2nA98PRMgskTsBUB08jfvPPzBy1+yM216FzbQEP47CvvBeTroAIV7aQK/R
	 fO8mEfcFVzmoldVdAav063vzUhmp0XHggHAtIfBFHicdDkjjAKoHQjCTye38eJT3Rb
	 ndIjLBUMVGfCcwNjj4qj3lwJb4Ee0xELN4okOm3/3OZB/TdrFF9ZCeSMBGE1SOX9kF
	 H1OVdhI4xkQ98tzmZfihR3ns=
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4923b9fdd43so2693378f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:06:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514786; x=1796119586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r7DitdOlHqA5mEYHwEterBTbi/yNYMUAPnVhvFCyj2E=;
        b=C8e6UcGBwfLYNAJgwsVVNJVTlTyPIBe+wpIFVhHuxG9QirrC3kIasegEYok8zBvzWe
         nywC5DaIDSeiWzrNS/Cp3k204x4U6Jyc7hKImpZf2ZrufcKjwSGWhcZAbasoXxk+oEmQ
         1cGz93AfT1e1ylE9zq8s93Vj/WFFBa/Ix49DkYXByb72M1b/00vePwh9OlaOlu8MXh1Z
         RxK4szVs58MLJR376q0C0U6VoNaNVGBt++D8VOO6tXsrN6x4T8u4BQABJIcPJwmahUTA
         6ak+6Lx7XQkh7RCJhy0dJ7H1lAN7VKJn7aZZkZkvCT1jHqLqlnBul0PrlTYaxT/O4dmM
         43eQ==
X-Gm-Message-State: APuU4Z8QviR4jkkZm52/wcjUxZ85lY20OTQpYwHVB2jqLe6yQ+Lh23D4
	ayDRzgV1VlQrKPHuns5jB1Z3ezSaS/+6rTx6L6ISD0CPK7VjtooQ6txEn5yPn5jU8RicT36SoSr
	P/PhOjqJ6Kyqqj9QuhrEEiRqIpHtDZxHJcVnsNlD6Tibll5pGhuD9z3Wany0M2PRlxruqQIyh1Z
	eyk3noNw==
X-Gm-Gg: AZFdTZfOvthn/RqyodYUGkdWS22tBMD9rgbSogHhpOa/D+1n5I5sedBZOfS1TjeWIlR
	C3AlfJHZ/N8SgKwbekGnYqAYPAPAxysDF569qlxabd1dWwUrtinNVMam+vOqOqgH09e1nK9AEPz
	rfihSQCf92nWeNlO7v7oKfqj8saMLAEhflg59RqLsguUpe5QjT9viWr/GNoN0hTnhSUhYVAhDc+
	Zqawg9C2QQ8IU7W+waqLzIbc2B2WXs4XYzz6nqPfACkxI8MvdVD5aHDefcLXu5nS+DvGZCeCUsx
	6FhTUjgFKYvfSAfroKCFAiDtSfm4NdXzVBqCre8aKwmnLX9yloHuCfGNNRWVbutB8gUcXcDUg05
	nEdYV+2PUWfS/IeIuPiy4gXPDBhCnoTUuLlDqeanx+2JPUhg46GlADvqdtaFRlmc=
X-Received: by 2002:a05:600c:4755:b0:4bb:7033:de79 with SMTP id 5b1f17b1804b1-4bb8881dd02mr294185695e9.35.1795514786372;
        Tue, 24 Nov 2026 02:06:26 -0800 (PST)
X-Received: by 2002:a05:600c:4755:b0:4bb:7033:de79 with SMTP id 5b1f17b1804b1-4bb8881dd02mr294185315e9.35.1795514786008;
        Tue, 24 Nov 2026 02:06:26 -0800 (PST)
Received: from px13.Home ([2a06:5902:822:4600:d3c1:2e3f:2545:da9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm27831841f8f.48.2026.11.24.02.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:06:25 -0800 (PST)
From: Chris Bainbridge <chris.bainbridge@canonical.com>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org
Subject: [PATCH 1/3] media: uvcvideo: Report the failing control when restoring controls fails
Date: Tue, 24 Nov 2026 10:06:21 +0000
Message-ID: <20261124100623.2227323-2-chris.bainbridge@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124100623.2227323-1-chris.bainbridge@canonical.com>
References: <20261124100623.2227323-1-chris.bainbridge@canonical.com>
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

When uvc_ctrl_commit_entity() fails while restoring the controls after a
USB reset_resume, the only message visible at the default loglevel is
the generic "reset_resume error -5" from the USB core. The control that
caused the failure and the reason for it are only visible with the
uvcvideo trace parameter enabled (UVC_DBG_CONTROL), which makes the
problem almost impossible to diagnose in the field.

On a Logitech C270 (046d:0825, USB_QUIRK_RESET_RESUME), the processing
unit restore fails with UVC error code 7 (Invalid Request), mapped to
-EIO, and the user only sees "reset_resume error -5". The restore order
suggests that WHITE_BALANCE_TEMPERATURE is written while auto white
balance is enabled, which the device rejects.

Pass the err_ctrl out parameter of uvc_ctrl_commit_entity() and report
the name, the selector and the entity id of the failing control,
together with the error code, using a ratelimited warning. If the
failing control is not known, report the entity and the error code only.

Also extend the "Control error %u" debug message in uvc_query_ctrl()
with the name of the UVC error code, the name of the request, the
selector and the unit, so that the cause of the STALL is visible in the
trace log.

Signed-off-by: Chris Bainbridge <chris.bainbridge@canonical.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c  | 36 +++++++++++++++++++++++++++++--
 drivers/media/usb/uvc/uvc_video.c | 31 +++++++++++++++++++++++++-
 2 files changed, 64 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index d2f722bc3459..f70fa37800a4 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -3199,6 +3199,34 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
  * Suspend/resume
  */
 
+/*
+ * Report a failure to restore the controls of an entity. @err_ctrl points to
+ * the control that failed, or is NULL if the failing control is not known.
+ */
+static void uvc_ctrl_restore_error(struct uvc_device *dev,
+				   const struct uvc_entity *entity,
+				   struct uvc_control *err_ctrl, int ret)
+{
+	const struct uvc_control_mapping *mapping;
+	const char *name = "Unknown Control";
+
+	if (!err_ctrl) {
+		dev_warn_ratelimited(&dev->intf->dev,
+				     "Failed to restore controls on unit %u: %d\n",
+				     entity->id, ret);
+		return;
+	}
+
+	mapping = list_first_entry_or_null(&err_ctrl->info.mappings,
+					   struct uvc_control_mapping, list);
+	if (mapping)
+		name = uvc_map_get_name(mapping);
+
+	dev_warn_ratelimited(&dev->intf->dev,
+			     "Failed to restore control %s (selector %u on unit %u): %d\n",
+			     name, err_ctrl->info.selector, entity->id, ret);
+}
+
 /*
  * Restore control values after resume, skipping controls that haven't been
  * changed.
@@ -3210,6 +3238,7 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
  */
 int uvc_ctrl_restore_values(struct uvc_device *dev)
 {
+	struct uvc_control *err_ctrl;
 	struct uvc_control *ctrl;
 	struct uvc_entity *entity;
 	unsigned int i;
@@ -3230,9 +3259,12 @@ int uvc_ctrl_restore_values(struct uvc_device *dev)
 			ctrl->dirty = 1;
 		}
 
-		ret = uvc_ctrl_commit_entity(dev, NULL, entity, 0, NULL);
-		if (ret < 0)
+		err_ctrl = NULL;
+		ret = uvc_ctrl_commit_entity(dev, NULL, entity, 0, &err_ctrl);
+		if (ret < 0) {
+			uvc_ctrl_restore_error(dev, entity, err_ctrl, ret);
 			return ret;
+		}
 	}
 
 	return 0;
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index a92a986ab714..b10064defaf4 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -68,6 +68,32 @@ static const char *uvc_query_name(u8 query)
 	}
 }
 
+static const char *uvc_error_code_name(u8 error)
+{
+	switch (error) {
+	case 0:
+		return "No error";
+	case 1:
+		return "Not ready";
+	case 2:
+		return "Wrong state";
+	case 3:
+		return "Power";
+	case 4:
+		return "Out of range";
+	case 5:
+		return "Invalid unit";
+	case 6:
+		return "Invalid control";
+	case 7:
+		return "Invalid request";
+	case 8:
+		return "Invalid value within range";
+	default:
+		return "Unknown";
+	}
+}
+
 int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 			u8 intfnum, u8 cs, void *data, u16 size)
 {
@@ -125,7 +151,10 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 		return ret < 0 ? ret : -EPIPE;
 	}
 
-	uvc_dbg(dev, CONTROL, "Control error %u\n", error);
+	uvc_dbg(dev, CONTROL,
+		"Control error %u (%s) for %s control %u on unit %u\n",
+		error, uvc_error_code_name(error), uvc_query_name(query), cs,
+		unit);
 
 	switch (error) {
 	case 0:
-- 
2.53.0

