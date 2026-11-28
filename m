Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795847949;
	b=bVD4aVxA15fapzjZNJdv10GJtUjKx8+CXPCRl8PvziZYqkspUl4OvaT7DfTW5+ep9g/+
	 U6FAxOeEqtYHUpU72UPLeVJlm4OLmTTVbxuhEjRVAuo6W+pmyeS+Ro1cWPMz01txdIXr1
	 ilhEk1hUqfCdwSh3BRQIsOzOcVbrxdWwxvHXacrMb5QOIWjmR46f/clTtvqu0RFFqNF9R
	 KZbmCUJSl+aIpozTifYwfvlPE0tcrNllWvOixKseLeTDZa9FUzY6wofLN/0SUSbVpbkuK
	 FeZvLMcbYzJ3ZDZJrwjwv3XBddLJ4YnmpN/xXZLHESSa+lji9V6k2xGe0Kvr2w0Bb+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795847949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7/KIItuSkOccTTrf3OQEivNTHfzC9rlU/LCr+peVUCg=;
	b=kZCGPzFoPWwbe1OlzPN3THH4dzk+RzVzI0JGbXJVXpG7raT8/JCHp3SuU9lsk6Z/JGON
	 YOGXyEzd53AQhNUVFSPcQb6bVABjTIev8uiPbT+D01wJ7QKsVZYCupBKxbpGl2HrCYnI2
	 AvKA32UaaCBArMJO0hJdgp74Ht2yFlailX/cmfMvjCkinS+3gfvN8eQSot6F6OGGJD0oc
	 BkvEfL/i38X/MMRAB7/hUBlW44Xx8j1S6LedYkGp1qHmJEwzJr+zZvZKK/7/U9T1WeTcV
	 1b7VJD9UVZiuG8F3plHx+XyB+h43yzPqOFe290W8kWMNHDGKRpXYF+b7ZgkVyvWHX9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=furiosa.ai;
	spf=none smtp.mailfrom=furiosa.ai;
	dkim=pass header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=GzW6jTTx;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C32606A329
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80C32606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=GzW6jTTx
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso4454968a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 22:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1795847949; x=1796452749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/KIItuSkOccTTrf3OQEivNTHfzC9rlU/LCr+peVUCg=;
        b=GzW6jTTxAsDEHPyOt7QcsgxdP7JhrH3ErUG1ai2DNjJGexk5iPsJP7lrRvBo9+ONFw
         Sfe+G81irh9UiFr/vLw5RUUUfMz/JJKuG6JYp24rIdXR8u/zewBVZ1mAaz+9G2miH/Ux
         nv2a64LYYMqjhBm4Bkje83DynyKqMbngOSxTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795847949; x=1796452749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7/KIItuSkOccTTrf3OQEivNTHfzC9rlU/LCr+peVUCg=;
        b=qjJIsBLanGALSXiM6wHCaWg9v79zZ3lv6vagJxrbSXV8MLpIAEH4cri/pWdQcJ3vl0
         omm1jZ1+fS9v0M9bQuS0gcA6e3iE3rC7YgibeyIxhnnLzu6JKOxCqtiM/V1YJLxEF0f3
         JlO3UxGTlKDoTRouzfAINv1gH9VcYpniSIsArHFntc2kqlhUDddrgUMkndm9M8d2fwL4
         zYqH/u9AYUf+dU3ZGKzLaMY77VJwyyxMNOmWLGopNkkNOzTz8fH00qQgURrQG2m7ElfZ
         71yJEZb07iXYdylD3ZgSqhnXfFcXzb86YhmgTsph4N8CHHmy6f9C9g5Wimp2ok2dWB3B
         avlg==
X-Forwarded-Encrypted: i=1; AL+hErF/A7yzt71Ifhj+PGrOGScfSbHxVj+A7W44DiTRa6FubdPN2YVj4e5HEv1no3V0ZBc+rQmvLn37sRxplaE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Bai/arkvWpDSV26pmv5hXsEpzbkP8JIJcVbAdLDN5hOGIQPfj
	QuuoUaz7YRYvgWjv9QcQXGpyfJSNUBcV7xzVoevPM9a10oCh/dGd/1SYDcdBhEC67X4=
X-Gm-Gg: AZFdTZe1TrnlihsQw+7V+bqqfp/gDt2iVesckw/2W0cdQTk0QrzzD9j8QF+KjnWwwlf
	E+pbrUE9whUVHwvPN23x4UGR6K5dCNwoIuJFR1a7QNZ0J6La1ZtzhB+rytWYYhOLmHhNWIY8P5p
	hBPslBsOiidZdfPre5up/9rvWHk2DfC/x8DKB0U7viuSirKULbHV/ZiyvzhVF1EIT3Gmcs1cjUR
	/sYhEjVZA1BHiKVVXoxHxfwsEmnzMH5EuN/jNOVBv5v+k1UhhlOfr7bEz1Fsia894XQq6/rtoQ9
	YTeEXVO15UMdNSEhNDE9pkqccqodQ7BYgh4pJHMofOoRz3USGs4SyyrsHLEH7uEsmyyo9LSBuzd
	qHrBtSfIeqAOQyUqN4JMUcIcfLyGa+ttZB7U0SWYfRgyXPCxLiw6L4OU0ZZJNgoFgPYSpmiDK/X
	tshcoU7JPg9HxPyh9S2ptWXL0kQQXaP/gql1aBfJ+o7A1MlHHOvYedoja8iEkwNsno/gFAc6Y2T
	2AzVjM/3xV58j0OQFBGcGik2qjF1v+UIpIzeCxq0nvNchO5Cq3u3hnuf5+8mBmMxo3dah44/RBz
	sBxyWACRPXxDgZdoluLndfZksjex7pmboeQTJEuy/hnhc+Iw2Pq7yXMAd8Fd5zT8UVCDiQ2ZBCF
	cc/TgQl4Jr79+
X-Received: by 2002:a05:6300:278a:10b0:3f9:797f:385a with SMTP id adf61e73a8af0-407235c3a0cmr11591887637.15.1795847948803;
        Fri, 27 Nov 2026 22:39:08 -0800 (PST)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm13939838b3a.2.2026.11.27.22.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 22:39:08 -0800 (PST)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Haoming Gao <Naixumogu@whut.edu.cn>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>,
	stable@vger.kernel.org
Subject: [PATCH 2/4] accel/rocket: Fix iommu_map_sgtable() return handling in create_bo
Date: Sat, 28 Nov 2026 15:38:42 +0900
Message-ID: <20261128063844.1537615-3-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128063844.1537615-1-sidong.yang@furiosa.ai>
References: <20261128063844.1537615-1-sidong.yang@furiosa.ai>
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

iommu_map_sgtable() returns ssize_t, not int. Storing its return value
in int ret truncates any mapping of 2 GiB or larger (reachable via the
__u32 args->size) to a negative value. The error path then removes the
drm_mm node without calling iommu_unmap(), leaking the IOMMU mapping and
causing subsequent allocations at the same IOVA to fail.

In addition, if iommu_map_sgtable() ever returns a short mapping, the
error path fails to unmap the already mapped range, and the drm_mm node
was sized from the unaligned args->size rather than gem_obj->size.

Store the return value of iommu_map_sgtable() in ssize_t, size the
drm_mm node from gem_obj->size, propagate negative errors directly, and
unmap partial mappings before returning -ENOMEM.

Fixes: 658ebeac3351 ("accel/rocket: Add IOCTL for BO creation")
Cc: stable@vger.kernel.org
Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
---
 drivers/accel/rocket/rocket_gem.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/rocket_gem.c
index 9f3d85e3dd30..e52fc6ea7cf0 100644
--- a/drivers/accel/rocket/rocket_gem.c
+++ b/drivers/accel/rocket/rocket_gem.c
@@ -67,6 +67,7 @@ int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *
 	struct rocket_vm *vm;
 	struct sg_table *sgt;
 	size_t size = PAGE_ALIGN((size_t)args->size);
+	ssize_t mapped;
 	int ret;
 
 	if (!size)
@@ -81,7 +82,7 @@ int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *
 
 	vm = rocket_vm_get(rocket_priv);
 	rkt_obj->vm = vm;
-	rkt_obj->size = args->size;
+	rkt_obj->size = gem_obj->size;
 	rkt_obj->offset = 0;
 
 	sgt = drm_gem_shmem_get_pages_sgt(shmem_obj);
@@ -98,19 +99,27 @@ int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *
 	if (ret)
 		goto err;
 
-	ret = iommu_map_sgtable(vm->domain,
-				rkt_obj->mm.start,
-				shmem_obj->sgt,
-				IOMMU_READ | IOMMU_WRITE);
-	if (ret < 0 || ret < args->size) {
-		drm_err(dev, "failed to map buffer: size=%d request_size=%u\n",
-			ret, args->size);
+	mapped = iommu_map_sgtable(vm->domain,
+				   rkt_obj->mm.start,
+				   shmem_obj->sgt,
+				   IOMMU_READ | IOMMU_WRITE);
+	if (mapped < 0) {
+		drm_err(dev, "failed to map buffer: err=%zd request_size=%zu\n",
+			mapped, gem_obj->size);
+		ret = mapped;
+		goto err_remove_node;
+	}
+	if ((size_t)mapped < gem_obj->size) {
+		drm_err(dev, "failed to map buffer: size=%zd request_size=%zu\n",
+			mapped, gem_obj->size);
+		if (mapped)
+			iommu_unmap(vm->domain, rkt_obj->mm.start, mapped);
 		ret = -ENOMEM;
 		goto err_remove_node;
 	}
 
 	/* iommu_map_sgtable might have aligned the size */
-	rkt_obj->size = ret;
+	rkt_obj->size = mapped;
 	args->offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
 	args->dma_address = rkt_obj->mm.start;
 
-- 
2.53.0

