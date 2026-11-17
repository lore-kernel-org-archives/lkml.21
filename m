Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944312;
	b=SzayieWQwtz8GnZOGb0s40B4Zij8mSb1xvYyYWZenZRQuQAM0jj5S4IaEE0Q1crbPOVM
	 Cdsnu5xpDUpUsqbL0L+iJGlvCgs8WygpIMXCsVdEzU8ODDiDAjIxYpiVsuaMv/uCovK9U
	 qsilJwapRgLtS8CLCukseJyB//k63EsGtdO01CpVPJdROVIjcaD/x2GIxnEIhRr9+msjt
	 gXEtgvqlVI87/cgJmrqZ7Yi8VSgUv+SbaeLmAjDHE4ReK4JVWI/lEiFrRuVN18m58VGuJ
	 csMJYpfgdv+bFjMwPCc/bAsApIrjdfi0QKfKxXzv0pAdNUOoadULuZJfpyFGLL2gaFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=O4G14ey9cBLBk2X2B6diBYnPvevqumzkjH39N3CiTGc=;
	b=x1lecigXdTz6KZ/jD2+BPk8SHroAi0HGPE4+Qf+nxJ8k6Ceciuk1EeDYWZxmSSV1ThlW
	 eGUImW+OTEXEhjDONS+ma4TygA42SJ013yQnvp5hsN/49gm99D50tkTHwaOM8bBh9tIzu
	 yzpAkMYVZo8ziaZA8Czk/k3iL7/d8TbSn2PVZaYCNaKg6bvUhg3fKcSF4pdidzQmrkuNz
	 fY0Rk9tYTK7IuGegorhz6U7ikZLt/uPLFcwnGpJpgimItoEt0ToxB6aDy1qadXemWI4qV
	 /XQG4A/C6qoEhW6N4f60ar9WhRDxPkQY61S/1nGOmGWy+ul0DBO013POE58DkMvGrXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QD0bJggJ;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778B2606A880
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:38:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 778B2606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QD0bJggJ
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6ddef424972so161933eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794944311; x=1795549111; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O4G14ey9cBLBk2X2B6diBYnPvevqumzkjH39N3CiTGc=;
        b=QD0bJggJh3LG/hTkw5sPIbwxOoy1/O0JSTIWEz+6Q+mFBHBjXdapvGOwCdXggrrqho
         aRQsbxPrgspH652cunSU3jyoM1aU0MvlcAtu9iukOgpwjje27adJ5JgTNVKKktzcuKoC
         UEcK1oLpAXtnzhlV8fI6kiXKoVWtWPJvCLTDNAuj7pQSc0Ldk+f0pwL2myULZ96mTW+i
         kNpRnAyaLTMnh7fvvswSR+5buGDEcXSc4+YK5/0+AbxaVv2rm4MyI+4LfGc/yLxUuImH
         Q9xGUL0zMuwUrfn24T7WKwynLeTYcgKKN+QiG0fJtzDg9zU70IdtDRtmoPqlU/Nu7OLl
         3zag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944311; x=1795549111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O4G14ey9cBLBk2X2B6diBYnPvevqumzkjH39N3CiTGc=;
        b=NdONSFAHC58WWhrjzBtDiZu1zicysUojp8BI0NjEXeQk1hMTMVuHer8N5Q6C+XlooU
         jHIADzcSeV7f/gW95kFenR9ldJyIOAtUUyOAcKmWOVNcTHE95ff+dwSW2L+dKzjWfGkO
         IkEp3qqCg/6lDJRBa2ARxc5b6VTlGPeu0KT4sOHEI+3FlkkVYIO7aj/UYZRKnZ1Wndp8
         gIzMQyH/K4ED57b1BW/bCf3kKgIALL14y8f+RD6QhdKV0jjAxfjGjAEWqHRU77GKNDWY
         +y9T+NY8QWz6FmxtUgQFWdhTyFDhBUQDZoaVMd9FUXMpfEpMNjkwa0U8tqYVVb6lp7ZB
         CTUg==
X-Forwarded-Encrypted: i=1; AL+hErFh103rSHxLXmipiuyqgRazbB/kKJLdt6IA+5sI+fya6sMahmYQItWHr2JdPvnJAn6MzBJfxwclpwxgsDQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z85pXszbIM7jXplVddPYs2jpaIz+c5SQ4I91+3FXh8s3G00Rwli
	BwCwRadR5XRVAhHFx3tZrGDBhSibXL0iMJnwD/rzAM/uHv285c9BxyCm
X-Gm-Gg: AYBFou3iUAcr+NxQqFQ8uecnwI0vR/3HlPNNEsWI2AKnHzjtRQMb3nqIc2N73MO1Nl8
	9YczszqLlKL6A+PPs9VjDnMsOqpSi9PG0MkV2Miz1MvtuUIsXZhqdDJUaSQpfU/XSF83ZGuN6OO
	Oyzkbrf/CLkB2896S69KRX18C4OzePzBd5MvYR8hmR6Ha/BcFwpfvRKkOTylcLd5DirF+RbUjfl
	9PfyYVZdTP/dmjuavB8Cxi7T3aBVfx5k2MKFfvxwqZCR4L0GOdxz0tN/4kM2cAyVvHfXMv2EbuV
	36Cvsd5mvrtnX+sCtMaVrnD7bDfm9DdNBZqdTxNYGzzVbTJYIrdwxOBwcGUD9g3qL0W2HkLppHH
	nNLB6OhwFHicKtAWD1cDRB+KB7PRl2hJfwANdNgWUjYT4AD/igK4yFrZw2MIovygJ85BwQQ3FJR
	zLv6aIJwdTYYMuPqGlZ6VwfUbw1GyCP3gBKXiLyachpxXfsGCmm1MZB6pcFzd/U5C+HoUHgUvAs
	rpF4AsRSUWlIYLH4oR05s1ZR09jweaBGVuwQDMy66B2V9x47o8OU4OQLQaW9ipM0nx7N+j7yYES
	P8L4LUg7mb1hBrNMttpMV2y/cd7s2sUQsbdMLx9SBDOhupBJLfc1ha1ErDvSUtOC+8mDSwCwtKS
	wUtPTcQ6iFnh/livVbf+/zsgzvagBYpKLntHklILT6Ew7Ks33K+x9PLiDvYIHjAiVelk3b+uns8
	udMIFsJs80qDT1mOsiBrqRxlKuTcA8GKE2R5MieUz16iFqiC/AI3w=
X-Received: by 2002:a05:6820:504c:b0:6f7:c0ec:1a66 with SMTP id 006d021491bc7-71b1853c1f3mr255396eaf.29.1794944311378;
        Tue, 17 Nov 2026 11:38:31 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b192272ffsm146281eaf.2.2026.11.17.11.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:38:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 12:38:10 -0700
Subject: [PATCH 03/11] nvmem: exclude disconnected providers from callback
 admission
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-submit-nvmem-provider-lifetime-v1-v1-3-3cfbd48812b5@gmail.com>
References: <20261117-submit-nvmem-provider-lifetime-v1-v1-0-3cfbd48812b5@gmail.com>
In-Reply-To: <20261117-submit-nvmem-provider-lifetime-v1-v1-0-3cfbd48812b5@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Michael Walle <mwalle@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

A provider remains visible until device_unregister(), after its operations
have been disconnected. Device matching can still call into it during
that interval, and consumer acquisition can use its module pointer after
unregister has returned. Cell registration and DT fixups also lack a
callback drain.

Cover matching, cell addition, DT fixups and layout population with the
existing SRCU domain. Serialize disconnection with consumer acquisition
under nvmem_mutex, keeping the module-reference acquisition inside that
critical section. Check sysfs permissions under SRCU as well, since the
operations pointer may already have been cleared.

Share the disconnect sequence between unregister and registration unwind.

Fixes: 6a7b4134fb7a ("nvmem: protect nvmem_device::ops with SRCU")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c | 77 ++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 59 insertions(+), 18 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 73aa53145f0b..c41266241f3f 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -307,10 +307,14 @@ static ssize_t bin_attr_nvmem_write(struct file *filp, struct kobject *kobj,
 
 static umode_t nvmem_bin_attr_get_umode(struct nvmem_device *nvmem)
 {
-	struct nvmem_operations *ops = rcu_dereference_raw(nvmem->ops);
-
+	struct nvmem_operations *ops;
 	umode_t mode = 0400;
 
+	guard(srcu)(&nvmem->srcu);
+	ops = srcu_dereference(nvmem->ops, &nvmem->srcu);
+	if (!ops)
+		return 0;
+
 	if (!nvmem->root_only)
 		mode |= 0044;
 
@@ -351,7 +355,12 @@ static umode_t nvmem_attr_is_visible(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct nvmem_device *nvmem = to_nvmem_device(dev);
-	struct nvmem_operations *ops = rcu_dereference_raw(nvmem->ops);
+	struct nvmem_operations *ops;
+
+	guard(srcu)(&nvmem->srcu);
+	ops = srcu_dereference(nvmem->ops, &nvmem->srcu);
+	if (!ops)
+		return 0;
 
 	/*
 	 * If the device has no .reg_write operation, do not allow
@@ -673,6 +682,10 @@ int nvmem_add_one_cell(struct nvmem_device *nvmem,
 	struct nvmem_cell_entry *cell;
 	int rval;
 
+	guard(srcu)(&nvmem->srcu);
+	if (!srcu_dereference(nvmem->ops, &nvmem->srcu))
+		return -ENODEV;
+
 	cell = kzalloc_obj(*cell);
 	if (!cell)
 		return -ENOMEM;
@@ -815,6 +828,10 @@ int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np)
 	const __be32 *addr;
 	int len, ret;
 
+	guard(srcu)(&nvmem->srcu);
+	if (!srcu_dereference(nvmem->ops, &nvmem->srcu))
+		return -ENODEV;
+
 	for_each_child_of_node_scoped(np, child) {
 		struct nvmem_cell_info info = {0};
 
@@ -871,8 +888,11 @@ int nvmem_layout_register(struct nvmem_layout *layout)
 	if (!layout->add_cells)
 		return -EINVAL;
 
-	/* Populate the cells */
-	ret = layout->add_cells(layout);
+	scoped_guard(srcu, &layout->nvmem->srcu) {
+		if (!srcu_dereference(layout->nvmem->ops, &layout->nvmem->srcu))
+			return -ENODEV;
+		ret = layout->add_cells(layout);
+	}
 	if (ret)
 		return ret;
 
@@ -894,6 +914,17 @@ void nvmem_layout_unregister(struct nvmem_layout *layout)
 }
 EXPORT_SYMBOL_GPL(nvmem_layout_unregister);
 
+static void nvmem_disconnect(struct nvmem_device *nvmem)
+{
+	struct nvmem_operations *ops;
+
+	scoped_guard(mutex, &nvmem_mutex)
+		ops = rcu_replace_pointer(nvmem->ops, NULL,
+					 lockdep_is_held(&nvmem_mutex));
+	synchronize_srcu(&nvmem->srcu);
+	kfree(ops);
+}
+
 /**
  * nvmem_register() - Register a nvmem device for given nvmem_config.
  * Also creates a binary entry in /sys/bus/nvmem/devices/dev-name/nvmem
@@ -1067,10 +1098,8 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 err_remove_compat:
 	nvmem_sysfs_remove_compat(nvmem);
 err_put_device:
-	ops = rcu_replace_pointer(nvmem->ops, NULL, true);
-	synchronize_srcu(&nvmem->srcu);
+	nvmem_disconnect(nvmem);
 	put_device(&nvmem->dev);
-	kfree(ops);
 
 	return ERR_PTR(rval);
 }
@@ -1083,19 +1112,15 @@ EXPORT_SYMBOL_GPL(nvmem_register);
  */
 void nvmem_unregister(struct nvmem_device *nvmem)
 {
-	struct nvmem_operations *ops;
-
 	if (!nvmem)
 		return;
 
 	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_REMOVE, nvmem);
 
-	ops = rcu_replace_pointer(nvmem->ops, NULL, true);
-	synchronize_srcu(&nvmem->srcu);
+	nvmem_disconnect(nvmem);
 
 	nvmem_sysfs_remove_compat(nvmem);
 	nvmem_destroy_layout(nvmem);
-	kfree(ops);
 
 	device_unregister(&nvmem->dev);
 }
@@ -1135,17 +1160,33 @@ struct nvmem_device *devm_nvmem_register(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_nvmem_register);
 
+struct nvmem_match_data {
+	void *data;
+	int (*match)(struct device *dev, const void *data);
+};
+
+static int nvmem_match_device(struct device *dev, const void *data)
+{
+	const struct nvmem_match_data *match = data;
+	struct nvmem_device *nvmem = to_nvmem_device(dev);
+
+	guard(srcu)(&nvmem->srcu);
+	if (!srcu_dereference(nvmem->ops, &nvmem->srcu))
+		return 0;
+	return match->match(dev, match->data);
+}
+
 static struct nvmem_device *nvmem_device_match(void *data,
 			int (*match)(struct device *dev, const void *data))
 {
+	struct nvmem_match_data match_data = { .data = data, .match = match };
 	struct nvmem_device *nvmem = NULL;
 	struct device *dev;
 
-	scoped_guard(mutex, &nvmem_mutex) {
-		dev = bus_find_device(&nvmem_bus_type, NULL, data, match);
-		if (dev)
-			nvmem = to_nvmem_device(dev);
-	}
+	guard(mutex)(&nvmem_mutex);
+	dev = bus_find_device(&nvmem_bus_type, NULL, &match_data, nvmem_match_device);
+	if (dev)
+		nvmem = to_nvmem_device(dev);
 	if (!nvmem)
 		return ERR_PTR(-EPROBE_DEFER);
 

-- 
2.53.0

