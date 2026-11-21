Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795235277;
	b=ZYQc4nXVIdQvRYM3FUCzSU9dIJ9opH7XT805/mkegtbzl2fV2iJIqBAa56nC3JURxQY3
	 fUavbuvAEWal0BlE8Q4mq8+8Arjt7z1gMZ1f7nhERkehL37iARhrCgnFYqj+1ZCcpRktd
	 nfmSkGgiWNOH+vkmaz4YguWhBAhXWITnb31TGSSsyREdKaJzx+r8ixRvwBtDSsCCJ5AkR
	 XUJLyJ1BDuUCGtSm3Zsrzgn9rqYfAfUpPnbNjFWnpl5lZZeD17s7irV5pNa9OG62CDvG1
	 QHqFtosP6BJdYze8rXAKCbYwR16UgWAL7NVYsO+okWmTwgqRcLWsnXmY6fe5KUZcU3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795235277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Yi/uH6QkwQZeC/8s/khHkralPXKS62YQlHIuDLKLPe8=;
	b=RQFsxasx4UPlEnE7HJYh1FgwWcxK3Kx65GLAbYWI8nf7ZG/aGaDGcBDBpRF+TgzhQlfs
	 Tm59xC7C0B04pdj2qZwbbjA5CuPSSIQ83gYJ+GXy8pn3kB6TtdVmHgCb+MBYDchuUyfpE
	 YqqmgJXQSCZYlEnCBA/stoffRVb64vtznYmo+ioIR1bkYMFAq91dSkYSc4WnXoSeFfMUV
	 RmzTAT2F7WATdLR5s+BWO1SVyiOFz+dGrxo1Diujlul4ZHbj1Q9GuPuGOjxOoMhaGcBkv
	 bl4WqaXn6UAYdFNoAoX4136tSCwVJ5W2Ktn0YUzRb/4qj41TqraHBrN4OF6EkUV7CQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=a26IRCtD;
	arc=none smtp.remote-ip=209.85.214.225
Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3856606A6A2
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 04:27:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3856606A6A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=a26IRCtD
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2efdb4499a3so1093015ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1795235268; x=1795840068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yi/uH6QkwQZeC/8s/khHkralPXKS62YQlHIuDLKLPe8=;
        b=a26IRCtDwTODN+RaMit+yGxvRC63u+qFT+5Nk0GzWa2B7BiknyiPwzW9oR51TRVFa4
         0Q1nv/ESRhv5a4fXglln9Jar8b4NCbch4+f1LStDWQbGhPrCj0hzJNib+W3J2W4VyqrO
         6oQQmJ212EyIrDsIkjYNeJJiyDQZiBkErW1X64J4/tgI7RnuLSMs7/uiX7wUflHpTZct
         zUc8byaXuTjS9cMimNPqSbGR75IQxoGXX2SPTctlfW/QABWeD6jk2TB0Vu2G3J+os2Qo
         Fhc2hoZSajwJhipvo1er7QCQZaLq1p0vxmVnlTV49j69CgkrGLKRykZ+FDmaovU371rG
         3/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795235268; x=1795840068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yi/uH6QkwQZeC/8s/khHkralPXKS62YQlHIuDLKLPe8=;
        b=ryH4us/y1UTiTAYzpNMIzjDl7B3QuKJbjRa9vwM8n8/94fjoH77y5Q15JaEzNn8jJC
         xLW8REuefgURYmOXiS6KCWbE1lnU9EZjs/Os/rU6RP4iEE+ps09EsdbuDcV6SVlwkn++
         E/qMtk6hF+suLaHIUJ5YMM13b+ZwnC+I1hyNrhTAI4s/+HtWGOAtfs3PMv2k0rp8i4+N
         ovjixAgLanH5CqJ4Pn0jHwq5ovohFUC6TfzAwo8nfUjc6ITQF43vxZKO/6NGuN1ROlJS
         ZN4mWPbvWtoDPHkGofIe/Izhljth0sUo1KirMsqLV5jTvA2UggXMWpXDfQmoW51FeY7w
         pkKQ==
X-Forwarded-Encrypted: i=1; AL+hErELfA6n45AyolAWRlP2I/EaTMiR57GrtSmL3ec4dmnFwmbYrfqDWm8pOhobbpHgaorPHw0QPgijiXbyQl4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Shgfykga7jLixSGdljE5PQYaZazerMvo6FUz4Dh1hJSgZksQx
	QywlBnwLFzjeyMf7T8gtbn3uaudiKcCn8rFx7NMQxssLHdbRq7IVYWAwNZU8VOzB7m7eRWw3rXt
	P+MUGdok88urZzkKb1Hm10/2VWVd4XubmdpaG2Lz+nPOFOwxP1yrz
X-Gm-Gg: AZFdTZc+5q1gTlwCjPRyD7p1YtxdX/r5lMFfE3LsMa0fokAIQUApGvB6MP7ULLQr/y6
	6UMfPGdrm2Q1YzPfji9CYBGo+YCMwy6VgesMUY+ec0N2kU93O5VUm0ejSYFrc6Am83HPZ9vCSHa
	O8yzfaJ2/R0/Lknzgw4oMM0CrCjPbHwj6u0/te1Kt/7OjoodTOBcR+6vV6CxMAfqpfLvuf2KZkk
	4T/c8+FehD6LlqZdDE067eMjbKrXwNPYjvmh3bXUMoSXa9LMSF2xwn08yjtUIbPl4MKVIgK4epK
	7u3bmodfsO362tQF5w3HwpmBgj5GGFKBzwgHPhoytrVcpoBCjHvH7b3q8Uo2UFGVZmqvyxUKTQ9
	t/7bp90Ci5biU7r+LQA==
X-Received: by 2002:a17:90b:3d8d:b0:3ab:a188:b898 with SMTP id 98e67ed59e1d1-3b41c80b970mr8003532a91.2.1795235268031;
        Fri, 20 Nov 2026 20:27:48 -0800 (PST)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41add899dsm3314578a91.3.2026.11.20.20.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 20:27:48 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [IPv6:2620:125:9025:23::204])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 58451401E3;
	Fri, 20 Nov 2026 21:27:47 -0700 (MST)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 51C29E4010B; Fri, 20 Nov 2026 21:27:47 -0700 (MST)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Christoph Hellwig <hch@infradead.org>,
	Keith Busch <kbusch@kernel.org>,
	Caleb Sander Mateos <csander@purestorage.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] block/t10-pi: deduplicate blk_reftag_remap_{prepare,complete}()
Date: Fri, 20 Nov 2026 21:27:42 -0700
Message-ID: <20261121042743.1139584-1-csander@purestorage.com>
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

blk_set_{t10,ext}_map_ref() and blk_set_{t10,ext}_unmap_ref() are
identical except that one updates the PI ref tag from virt to ref_tag
and the other does the opposite. And since blk_reftag_remap_prepare()
and blk_reftag_remap_complete() just dispatch to the corresponding
map/unmap functions based on the PI tuple format, they too are identical
except for the ref tag update direction.

Combine blk_set_{t10,ext}_{un,}map_ref() into new functions
blk_remap_{t10,ext}_ref() taking arguments "from" and "to". Also combine
blk_reftag_remap_prepare() and blk_reftag_remap_complete() into
a new function blk_tuple_remap(). In __blk_reftag_remap(), use the
value of prep to select which value to pass as "from" and "to" to
blk_tuple_remap().

blk_set_ext_unmap_ref()'s check to skip setting already correct ref tags
also had an extra lower_48_bits() that blk_set_ext_map_ref() lacked.
Either approach is correct since the check is purely an optimization.
blk_set_ext_unmap_ref()'s tighter condition would skip more redundant
put_unaligned_be48() calls on a theoretical block device with more than
2 ** 48 integrity intervals. So keep that tighter check in the combined
blk_remap_ext_ref().

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
v2:
- Avoid ternaries to compute from and to (Christoph)
- Rename blk_reftag_remap() to blk_tuple_remap() (Christoph)
- Rename blk_set_{t10,ext}_remap_ref() to blk_remap_{t10,ext}_ref()

v1: https://lore.kernel.org/linux-block/20261120064806.752251-1-csander@purestorage.com/

 block/t10-pi.c | 73 ++++++++++++++------------------------------------
 1 file changed, 20 insertions(+), 53 deletions(-)

diff --git a/block/t10-pi.c b/block/t10-pi.c
index a19b4e102a83..06d4eaa6d292 100644
--- a/block/t10-pi.c
+++ b/block/t10-pi.c
@@ -434,73 +434,36 @@ static void blk_tuple_remap_end(union pi_tuple *tuple, void *ptuple,
 	}
 
 	bvec_iter_advance(bip->bip_vec, iter, len);
 }
 
-static void blk_set_ext_unmap_ref(struct crc64_pi_tuple *pi, u64 virt,
-				  u64 ref_tag)
+static void blk_remap_ext_ref(struct crc64_pi_tuple *pi, u64 from, u64 to)
 {
 	u64 ref = get_unaligned_be48(&pi->ref_tag);
 
-	if (ref == lower_48_bits(ref_tag) && ref != lower_48_bits(virt))
-		put_unaligned_be48(virt, pi->ref_tag);
+	if (ref == lower_48_bits(from) && ref != lower_48_bits(to))
+		put_unaligned_be48(to, pi->ref_tag);
 }
 
-static void blk_set_t10_unmap_ref(struct t10_pi_tuple *pi, u32 virt,
-				  u32 ref_tag)
+static void blk_remap_t10_ref(struct t10_pi_tuple *pi, u32 from, u32 to)
 {
 	u32 ref = get_unaligned_be32(&pi->ref_tag);
 
-	if (ref == ref_tag && ref != virt)
-		put_unaligned_be32(virt, &pi->ref_tag);
+	if (ref == from && ref != to)
+		put_unaligned_be32(to, &pi->ref_tag);
 }
 
-static void blk_reftag_remap_complete(struct blk_integrity *bi,
-				      union pi_tuple *tuple, u64 virt, u64 ref)
+static void blk_tuple_remap(struct blk_integrity *bi, union pi_tuple *tuple,
+			    u64 from, u64 to)
 {
 	switch (bi->csum_type) {
 	case BLK_INTEGRITY_CSUM_CRC64:
-		blk_set_ext_unmap_ref(&tuple->crc64_pi, virt, ref);
+		blk_remap_ext_ref(&tuple->crc64_pi, from, to);
 		break;
 	case BLK_INTEGRITY_CSUM_CRC:
 	case BLK_INTEGRITY_CSUM_IP:
-		blk_set_t10_unmap_ref(&tuple->t10_pi, virt, ref);
-		break;
-	default:
-		WARN_ON_ONCE(1);
-		break;
-	}
-}
-
-static void blk_set_ext_map_ref(struct crc64_pi_tuple *pi, u64 virt,
-				u64 ref_tag)
-{
-	u64 ref = get_unaligned_be48(&pi->ref_tag);
-
-	if (ref == lower_48_bits(virt) && ref != ref_tag)
-		put_unaligned_be48(ref_tag, pi->ref_tag);
-}
-
-static void blk_set_t10_map_ref(struct t10_pi_tuple *pi, u32 virt, u32 ref_tag)
-{
-	u32 ref = get_unaligned_be32(&pi->ref_tag);
-
-	if (ref == virt && ref != ref_tag)
-		put_unaligned_be32(ref_tag, &pi->ref_tag);
-}
-
-static void blk_reftag_remap_prepare(struct blk_integrity *bi,
-				     union pi_tuple *tuple,
-				     u64 virt, u64 ref)
-{
-	switch (bi->csum_type) {
-	case BLK_INTEGRITY_CSUM_CRC64:
-		blk_set_ext_map_ref(&tuple->crc64_pi, virt, ref);
-		break;
-	case BLK_INTEGRITY_CSUM_CRC:
-	case BLK_INTEGRITY_CSUM_IP:
-		blk_set_t10_map_ref(&tuple->t10_pi, virt, ref);
+		blk_remap_t10_ref(&tuple->t10_pi, from, to);
 		break;
 	default:
 		WARN_ON_ONCE(1);
 		break;
 	}
@@ -519,17 +482,21 @@ static void __blk_reftag_remap(struct bio *bio, struct blk_integrity *bi,
 		*ref += bio->bi_iter.bi_size >> bi->interval_exp;
 		return;
 	}
 
 	while (iter.bi_size && *intervals) {
-		ptuple = blk_tuple_remap_begin(&tuple, bi, bip, &iter);
-
-		if (prep)
-			blk_reftag_remap_prepare(bi, ptuple, virt, *ref);
-		else
-			blk_reftag_remap_complete(bi, ptuple, virt, *ref);
+		u64 from, to;
 
+		ptuple = blk_tuple_remap_begin(&tuple, bi, bip, &iter);
+		if (prep) {
+			from = virt;
+			to = *ref;
+		} else {
+			from = *ref;
+			to = virt;
+		}
+		blk_tuple_remap(bi, ptuple, from, to);
 		blk_tuple_remap_end(&tuple, ptuple, bi, bip, &iter);
 		(*intervals)--;
 		(*ref)++;
 		virt++;
 	}

base-commit: 6e6d4b23e92742a9f56008beb35c20ed4902611b
-- 
2.56.1

