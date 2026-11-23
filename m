Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417308;
	b=Q6MW06+Pgke9jatt3bE4Sl1RSI2+Ph9ESmhULPSWERK3V//MslaSQ45Iu8pylrf+yARZ
	 R6n5B4shKXXtYwL2x7vUMgIHgiOcdtl1TqD1ac8iVDWS+/vIxqR3EyOza2TTr+76BhnH5
	 2YNkrz5YrbysDu86KMP12rVnLiNK/pq9171XA9nPgpnaLkMrvgTo+/9ytD+Zk2/salfCL
	 P32yMFkXKZBcN+hOYik2r3EM5rEmPxOtnuP2HLzSDWdfD9xIcTna2yyx2Tbwrvw/Wj/Sa
	 xYU8FdcVUyA4TuL/cL6ZZGg8PgsKz/vWA3GVq71U3r1qC3pgnqX0Nf+iK07txRkI1kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZJl9XladIemhT3/Fp4VwYIfIL4e685MSOlrpJso3I1I=;
	b=YUzc/gXe6ku2qSWdV7Lowmudbm10G82BcNH6HXBNkng5BRHI0599nsDNtXnU3pODUTWW
	 GgcDfH+xAMkSaIp5xkhNrUiseb+i0PZr8yqlG32R6R7eCXwQ/4X1b+hbCbIDubIAQMyGz
	 uLTOfXfL6xki/vw9xv1wQyqTqyHOGzEQrPOeKVYCxqr3EvQza9glhYzhKfSr4lOaj0qx2
	 75XGFjTASSROhOSpqch+LO/qYxpR2YX6W67GA5nXwWgBEOhYIqeFGe9pYRMtDP7svEZYy
	 OfcOBKx8je+nALaioJmgAFLy7HhG2gClEuGAbZXWPEPZQba6Vad8rctvsk3MmVpVM2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ouB+gQpV;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7187C606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:01:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7187C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ouB+gQpV
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so2043158f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417306; x=1796022106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZJl9XladIemhT3/Fp4VwYIfIL4e685MSOlrpJso3I1I=;
        b=ouB+gQpVROS0MzdgORguWFaW4TYdFb70pGv3/cn0v/BXsqO19AWeIx7xbD7t4IhDuC
         3GoefAH1+N96Si5uoupxq2aMZawdh2o+TLwKzupudFEHrpvwuEX8X5PtnjSfwuiQNKux
         98ywtBJX22FnYqWFtfkH/m6+rIDxoWidLCMlenQdL2Ek43Y3zCZ91llTzi/yF+k9wVBu
         4A1dp9bePbmF209Tr7hLeJUGA9FSY+I6Vbe16vsHEaoc/7cSTZNgCF7koz9hyLLrwoxx
         1cc6BtyLIsHaZsaljGHXC8z0z5w7Meg7W3FyM+mk0/Wjky+BTQTRPhu/R3g/kiW7mJkp
         +fiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417306; x=1796022106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZJl9XladIemhT3/Fp4VwYIfIL4e685MSOlrpJso3I1I=;
        b=u0DX7EJhWWIi1V+vZHq2qA1EJxc/OQeCWe3JqRbfrmZvTe/ifIKK54LNx5W7+ksnnG
         P+VAg7y11CeIwF8SZxs2chnxIwzceRQeheMhgMZDpuXvXabQVxspI9poigDONm6o5R2D
         LM31oIIPkkXojX7M/dOFGDVhhtuKFbkaPxp+RQj84hsrgqEXzLEDfQ4Baol6tczdDNoc
         Tc7wtpzwS8bWoPPivyfAuTThJ9KWaOPTuruwIN3+yfJ0OUFRndDRuj/QvL4xetvFiqN/
         EEB/z2Xn1QjJEvr2j1moHX4WjxB1VfPGq2KTSb5bbM2rLbnhASys41RkJhoOfdAZSvW6
         GqSw==
X-Forwarded-Encrypted: i=1; AL+hErG6IAE1fTlC6LB59i3cj7e0uif042Vp/QY12HRq1anL5kuaMiRXpqUbSRvE/6v2YYzOVaDpPif3kLkyUNg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zOLbmzRbqNL7C80SKax9CSBU63ZFWmIkpVfluFxA/gF8Lv58L
	hjhdJsWKzDjlcaXGQ8yb03UX3VCd97HGFtaVGxmYRC2OEqTLNY9FORSd
X-Gm-Gg: AZFdTZeS8HMBND5Z5oIUvYnWOFbINnOxu5FRs6/mpAkmxUtF9OKp2cqcUy5Jbwdmt6O
	1cZrbt4aNOr86tRXWY8Mj+XfvQn+JFTFq+8F0GNOxmlsTORjqnRIX6qyRJsZvu9jO+rt10hKndm
	fwUDwlmOxLyk5TkZOEcE+yMxHNx9Aqos8CwYVZfxnxD6R8lpRmHy2HL4a6nqGWhK1u7VgtysLEN
	Sngg/bie0493iwU5+0jxOm2adicExkvR4Fi/TWQmuuX/2L/YrrmsicqMrSHrzGkMnGL12JCE41T
	CdgP+g1Bm5Ll13wF48SS/oBO15o9gbJUHHXOOY0k3VquV72wYf4f+P6C/MzY2lDd2Fz4v7aH6PC
	twlJi4jSTW6rwmm0sYd1g+eQrfVskYv1d74mixU64xp8FNn+aNbMwYtIqHytSuT8EE+8Yt/7F0C
	kj1V9r0BHVFikCrCMxoV/9/ItKd2Mr+ykVmMgLb8HxGq+OosUMV1wnhZspQiwR5lBYyho6y7z0u
	b1PihxuCSls4a2Pl5oQAfN2VUmN0XqxIAw3vgmarOB4Z+QbkEIyFRY1HIRojaXKj9szyMG38QN1
	/2N26FsZXXdlG/XDgKokXCqvWpeo+ffbzesF
X-Received: by 2002:a5d:64c5:0:b0:48f:db47:6ebf with SMTP id ffacd0b85a97d-4abb2ecf85amr19716411f8f.38.1795417306314;
        Sun, 22 Nov 2026 23:01:46 -0800 (PST)
Received: from fedora ([154.182.66.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm20779007f8f.3.2026.11.22.23.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:01:45 -0800 (PST)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	giorgitchankvetadze1997@gmail.com,
	amin.gattout@gmail.com,
	antoniu.miclaus@analog.com,
	gregkh@linuxfoundation.org,
	mripard@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v5 3/8] iio: adc: at91_adc: switch to device_get_match_data()
Date: Mon, 23 Nov 2026 09:00:56 +0200
Message-ID: <20261123070101.53868-4-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
References: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
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

Use the firmware-agnostic device_get_match_data() instead of the
OF-specific of_device_get_match_data() to retrieve the device
capabilities.

Check the returned pointer so that probing a device without matching
capabilities fails cleanly instead of dereferencing NULL later on.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/iio/adc/at91_adc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index 76000486b17a..2a378540837d 100644
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -18,6 +18,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/wait.h>
@@ -1002,7 +1003,9 @@ static int at91_adc_probe(struct platform_device *pdev)
 
 	st = iio_priv(idev);
 
-	st->caps = of_device_get_match_data(&pdev->dev);
+	st->caps = device_get_match_data(&pdev->dev);
+	if (!st->caps)
+		return -ENODEV;
 
 	st->use_external = of_property_read_bool(node, "atmel,adc-use-external-triggers");
 
-- 
2.56.0

