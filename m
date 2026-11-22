Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795327478;
	b=kZbQqseIDBevcBLZVrDxXwb4rPZpmBwTrnhdpF8f014Qt+MAWTrqcQylPJfGBlkkq4Kw
	 ZL/GUWv2imb0/Pwaeg7g9/RNd7krPtoHnkF3aTYFItBKk7YIl+fQnBp78FkQ9hNjAZ0HQ
	 NfLDqrtyb8zLUtDuPaw2SzJaoieYKUI8o9TpvfW5eHYwt4U+zkSAKldeLmeNjuFsFXOQQ
	 Qn8Np0cg/2qM6V+YG/NgjuZdDI3txn0zt0C8aW3CppuPI5dUwtiwyppZh5LuwJlOmDJqs
	 SK57VAhUC7Ci7qGU81ci6scBxdKZ/P5x+UI8TeO2lbM+ZvGRT31YMXcTPIMzcfl1M9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795327478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YXKyVQ+76/7q5c8PfbdutMsRsLibNeBsWkcrh/eq+Z8=;
	b=STZhWB4kB8bfQt7dM6LY6kOJQkgXaENahOqyTiQkmgIFbpBY41ZmnDmWsTztdpT5WdBx
	 sKXGHetK97cBOxkBHDQNGWHZj6gvDwp/gep8Ak+AaamZGPfYr5vxB+/43vaLyrzFzTNWZ
	 GyrxaLxHYcXFLBWGCIlVie4HhbFTEIqkTL7iieShj7y8X2YcEBCkoB5CYz/V7ooeLLlXO
	 6l0SHh3Xjhe2eSNNYiOqYe1wIpAXgI/i2q/IJC27j8AEwE7bh1hnMvhQPtzw13r1sNJhZ
	 ZTNeV9kQ9KbAAN7w2VI5Ww1npljnmUDadctnhX+wVbn830UUFCO6PbjM3kLpeuVVjwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NpVQj3u0;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C63E606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C63E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NpVQj3u0
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a2761c69fbso4716432c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 22:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795327477; x=1795932277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YXKyVQ+76/7q5c8PfbdutMsRsLibNeBsWkcrh/eq+Z8=;
        b=NpVQj3u0DgcyeAJxGv4P5X7KV/zluSwFGJNztpLsrvXusEWD5jjNSrtiiCx0yFcl2K
         0HHqosJoGNaUq73rNWBdyMFXFxNlpjhdlpot+gWX5iPSGMhxTJleE2YwbTVkzq3pO37V
         Tb7OypfIZpxjn7upzNb5HD2i4R6YoNPJ/9Djx+fTxVwEDCat0Wz+r0sTxy/XlNEsnlqn
         y+OHwX9zmzXBRyhiBktY9PlXD5MlwMoLvqoZL+1n1NlsiC2WeUcP4Szulz12Zu1dxYR+
         AhP/kUCBAioNAd/n/7lQd14/+xNrzXmWeMzHDpMQnWQqqUAMl5wyCQ13oU2nWf6SUA+T
         14XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795327477; x=1795932277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YXKyVQ+76/7q5c8PfbdutMsRsLibNeBsWkcrh/eq+Z8=;
        b=dUQ/FJ/eTLvxr/lzfe/Eo3pQsH6L9XXX6CUHdlkPcrtEmLlmipvzTQynBW4S0TfRcE
         I+UcbyMtfHJfD3MclvNgypMpJhJBA0iOPR/PMKNAfJ0vrY3goVTW05Cc6EZee5JyXpFC
         O/gZxjQOPUdRK0U2GJG5iaWZM/qtI9WuzZJ/VtJHaQMqrm/6ZSs8OW1yccQateJn4wXA
         Ir0wS8hBFWx5BmFbs1gQ9EuCKpdK3jg5A/jBMcm36nDpDREglnq3isCNPNw4HfvsSRGl
         JP0quJgE9yPyKGhenQrLj1w1qsMRGrZvhTTbNb1lwleIaK+jhi9TGxAA1A2lun8zeGoq
         Cucw==
X-Forwarded-Encrypted: i=1; AL+hErEOmjW9DpSv1Xl7+IewINizsfYB5nRyCqBydmKF4c6WuoG3jZdhuespG1wpz53CjT1R7kmTDOWANZ40DYw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bIjqZRkgzFXkE9ASJaErpQhYhixccuZdIxwojaiVGkrdi9eDA
	WlJtWpQXuI7xcEPo7V1hqpipuJBVxiR27mQXxC6ih+EcF70lHvgiNYEW
X-Gm-Gg: AZFdTZenldM9LORUbxLJA6p2xQMJK0pGrOwWzA8kxUM8qOeVKACetTWw3stuADjoz9R
	/yIfNo4SdenbvTYcD9Fh4Iqf18QQLxX4F0zuYSmDs3OwKBkbQ2wLxu7wYfgkvRcuJ4+oY+C1ZgF
	U6SBi+JfqEXaudB3sWQbJs/FY12E+ag+PcTmhNDnbJhEk0yBI68GAsz53QYwecfR9pzJEtnXVPE
	r5n6ENhNJ6sFIsM/OnCfghuJ9/z7p9OZhbOR/YCEsrBkFp6hXIypQ79hUgnrzsmDLL+RvYcEL0o
	JEoIOj2SOg2n3wdlMCXeQiQeIkoVA3t3i/uaxpbRJz785NlTlbx/oJXFu55jw50mIoeYY5wen18
	YvvMHXQg3PqT2GD8+Kh25GOuONOexA6nIbZlnA3iyxWKBQiPT8ryG7Td9lQFpw5syniLg8zudsY
	8UZAL336jzTMaqEqZkKpozgk/etkHP7r11s8sAgdqz684fMyKBCoJD2ITKkj7Pi1TK+M1ZqT/kd
	/3Evr2/ySML8ecook5BqpfpisK1cWsjcqppdGkyAyuk0dYst+/9Bi3xssVpFWLsU6umEahsoZYK
	b3F16T5mBiJJRgwLWnEBC+SSVP5T1rPYw1yYjohsNzDOb2+EDd9FES/IhlVTbKz6IM8hmA==
X-Received: by 2002:a05:701b:2087:20b0:1b4:fa58:9d8 with SMTP id a92af1059eb24-1b5568e76a5mr8112580c88.20.1795327475924;
        Sat, 21 Nov 2026 22:04:35 -0800 (PST)
Received: from hp-envy ([2407:7000:b098:4a00::6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm26704718c88.14.2026.11.21.22.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 22:04:35 -0800 (PST)
From: Parmjot Singh <parmjotsinghrobot@gmail.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] media: uvcvideo: skip GET_DEF(PROBE) for HP True Vision 5MP
Date: Sun, 22 Nov 2026 19:03:08 +1300
Message-ID: <20261122060309.105714-2-parmjotsinghrobot@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122060309.105714-1-parmjotsinghrobot@gmail.com>
References: <20261122060309.105714-1-parmjotsinghrobot@gmail.com>
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

The HP True Vision 5MP Camera (04f2:b767, revision 0.05) was observed
returning zero format and frame indices in GET_DEF(PROBE). The driver
can send those indices back in SET_CUR(PROBE) during initialization.

Use the existing UVC_QUIRK_PROBE_DEF workaround so initialization
reads the current probe settings without replaying the default. Match
the UVC 1.5 VideoControl interfaces used by the color and IR streams.

OpenAI Codex (GPT-6.2 Sol) helped turn the reported USB trace into a device
table entry and checked the reported protocol on both interfaces.

Signed-off-by: Parmjot Singh <parmjotsinghrobot@gmail.com>

---
 drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index cbc145697..99c28991b 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2754,6 +2754,15 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_RESTRICT_FRAME_RATE) },
+	/* HP True Vision 5MP Camera */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x04f2,
+	  .idProduct		= 0xb767,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_15,
+	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_def },
 	/* Alcor Micro AU3820 (Future Boy PC USB Webcam) */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
-- 
2.56.0

