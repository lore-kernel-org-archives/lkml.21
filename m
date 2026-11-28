Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795874704;
	b=ZcrkoCHF6BG5o02GcUEeTHsv5nhXR3PIMwPhtx3fFJthE8oOxjgNYZ3gv1dn8gakre9C
	 mUsy7uNyKl2akD+Q/DvaecfeLsRKTpNZFMnhnFnZbT9DRZTIkhVAX4PZDps/l5xmFwJmB
	 Bok8BLScMJQAcMOiq2TATbkSPFqsprXN0+qJxTwpVom+zf1V/XyyUjUagjebVXTsxIBx4
	 7dU/obzxRuKUwYpNGPCV7KCK6K3joS/PEsZNHkvjuZjvyDXC8gLI+H1NCzQHUoXvgvCFF
	 lBazFGmSLYSzkoQ1y/CWFCMbE2tZm+T6ir7Ly2UwE4/XL8E5mQsIQQnemFukxeXMjlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795874704;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=1kL/kVi9FLivbu0QpgaVJbeg+aQLHjcC22M38emRNmY=;
	b=LdSOzXCeqdjqLBFaqEZK00ZdhyUnLvYLo7v3jFOdDoc9RHCUWMp7zi5ChE8ww9SHbfGB
	 Iv4f273rnaw6HijWTqg3R0VJvBIZ4gZND01WMPqtjyUQq0o+REXY1g57nFvW3AiXesF81
	 kKsy5UWWbJ4c0Rwq1oAb5vIXDzZpWWnLq4Z8Cu56HFd7uK76wkM4cenQTeKkCv5qKIe7Z
	 XbF1o/RDNSwruoc2ItfYvsu9GwjNCQri9SL5JztfwQNxfF5jZfegjAciZDXh7g3E3ZYqB
	 nO2QLZ2DX+/UwdhYwUPcBtGzViGiuPVqfEy4xwm1ZlUIHvoPaZ8VZggmaU57CD7WtDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=LpxtQDSP;
	arc=none smtp.remote-ip=220.197.31.7
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF76F606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 14:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF76F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=LpxtQDSP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=1kL/kVi9FLivbu0QpgaVJbeg+aQLHjcC22M38emRNmY=;
	b=LpxtQDSPTn/iCfbZWJIeopptHMn18L1Y8fTbdflM55W+GqMlTxBM7WoNSbZ/mL
	y6sFd0RGUCqkXTKpkBEwpITWWs+Mb9T+Py1kSKVjKYiLteQi1VSaRc9uKrPw6E8O
	Butf8CAdiF+h/SjsmhPnrh36IMn8dNakfZ1ebd2f1xnWQ=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3nwti3wprLZnAEA--.10725S2;
	Sat, 28 Nov 2026 22:04:19 +0800 (CST)
From: Bilal Hashim <AeeSec@126.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Heiko Stuebner <heiko@sntech.de>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Bilal Hashim <AeeSec@126.com>
Subject: [PATCH] accel/rocket: fix UAF of rocket_file_priv in rocket_gem_bo_free()
Date: Sat, 28 Nov 2026 22:03:53 +0800
Message-ID: <20261128140353.90-1-AeeSec@126.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3nwti3wprLZnAEA--.10725S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3WFykCryxZrWxuF1DKFW3ZFb_yoWxZF1fpF
	45CryagrWjgw4jgrsrAw4DZrWFkw12ga4jga43tr15GrZ7tr90g3W0qFyj9ry5AFy7JFs0
	kF1jqry5Zr42yFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_3kuUUUUUU=
X-CM-SenderInfo: 5dhh2vbf6rjloofrz/xtbBngNtCGsK32M88AAA3p

Each `struct rocket_gem_object` stores a raw, unrefcounted pointer to
`struct rocket_file_priv` (`bo->driver_priv`) so that
`rocket_gem_bo_free()` can lock `rocket_priv->mm_lock` and remove
`bo->mm` from `rocket_priv->mm`.

However, a GEM buffer object can outlive `rocket_postclose()` — for
example, when userspace `mmap()`s the BO (via `drm_gem_shmem_object_mmap`,
which holds a `drm_gem_object` reference on the VMA), closes the accel
file descriptor, and later `munmap()`s the mapping; or when a queued job
holds a reference to the BO across `close()`.

In `rocket_postclose()`, `rocket_priv->mm_lock` is destroyed,
`rocket_priv->mm` is torn down while nodes are still allocated, and
`rocket_priv` is freed with `kfree()`. When the last reference to the BO
is subsequently dropped, `rocket_gem_bo_free()` dereferences the freed
`rocket_priv` to call `mutex_lock(&rocket_priv->mm_lock)` and
`drm_mm_remove_node(&bo->mm)`, causing a deterministic slab
use-after-free.

Move `mm` and `mm_lock` from `struct rocket_file_priv` into the
already-refcounted `struct rocket_iommu_domain` (which is held by every
`rocket_gem_object` until `rocket_gem_bo_free()` finishes unmapping and
removing the node), drop `bo->driver_priv`, and release `rkt_obj->domain`
on the `rocket_ioctl_create_bo()` error path.

Signed-off-by: Bilal Hashim <AeeSec@126.com>
---
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -30,6 +30,8 @@ rocket_iommu_domain_destroy(struct kref *kref)
 {
 	struct rocket_iommu_domain *domain = container_of(kref, struct rocket_iommu_domain, kref);
 
+	mutex_destroy(&domain->mm_lock);
+	drm_mm_takedown(&domain->mm);
 	iommu_domain_free(domain->domain);
 	domain->domain = NULL;
 	kfree(domain);
@@ -39,6 +41,7 @@ static struct rocket_iommu_domain*
 rocket_iommu_domain_create(struct device *dev)
 {
 	struct rocket_iommu_domain *domain = kmalloc_obj(*domain);
+	u64 start, end;
 	void *err;
 
 	if (!domain)
@@ -52,6 +55,11 @@ rocket_iommu_domain_create(struct device *dev)
 	}
 	kref_init(&domain->kref);
 
+	start = domain->domain->geometry.aperture_start;
+	end = domain->domain->geometry.aperture_end;
+	drm_mm_init(&domain->mm, start, end - start + 1);
+	mutex_init(&domain->mm_lock);
+
 	return domain;
 }
 
@@ -73,7 +81,6 @@ rocket_open(struct drm_device *dev, struct drm_file *file)
 {
 	struct rocket_device *rdev = to_rocket_device(dev);
 	struct rocket_file_priv *rocket_priv;
-	u64 start, end;
 	int ret;
 
 	if (!try_module_get(THIS_MODULE))
@@ -94,20 +101,13 @@ rocket_open(struct drm_device *dev, struct drm_file *file)
 
 	file->driver_priv = rocket_priv;
 
-	start = rocket_priv->domain->domain->geometry.aperture_start;
-	end = rocket_priv->domain->domain->geometry.aperture_end;
-	drm_mm_init(&rocket_priv->mm, start, end - start + 1);
-	mutex_init(&rocket_priv->mm_lock);
-
 	ret = rocket_job_open(rocket_priv);
 	if (ret)
-		goto err_mm_takedown;
+		goto err_put_domain;
 
 	return 0;
 
-err_mm_takedown:
-	mutex_destroy(&rocket_priv->mm_lock);
-	drm_mm_takedown(&rocket_priv->mm);
+err_put_domain:
 	rocket_iommu_domain_put(rocket_priv->domain);
 err_free:
 	kfree(rocket_priv);
@@ -122,8 +122,6 @@ rocket_postclose(struct drm_device *dev, struct drm_file *file)
 	struct rocket_file_priv *rocket_priv = file->driver_priv;
 
 	rocket_job_close(rocket_priv);
-	mutex_destroy(&rocket_priv->mm_lock);
-	drm_mm_takedown(&rocket_priv->mm);
 	rocket_iommu_domain_put(rocket_priv->domain);
 	kfree(rocket_priv);
 	module_put(THIS_MODULE);
--- a/drivers/accel/rocket/rocket_drv.h
+++ b/drivers/accel/rocket/rocket_drv.h
@@ -13,15 +13,16 @@ extern const struct dev_pm_ops rocket_pm_ops;
 
 struct rocket_iommu_domain {
 	struct iommu_domain *domain;
+	struct drm_mm mm;
+	/* Protects mm */
+	struct mutex mm_lock;
 	struct kref kref;
 };
 
 struct rocket_file_priv {
 	struct rocket_device *rdev;
 
 	struct rocket_iommu_domain *domain;
-	struct drm_mm mm;
-	struct mutex mm_lock;
 
 	struct drm_sched_entity sched_entity;
 };
--- a/drivers/accel/rocket/rocket_gem.c
+++ b/drivers/accel/rocket/rocket_gem.c
@@ -14,7 +14,7 @@
 static void rocket_gem_bo_free(struct drm_gem_object *obj)
 {
 	struct rocket_gem_object *bo = to_rocket_bo(obj);
-	struct rocket_file_priv *rocket_priv = bo->driver_priv;
+	struct rocket_iommu_domain *domain = bo->domain;
 	size_t unmapped;
 
 	drm_WARN_ON(obj->dev, refcount_read(&bo->base.pages_use_count) > 1);
@@ -22,11 +22,11 @@ static void rocket_gem_bo_free(struct drm_gem_object *obj)
 	unmapped = iommu_unmap(bo->domain->domain, bo->mm.start, bo->size);
 	drm_WARN_ON(obj->dev, unmapped != bo->size);
 
-	mutex_lock(&rocket_priv->mm_lock);
+	mutex_lock(&domain->mm_lock);
 	drm_mm_remove_node(&bo->mm);
-	mutex_unlock(&rocket_priv->mm_lock);
+	mutex_unlock(&domain->mm_lock);
 
-	rocket_iommu_domain_put(bo->domain);
+	rocket_iommu_domain_put(domain);
 	bo->domain = NULL;
 
 	drm_gem_shmem_free(&bo->base);
@@ -74,7 +74,6 @@ int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *
 	gem_obj = &shmem_obj->base;
 	rkt_obj = to_rocket_bo(gem_obj);
 
-	rkt_obj->driver_priv = rocket_priv;
 	rkt_obj->domain = rocket_iommu_domain_get(rocket_priv);
 	rkt_obj->size = args->size;
 	rkt_obj->offset = 0;
@@ -85,11 +84,11 @@ int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *
 		goto err;
 	}
 
-	mutex_lock(&rocket_priv->mm_lock);
-	ret = drm_mm_insert_node_generic(&rocket_priv->mm, &rkt_obj->mm,
+	mutex_lock(&rkt_obj->domain->mm_lock);
+	ret = drm_mm_insert_node_generic(&rkt_obj->domain->mm, &rkt_obj->mm,
 					 rkt_obj->size, PAGE_SIZE,
 					 0, 0);
-	mutex_unlock(&rocket_priv->mm_lock);
+	mutex_unlock(&rkt_obj->domain->mm_lock);
 	if (ret)
 		goto err;
 
@@ -122,11 +121,12 @@ int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *
 		    rkt_obj->mm.start, rkt_obj->size);
 
 err_remove_node:
-	mutex_lock(&rocket_priv->mm_lock);
+	mutex_lock(&rkt_obj->domain->mm_lock);
 	drm_mm_remove_node(&rkt_obj->mm);
-	mutex_unlock(&rocket_priv->mm_lock);
+	mutex_unlock(&rkt_obj->domain->mm_lock);
 
 err:
+	rocket_iommu_domain_put(rkt_obj->domain);
 	drm_gem_shmem_object_free(gem_obj);
 
 	return ret;
--- a/drivers/accel/rocket/rocket_gem.h
+++ b/drivers/accel/rocket/rocket_gem.h
@@ -9,8 +9,6 @@
 struct rocket_gem_object {
 	struct drm_gem_shmem_object base;
 
-	struct rocket_file_priv *driver_priv;
-
 	struct rocket_iommu_domain *domain;
 	struct drm_mm_node mm;
 	size_t size;

