Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106556;
	b=iZIqPPRRor3knF/lU+E4yUTiCs1p9HWvqXKfPAk5igThAjFZseLYu6QmLe4u4+DMLZXt
	 7LPNWvIyGlQwl9DU2SLL99c07DuMQ6vRI2GP91KmmQmt8Cx6/p14UjYiYM7s2Pw/HvSrl
	 1n84+OYElGwJ2QK2saxtaFn7TbHjfn/Uh2FdSz7UGImEaZkSvejBpxngSyUpexRGHV9cZ
	 BOxVqoPrv5uwycN2JhLaoy8bTF7cNdWNM4W9HgE14QFHMIuVDVl2flxJAWieLJ6TsrIYr
	 b8uWgrs5ZD2k6URuy51lnVMwuyrXbvk0cSsJUfPq4MoZN/MiDq2nbOQSpkmsDaYyZJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Hzv13UFV3Pl9XMFamXY9cAE0rjp5+8r0g5vJP65x6c8=;
	b=4ktQ1qQTWCd4vdTamnQuPgIYVPM1EMWjDx/BD16r7TiFCoYvEyREsN9l7O7i+FxB9kXk
	 lPyDXG4bwNk6cYln9DRj0iW7boLPpz2uoquU/SVI1VfJHi7z6JLkwfqrLSAOQYOcC2wj2
	 CqfS4UFjwHcanIAnlF+BeXkYrQ9+HfAsoVQoNyKROeST52OPGs/1GOqUopbzimMLNCjw5
	 iWd2ANGcPY+7+9pttp/1fyt19v3e0C00GjiVbGIeLvioQ5K4ySe4isPL2VRZPHfoCdLmX
	 Lnxf0BnipZOLF132T+iQqKG8pyoQ+JPJSIUEKebPtNFQoiyuclcD1QWmSSosqZnnuoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A+Ga2Dn6;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6E0606A33B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB6E0606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A+Ga2Dn6
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7f84a55cc06so1574350a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795106555; x=1795711355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hzv13UFV3Pl9XMFamXY9cAE0rjp5+8r0g5vJP65x6c8=;
        b=A+Ga2Dn6dyhlSARpDcX++tPlbW/R0Lcbyien5n7eRGJy1hwsrTqZVa1Z+iSt5GXfbs
         qVc3NNAiDde/uMjnC94jbaYHYTbqpdN9b8K/OH2Q+PfZYRox8QzK7rqqwhcZZ5/OG/u8
         q6f6GmofnohhMz773EXV0M2Bz5OdeCl+lHnvPUeRKeLaq4JxyUte8aZPkZUG/NgAPonN
         kU8mcV8Nh/HYSx9uvkv6HWBjj6o3N5gmbm8ZScCZd52U/9CfyEN9ellsOtZhEHAtYiKy
         ETTwcj2Q3s8DXLcCBc/3AfbDHc0R7o4H6ABCJkof9cJuBtkxPa8rBBPCnLVGukANZL+T
         clIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106555; x=1795711355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hzv13UFV3Pl9XMFamXY9cAE0rjp5+8r0g5vJP65x6c8=;
        b=G659BFJALRDuwD3cTo5Y2EZtE0mfNYo4U9owpR3hSbMiC1gEbpgAGC6277Nh/jh/be
         tq3oSFBNC4zQV2WpI3f9UEdfj/xlxj6dEUdZSARuIm/DaiZB0fOT8yqiKd/4O2iUKfeX
         RIixjnEtRyJK4bKh+LabUglF/6T1O4oCPcbdhx4NWcK7xioTwT6x265h7ErCdmkWDxzS
         33wCNz7FhXf4yzMNEMujPOOKxazqFXoDNwNDGD+na0vi05CVAY8awRTDT2lQphaQKphf
         ivKgXULal25GkVqawQlD3uSmOddvynzmKC72x7Ta13V9ouY1ERrrq8o3ykGVikcuV88k
         rj9g==
X-Forwarded-Encrypted: i=1; AL+hErF1rk16jwqzDd7m5bH2d91SpNQTBmguvviPfpLqRQ25OOThLlg+VZNno6kCQIeneiGF2C1Ds9jbRxSp9E8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sf73+zjgLGxfI0uyO6SdRf28tSOSDG7vBSnJRXRmmznhsOlOd
	ty+3bWMfJjU1iNVwxZuyk4569jQqeE68HLbbQcXw8TFAE0iieO3MuSTX
X-Gm-Gg: AYBFou1uEZUr9D1L4IpLpcd5e1nMGyOrE2ZUJ+hW/EGEo9uhwVFyw1dlE3A6Hq7xGMi
	N0Q9csdOtTPrGIEBN/QDPICRlgX+AfmSP6eBVhv80na/wX3LuHxaG0xKBU2Jv0mDwHwWgoRbImG
	Ptfqs83zY6QQj4wpoJPDvUizeRSDmr8Ycy2Kat7Ob1wTq715hZb2D87p+TVSDaKUXZW1+rIpW8j
	pjt/f0IO3Uc90FGbGqF5VFKqetIs6MCKLW3Jda4PQAy2Ik0h+HJLuuREQP2ATRhPCowyMlIPWei
	xS3j+XgCKnLeOfRRj4YQ0duqaQoTp1wIpGiEhzvrUk8sHqFp5gMY+dRhNdC4JezxJQnPQsBYINw
	Y91gIEOrW59FmrQ6PynqApQU1EbucaY/2kdurq9PHg0ij/WaWMayw7Kh5PJ4iDlVi0KYnE6hCLE
	AHyq7f/OP7SIFUjVQgcvQ0lRL544f/XBUzqwxrwyqhYvcFXUoEA9ofXKexRCiaW+G7UTjgS6GgR
	jCACmQH/DZGXWcy2hWnmHAQbS//utce31giRTEOfiNh9NSraJjlrzgGUiBVsM/eHdQ8n3e5dEmD
	AQFwICd1uVl/dOQbcl203FCGDecxELVa1Gy81Ucyhd+PHrcAhWGeusl2GqzutyPsu0ZZXy/onIY
	LHdQC1VnIgXtwTGFsIeK6zgmK6VQvxBv+qTVXfQAOO5VeBXLv9fPZwY7nvQMq4LqsYeKFXw4MYO
	ZFcT5xVybWpeQJN9AEz66ZAFLGIpvH4DWO3D22kBdEaxLgouoZsk4=
X-Received: by 2002:a05:6820:4a19:b0:71a:fc24:cdaa with SMTP id 006d021491bc7-71b3940542emr125468eaf.25.1795106554738;
        Thu, 19 Nov 2026 08:42:34 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e4a6dsm341975eaf.13.2026.11.19.08.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:42:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:42:04 -0700
Subject: [PATCH v2 06/11] nvmem: manage cell attributes independently of
 device resources
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
Message-Id: <20261119-submit-nvmem-provider-lifetime-v1-v2-6-8fca3ec5f18c@gmail.com>
References: <20261119-submit-nvmem-provider-lifetime-v1-v2-0-8fca3ec5f18c@gmail.com>
In-Reply-To: <20261119-submit-nvmem-provider-lifetime-v1-v2-0-8fca3ec5f18c@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Michael Walle <mwalle@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Michael Walle <michael@walle.cc>, Linus Walleij <linusw@kernel.org>, 
 Khouloud Touil <ktouil@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Cell attributes are populated once and remain until device deletion. A
layout bound after provider registration therefore cannot publish its
cells through an existing group, and the group cannot be refreshed when
cells are removed.

Keep the group in the NVMEM device and explicitly allocate and release
its attributes. Each attribute holds a cell reference until sysfs has
drained its readers. Rebuild the group from the current cell list, and
unwind partial allocations if population fails.

Serialize group replacement separately from cell-list updates so removal
can wait for sysfs readers without holding nvmem_mutex. Remove the group
before device deletion on both unregister and registration failure.

Fixes: 0331c611949f ("nvmem: core: Expose cells through sysfs")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c      | 131 +++++++++++++++++++++++++++++++---------------
 drivers/nvmem/internals.h |   3 ++
 2 files changed, 92 insertions(+), 42 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index d9f1bb64a4a5..c74e3f4e1de6 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -13,6 +13,7 @@
 #include <linux/idr.h>
 #include <linux/init.h>
 #include <linux/kref.h>
+#include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/nvmem-consumer.h>
@@ -476,59 +477,98 @@ static void nvmem_sysfs_remove_compat(struct nvmem_device *nvmem)
 		device_remove_bin_file(nvmem->base_dev, &nvmem->eeprom);
 }
 
-static int nvmem_populate_sysfs_cells(struct nvmem_device *nvmem)
+static void nvmem_sysfs_free_cell_attrs(const struct bin_attribute * const *attrs)
 {
-	struct attribute_group group = {
-		.name	= "cells",
-	};
-	struct nvmem_cell_entry *entry;
-	const struct bin_attribute **pattrs;
-	struct bin_attribute *attrs;
-	unsigned int ncells = 0, i = 0;
-	int ret;
+	if (!attrs)
+		return;
 
-	guard(mutex)(&nvmem_mutex);
+	for (int i = 0; attrs[i]; i++) {
+		nvmem_cell_entry_put(attrs[i]->private);
+		kfree(attrs[i]->attr.name);
+		kfree(attrs[i]);
+	}
+	kfree(attrs);
+}
 
-	if (list_empty(&nvmem->cells) || nvmem->sysfs_cells_populated)
-		return 0;
+static void __nvmem_sysfs_remove_cells(struct nvmem_device *nvmem)
+{
+	lockdep_assert_held(&nvmem->sysfs_mutex);
 
-	/* Allocate an array of attributes with a sentinel */
-	ncells = list_count_nodes(&nvmem->cells);
-	pattrs = devm_kcalloc(&nvmem->dev, ncells + 1,
-			      sizeof(*pattrs), GFP_KERNEL);
-	if (!pattrs)
-		return -ENOMEM;
+	if (!nvmem->sysfs_cells_populated)
+		return;
 
-	attrs = devm_kcalloc(&nvmem->dev, ncells, sizeof(struct bin_attribute), GFP_KERNEL);
-	if (!attrs)
-		return -ENOMEM;
+	device_remove_group(&nvmem->dev, &nvmem->cells_group);
+	nvmem_sysfs_free_cell_attrs(nvmem->cells_group.bin_attrs);
+	nvmem->cells_group.bin_attrs = NULL;
+	nvmem->sysfs_cells_populated = false;
+}
 
-	/* Initialize each attribute to take the name and size of the cell */
-	list_for_each_entry(entry, &nvmem->cells, node) {
-		sysfs_bin_attr_init(&attrs[i]);
-		attrs[i].attr.name = devm_kasprintf(&nvmem->dev, GFP_KERNEL,
-						    "%s@%x,%x", entry->name,
-						    entry->offset,
-						    entry->bit_offset);
-		attrs[i].attr.mode = 0444 & nvmem_bin_attr_get_umode(nvmem);
-		attrs[i].size = entry->bytes;
-		attrs[i].read = &nvmem_cell_attr_read;
-		attrs[i].private = entry;
-		if (!attrs[i].attr.name)
-			return -ENOMEM;
+static void nvmem_sysfs_remove_cells(struct nvmem_device *nvmem)
+{
+	guard(mutex)(&nvmem->sysfs_mutex);
+	__nvmem_sysfs_remove_cells(nvmem);
+}
 
-		pattrs[i] = &attrs[i];
-		i++;
-	}
+static int nvmem_populate_sysfs_cells(struct nvmem_device *nvmem)
+{
+	struct nvmem_cell_entry *entry;
+	const struct bin_attribute **attrs = NULL;
+	unsigned int i = 0;
+	int ret = 0;
 
-	group.bin_attrs = pattrs;
+	guard(mutex)(&nvmem->sysfs_mutex);
 
-	ret = device_add_group(&nvmem->dev, &group);
-	if (ret)
-		return ret;
+	__nvmem_sysfs_remove_cells(nvmem);
+
+	scoped_guard(mutex, &nvmem_mutex) {
+		if (!rcu_access_pointer(nvmem->ops))
+			return -ENODEV;
+		if (list_empty(&nvmem->cells))
+			return 0;
 
-	nvmem->sysfs_cells_populated = true;
+		attrs = kcalloc(list_count_nodes(&nvmem->cells) + 1,
+				sizeof(*attrs), GFP_KERNEL);
+		if (!attrs)
+			return -ENOMEM;
 
+		list_for_each_entry(entry, &nvmem->cells, node) {
+			struct bin_attribute *attr;
+
+			attr = kzalloc_obj(*attr);
+			if (!attr) {
+				ret = -ENOMEM;
+				break;
+			}
+			sysfs_bin_attr_init(attr);
+			attr->attr.name = kasprintf(GFP_KERNEL, "%s@%x,%x",
+						   entry->name, entry->offset,
+						   entry->bit_offset);
+			if (!attr->attr.name) {
+				kfree(attr);
+				ret = -ENOMEM;
+				break;
+			}
+			attr->attr.mode = 0444 & nvmem_bin_attr_get_umode(nvmem);
+			attr->size = entry->bytes;
+			attr->read = nvmem_cell_attr_read;
+			attr->private = entry;
+			kref_get(&entry->refcnt);
+			attrs[i++] = attr;
+		}
+	}
+	if (!ret) {
+		nvmem->cells_group.name = "cells";
+		nvmem->cells_group.bin_attrs = attrs;
+
+		ret = device_add_group(&nvmem->dev, &nvmem->cells_group);
+		if (!ret) {
+			nvmem->sysfs_cells_populated = true;
+			return 0;
+		}
+		nvmem->cells_group.bin_attrs = NULL;
+	}
+
+	nvmem_sysfs_free_cell_attrs(attrs);
 	return ret;
 }
 
@@ -543,6 +583,10 @@ static void nvmem_sysfs_remove_compat(struct nvmem_device *nvmem)
 {
 }
 
+static void nvmem_sysfs_remove_cells(struct nvmem_device *nvmem)
+{
+}
+
 #endif /* CONFIG_NVMEM_SYSFS */
 
 static void nvmem_cell_entry_release(struct kref *ref)
@@ -990,6 +1034,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	rcu_assign_pointer(nvmem->ops, ops);
 
 	device_initialize(&nvmem->dev);
+	mutex_init(&nvmem->sysfs_mutex);
 
 	if (!config->ignore_wp)
 		nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
@@ -1098,6 +1143,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	nvmem_destroy_layout(nvmem);
 #endif
 err_remove_dev:
+	nvmem_sysfs_remove_cells(nvmem);
 	device_del(&nvmem->dev);
 err_remove_compat:
 	nvmem_sysfs_remove_compat(nvmem);
@@ -1125,6 +1171,7 @@ void nvmem_unregister(struct nvmem_device *nvmem)
 	nvmem_sysfs_remove_compat(nvmem);
 	nvmem_destroy_layout(nvmem);
 
+	nvmem_sysfs_remove_cells(nvmem);
 	device_unregister(&nvmem->dev);
 }
 EXPORT_SYMBOL_GPL(nvmem_unregister);
diff --git a/drivers/nvmem/internals.h b/drivers/nvmem/internals.h
index bc7a99f5aefb..79ea56822ebe 100644
--- a/drivers/nvmem/internals.h
+++ b/drivers/nvmem/internals.h
@@ -4,6 +4,7 @@
 #define _LINUX_NVMEM_INTERNALS_H
 
 #include <linux/device.h>
+#include <linux/mutex.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/nvmem-provider.h>
 #include <linux/srcu.h>
@@ -37,7 +38,9 @@ struct nvmem_device {
 	struct nvmem_layout	*layout;
 	struct nvmem_operations __rcu *ops;
 	void *priv;
+	struct mutex		sysfs_mutex;
 	bool			sysfs_cells_populated;
+	struct attribute_group cells_group;
 };
 
 int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np);

-- 
2.53.0

