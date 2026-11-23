Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448396;
	b=LPnyj3Kn615/jKqNrW2eEXC2Ci+COHl5lrF2ToT6UKCgF0c3CzHRqEE389mrpqWxm3dr
	 q79chetC2z5oWXw26aT7oowNskwHwYzlcB0U5eIS5/1zMygKsy+tNmsK8g4cXB3uMd9Tp
	 P7ocV7PT/JflktvVW20VgYdzZPLdoT5s5nza6jcx69TPMfUSTGCxu8JAdmjsZNZabRbWI
	 RX88CyS9onj7JCtdGM8dHcXRnyT9qEOUwyaT+mAKYRVRspjLvx64op/iStYT1ePnWZ055
	 //hcj+yQAecTwOxdL2DAEQlr2+N9vLbUGmm6GxUBnZTP8Mqv03yrwKtyHDX4pxEbRUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VWQoeOpUuP+oE9rrgpL1AbVJmnbQCaH1p6MKTz1Htcw=;
	b=bHYML5IDLiPnnXryCF+ANuE2n8Y0qYDVhSKDH44llBLFtVuEWUWPxXi0+hJIpBivb9W/
	 oH+HjRtiS9ppPYAXVNsi4hM1Rdfu1fZjZPGhlIsJLiz5c/RjGtTba9pe4sEk2W6q3FF4I
	 UglZQ6i6/mmeyCXLQ5K3cpXls1/Q2lgTgeXGqh3vMuQlfZNwTWGNOZYk0yVDBiR32kjLk
	 AkUMHPRgV3JAXhi0NsAEysiRfHIWG7TgCw6DYFhf0hTyNdcT9ulnsgVGAllV8tyFNHfsD
	 HQc+oZWtcWnQOGW9VrEbRKRJc0CGdWgOU8oynJipbwpuIda9aQHa95PChZzExnZqnsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RWioAiUK;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5DC60A2612
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E5DC60A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RWioAiUK
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso4321412c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448395; x=1796053195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VWQoeOpUuP+oE9rrgpL1AbVJmnbQCaH1p6MKTz1Htcw=;
        b=RWioAiUKIrrz1imjRAGD3wxrhT8YwmkSVzKrz2Lrjdb3pbZeLqNScgpjQZvjgMyBH7
         lh83ISXSkJr2DW5QNOYvvoy1b7aWOL0CyF+bP8SaG34pOiwE4DFEgEW/VpPL5w8G68m6
         rrqrZ8oc7H+BQ6kkPvNC1Ek+ydfAEJSEzplTw/XCKvxu3gVaLIkfq8ZzhXwRVUX0Zzjk
         d1BmiMjFkckULs94pMBZlmBRlRyb1HyEYA73EO8+qNNnL0zZZUWOO5ge/YUjJXJlVK7I
         WTQGbe1K6w2bTkCQsXEA1V+BFaANZSHBQMO+CqbBvCpfbx7fuo6g3Q9vmzIj7b5t2QvR
         GxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448395; x=1796053195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VWQoeOpUuP+oE9rrgpL1AbVJmnbQCaH1p6MKTz1Htcw=;
        b=QcztY4Npac6MwMsSfgo18xtGs/2/Iek1arL37lls3UlZpQ19ZOCXXiOqsme0vMiA9y
         iDrhYFQanj4cgIcnqfptQmBGUVtPx78IqAj/6rZqXc1y12rmu2O6biSZKhj0LVO2kJhS
         rP+hoNpZwguh30BP8JInyk5Z9pntvPohxpH1w9WxPS3x5b+4v+34QRmza2BtjE7TW8jS
         +x/YLhQTMYD7ADzcbEAgjopxqvKvcizuxjgOlVCXCBq5ONI+HdYd74E031HtS4CMu9fS
         8Yf6SNUs2G9bTEX1HNBy2TtqZxt5Z2WWkwD5DxHMGNT/YuT5CJWl44IdpAwxeDng6Lxe
         84oA==
X-Forwarded-Encrypted: i=1; AL+hErFVSGdOuvfEk67KPc4mcrn9H8eU77WAu4mvx/sFA+KrIS30BdkGT5tZHdws27CcWU2vCUPnDe9cI6pICxg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jv8ceIvt2QW/8nhQQnGfGGQA8jFeJ3uHhMNlM9/WMu4G1rCQN
	oPhwhtNoXRpAZseHJguHkhapGB+/mgZC8VOM5w+fqYSkA2UGgENTP4PC8eGGtA==
X-Gm-Gg: AZFdTZe/cTfBnGy7WIZXzwp/UqkeMGhZeAEws0IwWZFgyk5j5l8IE746IA2/h+chIJW
	BEoRiebTQefO50OvyNixzQdN76wqDtYrR9+6kfkhDVrdwh9+oDPu/owx5UuGUUuO7VcsL1TpODU
	IBmhC/ZtqgAKUJEDUSGEKCGN5AQBEfLPz4uUenn0Hbuq3KE9w+hRDfG4KxW6No20PyJWc9Sjbib
	4bP2StDxs2OLCRuBj0hN6Psa/eAY6YS11LcjRm6xZzNyp4+bavbYyf0d917h84djic4Q8C5IgNB
	37DXQlqU2NnAo79EUJcUhIOMeg70YYHFVd/YUVLq2I7bhvidWQ/NKO9b88i0w/C4V/M/KUU34H1
	kFdBHn1amwvHgEAyF/9KWHoXqWtgSUbPmo8LxOcGimD2rVCV9jbpXW7ljyhdAjsauY0QXFF4Yar
	aJ5dwM3clnvElca0Tw4GJKDcsXYkt4YMNPFF0DDU6Nyha2WWScR+Ud2hgIVWwqpmG2+Tp4e6UQW
	/Cg9wSl6ewtgYRddDtbhzFfAW5au1o3xUdz0yMMR2CgxYEmAHtb7gfh/Tw4D97AxYGRwZ8oda+u
	Cybk/xAsOG0o3KL6spsZ3EwY6blP6SikISc4B5nNc7sJS2k=
X-Received: by 2002:a05:7022:4181:b0:1b2:42db:8a1d with SMTP id a92af1059eb24-1b5568c8f3dmr14910765c88.29.1795448394622;
        Mon, 23 Nov 2026 07:39:54 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33680067c88.7.2026.11.23.07.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:39:54 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/16] media: i2c: ov5670: do not power off twice on remove
Date: Mon, 23 Nov 2026 22:39:19 +0700
Message-Id: <20261123153927.2547169-9-congnt264@gmail.com>
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

ov5670_remove() calls ov5670_runtime_suspend() unconditionally after
pm_runtime_disable(). In the usual case the device is already runtime
suspended by then, because probe ends with pm_runtime_idle() and the
stream has stopped, so the regulators and the clock are disabled a
second time. That can trigger the unbalanced disable warnings from the
regulator and clock cores.

Only call ov5670_runtime_suspend() if the device is not runtime
suspended, and set the runtime PM status to suspended afterwards. This
also covers the case where the device is still runtime active, which
the unconditional call handled by accident.

This issue was found by auditing the driver with an LLM coding assistant.

Fixes: 62ab1e325978 ("media: i2c: ov5670: Add runtime_pm operations")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/ov5670.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 90352140e5fe..dcf335abcf5b 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2786,7 +2786,10 @@ static void ov5670_remove(struct i2c_client *client)
 	mutex_destroy(&ov5670->mutex);
 
 	pm_runtime_disable(ov5670->dev);
-	ov5670_runtime_suspend(ov5670->dev);
+	if (!pm_runtime_status_suspended(ov5670->dev)) {
+		ov5670_runtime_suspend(ov5670->dev);
+		pm_runtime_set_suspended(ov5670->dev);
+	}
 
 	v4l2_fwnode_endpoint_free(&ov5670->endpoint);
 }
-- 
2.25.1

