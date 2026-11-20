Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166438;
	b=1XHjCBs8bYWpuJOsM1Oga58mt0+rXenGXsqif2IDl2xKU80IvJVF5KQ7Cy8+XOYnpGJi
	 vr1i0J7l6FkOW8C6uCfRzofq4RYAuLP0UPiArIBOLaQVpjdqoMDOZuAjOeyQxlg9RzSg7
	 /vYaEv62+I/vWjhX385pNopkyID5MBs3slbXdIG0g/k4758lItbXnjSdJXOw13XQl36JZ
	 V84Z3DtqITX8vJqL5xz3aO4ZjgJZct6ZaeD+KwtX1C8tzRkZiS2IPbtLPia5ICwi9A1EU
	 +H6RYFu+IKZ8txzu7ln8yvQjT8l7ur4adOiZLX+7oomOSfkuYqhFlZrxma+1iSM59Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166438;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=jykj+J5j3I6ZYh1fHmFdTIcd47f0fiZsu2R7FO70BkY=;
	b=vPXBIsZ3Romy/LAUlzxCGXEzCyoY99t8EMiSHJXW47mqBcvRmI2LzrwO8FKuyhucyt7b
	 1N3e+HqJB8oijujnowgtdYZsxf0JatkjSWIVxuWgOVY5SLP/LuQRLbd6top+CgYP/7IVc
	 BrG5Ix1d+nt/2RjQb2QKdhhMsg3cSj41UX6q5upWUOf5x4KNwZt4Ot8912Hr3UzQkVZWi
	 ckyCuJf1JiFQ2CJxKPeBYbb32GnZUnAiVd2MzTmlO86GNN5UIm6bl/wuhC6zNt8dNxDrT
	 qCZM3/HncwJPahQZzoHpAlmUvTwINNM431AoXS1GbRH8eI63Yy/qlOtEnKO6suQ2lpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=g3WyxYE4;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D578B60A260C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:20:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D578B60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=g3WyxYE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=jy
	kj+J5j3I6ZYh1fHmFdTIcd47f0fiZsu2R7FO70BkY=; b=g3WyxYE43PT3cWDtQ1
	ybOO+n0qL0j5wqKFMi0i+iSUaoNAcv92Pmjk5E9SshFh4G27kqceARpgyGNCbWy8
	MqN9vLgu7Zh2qprgPpiPXOIXEaC69AqMisKMgWUtrwtuKwBS45IwaNSYJJX37PgO
	YH11r9raKA8d4fVQ08k1XVYAU=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDnTz_QEABrJQCZHA--.47213S2;
	Fri, 20 Nov 2026 17:20:18 +0800 (CST)
From: Dandan Wu <dand_wu@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dandan Wu <wudandan@kylinos.cn>
Subject: [PATCH v1] ntfs: use kvfree when ascending an index tree
Date: Fri, 20 Nov 2026 17:20:15 +0800
Message-Id: <20261120092015.2469284-1-dand_wu@163.com>
X-Mailer: git-send-email 2.25.1
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
X-CM-TRANSID:PigvCgDnTz_QEABrJQCZHA--.47213S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruFyfXFy8trWrXF4kuw13XFb_yoWDArb_Xa
	1xXrWkur15JF17C3Z8C34kJryfKrs5Gr97Kr97KF9Iqay5Jw4vv39rtrs5ZFs7WrW2qFn8
	Cr9xKryIkr1fKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRKOzsJUUUUU==
X-CM-SenderInfo: xgdqvslzx6il2tof0z/xtbC6RITqmsAENLS7AAA3V

From: Dandan Wu <wudandan@kylinos.cn>

ntfs_index_walk_down() allocates the index block with kvzalloc(), which
may return vmalloc memory. When traversal ascends back to the root,
ntfs_index_walk_up() passes that block to kfree(), which cannot free a
vmalloc allocation.

Use kvfree(), as the index context cleanup already does, to handle both
allocation types.

Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
Signed-off-by: Dandan Wu <wudandan@kylinos.cn>
---
 fs/ntfs/index.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
index b4462f760e3b..d565accb05d5 100644
--- a/fs/ntfs/index.c
+++ b/fs/ntfs/index.c
@@ -2274,7 +2274,7 @@ static struct index_entry *ntfs_index_walk_up(struct index_entry *ie,
 		ictx->pindex--;
 		if (!ictx->pindex) {
 			/* we have reached the root */
-			kfree(ictx->ib);
+			kvfree(ictx->ib);
 			ictx->ib = NULL;
 			ictx->is_in_root = true;
 			/* a new search context is to be allocated */
-- 
2.25.1

