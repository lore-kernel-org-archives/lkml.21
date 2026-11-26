Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729481;
	b=RMKZ3w33jSXsch9p/iQU6h+6u7QTF/3H2moLy22ZtNoR0LdeLPVSlmDbpDesGn8iBMjW
	 UgpgGOIh1a1uRobnGWkJPOzU138NPnTVCNjS+YJtLh27pckeo4ZC++5DF1MH2aquIpMcE
	 EZnChrDk6z5SGD80PyP6kCF2vxmrbAY0Mt0GIm10tewQDmltIGcSX0XcgzkT/GWHs2TW4
	 M485TUzJ7eKM7HZCA+MoBCgZ7IOs5eJPve+wUiOxP7yXWwE1bFB2ZDikwmsMflnJnDcFx
	 mDQ0cg3KLDjfHVNJeN+UczN3L5sovEue7ifVNcufXCPw+IlP8M3l5iRSPPMJnC786yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jYp66D5Imzo0CzQJ1wEzlIF7yj6HUJmIaReA3hk0gfM=;
	b=JK7PxIj1dFjHBVK5UF8QyU3fRAc39Gnis/WDV9SyKeMaagb/TGCDU8SVuHEPVNBJC9+B
	 cCMPi4DnrijBmCQ3E5rArS33LBUabRaa7RH0DygBNgfag/J7Q45Ft9hr2ZrITH0qQ10b+
	 bOSrYdWd4X2TVcNzHw9CRkhroRFVHwMsP9JfsJ20cD5cdF378mLkgnleMEu+eDcbeKKNy
	 ZqaMk8og6TE1h169mPhH37hVyP1ZnDE2mFMprRm7PiRdKyHxXcveErVYNQhgAalQK3ArG
	 cVKSQ1D/8ui1e39KDXi3uK1SAdjKCN3x2jwj3EnstYnp9gaQISYaO7PgZBRrWfntq1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MeXNu6Rh;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23EF606A6A3
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A23EF606A6A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MeXNu6Rh
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b439e37813so3861392a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729480; x=1796334280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jYp66D5Imzo0CzQJ1wEzlIF7yj6HUJmIaReA3hk0gfM=;
        b=MeXNu6RhMH6NtS5M10r6Sypbi8N2FkGKpNVlD1XeOIsDQI8CoVkff0mm3nvHXsO85z
         iRxVfe5imA80a1cHAyMvcc0B8Fp4vsQQftUdRVLYY+A7VrId56kngd+gFCYvttASUlsY
         e7Yn8NFSR8yx5UYgmSkG/JzNXSmpkwLOHWWLY72mloBO07VdVKkNgTH/6IO2VrXvQAu3
         OrOrHY41DUmb2lv6EHL9UT9Lde06erqR702VmV6dYaMgYR1cRoJujBGsLku7owxHbrP+
         lUSHfIiKEjgJnNofp1i6b9W0iSi0UmzXKM6BvJJJRZ4OGTMv7gW71NVOIVnIXTn0Wteb
         WwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729480; x=1796334280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jYp66D5Imzo0CzQJ1wEzlIF7yj6HUJmIaReA3hk0gfM=;
        b=YtoR6COecS9UrHtEA+YDepNPyI+UpkdJ0RcUFPA4XdPSLP5I7TZM5Qd9mtg/O9GQBw
         918m45sQpHi9Rn+erlfIfj5mixDCXsOcpg3gMPenjUZYyE2Mp68Cv9NMwg9sXT62kHQT
         /u3qwETT2E5OcvjUGLsJb3IxkI8BWENV0J5EZz5f75s1zdje8k1H0oGshualXaP9/5sa
         EIkY3LmzVrqV3Q6Kb6sXD7RWSA0qLR1fiGbvNtpnPq8tTtJaAYCyeNG9kqRUNwIxHPUV
         L9YYJeY+XMPCIis1gHloJjOlILue+hUsdRWjpgQnEVO9Ex1QzUNatBy+w3hnNlhctmlP
         Ibew==
X-Forwarded-Encrypted: i=1; AL+hErF3aybnyGb4FxBi4pK1bb+EV6fHf0w036du5J4xIrHVylq277YDkJ2CEpt3iF8FJPepn59YafKAn/Q5cD8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/3HkJuKIv3ICMbO8kiyv3PUf+yH7/weyuqal1H7pIz+dn9UdB
	7Oz7R77oGVdUAzpRFiAKCJ1Ht0B2Wtbmln3FzMxetTyz+HRKJJE5GVmp
X-Gm-Gg: AZFdTZcoLZfhUADs3runSsFaXF+kv4Gq5f35VHT/4IDGn74xup0Im0I/7Fs3RY751Z3
	KVKir0FXNYclXz7WhmrFQG843ozIF9gUTtfyd4Hi4mphbA/vY84kO7CH9ovPIOWHQUQbHQCn5Wq
	jY6iosTluihD2j6/kx9lXS+Az63RwbTQvItxICkt88/Xdy3rymp2sO42TVCNxLJE+OAj/5PxBN9
	bdiPGFEaCUwcCzyF4f8hXsQWUbxiVFYOWH8QAvqxK/lIYYSm52XutEMqypW10+tNcGnREF5uJkN
	903YAUkmHZu/fg+vzYZhuckColqIIUTIMRrFTtbxs76jWLp3cFIJo0f4kbuKFtw3EA5r7XFO1s9
	PzmGFBvbUuUMVvG3MTqm54enxWDfHVY8HRGxb1BcCsePfLnDDGeusqwf7FMvymhR3QboFHlsMR0
	v63mTSWjuHgJfTN1/8LpKbzL2rmJutiv6vOCZtkD7QhsTC59B8s/T0+CAAM0h47tA6ibb0RwVwo
	pfO7zpUZMvUqCOlOhh4nWmevP+q5B2ktA5iC66yE/x4Yl4+jTR95+j/LVmmIGn5E3CMtnTawAD2
	ctA0FsabX7XDqX9bGXfrTzPebZ1DkYXoHkbtFspqi6GDTgZmaQ==
X-Received: by 2002:a17:90b:498c:b0:3b3:8b61:c44a with SMTP id 98e67ed59e1d1-3b41c7d5c1cmr17865192a91.4.1795729479892;
        Thu, 26 Nov 2026 13:44:39 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm36176538a91.3.2026.11.26.13.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:39 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: dlemoal@kernel.org
Cc: cassel@kernel.org,
	linus.walleij@linaro.org,
	viresh.kumar@linaro.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v2 3/4] ata: sata_dwc_460ex: add missing newlines to error messages
Date: Thu, 26 Nov 2026 15:44:32 -0600
Message-ID: <20261126214433.38317-4-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.38317-1-artem122novak@gmail.com>
References: <20261126214433.38317-1-artem122novak@gmail.com>
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
index 486ea94a0184..c2bbd991a460 100644
--- a/drivers/ata/sata_dwc_460ex.c
+++ b/drivers/ata/sata_dwc_460ex.c
@@ -421,7 +421,7 @@ static void sata_dwc_error_intr(struct ata_port *ap,
 	tag = ap->link.active_tag;
 
 	dev_err(ap->dev,
-		"%s SCR_ERROR=0x%08x intpr=0x%08x status=0x%08x dma_intp=%d pending=%d issued=%d",
+		"%s SCR_ERROR=0x%08x intpr=0x%08x status=0x%08x dma_intp=%d pending=%d issued=%d\n",
 		__func__, serror, intpr, status, hsdevp->dma_interrupt_count,
 		hsdevp->dma_pending[tag], hsdevp->cmd_issued[tag]);
 
@@ -498,7 +498,7 @@ static irqreturn_t sata_dwc_isr(int irq, void *dev_instance)
 
 		qc = ata_qc_from_tag(ap, tag);
 		if (unlikely(!qc)) {
-			dev_err(ap->dev, "failed to get qc");
+			dev_err(ap->dev, "failed to get qc\n");
 			handled = 1;
 			goto DONE;
 		}
@@ -612,7 +612,7 @@ static irqreturn_t sata_dwc_isr(int irq, void *dev_instance)
 		tag_mask &= ~(1U << tag);
 		qc = ata_qc_from_tag(ap, tag);
 		if (unlikely(!qc)) {
-			dev_err(ap->dev, "failed to get qc");
+			dev_err(ap->dev, "failed to get qc\n");
 			handled = 1;
 			goto DONE;
 		}
@@ -707,7 +707,7 @@ static void sata_dwc_dma_xfer_complete(struct ata_port *ap)
 	tag = ap->link.active_tag;
 	qc = ata_qc_from_tag(ap, tag);
 	if (!qc) {
-		dev_err(ap->dev, "failed to get qc");
+		dev_err(ap->dev, "failed to get qc\n");
 		return;
 	}
 
@@ -1186,7 +1186,7 @@ static int sata_dwc_probe(struct platform_device *ofdev)
 	 */
 	err = ata_host_activate(host, irq, sata_dwc_isr, 0, &sata_dwc_sht);
 	if (err) {
-		dev_err(dev, "failed to activate host");
+		dev_err(dev, "failed to activate host\n");
 		goto error_out;
 	}
 
-- 
2.56.1

