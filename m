Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267989;
	b=Yo8DYETJx/WJ3JlBiCk2FePbSt2wS8s/TEf3CrVdmtrD4nWhOnka5B5O7O74sRRA13dH
	 ZWL+lub1M5T3LU7aprlWOe8z2rtdmvaEKibd9Cgc7phLwIts35G0Ew6/EC41RsF5sTF3+
	 iUSrtBdU7PifeOiV4siRcVIAvoyZD2h35JBf4vgFbJfg5pQTh2Hucmc9LT78poKqQFwie
	 gKn1SCeZY6qD7Bi3O9v8i9pV30GYcFWoRNhhn/rds1YEBR52vm5z22sSKXCMirqkusWxI
	 z9Bm4uC8VziWtTGUIqzuxJZbfc8cvVXxlw8dF84fRuDJeWOMFRBFixdlyz4OJofqJQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6QT4nVTPYrmhTuKzdl9GjNrcRlKRJg4+DT5qc8f1gZg=;
	b=v+vhN5Mr3PIPaxL+sphdPIEps5ehAJIvU4lZG/XGJNw+AP7i3Yi85FqRBfP6Ovi2WDZa
	 vN7CFozPkQUa7qh+D1NAIEcB5Vu8CKOMWWlzPtlMBAIRyH/GR7DQyCufqkld5NonhYuDG
	 ZD30jvsGmMqFEcQpk7Zub+ZL8P6vHo9NBuTaE7iPIzSeouV1bd5WZJ1Hom5AWjD+lJNYy
	 OBwQf49Bej3npp5vtFBGIZvVlVl5Rwy6t5uhcBtqqKWTPooAnM+txCkV4jw0iQEFhtbRO
	 3OcvLXVjVu5hBHIPgCxFEBc/ZNWV0gWFE7YfZRjnzk+rqL+NVZouk2axdiGf/I7Jkrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uvQT0Hrp;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BF2606A68A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73BF2606A68A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uvQT0Hrp
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso13714035e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 05:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267988; x=1795872788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6QT4nVTPYrmhTuKzdl9GjNrcRlKRJg4+DT5qc8f1gZg=;
        b=uvQT0HrpNvg0oFX11MXTfQzbCq3GM92FeVDrQjGxAjfUbDo6M76+KdnxeDJ3mw1DeH
         sxMbl1Z3tcL8YnwxqSilmQkiA7zzLLYeAcH/nfizp3ZszRarkDeTWrOC7m6LKgcYzWWL
         a8Yi5v9XQEl6s8m9Eqt8cGpTc3Ut/7/RlWwkNEC9m1K6rETTcsA9Dq6R6fueExdVxNXZ
         b9kUMVpLNDOcDb4e74uBg7HpZdSru+Yexi2C69Li5wihq1c9pPrG7+jO/QajMNgtRIBD
         t7/FJD+qAy5lMpjWjcFuADeX2G9Q9eyukXunDgTVZpCKijCCQBnn4fwst91Rx3Bc1VZ4
         eCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267988; x=1795872788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6QT4nVTPYrmhTuKzdl9GjNrcRlKRJg4+DT5qc8f1gZg=;
        b=DWJi9xbs/2Q6vtzn4DYigRmDPfBN6yLrGxh5bfyxgXDyPetxUkfC4dMjHVSge2XiNI
         G8XCFXA6q0ZHQ+AtHYeqMaZHCI/TVLSXIUySZZtJVQFXGQrNmbLeL3OlQNHhIunYhRZn
         xenWJ7bD1ecOj5sTd8ZLcaWSbvlyEknrwDFaijtkmaDcqlSTDMpvNk2PzVgeGyipbiOY
         vJ7r29d26ea5sZLDGMV9i6FG4xy51x6CL89GejS1vaVV4O9Oc22GjlRxw0pwETp6ONjT
         lBBEwhgUg3CRydel5QK8vsc/YV/aDJIOGHZJCVag5/vmTdbjAojdItUQvjfUL9wGvdkl
         RbxQ==
X-Forwarded-Encrypted: i=1; AL+hErGWVsb6rl4JgOGXi/HmSSgWfiOdPc10jJ4SrZRjONwv8ZnbzWEfYWV/N55/yoZPeqrgYKy6W+sb/jjEluY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uJ8Egn91iA/RNupN6Y+qkJH5JBg/1qQLzzlnA+dH32zFZxbd6
	aPtE3EBYcSkh/4087MSX+TPNPHaf1cvATBgWAUaP47NjiRhZWprUKSuM
X-Gm-Gg: AZFdTZfilIDLNr5Z9CfTY35i3TLCRSqiqKur7qTn6MA8Z3bElebNlyVjuOQtrmJLUHD
	QnQNt4P2/jria3haM+8Icj6soaP9yXC5cX1NgPR18thI5IwQ4ogpPKVIhwS8K1oFsFq4wrW84mZ
	TojMnYxeW8Sd0hUVNdKbczxJ5iS84GlU+5iVOm0OjIZ2gGT7NZtdxCamNcv7N4qWUmzxXS7xDj1
	D9vgOWFGt19CAjARiMSwxUYI0F+HKDxuyZP1IdI9dCLAbD5vNp7UU8n0muplZFO3cTwH/cxqp+L
	517lMY6p+pPqFQ5/dxp4zSNELWROp2WQzmNlVgr6COGPEKhMOJRL9WaLBdipPQIiesIxffW3oW+
	Nr3ERqDfBMP11t21qmlYgiYR5rI3a2JWU/l0CjOOv1yEA/63ZLWTFiVwxAxEaiXyiyjQC020XVy
	jFDdV5yUOtHTRgXy0+ZRCcbt16MBg62/3XK4gJnfJMVog8BZbwdjlGbmgFNKUenZhO44PgyHgBf
	rMPKZA4Pb9koE3AI0amLj4ZWNWiNjyYSKVl+jEHHObDBCA/zTSy1gyDrFTd4CP5f1t3b4Wbzv/k
	7iUCJEvEGeDyrDpR+wEVQajEHTcVSjbxXNjo74OLme2wkJxya6SD7xyGY8volzp5NjT7VB+q75U
	MELydI+Ibh9WG
X-Received: by 2002:a05:600c:c8c:b0:4b7:6942:39bd with SMTP id 5b1f17b1804b1-4bb88820e06mr135977545e9.26.1795267987817;
        Sat, 21 Nov 2026 05:33:07 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:33:07 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v11 10/14] media: ov2740: release group hold after gain write errors
Date: Sat, 21 Nov 2026 14:31:40 +0100
Message-ID: <34bb686e09f150cc17df7b5484142fa76cd2ffa0.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795267528.git.mauriziocasciano7@gmail.com>
References: <cover.1795267528.git.mauriziocasciano7@gmail.com>
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

Digital-gain updates start a register group before writing the red, green
and blue gains. The current error paths return immediately when one of
those writes fails, leaving the group open and never issuing its end and
launch commands. Later control updates can then be accumulated in an
unfinished group instead of taking effect.

Once group hold has started, always attempt both commands needed to end
and launch the group. Preserve the first gain-write error; report an end
or launch error only when all gain writes succeeded.

Fixes: 84363509c725 ("media: ov2740: use group write for digital gain")
Cc: stable@vger.kernel.org
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov2740.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 30eb58eed..b9a951e92 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -696,7 +696,7 @@ static int ov2740_identify_module(struct ov2740 *ov2740)
 
 static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 {
-	int ret;
+	int end_ret, launch_ret, ret;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
 			       OV2740_GROUP_HOLD_START);
@@ -705,24 +705,21 @@ static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, d_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_G_GAIN, 2, d_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, d_gain);
-	if (ret)
-		return ret;
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
-			       OV2740_GROUP_HOLD_END);
-	if (ret)
-		return ret;
+release_group:
+	end_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+				   OV2740_GROUP_HOLD_END);
+	launch_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+				      OV2740_GROUP_HOLD_LAUNCH);
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
-			       OV2740_GROUP_HOLD_LAUNCH);
-	return ret;
+	return ret ?: end_ret ?: launch_ret;
 }
 
 static int ov2740_test_pattern(struct ov2740 *ov2740, u32 pattern)
-- 
2.53.0


