Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535118;
	b=IER4/Q92DltsyxBZkhDyGL4yuXYm5NeSHg3bcnusfFxTiJX3IaLgFTMvjE2a3J7pl+aa
	 Wrncr+gzKk7KkMe9+sJoQVppj2POpYy8RxsEnBjlfGqO/aP3uPerDq0Y5C6a+ubcjWgkw
	 8k9aBUgzGm133qdJs59PnocuNatHzPyXjC2yGuGBL8eHIhjj44MzLwggywhokd8tgeZae
	 l/SSufAj37Z56k001MyNes+uXQ5n1zZVrprNk2YiC615zoVLxSXNRRjEvjzGQh4EzxFxd
	 YNoZ9X35qzGDkyrWD0d0DY+IrJBarasjnbTQCYn3rPw/ypkpZFodfwoSoxvrzhdW0Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fGnAXl9mAkM8+L7H53FV4IJ0uW8w/+sPQwCsSY5K0ME=;
	b=wLPMtD1KMjnchXxcsfCIh9/NbYFb7kNMvCxlhT60KaLQbyyeijfzbMY3w6Td+ahpp87+
	 OF3sOelBN8i1zqcPX2kMlF/D3wH2+261bf+oK4thJ9ngIResX0B/o3RiL1OQQnb/bX5Cd
	 BXyBOaLFbOz4T1tK8+v9VtqiVoeHr+xh9lp6tsp6vjqmyfN0Z0GtNw2EDnIDvfP/8ltuF
	 dhDpgynEsbWoo6SE/7kd5hOV+62e2F6FURwqg7WRs644NNGIdyDQlEppjVJ16ckizrEPJ
	 Adg2qKGBq5k8/Jz6ZJLv72V565hKv8cf54BqaRLQLFtMAOG9s7kh/LSVbaw5WQcTUHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0afrJRym;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A76E606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:45:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A76E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0afrJRym
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so3421097b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795535118; x=1796139918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fGnAXl9mAkM8+L7H53FV4IJ0uW8w/+sPQwCsSY5K0ME=;
        b=0afrJRymnEvSPq9raSIN79bW6rqNKweAzFUGMkjj84rWQ+xIXL+KA33tTUOZQV2xcA
         eHcNc5gmsXHLH1RxUPtdZc6MpyCsbIwFg3CjZg2FU6QuDQAkOPBXGv09TZy3plj+FLJK
         /jcrggGDqiobpdIORciyxOwufp/1PEBHif0hg+ph84Of30B7VU2iMGb0j9Wdlko/YdJW
         2YqAY85A351EClfDqmetEUQ0jmx7ILRr7eamwWxm4ML3tU4zFA5tVx/HzGZQbmuS1cvV
         qGz/ArVCmxivDlFi9PVMhj51+PZFG3nhQSm1lvBUz1hLZoLyPnKVhY3xezS9UVGfY4MJ
         y0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795535118; x=1796139918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fGnAXl9mAkM8+L7H53FV4IJ0uW8w/+sPQwCsSY5K0ME=;
        b=kXpsn96T6izxyM3YWUyeNjXkaOLvgVIn0VZl2eJH3c9A+0WfWH9Z/8WHuAsKBlSnWd
         ZRrYudHEeuAPyXir4GPp4vH+wznJvTpQXPRioSx/hbJRHxZbF/RDXMf0uApbjQGMrt54
         y5i39KD8NVTTHHAbDAnAkykY6n/WsmioM9QGLej6yAQmjqaVAEJm6jeVNVRv15r2nfHW
         Nx2AG/0EVzQY0L1d0uJ9QOffS+iKRhTufLfQ/U13TD2vk0OyM14hf3r79XdiMg32wthc
         nhQH6IIeRdQgdwomojchw6PX2T6w1FxO7/uWgaxQGBQJcnxpRmM66qqeoWWzkAR4DFey
         UiSQ==
X-Forwarded-Encrypted: i=1; AL+hErGcpvv/kebA91v9H5O7nyJpVeFQ7ykdNwKyoAvRkb9gFcN56uJ3qmbcrTFijF7bfNoiblMNd5Tnu9E6gpw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ibcafIgT5bs1GsBZIGZbWja0/etMJFEm6FCgCb27bF8h3sFm7
	m8iOjkUSx4YYkxl7eIgTuSOIN2+TTX6P8lpddHAOalSKFItaYazpnB4=
X-Gm-Gg: AZFdTZeewHmFcbaw3OkHIc4qZAVpVuXnx9IgoQcLlLxaam6vEL5KmviBtY4yzWvPH2W
	R27DVBRcnTP3dyaDkCHvNbDeHOIEPZJDuZhvrhc7lqXybxPWT/3bgJ7oUAOce+9euUvixzp7B0I
	CgW12hnDoQHNcyFglVu17/lW0PN3xR9/BKmPEmIhcuQpIWvG3PmIDjC7VHOg0j+sqVPOTSKYCrl
	uqT49sdDNvgC/9+YKRrFyb7vCfXFtLvPNMOaNI7fC7RsbiAT3ZxP7bb6/YyWvwiOcdKfj2Yqyh4
	Dd+MUYy0IuCqR5S4obj30OzEp/KMvISnDzV87SGA1BFVteaisIedvAU0s5xjy6w0D6s/I0ZHFv6
	szSQwRAWgMIJNZIKI+6EW1X0O0DxXS12PXjQIKxVwxJIVOP13W097Ho1sMMFN+II6JfuY67JQyK
	PQVhhnaODimpXBZDlThAJ/N+odst3rX3NonY033zH9PCB9fI/YbsGwNSkOwqQa68GYHa7Hvcfbm
	txD8zMT7f3XUFHzlfzKpqJN72o/AhvlaWFd1rgPhFChIheWYuW0jxRgqwGPJnzNAdZXB/O0siyC
	zzOtACvNb23e3Uu54cXpiKwea877ldSxsk+c3vFkAHsVv1Ok8T7MmOnAcOBQkciRc/p9
X-Received: by 2002:a05:6a00:a117:b0:8bf:ef6e:1eb5 with SMTP id d2e1a72fcca58-8c87d022919mr12535440b3a.43.1795535117471;
        Tue, 24 Nov 2026 07:45:17 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:5da8:85f0:b5f6:2eae])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872951febsm7338465b3a.14.2026.11.24.07.45.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 07:45:17 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] firmware: sysfb: Clear the device pointer on registration failure
Date: Tue, 24 Nov 2026 23:45:11 +0800
Message-ID: <confirmed-20261105-25-a16124b5ff57@gmail.com>
X-Mailer: git-send-email 2.50.1
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

sysfb_init() stores the legacy framebuffer device in the file-scope pd
pointer before adding its data and registering it. If either operation
fails, the error path drops the allocation reference but leaves pd set.
A later sysfb_disable() then passes this stale pointer to
platform_device_unregister().

Clear pd after releasing the failed device, while disable_lock is still
held. This makes sysfb_unregister() skip it just as it skips an absent
or already unregistered framebuffer.

Fixes: bde376e9de3c ("firmware: sysfb: Add sysfb_disable() helper function")
Cc: stable@vger.kernel.org
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
AI assistance was used for analysis and patch preparation.

Based on next-20261104 (8b7179210b22).
Compile-tested: x86_64, GCC 14.2.0, W=1, drivers/firmware/sysfb.o;
baseline and patched objects built with no warnings.
Static source review; no hardware, boot, or KASAN test was performed.

 drivers/firmware/sysfb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
index 8833582c188301afb4a9c9dbdf969828ab9449f6..9cd660a509da939c28e93956d7b6420c794048c1 100644
--- a/drivers/firmware/sysfb.c
+++ b/drivers/firmware/sysfb.c
@@ -214,6 +214,7 @@ static __init int sysfb_init(void)
 	goto put_device;
 err:
 	platform_device_put(pd);
+	pd = NULL;
 put_device:
 	put_device(parent);
 unlock_mutex:

base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
