Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104113;
	b=GWY/0D0lZZldy5JZyjdJf9nPwFGmAk/0LCGvOzVYMBkcnYZtDikSkcf9zzX+PqBgqPSE
	 lGaP5eYVlo6H1B3j/zE5RbjVJQozpBnVCVZoMeVtzFFXncD5vWzXjBYZjSgdlEPLLaUm9
	 u46AQK1cJUhmAzjWrBq4LDQZE5psmrxwCYvo/wHS1aaRkqiON8Issu7P9cvrYDLNTkvMB
	 15MafGTDkhw/1whTvAaHufh3gX/mXO2PGUL4Omy+g5vY8S7+oaoiCkrLJr049htUwvGhl
	 4IMqKy2oNBFquFrwMr9GcsXbT9uKO1rOz2lIbeHgvGcSgoEWm68Tc6Pimxw+YpgZPPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=euvHppXysFAeHymgmyGNBpfWO5+extXbAkR04f6pvro=;
	b=SpGJgoZwUaNMMFhIm7ZSOO0mlBxLwNAwXsLXnlOFLJu0Ms43bq4m+TtP+sMyTS0ZY1Xl
	 9+KzX+k/8Rb08T9j34mf/PNkSqDzLorMY1PN5bUo4wjCX67A4XTy2IYFwdOdUQ/iaR/9I
	 kbI9ND4qiJuDTZWDrc7Sz5SxILbGoSSHVM1RK0RXtH5xEn8j6WcguUJSPdJgzhYycmqe5
	 68Mwt/FgSBwl4pB6KNz5oMuwIUxQNy4vXySTpakru/yQx7hTGw2R+OuPE6gUsKnUda44s
	 3XXqJxM4eOjsbdWBfmnkcAQObrRzcf3lgdArkSylCAgpPYm9io+CaCPYgZmV5ulY/zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wGGCd2Ez;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F0E60A262D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10F0E60A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wGGCd2Ez
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b4f4095a7aso22649567b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795104112; x=1795708912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=euvHppXysFAeHymgmyGNBpfWO5+extXbAkR04f6pvro=;
        b=wGGCd2Ezptp6rVA3z5qs/3fWDsqW4j4+oLPC3dAsD7hPn4cCzRq/EeiC0pV4Njb/3N
         Mse44Gw9BhKCfppcVj+8Brl/wgbxhJCzEkb7VH6wa0gE8JEU3QWrVNkMk1uNDX+kvPQU
         LbcNymDnne8iPNHsIkk4qGvsLOQ0LLbeZXsHSPhEP9B8hgd/QhpwBm1tjUDpNlnXPZeY
         pp3XkIQYbAW7zKbqQRmClC7UdzxmfBSGH0ZnwisIlquPSCwBVwA4tOlsl5Qu8r7SuGUJ
         8dg2R+NG666Q618FSy3JvNORiC7Qw1G8x4Oe1+UDXFjCmyrWIzAsWdMvXDCx0gcpFyfe
         FTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104112; x=1795708912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=euvHppXysFAeHymgmyGNBpfWO5+extXbAkR04f6pvro=;
        b=ORdFbAe1ZrHA66V/s+OXeXJ/U9/r6kEm4RKPyllxPiMmXV2iU1nyd9gjl6+lNWBMLg
         FOpPqwoIrFVolME/40XnKpjtHRcN07oT5sGc5Hy1b3GC5I3xSGNK+z9qdr+u5OotMmbg
         +ZACEmCL+T5Igr7M+czIaiPfiKlrNjvTDOxRWU1AzxwuKL8UWitTldJHR/TzR//JZAau
         SR1QXYE/HPneTY+VxftimGg1dw0/iteSiz17YMfZiwciip1qSkmRAygC/EFUC2XjENF2
         GxShjVJ2TA48lkstWcC8qOhw5eVAst0RyiK8IFdywY0+NID/cTqYAzuhhiPr2zK5iNUO
         U8fQ==
X-Forwarded-Encrypted: i=1; AL+hErGXQIAhcoue9iVj/KSiH6zMYMG/aTXUvxN7HHzoluG9+yquDqo7a26YnRNCGC3pVTOmjDQbuZRG7wtKKGg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JvJpvc0RCLsNi9lQRhcS20Hp+2KTb2VvVJ3x/R9XufmfHdJ0R
	eNn0Y9NRvQo++F8xKwQJZDQRDj8eLJ6lGXZRAMJqH/aNa0ri+XGh/nqb
X-Gm-Gg: AZFdTZcM94Ao3zb7Mru3w6Wtzh6MD+rI9OyOrS/pMrAelcYVmVdwCDBIrLwVsBGoVCs
	yOn4zV3BD9bxp4dRjaZKuvWun5U3DLxsM+PE1X+SQaN4DWelV5FKdo3rk+p2liB8tpvmQpdC+Gf
	p9eJOzbmJivAex2cQAsnXJDznyf5y8gHZxQ31xCooCq+dKgANMxaQa7kqM4JmVXAa7ZCUEE15U5
	qz5nWhiMyxFc9yHk0jLJJWW2hq/GQgHsHTw+UDT5ZCB8cLuc9G+PP9GXbUHYJCzWrUzZVCML+Yp
	iTFukqUSJ5l8V6nJW7FpHNNwSDSQdTgGG/CtFwR5VP9WaDLNg4hEUEjkgrYz0nPutivu1JNyNdp
	eFoJmJFBdmlhhUDm9pXVhvnmn9ZOjd8EQQZZIewWHw69Zq/g24OB2RQbrrcDN2xy6yd8RsEMNQy
	QM2XPBkEaJGsyxHAPi7NHujHqq283zRVumsKEWX3TRHmXhOkS5zPjFg9arO6G/xc47L7XTsmH9c
	5IdiT2Qhnh+XQO4tNg898LEKki6eUC4SpkT5cyhF5rYFqA75TkJLdq5ZteGbylcob+UontzZdkl
	9rPg7mlitqJXDktgt0cgPgoqiAYbM95eTOUqrwFPC6aRYrfhfAJQ64bI+aipRRiOaYWdDBfmyQc
	6lgKlI7q8AuCTk+uQD6i+o56tcaHTlkSyUc6uux+tK0Swb3XjbcSLDlG/fx4Suds+7gcTlZ5/Mh
	6oe0coLZFnSCcDrzKEDljPS1bzy+JobO9PjMM7mNaya8JH41zS0P8=
X-Received: by 2002:a05:690c:31e:b0:8b1:7072:a61b with SMTP id 00721157ae682-8b520496861mr836737b3.22.1795104111812;
        Thu, 19 Nov 2026 08:01:51 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52031aa4bsm623267b3.34.2026.11.19.08.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:01:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:00:59 -0700
Subject: [PATCH v8 4/9] dmaengine: dw-axi-dmac: use atomic polling for
 suspend acknowledgment
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-4-f8e7fe60594c@gmail.com>
References: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
In-Reply-To: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>, Baruch Siach <baruch@tkos.co.il>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.17-dev

The pause loop delays after its final status read, so an acknowledgment
that arrives during that delay is cleared without being observed and
the caller receives -EAGAIN.

Use read_poll_timeout_atomic() to check the status after the final delay.
Keep the two-microsecond polling interval, 40-microsecond timeout and
-EAGAIN return value when suspension is not acknowledged.

Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index def591fc75ce..8c115d20728b 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1219,7 +1219,8 @@ static int dma_chan_pause(struct dma_chan *dchan)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
 	unsigned long flags;
-	unsigned int timeout = 20; /* timeout iterations */
+	u32 status;
+	int ret;
 	u64 val;
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
@@ -1250,12 +1251,9 @@ static int dma_chan_pause(struct dma_chan *dchan)
 		}
 	}
 
-	do  {
-		if (axi_chan_irq_read(chan) & DWAXIDMAC_IRQ_SUSPENDED)
-			break;
-
-		udelay(2);
-	} while (--timeout);
+	ret = read_poll_timeout_atomic(axi_chan_irq_read, status,
+				       status & DWAXIDMAC_IRQ_SUSPENDED,
+				       2, 40, false, chan);
 
 	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
 
@@ -1263,7 +1261,7 @@ static int dma_chan_pause(struct dma_chan *dchan)
 
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
-	return timeout ? 0 : -EAGAIN;
+	return ret ? -EAGAIN : 0;
 }
 
 /* Called in chan locked context */

-- 
2.53.0

