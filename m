Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804954;
	b=G+Y70vQ7ZTvX4qaPyB8GfqW2C6EuBACIYS4EU4CeL9iFcmIfH4NKrxCl8hnOtY4ACFya
	 gCWSsM4NqlWYJBZcKG29hyyMnOsC6E0o0b590ZbJaS+z2NqHl0+7n3xUXWmrC5seqElzQ
	 j8jmfhiqnsiaRUR62I1JXBHKpj8QZdgeNJ8SSuI9x/mX83Jst5d6aqMeKJKnWIhjVcQ7s
	 OotlXmzChlcKsgIwbbPo9/NXI9WXFoji2AsFdXBdxaZ0XZjqvw9lvqNWFa/SSHqHICeYp
	 T/5VIFn8s4mL+WKKdLvCGr88yqndlm8ncjMQRvEe4xfYzzOpOTMQhA3u87Fg0ycXTjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=trsewjbIKbhUgCdmXW33WeHcsR6jqk0XdT0hQ+HExeY=;
	b=S2DwxKttPeaJ7LXhsoGzZujbmz/w9ZkQ1zjZylsse+WdqfzXIsdbIgXPNrEVpzqI2Yti
	 hikO78FCuhmJhbTj5xEQVZ5gorVKv30xLaXio4f2tM96tKv12rvreKra+AF9BkW8SMVen
	 Sbe65jPDFXcL1MaOoZVXlOvZcCLxTWympYYoVPcjWvyqxf1AJES7UVVWygV5akEKUsfo6
	 qTquU4vq40A46dPJY6ZpErGb576zN0Z2Nd0bwMdZRprMpJUs/5YeWrFAddPOfZWX0UdpR
	 nLQL3sYsXSRpbmbsJAu4hTgbg9NOKqnB2ksAhHOhBYcp8570pYevZe0lc7hXJ6lTfbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qkXzaT5j;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F024606A69C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F024606A69C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qkXzaT5j
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b4cd193b50so2524047a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795804954; x=1796409754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=trsewjbIKbhUgCdmXW33WeHcsR6jqk0XdT0hQ+HExeY=;
        b=qkXzaT5jiMlZWKoYgPzl1d7Ks2O2rAVN9ON61o/q294Zp3Pvui2Hrsn2r07Z+7jiWs
         q3xqPjC7iWEaHP53sdX0NZ/LQcVRglnUvVnKMXr+LB0DNXOg//sGbFwRCpOS4nLpyxWA
         LqbVPsU8Pt12sp/Vhh8Rn3Slt3bJSNyPx4Zg7rWE7HvnqbH+oOq6clUdB1p5T8OkY5ih
         vgZI8WY/KWXymMHvm4pNxur97CHVxkr84pfHhSlv2r2nQWnGVJpxkuoI/LaoQIeTsiD+
         5nYCpTNIGw+uUYokaUvDK3cPbAzL/T2aoWznFtQWeRnnZmGJ3dadR5cw5BawMj5kacRs
         vlzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795804954; x=1796409754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=trsewjbIKbhUgCdmXW33WeHcsR6jqk0XdT0hQ+HExeY=;
        b=UZag/rJ2irpX1iEc4RhmBJK0HO+r6YOE42oV+8MDfX6z8+FYvHEdGzk+ZNa46pmfYA
         86y5C831zPCHZA3dK7b1SzQTgN7upXN2CjV14uw+Df7r4kUj7MV8aisDd/TtkDp1ChkP
         aYWGNWaPoqNDyrS9zPF2T6MeA3k9d8zPwQ/vwUjQghmv0kL+4GPi0WxpsVkAc3oVL2sP
         9t4MrP2emBkYQs+tb0r5JLeDDpVpuovI8FNVkMw21FmHbt8rDOBSxdWPpTsu/AuojDwJ
         yLdY7KYnRRZzOiEAhXWjfBnw5T/erXOch148iahlXoZyiVaKB0HZvN1+fgkgVDJ3zhDt
         ftBQ==
X-Forwarded-Encrypted: i=1; AL+hErE0OM//Bnpg21AV1M3revfvs3/D2+4kxmhOlsO7e+73b8Lh0/6dZ47WTou/0wa2NhkG47pYQIIr64d1sAI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UStKimPzhf7xr8tyDuVeHqmQs6yz65NnzQ7sSaJezsTh+u0no
	ojC9L9RIw0Y4+ZFi1ZTLWU9hkXWyWqPwn+ueEXWsbGJaKyDk0E0V7OXR
X-Gm-Gg: AZFdTZf37hrA3tR+XczU31hoJikWuY0AVRLIUa546o6NR195OwYp/CT/JwKWrvfp6Fv
	3wmuOsxaeY/tIIB8xX2Ae4t7tEr1VcAXbREvakSZo06+TwiilnLOltPcCsuj8hSiREUVVlhBwB7
	lNXOMkUrDvfBHvr7zAZno0ezCpUN+ESHHTaA+VE6o4jREab2gytB5as9N5c9N3IFnUaviFyHuN5
	b0UZFdRj5RejA/AX0AeW0RzMECSrjCzrn5iWsFtxB8Ju02u0keGxLAOt2e1oHzDC9hUtMKQ8i4o
	pnfvo2fae1jQSRbprPPpVmXaMWbrTCE6laVJRd9O8WXMbyobD0E5vDtj/kGlEw+U8rU9AkkqMbw
	elovjin0K13u54gfSIIuVLBpu1R56E5/jRHrL7pXRZecXbZRO7CVTLODA6QQIvq3IhZHuTFktpy
	BvAECGItivddhZWY3632pC4ZlI4vjtIug8Ig72qINfI3XZHI28b9CkotJzosL7roqIlm98ma6bp
	qDEuJyFVDnQckmyYugwUjbWVFb9+Hjbn43GckQZzZAAeB9waMoBSqi5sMsAebNgZO24MOzP5A5W
	qDSpEzhZx1Bdf2x6Jxk2xMLCiBcdqd0a+sJMtw5zle143ZrS/g==
X-Received: by 2002:a17:90b:5847:b0:3b4:6094:2fad with SMTP id 98e67ed59e1d1-3b4609432acmr18849073a91.48.1795804953683;
        Fri, 27 Nov 2026 10:42:33 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4dfbe54a2sm19149071a91.17.2026.11.27.10.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:42:33 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: artem122novak@gmail.com
Cc: cassel@kernel.org,
	dlemoal@kernel.org,
	linusw@kernel.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vireshk@kernel.org
Subject: [PATCH v5 3/4] ata: sata_dwc_460ex: add missing newlines to error messages
Date: Fri, 27 Nov 2026 12:42:27 -0600
Message-ID: <20261127184228.185827-4-artem122novak@gmail.com>
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

Terminate the error messages with newlines so that subsequent
kernel log messages are properly separated.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 drivers/ata/sata_dwc_460ex.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/ata/sata_dwc_460ex.c b/drivers/ata/sata_dwc_460ex.c
index 4ab378d2c26f..c05dd172f75d 100644
--- a/drivers/ata/sata_dwc_460ex.c
+++ b/drivers/ata/sata_dwc_460ex.c
@@ -420,7 +420,7 @@ static void sata_dwc_error_intr(struct ata_port *ap,
 	tag = ap->link.active_tag;
 
 	dev_err(ap->dev,
-		"%s SCR_ERROR=0x%08x intpr=0x%08x status=0x%08x dma_intp=%d pending=%d issued=%d",
+		"%s SCR_ERROR=0x%08x intpr=0x%08x status=0x%08x dma_intp=%d pending=%d issued=%d\n",
 		__func__, serror, intpr, status, hsdevp->dma_interrupt_count,
 		hsdevp->dma_pending[tag], hsdevp->cmd_issued[tag]);
 
@@ -497,7 +497,7 @@ static irqreturn_t sata_dwc_isr(int irq, void *dev_instance)
 
 		qc = ata_qc_from_tag(ap, tag);
 		if (unlikely(!qc)) {
-			dev_err(ap->dev, "failed to get qc");
+			dev_err(ap->dev, "failed to get qc\n");
 			handled = 1;
 			goto DONE;
 		}
@@ -611,7 +611,7 @@ static irqreturn_t sata_dwc_isr(int irq, void *dev_instance)
 		tag_mask &= ~(1U << tag);
 		qc = ata_qc_from_tag(ap, tag);
 		if (unlikely(!qc)) {
-			dev_err(ap->dev, "failed to get qc");
+			dev_err(ap->dev, "failed to get qc\n");
 			handled = 1;
 			goto DONE;
 		}
@@ -706,7 +706,7 @@ static void sata_dwc_dma_xfer_complete(struct ata_port *ap)
 	tag = ap->link.active_tag;
 	qc = ata_qc_from_tag(ap, tag);
 	if (!qc) {
-		dev_err(ap->dev, "failed to get qc");
+		dev_err(ap->dev, "failed to get qc\n");
 		return;
 	}
 
@@ -1187,7 +1187,7 @@ static int sata_dwc_probe(struct platform_device *ofdev)
 	 */
 	err = ata_host_activate(host, irq, sata_dwc_isr, 0, &sata_dwc_sht);
 	if (err) {
-		dev_err(dev, "failed to activate host");
+		dev_err(dev, "failed to activate host\n");
 		goto error_out;
 	}
 
-- 
2.56.1

