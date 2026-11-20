Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205328;
	b=nC7Oik+n7hpdEEEu4gdrO8DJAzlLRIvshICJ0k8sPNqmY6r2h+L0AQZY/XtLNy8EDara
	 DoFiSy3F2QAoi4U9RNjp+q5ywS8dbYKSO/7NnfAtSWrPh0SNnKMX4Dk69F0Y5j3ecEjq6
	 qLh9+TgAwqn0zOPbH8JL/mbNDkuhaC8TRS9r4813KdqWdcb9jgaBUSZhuH69raqKaeJDz
	 Rk85Lscat+IevYkl5NfYY5gXRNuVeHOM6MlqhIclyvjUv7zaIBJ5QaPqzyAJrn22gLdob
	 yfkSM9qx02Vy0aipj7bzfO53j98PdPwM8vj4FteTxZHoUpQEIHGaVUcCHugaZNjyiKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=LYu3SjHwdMXAbFGNDToBWPsdFI28fb8memjlT/fnNdQ=;
	b=eJd6DFLxcREFGY3OqXkQf3sIfNoZ+YkVbbK+yeY6dHxz4ujIQ3XgsVM7G8OPtzCCoeYC
	 rIyAwA0khgRixQabYbod4qzqZErpMY9N3syz0AWqLeGCNeoUNfTlEljeB71QgxH220DBv
	 aWo5OlV3gnr2wCsanRD4WX2ikptAgp+SnPqhU4khvU+W1aEWkjQP/hv3iCY4XvlQOwFpQ
	 +zh3WM/AjHQt/yPdh1Leo0dFznOugj3bvTiBxwT4J1Yhki79BYmtKRGe/eq0fmkyx9sIo
	 oZ9tqB/YW54ZrmPk1emdMtCXrewgn5RDtQPeUjOgbeYoto0555LvE0s3VIi4AEbT7lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BsomUdOP;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C04860A2627
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:08:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C04860A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BsomUdOP
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-8629fc8ad64so797316a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205326; x=1795810126; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LYu3SjHwdMXAbFGNDToBWPsdFI28fb8memjlT/fnNdQ=;
        b=BsomUdOPNt13erWjGwTllh3BQ0WiiRObMcre4sXzTtbfnXH7mhHfRVqFHXXUjXXmGe
         xlCzJKOCZlhVl75VU0GgTJyMqArPkFJ7BjwfEX9txRGA1BXmtASPuajiYOj6UdBI+k3+
         tyDnIVqX4MdyAhZfO3DQMoswiQDKR8ZTpwpVXMmdQ0ueKSlsfLOkQ6d4IUhLoCYm3gRl
         3HxA+WETmn7v8IY6qv6QAupb/zG2PHErYYu18FMjuqRFoCftER1DOtnuEE5MfXhTd1fs
         0bbMGmQEGOcr5flxNCAUOmO9+MVuF61IZZo3IZ2uRxb7PM7fQOR0UgAHk43mRS9Ya4wD
         7heA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205326; x=1795810126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LYu3SjHwdMXAbFGNDToBWPsdFI28fb8memjlT/fnNdQ=;
        b=kKRQ6VtkVb/JTlclg4rdiN8Di9G+ABzrU6ZTbTyGDzj965WGVPkV7HeV1PHWdT7rOM
         zCGTx3hGjfZuuOs+zTkJfzPx6ANUD5fP//2TO5npIzzlYlQc7lqM4HhLgzjsMh5UvcCM
         H7G8NNUdw5U2UiNwSlYAIbNPdZZdlDLoBWQNScSJpMoxStYr2ZF4xB2KHHmagBATbYCQ
         v3BeptBK3s5sVHmyKdbM9rGCgk9Sr/SX6kmKlAAtqDgFVzLS5HwetbF+PzvF78K87vUj
         T5rQgAhu2adDuDtVU2yYyP5iJXQeURm84ITKhkTlxRs7WEjwUSmeuwuZpAciKO68Uzey
         sdzA==
X-Forwarded-Encrypted: i=1; AL+hErE/TGlBNXeGpo4pDMuULhcs47h6d4PWPfOcCkYyw6E/Ai7AZvYL88eQj2wc5g3tJHg5vnFjbb5C+wfZIG0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BUW52VTy1qmM6XtycKGm70tcS+SCki3kWoLiMncNMwLMbucnm
	Mq2HGkqyFhXCKqywQMa/+XIl5Iwy+TxzaFvb0nEbneX4Ve8EnmbnQ5NE
X-Gm-Gg: AYBFou0g8RGrdQSJZhOjxGPrnCqggguvjyJDBfs0pnZ5WpRyxfyyalHhbW51Gc+MmL3
	hpQldgJHS2Fmo1yTu0Kgz/At8MDsGwyfewB5QjEzQFM3v2EgmJj/j5MxkkqLCx1nXjQnDg5ghDu
	JPLLWeJhQKiAQqDwVViZvYrdKmj4X1BeclzbVp84CRVtKzbBAdH+lfKUJHJQDHcRp+OobBYwwdQ
	D7limqRI72l8ryRTqq2Nt6ErVnD60E3IrTNYzUxveVedpACRXWEBb1KDvZKtMHuofYia8woMAa4
	2YRysnjgz9UyOoZ1enVMg7gkMqJe2Bi7wcmq0Hl65mdjfNGr4+FLDjnt+8dGl9lxmdJF1oed9aq
	xpLHoGFxcNLTBsUJEwKjArMeN0vnn2x6CK92UxZO31uJ7MlpMbnWcfQOYHYRDsA2kWus2hDXEjl
	0vB3+H3m2Y0/y9s8lF+KB5mwoxUi2EZtLAmHMPe7nLNcAH/BRsGfriqpyT+Q693Y/hm7M16BXjl
	QTA3F/Wpb8TfLFmb8IO+SQoujTg3xeY8n7h7uShka5Zqiu7QiPvLBK6VhIm/Mf2QrfMYEpgynTe
	j4MO9934dc3LnWZ0xoRe2ZN/rBFLzce2yfALxjq8McSNS9+Yg71RECJCoyYOOJeYW6y/HneW3kT
	FIlwNyTeu49yAnavufWmzolQGDV7k9UviHJm5HOvl0uAoa415jp3RybCp4yl54RCg4uFo17R9u0
	77YvKlQbW2g0KBJiVgZ5tlvvdDKoUlckf0vTUMgayBVY3ixLXvJ9sy8h2YRzjHYgQwOYjA+X102
	Q==
X-Received: by 2002:a05:6830:448d:b0:862:a901:2202 with SMTP id 46e09a7af769-86315657d67mr4632724a34.17.1795205325715;
        Fri, 20 Nov 2026 12:08:45 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316822ad4sm2746249a34.3.2026.11.20.12.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:08:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 13:08:38 -0700
Subject: [PATCH v3 08/11] nvmem: disconnect cells before removing their
 layout
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
Message-Id: <20261120-submit-nvmem-provider-lifetime-v1-v3-8-523610652402@gmail.com>
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
 drivers/nvmem/core.c    | 78 +++++++++++++++++++++++--------------------------
 drivers/nvmem/layouts.c |  2 ++
 2 files changed, 38 insertions(+), 42 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 49e80389e198..edc2f61e6e0a 100644
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
@@ -652,6 +653,7 @@ static int nvmem_cell_info_to_nvmem_cell_entry_nodup(struct nvmem_device *nvmem,
 						     struct nvmem_cell_entry *cell)
 {
 	cell->nvmem = nvmem;
+	cell->disconnected = false;
 	cell->offset = info->offset;
 	cell->raw_len = info->raw_len ?: info->bytes;
 	cell->bytes = info->bytes;
@@ -976,24 +978,44 @@ int nvmem_layout_register(struct nvmem_layout *layout)
 			return -ENODEV;
 		ret = layout->add_cells(layout);
 	}
-	if (ret)
-		return ret;
-
 #ifdef CONFIG_NVMEM_SYSFS
-	ret = nvmem_populate_sysfs_cells(layout->nvmem);
-	if (ret) {
-		nvmem_device_remove_all_cells(layout->nvmem);
-		return ret;
-	}
+	if (!ret)
+		ret = nvmem_populate_sysfs_cells(layout->nvmem);
 #endif
-
-	return 0;
+	if (ret)
+		nvmem_layout_unregister(layout);
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
+		srcu_notifier_call_chain(&nvmem_notifier, NVMEM_CELL_REMOVE, cell);
+		list_del(&cell->node);
+		nvmem_cell_entry_put(cell);
+	}
+#ifdef CONFIG_NVMEM_SYSFS
+	if (rcu_access_pointer(nvmem->ops) && nvmem_populate_sysfs_cells(nvmem))
+		dev_warn(&nvmem->dev, "Failed to restore provider cell attributes\n");
+#endif
 }
 EXPORT_SYMBOL_GPL(nvmem_layout_unregister);
 
@@ -1506,12 +1528,6 @@ nvmem_cell_get_from_lookup(struct device *dev, const char *con_id)
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
@@ -1530,18 +1546,6 @@ nvmem_find_cell_entry_by_node(struct nvmem_device *nvmem, struct device_node *np
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
@@ -1604,25 +1608,16 @@ struct nvmem_cell *of_nvmem_cell_get(struct device_node *np, const char *id)
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
@@ -1739,7 +1734,6 @@ void nvmem_cell_put(struct nvmem_cell *cell)
 
 	nvmem_cell_entry_put(cell->entry);
 	kfree(cell);
-	nvmem_layout_module_put(nvmem);
 	nvmem_device_put(nvmem);
 }
 EXPORT_SYMBOL_GPL(nvmem_cell_put);
@@ -1796,7 +1790,7 @@ static int __nvmem_cell_read(struct nvmem_device *nvmem,
 
 	guard(srcu)(&nvmem->srcu);
 	ops = srcu_dereference(nvmem->ops, &nvmem->srcu);
-	if (!ops)
+	if (!ops || READ_ONCE(cell->disconnected))
 		return -ENODEV;
 
 	rc = nvmem_access_locked(nvmem, ops, cell->offset, buf, cell->raw_len, false);
@@ -1919,7 +1913,7 @@ static int __nvmem_cell_entry_write(struct nvmem_cell_entry *cell, void *buf, si
 
 	guard(srcu)(&nvmem->srcu);
 	ops = srcu_dereference(nvmem->ops, &nvmem->srcu);
-	if (!ops)
+	if (!ops || READ_ONCE(cell->disconnected))
 		return -ENODEV;
 
 	if (nvmem->read_only || (cell->bit_offset == 0 && len != cell->bytes))
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

