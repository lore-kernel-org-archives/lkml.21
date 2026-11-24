Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510360;
	b=bi0NPRKp3e8e8Jd+ufddsWmTAOabBLdP2CqcYJ1oRCCNFHbMsHlCW7fLJusroEb/Scp0
	 bZFKuo5eZBITgQLQy1J1amf+ltP6Aqcn1Ctg4F224MAIAOF3fsEDz7PIkDdcuf1MS53fA
	 05btzOLWkV+9v2Q6yalMi+PiTVgewg+gSvFicq1gi+08mnC9UPlj3Znp4nSvq1PoTgeeq
	 9JwXIT2PEKjgF7ptJHTNNXEo/Cb1CkYFt1fg72uWKzbWv4VaZyXNsLw4AL6YsdQcMnadh
	 BJfYy1ofej9RBaN7EUVNFNRFDnMt6wUYeJr98AMa1fNtWNIfhx3R5Qnw9FVTUDKL9Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7uDWlUAJr4F4CNK4r9GLKQshi7c+5aaomjZZmJZJIvk=;
	b=sKgXnyZ+FX8fJDAcxfepcdksXPxKELmINIQahmI8/S7zxkKBvCdJwMbya1m1Mj90wVm/
	 3Mf+waokMMjYuGLeuIfgf80YY80/NKrlSwrw9IA8Tx+/4OnriHSE8KUJLQEv4ktrXZP/z
	 2wp5SJnIjKBTtSR1Aw+dgU9A5dPffoN7OSiKIjybI7EJIP/c1zuq7HV9kWlIQ0TRJgbvg
	 DRYYjnxN1hfgt1yK2L0BBoBHMU5WwTUAjyyhaj7jSDbQXf5+TD2PI3zYM5BIoHjFjFEkc
	 EGaWY+sqQ242Xa2prVp2mMFl7Izo+17MsZu0U+cRyc1h7S2ZuRVxE0G5/PLEl+V/eXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X3DmwPyQ;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA2A606A682
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DA2A606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X3DmwPyQ
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-385d8a00598so6073309eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795510359; x=1796115159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7uDWlUAJr4F4CNK4r9GLKQshi7c+5aaomjZZmJZJIvk=;
        b=X3DmwPyQf9VYf3na1eu5jUwYshDRMayIaxNQjKAMUANy8F8EWm+8IFJ33rAwMsK9bt
         I0VQYF+gLyeL4j9cu4seNwIUdV9Uz62KUfzdA0Nbq+xsuDy5nRv6UhqpG+Ar3xmo92Vs
         Cil3Cx2SRPrK7FRkTLH5PGipnklD+Oi+S6OjvH+Tz0lKLWdgGzvBe0FNkVK+oxlzM6WR
         cFR2CPLqURQgEoaV7ndLHVKQuXMpcweigODPKY6tRISWKn3RbkiCr6S6x/6cGr7yKk5W
         BO5WjNJm0Ox/Jd8DHuZiSE+Rn9IP20+fjm8tQyFMYbCh9Un66ngiV3O6YBMvZHWuLnh+
         Gckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795510359; x=1796115159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7uDWlUAJr4F4CNK4r9GLKQshi7c+5aaomjZZmJZJIvk=;
        b=C4f29qfqNrL7H7+Nq8w8HX32etXDL7ZIN1YM3hQStOOGmlLk86JyuQBrighw1pq7zh
         LPJir83OxYUeK6MsdJOh6O/1OWSFIDmQpc/GMERUQL6lj0aAFbMQBhcyfB+V/tWt7MuL
         Nh6D9lRQgVtTuFkq814Ub3pGfuJlArV0Z0ci9M/hYaTixy1owm0ZicUOhlYamIsgL8CV
         Iif9H0J65N9IBtzKJqJJ3NL01OGKpO3UZs+1AIpSMoELnjfBnFaIE5MTYsi1YIwbb1ga
         khl3LxpYeBSr+aZ/IOieovX9oe0IjxJAIrQP85eo4/aAmmGQAYF4wMt0wK7k2AOKWozW
         2U9g==
X-Forwarded-Encrypted: i=1; AL+hErFWrU5Pj7DAs/rU5qEIRzy2v1PnKPwr5i3Vmvg5T3CQdjBAP16EdRYgaENltj33hza6JB6QASwlVXq5640=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nrc4dYQqTsivtTure2UcS6MZoGyHAPlDQHj6H5msRR9LUpmBo
	/Iat+/UP+dR8t/jn4RyOX+gjU+oHMDbxXSE3Iof2N0UOwhiLptQJEJjE
X-Gm-Gg: AZFdTZccvM57UDvn6BXxoh8V6cPGfWEsrCXQbMWMVKzj6DWgXXBZwzZZN9r+zbmJmdz
	GIp5y0wnm2frE4Fl+k6mfE5Clnc1A8RQezUJ5IK05cy716Y/oDmDbgH4wVrMBgOrB+gINCqS6U6
	yCkeqqgJjl64XT25grJ0LUt1IdbGaQSFlNZMk+f7hg0tKt7CT77CVlaPC8OO6dWFcUqy9nQ/Rew
	C2dSzU2sS0RdLX14Q3fDhztfgo8DEKi9yYQ7Dss4BPAwNcand1Ey4wZYxe33oP6q9mBcd3kLw9M
	DHV5sg9DWYBUEN3haBx4gtSDiT46eTUrQ0562n4JpJWsI1HGv0qGFnuBv5j8VdYoEXQDSWX/ylt
	51FOnAMp/9Z4UfNSbWp03MK38iR7OuQcB/bKumySfzRzcfTAM4Uagqsa45z8f+qCib3LjXs3n5T
	6E+G1q0OOPwxxNIZX0b7StY/Mm33TrgUuzVgrl0SkU5s7eZaNvX1aV4EartPYTv7ReH+69WS8XA
	rWtOWgAtTMuqJP8smrnXcQKOv6MglydYTwAVRMV+TvJ0AZ135uoUrdttWUqedPXYnfiCL0EbDKl
	0uS49+WbJBvCFOySq8uaAr/fI43/ZldZ9Fx4wQR7AU1920g=
X-Received: by 2002:a05:7301:d587:b0:381:d92e:ecab with SMTP id 5a478bee46e88-3856f25884emr13127421eec.11.1795510358951;
        Tue, 24 Nov 2026 00:52:38 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm38060789eec.8.2026.11.24.00.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:52:38 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Jiawen Liu <1298662399@qq.com>,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: omap: do not unprepare the debounce clock twice on probe failure
Date: Tue, 24 Nov 2026 15:52:31 +0700
Message-Id: <20261124085231.3696739-1-congnt264@gmail.com>
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

The debounce clock is now obtained with devm_clk_get_prepared(), so
devres unprepares it when probe fails or the device is unbound. The error
path added for a failing pm_runtime_resume_and_get() still calls
clk_unprepare() on the same clock by hand.

When pm_runtime_resume_and_get() fails and a debounce clock is present,
the clock is unprepared twice. The second clk_unprepare() warns that the
clock is already unprepared.

Drop the manual clk_unprepare().

This issue was found by auditing the driver with an LLM coding assistant.

Fixes: 9df982f1f283 ("gpio: omap: handle debounce clock preparation failure")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/gpio/gpio-omap.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 0da628ae77be..0af26c3f7197 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -1463,8 +1463,6 @@ static int omap_gpio_probe(struct platform_device *pdev)
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0) {
 		pm_runtime_disable(dev);
-		if (bank->dbck_flag)
-			clk_unprepare(bank->dbck);
 		return ret;
 	}
 
-- 
2.25.1

