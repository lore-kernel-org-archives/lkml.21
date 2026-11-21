Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795290603;
	b=NcELz34hTroQWc81oL1QbqY62dE0uPenjeDXaaoJkCGQUnA+4NmhbIkjyDe6zPYT2bHc
	 /KfhNu54UNxM1vvFBw1I5YZJwYFJIuUEBKdZICXpuHlAlaVIF5MBa1AWAcpvLSjtBwzVi
	 xrOmGGVtR4/zubzLKSDbgqnJ/BrcxMtTX4W+4xLneU+baNZOFfhYZNY4Rkl7CJjulQ4Mw
	 25Wqdv3tiUBaXtzoGBTNyhACEJ1m2H6OsfTZQRaPXYjoJ2HYxltv0VCJI13yaPhMlZBs6
	 ZBdf3/OkpXogeGlxo7BUoLi+qYkzJ0FrOaOTTebar6uS6bPjoXo7KSB2SZ7SmmM4Aqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795290603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dUkauO/jYSTVRb3SKDOjoVU2Zv4gQ4g7Ob1cBy3r7jA=;
	b=zBG6rKCpxZ0QESkjA1GQBWp1KPfREyld+uEiGZK+Oz6MYJg6wZMzabJ9i41tX40FCfI2
	 AX7SETFVSlznUdyiSTzFKH0D/2MvE52fPgADwF08/2LBpiIYNBnH7vdy3FyfakcXBf0y8
	 ERuTCtInZZl238iJ+BS9GXLCO2licKDkGEs+CB88wwjiuK4P3gRjTRHGwkyG1Z5Ix3ewp
	 xUgz60TtRo6rznS62C1tgnrjO+zMTiCLhP6mwXNfiVeGeQGjHd5AouiSsRJOYb+wYebaQ
	 uChRKP/8ArsB3PX43ERSCKzeShuedJrYWWKsEC1EnIxV0H6M2nYHhJTurLLVWrroYWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lZuTuoBO;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E563A606A690
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 19:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E563A606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lZuTuoBO
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so23385425e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795290601; x=1795895401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dUkauO/jYSTVRb3SKDOjoVU2Zv4gQ4g7Ob1cBy3r7jA=;
        b=lZuTuoBOjPD+lSnlynZFnMINhxQchgQceWQot3a4HEEJR2TwMsxEbqEXh9QhHE75zp
         ozBfxVFLwKi4CIKdGo+fNyArCxFnThTCMxmjWiMNZnyp3p2dFusNwQgibaHIruA9rraj
         /KJqshFjSOWCZu3YYP9PNm1Nyl+5zXL3l9q+ib9O2piExv/T8yA1IhXfOJHwyi3lSOyt
         CgBmn2JtCNYZhGS66KJQpNmQ4ltsQ0A0/QgQV2GCsauatFg7FaPK6cddCs4W88arPqqd
         7n72ldIFYatM1HVGQ8RB4iTM7ojksYsOaUEqlNZZomymEcgTZpJty90BVTcA8ATI8jdq
         G/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795290601; x=1795895401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dUkauO/jYSTVRb3SKDOjoVU2Zv4gQ4g7Ob1cBy3r7jA=;
        b=I1dlpwfffUrwRFf0hZEqpP0a4FFsqXKOgvDgjvixrfObO9gVC3kHsFs7h5ak+i43AD
         F50vO+y6qvR0FyrodxsCj7nzICJIQPj2xCzb66j77QnP4R8m/EZ6HvHYUxsWpQoT/J7l
         gJz/XrgavvZdsG5rxFyz95QfZFg48I+Jy/b9UHjOu+A+bo9vkiUe8qFDY6/o2Oew68Hb
         vMoN3247puCdYdBLNHOAN7eS5HT30YOOdhTLx7GzRGdsfKbs81t9Pum+EAp6hVsW7809
         8J7uPRKn4xdnMlteWpMcqDmB9/bvN3VuY792bpTTKXw8Sc6XGLQICv/QegjYZoCzLUlC
         Qk/w==
X-Forwarded-Encrypted: i=1; AL+hErEhpqzrSXpXa1r3qMj2uae+Lmlm8ocKZyFsZu+A3hCAX4gBtxMiAOmwQ9dGyKJ2P5DD9wyA+F0lKa1RX7s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9Xgycjl15h8vSlfeGd298j9fu5+Cfn/w+dFl/MdlwSjdM+9X7
	SKTRyJuXkKd0vH0nimFKjtHAEsyI5+AdsPBh1uPDCI8j3or9e6CjIdBA
X-Gm-Gg: AZFdTZc5OIaJkXgVu7zulT7zSUqejl8+/KWGR7AWbifFE9ml64ltkRF4NlXvDzcM9pO
	0he+FeMQbqkQaxqPmr5h/tMdYJHrwnA8sIvgRgQ5x2BC2uwHomkt7owfeVGe0gLWD9M/SF4sqO3
	3CauVq54wt4W9GPRCuFIdAAbYfJPNGHNsLhvYXJOE33xYJ6URaa+eJrba7g+0uSYydlnf0FOPVI
	r7BQmpkMHECeZGqqmKqgKB6YMC+Mo0xNac6ix+iBBYOdZ0xjUFJXNEfpJIUgfVRXyXEv4+dh5K1
	pTu63VxCWK3g2ZkUUBTA/sPHOnycdzWPKiK8n8jcE1CpWIeJhlPbf7KWi8/P1frlUN30vZ2Ak5/
	jmox1QeuD4UtSPZeDQ4uFEH3ItLM9FAcU+m7aW6kvvhEgu+RNOC0FyE9Qu7FN8vfF8PiTLhzhy0
	8ZsK6s2YqJRMTfQ8EraFgHWscxNevLxone/RGyyGLy5/BuEwcDzxiLASdbQ+EUXSssFLvjcen1m
	fCUo0Zl9bT2tsH6yCqy/njGIY5fDwKJiXEluJ7nPy+xLhVV6SLt0nNjcaR2fm2EfS6Jr0xxpKmZ
	9O/Dx9BZ6PEA+tP/ZdKmgLGswlJyfVCv/B5N5g==
X-Received: by 2002:a05:600c:1d09:b0:4bb:66fd:ad68 with SMTP id 5b1f17b1804b1-4bb888160cdmr156021525e9.14.1795290601026;
        Sat, 21 Nov 2026 11:50:01 -0800 (PST)
Received: from unknown.m0rf30.ray ([2a02:b027:12:31d3:47a3:3d6d:45fa:53e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm196876215e9.7.2026.11.21.11.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:50:00 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: jjohnson@kernel.org
Cc: loic.poulain@oss.qualcomm.com,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Gianluca Boiano <morf3089@gmail.com>
Subject: [PATCH 2/3] wifi: ath10k: add firmware feature bit to skip quiet mode
Date: Sat, 21 Nov 2026 20:49:38 +0100
Message-ID: <20261121194939.3647400-3-morf3089@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121194939.3647400-1-morf3089@gmail.com>
References: <20261121194939.3647400-1-morf3089@gmail.com>
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

WCN3990 firmware advertises WMI_SERVICE_THERM_THROT, so the existing
service-bit guard in ath10k_thermal_set_throttling() lets the pdev quiet
mode command through. The firmware crashes on it deterministically and
takes the modem down with it.

Rather than hardcoding a chip check, add ATH10K_FW_FEATURE_NO_QUIET_MODE
so affected firmware images can opt out via firmware-N.bin. With the bit
set, thermal throttling through the ath10k cooling device has no effect.

Tested on SDM660 (WCN3990).

Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 drivers/net/wireless/ath/ath10k/core.c    | 1 +
 drivers/net/wireless/ath/ath10k/core.h    | 5 +++++
 drivers/net/wireless/ath/ath10k/thermal.c | 5 +++++
 3 files changed, 11 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index d37add4cf..6272e0f62 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -816,6 +816,7 @@ static const char *const ath10k_core_fw_feature_str[] = {
 	[ATH10K_FW_FEATURE_PEER_FIXED_RATE] = "peer-fixed-rate",
 	[ATH10K_FW_FEATURE_IRAM_RECOVERY] = "iram-recovery",
 	[ATH10K_FW_FEATURE_NO_CHAN_STAT_EVENT] = "no-chan-stat-event",
+	[ATH10K_FW_FEATURE_NO_QUIET_MODE] = "no-quiet-mode",
 };
 
 static unsigned int ath10k_core_get_fw_feature_str(char *buf,
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 29a4c0d74..5dd21f063 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -841,6 +841,11 @@ enum ath10k_fw_features {
 	/* Firmware crashes when asked for channel stats events during scan. */
 	ATH10K_FW_FEATURE_NO_CHAN_STAT_EVENT = 23,
 
+	/* Firmware advertises WMI_SERVICE_THERM_THROT but crashes when it
+	 * receives the pdev quiet mode command.
+	 */
+	ATH10K_FW_FEATURE_NO_QUIET_MODE = 24,
+
 	/* keep last */
 	ATH10K_FW_FEATURE_COUNT,
 };
diff --git a/drivers/net/wireless/ath/ath10k/thermal.c b/drivers/net/wireless/ath/ath10k/thermal.c
index 9bb486f8e..c558a9e7c 100644
--- a/drivers/net/wireless/ath/ath10k/thermal.c
+++ b/drivers/net/wireless/ath/ath10k/thermal.c
@@ -139,6 +139,11 @@ void ath10k_thermal_set_throttling(struct ath10k *ar)
 	if (ar->state != ATH10K_STATE_ON)
 		return;
 
+	/* running_fw is only valid once the device is up */
+	if (test_bit(ATH10K_FW_FEATURE_NO_QUIET_MODE,
+		     ar->running_fw->fw_file.fw_features))
+		return;
+
 	period = ar->thermal.quiet_period;
 	duration = (period * ar->thermal.throttle_state) / 100;
 	enabled = duration ? 1 : 0;
-- 
2.56.1

