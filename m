Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795803386;
	b=rhf7+GVFpX20GM6jY8Qist6DIaI9jLMNiPDcoq1MuZV6iBy6IyV5HftZQKPSfGwANOaN
	 hzSO6plSrBghONYnVHjFitzmdX/c6lk6Jq7Akk1c8EGy7GA4TXljwG5PHP78Q54hdNEai
	 wxTPRKXYxqo3Qs8E+6Q2OuU/bVr+P2BGmg4w7ENOLfeXt0kZ0PAVd6wl9vgH4gBdqaBXz
	 4oWKK2TZ6cTWfKyDB5AE40dstGgWAJdIbzMtnz1BWkxrNMw29q3xJ2mng0jd21CJVkKyR
	 BPYkhrv4xcwUn/+Z7xGRU36S2Y6nEY/ndarj6A2khexGC9Ogqztx9rT8eRwT6lUiltg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795803386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kgvT+dOepkzuZa55RwDoKTHZPik5/QAGfaPisL9xZDE=;
	b=GhaaUhgBbfUSSq+BabPBbsymdrqzYIG5wxAvuiCvRpdEtXaI4kKSkZ8XfuKMlEKGr0J9
	 7CK2JJ63ZwGEpKdD1dXe7/WwB8+dCyxMSdAywdaHMp4Y5YzpQ4S9B6YU2XirQt5ZRXTo/
	 mCjtpkcJncl18TyacscMRHhBdCM4bNIPvrr3Ez8MNt/M8FLo3DHAwUgqfhXMlZKtFzJ+e
	 ukEe7qr/j9GbggBcDM0kmI6kH1lVbVvajXpCe96ohOFQHXjuZUF/IeQR/mkBJGv0DlC6G
	 hFubK6qgii8XK8S6E1ADn3oww7M6NxvnmkbA7lTj9Md9VMJ8itOHfHp8ikTXAEQbS8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zGIgtLFT;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D7D606A332
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46D7D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zGIgtLFT
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cded697ba49so201174a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795803384; x=1796408184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kgvT+dOepkzuZa55RwDoKTHZPik5/QAGfaPisL9xZDE=;
        b=zGIgtLFTLFb3bTCFHJdpdNrD/XVvbrHgVs/HhfHelDm2b8fAROsInkQRxlQD8MHHeg
         JePSYdenhOc0rbReGyuZkV3VfxYwdQXwiQXtjMbW5oVxVXzTfOqmQ542ES2WK4cX4Igs
         1BRSbdehNdIQneTwnH5AmiA0opBv9KAmpn6U8lJCaz6kcs3x/nETnCzjZtbeINoLv4PL
         d7NQ4KrQOxPQYfuwsY/2i7zv3gLd3wgk766j32BRaPdS+rM1f4BRV5nY9HNWlJub6Q3X
         hT+ce93f9umv4NWy4XMEgJ39Z5gdQIQjY6UHbEM9y5sLS9i2ivKywOiw075DCQ+O8WC8
         gS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795803384; x=1796408184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kgvT+dOepkzuZa55RwDoKTHZPik5/QAGfaPisL9xZDE=;
        b=loGhqKdjWusjvt1a4bNYLq6lHgghKUuxx+BUr8kgqZErttXBat6bkedZpNOiNVIEng
         xRBUol5WVlSBMMMO7JRQJaC4gBpXFsrMIswaVmJ3mlbpGO241VyM3XV3yEN0OWD1HGgt
         BHWL10ZPwboEXmZhlBGa1GndcyY7+RVXFcskME0gsy5G0uDNgU8+y9c/sJr3p6lpl+Cx
         Oc1I98npaOJ5MSH/vruQ3Bzzn+3lh9U+9RSO0O+0rkKBhZuqPiBq7G6WE3CJJaYrKhCJ
         LOdimWceSP71i/TbwsPqF4ZdipgQGz0lIrq/fxNNy9p3XAdZdISlDkVbWQWq9eKtIBx9
         296Q==
X-Forwarded-Encrypted: i=1; AL+hErFUgU7VpTzHNfNeGA8GSdjrPaaskuT3sPoFg6o1cJTMYqpHx/Vq1L/q6gStstu0RHL6LFXD5foStgLIQe4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XQOGQr/DzIc6ac7m93GZ+m56UY1ch/EmAODPJYvK86U+PYA2x
	DwjuQbRHPDR0CfIdT0zZ6f87x7dnKQenzEu8oz22ov+Ub/V5BRRhVUnf
X-Gm-Gg: AZFdTZf8/rEvzUKQF/5lqQhY+G1k5iJSzTIKKpnDDXOvkKRqp2lF2BXuMyGMPH9zmOT
	Npb57CFEuwNKWwQQWGKP+JvIx5sPl1T4uFHG5SbY1JZTVNK/rFqdPk9t3n7z7DxVd6YOUPO2GeK
	B04MC2aHmGYFoMRba4DgCRejGr7A3JJWX2peFiLMVBI2xc1cFYWwBPC9+fbGzNrXa6qtwrKcjT5
	gsmA54kNOwJUriIm35YMO+nJFFQDss5ZUCuBc9pdWttNpEzzC3laHbsgTuNcKonnhnTgE9p3lex
	4aKwtfdUsCKNSmcIW0lcc7ItXzXKJ/fXk98s6mUb7+2nVfGQ70uhyVFq32gsctJw3NT1dlRVuuf
	erX2m5k7vQphHDvoJZU4tyLGnmbP1Bk1D0it8VqEcfG1aGAnpJXxauihNAG8DO4Zyak7Op/EMvZ
	3Nz9TxQDH/XuolQWty5346BYRqIQ4CQno1MPaIDfdldQb78QmaIvcIzXtaqdkJjUdNwoGRvTwIo
	NAk472ILKP7ByaD4bQ8VrZTKDJqKzT1l2q2dLYCJ+ZPj+/XKPxnoNZtgN3h3hnJ20PUnhOa06iY
	SwUevwFQf6QVC7q6mjhLzKaNcOoaVMnkd7Q9U4wwfCgMf+rEWm2dVWWdpBfmRcur75iZGxM=
X-Received: by 2002:a17:90b:35c2:b0:3b3:cf61:dc65 with SMTP id 98e67ed59e1d1-3b41c8debf5mr23812581a91.23.1795803384480;
        Fri, 27 Nov 2026 10:16:24 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c07sm39867121a91.13.2026.11.27.10.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:16:24 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: linux-ide@vger.kernel.org
Cc: dlemoal@kernel.org,
	cassel@kernel.org,
	vireshk@kernel.org,
	linusw@kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v4 2/4] ata: pata_pxa: add missing newline to DMA warning
Date: Fri, 27 Nov 2026 12:16:17 -0600
Message-ID: <20261127181619.183139-3-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127181619.183139-1-artem122novak@gmail.com>
References: <20261127181619.183139-1-artem122novak@gmail.com>
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

