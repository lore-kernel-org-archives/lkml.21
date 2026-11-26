Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653844;
	b=B/dvw4e8gLqf/N4VkD7QrmveHLFbrHvMVb8RhZpwxnY1S8LNJNbB1q31KvpNGZBc8su0
	 DoCG0HRKYEbXx70Ju5kLDpetSALutD4LO5zqxiyb3kYhmSBPN8YON/Q/365UJgflX4e7m
	 dV5wtDBhlq3akEIhIvyeFT4cFCRaF7Z3DsOLC6R1ekd9BoEjbGnrWdow17n5IJ76bcJjw
	 pg11fi/letzM9tchGeJ7o1l1qlyW/LWnz4q5rhUpowRGUrdJ1b/I55hv31qM55uzEF4FX
	 XiVC91q0oyr2t+tt9lhIEjmBay/4oFYoaPuqa6bMbVLI+kMWHK0gbqH0bxEHSS2W94g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=kntvEAl8c9UlNNjGZIvxtVFbdMIQt57S01N2AkNPnUM=;
	b=CjFr4FtKQiKm+g160GU0VkMKSdN+ACn37K2aceBnKMySyvankbfZElgo3TB1YnKZBTXh
	 VKmoQDbvVrdaUkL1oS3LY2lCYbhihHAghdfHiFya1DThhxCUucqIM5mXSFuvYiD9AVQZS
	 FiLCkIdgdYPCl1aWfkXE/IXXQLtnmjxP0SYtw4XzRd1fDw+5z3ey3EhjcvE27nnX6j0ah
	 GFPkh3SauASGCyOGercmFGLKEH6nA1/qsNSlTHkL/PeV/Bprkv3fhyozI1BbGCRE0E60S
	 NC/ywfEi6vFRcQWFFqu+jrF+Tnm2BjSmHc7tEIdbOs/zr7OKlhfPCEmf244ginaVoSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BoNrw4dc;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416DD606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 416DD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BoNrw4dc
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-384c78aa0dbso8483837eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795653843; x=1796258643; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kntvEAl8c9UlNNjGZIvxtVFbdMIQt57S01N2AkNPnUM=;
        b=BoNrw4dc0wesVjDd+co6oCGosrNKKDLwVcayt+Uq4JDCQ4k8wM2BaT2HXHXtW0y9yY
         4yB/olIQXKxP1SsOqKpKrjbsIb/X/tl52QhyzAgZeTIDME93CS0Ueyn2l4A57Hln3+fN
         xhG5/T3R4cR3Sk7Tr2VpUgisHB7nWyTnsc0DNzUomU4P55P2qw3ldNwZ1c/miXqHOZli
         g3MFFfT8Wz4gV3zJ9VHmLqnuViABWwA5Kf0bN+FiOMQQLN5PsFHIfFRTyiseo7gaXn1H
         LgUQQ3aeqG5JTHfVQPQoCIbGX2ZK/8906aAadolKVC8Jpps6NkYFE+DIgrPhygb5dkYU
         42ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795653843; x=1796258643;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kntvEAl8c9UlNNjGZIvxtVFbdMIQt57S01N2AkNPnUM=;
        b=PB/6CqPbavhYAM4dFSG03tGmisqdSyefRBEW6cUMFVZr35mo9lLlIXj0pwX1RqxLec
         R+QGNPVa63BKWQ34jSLI6K5UuS87h0aD8f5+P9ULIwAOl6QbAAxyI45MLYr4sYbIfQaT
         ijXYBpEvEgVKLO8GtftE5H+ysafbSGuKEK3tVsWS1E7d6s6tUK5urTODtOMprIRMiZzn
         IrTcGe3WHMc5vIH0hOQtpSiXAyJBFpfX7+BjX9XVZKmKwc3C6sn3keUKR0To1kbNYXst
         PuPxThzEMSxSpduI2c/s4fXm28tJIkGpGQXMu6ZGwbhzt7cKZG+o8diBC3lb4nk9pqql
         hpwA==
X-Forwarded-Encrypted: i=1; AL+hErEJBCJsaSY9O+gZNCREqkXxd+05wJASA6wlURYdqJA4xoz+N/Kiqmj/xD9BhyQCZSRPdlrbI0Ji7nQbLzU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nGgLsot+nQh1RiTP4F26fvEwp6zRb6h10Wah6tAuASnqLokmE
	mnKrJTma90qcfFn36I6GnSIDsZe5UrvpSq+MK+jBME8c89dbuXJnu8jAih2CoK7tw8yJ1pFzuKh
	ASQ==
X-Received: from dybgk2.prod.google.com ([2002:a05:7301:182:b0:385:e49a:dd09])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:8084:b0:36f:4981:da16
 with SMTP id 5a478bee46e88-3857073f5ebmr18632806eec.25.1795653842992; Wed, 25
 Nov 2026 16:44:02 -0800 (PST)
Date: Thu, 26 Nov 2026 00:43:32 +0000
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
Message-ID: <20261126004332.1712403-1-elkin@google.com>
Subject: [PATCH v2] btrfs: tree-checker: verify tree_block_info bounds in check_extent_item()
From: Elkin Cruz <elkin@google.com>
To: David Sterba <dsterba@suse.com>, Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: Chris Mason <mason@kernel.org>, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

check_extent_item() only verifies item_size >= sizeof(*ei) before
reading struct btrfs_tree_block_info on non-skinny tree block extent
items (BTRFS_EXTENT_ITEM_KEY with BTRFS_EXTENT_FLAG_TREE_BLOCK). A
crafted filesystem image with 24 <= item_size < 42 causes
btrfs_tree_block_level() to read past the item and potentially past the
extent buffer's populated folios.

Verify ptr + sizeof(*info) <= end before accessing
btrfs_tree_block_info, matching the inline ref bounds checks below.

Fixes: f82d1c7ca8ae ("btrfs: tree-checker: Add EXTENT_ITEM and METADATA_ITEM check")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

Changes in v2:
- Use (ptr + sizeof(*info) > end) with matching extent_err() format to
  follow the existing pattern in check_extent_item(), thanks to Qu
  Wenruo for the review.

v1: https://lore.kernel.org/r/20261125221849.1424464-1-elkin@google.com

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 fs/btrfs/tree-checker.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/btrfs/tree-checker.c b/fs/btrfs/tree-checker.c
index d2bf21c7b848..40f2355cbb1d 100644
--- a/fs/btrfs/tree-checker.c
+++ b/fs/btrfs/tree-checker.c
@@ -1665,6 +1665,12 @@ static int check_extent_item(struct extent_buffer *leaf,
 	if (is_tree_block && key->type != BTRFS_METADATA_ITEM_KEY) {
 		struct btrfs_tree_block_info *info;
 
+		if (unlikely(ptr + sizeof(*info) > end)) {
+			extent_err(leaf, slot,
+				   "tree block info overflows extent item, ptr %lu info size %zu end %lu",
+				   ptr, sizeof(*info), end);
+			return -EUCLEAN;
+		}
 		info = (struct btrfs_tree_block_info *)ptr;
 		if (unlikely(btrfs_tree_block_level(leaf, info) >= BTRFS_MAX_LEVEL)) {
 			extent_err(leaf, slot,
-- 
2.56.1.839.g22a8290db9-goog

