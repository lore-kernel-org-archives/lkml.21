Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794966245;
	b=CWZoRGeOaXNL3ykRGZLvFfrdEYTT+VkYMsW2l2za4OQ6p2dmymwEvhKzfi3TIN4nQ/mR
	 F+3uLtEfJ+BR1WLz8X1UAxk66mTQkIWL4lljRW50AJJqg8v2wL3dLD9QH2YTNGsyFVnCx
	 cO0po4/gOUn4rZUklQuGD2rgLA6kWVlS8wd8iiZstO/v0vRs1Qh7HHod+XBFHyfYMDzfB
	 58X4RhMu2BNRaebzWIuyENNDQz6+Qt3jSinagcZ3Qlm9G4EdNoFe4qkk0IMnrieG3ecQR
	 wsLyOMRBo5JKMED4bHYSyPl86rvBEDPS+VIXGEklwlgrXh1cuKYs02/6+DR3mnO1/rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=o/13JpO1zRcDBDzrsXvuDTR7qD9FgMs5FIdfOlUy8Cc=;
	b=wIIC0lwAJ8Utn8//7oc1T9zHk+kPoaHIuKvqKHCiKxPzHnnQ0u6Q8PvkgVTologoGP2f
	 uwJbpEhFDqOuXpOcK/jHq9WrMOFCZUnKfQ3N0SAMkCdBLJnyv9z9d4W7a497Gwghe/oOZ
	 yBm/2ndj8LypMInJ7iyCKe87WCJZyNpZ5VpzpCQBWO7sP8MSU/pEnZei90mOM0mPn0V0p
	 mP8SaG0B/5Cdkil/wcaOXU1xmYevsW+MD3ImIy/wvSrOwx2did8FsXjJh/4kiOXcMzgIg
	 NUpteN2+v3qWqmwW87fKf8l2t9aLXGmW0/D8+VFArYvabVs8OBe/V8U7y3ZNTLoam0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="alf8aK/r";
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9743606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9743606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=alf8aK/r
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3704d30b84fso777318eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794966244; x=1795571044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o/13JpO1zRcDBDzrsXvuDTR7qD9FgMs5FIdfOlUy8Cc=;
        b=alf8aK/rxHDQNWioVmrt/Rn1wYM+M6JmvKnC2JiSIwkIAFwc6q6rjMmYmh8DhT2aRP
         +yjY7rIJa3A+TTuKYYUbxkixz9o1DuZNaN7qa1WlTCqKTD4mVAac9KtUpi6MnEGDK3CY
         5GKbPxa6uZGTqycS/oZeFRmwvgIi+cMgmBQMELiVQVjDqeslLxDi08x6ODySU1SpaVKQ
         6q4K31zgMzWP2BD9LNbYQsQW8xEmsDWcpBSnhDQbFFnr1E38SVLO9rGIHJsseuFJveQ7
         mAU/GACD62fx1lS2dlt6rGHFT/OSkkLNmBQk4jJ0zYtp/ZMIbkgj4s4FWKKsIwCNPGQB
         L1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794966244; x=1795571044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o/13JpO1zRcDBDzrsXvuDTR7qD9FgMs5FIdfOlUy8Cc=;
        b=uUbDvoOSqv2PzhofjRcPfAsBVAa0ArUhJEPHygtrsueGNit2Ruoq/FeQHyuUIvgTNE
         YfIeTuNDYlfs0hzkC+jeYvutFlcGIijkHETNQap3mbBoYQ/RXlgH5VtAv/e8lPLOKtAM
         yxhj7o4YEoojeOO8yGLrmqzmubEnTouOjv/IkzimqffT3KoFtpQAVsOiszREWFYWBo3h
         2+sRwkT6fsDeRIfawlvU4+hJDzaT29KtrORE7kR1C4Cnq1lfRH6dgwQW8EzdB+GUbZxr
         nSc2OxXHQglK/3ZI+TbgvwWuO623zbnn/7qaBG+d9JNHiBJ27AOGsUNd19l/t5QL1qAQ
         Eehw==
X-Forwarded-Encrypted: i=1; AL+hErHlHfGMAuGyWoi/iQFCPWtAJ4Jz4f48Ego72Mo6ChgQlPWQFXbqPu0J2jH94IfoZVrGYdrbh0I3GZ2bG28=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xLVnv7hjUkkeErXw+dismTwpBAxPNJTF8kYhLuYTquNIHISag
	XCiBpx3khw4vvIYV2vCnosO0ka9I8xDf2+IGRpYhElFTzrROkg5ny9Jzyh5H+X37cKg=
X-Gm-Gg: AZFdTZew1Jnp1h1vuF3oDK/jW4EUE+TbNS1FiWemfXeYoFrsivrRTiV/VBk8vKVPMIQ
	3idXoWqT4oc7Ux6ptQ55QioyB9L5ZowyVj7G1jVPMdthakx9zToHpXKXQBW4+3sbNVJ7NBMx0ta
	mOszXouD5eJgam0sr3YCHNKViHGoY2gD/7tO4panmKTMjRkyAfCpSBpLzqzhCY7XvABDTiaQJv8
	1jZgIZSlDaalMOneYnsCpTiGYl5scoYCw7FiVSh0587rXkuKEUKyYVuTq+j0TgcpxMAD0VAoZEJ
	QC1Gowen8yV1jl3FNEgPByCNP14ewz2V79awESqIiCUZUqH9QlKPfnuQK0+OkuQh1+MGUH7rhIg
	STT0epsl3yXNvCQV4ibRQUh4tNc/x+usvHUVs/sxMdqx8CGiZgMIkZOGKCERwed+0marhDF9+h2
	kGU50K0TeWy2kClwE7MiVxP7CBONRSqLKDph6shw8En40K8vRHgGtA/DctPH9/eS27dD/qJNnjF
	zwz4AfQKsckdUMJD1v8EcthHnDcu6WxnfmjTFdtwrAgOmNN1Kd6bkFkwxSiBTWl1z/hMOcvIWOb
	20BmQi5JFJYui3TD4HR6OAlkactSrnpTugSq8+bEnmAxJBIx/AGxY1uILl0=
X-Received: by 2002:a05:7301:1807:b0:376:77e6:a66 with SMTP id 5a478bee46e88-38280a3d9e6mr1195349eec.16.1794966243774;
        Tue, 17 Nov 2026 17:44:03 -0800 (PST)
Received: from cachyos ([2804:214:64:aaf:eb0:6704:6a19:ed25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a79c96b2sm2157822eec.24.2026.11.17.17.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 17:44:03 -0800 (PST)
From: Paulo Ravazzano <paulo.ravazzano@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Biren Pandya <birenpandya@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulo Ravazzano <paulo.ravazzano@gmail.com>
Subject: [PATCH v2 1/2] media: i2c: msp3400-driver: Guard media_entity_cleanup() calls
Date: Tue, 17 Nov 2026 22:42:34 -0300
Message-ID: <20261118014235.419385-1-paulo.ravazzano@gmail.com>
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
breaking the code when CONFIG_MEDIA_CONTROLLER was disable.

Guard the calls with #if define(CONFIG_MEDIA_CONTROLLER)

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

