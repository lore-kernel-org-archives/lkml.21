Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795504501;
	b=4rtO984cNEPzAg5IgMj7F8Q8LqCZtySYy7lzC18Wl7aVQS2ut+gY2glAKx7Ccd3CmDBT
	 P7hIcFoMaYtcHSUW9sxRB9DyVd6yey2mwDQcx3xfD4A2Y9fOwKHjEooHI/c5HmIKqe+Cf
	 gqy14dou2Jv6ZAobTUfP83BvC1QjLFhQkxxcgSmvHUfPHuzf/vXm5oGP1r6AR5DAeviFK
	 tIDy1iAgH2ITK84uri2QyHMOoPPK8KdaqkoA1PqhqYzj/AiAvEg1t816tJhy8hVPdCjrU
	 JJ46PozK3bFu870qa9kwVLMSo/p/tGFa+zgpuZbcHeOttQti0EavXqPxpcmUxhprtXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795504501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XBwqhR3m8bOQBJNfF/ebktnsPnOGA6K0nJo6XELezxM=;
	b=4WssUrHkk3KGD7HDKkZTR7DRX30xzj+pawqOtmsaard69CrW2igDAROVAflvTFnivGdg
	 ZOMz66EZ/PVtLweWfR0CEpvDnpHQktEynusd7Ab7oaAjVb/rZqiGBV8dm2LPby0P16DV0
	 Qqg9X1KXieNxXRPVnR0pWN5GmRP1AeEmyLjxFxDMA/YE+Vjd3rH3Z+NIB5sLgbtKPAMO8
	 sg382ir9rvfd0WSpi4ExHrC2a5RPB4iPdt29JoZCtc7GvZJYdjMOnbxnYvxKuQamtl/S7
	 27GZm3C7zBK5tmd17bfQGvVUQk3qfQw5BWsxtVX1z4RQew2KOJ+0kEGY7eMWTCr04kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rWSU83+X;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BEE606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5BEE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rWSU83+X
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so1942779b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795504500; x=1796109300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XBwqhR3m8bOQBJNfF/ebktnsPnOGA6K0nJo6XELezxM=;
        b=rWSU83+XdpmiYHL38jImZxk8bZbvq4qxdfof1BKQAKv/drMh9RfLj+hG7//4KHbTsI
         2k9L/f19anOKfkVoYAUTKKpYCi5Rclm4WPIG6QzY3gQ+p33qtF/LPX4SrFW4ZGDATuoT
         IAuopI/okore7UPXFsmGws9fEvaucv+vylrDJPELK0JY41EdYYYTuw+XvuErdvHl/WDV
         MP9DzUxIarlv/MNLOppnefOTZLT+n07SBAOihH0JYWUfHjT7H32JNsvuEOA1ceIvA1wX
         5LiULY414lUvh3otAUp8NlhxuKkxxx2RmaDBdEW+PMgvG8EqweR1QcUO8l8STXwMGljq
         szOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795504500; x=1796109300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XBwqhR3m8bOQBJNfF/ebktnsPnOGA6K0nJo6XELezxM=;
        b=K9PiUHxwV433YqPo8y2Tt/tGbyYyHAGxm5j7z7UUHvfQe9+QnhX9VyOxv/yGdSAx5x
         rQ9HEL6NFvMLmPhlpzziONrZKcnzvRwWRyxeJiVNBNq8OtaSc7+AGCmmEDp9u60yjMad
         ItHUUFVW3G43JW7EIsnQm04Em3bzcPu9Rlz8N0r2ekms/3MFiS1tS6vBDxCM6m1edt3H
         PPKaknDgC2hpCD5q9+AUmhk7CLdKqAbLnURscQvkVIsydZd/Ptv7vlBkCdjW4S6xFm16
         g7gEEWqvlucOfr9yLCccSR6qa7Um+DsMSeQjYBboJjncq5H5ci7aQc+75t67HnIKkfMI
         L5AA==
X-Forwarded-Encrypted: i=1; AL+hErEOdErNHfadyIVDnaxQ95TH/aEyEZnqXj81yJZ4FuLCcMumajLr1cx+Gkux9qEKr3RKKkeG3tTY8/5Q0/4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JSjb8dMe7bE9Vr9+2HLwGVhIWaYTorDYPpKabPBRxDf8+4oFT
	GXGp/c9l52l2s1KbRnN2PcTF6/0t2htOVSF1sJe25xUY2GAmtzh6Sd8YCurzFH1l
X-Gm-Gg: AZFdTZfeHOoZ15C0M73JB+L496Inffwqd9iExJpt3tKIGbkm2bF3c30KKkzj9BVk8Qr
	AcumOEk8fNBbHtVR2T7Eyprd39AVD+s3W5HUAlbdEku05lIU+kkWAefR9x5u4stumrAM+3R8OAH
	RBEYmfaZ0lt6mTpAl3XmVWBcpF73umX2k8DKVV36omuFuRm31y9EVDcXD8uGu15sEdGdlvnaPta
	5bTf+Qko/I0eq55sqlM4utU2j+7pLK+wrkOQddVd090rEoHQVrjp53Mc2/djSmCm9cs94LEH++8
	NbdOqC48tB7NHK6+dJYgjweqS2FZeEOWGK6OiLieY46izDtmhLM+JzEN9AANaGvwCGl2o7SlT64
	5rB2JgIaQRZxu/couP+hzZBsBSmfCH1Zy3X2K98bzBEIyf29xawefos3ZB6P/4zVCboLXqhVavp
	urdRXnnG1sEQxJavLfJLDQdFe0l81tjM7B9CfzMZhJURxIgDqnb1gZwF/yYrNY2XUHnjegDFnsw
	gvzwKtEu7fx9XqKo4NEkepGjYZo9fpWHNpbTpcm3Kar5qzw10W/yEhONpQd66BYHGwc4gaT8nf7
	O61ldp4xw4LevVel+WeuC7EWqM7uttiOYbxtBleTc+i5rydeNmHUZIkAa2M+s6IR/M0Ryg==
X-Received: by 2002:a05:6a21:798c:b0:3e2:117a:62ff with SMTP id adf61e73a8af0-4014c2573d3mr11960703637.61.1795504499863;
        Mon, 23 Nov 2026 23:14:59 -0800 (PST)
Received: from embedsky001.tail6d6b2f.ts.net ([183.13.19.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfcadffsm6475836a12.9.2026.11.23.23.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:14:59 -0800 (PST)
From: Yonghao Zhang <hyz3367@gmail.com>
To: mathieu.poirier@linaro.org,
	andersson@kernel.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yonghao Zhang <hyz3367@gmail.com>
Subject: [PATCH v2 4/4] remoteproc: core: Clean up after a failed recovery
Date: Tue, 24 Nov 2026 15:14:09 +0800
Message-Id: <20261124071409.972-5-hyz3367@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124071409.972-1-hyz3367@gmail.com>
References: <20261124071409.972-1-hyz3367@gmail.com>
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

Release the resources on the failure paths of rproc_boot_recovery(),
the same way rproc_shutdown() does, and void the power count in
rproc_trigger_recovery() when a failed recovery leaves the processor
offline or detached.

Fixes: ba194232edc0 ("remoteproc: Support attach recovery after rproc crash")
Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
---
 drivers/remoteproc/remoteproc_core.c | 31 +++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 8c3fc85b8f04..3e700c94110d 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1800,7 +1800,7 @@ static int rproc_boot_recovery(struct rproc *rproc)
 	ret = request_firmware(&firmware_p, rproc->firmware, dev);
 	if (ret < 0) {
 		dev_err(dev, "request_firmware failed: %d\n", ret);
-		return ret;
+		goto clean_up_resources;
 	}
 
 	/* boot the remote processor up again */
@@ -1808,6 +1808,24 @@ static int rproc_boot_recovery(struct rproc *rproc)
 
 	release_firmware(firmware_p);
 
+	if (ret < 0)
+		goto clean_up_resources;
+
+	return 0;
+
+clean_up_resources:
+	/*
+	 * rproc_stop() has already switched the remote processor off;
+	 * release the resources of the boot this recovery was trying to
+	 * restore.
+	 */
+	rproc_resource_cleanup(rproc);
+	/* release HW resources if needed */
+	rproc_unprepare_device(rproc);
+	rproc_disable_iommu(rproc);
+	kfree(rproc->cached_table);
+	rproc->cached_table = NULL;
+	rproc->table_ptr = NULL;
 	return ret;
 }
 
@@ -1848,6 +1866,17 @@ int rproc_trigger_recovery(struct rproc *rproc)
 	else
 		ret = rproc_boot_recovery(rproc);
 
+	/*
+	 * A failed recovery leaves the remote processor offline or
+	 * detached, where rproc_shutdown() cannot release the power
+	 * references: void them.
+	 */
+	if (ret && (rproc->state == RPROC_OFFLINE ||
+		    rproc->state == RPROC_DETACHED)) {
+		dev_err(dev, "failed to recover %s: %d\n", rproc->name, ret);
+		atomic_set(&rproc->power, 0);
+	}
+
 unlock_mutex:
 	mutex_unlock(&rproc->lock);
 	return ret;
-- 
2.34.1

