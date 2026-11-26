Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722236;
	b=1ECGeu8OisBiZg+E73R3A72bBW3c+PkbEInuqmFK24LOdN7/SwzBS8W4zfLw6wkfoeN2
	 IJBy1SF9OijrPIBGxWJ1TkQTgd5jYGmBJXEuQbJFFJ8SljXG0krJ/jlw8Ok3zOuCfrwJr
	 /87eH2+I7NPZaWqeSkrrnjQUFiWvKZUo3Xv5V4uAgBRxC6D4NpiC0XMqauz1smq/xKmRz
	 D/FRDMrc//KPOY5EtMl+lDUcnGtERTmI/34HaIoQmF+uIDidjwmUzPYDazFPQ4KxE6nWp
	 FW/cP9xzUqtAvnPmgHyI2yvJzd+2A9tNg5RtxaEXT8cTz+8Xusa57Y9TEMhKcO+aBjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=jrigqiEu/nUvTtr8hgpZahiDD4O3PEjOJSdql4Qjodk=;
	b=nyxKm1fTxn+xM4O9nmmlGSOB6PDF2ql+e33ZsMZmXEk58Lx7Ct6fuP4agbdwQZbBPrtb
	 xDBat53aUl86YoGVeF/8AgcVRX6UDrh8jmYlPQFYEHjJIKjonQ4JvZVjN7t4dUPTPoM3a
	 /CPL7jHuVVGYa6YcQz9p4b27QQKq/j3OQ55TydywWp3VqTWhBUolQoqcPBV/gCQ71MsgK
	 47eF77A9nyrkZTgH7/CJKYA/JXrAlAvJGd7nBR6ILeVIEoAjiF9Hi5jCd+zAvE1LhDUNs
	 U7hXWoAANMdEWWYC0CgWR/iatdGDb24r4De4vE9O37Qxz1B7jYKk6xg/5Px8yexvocw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PyVbppDE;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDB2606A681
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:43:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DDB2606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PyVbppDE
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-491971ac844so6557699f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795722235; x=1796327035; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jrigqiEu/nUvTtr8hgpZahiDD4O3PEjOJSdql4Qjodk=;
        b=PyVbppDELwapfZejZuEVjFUH+2ZfV/Vl6jrAWcWIjWx5a6Zm6N9KeTAjL5jJgpU2ir
         1VWVY790G4blO1jscYj9zrrw6pKG+5mc3NbgtDk7xOeZVES9LGSr1Po7vQXHibHmBDzk
         sbJumCKiGZ2vXSfR1vZu0QrheYNpdo/sETD/+9C1okhk+rXeCusWM+TCZ1APkkVhBf+2
         SWCTAyudwBNRfVCNmghUQ8RTzXSu6KbfHjIF6kHM1NRQ8gvrGvleM+u6n01hukNarfVM
         R+6q989ebo6QDLUO6NOSABum1KiqgMxbXZan7PwD2cqMlNR+l1Gh8oqRDHkJmgF4T7HD
         gXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722235; x=1796327035;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrigqiEu/nUvTtr8hgpZahiDD4O3PEjOJSdql4Qjodk=;
        b=w9Bue92zE16unIBCMtnWiLN09XJc31XArDmHDRxZthw6f7SvoGb0dBCxx+aWph/g7J
         uVJTf+LCxMplK8BxdYyowP0fe9xMh60JiWBVkbXznmtqJceHU/ohUt9jIyrBQ247I7HW
         Leh9fj8KXfC0Ox53A1QsSwuZPfay+LpD61A+zOzAwSjhivifPqrsqfL5RdxumDcgfjBe
         1ymWbAY+NAp/PhTB/eMtryCQrwfTUIqOR7vfux21ntBEUHGa/mF4tY8XD7Xa6WkjyJRh
         7HAbPMoU/rpcPa1cNUY23Ao5T7MtyQ4GESVRha7/ySJD9h5zzp29LD781eL3WzBm3L6/
         /tqw==
X-Forwarded-Encrypted: i=1; AL+hErEEltOHUj2+cFLVZ074imDvORoHm4Wra9jc3uVRnXVF9s9/1M4y89gGaxoyQFjO6BjCKgWswt988kA0oiw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+z4VyUINzIIFtzqK2QPDi1gF1HhTGEuHorUyLlX5ZY2HKeQ9rb
	LnPdsXkgab/cZkUnxm6JsuNWuN1Qxj/kNHXIkQk/X7mQShBIkf5Id0A=
X-Gm-Gg: AZFdTZcYGmwy5E3rXdQaQJ0VvI7YCA5DLMznEhyBSA/N6Ap8reUEjNYglcNHMkF+6JC
	yGFNFThOGt4TcMIRAAxtHyxUpRcj2c0KMi/lwDaLNqHzeBc+MthcqTONHXWM+UhUPwD4ykgE5IG
	Ep5Jw3/5bSdkLJrzLkGn5F2NaJmCEHmpQk4beF5OJtlCl739MSzIdBbEMNr1nFIYiGeRt+vkYAF
	JhzQRpmS9VxwhCC6mTqPm7oNAuYtsNs0j9YWAVjy2KgaWQZftlj1X8FSW8pjVmI73uJNQ6M1guf
	MKnJLhCX5G5ifjESreVAWwLWReCR8v29aobbPkeqDO6DYJ7SBEeSeXao+YDUgPU1bIlJmHr6yuh
	6TXWVooE1aax2/KTrvn6a6QubxCU+e9qHQSVqlTdSfEjcZEuJzYsjDbv2XuM9IZb0XXX/LSWbTR
	P7GFpZpcY2en0Fo61/PGhGaCDjf360XtlNjheFyOPbTO0u2Pc+NpNksKTdtbH1wQCkfAGaM4TT/
	vHw+1N136lVKjsVJ3Pm8dH5TYH5GCjGvGEnm0I0cvC4Mn07CcmEBTfV2x7Ss6twjvZN1+2/eG3y
	KlKsKQKxMMzarj1hLn0MwoHVWLCmz5R6N5XfcCV3CcIMdhLBQFLr9d+YuQflJWpAakgmxvMKDHs
	L5g9j2D+I1Gh/MqGgX8Neh5v0GHB2egUyxDlSHjWH+FJpbu0O1uy/h4S38j5IMarmE/AuXcedTQ
	yVnaruXJE1Vzqos0CTMxyGB3lguGepVBQq6Q==
X-Received: by 2002:a5d:5888:0:b0:48d:f488:f32a with SMTP id ffacd0b85a97d-4abb55183b4mr42236325f8f.56.1795722234481;
        Thu, 26 Nov 2026 11:43:54 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-2317-a900-4811-d431-309f-6626.310.pool.telefonica.de. [2a02:3100:2317:a900:4811:d431:309f:6626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm43663924f8f.3.2026.11.26.11.43.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 11:43:54 -0800 (PST)
From: Tobias Philipp <tphilipp@gmail.com>
To: bpf@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
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
	=?UTF-8?q?Thibaut=20VAR=C3=88NE?= <hacks@slashdirt.org>,
	Stijn Tintel <stijn@linux-ipv6.be>,
	Daniel Mack <daniel@zonque.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tobias Philipp <tphilipp@gmail.com>
Subject: [PATCH bpf-next v3 1/4] bpf: Fix alignment of memory allocator objects on 32-bit archs
Date: Thu, 26 Nov 2026 20:43:44 +0100
Message-ID: <20261126194347.42466-2-tphilipp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261126194347.42466-1-tphilipp@gmail.com>
References: <20261126194347.42466-1-tphilipp@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Felix Fietkau <nbd@nbd.name>

The BPF memory allocator prefixes each object with a header that holds
struct llist_node while the object sits on a free list, and a pointer
to the owning bpf_mem_cache while it is allocated. The header size was
sizeof(struct llist_node), so on 32-bit architectures the memory handed
out was offset by 4 bytes from the 8-byte aligned kmalloc allocation.

The verifier assumes that allocated objects are 8-byte aligned and
allows BPF_DW atomic instructions on their u64 fields, e.g. on values
of non-preallocated hash maps, objects from bpf_obj_new() and local
storage. On arm32 the JIT does not implement atomics, and the
interpreter executes them via atomic64_*(), which are implemented with
LDREXD/STREXD on ARMv6K and later. Those instructions require 8-byte
aligned addresses; a misaligned address raises an alignment fault and
crashes the kernel.

Pad the header to 8 bytes to preserve the alignment provided by
kmalloc. Store the percpu pointer of percpu objects at the new header
offset instead of assuming the header is pointer-sized, and update the
copy of the header size used by the hash map memory usage accounting.

Fixes: 7c8199e24fa0 ("bpf: Introduce any context BPF specific memory allocator.")
Reported-by: Thibaut VARÈNE <hacks@slashdirt.org>
Reported-by: Stijn Tintel <stijn@linux-ipv6.be>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Link: https://lore.kernel.org/all/20260717183632.99195-1-nbd@nbd.name/
[tphilipp: rebased onto bpf-next, adjusted context in hashtab.c.
 Local storage no longer uses bpf_mem_alloc in bpf-next. On 32-bit
 this patch moves an IPv4 lpm_trie value from 0 to 4 mod 8; the next
 patch fixes that, so both have to be applied together.]
Signed-off-by: Tobias Philipp <tphilipp@gmail.com>
---
 kernel/bpf/hashtab.c  | 2 +-
 kernel/bpf/memalloc.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/bpf/hashtab.c b/kernel/bpf/hashtab.c
index a2d0bfd4c..b84911054 100644
--- a/kernel/bpf/hashtab.c
+++ b/kernel/bpf/hashtab.c
@@ -2594,7 +2594,7 @@ static u64 htab_map_mem_usage(const struct bpf_map *map)
 		else if (!lru)
 			usage += sizeof(struct htab_elem *) * num_possible_cpus();
 	} else {
-#define LLIST_NODE_SZ sizeof(struct llist_node)
+#define LLIST_NODE_SZ ALIGN(sizeof(struct llist_node), 8)
 
 		num_entries = bpf_map_sum_elem_count(map);
 		usage += (htab->elem_size + LLIST_NODE_SZ) * num_entries;
diff --git a/kernel/bpf/memalloc.c b/kernel/bpf/memalloc.c
index 15684d0fc..29d62d864 100644
--- a/kernel/bpf/memalloc.c
+++ b/kernel/bpf/memalloc.c
@@ -33,7 +33,7 @@
  * Every allocated objected is padded with extra 8 bytes that contains
  * struct llist_node.
  */
-#define LLIST_NODE_SZ sizeof(struct llist_node)
+#define LLIST_NODE_SZ ALIGN(sizeof(struct llist_node), 8)
 
 #define BPF_MEM_ALLOC_SIZE_MAX 4096
 
@@ -148,7 +148,7 @@ static struct llist_node notrace *__llist_del_first(struct llist_head *head)
 static void *__alloc(struct bpf_mem_cache *c, int node, gfp_t flags)
 {
 	if (c->percpu_size) {
-		void __percpu **obj = kmalloc_node(c->percpu_size, flags, node);
+		void *obj = kmalloc_node(c->percpu_size, flags, node);
 		void __percpu *pptr = __alloc_percpu_gfp(c->unit_size, 8, flags);
 
 		if (!obj || !pptr) {
@@ -156,7 +156,7 @@ static void *__alloc(struct bpf_mem_cache *c, int node, gfp_t flags)
 			kfree(obj);
 			return NULL;
 		}
-		obj[1] = pptr;
+		*(void __percpu **)(obj + LLIST_NODE_SZ) = pptr;
 		return obj;
 	}
 
@@ -262,7 +262,7 @@ static void alloc_bulk(struct bpf_mem_cache *c, int cnt, int node, bool atomic)
 static void free_one(void *obj, bool percpu)
 {
 	if (percpu)
-		free_percpu(((void __percpu **)obj)[1]);
+		free_percpu(*(void __percpu **)(obj + LLIST_NODE_SZ));
 
 	kfree(obj);
 }
-- 
2.54.0 (Apple Git-157)

