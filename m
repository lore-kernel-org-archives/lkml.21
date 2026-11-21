Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795293990;
	b=q2yIr16L27yV3NuO/rsCVjCb/y0ZtlLfSTATm6aVXh98sOspDaN4sjiY7QsKcaW8HE0J
	 vDq3ygZjRdEulZGRZj2wLKw7KfEDDf2w6qzERhaei4pxTXiYDEqMHcCl9N7Dya15oCfKe
	 ixbyse+Cj0tNMA1yZT1zf+03iYYbJakrTu7Z28lDemZsRrwWNJCcUZQtBsoPSWL0FuB85
	 yM6J3JZsJZ+90xZIZysgJAjmTkOFo3a4lP+orBvB5k15YVUBzmA8grdrwqPuzxWCf1+Hh
	 8nSe/z+POnVVaSpp5g3zxLtXC+NGE2mvh1Sl3xFvHvZlxhBhdysDEMbvX21O3XiUKtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795293990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3dROjGZCNE551sXOSnZVVsDb5S4//gNDdIiMvX1YD/E=;
	b=aHUNCgYVPWSrrEHyLlhdAhxy338UDO17JtvLmVk7N2evFVG157q2h81nZkV+v+tiadhv
	 lcs1jM6/eN5iEfCAVWDXTL4Nl1EGknS1jUV2ggKoh3EMBhG9izz/h1cY6E6nRnoG5wcDk
	 kGuNdo17116y1YkiZ84aWLxV5lh4R2eTkYQ9V3TmQcKLPHG2fxPkTh5pLd6Tdauj+NeU1
	 EZbdZUWcz1HnlL2T4NCcPxrYFf+HyhTpqdbw5MpZutMIiCqwFKMv8SYH9VG4ns4JH6GFU
	 YBfhl7fKXU4idkm/nqKerr6zqbcZs5Wkdaxj+cFD4Y7EB0tiJOlGZ6UqPuJni814Ntg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cm3NRQ+h;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F308B606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 20:46:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F308B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cm3NRQ+h
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b600fae14dso645314b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 12:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795293989; x=1795898789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3dROjGZCNE551sXOSnZVVsDb5S4//gNDdIiMvX1YD/E=;
        b=Cm3NRQ+himgMCRSGF7x3bxAvLJEDq7eK3ClrL11yur+/cYppSjoErValcHG54qVL8q
         KeHUdt3EryIdsjU5vCq+shBOEHWjIByKj5RJn9Riq1/5gX+HSpeaLcl/Izx224bLV9Wu
         x0v6JbKInmHgTxiAwCBsCD7tG4zKR+ZphSvkGUYId3DrHCJ5N8HkP0ZCiDB9f19HsvfR
         krcSoGGZbhHKwgh2xSs+BwgfCC0OsCNMxN0gOjHJvppy/hnIHq2TnQw/wRw6pPEX0s1D
         r8cBbUzeCgNYuX0fqYV6Qkn0HlkfmU4UbtL+/nLKNmnURTYWCWcj/17sbxgV1bjO32oT
         LzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795293989; x=1795898789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3dROjGZCNE551sXOSnZVVsDb5S4//gNDdIiMvX1YD/E=;
        b=O1mgCPS6Lc3dc/d7smbanGphNoVHWefd0XNMe4gW1U+SqSNrjamIxXV3HcmruliQmV
         JdTNsbCY446cK0fZ8+ERKRB/IgzyL0VG1JEi0ungWnAK769XUPdeCrKpqKPuYTtQM/j1
         uXmmtCrnNCAvC0v4P14ESLHdRJDhSjAaXKYp82QbvN20igwClX5hxU7HKOrVPzmQccJ+
         2Rbs91fNXD+OwSQL5URpHaFYj3cerPBAsLAuCHUmbj8BWf/zhww5S0faxms1cCjthtH4
         Nln5fW+6GsEtxCCOQilZ7C2a49CyPdmxU+/E/f0H79wR7RYzAL40Aij0ow+SBslBVDBK
         zJvQ==
X-Forwarded-Encrypted: i=1; AL+hErFtGmUSxnHsChjFskfFlXiX3CIwYPDA5ivTBTZ/ezw0WBYJwIOLgcI1+VAGlXQ1JKBCZed/PJQha27eSU0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3clBN5RIWVpl8FyLSYR46P4cxYWv/oG7zd7Thjvzf+eyo1nn1
	rZ3xa4N9RE7XBVOErViQfszEEiagTf5GRoHaOu0chHNE2sIGSKnEejkU
X-Gm-Gg: AZFdTZdHFAjNWD2/r+cAwRuF177EH7ptLjkYoqHLe3iQAMktGKfniA2iAWkOVv2ZWNo
	S5icntSKBHFMLuePQX3Mna+igscZoMlUHIpIdWAkzmih1oMiep0TN6vgqtc4yCRVOewZ0g4zutr
	boP+n9r2IKvfxoqohsZF8bN8vYJhJUqEeMXXrq0a5mvJ+KM3HvQvWmwvn0r0A612PE/KA75KObM
	V/Aqzntt0Sak8CitEcMpM/s1Cbd7l+A5dga0UNJBq8IsuMWyAyTHxy9suLe4uxsudur0zNHjM7P
	rctPqS0wj/Nswf18nTqTBWWIZbVr0otqujBrLx9581ArZalpSnXaE18YhsoiK059rIhYVuF0yAh
	oYy7PV7HhGMY66E8t1k2XkH/7cqu6I4/VaiRleECVwnhTotvg+5Ig45koclKDi8S+qHtnc3+PkB
	gqyvwSYso1MjYozJtESBH0dCx/RkspM2Aw8p0FSagrzuth9qQ+bktJX/ms8UF7MgUWBzQ7tj0/s
	rUNlX8ltquenXsRtMN+diY1MnLc63mqgw+DqHVBHg299pXl/FqBEWCFPgsmAuv1uNBPs9wkh0Xv
	x9K3AJqzvDjPKKGNknbF8MgKlKQntUjk31mnPsMUA68tN76oPyim
X-Received: by 2002:a05:6a00:2ea5:b0:873:e3b4:5d4 with SMTP id d2e1a72fcca58-8c8793b8d04mr6434190b3a.2.1795293989190;
        Sat, 21 Nov 2026 12:46:29 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6213:28::4:379])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c263sm3091141b3a.11.2026.11.21.12.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 12:46:28 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	stable@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jongsung Kim <neidhard.kim@lge.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] watchdog: sp805: re-enable the clock in the restart handler
Date: Sun, 22 Nov 2026 04:45:25 +0800
Message-ID: <20261121204528.2435533-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

wdt_restart() fail to reboot the system if the watchdog counter clock
was previously disabled: If userspace cleanly stops the watchdog, the
core calls wdt_disable() which disables wdt->clk. No reset comes.

Re-enable the clock in it as in npcm_wdt. The watchdog .restart()
callback runs in atomic context: get the clock with
devm_clk_get_optional_prepared() at probe time and keep it prepared for
the lifetime of the driver, so the restart handler only needs
clk_enable(), which is safe in atomic context.

Link: https://lore.kernel.org/r/20260911031916.A8E051F000FF@smtp.kernel.org
Fixes: 6c5c0d48b686 ("watchdog: sp805: add restart handler")
Cc: stable@vger.kernel.org
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
v2:
 - include a Fixes tag
 - use clk_enable() in the restart handler
v1: https://lore.kernel.org/r/20261120201029.1685193-1-mmyangfl@gmail.com
 drivers/watchdog/sp805_wdt.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/sp805_wdt.c b/drivers/watchdog/sp805_wdt.c
index a14ff7ac0db4..4e4febc52853 100644
--- a/drivers/watchdog/sp805_wdt.c
+++ b/drivers/watchdog/sp805_wdt.c
@@ -138,6 +138,13 @@ wdt_restart(struct watchdog_device *wdd, unsigned long mode, void *cmd)
 {
 	struct sp805_wdt *wdt = watchdog_get_drvdata(wdd);
 
+	/*
+	 * For reset, we start the WDT clock and leave it running.
+	 * The clock was prepared at probe time; only clk_enable() is
+	 * safe in this atomic (restart notifier) context.
+	 */
+	clk_enable(wdt->clk);
+
 	writel_relaxed(UNLOCK, wdt->base + WDTLOCK);
 	writel_relaxed(0, wdt->base + WDTCONTROL);
 	writel_relaxed(0, wdt->base + WDTLOAD);
@@ -156,7 +163,7 @@ static int wdt_config(struct watchdog_device *wdd, bool ping)
 
 	if (!ping) {
 
-		ret = clk_prepare_enable(wdt->clk);
+		ret = clk_enable(wdt->clk);
 		if (ret) {
 			dev_err(&wdt->adev->dev, "clock enable fail");
 			return ret;
@@ -208,7 +215,7 @@ static int wdt_disable(struct watchdog_device *wdd)
 	readl_relaxed(wdt->base + WDTLOCK);
 	spin_unlock(&wdt->lock);
 
-	clk_disable_unprepare(wdt->clk);
+	clk_disable(wdt->clk);
 
 	return 0;
 }
@@ -253,7 +260,11 @@ sp805_wdt_probe(struct amba_device *adev, const struct amba_id *id)
 	 */
 	device_property_read_u64(&adev->dev, "clock-frequency", &rate);
 
-	wdt->clk = devm_clk_get_optional(&adev->dev, NULL);
+	/*
+	 * Keep the clock prepared for the lifetime of the driver:
+	 * wdt_restart() runs in atomic context and may only call clk_enable().
+	 */
+	wdt->clk = devm_clk_get_optional_prepared(&adev->dev, NULL);
 	if (IS_ERR(wdt->clk))
 		return dev_err_probe(&adev->dev, PTR_ERR(wdt->clk), "Clock not found\n");
 
-- 
2.53.0

