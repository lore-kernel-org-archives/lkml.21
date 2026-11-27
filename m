Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776262;
	b=3Y8CB4qJiQXa/+w+xuTJ6I+P42ntq+WoijkG/DLeCG2OgV1Gz4W5Oq/Sv8eRvwDhdJYg
	 k/acfz3Xt2ctFYk7p+GhLiKypcxhhoaGa58pB5Bui3zE3Q7gFS2XR3B0bAg5sXI5t0knJ
	 u3UpOyO0HFwvAaspTSCQ06sfI124O6fUwv8hWrtf3ZfwxiCx0qCKV81a1gPD1CLRcFjWW
	 zJcJnWl3Pev0edmimh0aZ2ypnD6a6kquYjVwL6dr8tpNcub2Vgv3iqrp+1LiKuuU2a1wC
	 rQxE6hy6FYXjIhsk/HKwBwcmKZHKx/L7v9DYAZGQ98IhlqqcJvBflqM8h/Xz1c3IMTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776262;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=pl0Gvhsro2PjBnRJhxg/ErapEbqsZ2NXrIvjoDnrNu0=;
	b=aOI0tL6RPpsjDlxucJGxXGiqApIqvwqRRYCRR9wxaxTLDc/SjIv1YCVZ2VlgdE5HhB2c
	 nIZ9ImEI508KEZLgSvP8m8VXEifJUNYYJIzL1vB6sAuEUpx/vASDM8fsGu+uysHRlm+Jr
	 1vW2XCB9gEY9lWYQdpWAFO1KiTqesnZkJ9eZqjwsttOgmLmdhxILfOo5Ijx+I7gb0r8xv
	 c2Whrr8qIc/VT9MX9darrjPDMnW58OEWQTY0lBDTVkmZ0KSBAbz6/rikyE++U9i+Oloiz
	 UDJZVBwK8X3kqbzJ4ao7bvpaOTwi1lFucRwO2dxEPTVl9iI2FCQHNIVC+gzYBkcgW3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bn7J2ISi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF087606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bn7J2ISi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5952C1F008A0;
	Fri, 27 Nov 2026 10:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795776262;
	bh=pl0Gvhsro2PjBnRJhxg/ErapEbqsZ2NXrIvjoDnrNu0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Bn7J2ISilqGSXweXP7l+13uQ1pOQHebdQTvHM6avbHfACUn8Nu1RF7lmenOjo795i
	 AllRHml3yZEPpQyE3wsWFwXXzQzwRUxKum4H7K3DdkVmbMYeddTZGMNggV2umh80Jf
	 adRy7/Juy7Qum9U/+gHRAyPsFO4VTOWhZ4MqvOlM2s3PAsNDP+Bjh66W9x01E+4RBt
	 mtGDk4NqBOInBlnhrrvR314mQmF8ZX/Z3GnXSriomFtRZ88bjnaweCNiy1PgEZLRtc
	 ovjnjKxZleRU3Q8XLNh7rh6Ny95giCTo79ZrqNOD2ZlXjXK8/KpDvmIMqJKlKzwuOV
	 rsZhcmce4fCjw==
From: srini@kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Jianping Li <jianping.li@oss.qualcomm.com>,
	stable@kernel.org,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 6/6] misc: fastrpc: avoid duplicate DMA mappings in fastrpc_create_maps()
Date: Fri, 27 Nov 2026 10:43:54 +0000
Message-ID: <20261127104354.8452-7-srini@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127104354.8452-1-srini@kernel.org>
References: <20261127104354.8452-1-srini@kernel.org>
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

From: Jianping Li <jianping.li@oss.qualcomm.com>

DMA handles passed as invoke arguments (scalars beyond nbufs) may refer
to the same dma_buf fd as an input/output buffer argument. Taking an
extra reference for such DMA handle maps leads to duplicate mappings and
an unbalanced reference count, since DMA handle maps are released
separately when the DSP returns the fd through the fdlist.

Fix this by not taking an extra reference for DMA handle arguments
(take_ref = false) and tagging them with FASTRPC_MAP_DMA_HANDLE. As
these maps are borrowed references, fastrpc_get_args() re-validates the
map via fastrpc_map_lookup() before dereferencing it, so it is not used
after being freed. fastrpc_put_args() only releases maps flagged as
FASTRPC_MAP_DMA_HANDLE and clears the flag to guarantee the map is freed
exactly once.

Fixes: 10df039834f84 ("misc: fastrpc: Skip reference for DMA handles")
Cc: stable@kernel.org
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
Link: https://lore.kernel.org/all/20260805060940.41414-1-jianping.li@oss.qualcomm.com/
Signed-off-by: Srinivas Kandagatla <srini@kernel.org>
---
 drivers/misc/fastrpc.c | 56 +++++++++++++++++++++++++++++++-----------
 1 file changed, 41 insertions(+), 15 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index c8b701395821..767db10a595b 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -52,6 +52,9 @@
 #define FASTRPC_CTXID_SEQ_SHIFT	16
 #define FASTRPC_CTXID_SEQ_MASK	GENMASK_ULL(63, 16)
 
+/* Map the DMA handle in the invoke call for backward compatibility */
+#define FASTRPC_MAP_DMA_HANDLE  0x20000
+
 /*
  * Newer DSP firmware implements a PD (Protection Domain) notification
  * framework that sends PD state notifications upon request. The PD exit
@@ -251,6 +254,7 @@ struct fastrpc_map {
 	u64 len;
 	u64 raddr;
 	u32 attr;
+	u32 flags;
 	struct kref refcount;
 };
 
@@ -950,7 +954,7 @@ static dma_addr_t fastrpc_compute_dma_addr(struct fastrpc_user *fl, dma_addr_t s
 }
 
 static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
-			      u64 len, u32 attr, struct fastrpc_map **ppmap)
+			      u64 len, u32 attr, struct fastrpc_map **ppmap, int mflags)
 {
 	struct fastrpc_session_ctx *sess = fl->sctx;
 	struct fastrpc_map *map = NULL;
@@ -967,6 +971,7 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
 
 	map->fl = fl;
 	map->fd = fd;
+	map->flags = mflags;
 	map->buf = dma_buf_get(fd);
 	if (IS_ERR(map->buf)) {
 		err = PTR_ERR(map->buf);
@@ -1041,13 +1046,13 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
 	return err;
 }
 
-static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
-			      u64 len, u32 attr, struct fastrpc_map **ppmap)
+static int fastrpc_map_create(struct fastrpc_user *fl, int fd, u64 len, u32 attr,
+			      struct fastrpc_map **ppmap, bool take_ref, int mflags)
 {
-	if (!fastrpc_map_lookup(fl, fd, ppmap, true))
+	if (!fastrpc_map_lookup(fl, fd, ppmap, take_ref))
 		return 0;
 
-	return fastrpc_map_attach(fl, fd, len, attr, ppmap);
+	return fastrpc_map_attach(fl, fd, len, attr, ppmap, mflags);
 }
 
 /*
@@ -1118,23 +1123,25 @@ static int fastrpc_create_maps(struct fastrpc_invoke_ctx *ctx)
 	int i, err;
 
 	for (i = 0; i < ctx->nscalars; ++i) {
+		bool take_ref = i < ctx->nbufs;
+		int mflags = 0;
 
 		if (ctx->args[i].fd == 0 || ctx->args[i].fd == -1 ||
 		    ctx->args[i].length == 0)
 			continue;
 
-		if (i < ctx->nbufs)
-			err = fastrpc_map_create(ctx->fl, ctx->args[i].fd,
-				 ctx->args[i].length, ctx->args[i].attr, &ctx->maps[i]);
-		else
-			err = fastrpc_map_attach(ctx->fl, ctx->args[i].fd,
-				 ctx->args[i].length, ctx->args[i].attr, &ctx->maps[i]);
+		/* Set the DMA handle mapping flag for DMA handles */
+		if (i >= ctx->nbufs)
+			mflags = FASTRPC_MAP_DMA_HANDLE;
+
+		err = fastrpc_map_create(ctx->fl, ctx->args[i].fd, ctx->args[i].length,
+					 ctx->args[i].attr, &ctx->maps[i], take_ref, mflags);
 		if (err) {
 			dev_err(dev, "Error Creating map %d\n", err);
 			return -EINVAL;
 		}
-
 	}
+
 	return 0;
 }
 
@@ -1266,6 +1273,16 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 		list[i].num = ctx->args[i].length ? 1 : 0;
 		list[i].pgidx = i;
 		if (ctx->maps[i]) {
+			/* It is possible that map is created with
+			 * mflags FASTRPC_MAP_DMA_HANDLE and take_ref
+			 * is false. Check if map still exists or is
+			 * being freed as take_ref is false
+			 */
+			if (fastrpc_map_lookup(ctx->fl, ctx->args[i].fd,
+					       &ctx->maps[i], false)) {
+				ctx->maps[i] = NULL;
+				return -EINVAL;
+			}
 			pages[i].addr = ctx->maps[i]->dma_addr;
 			pages[i].size = ctx->maps[i]->size;
 		}
@@ -1315,8 +1332,17 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
 	for (i = 0; i < FASTRPC_MAX_FDLIST; i++) {
 		if (!fdlist[i])
 			break;
-		if (!fastrpc_map_lookup(fl, (int)fdlist[i], &mmap, false))
+		/*
+		 * DMA handle maps are released when the DSP returns the corresponding fd in
+		 * fdlist. The DSP is expected to return a specific fd only once in fdlist,
+		 * so no two fastrpc_put_args() paths should clear the DMA_HANDLE flag for
+		 * the same map concurrently.
+		 */
+		if (!fastrpc_map_lookup(fl, (int)fdlist[i], &mmap, false) &&
+		    mmap->flags == FASTRPC_MAP_DMA_HANDLE) {
+			mmap->flags = 0;
 			fastrpc_map_put(mmap);
+		}
 	}
 
 	return ret;
@@ -1692,7 +1718,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 	fl->pd = USER_PD;
 
 	if (init.filelen && init.filefd) {
-		err = fastrpc_map_create(fl, init.filefd, init.filelen, 0, &map);
+		err = fastrpc_map_create(fl, init.filefd, init.filelen, 0, &map, true, 0);
 		if (err)
 			goto err;
 	}
@@ -2314,7 +2340,7 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
 		return -EFAULT;
 
 	/* create SMMU mapping */
-	err = fastrpc_map_create(fl, req.fd, req.length, 0, &map);
+	err = fastrpc_map_create(fl, req.fd, req.length, 0, &map, true, 0);
 	if (err) {
 		dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
 		return err;
-- 
2.53.0

