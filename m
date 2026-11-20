Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205336;
	b=oIJ6rHXBbNqQEPVc6rHYHDlgnUtK/HOS6qhK69xaAQ/41IWSntOOSRhD52Pv1nYR4owm
	 8QtsCs9RcpmpjqG6hTIy5Srw1pxNSuzmEcUxFl3RvuD8LPJPc78ot4cuFWtGfcpFlA7IT
	 fhEUY2aCq5g5DUc/JglTop7UhLzgh1S/ccqKiVVK1fPd6y11ZY7OC1bHmmay1lmQnfJKV
	 24zqpSP623GFUDLduOzU+tmMcTCxB/zek5CHgk1IdsLAO7Dzvb/Ljrno4g8BggXi3Tkjf
	 RT/YSqE5kMxi3w1tkEnDqL1DkxuJg4JOaHHAKKsWwmbY3Mzaz4HnowX26m7cz4zqU7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Hzv13UFV3Pl9XMFamXY9cAE0rjp5+8r0g5vJP65x6c8=;
	b=VBy7tyTqU077x9YGKK3lcD1uhZvfFXEm9KyibXmN4YnUUWmwiBpusfa0HxWdiDgeg3e1
	 w/A0G9+NAhoeLyj6f0vW4p/cyMHNtbGiJ+D73+ackIu7M7WXJXoA5X/vnWSBl+UoQs/4I
	 9rOAPiqQJ7+PuC9JEaceRE/fZfqOKupc1WI0YsdhIoWkurRMtN7UDZjy3aa/23qWKm55q
	 sPzghacKf4dLddtceZbtUwo0mecoX/y9f83nx1ZGoo0eeGDoMN7NQNFxcUlBtAU2+gMAW
	 W85LfcYS4lCXfaxx5wzkJSI6oYUR8ZcJ0bTDixtCTYNDOKR5Cyxz4tS8hzDOLJ/qHbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eOqcAQVu;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2D460A2614
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:08:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E2D460A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eOqcAQVu
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-833e671ee9fso1268837a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205323; x=1795810123; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hzv13UFV3Pl9XMFamXY9cAE0rjp5+8r0g5vJP65x6c8=;
        b=eOqcAQVulJsZQBLNGxXwXn28YL1T9oOgaGJO4jhUzKQ3C/f9Wsqcf+ujewTRf5fGrT
         4A+2QUaRhSsKvDCt95obnK3HW+aYV9SRvB1Kn7asD+mcblyOTPEaF0aAaJsHq14bvtbi
         A/CuyGsr4IStLb9wscMcIlOywnJQXi+xdoUNeBgVfo6qmeG2XRFRWXQsQAaB5LMnA86q
         cflp2GXSKVErMck7QZz5LItw1xC6kRo6y+O0112DigHDbmNHQufA6b53eJRJnAiJRtwV
         GSzywFhKXxfD1z9ms2+8h0czYJcx9ZCK/5qGHyCy+hpUZOOS1XHZkIuCr+T/DrF4j0Yr
         y77g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205323; x=1795810123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hzv13UFV3Pl9XMFamXY9cAE0rjp5+8r0g5vJP65x6c8=;
        b=P+poMtjwjjQvgoo4SRCxiiCCEZOVTzH7t2dOPpMyKjLbicTgF4Q8o3uZDl9knnKhoS
         7SkaKQH+ZwOiWd0Sy3cDHGHfS0xpJkxaDILEpBqAOecrxtdNLwGHGi/TkDVkIvi31cfG
         A2n+k2PD6yQiglvTIgcXrtsghHmR8KSqENl+TrMqZ+4znvOXGPpLx3TsBX0OQz2l1FuQ
         V37zuXsE5iWNVMTStklgT/YhTxEYIiDVDCjpJhgAdI4a8j2VgR7cSEUjBz7vYwGM9lG2
         bfSq4Lv6hWis56dGA+X7XZ5cK4po+DhT9YqyjnHF7GESh6u8XSG6D0slwWsRfe9hAkGr
         dLuw==
X-Forwarded-Encrypted: i=1; AL+hErFuRhu8Uz+aH71Es4w5ZtxqcQweffoYKoSBaTNhzzXZzVL5BQSef87CIw+VwFBuewiFhgs11lIjzw5/aBo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mL0YGxYBoxbgurI6Cev8/E7qhMBeVqf+jJFW9LN8fCNmoOnIx
	QuHa7W0jJHEeaL2Up/KDxy2O/xbHJXJg1AKCqiZzM9r8mpbLgVu9K4CA
X-Gm-Gg: AYBFou3SFzxCjkvPkn4P3jedihiKOCm/vjdU7ABvdBSMVX+Rpmexi27VyAnPDNm4r1G
	jiUGLToTio/WskDEbyH9+zQorqxUUZc7ygYJTFg7uAO+BBHDWhFiT0sQE1qrZ98+NXhsVh+NtKv
	ATu+bd0U7Cfr/TDW5K1yq2ZiqZmZdIDRxo66QH+yHX0k4bvGXekbQDTHtPEUeNZuUzB2vRmfng+
	PqWqDng9HdvYSgV/28XlieNaZqKPQzdisN6uPWe3447XCkOsuH+Dr81ZCME8F6WkchNIL8PMZPt
	bF1QMNykbaCvT8Ojs63iY7Kp6nMjIrZerbGr7bm5d3chI7W5rxp9cSbR6yBHFg0DGAjHLWZu/6t
	e7odOIVW0G9E86Xi0PEQVP9lEcLQGcqNvHv41loaZm12iGjIYAjWtO98m7ZPylMG6MENBbAS1v6
	tWZkt8521wFANDuPnng/XZ425U119XVGFoTQq36/rmW8cbF0TkSvzZJQOlj+oDtk4wegIrt8fJZ
	nk17KUhGp+JSfrLzV/wt/YygVceE5/mwOkstzH/5oC6/mbr0Nj+csBiPvTp+hwgrFjWKPWXn+KV
	RqjNFCSs7vuTze4Od+7k+9CU3gEbo/A4la2ichDbJ4Wm1CkTDGujOvmyrStJIDgHSBXsuyNcBFP
	gXU0wH9RMllLnQt3vgrJkqDdORYcQOKj7g566poqZKyTSW6EyZB2qddhS5pwU7egZpZIjayXcld
	r+BqKuLZtUOOU+VYU6fSkTG02fXSnwGBMs/HPGnLbEAOjJDITvHhVouw==
X-Received: by 2002:a05:6830:2e11:b0:862:a0ce:f557 with SMTP id 46e09a7af769-863152f9025mr4641936a34.4.1795205323499;
        Fri, 20 Nov 2026 12:08:43 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316822ad4sm2746249a34.3.2026.11.20.12.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:08:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 13:08:36 -0700
Subject: [PATCH v3 06/11] nvmem: manage cell attributes independently of
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
Message-Id: <20261120-submit-nvmem-provider-lifetime-v1-v3-6-523610652402@gmail.com>
References: <20261120-submit-nvmem-provider-lifetime-v1-v3-0-523610652402@gmail.com>
In-Reply-To: <20261120-submit-nvmem-provider-lifetime-v1-v3-0-523610652402@gmail.com>
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

