Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729046;
	b=fXNNPfStOEsFHwtkWqKwsNhuR5qqJHXwVIKHxjvbDkUdDEGsdBH+x51QxldaxUiQlhQM
	 i3npr6U2l64nGDIcUcGnIVhP3amqB1sfQOVRO3udlas4zl/Fn3jfIMhfeTDPNBcRp2z96
	 DSCCO6vtDKHFZkWxwTlIgC87OTbU5zmAlHZ+qxtKYdCCn3Zp4OMeb8oB34A9LAw1/Mbc8
	 4v0ZLoCP6VgWSYNE0Om4j05A+2IiX8YEGsiMy0FSQJIEKXRyQaLc0hevn4o1bMIqq0hd6
	 kcjGdnxRPjkJk4wzZXMJ6V1gmLbfigY5kOoq2s7uIFpfjOxqaDx0G7fOrfJmoH10WnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=pQ+H1VdVwuxjFqsZXRK+yeGJ9rsOkkagPZM6KPP06S8=;
	b=wYiq5tPk7HI8o1FRoj8OvT3opqQKHzWjNf+37kBe4MqA1z1Pwj7u5IsFI0nO6eppH44U
	 gdyVYeHGKmORKS5QE7wjfJZemVa1kcItgdRupExDUOhzj/WJnQx8WO9rll64X1uDfHDMZ
	 yFO3/QWmfNXH1QiRMwclz8gC82Mr7NjTDsE0JBZINFlF/vMFD2wVARCYf3ATxaazRUt4C
	 HyoE+TYi90OFnhuKYiFfuUDqSA0Pr6f5Pql4S3Xxbj1zvRpzR+ri36VxQm9f2S7NQl3cb
	 4nvHRNLD+eO5I/wnTeuW7tt6RYYkqNiU0ylGeSeuLGZRDJWIBFLmr/nzTX1XLYgNiqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a48E3Wk8;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FBA606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85FBA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a48E3Wk8
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdab938dc83so2921898a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729046; x=1796333846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pQ+H1VdVwuxjFqsZXRK+yeGJ9rsOkkagPZM6KPP06S8=;
        b=a48E3Wk86P5ah1xm86yoc8hU4mmjzyCJYQl2guw/XCYVbmawJXJjawNmYgplsZ/9po
         Z1ymvdS6jSkI7wm3AVQ0lxPom/QFlZUiAWd17QvrMnvaH/GyINtE26BhWx33kqR1KFe/
         93oo5JDkS2kfYH3zqekmKN7RMh9L+f/2eP6dIf7yRHGXSGBfMS+v8/t/MnzC8zVJRmX1
         nsmtvRhBp5mwHwKEhNTy8PB+NidgmJ4fHWGujG9mTX+B9vywI2ADr6CdsE1FGPpUEs8V
         MeEufaMgD69T3r47CeiGI6Th6j+vlMPqYrKIwP15xMK06gwpuw0YEKd+1gu/BedJGm7I
         b8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729046; x=1796333846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pQ+H1VdVwuxjFqsZXRK+yeGJ9rsOkkagPZM6KPP06S8=;
        b=gNGnUNYv3OaNIIFoA8KZz1Ueld17/Bd9se4ZKEaCMdyKO5L0WYGIcsKHqZL9dhf5Zs
         PnK2yvCa6qFvcMLWaw5R2ymxlZHNSR3aDzSUCdf2w/WxnGs3ZA4Frengjv09PgBoLd12
         CByVkdlyB/phL3Xn1cQB2b9aqEa+Lc/v4FjEg7+xeO+Y92Y01WkPVEHpO2FQdBWbh2ql
         8lbF4CiVlYDBfmrd7H+S+a2ituVFUWlcdFQqAFtKzWcuEtjkqrOcuUjETvxcrjS72GCX
         tSnTy9bdEuffAJic57RrDjblZCB+wTHSlhhrqLwuUvmyiPWiU56DQGDxfZWmjx72QPq/
         OUHA==
X-Gm-Message-State: APuU4Z9T3Wb6dwbG+dLwicXjy25qPCjUpSRH8OAmQZUI0gxA1rtjQED8
	K0Vy+iESFE+TL76M4JlO8yNqqHznfcgkixvMvHmnHaCtqbeJon/zklArJ4kwd9TP
X-Gm-Gg: AZFdTZdJ6lej9XSXaesMalwLM6481uzjiskFAReVbLa1GNy9fk7F6D6xK6JtzpYLdkU
	CJaCL7c5a00GF8ShE4UoZl1hIYGlm8VDVhPlFhdVjbaHoyVefBmXFEO7WAxaJ/42uR6m11AnKXz
	WjlvwFbE6Np0nezKqjUeGJ2w7x+2Ak2+b/C8aN8qbdwH1zgcG4rsaRQc9SORoHZ44yNzo8w4s+I
	Dw3G2POdv0isFE2XF/Pr65huEFC9zFJTvJhYF81keq/LGa62vTxgAPBsjjBLRXKTqrCd6RAgUzr
	BMP+E0XGSONyBlMVLFl1wBMuzv8OH/7ZkCSRghyzaP/ad/dZcW1f61q8twy4P73g9yIPDkIscaM
	FJb2UrNWHYuH7MeKsYh4dOKCnUxv6xFuqTfNleV/HFcqIBBJX6PDP5naf7/6CxtpDRC0Sg0rtNF
	0Fgo0FMa5gGj8Toeo9qnixqwZdIs1LAnwEqHaww0JPpm+KDD54zw0xxJqdiTGNwuYto2rlolPS7
	lrw0vYEzE4TIQaapTyjom1i/lcEf2QKjK3gCrU+9G5EW+6rcjwj1GDc4gCOsOL2g27eH6z+YY86
	VJY3+N1tt/vm+wWKw0tw8ZTF6gIhzNez6F83ztcgF27ta9MOZQ==
X-Received: by 2002:a17:90b:1dcd:b0:3b4:1bf1:988a with SMTP id 98e67ed59e1d1-3b41c975107mr20198931a91.55.1795729045795;
        Thu, 26 Nov 2026 13:37:25 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8ef99sm35551254a91.12.2026.11.26.13.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:37:25 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: hirofumi@mail.parknet.co.jp
Cc: linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] fs/fat: fix typos in comments
Date: Thu, 26 Nov 2026 15:37:23 -0600
Message-ID: <20261126213723.36535-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Correct spelling and grammar in two FIXME comments in the FAT
inode and FAT entry code.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 fs/fat/fatent.c | 2 +-
 fs/fat/inode.c  | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/fat/fatent.c b/fs/fat/fatent.c
index 2d10a815a579..234335e92aee 100644
--- a/fs/fat/fatent.c
+++ b/fs/fat/fatent.c
@@ -376,7 +376,7 @@ int fat_ent_read(struct inode *inode, struct fat_entry *fatent, int entry)
 	return ops->ent_get(fatent);
 }
 
-/* FIXME: We can write the blocks as more big chunk. */
+/* FIXME: We can write the blocks as a bigger chunk. */
 static int fat_mirror_bhs(struct super_block *sb, struct buffer_head **bhs,
 			  int nr_bhs)
 {
diff --git a/fs/fat/inode.c b/fs/fat/inode.c
index 642e690632d8..7a0634c31419 100644
--- a/fs/fat/inode.c
+++ b/fs/fat/inode.c
@@ -109,8 +109,10 @@ int fat_add_clusters(struct inode *inode, int nr_cluster)
 	err = fat_alloc_chain(inode, &cluster, nr_cluster);
 	if (err)
 		return err;
-	/* FIXME: this cluster should be added after data of this
-	 * cluster is writed */
+	/*
+	 * FIXME: this cluster should be added after data of this
+	 * cluster is written
+	 */
 	err = fat_chain_add(inode, cluster, nr_cluster);
 	if (err)
 		fat_free_clusters(inode, cluster);
-- 
2.56.1

