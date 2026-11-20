Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795149445;
	b=e6UpYK+jMXtyll9/NAgZmMqi5bWZULKahecklBx8kjHilOex4NK9XxBAU8o5t43Hzswz
	 QH8Ij5JOguOrLH+4DF3cWKKnk0Y0gt4bWvzpHj5VVcsD7AQnszqMqTg+B9/d1gufX6UXt
	 st7yyM1lDnj1PQNZkJqcnLEIlif9Pcjrc4QE2ZiKwUmLx5mm/1KLl21XPBAwpAd4ElbvR
	 g9rD/SGkj6Iz9JtCTHWp6gG0z4L+CPy2ZL9WUaU6fekW1fD5dI3ST/YKG3AgVHDGRWnkb
	 XjJ13b/Q1AxVwQJf5rZ4/NQRLzZko4kdM4Yqe0RXMLQJgA2PRMy8qLUL1kKqedQPtLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795149445;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=yXSpHCXjG8Bt6YepxA4OsIZfdP6BYPNbHrx0PkUKp3Y=;
	b=2xVS+8gg6TnF4KsumOFTeXQfZYRWF3b5tu/rnpH7WmQ4JbvaYUc/RiBv6fvzP9cM3pLk
	 A++Dv/uTMBuBb4fRuu9BWorfz6fKlSM/5H+MIayJ5Z8cwghKntFaHNGD1zLTVYnjSrRez
	 2nMM3LMLZP+EFI7W9HJKpO/g6MZZzSmIRxMZuhFoMyVLEnzPuFMtEXZr0AyH1H236L9lD
	 8KccQ6PFB7lmA3RGdF74l0kWTMSWCd/P69OOAcZnzet/17UhL0/5SIs/62YOlqu6ZDUol
	 2mk9P6M+qzJKzbRrOH8YKUSpEx74tgQ04OSGhMGLj/pd9dvBeqak7gfeSsvsyg9L3Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=MmJqcTZr;
	arc=none smtp.remote-ip=202.108.3.166
Received: from mail3-166.sinamail.sina.com.cn (mail3-166.sinamail.sina.com.cn [202.108.3.166])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D500606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D500606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=MmJqcTZr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1795149443;
	bh=yXSpHCXjG8Bt6YepxA4OsIZfdP6BYPNbHrx0PkUKp3Y=;
	h=From:Subject:Date:Message-ID;
	b=MmJqcTZrRnuCMJeAv9F/msKPeu15C1/umORmjGfYyGYaBzTxFlR4Qe3syQEtNK+RU
	 5HLTv2vBUp0uGuEW8ced2wbWGe8Y/ru3P9TPiwaHnd4awjzTNeU2ymkUch2suVACLT
	 2o58P/5iNyMyHIurDqvz/Gdj9Yp5I3o+6dQnak/0=
X-SMAIL-HELO: lxu-pcd
Received: from unknown (HELO lxu-pcd)([111.198.225.163])
	by sina.com (10.54.253.31) with ESMTP
	id 6AFFCE7600004FE7; Fri, 20 Nov 2026 12:37:12 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 8121826815960
X-SMAIL-UIID: A43E84E0A2184041AEA62D24FAFD1FFA-20261120-123712-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+ee09ee2112d03c35f1f7@syzkaller.appspotmail.com
Cc: joern@lazybastard.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	syzkaller-bugs@googlegroups.com,
	vigneshr@ti.com
Subject: [PATCH] mtd: Use I/O memory accessors when in an uncached
Date: Fri, 20 Nov 2026 12:37:09 +0800
Message-ID: <20261120043709.99845-1-eadavis@sina.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6afd0433.8f566acc.2517be.000f.GAE@google.com>
References: <6afd0433.8f566acc.2517be.000f.GAE@google.com>
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

When registering a phram device via module parameter or sysfs invokes
register_device() with pdev = NULL, which causes new->cached to be false.
As a result, phram_map() maps the physical memory region using ioremap()
(mapped as PROT_DEVICE_nGnRE on arm64) and forces the pointer into mtd->
priv, yet phram_read(), phram_write(), and phram_erase() access it using
standard memcpy() and memset() instead of I/O memory accessors (like
memcpy_fromio()). When scanning partition headers (e.g., ftl_add_mtd()
reading a 68-byte header via mtd_read()), arm64's memcpy implementation
issues pair-load (ldp) instructions at unaligned offsets, which triggers
an alignment fault (FSC = 0x21) on Device memory and crashes the kernel.

In phram_read/write/erase(), standard memory accessors are used when in
a cached; otherwise, I/O memory accessors are used.

Fixes: f3d45ac21e46 ("mtd: phram: Module parameters add writable permissions")
Fixes: 285133040e6c ("arm64: Import latest memcpy()/memmove() implementation")
Reported-by: syzbot+ee09ee2112d03c35f1f7@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ee09ee2112d03c35f1f7
Signed-off-by: Edward Adam Davis <eadavis@sina.com>
---
 drivers/mtd/devices/phram.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index b42cadcd76b1..95bd5a9d7e48 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -43,8 +43,13 @@ static LIST_HEAD(phram_list);
 static int phram_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	u_char *start = mtd->priv;
+	struct device_node *np = mtd_get_of_node(mtd);
+	bool cached = np ? !of_property_read_bool(np, "no-map") : false;
 
-	memset(start + instr->addr, 0xff, instr->len);
+	if (cached)
+		memset(start + instr->addr, 0xff, instr->len);
+	else
+		memset_io(start + instr->addr, 0xff, instr->len);
 
 	return 0;
 }
@@ -66,8 +71,13 @@ static int phram_read(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t *retlen, u_char *buf)
 {
 	u_char *start = mtd->priv;
+	struct device_node *np = mtd_get_of_node(mtd);
+	bool cached = np ? !of_property_read_bool(np, "no-map") : false;
 
-	memcpy(buf, start + from, len);
+	if (cached)
+		memcpy(buf, start + from, len);
+	else
+		memcpy_fromio(buf, start + from, len);
 	*retlen = len;
 	return 0;
 }
@@ -76,8 +86,13 @@ static int phram_write(struct mtd_info *mtd, loff_t to, size_t len,
 		size_t *retlen, const u_char *buf)
 {
 	u_char *start = mtd->priv;
+	struct device_node *np = mtd_get_of_node(mtd);
+	bool cached = np ? !of_property_read_bool(np, "no-map") : false;
 
-	memcpy(start + to, buf, len);
+	if (cached)
+		memcpy(start + to, buf, len);
+	else
+		memcpy_fromio(start + to, buf, len);
 	*retlen = len;
 	return 0;
 }
-- 
2.43.0

