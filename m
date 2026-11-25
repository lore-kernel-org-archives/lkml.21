Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636250;
	b=PzqJqx/6ZbNOQgEaWVQAgy0+QcBPGgTO6KNpQCEb+1LcLAd4HE2a6eJRWd/BhGjW5fTO
	 LZ2z0lmoyqeXxh+WCmv7mvUoF5DYM1PkJ48hDjvUxLvsdYfu5l2GXTYhHfCC1QyBNYLtN
	 8QN7YbC0dy0zxrcoLKXX7aqA7TMBXtmc3xo5dDpR3C8G5pZAWRd7D9AeNK4rorKGQ7Tti
	 ZOwkbAop1nsd/ls0wgGqBCeUllN3/zK38k/TQoFzcAoPFZAqaCeAbQFjxHztdIKnG89Xk
	 0oubnWOznjaOTaTeGEhTIswPsriZEYluX0iibmGUl6resS/wKFjTnsd9008/BuZHiog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jgUdZaGhqWrc4BAHJXZyBPZNLZ60f3XoK2Gog1q3Uc8=;
	b=v7ioQ1swHZpA7kYlwKcDTWW+qrwXFVZ30z7JbMRn8BkXOESO2zHg1nCz9uuyETIxnzAA
	 lYjVmNtW+ZisMUfJEHALkF5M3s2ejD98R4e5YmxsqAkVucQWDEQsuHa8sO1za7Qk//cjv
	 coKEchaZ6CqJgM4Rza5ix5HD28pqebxvpkgR2sv5EXRCrsyYlwohowGzmtfwQc21VmarR
	 gHrQo24W2O7++hJ2hohlbvWat2u2k1PlbaNglO5LiAWWTICLwKo7VlsNmA72jS7Sd0/V6
	 BZKNoauYP9VFxiP5ED3GhJz4ArO/7Ye2p7iTCs/03pItQeot70mevu6h2sDRYJO6OBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uMFW9bry;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC0F606A330
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DC0F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uMFW9bry
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-451a49abd8aso6118794fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795636249; x=1796241049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jgUdZaGhqWrc4BAHJXZyBPZNLZ60f3XoK2Gog1q3Uc8=;
        b=uMFW9brycKB5nr5NhMXia3EBfdsXBWscHF8PmbJTbyX2GN767i70+nu7hQTEusc/XM
         5fkL5Z2YEZlpympQ2AYFnX2pv5SM/1O5+OEBpWckYr2pJZ84417kaMszhhOLCwCHVHcT
         ub0HX3piWx/wrn2NzxoNC5CcqVxUaYpnA1aaJ2vvoBNTtqgUY0755yhO3+7/U+K3KfUE
         lRLrD3kjNbWW6QNOQwuTVia1r1HHRRyUrowwLAWHRwNIPokV46X1cW8JSaQkDYCYr9up
         DzVwRZh3o9p3DJYC4gj9NBwhQ8yddhav6J4/Kt2U749tjeFQ4z5dZSm5Gl/jnJx/G6lp
         LEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636249; x=1796241049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jgUdZaGhqWrc4BAHJXZyBPZNLZ60f3XoK2Gog1q3Uc8=;
        b=fbg0TGrh33/zGPDV3I+gFOyuAbTiU7hnyWnxtqdzj3U9uXre6MSaYPVlGs7KRTjqXE
         KvAV4/c36VgrTlGolyNUxgo7xUS0pCd71N5ZFySKRDF9vEDXvoeKs4mlBNATzdP2IXqV
         aRIZroatEonvSfki78H1aJIjmBxLWsB+kTG67FC42j4K6Ya5W5T5kb3duKqIzeG9WVdV
         H6eIazzIG51cPDYn0LywK45EpsMLLh3M4/jxj/U6AM2K/SzAAXDTkvRxmMRwIIG7hc3U
         92COYbsg3wS37vXCfaHHQtAI5+thAUittfKRYxjFmgTwEkgMJjofM3nCmh2b9MOQoeXY
         1C6g==
X-Gm-Message-State: APuU4Z/RJgysTBQ1lOhnOLgVMr9uHXy1RjtRanvkuqJFqo0X+GHJrM3X
	9/W3bdEAE1JhK9VV6HiAc1SoYCoVaYuiAZyxbunDyRWD4xxs8tf1oWU=
X-Gm-Gg: AZFdTZeCVwBYxibv7dWsU7HcEB1ykEeGd+Umm2BQl0V+pUFThxPEOWlDF3bSuYDKDIY
	7X0F8Pxj3L5jZKR+wuwy6SbR6wV1ryTT7eNfAv5lzOOmqMX5rNnJ2BfODo9a3BWPlT3qGxiGVIt
	jliHwxPsxZ51Ca29JovV8DnjHg8xBkxMKdDcESfBnrK/romLlKq6oUl8VsfEeg/phtHgoeZaTy8
	fgSwp6Yw0VJGEQE3om1eNtEwDf2lbls0dtsT9QdwrTSqWZJHK3Ooogn05cM0CZQ4AzDUF9Y7vz1
	bC/uJ434i3YCJjJitcr3f/W3GeigfZ12gzKws82Q/pUba9NqNQbDDdPQhkLa5mbvvyzXeNiChrR
	5f4a5uzIkA/4chcKuMmfpCUIW51roReNE213ZpHtT9QgdRQbOq6tqgEofdvF3vsmiBhXr5N1cPP
	aFQSyfyW4nt4iSywEueiIWrjVyL5A5FeuwuF+k3P8iXGA9TaAZU4EMZo3kHvrg4trtL022l5RY6
	hxbVBx8G2+5ZkXW6smzEXonyfXVWYizDHJBxJf3LvpeCekWDriF4TUZdtSNnIjxFQynqGyTsgNl
	uKkYsLwncKI9xlCRS3OWdLi0PzzDq05Fs730hpdNog7LbLTzk0K7zlXKFg==
X-Received: by 2002:a05:6808:159f:b0:4ab:230c:5faa with SMTP id 5614622812f47-57a089185cfmr21732323b6e.18.1795636249032;
        Wed, 25 Nov 2026 11:50:49 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm13783728b6e.9.2026.11.25.11.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:50:47 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v8 01/12] media: tw9900: Disable regulator on runtime resume failure
Date: Wed, 25 Nov 2026 13:49:40 -0600
Message-ID: <20261125194951.19072-2-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125194951.19072-1-matthew.laux@gmail.com>
References: <20261125194951.19072-1-matthew.laux@gmail.com>
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

If writing the initialization registers fails, put the chip back in reset
and disable the regulator before returning the error. Fixes this warning:

WARNING: drivers/regulator/core.c:2657 at regulator_put+0x61/0x70
RIP: 0010:regulator_put+0x61/0x70
Call Trace:
 <TASK>
 release_nodes+0x46/0xd0
 devres_release_group+0x11f/0x150
 i2c_device_remove+0x41/0xb0
 device_release_driver_internal+0x19c/0x200
 bus_remove_device+0xca/0x140
 device_del+0x160/0x3e0
 device_unregister+0x17/0x70
 v4l2_device_unregister+0x9c/0xd0 [videodev]
 usb3hdcap_release+0x26/0x40 [usb3hdcap]
 v4l2_device_put+0x37/0x60 [videodev]
 release_card_device+0x51/0x90 [snd]
 device_release+0x37/0x90
 kobject_put+0x8e/0x210
 snd_card_file_remove+0x174/0x190 [snd]
 snd_ctl_release+0x14d/0x160 [snd]
 __fput+0xe6/0x2a0
 __x64_sys_close+0x3d/0x80
 do_syscall_64+0x120/0x1610
 ? do_syscall_64+0x15e/0x1610
 ? irqentry_exit+0x7b/0x590
 entry_SYSCALL_64_after_hwframe+0x76/0x7e

Fixes: 918b14a26b12 ("media: i2c: Introduce a driver for the Techwell TW9900 decoder")
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 drivers/media/i2c/tw9900.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index 60c102aba750..e07924faa84b 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -624,13 +624,20 @@ static int tw9900_runtime_resume(struct device *dev)
 
 	ret = tw9900_write_array(tw9900->client, tw9900_init_regs,
 				 ARRAY_SIZE(tw9900_init_regs));
+	if (ret) {
+		if (tw9900->reset_gpio)
+			gpiod_set_value_cansleep(tw9900->reset_gpio, 1);
+		regulator_disable(tw9900->regulator);
+		mutex_unlock(&tw9900->mutex);
+		return ret;
+	}
 
 	mutex_unlock(&tw9900->mutex);
 
 	/* This sleep is needed for the Horizontal Sync PLL to lock. */
 	msleep(300);
 
-	return ret;
+	return 0;
 }
 
 static int tw9900_runtime_suspend(struct device *dev)
-- 
2.47.3

