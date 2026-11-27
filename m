Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804953;
	b=3Wjyll+p5pEhC9AA8TOOlTbB/CNxnJVdrvU4mUlx/rMP8mQoaTLPCj0+lRe/b5L068rq
	 smZa9PyXk41A5gZzPeudWuGB/Lrgo7dFpMuIgPIQ5b0E/t291M41pZUPepbltsC04p3Cx
	 8iCj33xcQCEllIhVuJr6SWyPCozKg9S+Bzw1UjNWoQRj6ACpVBnyUkedz3rxKLUXJiECG
	 Krz2LTcu/28aLmmqaFKYHB6h4WCOzE9+rxsktBKVGPRxC5Roeu+w++LBAbpmuo2PBuTkh
	 sDc6vskBpRtbmwTECQGflDsPDSXahklAc38tWO6ToonLR+fr80WUZa6g2x96HOs4AYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kgvT+dOepkzuZa55RwDoKTHZPik5/QAGfaPisL9xZDE=;
	b=QCGu2epYYZ/2H1xHEqxgAzixkYCQ4fKqnX9oRmPKF879ucz/5q0OoOnZ8wOGa98NlVvp
	 70hHgInoTXfcg2+LF5KAOBsfl0yg1y/ibTrRil8Nl/bVu4UjT9BDusfV7TW+FoWm2S4Jz
	 zLEP3OubaskqJOPQI1KjrXo8hM6GYrApmvSgKQ4/1bSTKnb/9BgFGBo5wxPtpSAA2XUdF
	 DiyU74yKbGOuBo1qNAsOCuKN7fh1etx1+e+kk9SElhJYwp/tXyXoTtaoIjiQZOP8s5uOJ
	 VblrOTRL5uc1MX/X6/euvlgvWUVVVrfQ4d7r/tFFKgTA8cWIaukUPqXalGGa4/qWbqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jEO8TY2b;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633BC606A689
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 633BC606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jEO8TY2b
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b3fb193c03so3651434a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795804953; x=1796409753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kgvT+dOepkzuZa55RwDoKTHZPik5/QAGfaPisL9xZDE=;
        b=jEO8TY2bTqpsBAcjBmhwCrHkx4o7wM6911cEx73ebLd2/ItQ84EITI2+SA8D33kjWl
         zeGd5/mxqfkq4FPSGa34wxMCJo07CJYG3UufkjISusrz52iBBWckODmjgjAQddatV05o
         d5kaZ8iHydpbaALJuPH5AxF+kJXL755ETa3jlAl+geJ1H/G8uB8sWBWjeqA2U+oum1wQ
         l0OWooCk9jLOK2OmpuH7Zfeq7Dm4rzkhoEwOj3AowByTlvtyNWiefePproX/gbh8nUNX
         GvwVjn9ZDxCHGmW+OayLm7eRKlv348I9gdmxQUnZk0pNeRZCI0EgCsVjvlYEIANxJYL6
         1bKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795804953; x=1796409753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kgvT+dOepkzuZa55RwDoKTHZPik5/QAGfaPisL9xZDE=;
        b=sFpieu+FH8JnKsVyO8M59y522Lf8xwGDEDV2MPboBlDc6e6rJ2ERR7NgMZx+N3eOqQ
         R3RIOcRYx8rsX8GgL5Z9IFeKhLMg/HRgWYDb02GKU9nKakQjvfCawsHfIdkMK+qSSJx1
         urMj6eLeTofl7Cwu274uFYNRYQ5SY42pqijtwycEd5LHV+CKiYNWzQFvnDiGCT7/8F1D
         vfgdigKJe4ujOnhfuh6PnTG4bXv99t+dok04NpOWfxu5S6QRDtelQ0kBVu2U+WVYf8Sr
         iBOrX6JkfZ0ErJ94p1x1BdG46SsWiVJMGWaMVDtpLqIsl+IUvO7zjod569zN7JF+yGOQ
         LO5g==
X-Forwarded-Encrypted: i=1; AL+hErGUO1WY0gcgM3WW/p8QVeUqTw9B4sKsjibZYoJ2y57ZZ9WxnV5zNWi+Dil17Kql4jFVGBti5K1EqHVp6MU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aHngfMktGm/Ir3v8wVnYJXxZjj3DlcS/q7Rj/RFpcBT5ddLH6
	zsErUWQnuQNM6eqklxztAeJUsM8fqHCKtJK2hmglr2ylW8ZeCQSS/Y5g
X-Gm-Gg: AZFdTZd0mP4ecAu/2WOBgE67h+/HJZxMLvYFQXCQQ3TLqYGv3b1mQhPri6JAbYzC5OB
	qpmjVWeiwOS2EtdOWea1I6HaziETcJJp65tS1cT8HATy2zou1vUFuDA1KBXLKAgCQMx9cZmUfeW
	A/Ao1i6IKDr9gB4N3RYejZVaLBydTUqnn1JZCUyemQN0TAGRyzzRdBZIjt6sNvKCRh7PoJBgkp6
	YXhQgS4wACQvZC/JsdTeElWaEJHSf6GDd6seQK8jx8yhuea+R6+vuQlEB5gwaIRq0k1fvEWkq2b
	2dsHk5DFoyTxAU8ZfpEqwU/QARSHFeEFzcVxD1wbh78UW1BepFpby3AjW4Pqo+gEYxtra6Ya254
	sHzP9JOPRVvx5Be7uHqwY7HF3q/n3KtqobJcWf3v/qp6cQQowca7UPymHPSFvBQeaZNBC64H1RJ
	4VOYo5xNnpo8i4R88zyUxCtP0VIMXZFQAGmB1Rp/5wAnwtNuN4z+WSiQF+IuXnnG7M7mZ5dmrv2
	T9QUImCEG3My5zfT3qH1FHm4BLDflC4fpUbLBmqWJNMiE/LXot9q4N/L9QMgtoeTYun3Sba2b15
	+ZvfyL5F/6eOqngQuiJ8hWo0IifEH6bNklsywyUWAWFaxoptbw==
X-Received: by 2002:a17:90b:35c3:b0:39d:f08e:e6e7 with SMTP id 98e67ed59e1d1-3b41c7d5bc0mr22005368a91.9.1795804952756;
        Fri, 27 Nov 2026 10:42:32 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4dfbe54a2sm19149071a91.17.2026.11.27.10.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:42:32 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: artem122novak@gmail.com
Cc: cassel@kernel.org,
	dlemoal@kernel.org,
	linusw@kernel.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vireshk@kernel.org
Subject: [PATCH v5 2/4] ata: pata_pxa: add missing newline to DMA warning
Date: Fri, 27 Nov 2026 12:42:26 -0600
Message-ID: <20261127184228.185827-3-artem122novak@gmail.com>
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

Terminate the DMA completion timeout warning with a newline to
keep kernel log messages properly separated.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 drivers/ata/pata_pxa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/pata_pxa.c b/drivers/ata/pata_pxa.c
index 2312c42def22..2e73726410b9 100644
--- a/drivers/ata/pata_pxa.c
+++ b/drivers/ata/pata_pxa.c
@@ -96,7 +96,7 @@ static void pxa_bmdma_stop(struct ata_queued_cmd *qc)
 	status = dmaengine_tx_status(pd->dma_chan, pd->dma_cookie, NULL);
 	if (status != DMA_ERROR && status != DMA_COMPLETE &&
 	    !wait_for_completion_timeout(&pd->dma_done, HZ))
-		ata_dev_err(qc->dev, "Timeout waiting for DMA completion!");
+		ata_dev_err(qc->dev, "Timeout waiting for DMA completion!\n");
 
 	dmaengine_terminate_all(pd->dma_chan);
 }
-- 
2.56.1

