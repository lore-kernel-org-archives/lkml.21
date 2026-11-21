Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267976;
	b=SFyiTzLsF9mGHnDW7wyD+6CpafQoJQrGFSLrN6fgue/rsc/nkxOKUFi43YkUKoxQoHwG
	 3F2jk1wLrfvHivIbK+t1XFQXvRYffl3r68UTZF5bdH755f1BZ5Sa58uRojNP4Fph4CfBk
	 cpANJB8jXXFday6F2RbtMV0CiDd+bpAixxul0O+z1xyI3bEbKUNWxmlMGZrpd4bF6XGQV
	 eHPaSvIQwXCoCJnwpRAInTCDVu8w+nnTxwBpCmNviH6gRpC2uF0SdnqelxqwH0PvbKViE
	 ny8KYT4PaN8yHs/j/DdPV+53K1CuXYHHVK1hSdZwQTPGR8KhAJEU0tVSHDxhAIBz3Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hj7yNn3putJz4DcthZJ/vjPhR/zNcYHIbbwffyr61oc=;
	b=kv0ydtxu6vSqWKLx5Tyzw2TPDH11GBNG7HkN3LiBXpd8B0XhxjXWZ4sqf2xdNpTLbH2h
	 dO5HZRU/eBb7yufIBB2+JzkNG8hpWKb40D+pXKN7fBYRpnsDL6iU3RTVYKEexOZoZspAF
	 fWtAG2TbxHRyqlkvAbD6CFRpU6E+/AMBrOnw82X+JboEyNCqfn8cLaZVn8BG/Ql818eji
	 7gXUwo2z/kQ1ytBDCWs+PyqpHAb+k2XzCj1OTsTs3hkzoHbd6fyLQ1YfnfLOl/mA2cd/a
	 uhVgyEMYoKTM8ilX21WskQJZzGQVbcGxw2kTce/hhrt5eXm0iKdgimgE51jOYCTBmZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=epp9LbF3;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C64606A6A7
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61C64606A6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=epp9LbF3
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so984612f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 05:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267975; x=1795872775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hj7yNn3putJz4DcthZJ/vjPhR/zNcYHIbbwffyr61oc=;
        b=epp9LbF3MGxPn/LkJ1X8nf7p3j7pUc0fmmllGahYu01SqwRSXrjKl9gq8hCP1fUlwZ
         NqDYv6ImgisD5PS6cxJSvCeVXcdwWAOq7k9G9M6ZBrxynhvxSTmCbkVV0Fs9VXrySSTu
         mFMLhhPqYlP888Jj0vGEMchrph1qDhZbMm5XoqbnyXuuN2/zsb09wSm3XkwsCDpjmgRH
         CblPpEF0wlC8l2oPA90YdjMuHYJs2VPE6TtL4T93AId9MCHP8NooTfJpuseZDZt+/9P9
         Spe++gV/NH9M4SUu5T5MjoorqhkXafmVLP6BPJ/g2FZUnmzNR2KD3iRhgR8uukQOp0j8
         fwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267975; x=1795872775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hj7yNn3putJz4DcthZJ/vjPhR/zNcYHIbbwffyr61oc=;
        b=hlh9IwsB1rWiK8KzxZ4YRA0dS+NA3NAgSWQr6O+yujTw35GszJUqk/lhzRuGpFGXd9
         qEMS6wOeLrlbV/HxT9+F0i+mcbTDylzotlTv3CgEd1OHJ+B5pCo11sgfS8QWuGa8sOtx
         dczjZymTlKwUT4unUJ4gcsWqd9GT5bku2mD4IU16/fFLP1XGUatB1SSf/QCEo1eJGM82
         7gvc4/oFXYcmcBC4nHz8I5EQCJU3u/7e9hzezbhwzPK3/U/phFSl60i81wYDFBFeWhhp
         oiLd+yGCAd0UBdv9IQoczkZIyfZMUgBSCpYC+CtneD9tzH405eOzdQGSrtlZ4i8yDW3F
         Vv4Q==
X-Forwarded-Encrypted: i=1; AL+hErGQwGdiD9neQlw0flg/VyFHqSfRbPMK59FIoMr+gxrSgpxju1GSpccqS5XmJcaoFX+O0WRNb0h7FpRGF2Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VQqR7+arUqp9QLsvkyJ2RzpuspUBTXZHFu3/ORmQQEuHZpHmp
	mfXTTYHwCvnDaSz248aaROGQqF83IdEG5ezVB4JzuwNEX1BuHiQAfD/K
X-Gm-Gg: AZFdTZejlHuVsV3n4mDT9Pd/YwGSJEcKD4qClgsWouZWfX0h5Am5bvzUyd3eKiZjjAG
	6bgLv75EATl1OkDE5zUsVbTtgrvyq7KXVpVhfhAi1yfYdn5HHKB1Oti9BABwd0g4Y9IYEMEYg65
	/i/cIqUHSKX11P3cW/1eurwYX5dsEX+JvSp61BsR/0IU1RWFVMIwPpP1x4N7bKDUXObyHW4E8Hp
	L5/eAsvpEzRVuAtqTGKLx1TQVKldwP298TVgXADktOP1Tt/fMzCny5mQoOmsRsH/FSdc0DdXQax
	BSUt4/c0qD4AdzpzlUUrCLhDy/U8jYln10qG10LIC6EpU3JXKxCNb9XqN4VQWAcu6U2y3iblwPN
	6++3wUiVcL+aKkPzSjZm67j/oNFg+5Un97K6pxKko+1mOHOMLq1/wfvHscVSYpBS7ROrO0VettM
	OlOlRdNZBeKXLzyaWgb3IZFcKn20d1/l2mZSmjRtdAXJJtNAohFgbVfQFjLVnpMrrHlJGr6vJ75
	WeMJbRVdztmpeIMIU1nOoKxWLMXlIJzxm1LeTSmuXTdnMZ4UClDAqGk7E2MfhveflsHRxVZTI8D
	Bb70OvwHcbETlVNPK2htTUIHdYHub+5Xfw+aon7cYpzzKCQVFaL6Dm7GYge+Ee180bJQeWG2BKM
	zV0zdZGd8yMxt
X-Received: by 2002:a05:600c:5303:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4bb88785d24mr132851145e9.0.1795267974678;
        Sat, 21 Nov 2026 05:32:54 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:32:54 -0800 (PST)
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
Subject: [PATCH v11 04/14] media: ov2740: Add OVTI2740 ACPI ID
Date: Sat, 21 Nov 2026 14:31:34 +0100
Message-ID: <1c093a6c4acfa46ea1c4b159ea0d5eb2f3085f14.1795267528.git.mauriziocasciano7@gmail.com>
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

Firmware may enumerate OV2740 image sensors using the OVTI2740 ACPI ID.
Add it to the existing ACPI match table.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/media/i2c/ov2740.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index b7c0f2890..7d786d09f 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1463,6 +1463,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 
 static const struct acpi_device_id ov2740_acpi_ids[] = {
 	{ .id = "INT3474" },
+	{ .id = "OVTI2740" },
 	{ }
 };
 
-- 
2.53.0


