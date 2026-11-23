Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448413;
	b=wzlXmogm2JqfHcF64JS9ZPXlcXhIB3zlqFbxPxoBarm0R7cZ5i6RrDTM0crrrn18RMzP
	 K/AA5HCAtG4Wzac8kCx3NsPpH+BPA9x6OrdzOj+UKhrl3t1jmZm7m1CFzvUIv0bbb1ig6
	 Bg61o3b7i0gIrvS55wlGeiBigZOqmQqzv50jxiSfWu9dEsYIHCNtMuMcByij4jfMH2yv0
	 HLgYROxTP4/kyB8bu2qJ/GtZJ1AYl84XadTSxRv5dX6ESqw2nWRndfaig6Q3ZfHSckMJQ
	 Vw5g82k/CO1kLmI4xP5j4ecdHhuGgXHlYz2L8Wb/ZvnbZI0OLqcSKzOtW6Cs1b4Sbow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hPklCA6iPSfMecleTfh/hEh9Vrxq/JnkDe6aLo0pdFI=;
	b=iGvI/tl9Q3WvuDJ0FxwQ7+eA/VpX1WXR4rIL3kVbO/wD6w6SbvidG4gROLpr2s40Cemc
	 BxyeYOdMuUmcq+is0MXFhPHQ2wYLW8asV7St4FQmMtgxhLzmMz/ldbGIBiOlnZ8wzfuiS
	 hyoSx7/5ijxaiUSy/nxDvOycFlBT8YG1g//8u1JbAELjqWHm8V6JnvYaFrUGI0ILU/LjT
	 pjM/v9d9iVRT9OR4ma18WfewiqjLt3n0GvAeXWO1gzPzbyU5+U0dxF16QDxpSBXHjdeR9
	 V+1S7nyGh0WivB01sdVnhvJjXEingLV2ZCO37c56LjEAR8PFgzkK4k+qAGIf2ZHewLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lh8nLdxa;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7529606A6A9
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7529606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lh8nLdxa
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15ea896ddc8so5753707c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448412; x=1796053212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hPklCA6iPSfMecleTfh/hEh9Vrxq/JnkDe6aLo0pdFI=;
        b=lh8nLdxaaz5IPSaPxBgKthGrYFF+g07VR5Xbe8JOogSuTG9I91qcwvzqF3gHVDohGW
         8fzq93MogKOG9LrnRLKPLvA25ZTCz+IZ7nsCycngBlhOrYqmSHxc5RgXwVJ3QAKQ9m15
         XE32ME2GqMNnS8rOqZtV1jv28+/8f4dY2ESbFK3Dwcfd3JPqgDDC4PE3PiMajKYPEUHn
         GaCWPyIztklySfwyG4iSaUfopPkyFNlpFeHbG8fI39CNBfAwCrO5zlVHMbhjzT+PBBhU
         YU8KnCIviJisPYt19Ihaqk2cAI+emls03ofGD93ZNTSEvARnF7XKh3llza+/ULcluthx
         /gsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448412; x=1796053212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hPklCA6iPSfMecleTfh/hEh9Vrxq/JnkDe6aLo0pdFI=;
        b=PhYDd6R9n3YVKdM/3NrA1towrQYKSokJFhJe1TCm4h1Te1hp7W6C6BrAatJvGAxktk
         GkhxwnAL6jKO0R/t4VHBj7vavWP7DHXp6Kst31N5GBRc6nRZk+Rs0tXZe3NfHN8AJFmS
         vVwBTJBt2SB1h7jf6X4yoqaCZwEA/YYdM2W0wG7+wuQsVVjCoAbVcSVjgyIDC1YcGyH2
         Xm7ajX3TtySHw0z13N9ePPj0gAWUvLaAlNh5iASXXz1lt7AIb+5GcwJL9D3M+ZxQOAPw
         cV1yBIdoPDPWPWDbFLBhUeDiuLiUrZ/Jddt3Js2M4lkq7SminSpgf/QDhw48YOg5jCBt
         jwwg==
X-Forwarded-Encrypted: i=1; AL+hErFStd/kw4CmjiLNIQW4TqdwnCFtF84mZXj7FS+gp87GRcOw5PvniUWvlMlnz3PJ2zOYMjZJ6aB1hw6Lc8w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QtUZOjMzXOkSEX2xWhC5Kb2ZfbuT/S1XEdUq8UpshUVIyauqz
	jfxUGVrhIQHaSi8KT/oEcl2h0+m48jB+q7AvlpTpG3Cfl9TwsFVYcP9k
X-Gm-Gg: AZFdTZfL+o4OHZxwaWyMlUbbpK7ohk0sDFKEVjlS2hsHprN4sXBZ0gPzUSWiXdhcQwF
	gaAAfV4eTR/KORru8n45o7NMBFeQsuesDXZxHTnnoquVdeJvUhQY0Wb4Z7jKQ46uuHIuA+xpX92
	RWkF1HcBBawrWD0JPQrr9H3dJju58MsL1HKztqPQxQYI/GUA017jojhyCyg14kUKHFNb7N1X8FG
	cI1PKV4BtqGn4CuVWxJlxhiWZBDVLtIFAQ7ur0xAvwa0hVdwyieRGNSXEBBCABXU61S2/frz57C
	BNnRxxxX1Wf4xlTEvDjYbQMCjZ1rnKT3bqBhMcoGQcDmT2Kvihtsosui6SXKRgp/s5mAJvcZGmD
	tJXK7XGB39yb0W/7hDIAjND1mTEmCGynnXOA7/JOMnkja2yP9tGC9IsTwMa/zgcbVsZNtwgTvLK
	MGiwQBw5xjqj6PhkVgOtpAhNSKr5ui5OUV8sMSdUNtHKO3HwEd3xxpc7Wj4ESI0qc6VpWrV8csM
	EVCDNtcbOuhbrZ7We1bC0NiIYAjvcWRDfQAa0C1BOcqbvuXtkHYv1oqjJF69avgEC1UdbnJcOSM
	LT1hJ3IxZKQXoiWWNbxUE3kNkbxXAyzcI0/XvY/1sXcS5ug=
X-Received: by 2002:a05:701b:4516:10b0:1b1:251f:d732 with SMTP id a92af1059eb24-1b5568e1e20mr12125028c88.31.1795448411933;
        Mon, 23 Nov 2026 07:40:11 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33680067c88.7.2026.11.23.07.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:40:11 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Marek Vasut <marex@denx.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/16] media: i2c: isl7998x: power down the decoder on remove
Date: Mon, 23 Nov 2026 22:39:25 +0700
Message-Id: <20261123153927.2547169-15-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123153927.2547169-1-congnt264@gmail.com>
References: <20261123153927.2547169-1-congnt264@gmail.com>
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

isl7998x_pre_streamon() takes a runtime PM reference with
pm_runtime_resume_and_get(), which isl7998x_post_streamoff() drops.
isl7998x_remove() only calls pm_runtime_disable(), which does not run
the runtime suspend callback, so a device that is still runtime active
when the driver is unbound can be left with its power-down GPIO deasserted.

After disabling runtime PM, call isl7998x_runtime_suspend() if the
device is not runtime suspended, and set the runtime PM status to
suspended.

This issue was found by auditing the driver with an LLM coding assistant.

Fixes: 51ef2be546e2 ("media: i2c: isl7998x: Add driver for Intersil ISL7998x")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/isl7998x.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/isl7998x.c b/drivers/media/i2c/isl7998x.c
index 42387bd310fb..48fb131c9e45 100644
--- a/drivers/media/i2c/isl7998x.c
+++ b/drivers/media/i2c/isl7998x.c
@@ -1597,6 +1597,10 @@ static void isl7998x_remove(struct i2c_client *client)
 	struct isl7998x *isl7998x = i2c_to_isl7998x(client);
 
 	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev)) {
+		isl7998x_runtime_suspend(&client->dev);
+		pm_runtime_set_suspended(&client->dev);
+	}
 	v4l2_async_unregister_subdev(&isl7998x->subdev);
 	isl7998x_remove_controls(isl7998x);
 	media_entity_cleanup(&isl7998x->subdev.entity);
-- 
2.25.1

