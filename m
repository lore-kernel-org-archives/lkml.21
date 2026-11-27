Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804953;
	b=jh9Cg5nus6a5cPvNJ0Q0+6TjkNIFg1a2OEDxyHEQldbUjnwnOkAI7KgV07hDFUPYB4Sl
	 gpjgLeOwTaHYY09OHdxr1BiSQUada3wGRUGR3Zw9bYpoHTIHG9Y8SGFkrmDWuEGop+f30
	 0rLZ086v8t+WbcnBZG0FikNVTEYbGMuBzYh9rGHKnz/zfj6v2vBt26wa8KoFadOKH9oH9
	 ah0+Oh1n/uj4cvIZb3/hZxIZBC8iFAnmwiht2o3n199AbWaMmgCVgLR6FMHylMuzGb/IF
	 OqcTcOHKZODxMuWS6tRLYWRaD9LXj5IOx6X80yeHhmSN1VbKJwYtbBKPPzs8mPntZ8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vWsF7/sGRnQcNHhIssCpGPPEwDUF/AFXvsQJ0lFQQ60=;
	b=RlK4W2PqvbbCDS/KLiIgedSnNX+KSxuK6+PBeL42Od5ze1RyBUSnXEoaar/R3BWomgSJ
	 W54IMfpWv96vanw9yMGLAqJoPs12SGprkkcFtquxqurwEUB1VIndf+xVxiM/iv8it7lVi
	 esa4BiRGLAFMmXJuOauT0mzJmnr0xyHXCafVod/Vb2XY792vGWW/YltZNv/Iqx545ieWI
	 U64CLxQ4OE6EYtNGFn1LrkUNZbVTo2tOLsIpwlN3k7ej+Rsw/x8Ra3NCzmUcg8G0F+iEZ
	 KuXNEsy04awppBwfINZssllDZnTTf5vyBjTAr2K/5v9baOjwT+g9grzUQa28UUd+JHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WSpsqNGR;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3174606A680
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3174606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WSpsqNGR
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f04bea9a93so73459495ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795804952; x=1796409752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vWsF7/sGRnQcNHhIssCpGPPEwDUF/AFXvsQJ0lFQQ60=;
        b=WSpsqNGRs44xK3Qs/oFYox+a1jTv0CydTsHh+xqeHY/b5X5TLsuiZVePyFrd6XZHQO
         oOq6jmtEcLbFVp1Co2JsOnDs8ikB7LCeVQwgzqaWninE/yOJJk42h4EQ444NdVDkMjdF
         LG5wklvV8K3KtjIc4Epb/8NscMJv73T59YwqXLc2pVE9V52aWYIm7Rsy3snIx9xQhfd2
         0WvoKmPaCpt3nohcAgpUSllwcdTYfCW1k26op1bMCr09yvqnazTb75aAEVpLbKg2+C2h
         ymofPkK8HSWhesXBO6qE6sIu6Ae/IDO0xRPPQ0JdLDo1+EEImz+jhq9EGOy3m+EmTsNB
         ieWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795804952; x=1796409752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vWsF7/sGRnQcNHhIssCpGPPEwDUF/AFXvsQJ0lFQQ60=;
        b=pxbYPCCqNe3rrGuQS6aylhj2Su9BcrnDAOsDuLAuowrWp9fXTzIco92oe9m4n7lswf
         E9cenxQSb7s3Ihrso+TDVzoIJ/QNI8QirXULcDq2QGZqw41YqL/azZEQD36I1C/lavHA
         M8B+be9dkq11IekdwWJsmg+qExIw59f+7m1JjVxRarliQcq0GcNon+DVTOziFWWg/25i
         ORWJiKnFH9rKUQQS9cYx1M/wBGeDIF0SXapB8NKFLU4YolCAlLt5qiIv7V5ign8ky74x
         THwL8brcqGPgUpHNhf8lEy8bcKR+eW7AzIL6muTJf1mfR99ReCjmABPifrokgfTSqbKb
         qPew==
X-Forwarded-Encrypted: i=1; AL+hErEXbOx0heoJ/QqlAm6dC+KS7om3qJxWTnKwEZ6gfNHpsO6Cq2Vtv2/Jq6jlzQo0rHx5S4Zb9yYmqpzj760=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VvCzGwPBndNC+ReAzZwS0pFEq/YgxqZU/yg0BWsJlP5loRbuL
	AMJObu+FE2FVOvVW/jVBWlqAYgNfDx+J3ozUPPmGVUdRoDGcYlLu9rlJ
X-Gm-Gg: AZFdTZcYupctGqeiiM46l51pDbnI+GNNr0YtbcLPYdqlOl0dCU/Xypu8/xNJS5aWF72
	G5JIjIUHDI4EyW2klI5M2nL1DpIdU3jxRAy7oFKukPc4LPOELRpxPczdShGmfZ9kMG849jaoQqd
	8tlWLbOX8/XXXEYoa5qMjYVM4F1DkjbU435QIkV9/fZiYDvLb16wd80sQFLVQKL5twwvMkzjLB2
	rEILyXN/q7jqEhsvM+L2tU0vaPE3Sq1sTxaYbH65UbvgCaUMdBwT7nkXL144PT4hhF4NlRctbGj
	OwYWKJ+nUaXyJ1ubAROcNa4CUgtrmxymsUGUehOZ5IG40MjPAdjp1MnkiLXrNKjny2kKSiCbCKV
	PJY7s+dWrxfUKoJS3rjnhPGRW+iMQWeN9ft9wRnWU/4V0OjZ8eTxRpwmrbw7qOs9Maem7U+hMXB
	PexksXVxVtt5Kme29XB2yCemcFwNwQ/oANo1Mm8F5bWRQfU3kTVENc9Yb/ZLVN9d6T7uZ/MhjIt
	RAM+5KGS1V5L27Wq6J0xo2Sx70T1QiruMTz/DKPz0Ax74azosBSRYVzg4MmfWFQx1Jl8c03Wog4
	sKMpkMk7n2wyB8COcSGcJU820n5OBvqvpoVkjzqoadOdiIuoJS4=
X-Received: by 2002:a17:90b:248f:b0:3b4:2394:7cb8 with SMTP id 98e67ed59e1d1-3b423947e12mr18091674a91.48.1795804951932;
        Fri, 27 Nov 2026 10:42:31 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4dfbe54a2sm19149071a91.17.2026.11.27.10.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:42:31 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: artem122novak@gmail.com
Cc: cassel@kernel.org,
	dlemoal@kernel.org,
	linusw@kernel.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vireshk@kernel.org
Subject: [PATCH v5 1/4] ata: pata_arasan_cf: add missing newline to warning
Date: Fri, 27 Nov 2026 12:42:25 -0600
Message-ID: <20261127184228.185827-2-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127184228.185827-1-artem122novak@gmail.com>
References: <20261127181619.183139-1-artem122novak@gmail.com>
 <20261127184228.185827-1-artem122novak@gmail.com>
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

Terminate the clock-rate failure warning with a newline so that
subsequent kernel messages are properly separated.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 drivers/ata/pata_arasan_cf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/pata_arasan_cf.c b/drivers/ata/pata_arasan_cf.c
index 5e02d227ddda..61977f0ed84c 100644
--- a/drivers/ata/pata_arasan_cf.c
+++ b/drivers/ata/pata_arasan_cf.c
@@ -318,7 +318,7 @@ static int cf_init(struct arasan_cf_dev *acdev)
 
 	ret = clk_set_rate(acdev->clk, 166000000);
 	if (ret) {
-		dev_warn(acdev->host->dev, "clock set rate failed");
+		dev_warn(acdev->host->dev, "clock set rate failed\n");
 		clk_disable_unprepare(acdev->clk);
 		return ret;
 	}
-- 
2.56.1

