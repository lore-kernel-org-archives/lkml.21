Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795763919;
	b=b/VTfFNVhRIw2Jex4L10XiSSttsQ6rS3pqyQziVy62n0rn/A+s1aOZf1I0RuGuKBt4Df
	 BFKEdHOmEWPHcmrxRK+uKiAVVYMYr1EGfRBaZ+OZRLiHEDcP5DV4jEtjdcf0kA8dI4N+2
	 ezJdjVkApYeHuB7dGH5uhC72BvriEDmv5tVMtYK57QNiNUfeU8fesdmLiqiLG9uVVlXCu
	 ofMm6u9XIlaP0kpjh1thPhwe3pJP8MBGNQ81G4L5k0+HQyE1MVGV5JRVmgVYNe9e6k38B
	 qbaAaFMzOI4qj/PWGGJOPtL9nTZfTigG1wyd0vQl95+tgF3B11HaqO7A3e8BMhvsYXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795763919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4aq30QWobXQ2txyzbMoYSdHGyuTaadPcHWj998/7oSY=;
	b=Fqsg+/QjN6Hxo1wvf57tpjZM+B+Q2XnLX3fGWuYS48mDVqRKgwA7QbE1rXHw2fabLTJf
	 IVgrF0Hw1wk0SjCJeczUcTa9MJUebol/UFQXcXA6Dows3KLi0HjCS4fqNF7wIGWvEfTnu
	 v1bBMoy9jkXaw731ky2IsCIs1dwQcWUxHC1x2E1O4O45gFOzb2+oy7MJewRhsJXMTpH03
	 3+uAiG1PNnAYeqmlFrWz21b3n9kq92YXXPlX4L7l8ik4eClHyCzZCbWrZTai5NAqoJGKm
	 g+o8V2MlgmJbOVmXnJr+j0jrDq0ijUcYq0xxXKCwfbJ5QiqBr2DZMUEY+uaF7VsLCyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yAcmMtP0;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A93606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:18:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14A93606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yAcmMtP0
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b589050416so1756808c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 23:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795763918; x=1796368718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4aq30QWobXQ2txyzbMoYSdHGyuTaadPcHWj998/7oSY=;
        b=yAcmMtP0mYoV3BZXmu4pqDeTMQvjtRv6Dddg/HkjvBB7KwR03pflT+rvM8zoWPSleP
         7UhWIKkEbYDj94B8mnvL1rl6+lmiEt46+dWAX4eyofPUvPGm8xOTZY9PlnUIyLAQRh+V
         v8I/8AaJnY0ZPxrxF3nP5XEkaulBn+ctkSku8jX5Tls8hzi9UTVP+ofjSWUhx0ZzbeMm
         8aS/wEtdX5GEbm3O5aFspkSwdbpncM7hT+5KG1Y7mj/R9ydHbFL7v948Rtpi63ReUvkG
         AlABBQGtM40+XQ78Tl2VVOirHRGXIvscnujJqaCPjN+VcIcYaizfaIUxgo4pOqEn57ea
         i5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795763918; x=1796368718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4aq30QWobXQ2txyzbMoYSdHGyuTaadPcHWj998/7oSY=;
        b=zixBoDY5TPkJD+gkPlejXlyqyQ0x+8b9ZWZ/OpY2feJONO4Ls0PBU8orgVt6KqAOxQ
         wXcCCMOaO/dTzKHNC+sgLhA4Sbg03vC3h1VS0k5oIPyoBIEw673NrkVafvaL5oHFuKxX
         /rpmymrgFPuDNx1k+GwQVZv/e+Y7GsFDARuhAzL6WO+0tjY81Un5YZWSx98jALT3a2N/
         KiBv2Yxm+5c/bWzH5pIYdwlVG7GUIbN2audUG+fzbiy+q8y/Q1c9WlnLABapmL3EZz+Q
         DWItWFGh2m5g+01yC2pKbAAV/7DUut/jrO0AXGYdfAU7JA4FPo70DoO9yQ5Zh5IY/BoG
         NGQw==
X-Forwarded-Encrypted: i=1; AL+hErH8q7Hxqxb9pTnQUFRUCXsCvuNrP3kdkn2jejj0KFJxIlDRyXFK0OgiRkwmOoKRWJ+CFW6kDktRWCVNFJw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2JIUn2D4bWi7N1FwGmiLgcJRSnVz7Cmf1rD9+jn0YcSBA5kcQ
	dXBIL9fG8//GKZ9h/HWFGtEFY/ZbFOQPcsKdtr7tzxv7HDitbfK1M72IyE8ohw==
X-Gm-Gg: AZFdTZdHaBx6wC93Lf6/7kscV6vXRarZ80P++0klbu7uchizVIarrsSvK1zbZZQ2Gdg
	OFGxb7EMF/cWI/j87lly/qZjyktMFRhsS/K/BnNdrTMBjNXUh1NHkB7mNRLlDw8jgoy6Kcdd1S6
	yiKr15CSu0L2Vglo2T5wFCHCbujJnLrTw06Lo5bg1iqFbiJTXt1UM9KtoCkTDsgyEnoUdt93ceK
	4yIhjQHhPLVaKP4RZgujtVHMx+YwJsT740CVMp7V1n37s8KzxRomqaFnaJ+JkhLN0/qSK6Cx/r7
	TRV0yFjD9+JH671XGj0uTvnxtPETXaXDiS2R2tyqknkTC8je7EJqaA0CxbRecqqbWrF1Bt9xokB
	fTjp3WohsGLnwC4fT6TWdq71EbhQK0mvMzam0fVsDJa0m119s6Ws6WwPylpTDL/D0hcBK6jetii
	gRm39wUpdJP9cbRsq+U5C0uoXQUybl4qm4U8qjUDw45hVED/Ns4rBZsz11nYqpCH1NbIU4GlYKH
	kbfUG5r2sq5/RVrdsfb1Z1MfMS6P0aJYfcLFdSPkymVSEdACOQFYaHMRhfegYz0GWex9ctYqxHh
	ZTaTeO4+XT2GzIn2rgG4rFYkajC56olPxsd/v26czmrai6A=
X-Received: by 2002:a05:7022:906:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1b556904c50mr30443195c88.29.1795763918073;
        Thu, 26 Nov 2026 23:18:38 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm53260893c88.15.2026.11.26.23.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:18:37 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>,
	Markus Elfring <Markus.Elfring@web.de>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] leds: sgm3140: Put the child node reference on success
Date: Fri, 27 Nov 2026 14:18:31 +0700
Message-Id: <20261127071831.136694-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
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

sgm3140_probe() gets the LED child node with device_get_next_child_node(),
which returns it with its reference count raised. The error path puts the
reference, but a successful probe returns before reaching that code, so the
reference is never dropped. The v4l2 flash sub-device takes its own
reference on the node, and the LED class device only stores the pointer,
so nothing else needs the probe's reference after probe returns.

Remove the early return so that success also goes through the common
exit that puts the reference. ret is 0 on that path. The goto before the
label then jumps to the next statement, so drop it.

Fixes: cef8ec8cbd21 ("leds: add sgm3140 driver")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
Changes in v3:
- Drop the label rename. v2 did not build on the leds tree, where
  another goto err exists.
- Drop the redundant goto before the label.

Changes in v2:
- Use the common exit for the success path instead of a second
  fwnode_handle_put(), as suggested by Markus Elfring.

v1: https://lore.kernel.org/r/20261125134013.2692510-1-congnt264@gmail.com
v2: https://lore.kernel.org/r/20261126122516.1198461-1-congnt264@gmail.com
---
 drivers/leds/flash/leds-sgm3140.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/leds/flash/leds-sgm3140.c b/drivers/leds/flash/leds-sgm3140.c
index 107d02c3137f..14568ac21289 100644
--- a/drivers/leds/flash/leds-sgm3140.c
+++ b/drivers/leds/flash/leds-sgm3140.c
@@ -268,12 +268,8 @@ static int sgm3140_probe(struct platform_device *pdev)
 					   child_node,
 					   fled_cdev, NULL,
 					   &v4l2_sd_cfg);
-	if (IS_ERR(priv->v4l2_flash)) {
+	if (IS_ERR(priv->v4l2_flash))
 		ret = PTR_ERR(priv->v4l2_flash);
-		goto err;
-	}
-
-	return ret;
 
 err:
 	fwnode_handle_put(child_node);
-- 
2.25.1

