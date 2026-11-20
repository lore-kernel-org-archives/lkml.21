Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190506;
	b=4Nug8jedVPb+3HI7tA5cs7Pwn7ftJuPmAYUDgDKE+Ohq7Xra6Jd/LU+V8JZspX9PWo24
	 PPj15Pzwcaz1epA4GkC90cQ7H4jTI672M2UBbIrGqQzc+S0uxhcB0KgN/HNx/2Cxjx0UN
	 Jz2dFALZk0LSKcg+XwNK23DzcV0AC0bIeXoUdGWsHAYrM23vdkjIIoqP7IFMM7RfBO80p
	 nHmD+zGt4JBbACQXnD1UF1xy0IZBdOZ8afqU99scJu0NOYZfTRnKmCUpOrEinepASSKSI
	 fLw1BQR9VZUn+54dVdM5vJbPJzghRtkYxwkdzF5SI1Gx8ZtEJIEc48AXnaqD+szG0yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=NtVw7HJE+FU9DI3xWpl8Pyt0L7yMJpDS2sfT356C23w=;
	b=KNInMN0jnBbBKLi1rIILkNzmazmJ6yrtofcsWXRb5OcbnK3FsPjhlxrQS1rtdBfhdC0H
	 vL4zDZBaNYX/ublXmrIW0RY6Hc/HofrIIA8J8Jt/rrndTCTKCbaEO4EKnmkHNnySZ8Tgm
	 mX6KGOd++NuP0IGf59g78qISqXGIHDWnDFmE/SB6cyB6u3UgYOZyGhVcFBC4Pak5vr8MU
	 IbTkni7UShfl3iCq6MBhsE1BABYWmX2q7+qGsQTlFk+bKXn/EKiWZ7sRwRThbavQV42Tv
	 RVz3gYcDYbTHcAhVX2jlwvOOdMDyHcM6el34fHjOUgJx3KTz7HiOJIT72B4x3xGDrfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XAXUnE15;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FB3606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51FB3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XAXUnE15
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-86288992de5so819902a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190505; x=1795795305; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NtVw7HJE+FU9DI3xWpl8Pyt0L7yMJpDS2sfT356C23w=;
        b=XAXUnE15xCXWUgDbFmuMCBMg4ffNmK383G4cW2vjVWZ0Y96B6uK1rt7PtSzIDEEfNF
         DoSZDtVwTnHMSjXSDZbYSen6XFgwdJ11nlfGjRTbFg+2b0BNg9Y9nZ724IgwJfq9Nnr2
         G7SOupfYUkuyQ4k560TgLLrWwgnAC7IugZNqvCeoCiEwGkdXnlqPVxvHkYjC410LNW22
         512PQtAiYK68Wa2+nldfJZLooBuwx89dFBhYXzeLW75NlK0F1MAN9EiXx4MGqc/jYXH1
         WulTezX3aDXms0TkxfSm4r66RKifVn59DH7QYvhKh9o7Xb1z5K38XMFLPFXUCuQHBrPL
         IIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190505; x=1795795305;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NtVw7HJE+FU9DI3xWpl8Pyt0L7yMJpDS2sfT356C23w=;
        b=Z20rcZNMsaYkgV1tzdDa25xYDX/RSnmSBfc2yHrxBWsTcwNbsAwXFrwPgibKu2gZTe
         XQrjiQqvFbBzIij/JrdoDwLHEYmRJzbrwtDPk2HZKlzPAoM4S4LM/mQ8+Hgb0VU+Vnez
         PN1vmT5XGVTMUX6NHM/6jIozPco35nGFkEJ6asLVIWkq29UyTWED6daYUOxoR26dElGB
         kmS3EqG3naSOQOm5qRC7DiJMn4ysG1E/ZPQuswvJJC0yYLNYN8khqG2qishxroxHcjBv
         q377KYr+CtY68+LIveOKXIG57bybERZBx+XPk26RFNtj43DV2vwIRsb3bzJ8eDcD87Mj
         RmTA==
X-Forwarded-Encrypted: i=1; AL+hErEVcmqz1QnZP68k8U6uF2lvjul/5FiA/aJy9153L5tL/nPNRRhvadTiRrx1geoVtedtojl8MWSnKHL58fY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8hTAKvsXiyBkz2GxuVHVfjb5JAiEBp6rfGIaNnZo+4NYtMjeS
	ETl+oig8XaAppVlvW6rk2u81mr7Xf0vYAYyqrawEivMBe3JPHh1JnHku
X-Gm-Gg: AYBFou1bUmsK1wmXV33kxB/UUJ+xUramn9pRDF4bZHsaHGVTsPn1fJyCovAMNDMfoIL
	wtlMjXMey6A4omEvNDquT7f5dQJscuSnH0s+axPply57HqD/lJD77Aq9A0r6XZhzXT4TIO41cpc
	1HoDsX7gPbTvFZlTOHxX6Zb5Pq4oBamNwXGgZMnk837iYsUpte4g4F+IY0ASOJnhmEUH56UyPBs
	llKvFWac/oQO6C/PEsA9D9mKqoi39egA/9cVwblry4n6NSqbazCbHPrNSISfEsX21a9L+AUW9s5
	gFd9rhpmcLdzc3P4giwlyTt/QbcDkMdZomveHT45J0J0muEynyR6pzqyhD8v6dpVDqEYYSaMNC5
	8CXBldpHMsMUOYE33oIIfRJHrx/lGg4XoPWCfIZL2MjMXEf+m/xsBaDaDRHQOVSbgIhviklj3kO
	HGN/cB6A545ZinKKe7u7s6Tg8gMlD+aK0lN36VZeoSrNdL70x99MjidT/8rNFlwl6JH9lu325Ml
	nK6BCekajf1H04Bxg/208LndWtuYMjiTGpOyJcN5nR019McQOFPdLlSVZPZ//0Tgg6TRQZECgf4
	T2HAglsXq+SCvhNTmEXqAx2YpYdKf5FfF1OBW3fYtoafqNWxtv006JdOuNvtvwtqOXU33lrbG/u
	hW5bsS8+LldwIaGIlWX34kf3GqbOxvn+YrtMjZ7NX9aSCM2hnCXpWhZPBe2L0UxwS7FI9N1RfN9
	XR0XP2OWoi6CV8u2gHU8ZH8YMVi/kzcM8OaQv0PG75uRr8F+e6GxU=
X-Received: by 2002:a05:6830:3916:b0:845:614b:eab9 with SMTP id 46e09a7af769-863091a9d18mr3867703a34.6.1795190505053;
        Fri, 20 Nov 2026 08:01:45 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f3964sm2307408a34.14.2026.11.20.08.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:01:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 09:01:35 -0700
Subject: [PATCH v2] mtd: take a reference when opening an unpartitioned
 master
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
Message-Id: <20261120-submit-mtd-master-open-reference-v1-v2-1-5c2e2ede4ea7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOSw7CMAxEr4KyxtBU9CNW3AN1kSamNSJJlYQKV
 PXuOO0JkOzFeOznWUTEQBjF9bCIgDNF8o5FeTwIPSo3IJBhLcqirKUsWojv3lICmwxYFRMG8BM
 6CPjAgE4jzBKU7JuqNtrgpRFMmtilz/bl3u2aMU/UKaPzRq8iQh+U02MeMf2ce79if6SYfPhuM
 WeZOf8l4pLQNlIp3eoai+o2WEWvk/ZWdOu6/gDe9JtUCAEAAA==
X-Change-ID: 20261108-submit-mtd-master-open-reference-v1-a1b756dcde47
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

With CONFIG_MTD_PARTITIONED_MASTER disabled, a flash device with no
partitions still gets a /dev/mtdX node. Opening that node does not take
a reference on the master MTD. If the driver unregisters the flash
before the file is closed, the core can unregister the MTD device and
its NVMEM provider while the file is still open.

Take a master reference for a handle on the master and drop it when the
handle is released. A handle on a partition still takes a master
reference only when CONFIG_MTD_PARTITIONED_MASTER is enabled.

Fixes: 264725e35fbc ("mtd: Clean refcounting with MTD_PARTITIONED_MASTER")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Clarify which handles take a master reference and what is released early.
- Link to v1: https://patch.msgid.link/20261108-submit-mtd-master-open-reference-v1-v1-1-871aac8c6e05@gmail.com
---
 drivers/mtd/mtdcore.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index b170c3144ca8..c51067ea19c8 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1330,6 +1330,7 @@ EXPORT_SYMBOL_GPL(get_mtd_device);
 int __get_mtd_device(struct mtd_info *mtd)
 {
 	struct mtd_info *master = mtd_get_master(mtd);
+	bool master_ref = mtd == master || IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER);
 	int err;
 
 	if (master->_get_device) {
@@ -1350,7 +1351,7 @@ int __get_mtd_device(struct mtd_info *mtd)
 		mtd = mtd->parent;
 	}
 
-	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
+	if (master_ref)
 		kref_get(&master->refcnt);
 
 	return 0;
@@ -1435,6 +1436,7 @@ EXPORT_SYMBOL_GPL(put_mtd_device);
 void __put_mtd_device(struct mtd_info *mtd)
 {
 	struct mtd_info *master = mtd_get_master(mtd);
+	bool master_ref = mtd == master || IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER);
 
 	while (mtd) {
 		/* kref_put() can relese mtd, so keep a reference mtd->parent */
@@ -1445,7 +1447,7 @@ void __put_mtd_device(struct mtd_info *mtd)
 		mtd = parent;
 	}
 
-	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
+	if (master_ref)
 		kref_put(&master->refcnt, mtd_device_release);
 
 	module_put(master->owner);

---
base-commit: 14b6830335eb6d70dec7a235094d66c22d38eb07
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes
change-id: 20261108-submit-mtd-master-open-reference-v1-a1b756dcde47

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

