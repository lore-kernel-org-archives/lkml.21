Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795736632;
	b=Bwc9eFUqsaK2VlG8MWTYiGd1CgmdNnK6o0mwjxqN0YTXVWnhDN73DJBd4fD7h6AkMcfs
	 3pJiwFAAg5RxMsbOCosxvu+rCl72ZDsHQxeCh8EBCMZziDD/x3YXeFWGD0A/nwPr69/Ll
	 ZCHQa5gdtNUVC3Ct9mZD85mmkq3y5TBr7wWkJ7aEVcpCMYEKsmjXTJpVG8ra9CXuEqtQn
	 ZcrU/Vae/cSdrFFwt9Gmjwc5+sSD6gWjpiB7uaeQJu6Z5ksvzTDw8vTePIu4fBCP1rHTS
	 dFMLu2AkvnHK2/hY+X0CpjQ62IBP3IiJZWgDcogxMdkOK9I+e5xDnVKAPhlHFVzb2nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795736632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nabDe3IU+lYPz/hho1p8Df8ddg25m4scBSKD0WbOpWg=;
	b=YR99klbq4S3DsUqF0JgA0NXwTwS32VoTCI0gJz2kVsvws06MgrxnjGgvQEDvmz0ZgOXv
	 M/fyww5m8y+OKv9xShqbs6sRg/x6gYRugvZ8a9BJx+MpX/UvkA5td5PjhoXqB8FTNbzKn
	 UxFUmtdQKL7/esRwzQbM/ABWnomglqVvVRLjzfSXgzUl+0ZkW14hRFHvTa8ZcCDOIgS/W
	 0Ds09mL5l6yj17TPC9UPpfloTIJ56KOjeE4k5NHlRkrB6DiSjNNosvT8EW699onSRKBqF
	 BoXEI+QziPQ+dK7UfxnXOGYWXJiMCtbqCz+aspn6UYsDKeaViegKMfVrHYA3xfQU0sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PWsloo/P";
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA67606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 23:43:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCA67606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PWsloo/P
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so4485840b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795736631; x=1796341431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nabDe3IU+lYPz/hho1p8Df8ddg25m4scBSKD0WbOpWg=;
        b=PWsloo/PvjA5g6LQHjM5Y5EhQ4f8S3XxTwIe8Tzrv4Z7CqD68w1vmx0a15FO7VQdMZ
         yH4jcTSVVgbAXOnyM69SIFi4Ml9Pnbp/D/bDCEijY51cBZfVAGyV0Q5rW5Usn4meHVuo
         zUcYmKtEqcWVHhd0PAZ/lYyzWmDbA8KO2FWZ2SBhPfHeO3Tez1Jb+cQiUdb8oSla2t4d
         2n1J1UpKvUlvZxPp5c83tMvazzCA1fsnplomSahONSZnXjn7E3L3sMkqDUXP2bOAjjLs
         E8E3UXm3VxylBaT8EGhxAdNQLJEESGSNCKgA5kbWGTLG1SoDQgJgoFnzdeCkZi5ITBcF
         7u7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795736631; x=1796341431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nabDe3IU+lYPz/hho1p8Df8ddg25m4scBSKD0WbOpWg=;
        b=ChD7zNLWijoLMewbHnYZ8yJ6tYJ3KS7QfHZv4Wj2nqcPFvBObj4KMwnHk6GXu/LS6g
         xNAb/YlyMCfPcPay7wTy9IT3U9BG8m/MTlyAEFkQiUlU1RPQY3jahxAylzdCtQUREKFx
         06FnoDyH4zS4DzSwgrPzQH7BU25KAPgW0Jv2X1q0YmjSNe0KMk6h7V8KrIFyZ6y7anKR
         sIzm8rm5OdboPA9bQR2ZtBpZs9UYtd7swgIPr1XOMyGbGJ61OFTM5XOhJCBBp9sFlyQ8
         xSwjo2Vgj0BEKwNf0CbSlFpSCWjMZM3uBnsIlJupe8nVRK6pvc89vtB9jMQOhas/1oOt
         EoQg==
X-Forwarded-Encrypted: i=1; AL+hErFXR27xVBusW+AbhxaiUb4lq8CrYJuQKBKINLgSWZVXc5hMezU0pDizNSnU9pXFf0I4xmyJyw9qJ0Pk340=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7kWa8PUnzfo71b1TURtmYmMBPP6rj4qasX8pNxK1jQR9VIoKb
	ydFU+vQXesopQJ5rWdq064qB7BZpPgMw4i2MeOrTmo2zK467qgtMwtBG
X-Gm-Gg: AZFdTZc/yc3RltfjnmZg3EFv3MfK1yLi9esMb711OosEh5LCOEoPwSbT0Vhq5SxbPrR
	zkDRNmeyqfhFcAzpwpbRvcAxendLnPgHOg8c8TZXzNnyDsSyNKBwShtlcltv471ni7CRSIi3+9I
	fr4cntBUhvoXcO47McRiy94qHUPlmLidTWxeyV89VK+lgSu7jJX9OE13bYEXjCtH/058Ua7MkZV
	QNcuwAjsel5txRYYRDZ16h5pkXHTs9V7a2+ywMGRpv669LPA93xU0TOCOfc4cR5u74GAMuA5Bxr
	JXu/xc4NAkr8mWLi8vzJ3cFyfM1hwSUth0jM4oh4xV7tyIFYwkUmWKQZhQ5f4+JqyxOIVgCvg2i
	1aWj4icdFMVlJK58Ko1Qdd7MNhwghg2F2Nky1m4wvpY7KHTVOYF7IFt3dXcOxhNrnWXDxR2udcb
	IT04mkYWOnLvNF58UsX1AwS5y0i4r/HGzn0SfRSvvConKBbMD2cSXjhc4yYPwDV760yidl953BN
	TPP+VpQpca+2GqzuGgIm/OJKxpGAcTfw55IDwB3uGWgecBWXODc5tPpeOB9BnIYa4wLKM07UrgB
	upNdQLHqVBEPW/9u5s/Z12Gp4+pWp133aPNX+HCdSOmRWdBzBw==
X-Received: by 2002:a05:6a00:4c10:b0:8b7:6ffa:f201 with SMTP id d2e1a72fcca58-8c7ddfaf8ebmr15763613b3a.29.1795736631025;
        Thu, 26 Nov 2026 15:43:51 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm11120665b3a.21.2026.11.26.15.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 15:43:50 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] dma: dmabrg: remove trailing whitespace
Date: Thu, 26 Nov 2026 17:43:49 -0600
Message-ID: <20261126234349.74357-1-artem122novak@gmail.com>
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

Remove the tab-only line from dmabrg_request_irq().

No functional changes.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/sh/drivers/dma/dmabrg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sh/drivers/dma/dmabrg.c b/arch/sh/drivers/dma/dmabrg.c
index 3778c6a363ec..1fe63b2e4c61 100644
--- a/arch/sh/drivers/dma/dmabrg.c
+++ b/arch/sh/drivers/dma/dmabrg.c
@@ -132,7 +132,7 @@ int dmabrg_request_irq(unsigned int dmairq, void(*handler)(void*),
 
 	dmabrg_handlers[dmairq].handler = handler;
 	dmabrg_handlers[dmairq].data = data;
-	
+
 	dmabrg_enable_irq(dmairq);
 	return 0;
 }
-- 
2.56.1

