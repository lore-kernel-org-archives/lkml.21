Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795767150;
	b=LCK7XB3QVeL93YKhMSK30HYVKt8l1Mr+fqQ9fIjmHfFxCZVDXRcP9iip3nzur7CXfxO6
	 ezEknlg2HfET8to9MwoYIPLmo6EMFoBcMmywlAmsc4nfkxlNFmxlSNb+r53Rjs4SHDk+x
	 DHUuerEAgRYaF0DycjMzQ/HlMjJaXlPWvHwElyOvXVBc8ePHsg4VzDkncEjE2fiTJZe5K
	 hjpJCZglOYq7BYl/2SCW2Xb/M+DMMO0naFkaJQp9ARqHFZgf6szlTbd2nbRPxoPrvx7/9
	 Ln3qwcpNlpE0L+zpNA5N/69R348OfmzOuAo2kZ5q6KD2JHvm46e9L1ywFxK8To8jE5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795767150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=biKE31krqx4uiyZbINCmYdssPjN7FXeM4VWJQldNBE4=;
	b=S8k6iVfw8B1Mrg9xVi7ZvUPMNaCTKWcO4lrA0Sx3RQjnz9I+g+Iwb3VEcsljim3TcYds
	 oCqo4oPMhlSMwLgaIiI9QYqvM0j0Toz8VcmslYXo1z6KauZAvZR7NKlUuiUfAjEZwjvnt
	 cPKbRZMDkGMUOPUPXdLfdT0PonXsEo0PbhPD6oXt0XDflWqwKcP+GmnJE3JOfO3NHF2Nj
	 pzju6+iEQfhdPtFDpKY1HPniVUMACs/sn30zj4xsgG4jr0+w5J++P4Smtx1qFHyPv3l4X
	 4yPcCB9lVUE0KvlafA34+XNruG/8u9nfxTAF4auO9m4X+/aBdLnJr6Tfc/xY86B5Kaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N89OvIaB;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BAA606A331
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0BAA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N89OvIaB
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-385c497bf94so7387006eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795767149; x=1796371949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=biKE31krqx4uiyZbINCmYdssPjN7FXeM4VWJQldNBE4=;
        b=N89OvIaBZgxgs0mGBtRsN1D6wvlneHG+Ksgqf8QBWV8Et0c1ehC2N6EdeuMO2OygiD
         GazawBwIBvjOvwQx0T19XiNyPssK9vbrCGCjCpelG4SjFmy++YSnow5jX3dG0NDCjj23
         4UDs113EzwugS+U12RnTr5+4XA6VfYzdBcScg48dyIIqREon417fNLXMmAmbng4Rku8s
         lFeZ9dsa20oW95nrB2N2mDuHDsMwbAqBvdcLlWoHYJ04FVO176aw2VH8k+4kUcS6m6FS
         j20Cc6GMtm7ePkyCMbEl+ZmSdfsvP/vn9sLQs9RCjuL8Uj7l6+rooFBWYlWR6O69+5MR
         gYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795767149; x=1796371949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=biKE31krqx4uiyZbINCmYdssPjN7FXeM4VWJQldNBE4=;
        b=t9Ckm0NHD8Auzx+3+x1VsEC38LYxAiW/s2YJzJ7Mam5J94tNnxDu/1Qi58NXgZuMFx
         +cx2OfQZcr+mzDtuHghpwrBginl28GrmIA4e1RzkjKwQTRdBTKXlmqOhKnJd+Cd3BiW1
         f9b9KF3QYM+aBmLUb0E5xyGP8IxbHdKYfO6l4YEhCwa54toEexu1Mj2LnHvZ0mSyF1WY
         hc7jwCgOsTFKkE8TWn3zWb7UxUl+TgJgpYuPtzqGNrjysDe9q/8gFkl15RJnfxMCCUQ1
         wg3cjIf5qzWAMUgjF9s2oq8k2oSlYWCGWKuQW0tMpH3c6Vovmwimk2ghJqawTR12D7my
         iakA==
X-Forwarded-Encrypted: i=1; AL+hErH6d33qqbCHaAQtOlv+QhMDYv2+/nFF6xAbKiq1O6xNmHXDUFIPvmBZrpaR9oAOhDY/rkQUYx8f7I6mFkg=@vger.kernel.org
X-Gm-Message-State: APuU4Z86LlISaswmTbgYyjtqeq3clrR5Dn1khTe3kKtkVSOJnRQrmboD
	/ixDcAIB1z3lFz6rz8ERG5wWlT+mwIICxqGNRWEgZnKhrogc4nb3LYMA
X-Gm-Gg: AZFdTZc7H7fjsF7OjxyRi+hQxjQFsUm1EFvPX9V+6cJbNg/7TVEH0zZQs+CXlhyjCND
	22cofcRiqnNGG80nlA/4hXVjvD5OyW3ELCA8LA6X2elhjb6FVxr+D0lip23V+8uoSUlbmrBSQYZ
	leMkL0aLZ/vxThKBFQuO0eVv/6HgU1uNehZ+YTAw39nve0DfAKuL8W4WqtK5WkTPKQp1cskZwJg
	tAD7bIzWIxWh3A7VjbyH2CqRteSHDQUy85A6ZJ4e9dEawmiq+7iWT7b+oxGOFuUVsUT+GVRYzK2
	0hnSFkOHTrIPoafm0RuKaKkOsWAa4FSDIj6PgnKz1CkrvDcLGOPPUjtq+4GfObmmCfKCWGAXS7y
	PNOPBFzB2ZPMd2CQ+veCd9M+jHmZP2EpxLPJyYZxn2tVbk4m7Q4LtJHAhtPUVVRDqg7YWWiV73E
	3Eg9+u3COJ/JK9FYo66EToloIjFlYAsBM1Fbtq09ksjs0PuwvjI8mmewvYJNLboUHMLGKCgT4Hx
	RaBAyPaGqqa6oOPXTggE3dBXAfCfXVJ32HcgN8cxaCHlApL4EPB+zuJZWC1T6vG8kmaPbk/RsWX
	QRS/StRlgwrCsA6srk4cjwrk0CNSmRdCCYbxh5i+JaNu4Nc=
X-Received: by 2002:a05:7300:2209:b0:386:8d2:929b with SMTP id 5a478bee46e88-38608d2945emr34239903eec.23.1795767148650;
        Fri, 27 Nov 2026 00:12:28 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm41286650eec.18.2026.11.27.00.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:12:28 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] pwm: sti: request the IRQ after the driver data is initialised
Date: Fri, 27 Nov 2026 15:12:20 +0700
Message-Id: <20261127081220.302726-2-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261127081220.302726-1-congnt264@gmail.com>
References: <20261127081220.302726-1-congnt264@gmail.com>
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

sti_pwm_probe() requests the interrupt right after mapping the registers,
but sti_pwm_interrupt() reads pc->pwm_cpt_int_stat and uses pc->dev and
pc->ddata. Those are set up later in probe, and the clocks that the
register access needs are also enabled later. If the interrupt fires once
it is requested, the handler can run before any of that is ready and
dereference a NULL pwm_cpt_int_stat.

Request the interrupt after the driver data and the clocks are set up, just
before the PWM chip is added.

Fixes: 25eb53809674 ("pwm: sti: Add support for PWM capture interrupts")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/pwm/pwm-sti.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/pwm/pwm-sti.c b/drivers/pwm/pwm-sti.c
index bdbb61e44fe8..73b8690d596c 100644
--- a/drivers/pwm/pwm-sti.c
+++ b/drivers/pwm/pwm-sti.c
@@ -568,11 +568,6 @@ static int sti_pwm_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	ret = devm_request_irq(&pdev->dev, irq, sti_pwm_interrupt, 0,
-			       pdev->name, pc);
-	if (ret < 0)
-		return dev_err_probe(&pdev->dev, ret, "Failed to request IRQ\n");
-
 	/*
 	 * Setup PWM data with default values: some values could be replaced
 	 * with specific ones provided from Device Tree.
@@ -614,6 +609,10 @@ static int sti_pwm_probe(struct platform_device *pdev)
 		}
 	}
 
+	ret = devm_request_irq(dev, irq, sti_pwm_interrupt, 0, pdev->name, pc);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to request IRQ\n");
+
 	chip->ops = &sti_pwm_ops;
 
 	ret = devm_pwmchip_add(dev, chip);
-- 
2.25.1

