Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991715;
	b=Ii8ho6BZDWaH3vaSP1F8AoOwvP55MmLmv99bVXSmf77s7LJK5U1uL5bAps6LmSEOVUGw
	 k5rCnA0JdSWAdaUaa0eaX0LFtmZsAm91+job5YjqsM5cnOry6fWGx1OkfubEuGuJxS0Yp
	 CiZI6RPAjWrb9K67f3hS+lfbJZYVzJQRVbOYwQDM0ctdxe2MkTByM9qiti/HdQd/DvMEo
	 k2UIvErjPW0ouEKk1sIWVPxJBGqch28rC430lz3JH+5dsRb5e51yobNn8IfV8TBkMRNiS
	 2Qc8/gEfyjwyYAby9wEYWOE3uZWiwzbDIGAvfKJruy7VyCUbKTetvwmpZtFvFZ1ee7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Q+ekdDiad6PVYgqJZBRpDmNvdoTyRgI1QVONhVWIfvU=;
	b=4immTKIgXHT4ZPYiFOyZENiv7m3Z85CxGxvqbjWow2Tox9royzM6DArKYv77jJliyiXI
	 Koh9jc23xqonPlAQuFAQ7yJeXXzql95QTcAHKg9UKXERkbX7C8wrzh+r6c60atUq+pJva
	 xnIeuvcC2VVi2rFWTXQb6SKKs3/2RtpG4QHHUCTnXnRspPOEXUetMYrCU7UJWvIHGAZRQ
	 4eXOoJBbvZqY5jIexgGIL/NeKFLF2MmegWHzKd60ajj8KSKtBDlKJYNLY0QL4wTo0sa1K
	 b2MeS8GNFgIKmLJ5NqaIH1ar1XdWWAX7u0wjMN2pIEoZDFYwfVYJfqQIS5ovNFgTs2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LRYHGcb0;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D878A606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:48:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D878A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LRYHGcb0
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-ccca948203aso475535a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991714; x=1795596514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q+ekdDiad6PVYgqJZBRpDmNvdoTyRgI1QVONhVWIfvU=;
        b=LRYHGcb0BVwaI4rBkAYGfCcsjbX18pmL4QUbFXyJ51hzJABmXTJXeCsrQgitXrR2Qk
         3luxGHYiaGK1Px/hZUXlYx8o2KlAFnWcqDOIeFue8mMxAJGcAQywoRqnMRERXRhrKby4
         9lc/UY4A63t2KrvRwTKZFtp950YXVd1UQtlAK78fjUB8AdMPASPWvay7ahKcBsJf1I97
         YyM3blXYiCFzFdRT6mKquVAfQvH0SaqZuWXLW90ZEO7h0Xt8VGnG0Rfg3DjVr97AA7KM
         SoyqQQOer6DSvq6hRCX0OuGQ+PUGXwjfI1jQ5MTDe/SdnOB+r0wBK9hE6ghxcqK2hunV
         Wfow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991714; x=1795596514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q+ekdDiad6PVYgqJZBRpDmNvdoTyRgI1QVONhVWIfvU=;
        b=0oxN/q30moQs/h2E/eNY9Zz3YL/ILJgOCQf9ClAjokuPm6+BMlL5NabV0OF32eKwkT
         YLfwc/fyblMziOH49lBNnCp2QdwxMCTI7Zyi87ao6nlg/Ps9W67orZsc732mo14dA7sA
         pq2/IMPhFlQgfr/XPV5wWMnXl/Ug+LTL9MvrRCRAisaej+Hxq8+VaAsxogeIaBCPlSP1
         +cO9/QrDoyH74FOcut5jbJxk0I4pqNhZgjI6/BpTr3j7Xvz7IoARfslD+ye8MN1lUyTo
         arDX+z01M/k+DfFksL19siGDGWTuvbSGWJsBGjYrFgv4qLNVUd+s4AFl/korm15v10Cm
         HruA==
X-Forwarded-Encrypted: i=1; AL+hErHxa7H4wIsxGLqJIEa3fnDg375PBVkyh8Eh8ve/vnYL8sV1jfGUcskrhuW0xUvfGmppQ8J4bn4fkIH3pfc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GatQoofaxu5Efg+MlkizJhVI8B5usv372m6OV9hVbj5BmzvMf
	XDNOPlNjDRVJ6/KJ+THH7e75et884/QpMuxy5A7KWBoTWAfitmPb9afO
X-Gm-Gg: AZFdTZduS3r1DFYa53KCLiTkV/MYYm+uW+mknId7a+Satk7feSJyMscgHFRquZY9VUt
	lKP2ZQ+xXekiCN7R7rZL1QPdCERBX7k7GEqwLJ2Y0xaFc+6NX7M26bsLiTMOKq7kxsoa8IaPqZJ
	Vir1wrVobi6dIK1AojclVi4mH94FDBXbcJBJnwFrWgN8apJZ2vDfIBSvN1WDaQNh9guR//RuzaL
	yaYKqjW2myHAm48G/6htGUnELCRakcq0h7AGUeN5DgPYprYvVWAzgxw3wGjWLrBoPCn0ADgR3P3
	euzmWrIxTPtSNU1LVUaO1Dw7StB+G87nHJTYB6rSRsUyfMPvZDA+fXpUfhz2Fe3W3pGkZ2Muj4V
	z5yQG1SoJ8uIRkEimcvNxy0AbyP22jb6BotPSrON/ZVQM37lbA/e58bT6BrYBi7rqlj6iJjy/oS
	brfZSILeRsVE6xfeSGosQaZfbKT7lWCUlR5V2bUJ+t8Qov/XRT63IZiQAIfDi0jDu8eDbJRmIuC
	BMuKrAAm8tOgmv/hBTer3yf4/Ebqe8ah7FpOb4QxWPPCYrH23GFUAkJJS/fZ+j6lYPr60V4udSW
	BFQ7UXHMoN1rzLZPmSzdFow4Hd3ht8SI/gJAMzKayhXXMXG+
X-Received: by 2002:a17:90b:55c7:b0:3ae:521e:767f with SMTP id 98e67ed59e1d1-3b3d07c6895mr1757056a91.36.1794991714172;
        Wed, 18 Nov 2026 00:48:34 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d56ce9c4sm1079581a91.3.2026.11.18.00.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:48:33 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Eddie James <eajames@linux.ibm.com>,
	Ninad Palsule <ninad@linux.ibm.com>
Cc: linux-fsi@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] fsi: master-ast-cf: don't sleep in reset_cf() under local_irq_save()
Date: Wed, 18 Nov 2026 17:48:24 +0900
Message-ID: <20261118084824.936702-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

fsi_master_acf_terminate() calls reset_cf() with interrupts disabled via
local_irq_save(), but reset_cf() uses usleep_range(), which can sleep.
That is a sleep-in-atomic-context bug on the terminate path.

Switch the two 20 us delays to udelay(). reset_cf() is otherwise called
only from process context, so the short busy-wait is harmless there.

Fixes: 6a794a27daca ("fsi: master-ast-cf: Add new FSI master using Aspeed ColdFire")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/fsi/fsi-master-ast-cf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-master-ast-cf.c b/drivers/fsi/fsi-master-ast-cf.c
index c3ac76bf7e97..787464c8b7f0 100644
--- a/drivers/fsi/fsi-master-ast-cf.c
+++ b/drivers/fsi/fsi-master-ast-cf.c
@@ -690,9 +690,9 @@ static int fsi_master_acf_break(struct fsi_master *_master, int link)
 static void reset_cf(struct fsi_master_acf *master)
 {
 	regmap_write(master->scu, SCU_COPRO_CTRL, SCU_COPRO_RESET);
-	usleep_range(20,20);
+	udelay(20);
 	regmap_write(master->scu, SCU_COPRO_CTRL, 0);
-	usleep_range(20,20);
+	udelay(20);
 }
 
 static void start_cf(struct fsi_master_acf *master)
-- 
2.43.0

