Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034598;
	b=h09edsTijgy797nDaTiUnkevfS+jGQRI+2feYAIutIc7KhJzSxIGdzXprZziS3iVKI2Z
	 4bmavLWGya+faqeIDWnCVTRgOeKKb+KEl0I5bmEsyeU22j2nGq53dYMwCyfJisTZ89atS
	 vawVY5Zr57uBxkC10bL7at6RgTo+6Fl3RrG3OcW2E5YU7kuxVb1ugPSWE4N2ULkIVuBrM
	 PYxpxBIlQcJXAQbOGgxTeDMHxtUticrp5WkICW6ZOSDm4iliWDEUams+tMi9iBkx2HWIM
	 GSyMcb60qU+y2TY6MiO6I6gVaNpnlZbiIhekkp7d4NxvazGT5ymSaSJ0gBuGcCc/AkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jgUdZaGhqWrc4BAHJXZyBPZNLZ60f3XoK2Gog1q3Uc8=;
	b=xjMWJksZ5DQiOPf9u/iNEuXznW/tBBbqD1R4jzY9QqrRe4XXkmOPT8sMlbkgG9irj+u2
	 i/xgluW8lzsao57BS2YA6CvGR6lllY31zRr/f5qMFrix7yQU8fY/14QVoE6rfDF12Ex3Q
	 tLvL5QKKVc1K6dHDpNVrkHzzX/tnN4E4/lZylg35/QWe1PsGEO6AD9fId8y1dZV8rv1Rc
	 CVQfmWmffQRHMb8B7tubqeITXWNxze7pOuyKzGs3z6rXmpIb9k7YBgKSNNbVL1g0kLGZj
	 lWU4O0/28wSJ6ysbYK4ZirX3vuVIU2AZMXQBWCXawH5pFSb/Y+7JDTE4LIsjiDmtKIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R3SNVihf;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D68E60A260B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D68E60A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R3SNVihf
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-862df509ccbso755163a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795034597; x=1795639397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jgUdZaGhqWrc4BAHJXZyBPZNLZ60f3XoK2Gog1q3Uc8=;
        b=R3SNVihfxosdya4BpNs48QSKvWwACcPI1QdYA+imYnGUkihLkyxhhvCimw6O8EBdu1
         RoRoNJt/ABTB/P7ibw4pyzPgoDQDBm7XRWecTx+IourMSVseLrnGSb4EhqpcAyygpCZz
         36xXh5LnHR8+RG/oLtd5N8yn0cO2l7O7cLkB+ZcEOkVaCb8C9kshmEBF37jxlAdNkNi/
         YQLJ+zgIuErYhpooX0LNqysFF8WdF9t1VWeY4IS+tGwipY5SjVFvRx/nLoAqdeNLZzeY
         80tGuSI+UJCBVwEzkUXzacTfOGhPbI6JAZ731dYMr+4bp/jDEzThTWssR9Dqrn2uMzHg
         5zlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034597; x=1795639397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jgUdZaGhqWrc4BAHJXZyBPZNLZ60f3XoK2Gog1q3Uc8=;
        b=gLaAMbPM7Hyf/9b+L/Xei5Eu6Rq4N8qzh+TwtgipqDmgDlKTN1K6PxyOtWeN2oQ7IJ
         IobNZot16TTSjp/R81Xxcx+lLG6VB07VdSZSIX81W5TTRpyHMZUpe7MrkDs+u0U95BtC
         IWBOC51voJs+I+YtRE8ay0aj0G45vpyUoafWNHo9AI2Ipl8e+0X1AeVv8bGiJOYzJ88K
         whycLgiz3vBxLd5aCR5eTc2c0P1nfrgeictB6y74TarsMhMj9SeX/y0vQuUdg+quk0Oy
         M6gbHhl1nc3QkWxevs8cQQRZ5Yoi4/5S4gJAspJ5pBcg5Vas6T7hHUdL8zLSk/aiHOVo
         IJ2Q==
X-Gm-Message-State: APuU4Z/7FVyEcwBo7hSUv9k1LIetD5bzz+cmI4nlCe1Fdpl22HqVYEKn
	wFG3mEmSMOoRsqdJhwenLD+uSjwNOHqf5leq4t0XYeYy7xiHwBWE4UY=
X-Gm-Gg: AYBFou2p+xEzGzzcePXyxCPCzPfX1rDl9IjlrrEdLLRM6C8L+Z+0HCtKB+QC4DhMw0e
	Ho8rmnoNMb/gi0NyZcG4YthxsXTun6YudB5apDCv74hx3zLvvSO6N8biEYgxaijlkKanVA2zTQ9
	95xOwK8F9fwwJXC/ExYah+SU12lsOxsEw2yWlPYP12wulqdl7Qq1OpFAwR9O12F06lmvGdZphF1
	yVQizPIzLe++OpkMhhNouQdeLX1eWHZpY4spkSlLm64+yuIUtxUVWD7mNFKquSmWzdslBO4c1Us
	cK4gNjrpL/nOhQFSnLpn2eAHl02IBt7dYh3Glk/81hPTCUn7T4kobNt8u+Ypq1ieRtXMn2X2kme
	YlLCacHYogTsT2Qk1E03CFYM/Vza8QkyenDNNfNPupjBginjYQQsin1swDQLWM/DcPha+p2qeK+
	2Vxh2YpAXYP7jHv6P70NBZ9T6+KPSha8krLj2vraZGFNZ9TXT4Yzkk8czhssc5Qrr+rOQBCi1Vp
	kN3h6OrYff+I6cMbzjETf4hRK0EeKGaFZxHT0hMLTnj8T4ZQLGwNjJ+Rz0wg9JaUR7ZMtzNVJWW
	OWw2m0/xKbohw9DcM5gySTUSVknrdCPprqdl3IKn/8lsH7LKkIvQ1GAVns8yj/rYpwMplytUTjY
	yGQ==
X-Received: by 2002:a05:6830:3115:b0:81b:a5f9:3490 with SMTP id 46e09a7af769-862f0945a28mr5074276a34.24.1795034597066;
        Wed, 18 Nov 2026 12:43:17 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f01381f5sm2764792a34.3.2026.11.18.12.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:43:16 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v6 1/8] media: tw9900: Disable regulator on runtime resume failure
Date: Wed, 18 Nov 2026 14:42:58 -0600
Message-ID: <20261118204305.28268-2-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118204305.28268-1-matthew.laux@gmail.com>
References: <20261118204305.28268-1-matthew.laux@gmail.com>
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

