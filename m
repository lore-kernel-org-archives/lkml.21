Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981894;
	b=VABAdTDh2++wX0+LkO1V2Uo8+nXWNNSWW+77b2fg//0H29cFWl/c5Y7BBBZFB403Ub19
	 Yx7qDzN7xPe+8oB9i9v17CxYOSDsi8H16Hjf/+rLyrLbcy84nVrtNQH1bCulQzPwS71um
	 N10TChl7yDu9tLrwtx2oF2/QpiX4Fk0uKMTm85WCiBIoxbsFuG6agyUEAbxTrv9WJdE8U
	 lfWtEjnOew/DB//0ikUgQixXyZ1dQ86PG16FrFEsX8M9ECL6KS4UmQS8Kxkd0BwjGUw4b
	 NZFIUT+BRZJ38Km/ujyNHjXPY7dX1hUr9ijW92IStcWGAQfu84JniBmM2OIY/iBOS2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981894;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=2O/0GxFTdaVqIt+Fh1ZdEiw319MytGrC5ThQaqmf72I=;
	b=MAF00SWTKxZXpUieu7e8+O4LD9DzDYw3gJD3V3OqUV2QIl9dGSLiWtuJudZvTVOL3//9
	 KMuQ/xvpafh/zXTU0ynfNSFkGDtaR3WHfY4fZ6RSpuVTscgC/pSHJLEVYuqiOso43xFDN
	 zTstGJ/G7fugzkKd5IGotvCFHQ1LKJ16BQrYlK61Vo4v+yjw4B2myKNrFeT0G5LCC2OXV
	 /JZK7ykUEKQUoKUaS/gYE70ylQggvHFJiD1U8r0k3XEqPpM5XKDi5MgRm9Y0VX75l+qnq
	 Mhg/pyi/hgXFJnOhza2yPmoX7aIJEec5MIRV6vhppbHYBi/cU1ss/qok5EOE6V/P3xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=OwBLaZmz;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC07606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AC07606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=OwBLaZmz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=2O
	/0GxFTdaVqIt+Fh1ZdEiw319MytGrC5ThQaqmf72I=; b=OwBLaZmzFpmY1aOtGg
	50Wyv/UM//zVBXv0x8LG9ob7u9Tu1OnDeb/BYUC7ES/d9XsJssK+X4dm9RKsuOqj
	RYW9XSkaOYWz92gSyQvBJP1DRecpFkyWdnJq9tDW+gyoIC3Yf/3Ii/Ipx9UhKlP/
	DBp/QlXyAIpzcxzYc+/TR1EPM=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3HwjJP_1qmvfEIw--.16665S3;
	Wed, 18 Nov 2026 14:03:55 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: vbabka@kernel.org,
	harry@kernel.org,
	hao.li@linux.dev,
	cl@gentwo.org,
	rientjes@google.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	rppt@kernel.org,
	mhocko@suse.com,
	surenb@google.com,
	sj@kernel.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>
Subject: [PATCH v1 1/2] tools/mm: slabinfo: fix inverted numeric sorting
Date: Wed, 18 Nov 2026 14:03:16 +0800
Message-Id: <20261118060317.1802620-2-wangxuewen_ky@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261118060317.1802620-1-wangxuewen_ky@163.com>
References: <20261118060317.1802620-1-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3HwjJP_1qmvfEIw--.16665S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF1fCry7urWxJrWUGrWDtwb_yoW8Cw1UpF
	Wjy347Cr4v9FWUCFWUCr1jqFWIgr93A34Ut3W0kryDZwnF93WSvF1FyFZxCrW7XFn5Xrs5
	uFykJas0vry5ZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jJ5rxUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzgscBWr9P8vi8QAA3s

From: Xuewen Wang <wangxuewen@kylinos.cn>

The numeric branches of sort_slabs() return either zero or one for
unequal keys. Negating these values for -i never yields a positive
result, so the sort does not swap entries with different numeric keys.
For example, partial-slab counts 30, 10, 20 remain in that order
with -P -i instead of being sorted as 10, 20, 30.

Return a positive or negative result for unequal numeric keys so that
the existing inversion works for size, activity, loss and partial-slab
sorting. Preserve the alphabetic tie break for equal keys and avoid
subtracting unsigned counters.

Fixes: c09d87517298 ("slub: add slabinfo tool")
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
 tools/mm/slabinfo.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/mm/slabinfo.c b/tools/mm/slabinfo.c
index 48d1ee8b0e81..3e62a2fccaeb 100644
--- a/tools/mm/slabinfo.c
+++ b/tools/mm/slabinfo.c
@@ -1075,22 +1075,22 @@ static void sort_slabs(void)
 				if (slab_size(s1) == slab_size(s2))
 					result = strcasecmp(s1->name, s2->name);
 				else
-					result = slab_size(s1) < slab_size(s2);
+					result = slab_size(s1) < slab_size(s2) ? 1 : -1;
 			} else if (sort_active) {
 				if (slab_activity(s1) == slab_activity(s2))
 					result = strcasecmp(s1->name, s2->name);
 				else
-					result = slab_activity(s1) < slab_activity(s2);
+					result = slab_activity(s1) < slab_activity(s2) ? 1 : -1;
 			} else if (sort_loss) {
 				if (slab_waste(s1) == slab_waste(s2))
 					result = strcasecmp(s1->name, s2->name);
 				else
-					result = slab_waste(s1) < slab_waste(s2);
+					result = slab_waste(s1) < slab_waste(s2) ? 1 : -1;
 			} else if (sort_partial) {
 				if (s1->partial == s2->partial)
 					result = strcasecmp(s1->name, s2->name);
 				else
-					result = s1->partial < s2->partial;
+					result = s1->partial < s2->partial ? 1 : -1;
 			} else
 				result = strcasecmp(s1->name, s2->name);
 
-- 
2.25.1

