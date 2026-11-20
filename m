Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172811;
	b=azy8Z7cOxSXjDcEZCqonPpr8mrwWPnj2kIy2X0899SF/ASpQVbBVxsWC2d852KDw5Ivc
	 +Npy03FV2zYqFwZqwBKVYD6SOwS4//P2DJjzN3lLWYifh9sopdQ6mB/VKXIjDP6zsO98w
	 OM2DPxaTarwX3YZJ7r0Bf/4n2ZeQ+KajP/TKJxPPTjafWbpR4y+5gRoIoOMEydeUysHoS
	 DwfMXZPCvcg3bylOgEXk8fxkddNlpqk98QTmbjMd9iGtiaafiMf3wh6Ap01MaJDIwfkNO
	 +o/FY9sjQizVeKFR/M37vAhNIlbrCJ2GldKqBoLtLc0KPC5eCuckoe1vPMYsDvcFT+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172811;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=TtFuIhwgLpPs0ea7HaHQTWE6q+4yCc9ueOWd48K9Uz4=;
	b=4DJOr+Za3lBU2BNfi2BvPbU33KToz6oEIXajiXYS3Krh1qFeDFOiwQm+idCM/3gCU/0M
	 q9lbZ4ghBo1fjgFMJ1LxnHubWCOv4ejOfw0KGNvKANlf9oOlFcBmcuOlK/PHPgs4LAthc
	 1YnR2NkGl/NxrKmehwO06HurAx3OCBzh4a7zI568P3vFq7s/CiGWibYfJGt/DrREzNoEb
	 aLPGDQ2nm/SCQeDBJUwA+eukSOLsxNM30DZn8ErBlGAnMZr35lFAuzsbfa5/Y7VnTkrVu
	 2+kDLePLraz4IklV8qsgvW75+lP/YzB4mQnDFjZgJTf6zIjOo8ExsszV8Q8UlLzj+EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=pKp1mOHB;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7560606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7560606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=pKp1mOHB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Tt
	FuIhwgLpPs0ea7HaHQTWE6q+4yCc9ueOWd48K9Uz4=; b=pKp1mOHBD9Pcw/cvWa
	I+cUQs+xX07LPn1aI3fJG1xin8ZmjwGXQeQnyE3tV6RD+6eHEeKekKGjmHPi1k+v
	CG2G5J7Mw9N5AIKvjqD90psoVafdcUlyr/28Wqdi0ReRDxMHQA553j3d6RQ7cC5X
	hhiWg3aev0oahXkIosGxa4bf4=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3z1yGKQBrer4iJg--.45709S2;
	Fri, 20 Nov 2026 19:05:43 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: akpm@linux-foundation.org,
	david@fromorbit.com,
	qi.zheng@linux.dev,
	roman.gushchin@linux.dev,
	muchun.song@linux.dev
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>
Subject: [PATCH] mm: shrinker: stop counting when the seq buffer overflows
Date: Fri, 20 Nov 2026 19:05:38 +0800
Message-Id: <20261120110538.3256962-1-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3z1yGKQBrer4iJg--.45709S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFWrCFWxZFyUKF48Cr1DAwb_yoW8ZFWUpF
	s5K3yUta1DZw1xZrsaya18XFy3Aa4FyrW5WFnYqrW3Jr4rXr1Sq34rG3WYgF48C3s5G34j
	qr1Y9FyUGF1kZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jJTmfUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbC8AdGL2sAKYd0GwAA30

From: Xuewen Wang <wangxuewen@kylinos.cn>

The shrinker debugfs count file uses single_open(), so all memcg rows
belong to one seq_file record. When the buffer overflows, seq_file grows
it and retries the entire record. Queries for subsequent memcgs in
an overflowing pass cannot contribute to the final output.

Stop the traversal once seq_has_overflowed() is true, using the existing
mem_cgroup_iter_break() path to release the current memcg reference.
Leave the overflow state intact and return zero so seq_file can retry.

Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
In a single-node KVM guest with 1024 cgroups each caching 16 ordinary
files on ext4, the 8865-byte output required three show attempts. Count
callbacks fell from 3075 to 2472 (19.6%). With probes disabled, six fresh
guests per variant each performed 101 full reads. The median of guest
medians fell from 128.2 us to 112.2 us (12.4%, about 16 us per read).
Small and sparse outputs had unchanged callback counts. Complete output,
small reads and seek-to-zero rereads matched; concurrent memcg deletion
and signal interruption checks also passed.

The successful pass still traverses the full list. Early exit skips
count queries for subsequent memcgs in overflowing passes.

When overflow coincides with a pending signal, the original code can
return -EINTR in the current pass. With early exit, seq_file attempts to
grow the buffer first. The retry can return -EINTR, or buffer allocation
can fail first with -ENOMEM.

 mm/shrinker_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/shrinker_debug.c b/mm/shrinker_debug.c
index cafb566301326..3022d103b0b1e 100644
--- a/mm/shrinker_debug.c
+++ b/mm/shrinker_debug.c
@@ -74,7 +74,7 @@ static int shrinker_debugfs_count_show(struct seq_file *m, void *v)
 			seq_putc(m, '\n');
 		}
 
-		if (!memcg_aware) {
+		if (!memcg_aware || seq_has_overflowed(m)) {
 			mem_cgroup_iter_break(NULL, memcg);
 			break;
 		}
-- 
2.53.0

