Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795874803;
	b=ogKViTA/s6UrkjKp7BsBLL7PqW6bMyWn0UzDq1pNwuijYLETWzY7sqp1aM7N2tBXl70m
	 P+qWcKT7OmJFBWni4EPRh/Qc/qnVBYPSPOr5hHyZVDupFOo2/p8wGW3YiIFQrXNHTTvpd
	 s+kuEvt62u0ZfrA3LcC3gw/aB8waUiYt0MxUIgfyQiyzmiH579JdUs/HUTG41IFgZEPQH
	 BNMYmHjH6K4Uok+WELnwN6TB4imf/bFLK1EYVpj5M+Gi7RGmnZua0QX/oGn508f2lgjDH
	 ptGs93oXOunCqNTQTuIrpNG9Ys1xGpz31MG+A5dAvCmEZViqD4PHIiGcQ16UtDL3fWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795874803;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=vB6MvQtoRdBVLTlNAUA6Y4RINk1pxHA3ARUx1mgTHxI=;
	b=V5gFwxPQEV7fJGlwC/gPlPaRQFvPTxu53g6hYnXCfeA71jnhknOSQXft1nsnCrm7Anc+
	 DsMK0FkXCVfJia5jonU16zOEosr4QC0EuUgPZfI+uLTAhj3A2ot6UtS5sCZjDfDNODZpW
	 tug7d8Ug3cFKzEny6Hy4YuHJsrHjZneaIMLrc+keEnK4ye4OuGqYgaXvcm915zx6ebSrZ
	 1ApMFjuupnjvKgLo4GxjLz8X9EDw42zj2U92U37Jt/24hjZvu+9e2z1PBt8764wYczHjx
	 kMZoVGUSekoHM9OxawnZxX15KCH0Prcga98nUYmahBSWvqZC3gbxVbRDkHtvNlJuN8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=CQXnMf30;
	arc=none smtp.remote-ip=220.197.31.7
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A17606A325
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 14:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69A17606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=CQXnMf30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=vB
	6MvQtoRdBVLTlNAUA6Y4RINk1pxHA3ARUx1mgTHxI=; b=CQXnMf30t8kZAPUixY
	W3FpELtTu5X1sIlfyAADmij+OJSqeTtzTAtJVg7vI8eJ6KrqeOOL5RHUfrQGgS6E
	28QP4FOIjC8YNDRc0OUMdoKBd24VpCGG1r+WM//MszPOkahBd+f+RtnepH9RdWCN
	fAeGCZhysqYszHbpkGLqb64iM=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3V33K3wprUwS4EA--.39268S2;
	Sat, 28 Nov 2026 22:06:03 +0800 (CST)
From: Bilal Hashim <AeeSec@126.com>
To: Min Ma <mamin506@gmail.com>,
	Lizhi Hou <lizhi.hou@amd.com>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Bilal Hashim <AeeSec@126.com>
Subject: [PATCH] accel/amdxdna: Fix NULL pointer dereference and u32 underflow in aie2_message
Date: Sat, 28 Nov 2026 22:05:36 +0800
Message-ID: <20261128140537.1325-1-AeeSec@126.com>
X-Mailer: git-send-email 2.47.0.windows.2
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
X-CM-TRANSID:_____wD3V33K3wprUwS4EA--.39268S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAF1fCFyrZrW3ArWkXw1UZFb_yoW7JF4kpF
	9rury5trZ8Jr48Kr1IyF4ku3yUGF17Ka4qqrykuw43Ar1rJF4UAay7tFyvqrZxZ395AFy2
	kr4vqF4FqF92yF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_SdgDUUUUU=
X-CM-SenderInfo: 5dhh2vbf6rjloofrz/xtbBnguHImsK38tBSwAA3P

amdxdna_cmd_get_payload() returns NULL and sets *size = 0 when the
user-supplied command header in the shared command BO has an invalid
AMDXDNA_CMD_COUNT (for example, count <= num_masks or exceeding the BO
size), or if amdxdna_gem_vmap() fails.

However, the eight command payload helpers in aie2_message.c do not
check the return value of amdxdna_cmd_get_payload() for NULL before
dereferencing it or passing it to memcpy():

1. In aie2_init_exec_dpu_req():
   - `if (cmd_len - sizeof(*sn) > sizeof(dpu_req->payload))` performs an
     unsigned 32-bit subtraction (`u32 cmd_len - sizeof(*sn)`). If
     `cmd_len < sizeof(*sn)` (for instance, `cmd_len == 4`), on 64-bit
     architectures `sizeof(*sn)` is `size_t`, so `(size_t)cmd_len -
     sizeof(*sn)` wraps around and is rejected, unless `cmd_len` is 0
     (when `sn == NULL`) or if `sn` is dereferenced when `cmd_len` is
     valid for the check on 32-bit platforms. More importantly, when
     `cmd_len < sizeof(*sn)` or `sn == NULL`, `cmd_len < sizeof(*sn)`
     is not explicitly checked first.
2. In aie2_init_exec_cu_req(), aie2_cmdlist_fill_cf(), and
   aie2_cmdlist_fill_npu_cf():
   - When `amdxdna_cmd_get_payload()` returns `NULL` with `cmd_len == 0`,
     the size check (`cmd_len > ...` or `*size < sizeof(...) + cmd_len`)
     passes, and if `amdxdna_cmd_get_cu_idx()` succeeds (because the CU
     mask word in the command BO is non-zero), `cmd` (`NULL`) is passed
     to `memcpy()`, or in future/non-zero paths dereferenced directly.
3. Similarly, in aie2_cmdlist_fill_dpu(), aie2_cmdlist_fill_npu_dpu(),
   aie2_cmdlist_fill_npu_preempt(), and aie2_cmdlist_fill_npu_elf(),
   checking `!sn` / `!pd` right after `amdxdna_cmd_get_payload()` makes
   the error handling explicit and consistent with
   aie2_cmdlist_multi_execbuf().

Add explicit NULL checks after every amdxdna_cmd_get_payload() call and
check `cmd_len < sizeof(*sn)` in aie2_init_exec_dpu_req() before
subtracting `sizeof(*sn)`.

Signed-off-by: Bilal Hashim <AeeSec@126.com>
---
 drivers/accel/amdxdna/aie2_message.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index 8fa123456789..9ab234567890 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -556,7 +556,7 @@ static int aie2_init_exec_cu_req(struct amdxdna_gem_obj *cmd_bo, void *req,
 	void *cmd;
 
 	cmd = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
-	if (cmd_len > sizeof(cu_req->payload))
+	if (!cmd || cmd_len > sizeof(cu_req->payload))
 		return -EINVAL;
 
 	cu_req->cu_idx = amdxdna_cmd_get_cu_idx(cmd_bo);
@@ -578,7 +578,7 @@ static int aie2_init_exec_dpu_req(struct amdxdna_gem_obj *cmd_bo, void *req,
 	u32 cmd_len;
 
 	sn = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
-	if (cmd_len - sizeof(*sn) > sizeof(dpu_req->payload))
+	if (!sn || cmd_len < sizeof(*sn) || cmd_len - sizeof(*sn) > sizeof(dpu_req->payload))
 		return -EINVAL;
 
 	dpu_req->cu_idx = amdxdna_cmd_get_cu_idx(cmd_bo);
@@ -623,6 +623,8 @@ aie2_cmdlist_fill_cf(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *size)
 	void *cmd;
 
 	cmd = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
+	if (!cmd)
+		return -EINVAL;
 	if (*size < sizeof(*cf_slot) + cmd_len)
 		return -EINVAL;
 
@@ -646,6 +648,8 @@ aie2_cmdlist_fill_dpu(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *size)
 	u32 arg_sz;
 
 	sn = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
+	if (!sn)
+		return -EINVAL;
 	arg_sz = cmd_len - sizeof(*sn);
 	if (cmd_len < sizeof(*sn) || arg_sz > MAX_DPU_ARGS_SIZE)
 		return -EINVAL;
@@ -706,6 +710,8 @@ aie2_cmdlist_fill_npu_cf(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *siz
 	void *cmd;
 
 	cmd = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
+	if (!cmd)
+		return -EINVAL;
 	if (*size < sizeof(*npu_slot) + cmd_len)
 		return -EINVAL;
 
@@ -731,6 +737,8 @@ aie2_cmdlist_fill_npu_dpu(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *si
 	u32 arg_sz;
 
 	sn = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
+	if (!sn)
+		return -EINVAL;
 	arg_sz = cmd_len - sizeof(*sn);
 	if (cmd_len < sizeof(*sn) || arg_sz > MAX_NPU_ARGS_SIZE)
 		return -EINVAL;
@@ -763,6 +771,8 @@ aie2_cmdlist_fill_npu_preempt(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t
 	u32 arg_sz;
 
 	pd = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
+	if (!pd)
+		return -EINVAL;
 	arg_sz = cmd_len - sizeof(*pd);
 	if (cmd_len < sizeof(*pd) || arg_sz > MAX_NPU_ARGS_SIZE)
 		return -EINVAL;
@@ -799,6 +809,8 @@ aie2_cmdlist_fill_npu_elf(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *si
 	u32 arg_sz;
 
 	pd = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
+	if (!pd)
+		return -EINVAL;
 	arg_sz = cmd_len - sizeof(*pd);
 	if (cmd_len < sizeof(*pd) || arg_sz > MAX_NPU_ARGS_SIZE)
 		return -EINVAL;
-- 
2.43.0

