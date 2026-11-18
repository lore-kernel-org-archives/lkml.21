Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794962806;
	b=XAf87iiYKNDaig5PDAyXo6O/NCbf4WQWpAEfn24wlXnyUOPfuvVXathabqSjhIEut7T/
	 5WqPB8Hqr38CBAI6YPp8pxk/khJyUtpPjvMHnPIhQ1U3GFXfKlkYgqgCihJ7YFoymiyf6
	 Pvy0Ms/lKWqd1yfadrDsWEmByzmMLpoOLGpgpyVnm8JxFY7qvktMvETfGPmpM18RlVJa2
	 yCcQL6WXSzSX0AqDJO8mnqJufE5Upa3xPDVSc4r/vAesTW4yTXnLNkCH1+8ZwfmZBv07J
	 JsXlPBNAGeB4syVAGThqxWVZsNw5C0c7xyeEKDgaF+fXoWjlsoK76LpsJ1ignkCWC4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794962806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Jigjp+fj5LXEgFrf+eIYUR/gBYQiXZlMSZoHeYqq3yY=;
	b=cpzpjP3Y9JCdXL+eMsoBuqsXfvTUAS/FzwUUzEbFCzThoFh25a0yaBjxZ3Jg5+Sbo6pC
	 caa5RikBd3Q6ToV8vptArSs4Jiv5l0Inpj7Yl/6sfcOM31eQ2YSezi+GYg+k5xOA1scFj
	 VnvQQOtSv8mlr2T3o+M7A1SesmdpLdINMtQOebNiETz+JKJvzWbTdJ58ZFzlBXo2x/Yfx
	 fpPErdLa/W2H6jjHoSERbd96fKb+JM0RjNcSOP7i6Xgx8pEx44+VXPZEzZo3qF0LwtMgO
	 XYv+7JgjkzMaJeF0gNddc8RW6jApV3I6sFNNksXMYt0poHKuq/8pk9OM/RFXPzkULaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GXiPy7lh;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78238606A330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78238606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GXiPy7lh
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3acec6677so698552c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794962805; x=1795567605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jigjp+fj5LXEgFrf+eIYUR/gBYQiXZlMSZoHeYqq3yY=;
        b=GXiPy7lhSczITyephtO2ckKsgEYqh7hIYmMg9mfHVRdDTBfc1RIzY1XIJYVdMs4WgW
         eqXCWPkgqDZ22ejtTzLDFggpQRKx9uFFDWXaV6SOuBjCycxeJv/lPVAdYcC8LXFr6sxj
         1U8hVd+7wUlWpiE5PfwozQLKHV3kN+rcpUssvnx8ACwGL8wU6zHtTfI80G/s2UYgPi6R
         hGHVWIL51xBKckWrWYBJoxPM72lZq7AJqhB1qCQy3QGhb4it5+uU/fEAn/O6YvIV5lpP
         EbrgoTJ359cJQCooAJl5SteUkxMQyyxJBK7bB4sBAE6dU2RckwtM6nJHZoKbZh83v+Kw
         YHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794962805; x=1795567605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jigjp+fj5LXEgFrf+eIYUR/gBYQiXZlMSZoHeYqq3yY=;
        b=y220pqfUwO6yuXGm1PTcHmuNSX08pkbmyvh+FapNqZlYkleeqHBYaWrlBrtzvvhJP6
         UmM4o3FUpRwsK6mFq4CCfsGTfgJmmgeIYyWve9wGv4eb4LvdYb9jaC67A9rVepxOs6gi
         I2XYB+8ctXvBPhJvCtzJuc+C/KTPy+Zfaf3C44DeHkuYQjrnvdoZAgJirR/L2ucrRYEt
         LlgwLsKdVmxY03NvrBRik9EcGNgFd6qaPYc8HHar0jtW4UmwEIyqXRxtGunOUey7OIPP
         7Tc6Hwih0ldcRxwxlrX58erkElr6yiWAoeft0JguDd9FXQeIO39uEKkGgayPxIScmNuW
         jqQw==
X-Forwarded-Encrypted: i=1; AL+hErFDpIwoMFAYv/no9fI57PhAVsyfEIF6yL5IidquFSIsOzL5Ic3iP9AaYKqaKrvhS/X7oyuNBciOp2jObYw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tws8ZvHBgdV/oTrE+0/TBtLPzoTJLDaOAkk1EKYk+75hfV9xm
	RQiqNywlABL7M8TgpAksCr33iGQsnV5/8jOJ07RxI9LIbbR11Hccgn0dx93XyJpttis=
X-Gm-Gg: AYBFou1IhuPvHcsofF7JASPtDD1znmU/CjWq+nW80/rPfJ36n4Su8UCrkd/qBgRs1uu
	LEHaUi0JXEhkkBKSzoOYCtcqXbvja5CXmRYadCc+7giCy1wP3OJDYJSHqDH9K5oj4FhjQjaRHJ0
	9vKvy9A5J1D1NiYhm8QTXKYV13hutyNkls/vs8wHNG5SksBsgfN0/osshQIXZticWSNLfkRcqbI
	vdzE6jRyJ//hiIoBg0NfGBiRyY6u2K31QYR+AOjvmmzKhuZbODTuAYxa2eSXt7AgNukWirt8P7X
	L5bWUGo+M1g6YVm0vkvuqGXu+D7xkbhgZKlIbcvircdg9/DW4LM5R7eMjdPtnAKF390mOSilrPM
	l336ZgMa0gRG4vIlw9+TgFiGUBpyjU+taZUjo7mCnp+x1C2VfQ3C/fWL9kQnWmBNwYHWrypzIjW
	l3MXV4xsCYqEsPlROX8VgZoUqIwf1TleGfTI11p+c1XK7gy6RLJafh0P2MR9ptfZhkG/xG9MCfO
	pYjL16IL+jSzcB/M1xUBUMc0AFwCEULvbe8wT704XEZshQ7tbUIQIgpc8t2PLdB93Gtm0WtVIM7
	LOMbNkk4uA55DE9khp2BI5MlQ1mffrAwb4NmjPInSxMZDQy1V0wVmlb/AaE=
X-Received: by 2002:a05:7023:a8b:b0:1b5:3e3c:142d with SMTP id a92af1059eb24-1b543d4f82dmr1069798c88.42.1794962805520;
        Tue, 17 Nov 2026 16:46:45 -0800 (PST)
Received: from cachyos ([2804:214:64:aaf:eb0:6704:6a19:ed25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447811efsm1765194c88.3.2026.11.17.16.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:46:45 -0800 (PST)
From: Paulo Ravazzano <paulo.ravazzano@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Biren Pandya <birenpandya@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulo Ravazzano <paulo.ravazzano@gmail.com>
Subject: [PATCH 2/2] media: i2c: saa7115: Guard media_entity_cleanup() calls
Date: Tue, 17 Nov 2026 21:46:00 -0300
Message-ID: <20261118004600.369915-2-paulo.ravazzano@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118004600.369915-1-paulo.ravazzano@gmail.com>
References: <20261118003742.363133-1-paulo.ravazzano@gmail.com>
 <20261118004600.369915-1-paulo.ravazzano@gmail.com>
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
break the build when CONFIG_MEDIA_CONTROLLER is disabled.

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

