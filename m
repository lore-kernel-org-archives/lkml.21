Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795295114;
	b=oF+KpBMZwaUZzOj3ed8J6CFaPMi7MVXjovxFU3nbnhLyOhwE9uH/czWfwO8bq+MDfpMo
	 gzDx7VHBeb8qPTwnEqiNyEnxHVU9PD5zb5opz7HKURhzPtpENygFVpmpLGr9nf+K+UYaF
	 ZlBEPU0bh2auKtEQCfDF2YNpmUubjzHAYuzAY/z4G7pI2Ue051XdIL36cvNaN4nh8iINy
	 XIVqEZdxaf6RhvjBYgpc13wt/mHTiGdn8ubwdV+TC+xqRjrDAtEyL8cStj5N2dBlLFUc5
	 Q57hhXXd3ydbRuD5K+96NG4UKWB72lw5tYCRdwh2T2hIcH65xu2fj/klFnlaKS5FZJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795295114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=NQnbPfOzKZsGZYbWuagccx5bm/OCUTvNG/34f4erQB8=;
	b=T7ISGhvSINCzt6M/Ctw06pSaDsx/c6dRBpata/lg7wQ5O68kJWt/p6mg/66uS4txrvRo
	 BEhwpGOEifgbxaAuDByi9KtSY4JtFn/knucSWx9fL6alF42QgR3/G4IEUmr43kugshB9A
	 zu8Vu4fWLZv0BOSvHhcc/SB+6n2ddZ7LuxnHwJ+k5eQ0kjZ0DcxYlEnWhf9WfwYfPSNSd
	 pz8iqGhBbYZGUmy4GjUB7AWsin7QApQv+3AwTcMSO0zBYZ3AXS9HGiIYKxwuecTnqww/e
	 ASjyo7JJ6sZrxAUO3DS/f+bWq/xhU/Uc6+oLI8M0D3ieHBCnWwRDnlo9fVf1+uil1pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IX7vznIL;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79708606A68B
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79708606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IX7vznIL
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-843cf077f10so2893491a34.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795295113; x=1795899913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NQnbPfOzKZsGZYbWuagccx5bm/OCUTvNG/34f4erQB8=;
        b=IX7vznILkd/CCVxwf4ciGJ2ED21G+VQpoY0/+tApV8+6vFo9BV1d6XlU9m2qYT9GZB
         jQ/J/iUxKWfpcq/LOwOJM+Id5MOyF0c+1zH0hgYpgnOkLPgwQ82Ky6YrCPcU89Rb6z6E
         LmX99YzDz1KCdkIIjjqBK+nq82jrRsCaxvlqKWILWmssSEElKScn6+/5xNRM7BEX4YNi
         wT/hZ7TAEqYIyprnRFra37qMWRfHx90t94makB9jOvKD/0E7tTbZcjcURQJ4hStg5E6q
         mbQqgqY32MST/9pW3kKW4FZHXllcQDZB/ztUBNSsC1vcbrBMkvfvXy12J6Y6GlHYl0c0
         K00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795295113; x=1795899913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NQnbPfOzKZsGZYbWuagccx5bm/OCUTvNG/34f4erQB8=;
        b=OelgXUUiqQfNETUFD9c96ltuzRZxzDncwLSytCgQWthNFGdSWUxeMRrNzcskOZPhy5
         GfQKh+3LMjVH595LmrveeF+xxGacP99fPZsyWKRIAtzOoKFl8GFuOQMEEismr25XDgeh
         wsj73dXW5v9JNdP4Vjiv58re+tCBlYZ7GmHoo6BNb2jtT1s7Byrt0CnbR61wGXpVYE7d
         +sxadwUHcpk8FRz22KZAVWQ2mPq0YYAysepWwq8hG+0rLv++sBAY6h2S7BZqej+sl67i
         KdGhnGotEs0NM5Bq7vdk6NkNk16P1ocX2BFyBTCNhOxarNRpn7nbakTslRMvnuV0/vVy
         xWhg==
X-Forwarded-Encrypted: i=1; AL+hErEyUp1VXV69BulCfuONqgJ4SunNJhWE28Hv/xx15E5BHrD95SF9ltrVDfbWEuuujHVb6KKgJg+tOlXMjWA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qh+yWXl7fdirYD7TjxbO0cyrJEkrW/AudtSI+kmxfVn+l+9iL
	R1zeif/eyhf9Uz0dW99APZpXAPQAzMJ4pcdIwUzBeK+pouesTbj6F0Yg
X-Gm-Gg: AZFdTZfHRUJJE1e8O+PK+XHKmXgkIrZXVmMS1NBsLGAoC+aS2gXweRcOkURMD3QcIuW
	yADeqaguIYgj9hXPvz4f+YPbzhT83hIwJTdkVzwgAqbtM3vIc7f7XBscgVsXELBQcGDzgREYoFb
	A4HiVm7o1mE034ZKs3wUaT+xDsK2dFYC3v9hc7Gd07YshYFe4GArhSBLP2/cGaQM97EUx2+BZYM
	uYZi0vZxo/fvneHRvlUvKASNoXTvRBRE/qUdM6tfL5xjkelpx6yY7R4QYxYeKRJX4v6YT3OgSGm
	MVj1w3XytJm2p6f5VFhtVI8NJslz1COrzhibrtTMihY0Ns2EZsondrUpd230P8YWmOs7j2z6yNI
	y3Mn6HRWMHVY+NL48Dnb1PkifnyXUnMMNavxdlL/T7kof9fzmWmdirWUwb22/reEcwM9KDQPqvZ
	YlGEHH3J24NHmQnRIef+I8VRJQX6sPHwGJNaqTHLQy6Q3cdmv/60LMvwV18DIDC73zj/vpJ3RJG
	kr3AaRRZ/RScieIMHXMsfUU3fd6RmF4/Slkgq63brCJRvN67nKcAuryzYMAWOBW5vdxMLefcw0g
	ZflgaVreSzAYmi8VP6mgleMNFibr6D/oA+mZoeXE/br21S82r4J9V+T0FRybCSFig/aoWp1S+x2
	/Af+UtMFqkVgT/ccP/4UuK1LXikENPuuozfTTuJWQr6Fp6oSOuE/lUn7lF6KrJmoege46mxuJUU
	TDbPJFVhEoDCobh8TmGI7TvstoRCZh6E5GDzXKRyBYV5p+zsIwpej3
X-Received: by 2002:a05:6820:570b:20b0:71a:d8a5:4d1b with SMTP id 006d021491bc7-71b3947aef8mr4275597eaf.36.1795295113480;
        Sat, 21 Nov 2026 13:05:13 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e4a6dsm4635728eaf.13.2026.11.21.13.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:05:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 21 Nov 2026 14:03:22 -0700
Subject: [PATCH v12 7/7] dmaengine: dw: report residue for queued transfers
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
Message-Id: <20261121-submit-dw-dma-synchronize-v1-v12-7-f51eb635209d@gmail.com>
References: <20261121-submit-dw-dma-synchronize-v1-v12-0-f51eb635209d@gmail.com>
In-Reply-To: <20261121-submit-dw-dma-synchronize-v1-v12-0-f51eb635209d@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev

A submitted transfer may still be queued behind the active transaction.
dwc_find_desc() only checks the active descriptor, so a status query
reports zero residue for a queued cookie even though none of its data has
been transferred.

Search the issued and submitted queues as well. vchan_find_desc() covers
issued descriptors; submitted descriptors need a separate lookup. The
status getter already reports total_len for a descriptor that is not the
active transaction, giving queued transfers their full remaining length.

Fixes: b68fd0976286 ("dmaengine: dw: move residue to a descriptor")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 302ff591cde0..88c14575a604 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -944,9 +944,19 @@ static void dwc_synchronize(struct dma_chan *chan)
 
 static struct dw_desc *dwc_find_desc(struct dw_dma_chan *dwc, dma_cookie_t c)
 {
+	struct virt_dma_desc *vd;
+
 	if (dwc->desc && dwc->desc->vd.tx.cookie == c)
 		return dwc->desc;
 
+	vd = vchan_find_desc(&dwc->vc, c);
+	if (vd)
+		return vd_to_dw_desc(vd);
+
+	list_for_each_entry(vd, &dwc->vc.desc_submitted, node)
+		if (vd->tx.cookie == c)
+			return vd_to_dw_desc(vd);
+
 	return NULL;
 }
 

-- 
2.53.0

