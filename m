Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164062;
	b=mR54wLEMCgNoViraDS4JdL3ALWVNjKlKWMhFSKQ9QJI4lRduAZhc2kObU/qUR3c6XyfI
	 MdQrU6R/tKcSu04X2KXb3v9HaFPGqcttqxCsd8tSsBLpoi6PEcuhRVQze8TAqbHhctIqH
	 gHTZQV44ENG1eN+Tm+7B4X5Ef6Qiy4K0/O48It3sCsp3tFZGC/4/nPv4KJVz/fUqwaGpr
	 XFrFWRmJxUsd1DDpgrnv712sFkIhctpc6mcVgVKTWl8hpUXh58mDfQfE7Vsq2bg//N6uf
	 B92KuhP4gqAYw1Ojs3kE3W9XEGRJc6fOjoUT3e1X6Uf4Quqc/GrC3VrmkJGt9WRDsKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8fqgQ1PFUcTxqPkGPD9MBUjIl2fcMgF5433kwtmJbEc=;
	b=ukV8CpcndvkVceaP3y8iqNd+Tb9WoW4QZM+7WYZIhbwOFVo/xXuP+qRKK5gV0qZCvVD3
	 Lq/cbNBGSXjzQyHgrJG1hmsosxegUUFygEyUCLmaW/406LETnA4C16G6pZQOOJPOQNk7k
	 vf4no0SsZFSdMcFLvN4sLZiDTpJrwqLes++evKAOYTaOa/Rt4AAiQlm7EQtXJr/SH0iYY
	 rXYVBhSeoRYq5iHfl1uzlKB0JAHN/TVPo0eFOmQp6EZXkBvJHM1UkF3eaddFoh1nOCMkH
	 9Pl+gSuRzklVW2mEh90WBp0/B5ECxrl/Cdcn289Tm0y2id7kkq+F+sLnBKUnQ3eiKrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qe31VwVD;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A760A60A261B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:41:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A760A60A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qe31VwVD
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-38190551625so1040596eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164061; x=1795768861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8fqgQ1PFUcTxqPkGPD9MBUjIl2fcMgF5433kwtmJbEc=;
        b=qe31VwVDp8c3pEPSPq/JYuCX2YmZfbdatj5jYB7hd1hWvLNkoUhMoxErK6dClYT5bl
         IA8waPcLiq8GtATzit7dSLxy5+u0ZTx2vajOATURkMy55sUThX8IDrdPat/1uUXGrZ05
         qdVgwRQj0xPSxfDwCu7E4vercKxHM4Xm2zOdnVhYvPfL6tMTeBs9PHy5LkPCLKOtysZc
         jumXAQ5HbgiqsuyZmfCQVBUPSZM+YAqLXyJp7cle7BUrM+XammIc0OG2TOh54MXntjn+
         fM21EVfO0YFP0CUvwdfDTRegAGNpvoT0HPvLQTYIiK0LiVGRbHl78A8LppjE8HlnY4iU
         zf5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164061; x=1795768861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8fqgQ1PFUcTxqPkGPD9MBUjIl2fcMgF5433kwtmJbEc=;
        b=bnoImrTEY6qMD85rLqsjTvWeU66a0H2CxtRASB9Dybw8BlxngPpr+INRgjePic/p6j
         EmsaTwegLq3A/TIbufe6B4THWPv1ujfNcY6OpkWIO4t9/tz7Z8QH7FDdpNPdh3+IpNAU
         DHHNOiP0fDgMEt51iBDvDMWhz1NVrG0Msbow0yeKyYV72gROV9D0jf4/ynU3ZKHLAOrM
         E01VLBTCbIsBdy/jNEQj7a/EDo3GePLISPwKS0e+HqLrSZrS6M9Sw/jC85CEjDy0Ps6/
         U5MxrtnWQkXWejPcmiqh6yetvHGLoQTFQ4/hSghc6IhefvtYyloLUvZSZX7YvXcxabAQ
         2kSQ==
X-Forwarded-Encrypted: i=1; AL+hErGBe5ABdh+K6yZOOmhBUj3J8cWreIBNXzvwW2+0/40vpDvokAvUws1ZJtWJDbcCqOmfdkgCOgRo1Ar2BZ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8G5V+eXLeVydgDIGqdi81bnHLcjEtbKu+5zzvobIVnbD7sQWzv
	S2RgbHt4H1cIEstyU3RM0DcJnZN9qTjmeq6OxeOoalRmyZ0krZTdRkaF
X-Gm-Gg: AZFdTZcDz9i3+ItAAeYLVThJX+GWhMJp9NjVb4G6cW3sjMGIuvhQcwR1gQqbjv5x/Xt
	mlOGYAoLgCkLosVIx244he4JzAh33VSUpgLLI3pboKQZjSF/0PDNkD8HHCVHKsrKXFgYcIt/MJP
	HNX5jvY4oR887LjjKNVYauL3iTwRubxU5p6hzTlDRXf0AX/WOZRNE29qdPJv6C4coyr/85tPPPr
	ewL10dXTcv/rAx/cBpaCu1ptEPltCCLCTDVhjWF5YbcTKK/u6kIIziMM7if9MO3BSFKX7KLEfR3
	gDBdzV9mdSSa6ovkCzDFWBRMf0K3dq+HD6Ju1lp9edlZdmcgVK+kblWdp6qpjbXR3rom45Oaxii
	qetG/AR+iyxDdWQmDrWnqt5CSmDpDajGCs0Fzg0LKWuufJVfnrSsncBJBpVJqQnB+NVaDyvR+62
	UnDUU2zb1xkjq/9kXZPJ8lRWM9cqLX9DzO2GFIzVWu+PUrUi+FK9as8r52czSKGBH94NC6kZaJq
	x6OCwnALjK9X6bGmQEY1JeGuGxtpwfoPyTXGYcfAAZCzdYd8Aipqf2MmEjWIy5SFN+1XqFDZd0x
	Ml7sgXVaDduj6l+BLsBndBzaNWK/4S+qcFygQ1BwbsWFsnau1OFxuXzNqYRbzVc7gOxQKEUHblp
	1h3TOKHEERx11JOyRZw==
X-Received: by 2002:a05:7300:601e:b0:386:1e2e:ce0a with SMTP id 5a478bee46e88-3861e2ed1bcmr537091eec.27.1795164060701;
        Fri, 20 Nov 2026 00:41:00 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:ea97:e47d:2ebc:210c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm5793181eec.23.2026.11.20.00.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:41:00 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 20 Nov 2026 00:40:50 -0800
Subject: [PATCH v3 02/14] HID: logitech-hidpp: use GFP_ATOMIC in
 hidpp_ff_queue_work()
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
Message-Id: <20261120-hid-logitech-hidpp-v3-2-cfe2caa1d0eb@gmail.com>
References: <20261120-hid-logitech-hidpp-v3-0-cfe2caa1d0eb@gmail.com>
In-Reply-To: <20261120-hid-logitech-hidpp-v3-0-cfe2caa1d0eb@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

Force-feedback playback, gain, and autocenter updates are invoked by the
input force-feedback core while holding the input device event spinlock
with interrupts disabled. Allocating work items with GFP_KERNEL in
hidpp_ff_queue_work() can therefore sleep in atomic context.

Allocate work items with GFP_ATOMIC instead so force-feedback commands
can be queued safely while event locks are held.

Fixes: ff21a635dd1a ("HID: logitech-hidpp: Force feedback support for the Logitech G920")
Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 85d8d168ff15..d9342a3e8122 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2542,9 +2542,10 @@ static void hidpp_ff_work_handler(struct work_struct *w)
 
 static int hidpp_ff_queue_work(struct hidpp_ff_private_data *data, int effect_id, u8 command, u8 *params, u8 size)
 {
-	struct hidpp_ff_work_data *wd = kzalloc_obj(*wd);
+	struct hidpp_ff_work_data *wd;
 	int s;
 
+	wd = kzalloc_obj(*wd, GFP_ATOMIC);
 	if (!wd)
 		return -ENOMEM;
 

-- 
2.56.1.750.gf70dc682cf-goog

