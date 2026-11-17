Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944320;
	b=bzxsGVU335ss4Zq5c/zErC948F+fhQ1E0lE4+Ruw29IogpX63sZH9pBfjxy5BU6ur8Hz
	 1CXkc5sikAGN540spK1wQYgyIjvMN12faiwGAgT+R5aTxxKnMAd5ttbMYKECNSoVtxSKc
	 tiyaDQbp+4SQJUQ2X3zpuUVliPSmvj4Kxr0iPQIS7QL5yYJz1r2xBxcvCz4JDve2I+/HB
	 jpUR1ok12E8p3xEfIIewVVfMCf+xPECFo9vcrMLw1abNNSL6fg+7VSXf/2RdXMXHKnVzK
	 YAGUAk506oYfJZ/ZEhYSMRZt0wig3a9mgHMFUiNTD2RcGhMWW43ynk/tsxwzDeFtILA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/NZ1YswqeB2Jx0L5yqWiurGJZ9TtP6lnIvyd7e3kWs8=;
	b=l7F8oGG1F/eoPyETsBElN54Hen1se8Zu8XPY9Ktf0zV9vr0jnBQ5EO3TnCh3A0TlCjOt
	 7A2gQF8wjLmYiOWF4CltWQ/PBXlM9x2XZk9PD/b+bp+fHcEw33yLJS/k8OU8xVk4m/Q9/
	 8J9xzyE7HnMW9gyEhA6CIxdo+cpeV2RBt+PgsJu2gGYpTUv9UNgV9PBKXmxoR2N+Z1dCL
	 csD0QEN2eVGawrOZbqHzuNby+0uhNyeO5kT9BD6PLWpxvHArnLkXiOP4GGWiK6coVuRkd
	 yey6o+2YkJFKJgTg+34dv17OH5c0KMHaB093DWXsVW1V7siVr0GTAYL/ivN+CfmY9qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WyvfODY1;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3EC606A8B2
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:38:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA3EC606A8B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WyvfODY1
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6de2f213b7aso102666eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794944319; x=1795549119; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/NZ1YswqeB2Jx0L5yqWiurGJZ9TtP6lnIvyd7e3kWs8=;
        b=WyvfODY1WI0DBB9IOx/K0+2TH+KP9iYeraMMwiwP0S+2ttSeWFOWe8RmTitF+8VIfq
         8eLKFv34B6DgVLg3KWqMZhEpGKULCgN6LN71O8TleEPkq7FctsR4YAw3/72Zc1ixzznJ
         OlGNzNfnHSMqd7V66jtkPN6zc3yCR9P2N9g2mB3W9E62YrskaPcviPAFjRoPHFXrOL+O
         POZD4IrFONHNlnrjMtofapEhhBun6hnjpwpzePVaDSu09Gp0ZX2167XifDJwRGACR1nB
         +rX8U0dTTCuuFW1RHkYjLrBtQnTH/2CTElmGJaMXLcZTvI+iqEEA9Y+l/AP6tXKoSnNc
         RUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944319; x=1795549119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/NZ1YswqeB2Jx0L5yqWiurGJZ9TtP6lnIvyd7e3kWs8=;
        b=smciG5nhVYQvyfxm+pSdeK9+QbXeu3OZ/53xmsIATsbuctLa9L2ceEkJR7jXnEqjfi
         9P0qvfim8LHjvsWTNMRhwBmlVSs1hZzOzUNsmeo4jCtTTwkTxB2HfOn8uWErP2pYkVag
         y3Tikpz2M/BQE8hxvRRZDsmKUUzrkOWXptp0BlbPA13iZjWuIci+VS+caL4eLce1oEA6
         n5coxTBwK2KO56APWFSQkPGKcb13Ml27ux+vdyHG+t2mXM8g+1MMMW1IpaNU1DFVyJmi
         30GP2WEqg94nEf76YWQ4O3eTO1p1lnobzi9z4JfaS68Wd/n2e3UH23gCJHJiKdaJf3XH
         snpw==
X-Forwarded-Encrypted: i=1; AL+hErF8kbPr+SJPzogb6OcsVlWhf+hmiu6XSdye8vP0s1juU9f6XWpjK+EbuUXFbgl5X8o0bU/5JdC39jKbJJY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eqCW4pRC5pGbm11UMHPbwoFsSQ8btL2+H4QdPuuC4KpzorD+y
	uuM0Ih0lpH7jRFwkp2LAMFAXgESpFIDDS+F89IUXlsYaxvQtiEFTDcKI
X-Gm-Gg: AYBFou3cj0//2POSn7lW70iKePg4lUjiQuTH16OjpRZQSToNp0Pb1fJxkBEr269P/HZ
	tg2aTMWBeDu5pvrpzX7woLcZiaWAthcUo26RWxy+k1OQ8vTfVaIjhpjElZBFgGzJehUhURbql4x
	iz+e0BzK+1IDM4cCe/aHY39eYmK6RIsLCrB6M2Jl05Q7x2mZxmCodya2rRrR5f2aTAGPH+9vQLa
	Lz8rbAk8YwforlVDptjXumfABLzQLPTouSHN1Hwz4OrN0ueL2uIZAgCYy9Lkp8ucFhdCEbwHpdX
	WpKlXVoXcx3P1NTLfYlHslpd3ESFpkZ8z7Aw9IglOjbz1PPLs4D/vItvHK7as5vJlRqIDzEQQoC
	gySIIpM6tojM7c9byDv42u3tpfQJNWx8UNYwOAjy1KVs8BwGKbY0FpiqJ6snjaasXMBn+dHIweo
	pSLqpxgXwL5vmcOg/lnN5b8Ew/YUP9sDDrXzmCmetB+DxYr/J3QiZPaiT3rDdpgHUHInRoB+Zab
	XTsR6sSTjTnz+Cn01l1VQSXZBcdGDTTHQZwmkN1OYR2XWQNGPq6r93o1nih2J2XEHJLnSJv2cXU
	sxfq3qGoIw9AMQPxVV/5ZT1Dxav3Rjyjmrm4NE1yrAfxc5z56Lx2oa5z3vqhQxjtSoYhQKQKvgf
	rjKUx/s55WFPoS/YA1gis/6fOkRlkMrD0adabbuZ/SgN94tR7XC/X1Q78vzcAb7WdbQWyZDYpuP
	+YSJ9P5NCvo7ClFmc2h4+0MZgn7T4IqaXyLj8RLtcOm6Tg5ECNz6o=
X-Received: by 2002:a05:6820:a747:10b0:716:d143:46b5 with SMTP id 006d021491bc7-71b1846e9b2mr216447eaf.29.1794944318682;
        Tue, 17 Nov 2026 11:38:38 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b192272ffsm146281eaf.2.2026.11.17.11.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:38:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 12:38:13 -0700
Subject: [PATCH 06/11] nvmem: manage cell attributes independently of
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
Message-Id: <20261117-submit-nvmem-provider-lifetime-v1-v1-6-3cfbd48812b5@gmail.com>
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
 drivers/nvmem/core.c      | 127 ++++++++++++++++++++++++++++++++--------------
 drivers/nvmem/internals.h |   3 ++
 2 files changed, 92 insertions(+), 38 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 70b6126886d9..14cc70e8ce78 100644
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
@@ -496,59 +497,102 @@ static void nvmem_sysfs_remove_compat(struct nvmem_device *nvmem)
 		device_remove_bin_file(nvmem->base_dev, &nvmem->eeprom);
 }
 
+static void nvmem_sysfs_free_cell_attrs(const struct bin_attribute * const *attrs)
+{
+	if (!attrs)
+		return;
+
+	for (int i = 0; attrs[i]; i++) {
+		nvmem_cell_entry_put(attrs[i]->private);
+		kfree(attrs[i]->attr.name);
+		kfree(attrs[i]);
+	}
+	kfree(attrs);
+}
+
+static void __nvmem_sysfs_remove_cells(struct nvmem_device *nvmem)
+{
+	lockdep_assert_held(&nvmem->sysfs_mutex);
+
+	if (!nvmem->sysfs_cells_populated)
+		return;
+
+	device_remove_group(&nvmem->dev, &nvmem->cells_group);
+	nvmem_sysfs_free_cell_attrs(nvmem->cells_group.bin_attrs);
+	nvmem->cells_group.bin_attrs = NULL;
+	nvmem->sysfs_cells_populated = false;
+}
+
+static void nvmem_sysfs_remove_cells(struct nvmem_device *nvmem)
+{
+	guard(mutex)(&nvmem->sysfs_mutex);
+	__nvmem_sysfs_remove_cells(nvmem);
+}
+
 static int nvmem_populate_sysfs_cells(struct nvmem_device *nvmem)
 {
-	struct attribute_group group = {
-		.name	= "cells",
-	};
 	struct nvmem_cell_entry *entry;
-	const struct bin_attribute **pattrs;
-	struct bin_attribute *attrs;
-	unsigned int ncells = 0, i = 0;
-	int ret;
+	const struct bin_attribute **attrs = NULL;
+	unsigned int i = 0;
+	int ret = 0;
 
-	guard(mutex)(&nvmem_mutex);
+	guard(mutex)(&nvmem->sysfs_mutex);
 
-	if (list_empty(&nvmem->cells) || nvmem->sysfs_cells_populated)
-		return 0;
+	__nvmem_sysfs_remove_cells(nvmem);
 
-	/* Allocate an array of attributes with a sentinel */
-	ncells = list_count_nodes(&nvmem->cells);
-	pattrs = devm_kcalloc(&nvmem->dev, ncells + 1,
-			      sizeof(*pattrs), GFP_KERNEL);
-	if (!pattrs)
-		return -ENOMEM;
-
-	attrs = devm_kcalloc(&nvmem->dev, ncells, sizeof(struct bin_attribute), GFP_KERNEL);
-	if (!attrs)
-		return -ENOMEM;
+	scoped_guard(mutex, &nvmem_mutex) {
+		if (!rcu_access_pointer(nvmem->ops))
+			return -ENODEV;
+		if (list_empty(&nvmem->cells))
+			return 0;
 
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
+		attrs = kcalloc(list_count_nodes(&nvmem->cells) + 1,
+				sizeof(*attrs), GFP_KERNEL);
+		if (!attrs)
 			return -ENOMEM;
 
-		pattrs[i] = &attrs[i];
-		i++;
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
 	}
+	if (ret)
+		goto err_free;
 
-	group.bin_attrs = pattrs;
+	nvmem->cells_group.name = "cells";
+	nvmem->cells_group.bin_attrs = attrs;
 
-	ret = device_add_group(&nvmem->dev, &group);
-	if (ret)
-		return ret;
+	ret = device_add_group(&nvmem->dev, &nvmem->cells_group);
+	if (ret) {
+		nvmem->cells_group.bin_attrs = NULL;
+		goto err_free;
+	}
 
 	nvmem->sysfs_cells_populated = true;
+	return 0;
 
+err_free:
+	nvmem_sysfs_free_cell_attrs(attrs);
 	return ret;
 }
 
@@ -563,6 +607,10 @@ static void nvmem_sysfs_remove_compat(struct nvmem_device *nvmem)
 {
 }
 
+static void nvmem_sysfs_remove_cells(struct nvmem_device *nvmem)
+{
+}
+
 #endif /* CONFIG_NVMEM_SYSFS */
 
 static void nvmem_cell_entry_release(struct kref *ref)
@@ -1000,6 +1048,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	rcu_assign_pointer(nvmem->ops, ops);
 
 	device_initialize(&nvmem->dev);
+	mutex_init(&nvmem->sysfs_mutex);
 
 	if (!config->ignore_wp)
 		nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
@@ -1108,6 +1157,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	nvmem_destroy_layout(nvmem);
 #endif
 err_remove_dev:
+	nvmem_sysfs_remove_cells(nvmem);
 	device_del(&nvmem->dev);
 err_remove_compat:
 	nvmem_sysfs_remove_compat(nvmem);
@@ -1136,6 +1186,7 @@ void nvmem_unregister(struct nvmem_device *nvmem)
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

