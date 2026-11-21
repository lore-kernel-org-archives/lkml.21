Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795233361;
	b=VzTjb0vkmAtRR3IK3pRuZpY/CgSWj2i7W5vl88r98UxdxL30PMl92pITx0nsE9fBMIP0
	 NRlKtly/ur5NS4dIrF03MItDVVKqiF38N7DlFv+5xd8Pf7B/lTTGoAZOmN9Gy3wfE1f95
	 Y4hx9cJIn5xG8GkZWxFrlenL3IKMm4bFaTJAgYooa41IdMxZCP99jPZQbkidYl5XEmKs5
	 nyRaPQIJt0UQZvjUotQaCU9qMfVoLzpIexpef2FdNWErt5bEUO76UBPges2FZAc3YqTTd
	 TMsnGDvmlFdkOTX09vxI7Pkv1DpCaXLwSdTwajo3kc/icbnf519MWCe/9X8twMJWGyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795233361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DZHDPLNDBuON6r4+3mJFqDI1dwdMb/BwgwaZhh7obns=;
	b=1zOqcOTcyNvTZqZCiTLiLUvIZRTR4pkulxGNGS1gj2rU5PtR/CUMwLL/UITzE11hDZgl
	 n9fytXL16xaveFxXgDDZgWIJa0QZ0/hgzB8U/5CjWDaH7J1GPGK+sXYWND43XmLTMB+RH
	 I1AUsm9J67K/RDP9xeRtO27LTJCAJB4be+rpRhihglvEVZ8TraxLeee6iLLOZgdNPLv1W
	 WJDKFNv5QBgyiZUXtnmsY82auc3//3FUBXBLVSN/4FVgGAafi8hzVRuJSFmqLSu43DGiP
	 7JcK6LG31qRRz8OpVTac2qDi9od3yThD1xepfyq1VqMDoJKVeBiBC8VKN759lXWpO4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Yqy8/pmK";
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FE460A261C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:55:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05FE460A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yqy8/pmK
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-703be215729so721358eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795233359; x=1795838159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DZHDPLNDBuON6r4+3mJFqDI1dwdMb/BwgwaZhh7obns=;
        b=Yqy8/pmK3Yqg507iSkvIyj2wvOgteWl4RxMpQrvEGH2B9FH5W+qUFsvQpPudb7RRvw
         a1+0qMj9lVYOyOJdSBbeTJCMiZh+hPsyxDvgU8jw9hMMWbpmkdSFe/lBc7qjKiygx/gm
         5VicsIhWNhgFE7jaMwb5kwnkYbNh6q0jcXCtZyKm5pP7aT/JOS99yWpZzECz2oWDXUYV
         8Q/aZiGcuodTOtxvsbEIc64F0T8daL0xq8dQMq7xcKvHbnxq0tNAh+Y9u+YnV+nuTPqC
         ePsSUhzyxMxoAD5r07r1XB6pmhwaDl998mToLE+Sbh10woiI2cJOq7wenID/tLVwi67t
         PO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795233359; x=1795838159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DZHDPLNDBuON6r4+3mJFqDI1dwdMb/BwgwaZhh7obns=;
        b=ossOTFuxjnR/ICnBlM1dTZhWCkFcQe0eMM2rXwg+we/mYh88CoDU9bMGCY7aEreZCE
         p1e8TnbOY4V72DO7CCeqmDnScEB+RLKxhQYrx1o8DwYChNMkZ0c3rL8Zf96V978gRqeV
         MbuWdc3kmKvP1u/iKkZc2UyXPL6E/7ygv2t7EcZ/aX7rc/ahI0sCAyuzyQl0Fx3e2NAA
         PA7rIuY/hKREFMPdqh5poxamEV0RCUeOfCkvQM57/nJKm9NaSaBbQgOuCMQ2JApcbhpj
         q+qOGb1e3aLYqraPmEXPsulxejfGKRBrDD/otDXOX7BcHUrbe5ITYBt6X90oWLoJJEua
         R/gg==
X-Gm-Message-State: APuU4Z+gPcKGk/d6LTIDDqP4hj41cIqJwRPKUmaiTWGKEb7ruTis4Cii
	H2brs/Fq/3i5WhH95ddnzOH8SEwcGZ6ftKX+xosYIklPLCbLxStfkTY=
X-Gm-Gg: AYBFou3ioHdFUEKT9VBrUOZI2Xha4+/SiWIqYMb1CUQYz0bBn11h++M1fQgkomv3hbF
	eamYshG+/DuYQ+5kW65lQw75Zpa0kRdsqwesuuodandRHfE8L884cK//RzXZ7GfNO3IqwFF12WD
	2gVQKmY6E3OeJa/d3C7oDPYzUT90ZXto4Ty3hs2aKDcQZma0AUjfaOD2IkrwzrAgzis+Mh00tj4
	LZ1uzqhPvsx9R+OoOUXkberz8I4o6IAMUyv0RP7eGaLMvbT6t8Qmffa6uxsi8PuGJTw+xaGo1i1
	Rusn2UzTqzZVFVZyzBwp4lZUlhhfAM1GkT2iuQvyTqmRE8fDHYXKQRbnUiKqDcyRFvrWJ1xDIw9
	RWUmZUKC+Lnop4p+pVN1XO6ZDOoR7zrp3AeeS66mWTyXh88poA+sFOdQYJWTQ6rc7JC6GhYZINJ
	q84SNDh32YhgJAraBV4/LZnak3pbFH4S2JVqlaz+VoQPJxUXCs5jHIF8ZiIR6WwRFHuuupaIIRQ
	g8idKzvcD/yMPk7+X7tNOC6Plcyf2nfxcRc6hjfqmLTNdyLXbQLmFu+wUR1Yfuw87PJz7VMvTqF
	Oa80FeFvG32ZxBqclLtXNOFGKp1oWTrd96j43kb9ac4Yt9A91/Gfucros4m4T1kzictfx9sjKkF
	xEA==
X-Received: by 2002:a05:6820:a508:10b0:71b:16dd:fc2a with SMTP id 006d021491bc7-71b394d862emr3174040eaf.50.1795233358915;
        Fri, 20 Nov 2026 19:55:58 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm2878076eaf.10.2026.11.20.19.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:55:57 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v7 08/12] media: tw9900: use runtime PM autosuspend
Date: Fri, 20 Nov 2026 21:55:19 -0600
Message-ID: <20261121035523.26764-9-matthew.laux@gmail.com>
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

Each runtime resume enables the supply, toggles reset, rewrites the
init table and waits 300 ms for the horizontal sync PLL to lock. Without
autosuspend, a typical chain of s_routing, polling g_input_status,
querystd, and s_stream would suspend and repower the device each
operation, which adds ~350 ms per call and discards the signal lock.

Use autosuspend with a 1sec delay so that closely spaced operations
share a single power-up.

Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 drivers/media/i2c/tw9900.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index b2b754e898c2..b2c30e84acb8 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -68,6 +68,7 @@
 #define TW9900_STD_AUTO				7
 
 #define TW9900_VIDEO_POLL_TRIES			20
+#define TW9900_AUTOSUSPEND_DELAY_MS		1000
 
 struct regval {
 	u8 addr;
@@ -346,7 +347,7 @@ static int tw9900_s_stream(struct v4l2_subdev *sd, int on)
 
 		mutex_unlock(&tw9900->mutex);
 
-		pm_runtime_put(&client->dev);
+		pm_runtime_put_autosuspend(&client->dev);
 
 		return ret;
 	}
@@ -355,7 +356,7 @@ static int tw9900_s_stream(struct v4l2_subdev *sd, int on)
 
 err_unlock:
 	mutex_unlock(&tw9900->mutex);
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -532,7 +533,7 @@ static int tw9900_querystd(struct v4l2_subdev *sd, v4l2_std_id *std)
 
 out_unlock:
 	mutex_unlock(&tw9900->mutex);
-	pm_runtime_put(&tw9900->client->dev);
+	pm_runtime_put_autosuspend(&tw9900->client->dev);
 
 	return ret;
 }
@@ -568,7 +569,7 @@ static int tw9900_g_input_status(struct v4l2_subdev *sd, u32 *status)
 	ret = tw9900_read_reg(tw9900->client, TW9900_REG_CHIP_STATUS);
 	mutex_unlock(&tw9900->mutex);
 
-	pm_runtime_put(&tw9900->client->dev);
+	pm_runtime_put_autosuspend(&tw9900->client->dev);
 
 	if (ret < 0)
 		return ret;
@@ -623,7 +624,7 @@ static int tw9900_check_id(struct tw9900 *tw9900,
 	ret = tw9900_read_reg(client, TW9900_REG_CHIP_ID);
 	mutex_unlock(&tw9900->mutex);
 
-	pm_runtime_put(&tw9900->client->dev);
+	pm_runtime_put_autosuspend(&tw9900->client->dev);
 
 	if (ret < 0)
 		return ret;
@@ -712,6 +713,7 @@ static int tw9900_runtime_suspend(struct device *dev)
 
 static void tw9900_pm_cleanup(struct device *dev)
 {
+	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 	if (!pm_runtime_status_suspended(dev))
 		tw9900_runtime_suspend(dev);
@@ -782,6 +784,8 @@ static int tw9900_probe(struct i2c_client *client)
 		goto err_free_handler;
 
 	pm_runtime_set_suspended(dev);
+	pm_runtime_set_autosuspend_delay(dev, TW9900_AUTOSUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(dev);
 	pm_runtime_enable(dev);
 
 	ret = tw9900_check_id(tw9900, client);
-- 
2.47.3

