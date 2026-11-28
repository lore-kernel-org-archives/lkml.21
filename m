Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795874808;
	b=mc6nr40NDelBiGOrrAdwew7/5MXIWzdPCR5VCnKDyQPPpwfHQBFyu6X5f0sczYLp1MGH
	 SlYgD1Ze6Mmle0wVolsULrCeXmxVVslIKN0wbzXmIbWB9sQmHPpPicCME0tqWUKVJIUop
	 muBlo/4TiXpMjZZTmjVffaBYGd58b/U404lE6wT2/SQ7tsyeVLVliHUBrUzyqQOWREk9E
	 pyOzLPsjGBfF+pu1WOpvAKhzF/rRGM7Io9Bm4vxil8VepHmzGegGjcg7VkHTGjbfYrysN
	 C92n5T/wiwVirhPVb+gWSmx57bh5Ahc55YqSR7+mTlkaSCig12teUdlVTL45lfv4f0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795874808;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=Z8KmWdl0qbiURGdg/YdApF3tgcqIDI5YDlnuNSdo9EU=;
	b=MvK9cDmlsCJuQbTAqhpk8YvSM/iq987vyzoS9/u3Hl8nfKAl/5fdmZDmspHVjnA3Jvpd
	 kXTMxD0F2fiBghBVoHPZftECNcHQxbJQnYEW2bylAfa8l+IpwE+bl08bWc8C7hhJWZzEi
	 XS5M6o199T+XH9SdM/xppwFCvvjCNUU0dAOxcULZMHdvIynSGEzTEtckCc0DjgxIUxVk1
	 7YYbftWG1z66jw8BJXcR34SCTztMeYJfuUEtTgyKNoNvrboB9N1AfXPQ+qiWj5S3rzylc
	 9c4dQtMzBNGgInH6ddK/EQ0tbGCsANF1YyPJ5a6YeO1EI3iGKWhWeEIOo+BuODOET8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=KtwibhfX;
	arc=none smtp.remote-ip=220.197.31.9
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC537606A331
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 14:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC537606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=KtwibhfX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Z8
	KmWdl0qbiURGdg/YdApF3tgcqIDI5YDlnuNSdo9EU=; b=KtwibhfXRGXoztEtIn
	D4bs4sDPuLSVpcacYkKFD5JPx7Aib60X/t7pZps31AYcVPoO8y+9qZcjeXP/w8Ra
	kpJmcyg9NaZecpZg+GBWPLzxLX2wutV+23OhNN2mKWFs0hF/3mKGzNW4p9aMC8ou
	2WCKbT5Ltfv6xCsh+aOzgjWwk=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3V33K3wprUwS4EA--.39268S3;
	Sat, 28 Nov 2026 22:06:03 +0800 (CST)
From: Bilal Hashim <AeeSec@126.com>
To: Min Ma <mamin506@gmail.com>,
	Lizhi Hou <lizhi.hou@amd.com>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Bilal Hashim <AeeSec@126.com>
Subject: [PATCH] accel/amdxdna: Validate command BO size and payload in amdxdna_ctx
Date: Sat, 28 Nov 2026 22:05:37 +0800
Message-ID: <20261128140537.1325-2-AeeSec@126.com>
X-Mailer: git-send-email 2.47.0.windows.2
In-Reply-To: <20261128140537.1325-1-AeeSec@126.com>
References: <20261128140537.1325-1-AeeSec@126.com>
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
X-CM-TRANSID:_____wD3V33K3wprUwS4EA--.39268S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxCrW3ur4DAw4DJF48GFykXwb_yoWrtF15pF
	y3Gw15ArZ5JFWY9r47Aan3Z3yYqF1fta47X34qgw47AryjyF15Xa4YyrySvFW293ykCr12
	yFW5KFWY9FnYyF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRqXdnUUUUU=
X-CM-SenderInfo: 5dhh2vbf6rjloofrz/xtbBnwyII2sK38wJNAAA33

Command BOs (`AMDXDNA_BO_SHARE`) are mapped into userspace and their
contents can be modified by userspace at any time before or during
command execution. Three helpers in `amdxdna_ctx.c` access `struct
amdxdna_cmd` fields in the mapped BO without complete bounds checks:

1. `amdxdna_cmd_get_cu_idx()` computes `num_masks = 1 +
   FIELD_GET(AMDXDNA_CMD_EXTRA_CU_MASK, cmd->header)` (up to 4 `u32`
   words) and reads `cmd->data[0..num_masks - 1]` without verifying that
   `struct_size(cmd, data, num_masks) <= abo->mem.size`.
2. `amdxdna_cmd_set_error()` calls `amdxdna_cmd_get_payload(abo, NULL)`
   when `amdxdna_cmd_get_op(abo) == ERT_CMD_CHAIN`. Passing `size = NULL`
   bypasses the payload length validation in `amdxdna_cmd_get_payload()`,
   and `amdxdna_cmd_set_error()` then writes `cc->error_index` and reads
   `cc->data[0]` without verifying that the payload is large enough to
   hold a `struct amdxdna_cmd_chain` with at least one `data` entry.
   Furthermore, `memset(cmd->data, 0xff, abo->mem.size - sizeof(*cmd))`
   assumes `abo->mem.size >= sizeof(*cmd)`.
3. `amdxdna_cmd_get_payload()` only validates `count` against
   `abo->mem.size` when `size != NULL`. If called with `size == NULL`,
   it returns `&cmd->data[num_masks]` without checking that the offset
   lies within `abo->mem.size`.

Harden `amdxdna_cmd_get_payload()`, `amdxdna_cmd_get_cu_idx()`, and
`amdxdna_cmd_set_error()` by validating the command BO size and payload
length before reading or writing `cmd->data` and `amdxdna_cmd_chain`.

Signed-off-by: Bilal Hashim <AeeSec@126.com>
---
 drivers/accel/amdxdna/amdxdna_ctx.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
index 123456789abc..23456789abcd 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.c
+++ b/drivers/accel/amdxdna/amdxdna_ctx.c
@@ -117,74 +117,82 @@ void *amdxdna_cmd_get_payload(struct amdxdna_gem_obj *abo, u32 *size)
 	struct amdxdna_cmd *cmd = amdxdna_gem_vmap(abo);
 	u32 num_masks, count;
 
-	if (!cmd)
+	if (!cmd || abo->mem.size < sizeof(*cmd))
 		return NULL;
 
 	if (amdxdna_cmd_get_op(abo) == ERT_CMD_CHAIN)
 		num_masks = 0;
 	else
 		num_masks = 1 + FIELD_GET(AMDXDNA_CMD_EXTRA_CU_MASK, cmd->header);
 
-	if (size) {
-		count = FIELD_GET(AMDXDNA_CMD_COUNT, cmd->header);
-		if (unlikely(count <= num_masks ||
-			     count * sizeof(u32) +
-			     offsetof(struct amdxdna_cmd, data[0]) >
-			     abo->mem.size)) {
+	count = FIELD_GET(AMDXDNA_CMD_COUNT, cmd->header);
+	if (unlikely(count <= num_masks ||
+		     struct_size(cmd, data, count) > abo->mem.size)) {
+		if (size)
 			*size = 0;
-			return NULL;
-		}
-		*size = (count - num_masks) * sizeof(u32);
+		return NULL;
 	}
+
+	if (size)
+		*size = (count - num_masks) * sizeof(u32);
+
 	return &cmd->data[num_masks];
 }
 
 u32 amdxdna_cmd_get_cu_idx(struct amdxdna_gem_obj *abo)
 {
 	struct amdxdna_cmd *cmd = amdxdna_gem_vmap(abo);
 	u32 num_masks, i;
 	u32 *cu_mask;
 
-	if (!cmd)
+	if (!cmd || abo->mem.size < sizeof(*cmd))
 		return INVALID_CU_IDX;
 
 	if (amdxdna_cmd_get_op(abo) == ERT_CMD_CHAIN)
 		return INVALID_CU_IDX;
 
 	num_masks = 1 + FIELD_GET(AMDXDNA_CMD_EXTRA_CU_MASK, cmd->header);
+	if (unlikely(struct_size(cmd, data, num_masks) > abo->mem.size))
+		return INVALID_CU_IDX;
+
 	cu_mask = cmd->data;
 	for (i = 0; i < num_masks; i++) {
 		if (cu_mask[i])
 			return ffs(cu_mask[i]) - 1;
 	}
 
 	return INVALID_CU_IDX;
 }
 
 int amdxdna_cmd_set_error(struct amdxdna_gem_obj *abo,
 			  struct amdxdna_sched_job *job, u32 cmd_idx,
 			  enum ert_cmd_state error_state,
 			  void *err_data, size_t size)
 {
 	struct amdxdna_client *client = job->hwctx->client;
 	struct amdxdna_cmd *cmd = amdxdna_gem_vmap(abo);
 	struct amdxdna_cmd_chain *cc = NULL;
+	u32 payload_len;
 
-	if (!cmd)
+	if (!cmd || abo->mem.size < sizeof(*cmd))
 		return -ENOMEM;
 
 	cmd->header &= ~AMDXDNA_CMD_STATE;
 	cmd->header |= FIELD_PREP(AMDXDNA_CMD_STATE, error_state);
 
 	if (amdxdna_cmd_get_op(abo) == ERT_CMD_CHAIN) {
-		cc = amdxdna_cmd_get_payload(abo, NULL);
+		cc = amdxdna_cmd_get_payload(abo, &payload_len);
+		if (!cc || !cc->command_count ||
+		    payload_len < struct_size(cc, data, cc->command_count))
+			return -EINVAL;
+
 		cc->error_index = (cmd_idx < cc->command_count) ? cmd_idx : 0;
 		abo = amdxdna_gem_get_obj(client, cc->data[0], AMDXDNA_BO_SHARE);
 		if (!abo)
 			return -EINVAL;
 		cmd = amdxdna_gem_vmap(abo);
-		if (!cmd) {
+		if (!cmd || abo->mem.size < sizeof(*cmd)) {
 			amdxdna_gem_put_obj(abo);
 			return -ENOMEM;
 		}
 	}
-- 
2.43.0

