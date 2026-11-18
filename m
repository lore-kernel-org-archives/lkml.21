Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794962303;
	b=l3HB4S9z8SFaBAn7lppcICe85wwHSBLZUPdx/Z5W3hMavx4I+tpu2DB34BDaKOQjkzsO
	 Equu5m8mRcpl/jFvi3f4n9fSgl/teh2tl0XIMzVEnf2sD3lfYJ5fkbVmv2BbikR2b7m+n
	 KaO6Dv5Z7Tvbo2OnutjG0oI1rbRiMcrkcaYDgtMeOgDIfcROYzXvOIv9uaroa2Du8fHhg
	 iZFwHx7am/4imZ4KqZ0qIV1g690pAQvJEplx41Sf2f7S0amUUhZgGUXzmLjnTWBbc0+8J
	 8BTIHeOiL7K9EeNNmSyz/3W8lIyLY/EwPWjoX96wh2mzcOWJCVvxQROwyqKvlY3BSuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794962303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pllyLf+++bwuw+cTuPHNT6Ou6itzbDvqjnXe+1hShHA=;
	b=XLVuYYcEPhH/iycfL70onIewZwY/NUc8clX6yBpL+s/jvanWbrJqGfpGFV/QQQFxczRV
	 8bwaZiVVI3/G62qz45RJYSfcaRWMqDQ0nrE+5miaBIaiGZjEFl5GatTHO/sxFKd9Ikmx/
	 NiT9Wz+oTrNz8p9pwhZe5oJ/382UHSXiyjhv8g/ZvZ63q4QTgrTQfJFJH1csdTin8DvqN
	 nFE9/Qasv6vxDQ0uPEeLry1HNBhJJx8v1ViAi2OvYZSO/fdVPpaQsmW5u99JYdnGVnUXV
	 LIe9EinUmj7gFtrHn1f6GpMR/jb9AisMYg8+MsM8yYEXN0aWQbYAgxrF7ypxABEs+7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fi1swuCq;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE07606A88B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FE07606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fi1swuCq
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-381d542bc29so884288eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794962302; x=1795567102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pllyLf+++bwuw+cTuPHNT6Ou6itzbDvqjnXe+1hShHA=;
        b=fi1swuCqsqRD4h8XJOEWAoKYZKTUtgqn9z+mHLkaeVqgxyi9z8AN3eNXyPMIAY5iVB
         o5XraQNOjQpa1/LixhjJQD7oj0sEGtXeq8Q7Q9Eg8OnG7fsm8qG5lGZ/RVgTy5otSfmj
         WKvXkQG1LeoGBEXUuDLE500suNdXBzUey8l24lJS3Pl/PGTNeyTxQthpGrehsd5yqusH
         zyMsY7mH5U8OW0xDSw4q5AknyPiJy1zvmhURWnS6pszdA6xFCreiTsW6rJezEOq4BL4e
         bDznmDJfZ0TMTEKqPUCGdi7X6+8N/AUX6n+lS/Pzxxb87fcp9FEeWtANpd4Fh3T+j09Z
         ZqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794962302; x=1795567102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pllyLf+++bwuw+cTuPHNT6Ou6itzbDvqjnXe+1hShHA=;
        b=WEv8Y9didE7Dvhr/MiI4jb1C1i52EWc7mynU50W2/uIzTil9IZM9xHB8tVaa50UlKu
         NaRpC8+AQL/v8mF0Nq+fYIFbIa1F9WeaLF5qzehIJhkT8SX+6EUzCsS+rz1g1ogmi6tR
         b9LJjzs7tezJoNwb50Lx2aoh4vQRxIqcQg0Pt+1Vs4GGrfZVTvMikN0CnO1y+1vJUDtz
         tnypHIEnt4jXv/+lbwsPM56I415OQwpU0ksx6u4dM+yA5s+5KNpdFsqaYjKgDRVPBpXq
         kmumdQtnJUvqnveG1SJNICDk0O85McTi3RqGCNVuuC1sN+SzFEZXm/5sHU9iKNhzwVe+
         h8ug==
X-Forwarded-Encrypted: i=1; AL+hErFkBSmPPU4feeZPtIY2sUo4SwCwTSfaWaz28W7Yb85053Oock/FRGiNHtJdfyKmK6eAz0mYStTGjuV00JQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Jqq3sBySiwawKYcGwkW3iX5lHYDu7QR8fn+KYR3qO7F1/AlcX
	DRAomxx9WeAXV+MurWSZu2xQeusxqLYoMmszg/2VfkXwODDKHpe/I9VPGvO0vggS6mQ=
X-Gm-Gg: AZFdTZdayJmTh8iGVDYLGvM7ZM/ZwhaQ+f2/3g6RNP+gzMiGX9Bi2/L1Uqm/Oe4v7GK
	uVRRfLGaflLnc2KXBlI7Nl6Uk8Dg8UcGFyp1Q4hEnBWtwHYDBl4m3B5EfLX3RX8lSqKWXYbK265
	v0Mfj9hfIC98rww7Jyq0RI2bW8ao8t6SKD2OJyOwu60bsnaK1gtWkU1cPQHAIeiz1pkDpcrZOr2
	69bgPwPK+EboUbXl/teizNMiKCQTytWejcP7uub4L93iHiev+r+SRL8vAdrp+p0g3KwAqBD0doM
	VPPFumniv2gDGPGG7NsaZfnmrU6b5QYGl8JFh5wNQukDOTfQHAAe6N4m7vpr0ZO71hfJxigmnBF
	8VPIp+ARHbxBXMSl7jBVuEy2YwQrRKCbm7dc4B2lg0V6FxDyn8fRKeiMVAZz6NFe6kBLIneedZQ
	c53iiMjGsg5jLpX2YTmFyyXApYlG/diS+EWqBC4Q8YJyAKnqmwhM9sTSJmUkcOLKvwT+ORCsweF
	he2eV2u3B6JYMxO89gD6WFmk2q6XH1nSBUJVC6fwf2WQKYX3QK19cfgq+8w4MZGEUPapl/B5q43
	r/TraexbMo2XSFNsP/X2qSUYD9TZxee5EaSPM6CKYmoSOc/W99CZ2nUMn7bfIx3sWaEgR7+PjHx
	OOpYB
X-Received: by 2002:a05:7301:1a14:b0:382:5dd0:3bb2 with SMTP id 5a478bee46e88-3827fe7882bmr917793eec.9.1794962302027;
        Tue, 17 Nov 2026 16:38:22 -0800 (PST)
Received: from cachyos ([2804:214:64:aaf:eb0:6704:6a19:ed25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a75d8015sm1523892eec.21.2026.11.17.16.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:38:21 -0800 (PST)
From: Paulo Ravazzano <paulo.ravazzano@gmail.com>
To: paulo.ravazzano@gmail.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Biren Pandya <birenpandya@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] media: i2c: msp3400-driver: Guard media_entity_cleanup() calls
Date: Tue, 17 Nov 2026 21:37:41 -0300
Message-ID: <20261118003742.363133-1-paulo.ravazzano@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Member entity of struct v4l2_subdev is only defined through
 CONFIG_MEDIA_CONTROLLER, so the unconditional
media_entity_cleanup(&sd->entity) added by commit 87d1307b6791 was
breaking the code. A conditional preprocessor

An AI agent was used to find the bug. The correction was done manually.

Fixes: 87d1307b6791 ("media: i2c: msp3400-driver: Add missing media_entity_cleanup()")
Signed-off-by: Paulo Ravazzano <paulo.ravazzano@gmail.com>
---
 drivers/media/i2c/msp3400-driver.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/msp3400-driver.c b/drivers/media/i2c/msp3400-driver.c
index 8c2edd462..8f0b385fa 100644
--- a/drivers/media/i2c/msp3400-driver.c
+++ b/drivers/media/i2c/msp3400-driver.c
@@ -717,7 +717,9 @@ static int msp_probe(struct i2c_client *client)
 	if (state->rev1 == -1 || (state->rev1 == 0 && state->rev2 == 0)) {
 		dev_dbg_lvl(&client->dev, 1, msp_debug,
 				"not an msp3400 (cannot read chip version)\n");
+#if defined(CONFIG_MEDIA_CONTROLLER)
 		media_entity_cleanup(&sd->entity);
+#endif
 		return -ENODEV;
 	}
 
@@ -813,7 +815,9 @@ static int msp_probe(struct i2c_client *client)
 		int err = hdl->error;
 
 		v4l2_ctrl_handler_free(hdl);
+#if defined(CONFIG_MEDIA_CONTROLLER)
 		media_entity_cleanup(&sd->entity);
+#endif
 		return err;
 	}
 
@@ -867,7 +871,9 @@ static void msp_remove(struct i2c_client *client)
 	msp_reset(client);
 
 	v4l2_ctrl_handler_free(&state->hdl);
+#if defined(CONFIG_MEDIA_CONTROLLER)
 	media_entity_cleanup(&state->sd.entity);
+#endif
 }
 
 /* ----------------------------------------------------------------------- */
-- 
2.56.1

