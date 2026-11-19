Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106558;
	b=gPKeSAa7WS75oEnaL6SKmUY58u5ugEV3/kwi2iKEMFLmii8B+l6fOebk77PF2fPRKy5m
	 H5Ye+1irebULNvI1WeqQdWTwqSdbZDH/AqpZJ0tLmzVjBtds/YNBYgrgfEp3CZVjEZBdH
	 JxnN+1a2MNUPzi0c47kY9rgT9MF0b4wy1IPzho33uzN6KwpGcjV0fami9gxWcukRO1Q9S
	 LOH+USuNovFSdIie3kCwVSpnHtuPygrFS6nbVGgGGHoA4Ad0B4NtsCaCa9b+gtbdWqZS1
	 Vot7WWyP9o9aARNorn4k4kSKXzSV2yWT+O9+RTKQm5fPhwOYgTY+sv4HrxOh5Rb968w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=LYu3SjHwdMXAbFGNDToBWPsdFI28fb8memjlT/fnNdQ=;
	b=P4iJ2xIafEu/tlWAwl/abd6E9ZjaZv/gfioWcXroHbTe/4vbpHsrhx5unchnO29J8jQZ
	 c9dvxmn9dmSrCwrkOuKSNVVxA/HFWj5QX8olWudosu1E/Sle4zA9kTTscVnB/0Vg/Sv2Q
	 ZCNAFq7jJelAS/cqnl4LqVyZb1aNPkTMwSMWrDE7629TrYuGToUrdu/SEB4C4ooB9dkuq
	 9jSmdbcCgfzA/lfSS/7nP7wRT500A71i1GnMoGrGcro7iLEjp+L54P5bCMKsfeEI50je6
	 MKYtPVyA2vNWKxv6WS7lAfyvBve+AhXPPJ8jE4e95EJbhuf/yklJ8kPdA2Rcpj7ddag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kQNFEcB9;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDC660A260C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBDC660A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kQNFEcB9
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-71ac798b8bbso1527638eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795106557; x=1795711357; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LYu3SjHwdMXAbFGNDToBWPsdFI28fb8memjlT/fnNdQ=;
        b=kQNFEcB9GXT7yDTrbMoRPOAhDVP77Dqu33gS9HPYwcUFiumdWU0mm3qCpCHDpgjBLA
         kVmY8bNEDof8rCURJKw1Rlke6ijfhFrnweQkSM0XAfcsBq4AtHV6BkhWy3AyaSSN0n1K
         10cagFgGm4nf1wUzeKyE1gIQC4mTC+JcJ8U4uZXCUsvEYcDylM5KI3l0iDpBjmMPaA2y
         8yDBqeaEG65804uIX/sOOgqMqhLC5iqfSHgT7JWNMA3SAKUO7sTERjXP93/kx5lrT2rn
         2bNqMY9JjiqZVwBFpGIdIhKcyJINg4oj8JZ+tGzGmN/M43BXaCvbKpz38i49Nt4G8LfA
         daiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106557; x=1795711357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LYu3SjHwdMXAbFGNDToBWPsdFI28fb8memjlT/fnNdQ=;
        b=kS1y7pz9Ac28SOl43xaZG0V2xipSsvctToKvF9a+VkdTtvUBcRoHkm+l4NLmRv6jqo
         rz/uN45MqUIxb6r7Oq0qHGCqlJzPL/65O5g994ntNVzt/2Nz8Ab0o+L/gIlUQZGyN+EA
         SLtT/iHmghNfllIiu2rtCRUE4WTKxK1EQ5hXxJdx6r1wBCXcOD2NEzNhJ55vmCuBlQK3
         NcyzONZ+COHKeyiqFjWQV08oAP4qFyGhm7ftCRWq/VNuDhN61D3utpOuP8WiMUB8lCSH
         5gwtGjpgYPFGzd3+rh3xgzLn466WF0Fqod+0mhSavAb/Gf3SCK475cOs0SDH41xZAmVd
         LVqA==
X-Forwarded-Encrypted: i=1; AL+hErHIHRtc1tWATmhx0Da7iqhk4UonhyB6p0vbuhta77Y3Nb/qMroM50RZE7voqFaGOpEmfyDvEUl/eb3pb7k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HxGR84CkFwABCAXHIK36FI2dwXz8jhkjmYONTRB0AucPeGbGJ
	zp5cQH866o1S5V7L0Hc/btkfdMseLH/f/WcRF/3fO6yXeKtnbZTNO4YD
X-Gm-Gg: AYBFou3gacF8WsSvR7Ao/KDDbECnrzWsiWEt9DGar9qvRM/sj0cS5iRlwHmStMRneMT
	c4ysdad7xrhXkmB17+hdx2L6eL5muThHqv32Eocl9qcaCyceZcfsuSE8nkV4T5xoQOw2zCORiLF
	iJSyCZgLYjo9DTL7lLMJSOXCzWWiB6BbQRP6ahbxXHo4noU7F84C1Kn4k26u6omuEwlk49UnDUh
	Ms+Fn+8OGF0vppvx09lKwKCKbVzGlkjhoJE79lH9klnbzFcniBC5WcpF4WK7COeyl2PlEoPU1jR
	ufOks0CucLchFKl+FZ0NbtNGaOVfWmu7Jz7jUlrdmjnbicvvAT553Jxg2pj85df3ugiab6mW62S
	arZUqhJ8J1lFnOKqMdEEo5m4XRYQiOKskrzc34G/pIwaKferKYAGzwAByE5Oas7gG0A1TT+B1vY
	pYlbGS7geO59igjJpVtaZO/NNOjF+ZAEavGGb52b4EYMrpTORVwacXwgpzTMBEaisX35tu856im
	TofvTpZ9YF14jVC29kHHrITBVZ9vzwd9dgXR0Ahp89znJGVCPlIvJqyoDxk+DXvTfH35UH1pwpX
	kykdtP0RuhlVfRAA9E6AZgMJZyKxS5FAUsWBmonk8jT80x2gVCEi4YD5emkOiig2tVvqKC74/N3
	Q/wmK4ClaF1BV5E2HHKHS1EVA7nt9tVYhMoqtW0JHLxVWVuiiL1bvjXwZPcmYcg+++ylY1sMbgW
	ERn5NhHYRctUFqQJw+OF2LgE4sgunKcxn2cFNDXQMhgVHb2+BqtaE=
X-Received: by 2002:a05:6820:83c7:20b0:71a:faaf:670e with SMTP id 006d021491bc7-71b395b427bmr69222eaf.46.1795106556849;
        Thu, 19 Nov 2026 08:42:36 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e4a6dsm341975eaf.13.2026.11.19.08.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:42:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:42:06 -0700
Subject: [PATCH v2 08/11] nvmem: disconnect cells before removing their
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
Message-Id: <20261119-submit-nvmem-provider-lifetime-v1-v2-8-8fca3ec5f18c@gmail.com>
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

