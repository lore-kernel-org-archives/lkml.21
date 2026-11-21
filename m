Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795233345;
	b=q+G952kzHp3sOIdPSdN3RWJX73esiOuxuIsxw9N478xQSQjT1SqOWeXRHXCGmeHtXUwq
	 q2ip4Ip9+aJ/CZgBO5o9v7IeV852Lpu+07El/gmHoqJ2OWbHroTbRqtuwPbIGcHyhButX
	 lxesEBczGLLvr7zX++mU4Pu803UdRo7MoPinaFMdgGsLnpLs693K4U0vGylN6HHcrjiQy
	 X7K5MHLT6UwPsvdDF81DQ+++fH+32MzehHbkESZ3yPweiJAfCaxHmGW2Hn4wKOuAjjCUj
	 /RYqQ+BDzxEZ6BPEz7xJ5M8jicPA5qc/0XYcPVgQ1iwGaH3n0v68HUcn9DYLsRURB/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795233345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jgUdZaGhqWrc4BAHJXZyBPZNLZ60f3XoK2Gog1q3Uc8=;
	b=N4j+M0eK+I4boJvUeqik2zvMTgVgpFf1oq3won83smgJEW8p7LI/m7QpjrKov+J1Qe9V
	 mOBbIa8yeg+u40bvo26cTxloQoPJ6FjiMg9Z7HI55BACARGVi8MJnbt7+pYgTGnTpLDLd
	 LVtq6JSlwMI10godn5kZ8FP78Rm3ViG2hlHFcYT8czH5aIAyhgYqK3n0qolbEVHLRPPqk
	 9M8EEFPqgmkNnzya204wiDz1hNnoA9q69HXvOeH90+RosKpJAG0Yv9ymiJLNOGGVTugNd
	 8YbfzkB9IsZ83ptWYA5AWrzBUfH0zdgR4FfQ8R7qi8Qy6ViuklxsRMD0x70e75YIGaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SiEljIY9;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB6B606A331
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DB6B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SiEljIY9
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-86156cf8a7eso2045159a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795233342; x=1795838142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jgUdZaGhqWrc4BAHJXZyBPZNLZ60f3XoK2Gog1q3Uc8=;
        b=SiEljIY9Mcg9FXo0sQwif4upe3XondP+ab2bFC/HoIvVbdg/GqptcMkpEJl5hwBtm4
         sy0eskecI+6aqkXhijQf3zbOX2dxdX5NneFZQ43Z7k8bIzDm14FIXMrdn67DBBiw/c09
         MWCDN0mobbKp9TG7406qRLkJSMMoh2nc4ldmxXp8WA7pwy0Sg3B3UBUk4ZAnVtIhhYSi
         234qPgqzhM1Qw7sIUIKJgbZYc/J92mtifsVyZpb8aKTrdSVVQteKXH3lOzFDfvYgifUL
         uFXJoGKAF3j/GgJIbldi4jsTg6eGBdwW5EpNio+sXh31PRKETOfeQdK5mPmzEP6kf18G
         LnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795233342; x=1795838142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jgUdZaGhqWrc4BAHJXZyBPZNLZ60f3XoK2Gog1q3Uc8=;
        b=StASsVwQeYRl1EVdtaLdk81K5YoEYtgnx1bnOR1OLwpTGN4YGzCL71+XIY61wQ6Vj4
         PfeprehKKlHOA2kk3HBP/RVz9MrDf/NXIMGLp5TwCoTIuSCiIJdx3C/8RRyEjF9TTzFI
         BADFJ7clYIriTZh0hN4i/rMRnkyxcFbtNli9Q4FHj692NC0ZFan8lVqQcHniZ/USDGRT
         krxe5Z1xuPyPOM33pWrSlqGJBiOhz5bBM0RBD3+o157Yv0TCx/fd2S9fozafi1gUbbI/
         rcxAPj/kK00K+JFrXbi7fR2H2TjjXa35mX+HHe74w3glgyw+7kDdXf8gY3Mz8SrAasev
         m3bg==
X-Gm-Message-State: APuU4Z+7f8zJiDLF8KWI0V1OBm6Xk0mzXnIJlqUuDmR9MqEGKNf2gPvf
	sP+I/HXdqCXl2QDK4CLCdfjUaE/Z0LoerOkldqBpxfeO+USfasQLYTM=
X-Gm-Gg: AYBFou3aKxiQNX5Gskl5HbZ2TX9RnLT0RdY82tT1qmJ04Dtn+CZU/cVvNdYUnFulPW9
	wbu0Pi8tU8StVapfC5eTZ7olFcuxC0WmH5Aw4AX3YXCBEAQrtiGYzWRJ6kSh+F60EB7DtPzZLG8
	stFGN2i8G9iAoZ998o0DaK35ae+bzato1l5TPYAg6NDxr/pfgRtDtHCyagxhH3DL1iqg77t8sB3
	cr6YzqtL1pDXmY6SJG3dS1X8ezzBCFNo8xQgbtznugZoqRuHfm2aATLVolD3M66rVc8T3J2+eQ2
	1+ssUsTDZv6YN+p+plye0x0JB7yQ6zxXRG9NugveMyNKqwgfovi76CmXTrk0Qk+mvMlsfPRksja
	NROAJM5klGQnTx5sF9Dcn/7uZNuiIwZ361vTWaRfTjDn6lisKHh1a1QBxJL+J9qd4vQMDC5ecsz
	03tJEQr8Cb7C1vAeYQcw5fQH6gEPxneSbO/fhU3XZVvBJCytGAed7u49TYL2g44iPXUf9wmhVvu
	mGmCzI4Lv6yzvVAuUAkDktUEBUAf+xH7eTXBPRpSkpK1gGFb73ZAZ6qMDd+uyK4Z5riI/AQf23n
	mzMVV7fJsnxoP3Hmuyr89QPqXqphWOcqu0FJAFihfBEO4tNerUPxWJp/8Rq96b1xMEq1MoiVZ7E
	tHQ==
X-Received: by 2002:a05:6820:4381:b0:71a:fcbf:2484 with SMTP id 006d021491bc7-71b395d4870mr2846540eaf.36.1795233342085;
        Fri, 20 Nov 2026 19:55:42 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm2878076eaf.10.2026.11.20.19.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:55:40 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v7 01/12] media: tw9900: Disable regulator on runtime resume failure
Date: Fri, 20 Nov 2026 21:55:12 -0600
Message-ID: <20261121035523.26764-2-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121035523.26764-1-matthew.laux@gmail.com>
References: <20261121035523.26764-1-matthew.laux@gmail.com>
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

