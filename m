Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944326;
	b=CQnDC19AAiqSOtZu+Zuz52Ms1p79/CHEvwoVb3/FA4atL7VGeHM//aFudISJB7TizGHr
	 B1WnHYliF+vCR2IevLKyPspyUXOomhP+TE1k3X7I1hozsyCABE9Wql4xyiSFJtNaH66OD
	 skJX4rIpSF0hi4KA1PhjLvAA89YOFOjlXt382Sejpf01+wLlYDy1l6oqejxaTSwNDcrrg
	 xCUdSmwIuQiysADwMvrCJQRW9dV9V22f3an6FNIY2LXi/8RIzFYtjuTd2SY6NWHj70GM1
	 t6zPb+Qsb2A31zNtv79dpxbmZQxy7YtcEY60/N+sK8X3uAQZPzpMFOteEP+nAcKb9VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=MUImTTPP6H69Xlh8bMMdx+YlFGd8gVKneBJhC+vmpSc=;
	b=QzWOy6CGFulQ3upkCE57LcRS1U8xXarnCo2sL5aXIPBnzztMiFYLkknD/EKnWOThDjKH
	 2k+z5KitVHgAxQFKg0QvZkrYQ6nL6ZSS7QLAAZ+I3prIwxv1b7SAxzV1kmU93Qki4LBas
	 WEFc1w0cw1BubbaV07CMPf40ZQfyz7PQ8LM4XX9r6Tmr/UBhMYW82ubHggfdgJo2bPvrD
	 4FZ4LdNOejSi0+4Hp0ndG4Pc5hthMPEVk0ZrsD4Mbeta5BGaJ8VbhE7hFH01/NrEmw3UT
	 Ueu0xqPtLR3x9E+wgg7Q4dJfMpch1Lf2zoEazHv7wPHu7vsFQ6e4Mt6G8srx+pMMUuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZPl6BZfq;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A17960A2608
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A17960A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZPl6BZfq
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-70059e4dab6so119314eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794944325; x=1795549125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MUImTTPP6H69Xlh8bMMdx+YlFGd8gVKneBJhC+vmpSc=;
        b=ZPl6BZfqm10BD6vhr1ndcU/U0e1Pt3Hts1W927q7DVBnyFL1D01+YNc5SNVOu4PQyY
         s0xcQnYU6Skv2IjpEp6lyhQ0xBhT3St80maQmkaWlqGicMYERd9oiHOpTisS89vaAd6k
         l64WzQcecAZfLz5rQslPMFuYJ5LQjdB9eUnRtQW5ccxB9LcN+DbB73KXZXYEylqfzkEj
         64NAqgKhSTCi7KM3ZS5p0DjMd8OOunqZT3uYLrl5Jq0Q7kppg97C+RjgttafJ3YECfDX
         X/B0Asdi9UpmcBqutQVt9F0D0Nwvj4B5zQWwgLAV92Vjwp8z2AdSlk10ThR0W2vC2hE/
         8Blg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944325; x=1795549125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MUImTTPP6H69Xlh8bMMdx+YlFGd8gVKneBJhC+vmpSc=;
        b=vEnSM5XxgOLCXKngwUk5uOeBeAgo8N0M5M6emCSAX3YMNTmxRGHKdQ0N8JFUJq0Zvi
         evM5hQGNbpVwZIR9Cn/sFIKTN2C3cxtJdyMs0O9J9B48/BmhQsXFO3Sbkyv+zWDt4ws2
         amDNDGcc5TdtUOZI3eDSCp8vcdXlMEAThNq6u9EKVmFFvZ6UDCa1XENUfUrH9lBQvxu1
         tei1iCfec20cJS2YwaACos/jL0OiV0qRyOzgDYhpq6gM/e/LU3eKjIbDzdvFffQ9f16V
         6n0LcKTaIaSKzel4DLcOt1tcGnVM+gg1ylc8o8h+Q4YEN2j8aGFEJ4PgIrxp3SwZi8yN
         kDRw==
X-Forwarded-Encrypted: i=1; AL+hErHoDxA1q76yck5ezZUHzUEQIQFxT5DjlB3BrqjgUVUsujcQoE31DEZt9AKP9oU/dS4hiE8h+vsNMlhi7Bg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DwOZBtR1I4RFn9L+16JQzs/yKs/rtbjV3zhktH7xXf7qMVbt5
	rR9xj0S1je/7bPE+K6g77WtXWde2VsueXNC1OQPgZa7h8S0y0UZbsF+m
X-Gm-Gg: AYBFou2VFqtP+9JD8c6pawspTHSSMpb5medGB93g++d8tQlJiAJtQLBx1r7wuih1M/b
	TYnY5V6fsWLRfKjnwLA0jcP/oy1Y/HVz50K36Jnjax2Jn8sU8v1DeACvWQlRfH0mbZIBnDYXfjY
	g5CE2Z4xbNKTTq9GX8m1PSyXm6a8y8jM57K//A1lQ99B4q6ycKjl/Q8bGaYzaC69sOqLc8WeOZW
	kzVpgWOoQGhounxSPg2dXYQ6xc/WYu7hmIP/RSIPQMVA7+qi/YJBf2a/WXcp+nFvsuS92rMoNih
	g9XktBWPIbr2mz7c5pDvaEwoBwnUZXbgfTaCbK1FB23BIXOegjgt00V+6SpxraIZDRzgeeHVFBc
	bVXhT4Nx9JJNco3XKAP72GKBU93wogEbLi3dBLHDnWQxlP7M46Wu6R4P4U/QYf7SfuHcW5GbaLV
	6rVdI73gTb6j2tensgltymWdQ5pN4x0Lc9iJV8DHgRETmH9pOYpPd1teSx0QKtCHbUGVk3HIF2j
	QBgGFhAaohveilouJACNpSy+aAE41pXkzsZKK+5v0qxmjxOxU0kW68dBZTzPjGdCJGWvygU6ub3
	9hH2XVarHZK8/Ri0hFrtxE7YKq3W50CNyUmtLqSh0wbsst7PImwiuYvBBth7SmAXOzhDjSs3Lng
	3aD9vpIqhRwxnwEDZmf7m2RLM665hf8A4H+Jd1ERngKNy4aWB+XgmbxI6OgJEWD8DgmxKuxWaGU
	ahZUMTDb7TOmkprcHkuGHpjbq1BTipNYz34KZzGpkqXUGdwD1pXjw=
X-Received: by 2002:a05:6820:a298:20b0:71a:f794:49c7 with SMTP id 006d021491bc7-71b185bdbcfmr221200eaf.66.1794944325182;
        Tue, 17 Nov 2026 11:38:45 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b192272ffsm146281eaf.2.2026.11.17.11.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:38:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 12:38:15 -0700
Subject: [PATCH 08/11] nvmem: disconnect cells before removing their layout
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
Message-Id: <20261117-submit-nvmem-provider-lifetime-v1-v1-8-3cfbd48812b5@gmail.com>
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

A layout can be unbound while NVMEM consumers retain its cells. Keeping
the layout module loaded does not retain its binding or private data,
and looking up the module again at cell put can access a removed layout.

A failed add_cells callback can also leave cells registered even though
the layout never bound. The sysfs failure path instead removes every
cell, including cells supplied by the provider.

Remove the layout-owned cells from lookup and mark them disconnected.
Drain their sysfs attributes and SRCU-protected accesses before returning
to the layout driver. Old handles retain only cell metadata and reject
I/O; a later layout probe creates new cells. Use the same cleanup when
cell registration or sysfs population fails.

Replace the layout module get/put paths with this drain. Leave provider
cells registered and rebuild their attributes after layout removal.
Clear the provider-to-layout link when the layout device is unregistered.

Fixes: fc29fd821d9a ("nvmem: core: Rework layouts to become regular devices")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c    | 84 +++++++++++++++++++++++++++----------------------
 drivers/nvmem/layouts.c |  2 ++
 2 files changed, 49 insertions(+), 37 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 57c1da5ab547..f1a254a0a5cb 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -29,6 +29,7 @@
 #define FLAG_COMPAT		BIT(0)
 struct nvmem_cell_entry {
 	struct kref		refcnt;
+	bool			disconnected;
 	struct nvmem_layout	*layout;
 	const char		*name;
 	int			offset;
@@ -671,6 +672,7 @@ static int nvmem_cell_info_to_nvmem_cell_entry_nodup(struct nvmem_device *nvmem,
 						     struct nvmem_cell_entry *cell)
 {
 	cell->nvmem = nvmem;
+	cell->disconnected = false;
 	cell->offset = info->offset;
 	cell->raw_len = info->raw_len ?: info->bytes;
 	cell->bytes = info->bytes;
@@ -991,23 +993,50 @@ int nvmem_layout_register(struct nvmem_layout *layout)
 		ret = layout->add_cells(layout);
 	}
 	if (ret)
-		return ret;
+		goto err_unregister;
 
 #ifdef CONFIG_NVMEM_SYSFS
 	ret = nvmem_populate_sysfs_cells(layout->nvmem);
-	if (ret) {
-		nvmem_device_remove_all_cells(layout->nvmem);
-		return ret;
-	}
+	if (ret)
+		goto err_unregister;
 #endif
 
 	return 0;
+
+err_unregister:
+	nvmem_layout_unregister(layout);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(nvmem_layout_register);
 
 void nvmem_layout_unregister(struct nvmem_layout *layout)
 {
-	/* Keep the API even with an empty stub in case we need it later */
+	struct nvmem_device *nvmem = layout->nvmem;
+	struct nvmem_cell_entry *cell, *next;
+	LIST_HEAD(cells);
+
+	scoped_guard(mutex, &nvmem_mutex) {
+		list_for_each_entry_safe(cell, next, &nvmem->cells, node) {
+			if (cell->layout != layout)
+				continue;
+			WRITE_ONCE(cell->disconnected, true);
+			list_move_tail(&cell->node, &cells);
+		}
+	}
+
+	nvmem_sysfs_remove_cells(nvmem);
+
+	/* Old cell handles retain data, never a departing layout's callbacks. */
+	synchronize_srcu(&nvmem->srcu);
+	list_for_each_entry_safe(cell, next, &cells, node) {
+		blocking_notifier_call_chain(&nvmem_notifier, NVMEM_CELL_REMOVE, cell);
+		list_del(&cell->node);
+		nvmem_cell_entry_put(cell);
+	}
+#ifdef CONFIG_NVMEM_SYSFS
+	if (rcu_access_pointer(nvmem->ops) && nvmem_populate_sysfs_cells(nvmem))
+		dev_warn(&nvmem->dev, "Failed to restore provider cell attributes\n");
+#endif
 }
 EXPORT_SYMBOL_GPL(nvmem_layout_unregister);
 
@@ -1521,12 +1550,6 @@ nvmem_cell_get_from_lookup(struct device *dev, const char *con_id)
 	return cell;
 }
 
-static void nvmem_layout_module_put(struct nvmem_device *nvmem)
-{
-	if (nvmem->layout && nvmem->layout->dev.driver)
-		module_put(nvmem->layout->dev.driver->owner);
-}
-
 #if IS_ENABLED(CONFIG_OF)
 static struct nvmem_cell_entry *
 nvmem_find_cell_entry_by_node(struct nvmem_device *nvmem, struct device_node *np)
@@ -1545,18 +1568,6 @@ nvmem_find_cell_entry_by_node(struct nvmem_device *nvmem, struct device_node *np
 	return NULL;
 }
 
-static int nvmem_layout_module_get_optional(struct nvmem_device *nvmem)
-{
-	if (!nvmem->layout)
-		return 0;
-
-	if (!nvmem->layout->dev.driver ||
-	    !try_module_get(nvmem->layout->dev.driver->owner))
-		return -EPROBE_DEFER;
-
-	return 0;
-}
-
 /**
  * of_nvmem_cell_get() - Get a nvmem cell from given device node and cell id
  *
@@ -1619,25 +1630,16 @@ struct nvmem_cell *of_nvmem_cell_get(struct device_node *np, const char *id)
 		return ERR_CAST(nvmem);
 	}
 
-	ret = nvmem_layout_module_get_optional(nvmem);
-	if (ret) {
-		of_node_put(cell_np);
-		nvmem_device_put(nvmem);
-		return ERR_PTR(ret);
-	}
-
 	cell_entry = nvmem_find_cell_entry_by_node(nvmem, cell_np);
 	of_node_put(cell_np);
 	if (!cell_entry) {
-		nvmem_layout_module_put(nvmem);
-		ret = nvmem->layout ? -EPROBE_DEFER : -ENOENT;
+		ret = READ_ONCE(nvmem->layout) ? -EPROBE_DEFER : -ENOENT;
 		nvmem_device_put(nvmem);
 		return ERR_PTR(ret);
 	}
 
 	cell = nvmem_create_cell(cell_entry, id, cell_index);
 	if (IS_ERR(cell)) {
-		nvmem_layout_module_put(nvmem);
 		nvmem_cell_entry_put(cell_entry);
 		nvmem_device_put(nvmem);
 	}
@@ -1754,7 +1756,6 @@ void nvmem_cell_put(struct nvmem_cell *cell)
 
 	nvmem_cell_entry_put(cell->entry);
 	kfree(cell);
-	nvmem_layout_module_put(nvmem);
 	nvmem_device_put(nvmem);
 }
 EXPORT_SYMBOL_GPL(nvmem_cell_put);
@@ -1809,7 +1810,8 @@ static int __nvmem_cell_read(struct nvmem_device *nvmem,
 	int rc;
 
 	guard(srcu)(&nvmem->srcu);
-	if (!srcu_dereference(nvmem->ops, &nvmem->srcu))
+	if (!srcu_dereference(nvmem->ops, &nvmem->srcu) ||
+	    READ_ONCE(cell->disconnected))
 		return -ENODEV;
 
 	rc = nvmem_reg_read(nvmem, cell->offset, buf, cell->raw_len);
@@ -1926,7 +1928,15 @@ static int __nvmem_cell_entry_write(struct nvmem_cell_entry *cell, void *buf, si
 	struct nvmem_device *nvmem = cell->nvmem;
 	int rc;
 
-	if (!nvmem || nvmem->read_only ||
+	if (!nvmem)
+		return -EINVAL;
+
+	guard(srcu)(&nvmem->srcu);
+	if (!srcu_dereference(nvmem->ops, &nvmem->srcu) ||
+	    READ_ONCE(cell->disconnected))
+		return -ENODEV;
+
+	if (nvmem->read_only ||
 	    (cell->bit_offset == 0 && len != cell->bytes))
 		return -EINVAL;
 
diff --git a/drivers/nvmem/layouts.c b/drivers/nvmem/layouts.c
index 409909e3244f..442947873591 100644
--- a/drivers/nvmem/layouts.c
+++ b/drivers/nvmem/layouts.c
@@ -118,6 +118,7 @@ static int nvmem_layout_create_device(struct nvmem_device *nvmem,
 
 	ret = device_add(dev);
 	if (ret) {
+		nvmem->layout = NULL;
 		put_device(dev);
 		return ret;
 	}
@@ -203,6 +204,7 @@ void nvmem_destroy_layout(struct nvmem_device *nvmem)
 	dev = &nvmem->layout->dev;
 	of_node_clear_flag(dev->of_node, OF_POPULATED_BUS);
 	device_unregister(dev);
+	WRITE_ONCE(nvmem->layout, NULL);
 }
 
 int nvmem_layout_bus_register(void)

-- 
2.53.0

