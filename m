Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645130;
	b=iQe9nUKT/0+7/ZzpX1XDhTn31pFtlvbwRqaL08MeKdstLC2HSHI+DE/ixDjj1WcWYc1g
	 KIom7/GocmT6LJnWUj77Hmy9uoKrXwp1lpA1e0OXEcJ4IccjUJxv2DJi9u9Qlivl1qMjA
	 jz78KUMrBdPPNsc4GqVFa1kQcj5SNPqpAzK5ug0nbCGmc/bx9HvZv1l+JjhhdS10uNXXu
	 Ky7Xi3hx9JbLsDg2tm67zL4/xp3jLTX4/aJIc51O5DhtXYy1ry4PEkvAeJL5hmSYJ/W8u
	 AdrBHViO6ssP4HcM+cAeUd5NxCGApyU5oRsQxIm+t9i0JcraYKHkTXnECtpvT25x3HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=u2+GtbAzliCVLY4qt9XkKEEOn7y3no8jVdjlKGtflhg=;
	b=GAjhtQH2hdfazQJdVgYUk17bjVlm8ICcZ1zRLTUH5jwSh5YGIVlqz0ajME/kcwUKJ1Hh
	 l1Y/rBc1Ckrbsqx+CtougOnJXwcky3w0Uo/gUrnR0mGeh56G8lYEAX65DB1PwGY0lzYA/
	 gXMPjn6bVlVXi8dAxB+y/qQOs0zPxEcprkBDFimU+oSDehzi+U2k1QyP2HIhNAfuLEVOg
	 5YuT2XtmGbx3o5dx/LkMrhm0CdqrRd5L3zM68LxG2rKX5abtDf6Yc7szbMtg6Y8gAUG9W
	 +FeXPMI21txeQq+GoJFZxkEv1BpJwntxCfathUz94LAOBCUKNZEUhcB8zvZSvOASSLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q1yNJE5J;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE23606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FE23606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q1yNJE5J
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-38355b03cb8so5972758eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645129; x=1796249929; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u2+GtbAzliCVLY4qt9XkKEEOn7y3no8jVdjlKGtflhg=;
        b=Q1yNJE5Jql0gSdpOJaxee+sYbAdE4vnO9HYViUBT7dcZuqOUWfAGz6ujF6vvm059uG
         bkOO8kYVpx4hvdU5anFdhMtCACp8MQ9Zbr0EqqWWUrkKFIgHlYfCush9fml4vs8IRqHq
         F5gHH5hEiTsNDrCCP01faNxe2nOzkQEOMfQ+t3B4mKafRr4igC/56NH8lSjaG1Sx+fKf
         HYI3vqyBaRzdEUzMvXNfBHsgty6iGew4dx8XnqN3hH6xcWtf5ZoFDUmksU5gN9fvnGUl
         9iXb0GXcWrku0pEI0oX5BBEU8Q9QyKSASZ0xpicvvmik7RCSsOFIij8UgbCuwQxtkcF7
         xJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645129; x=1796249929;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u2+GtbAzliCVLY4qt9XkKEEOn7y3no8jVdjlKGtflhg=;
        b=ww4T3q2yZJVjY4Rl2lCVwhEF/W2iSkcWrQq8gT5tJ5ACDUJscCB7Jzpaey/aJ+gaqd
         zoyH2VQW5bbZ0MR2I0ysmmHdmX4mgJ0589FnuimYXkRvjeRA70rRgGCyTQtva5tQKl0W
         lkql1aiJcBCRibi22uZV0CKGJpdAa6jCNjMJJEY3ZvUGAmGpbOd7M+MKVnSzPUBRo7vr
         bINoJXgxmqn5mTJ6UuziIJ9NwVHfnrnw/XOxWFSzq8JkvjLr4GJTrc0nqs6V9JAeSSyz
         a762FCjvVbit6kabUOplXUJvryEGstbC1k+MVH2rvwWTgvX6LjFX8dtFjaP7KeZL7v6E
         OzZw==
X-Forwarded-Encrypted: i=1; AL+hErHvDK3UeGRkQg8g8tsABouABqx50n29JunHO4r6QOnp75DgE44pYCXVt4NrcImkHNZY7OZkEoe7iQNBNSo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ClBtyeystQs7sIV6z7nPSoSpKbhX1rgYbWDshWy/afjN65qoS
	l58G5Z8I+4zDbmsmOdwnmWbW2RKW8ejVRO6lrKYxWSC6s1GSaY+AmPHHngaewtVcbA0+bgyO5ar
	jXg==
X-Received: from dybla7.prod.google.com ([2002:a05:7301:1a87:b0:381:610e:404b])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:8948:20b0:386:b08e:4b7b
 with SMTP id 5a478bee46e88-386b08e4e93mr10610272eec.29.1795645128820; Wed, 25
 Nov 2026 14:18:48 -0800 (PST)
Date: Wed, 25 Nov 2026 22:18:12 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125221812.1423319-1-elkin@google.com>
Subject: [PATCH] nfs/blocklayout: use div64_u64() for chunk_size in bl_map_stripe()
From: Elkin Cruz <elkin@google.com>
To: Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>
Cc: linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In bl_map_stripe(), dev->chunk_size is a 64-bit integer (u64) decoded
from XDR. Passing dev->chunk_size to div_u64() silently truncates the
divisor to 32 bits, causing division by zero if chunk_size is a multiple
of 4 GiB and silent miscalculation for other values above U32_MAX.

Use div64_u64() to preserve full 64-bit division by dev->chunk_size,
and reject zero chunk_size or volumes_count upfront in bl_parse_stripe().

Fixes: 5466112f0935 ("pnfs/blocklayout: Fix a 64-bit division/remainder issue in bl_map_stripe")
Fixes: 5c83746a0cf2 ("pnfs/blocklayout: in-kernel GETDEVICEINFO XDR parsing")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

Note: Liu Chao posted a patch on 2026-10-16 checking !chunk_size
(https://lore.kernel.org/r/20261016041139.2292455-1-liuc63@xiaopeng.com),
which is not yet in linux-next. This patch additionally fixes the 64-bit
truncation in div_u64() (which still divides by zero for non-zero multiples
of 4 GiB) and zero volumes_count. Happy to rebase on top of that patch if
it is already queued.

 fs/nfs/blocklayout/dev.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/nfs/blocklayout/dev.c b/fs/nfs/blocklayout/dev.c
index 00462e6affb1..8c7af13d45d0 100644
--- a/fs/nfs/blocklayout/dev.c
+++ b/fs/nfs/blocklayout/dev.c
@@ -274,7 +274,7 @@ static bool bl_map_stripe(struct pnfs_block_dev *dev, u64 offset,
 	u64 disk_chunk;
 	u64 disk_offset;
 
-	chunk = div_u64(offset, dev->chunk_size);
+	chunk = div64_u64(offset, dev->chunk_size);
 	disk_chunk = div_u64_rem(chunk, dev->nr_children, &chunk_idx);
 
 	if (chunk_idx >= dev->nr_children) {
@@ -536,6 +536,9 @@ bl_parse_stripe(struct nfs_server *server, struct pnfs_block_dev *d,
 	u64 len = 0;
 	int ret, i;
 
+	if (!v->stripe.chunk_size || !v->stripe.volumes_count)
+		return -EINVAL;
+
 	d->children = kzalloc_objs(struct pnfs_block_dev,
 				   v->stripe.volumes_count, gfp_mask);
 	if (!d->children)
-- 
2.56.1.839.g22a8290db9-goog

