Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795002627;
	b=Imz1YCz75dEClrAbp9f9oOps/Fw44K5mPSIfCPEp36wXFb+3lvFF9wbW0Xxip4+svPZH
	 PggPzHrK13BoUBD0jMQXS8XBogXu0d1sJBGSC1eHthMAVvWmo1Zd7PqK3ZSmmH++8x75b
	 O4MvJkZ9zdksTCRgPG0HziEXUFEVrVXK0yRVVVFqgiQI5FLRFvIaAeC76isHdBTukTDvw
	 VvDhjpG/dduKGSVFIIhxj9ljir1sCTSzMsDgnl+Y6ohd9Hxjc70JllC68TnsQNZoZqdqh
	 hkvPs4E/zXPeGvhK67hMyAf60MNJPaL5H+p5QwI8pBcDTBu2Hr3ESaeWWi8xWg0XI8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EsAdx5aDn98LgByU2/p+atQ18ynToOtTBq3shGClEFQ=;
	b=I/cqiXxtw+2hdHkLa0xkf/l+fuNQPziGWnasLnPR730q3IexY8I6GpE6S+oyELMqMoPp
	 doMs17eneimXdU+bkISsp/yf0fLxCPdAvE6KU5DSD0mRZzWi4x9lOj69ekB45Tayx5241
	 pF+zJ6X/cSk2+L0X28b3lvrjC4jy0pVxmUHl3ukhY+ZBD6YpjTR7rBIvHv1JdGwDQAm0c
	 Z7RuCYSbd3v3SRNFShlXe2IDV/45Rz51B4dbgBM1r4f37L2LVq9Pgg5B+J6nmZKjsUjsH
	 sXt4CvaEo2Q22XtYmLK2FOOyheMYi87Rf7BE5njqPZorRtgCAugDX2eno15ImgzJVzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JD9Ei9Ud;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428AB606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 428AB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JD9Ei9Ud
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b3b4944a0eso703140c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795002626; x=1795607426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EsAdx5aDn98LgByU2/p+atQ18ynToOtTBq3shGClEFQ=;
        b=JD9Ei9UdRMfbLrIEqtw4xgrxBA57b6gCkhj010hGJpHfHnvb2Eg9aY7oCuDPc5R4gE
         zCO9/fZQg2WT3mcZ4la1U+DLmLj7mB4Wz/LVrt1E4o0xpyXWuz54VgEHw9i+mxQHiiwq
         S41q2PZuiX1xeZguiMqXQ773KLF/qA5OV1PoHxjmpeR3aBPKp1zIlNl8x4N2RZsXECFa
         AfS37sleZO9dau4O3GrojuslGyuM26xQEY8uYxWPG7RIzilBrblbpINIb+LnjB5dT5EM
         7mz9eHm6UCXUR0t07Qa4BS3UZ731P/BQGc7gzgorHHAV/ED1H1T4aEh4QKeS59ZWhxXR
         xocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795002626; x=1795607426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EsAdx5aDn98LgByU2/p+atQ18ynToOtTBq3shGClEFQ=;
        b=HmAkElxuaw29XzxYkdoUCTPVLzSyXHFsz0fSEAoCh3CZ3yeiszJxfxOe9D+8gwxJZ4
         OQc9btkMGccHHSGeEXyYjGD1Juusfe4J1qQF6sS6Vb82SMg6yhDTCDrash3tqw5XVszS
         /FlnV5JrZfDoiJL1Lr6jlafhZKws5QJ5sf7rLgGtCztIuhGb5W4NBHtIpm2cAx8Xfc9c
         04q/yTLo/GLfexrWK27zY8M0poQbnpy8eWFwWle8ZOJlxt8F47BUd8mVlP3iCV7JVV3l
         7whOMMAgfI0O4K7nmYkLE4cIrIuds4Gjx/2FTJUqdejGzljnsJtGjTV0Y2OOkLTX2ksk
         lSLw==
X-Forwarded-Encrypted: i=1; AL+hErE0/uX8Lt1luoVYL9EkblAyIwnErUrzLBjC1N4lIwnm4etz+ixkVOo7uKcebKozI9DCP5wyyFl4uLDiP2s=@vger.kernel.org
X-Gm-Message-State: APuU4Z92cC8gbk5SPy/tXI9BsNOlFBraRmYeIapDXmvbV46I5Juq1iHX
	tjAoFTgkGjKeBz4qdTiQdU40x7DBsVjPZcmZmyVH1nh4FClnhB41HTH8
X-Gm-Gg: AYBFou2BC1ZWDsU2P6ribXJ6UF7SgSnonPtTKjzHFaor3JK6MGUsUvl0yOzYo+PpbI+
	SBRe1Q5b6Gi7B99haJB42x55OhWq3ToosTK9DKOINj3UNWLXOxc3ALlTOLd3L2FXdNduOxdmHiq
	9E23mlI/2abI57VfHTTzDgjTYx6rZNszngJ9zrxEliJyyJE1jl+FomJ9v3C4GmTJbCNbWSKoINc
	0Q8RmgSaWRLow3N0AtxpFaclZ1bkQQhwkepAZDmIo7WIf69mdC9+uRpdOKpAN6gruwa5SD+W3Gx
	Pz/2uZPHSbccWWy1MpD61QTCUcZuAYoRflvwIRxGtq7FxFnM5djbxFeSzZqdeXvNr19iM0i2eix
	zBJnXB5sD5/FvDXVKrytLUrKmirrk/f9L7Cu8ssAIq1dq66n3KYX7L5bm+wgl+p1b8cM9CWtrks
	9UjcfSz3CFJ3R7TS3Zt6vv9mjv0ur7jX3zcZ5b3q+2o7L6oVKyV0AgR//mXRSfSvUt/FJpRx6s5
	jB6P6Lw9Ow+jLUZEtF+VpJCp8DHmGbnS53ccmB/h/bBP4RLdW3IUNULM49B9sEtdtDs/WF06m0v
	16PiYDrJkD2YwzSvMpSdwgUUtzp7Hb+kk2wHrb1NE2QoV2BwHRVLZcXcqo4=
X-Received: by 2002:a05:7022:e801:b0:1b5:514:6a23 with SMTP id a92af1059eb24-1b543bb56fdmr2602689c88.13.1795002626396;
        Wed, 18 Nov 2026 03:50:26 -0800 (PST)
Received: from cachyos ([2804:214:64:aaf:eb0:6704:6a19:ed25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447811efsm6120431c88.3.2026.11.18.03.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:50:25 -0800 (PST)
From: Paulo Ravazzano <paulo.ravazzano@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Biren Pandya <birenpandya@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulo Ravazzano <paulo.ravazzano@gmail.com>
Subject: [PATCH v3 2/2] media: i2c: saa7115: Guard media_entity_cleanup() calls
Date: Wed, 18 Nov 2026 08:48:35 -0300
Message-ID: <20261118114835.42431-2-paulo.ravazzano@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118114835.42431-1-paulo.ravazzano@gmail.com>
References: <20261118114835.42431-1-paulo.ravazzano@gmail.com>
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

The entity member of struct v4l2_subdev is only defined when
CONFIG_MEDIA_CONTROLLER is enabled, so the unconditional
media_entity_cleanup(&sd->entity) calls added by commit 6787d5189e32
("media: i2c: saa7115: Add missing media_entity_cleanup()") break the
build when CONFIG_MEDIA_CONTROLLER is disabled.

Guard both calls with #if defined(CONFIG_MEDIA_CONTROLLER).

An AI agent was used to find the bug. The correction was done manually.

Fixes: 6787d5189e32 ("media: i2c: saa7115: Add missing media_entity_cleanup()")
Signed-off-by: Paulo Ravazzano <paulo.ravazzano@gmail.com>
---
 drivers/media/i2c/saa7115.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/saa7115.c b/drivers/media/i2c/saa7115.c
index f4015f113..32c526df1 100644
--- a/drivers/media/i2c/saa7115.c
+++ b/drivers/media/i2c/saa7115.c
@@ -1868,7 +1868,9 @@ static int saa711x_probe(struct i2c_client *client)
 		int err = hdl->error;
 
 		v4l2_ctrl_handler_free(hdl);
+#if defined(CONFIG_MEDIA_CONTROLLER)
 		media_entity_cleanup(&sd->entity);
+#endif
 		return err;
 	}
 	v4l2_ctrl_auto_cluster(2, &state->agc, 0, true);
@@ -1927,7 +1929,9 @@ static void saa711x_remove(struct i2c_client *client)
 
 	v4l2_device_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
+#if defined(CONFIG_MEDIA_CONTROLLER)
 	media_entity_cleanup(&sd->entity);
+#endif
 }
 
 static const struct i2c_device_id saa711x_id[] = {
-- 
2.56.1

