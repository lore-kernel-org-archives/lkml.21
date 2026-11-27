Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795767148;
	b=akl9FuwQtSXogMbchVE/79Ydq/opMz3ZyXr+D1nF1eZEgYUHiwwzYxpa7PLWO4Qc+mDA
	 RXhv2Y/sBFs9JCtRdp4+JhXhGnzu0a3rdPT4orlqS3d+YdlrkeYdLfvQvxji7/qCgX3Fs
	 N9pAMO8cdpgFMIDBvn+XayMOn+JNpE7PGdBNV0xsSC9D423Ri+QrDvwV5g1SCP7hKnMp3
	 5rCBVm9hWYuZOEfkahGOIut6OypM1VT2/715P//sYLSNgqXMGI7Bqo4g/aTOxNoCfsdNO
	 Vp8CpQ6nWF7VHapalspLWv4wTCiQIIaiFegU91kJJYuxmkPvsS6tXL7A2r/RZPoUJmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795767148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2pJydPrYzkvGACVJUI4Nizye21FZq+7Adb+v9+G0Kq4=;
	b=qJSnTZLoYb1cXSlWd6yE6g47Ah7VRhf6bkNZm4C/uz8p9D1pNXFYgxg7uccmhDPY+8sA
	 5K7TqJEteshpSXKLjZPxffuRjc9v+lQLteW5QQ0HZRmDDbR+lyjCuEcOmJC0T1DPXM9Av
	 WjCXAalb6MYuVHdcp6aHwXgZxk8ZHiWSmH6neREFVLNzuEICv0Og4rymN2Aq6m64Fx+Xy
	 OX9u13A0CiemOcABnuwrkVNzvpplrbXCUvoX/dAvapFKD2vetC8I0hotBTKZSkzvUS5id
	 FUZjQOme4b8oFAmVf5qGaG8DlU5O1hmuPySvQDLxxqxqjOkkr/LgyPk5nC7wbEGNjng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=psoc+VjX;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC7E606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:12:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EC7E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=psoc+VjX
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-38190551625so15003337eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795767146; x=1796371946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2pJydPrYzkvGACVJUI4Nizye21FZq+7Adb+v9+G0Kq4=;
        b=psoc+VjXdpRY5YGsRXLFyelfDX+lPLckHOWsO6pdqZajXjXpjfpXB8+6PMWF6Oj17m
         s6IU0TasDCVr6qEXxnC9LAkbizksCSVfv7hZMYGpVKZlFNPHrldbtX2Uaq9Yrx/poMTy
         Xy7OieGUCWuicI+Ho6rugDyWmcv/tZ9M+EzFPqr7tZjY4SaIB2u7Jmo5rdS1Xn3HX8JG
         gEXTU6Lp8+N7Aqej8XPxnqN4tq95M1/6PTmw0F4BjpTMg14noOz81FvILBH+H3PhQl4F
         4uW55KHKNpmGkJu33a+Tl4AE2ocB5vEl2MbUTdhxnJ0PqP1MRYKgz1pDqKh3lfJ13Qal
         Am7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795767146; x=1796371946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2pJydPrYzkvGACVJUI4Nizye21FZq+7Adb+v9+G0Kq4=;
        b=Rcva0a/YZg6/YFRzEgfwpu5PwkeXuwAOJz3wAS116mW22qOT1opcWHrID7+muchYSz
         aBcvwwKg2LHjwE2TXwygE3/DLuqK9qk/La9o7h18yMTPPwqXL26JJ+stc7xOzhFA+Tc+
         UjdDmfRs/kII8nTxGw5pf2w0FIVNDRu8FWoETHuuZXlqLHcsntpPmEnVZtRLHjoile1p
         FBEPxa3+NEVj1OKAmPrgOsK8Qm0EKKmQm/K0LNqw25epJIh3ihV7K08fCaZ7qCW2LV4T
         jIeY7aD3UU8gSqWPz1UV+170iBY9pqdChwfbXsmp8KsEiTokjztqXp4YrrBCBfCHkVfG
         d+LA==
X-Forwarded-Encrypted: i=1; AL+hErFkgdjkjhD6Su9Hbllscxe/wfXcahFmpEN4cVJGahJYw59kT/umJ2d23nLvYQ49ppGYRUP59r1Z1ufeapc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2Z9ITVavkTpgvheT74nm1ggRrBKrc9l2zqAWeWhZpTiNis9Ig
	m/9xd/WIS4wZhbp1bynfzAN9DRHD77WM52KuC/uyEa+1UfLgUNwOr6eK
X-Gm-Gg: AZFdTZdkoF4ME5OBCq9yUmQ9MMJFmz1lrvgdk0/bDsRE3ko8LOqvYScpB/KPrB3WHVV
	Jkn5IpKojzwl9JRoBYEpmH9l40viBJSv7xoRHUne03ehYNl1AWRY0l/0n5dG9mAyhHlSQSZiUA0
	SNOX52J+ggRuPhgwSTJbWyskB9xlWOdnKQjwK3uToLzUae9mQHt9HYkZUYluQbosZJJmS6Xba5R
	F90fQ3jrkeD30/uyYIXKE/QKbPDxfgyTDzJNKrAKc89rcNwwDPuSIQA/qwcxZk92M50EMapU4kE
	fdkYW3xbOKo48cknItop98DZB7ojUjAfwbRpwDzxHLAUlXfOHhOJbuj2vGgzHrQzUYLgHNKQvk0
	cr/vV021E/8aYRB6Wn1eiqCdTPvFJGKNEWCq4YCzbP9kPc2A1HQJUEyor+bH6kwgUl2/fDWUReY
	/Tm3O7/eI+Q60ZSQ0gcN0LhTuw3SuChYDlpTC0XxwXPS8HVX+oDRhayPoPMnd/S2cYyBsRFiKge
	+bdOMswLz8uZ/ww8BnJdr3LdfaOwCyd026h5Hf9oZfDtQyBXs0LWZG+FqBMAVW4tTfZfi00JfjY
	onCdmLd343KpLKtSUQ1Vom3GwZoI08/USjF4gdUbQ8eMRMuX
X-Received: by 2002:a05:7300:6da7:b0:384:5885:2f81 with SMTP id 5a478bee46e88-3856c0c7c06mr8085826eec.5.1795767146462;
        Fri, 27 Nov 2026 00:12:26 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm41286650eec.18.2026.11.27.00.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:12:26 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] pwm: sti: return the error when requesting the IRQ fails
Date: Fri, 27 Nov 2026 15:12:19 +0700
Message-Id: <20261127081220.302726-1-congnt264@gmail.com>
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

sti_pwm_probe() calls dev_err_probe() when devm_request_irq() fails but
does not return its result, so probe continues and registers the PWM chip
without the capture interrupt handler. An -EPROBE_DEFER from the request
is also lost.

Return the error, as the code did before it was converted to
dev_err_probe().

Fixes: 3025c9c669ba ("pwm: sti: Improve error reporting using dev_err_probe()")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
If continuing without the capture interrupt was intended, please
ignore this patch.

 drivers/pwm/pwm-sti.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-sti.c b/drivers/pwm/pwm-sti.c
index c1beacb26b4d..bdbb61e44fe8 100644
--- a/drivers/pwm/pwm-sti.c
+++ b/drivers/pwm/pwm-sti.c
@@ -571,7 +571,7 @@ static int sti_pwm_probe(struct platform_device *pdev)
 	ret = devm_request_irq(&pdev->dev, irq, sti_pwm_interrupt, 0,
 			       pdev->name, pc);
 	if (ret < 0)
-		dev_err_probe(&pdev->dev, ret, "Failed to request IRQ\n");
+		return dev_err_probe(&pdev->dev, ret, "Failed to request IRQ\n");
 
 	/*
 	 * Setup PWM data with default values: some values could be replaced
-- 
2.25.1

