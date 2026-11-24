Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560670;
	b=eeEg/MBJT6MbjHLJhvBeNKjlZP8KEAWCQDiPZ1jX8EopMN5eAFcPI1q5OY8RinHM/4fk
	 fUsh5/oZD87OQDUs8fAVIzkLpC0Vkzf68cRzdlNYpe1WBWWzuh4C7PTId/SHymNFRwpL4
	 5RuD9Q9B/Nh9OiTPD86GhyDx99Dy52JyV4fUPOduaIQzEWk8USLbWmXSk172/eR0zlaTt
	 g/aSR5UoiNHaulECmVIkoyVVLOfvFDYhWOk+PDcVU1pDcl1M1lzHSDUl7VWbm5LtWN7zY
	 1QuOAQPvUlW5fJ7v2n8gxNkEO2MykuhuQCMzAZ+QoW1qD1AD+jCbLvhSuw3UqQXbHng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8fbqFXfnJmZ5wlNeBVcYahiL5PvY2DhQX6o+WRRQBHU=;
	b=AECZLsZzXYHQxOanHFFNWKmiF84M6bpk2IRB6vlVT5crn3uzTefLFd8/h4nY5yD5qOdf
	 17C7p3+h6DHn86YhOZxxZjzHu2dzb5+Y9e0mJ6X2EUTJlG3rrp0GdThsTXX3t1lewVDT+
	 zofcAQ+w8vhJIRXht+RUemYArz0BAwygARQnYNVI9x7amxJqVI1HCHEQuufs3wd1DbVhG
	 KictMIKjW91bpRrkZZDatvWroNE+AI0Vyn8Y2XfDrlnLqgI45JDQ9TVGGiS8TI7IoUYCN
	 khcYefnON622TS4jTdcMzi7hGfaIBzml1yRs+NLvnwnhEhwJRMibhbMs5c5gD3mSSTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GCdFeoTW;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BD3606A69D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2BD3606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GCdFeoTW
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso40734925e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795560668; x=1796165468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8fbqFXfnJmZ5wlNeBVcYahiL5PvY2DhQX6o+WRRQBHU=;
        b=GCdFeoTWhhvd2pA4jmshxSJGXNPRUZNH67/i8ObsgUB1JZxDHmGK3mdIOqwQPjyViC
         lz6/JqDiNWB92qK4G43yckMYusH5A0jEpSUcDChtrQ6VSXVxfuz2xPRCklFLkg+eF9Tx
         TDQcXH9ldQ5ozQcKo2tG9Gb7uuEJWtP7rRcsK8lPetm7LWwbVXJmtbqcP5nPLaOTAhUZ
         aST/YzJnKL6jDsMzAqYBcvuNdkte+C4841S8XhQdI5n9zuM+xhTeLFWwEvMwg1Uet0JA
         A9jNjlb7B3B9ZRLtQixaO8caFViJteaXCYBhn4QZB6maKkNhABs4DmYMDYZVjmOGLqz0
         v/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560668; x=1796165468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8fbqFXfnJmZ5wlNeBVcYahiL5PvY2DhQX6o+WRRQBHU=;
        b=PpJSXOZ4MRbGQMH1SK75xX0zPdNUue27+ZkJR6CwDNOfD1D2rn54shotpQiqlD808M
         yc7oLGYklpbXm1+cnPSmnHYOhaFo+lFYgo6fba9UEFwu42Es302gTGVFl7WEpFcnYkmH
         jKOkUZkF6SIeejU3ZfsE6RoWoZExi5JxYYrecP/GNZqA0dsDlcYqqPqmx+tieGzPbdVr
         D78L+eVyOqqKsogYSgm6naETpvgUrWkdGJgNwY0KPf+6hCCMBQ4C0QufTNomubeDMGy3
         Xecf1GLEjuCVTkVMGPlEwytF6ZZilNDa2O9aN3kRs0jdzhM5KTqJw6zH3V+R1PBmu6Jw
         YTmw==
X-Forwarded-Encrypted: i=1; AL+hErG/78byMIYeXiqHhzoqln/xvb0cJAQ0nPiUWf014RQQExRpYpGtigUkUv5VKnfSUlQLkr8cjJLNv1SKIu8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cNnSG0vTqbUJS6pfAx46ye5Q3PHO1ymo2nERG7iiBCN4h0eHT
	W3hYPy8Xfhw1BFQ3WWTO6DD3/9cCtbmYeXlvPvhoQBqo+bsre8Upo7I=
X-Gm-Gg: AZFdTZcA4Jy1JvmqEZ/Sc45cV8HTjgpzRZXjE6GD41AQ5H9YcvoqITbv2keDzHCzHrg
	6Kj5yhASk167v1UZ9PAtjGUcUE7LRDMP3KVPsslx4T67bLwFXP9JxnJVK+BR9grfPG7Z7XN7KVI
	R0RoLNgX5X4jst0uG0HX7aIjhDCjcV3z7iwIdoecGpqoycDzExsiycl88GKmSQ+q1U5Jz+FAKNO
	JZ29IlV+NBdWdnhN3zSv3kxaLVi6EpK9dCBBrFHBPTrNgI14ZqyTHJE2WajYFLS69p9kFb+kcn/
	bz5ju2M8KEIax94IYaipSLZuBybRSstmhyFkIN53mWXplWmwToo0QT/LHYEbxhHD3K1XLBIcUXo
	d/PqrusJVoUZ1DnbVNVX7VDBJQy0E9LB+OinUTApgoFm5WJPgeG9E5pa992M1rAFXRwCpE4mmLO
	aTU7yfxyedzyjbZLEJGKdEj6omNABqZ/ot6HVydq0ncb26pzVkcNg6hU7IL8WAm/8/ya4BLiJcl
	zAb8bFVE3LqWCrC61J0B1oOhadFO7hArdut1HhjNWbtDca6IdWs0Ji09mMOhhNqLeXCMmHQ9YGh
	u9AIQ4XCn8kEmEvqFGqbU4lBqZVzYmAQswoGNRDht+J8G9haNwUxxTZ26VyT6E4Yo6HoUySHQ9s
	AP46GJRYtJR47LSsehYKBawpZEPp0r5aMCmoIHCnsp4BKMeFsmmImdVvOnZS5UnKec0ylAdPWvV
	TwZ59nw+CaQXJrvUVKtS080nSd0P+8m2bp
X-Received: by 2002:a05:600c:4f0d:b0:4bb:5c97:f4b1 with SMTP id 5b1f17b1804b1-4bb8881941bmr368118945e9.24.1795560668275;
        Tue, 24 Nov 2026 14:51:08 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-2ec1-8a00-a10d-4335-1e05-e7ae.310.pool.telefonica.de. [2a02:3100:2ec1:8a00:a10d:4335:1e05:e7ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm393839525e9.9.2026.11.24.14.51.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 14:51:07 -0800 (PST)
From: Tobias Philipp <tphilipp@gmail.com>
To: bpf@vger.kernel.org
Cc: Tobias Philipp <tphilipp@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Thibaut=20VAR=C3=88NE?= <hacks@slashdirt.org>,
	Stijn Tintel <stijn@linux-ipv6.be>,
	Daniel Mack <daniel@zonque.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v2 2/4] bpf: Align lpm_trie map values to 8 bytes
Date: Tue, 24 Nov 2026 23:50:53 +0100
Message-ID: <20261124225055.87344-3-tphilipp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124225055.87344-1-tphilipp@gmail.com>
References: <20261124225055.87344-1-tphilipp@gmail.com>
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

The verifier checks the alignment of PTR_TO_MAP_VALUE accesses only
against the offset within the value and assumes that the value itself
starts on an 8-byte boundary. It accepts BPF_DW atomics and 64-bit
load-acquire/store-release at 8-byte aligned offsets of a value.

lpm_trie stores the value directly behind the key bytes, at
node->data + trie->data_size, where data_size is key_size - 4 and can
be anything from 1 to 256. Nodes come from bpf_mem_alloc, which returns
8-byte aligned objects (on 32-bit architectures since the previous
patch), and data[] is at offset 24 (64-bit) or 16 (32-bit) in the node.
So the value is 8-byte aligned only if data_size is a multiple of 8.
For an IPv4 trie (key_size 8, data_size 4) it is 4 mod 8.

On arm64 the JIT emits LSE atomics or LDXR/STXR loops, LDAR and STLR
for these instructions. All of them raise an alignment fault on a
misaligned address. FEAT_LSE2 relaxes that for LSE atomics that stay
within a 16-byte block, and for LDAR/STLR only if SCTLR_EL1.nAA is
set, which Linux does not do. The fault is not fixed up. This oops is
from a 64-bit atomic add at offset 8 of an IPv4 lpm_trie value, which
crosses a 16-byte boundary (Linux 7.3.5 under QEMU, HVF on an
FEAT_LSE2 host):

  Mem abort info:
    ESR = 0x0000000096000021
    FSC = 0x21: alignment fault
  Internal error: Oops: 0x96000021 [#1] SMP
  pc : bpf_prog_cc9155b98965fc5e+0x64/0x90
  Call trace:
   bpf_prog_cc9155b98965fc5e+0x64/0x90 (P)
   bpf_dispatcher_xdp_func+0x14/0x28
   bpf_test_run+0x11c/0x360
   bpf_prog_test_run_xdp+0x358/0x548

On x86-64 a locked 8-byte access at 4 mod 8 is a split lock when it
crosses a cache line, which is fatal in kernel mode on CPUs with split
lock detection ("Split lock detected").

Round data_size up to a multiple of 8 when computing the value offset
and the node size, like hashtab does for keys. IPv4 nodes grow by 4
bytes, IPv6 nodes (data_size 16) are unchanged. Add a BUILD_BUG_ON()
for the offset of data[], which the alignment of the value relies on.

This patch and the previous one have to be applied together. Without
the previous patch, nodes are at 4 mod 8 on 32-bit architectures and
this patch misaligns the IPv4 value there, which is aligned today by
accident. Without this patch, the previous one misaligns it.

This was found with AI assistance while trying to verify the
correctness of map value accesses with formal methods. The patch was
written with the help of an AI coding assistant (Claude Opus 5.5).

Fixes: b95a5c4db09b ("bpf: add a longest prefix match trie map implementation")
Signed-off-by: Tobias Philipp <tphilipp@gmail.com>
---
 kernel/bpf/lpm_trie.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/kernel/bpf/lpm_trie.c b/kernel/bpf/lpm_trie.c
index 4d6f25db9..44ad5c163 100644
--- a/kernel/bpf/lpm_trie.c
+++ b/kernel/bpf/lpm_trie.c
@@ -286,7 +286,7 @@ static void *trie_lookup_elem(struct bpf_map *map, void *_key)
 	if (!found)
 		return NULL;
 
-	return found->data + trie->data_size;
+	return found->data + round_up(trie->data_size, 8);
 }
 
 static struct lpm_trie_node *lpm_trie_node_alloc(struct lpm_trie *trie,
@@ -302,7 +302,7 @@ static struct lpm_trie_node *lpm_trie_node_alloc(struct lpm_trie *trie,
 	node->flags = 0;
 
 	if (value)
-		memcpy(node->data + trie->data_size, value,
+		memcpy(node->data + round_up(trie->data_size, 8), value,
 		       trie->map.value_size);
 
 	return node;
@@ -597,8 +597,14 @@ static struct bpf_map *trie_alloc(union bpf_attr *attr)
 
 	raw_res_spin_lock_init(&trie->lock);
 
-	/* Allocate intermediate and leaf nodes from the same allocator */
-	leaf_size = sizeof(struct lpm_trie_node) + trie->data_size +
+	/* Allocate intermediate and leaf nodes from the same allocator.
+	 * The key bytes are padded to a multiple of 8 bytes, because the
+	 * verifier assumes that map values are 8-byte aligned. Objects from
+	 * bpf_mem_alloc are 8-byte aligned, so data[] must be as well.
+	 */
+	BUILD_BUG_ON(offsetof(struct lpm_trie_node, data) % 8);
+	leaf_size = sizeof(struct lpm_trie_node) +
+		    round_up(trie->data_size, 8) +
 		    trie->map.value_size;
 	err = bpf_mem_alloc_init(&trie->ma, leaf_size, false);
 	if (err)
@@ -766,8 +772,9 @@ static u64 trie_mem_usage(const struct bpf_map *map)
 	struct lpm_trie *trie = container_of(map, struct lpm_trie, map);
 	u64 elem_size;
 
-	elem_size = sizeof(struct lpm_trie_node) + trie->data_size +
-			    trie->map.value_size;
+	elem_size = sizeof(struct lpm_trie_node) +
+		    round_up(trie->data_size, 8) +
+		    trie->map.value_size;
 	return elem_size * READ_ONCE(trie->n_entries);
 }
 
-- 
2.54.0 (Apple Git-157)

