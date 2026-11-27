Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797673;
	b=lKDBvvP7Rp500Icv0WTQObL2cjUPCVDJ/ovicJ4UGamD1MZZfZKhqlZeZhLDBwTf9lBU
	 dz6fIQTpsd3HlYvpJxEClblqirGRrHxNDJXQKZayl4lXtwikYMpEzbwSO8vK14x/a71xr
	 DRieYyYNfCrMs48vDYl1TQIsRMCSYyW5Xn0Xv1Ht/4lD4/nhJDTYfmX8VPhtQtkoTbTuZ
	 OJ+XBHecfdLf67Ck1BSOwNa6m7WJGsrEPFV94CDa37nkc49/VaNCgZwBDIxzeyApYgDYk
	 pXC/t38D4bVj6XcE4sZBHGlwJPAhOmvB7BnKAvfRDvIn4/ChNxmnzqie4SCOF09829A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xh8JlClPQjIKYSMwaXks/N+gTEcs+PhZFyDS0fpX7rw=;
	b=PHLpb14beirGQLKvXI9Oh0G9JqC11rGGl8YHeiQYHHHzIK62glRPrXOz8ZZt0iHk5NWj
	 /xBKQ5GZCgyubipF8KpePDhIKCplwsV13LyjWmQXEfh1WrRQd5dbRByfqjuz2jVQwDGl7
	 R3Bqx0vp8Nrwiqv4kr5ahkgTYcDDuupKyTl0Yg0RuPUOT4indifoI4K6yvLnnP/0ecFOJ
	 +LCXNKNTfaQhfU8JSJ1xFb+m5ClMCHlDHuzbXZ4BqUBzF0b4XybHDd9w9B6LUheI5705+
	 j1ywN4w3vmKITEDqsgoJT1oyby3GushimrbTnpqAZCzUrh5uDuO1b6tzUeJInCoVjQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hLWjd+d3;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10EB606A33F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D10EB606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hLWjd+d3
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c5127c7abd5so1266983366b.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797669; x=1796402469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xh8JlClPQjIKYSMwaXks/N+gTEcs+PhZFyDS0fpX7rw=;
        b=hLWjd+d3n7QBgdM5jjKMbnre6N/MPofBxWqBNsByHeEjkYBi07lsRWe+HRZaB8Rzi3
         9UbF+4goHbUcfKU4nkCOZqlpT/JQVVsUmbJJmIjcUF4YOr/M0YMJeoFqGjhrxOtrpmpI
         Oms7VcLgSVHmcF5dB0j3pAUp99fIyqFJ/7La9wE7Fz22+qnhl5GxjFS/ZNofAJS3Ag//
         zLNED8M+z/Hbow+b7vzbFfxCq4ChpEwqNl8YWF7XHJ9UnAprVDpou3GQZHDyd7SKd1aH
         iuoRXAbQIodpygVpA3HgDJA6+tIosheJwB+pOfokhNGWijhf+HBbJkCNwlHFmsc312Op
         1sbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797669; x=1796402469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xh8JlClPQjIKYSMwaXks/N+gTEcs+PhZFyDS0fpX7rw=;
        b=C7zS+Zxtl30U3hVojVwdNY6dOVKXshWo/vs/WWuEAZ3MtQBh10RT2mNOW7r2y0NlPj
         zGfsOICfLUbbMjvSDWuhzjj7FQvHJiIbMTdGi4Kx5eNRRKs+7S70515QImc6ZuFpdWGL
         h2/ZzJ8vNY5VYkURGD5hvHjGef6YHZ+N5PdnJZ1l/IR0yyJEkOSk2IPh6H2xTjxen2MK
         1rDdujY+GuvVnTUHQ6fThmPe3gdx6ZBELjdFmPukOmdrQHn+Lf3iJ4MXpbbddG8rjGk3
         jF3TI3BUYBdqiNDefStHyk1RxsnHTHBon/KMvKoFAhEyZ+vXjVFrVkI6ZYYeqxtsPK9+
         Zgyg==
X-Gm-Message-State: APuU4Z/AqKFKUrMEhht/K4AcND8lQIYUlfFNINNKqu8Grpj2wSDw0Wh4
	iKbqD/V2iI9L9ZRx2Zsl9o8LiPe1SJ5gJKyReVtd4zERh3rgc4KHjEZs
X-Gm-Gg: AZFdTZd8egg5qSjJQJqI1BZkybpDAk8A0iG0ci1EiRpO8+eCMVfqXcO1mUVN4U2NQUL
	xbNmCOmTJ2+aTb9EH8O7IQe66y7F/r8Q86GtP2/42iDRMPMIn0kgij3VD/0eE5t/ZVXO6ZWhujx
	fblylC9UkQYP30q9rq+ZuYuKPp65MpedSDqrj6mamX+d4CnKjQd1YejQdOwUWAJYkO5jJKYrr/e
	8SFom5BOEofH12WCA64CUJ5DdPGWTCETsK64+tEOXTAQWDszA1i5RmXULTx/QAu/owb1cPg9y9O
	8z4c5sq7B9VzxsZ+WuzGZobBMznXyCY+wS30+XEMIo9uNcR/V2LfDvVFLvOOqke6TEawrjfwYiv
	+eJ0P3ql5cY5WPPochcH+MuYFveVK8cAw5YKXW3KkCiDNK3H6plCfQrgFZ1DXGI9jwZZ5wLl0fx
	cI0V7fPPwFjXZGoiieODGFdkmjq5NWVQPOCdT10F5VNGXd8bPEEgktO7CSwOWZUTF6tC4vRCfNq
	dHesErpWtcWlGL5/i+Dnc8n5PkOwl5TGxtION/p1mX7bWtt3xnZpYnveP12aZwogqP7Q+2Vda80
	W+bZ+y4rSrq7RlhM+z9ysirGZr+byLxHZK3tNcKtPIEt5yawqRWZacyy+ZxxKVj+0JDguLLZWRA
	C6qJocwnuzQ==
X-Received: by 2002:a17:906:6954:b0:c25:504a:1e25 with SMTP id a640c23a62f3a-c513a5ebc65mr1653532766b.13.1795797669130;
        Fri, 27 Nov 2026 08:41:09 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae66674sm885397966b.15.2026.11.27.08.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:41:08 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 6/6] mfd: max8907: Add ADC cell
Date: Fri, 27 Nov 2026 18:40:44 +0200
Message-ID: <20261127164044.285910-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127164044.285910-1-clamor95@gmail.com>
References: <20261127164044.285910-1-clamor95@gmail.com>
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

Add the ADC cell name to the list of MAX8907 cells.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 103294c76b97d..ac7b41ad400ed 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -20,6 +20,7 @@
 #include <linux/slab.h>
 
 static const struct mfd_cell max8907_cells[] = {
+	{ .name = "max8907-adc", },
 	{ .name = "max8907-leds", },
 	{ .name = "max8907-regulator", },
 	{ .name = "max8907-rtc", },
-- 
2.53.0

