Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205332;
	b=Aq8XbR2Qj+87/0cmCdQw0hZRkpI10MP774ceyewML8OrezwZH7oHYVohAeJwwv14+kli
	 iEmrsZJn5w/piAtvZfm+CHR2K1fog3YpZ+ym7qfUkquT3X9fZ8i0sN8U26FWjUPWrTQmt
	 C2imbPLKNlxEk4yTz9mdl+lnAXfrBRAWgZfnlBiYRhctR10FakQUqDf+Aato4X5LQEVUe
	 LRxcrucru6uEtnagU62SFpJ2PSD/4x+hwmZLArs6sR7zu5bjMGT3bQlGCaYH39gXWq0yW
	 aioIvUlOsy2oZZQDc6FaUps7mYXFPOCq/uStHP1FBBoXtN0eKPeYiXOZKYhuQB8vtLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=oct6fbqQrky6pqRbjZN6yqPuHBh9eEiJJWEjiymO1tQ=;
	b=kmfrE3nvBxcevuw2EoCHL3IoZUyNxhYMQ4gLbHoqOlS4yXOZ25ASgQJx3ISH6xs2JHKa
	 Mg/W5lkhuT9akVtqrLD/Mw8RBWNahAcm6JfskiuHYwJI4AY3JskPwnRE74daIhEbhqK3O
	 F7gwOrUOBgEIY/dD111AX5PKz2JJmSoSONkyYPjPFP3Cjw7AwnW3AlFMyGLpROx3RFEP/
	 YCjmTxgerGaI4u6oEaDRvAucx/szYiyHyQPOAnMKeENN3NIXPpwhrw27F0068+38d6ZmE
	 +TgvAyooFUtC1hjXWiwPea0UQPRADS06Co55/y6CZX+cALOMPUVN09wh/A1I2JwK+DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y3SXz4+L;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E71606A6C6
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3E71606A6C6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y3SXz4+L
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-85c1135c286so992268a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205325; x=1795810125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oct6fbqQrky6pqRbjZN6yqPuHBh9eEiJJWEjiymO1tQ=;
        b=Y3SXz4+LCpvCqqIxRE5/1MnTu7ROhiZoUH/nIjOZl3bG5fr8gaRgGiEEiQIchorEbG
         uuLEYDjOCaAVcU9P/DuXH3NFtBSCMafpocl3my+rNuDFT1LVkEsZaV2bRDOYUhwuUl1R
         K5Z997ovvRQ7h72/BRt8Ai7tDXZHABAs2OHFwKiLcrn5vWuKmbOqZaqegea/OsoRF+53
         +tX7PJho+kZ6dsZB6Zs6wRlBieFd05377mVCwpbuy1pyJAQ8HeoXYfxviRzmE9j6QxRJ
         oCWjH7J4y+2YjNPm8pCQJmSB99tp7CaYhgNNEnUVwOJm8dnzZ0GbvqntKQ/sARZrviwt
         oANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205325; x=1795810125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oct6fbqQrky6pqRbjZN6yqPuHBh9eEiJJWEjiymO1tQ=;
        b=HB7accLeRr98ifcISOq0BuCNvrYbFA5cnnj/0MDklFGPo0eavE/GcQD3iTgH5YowhE
         AxIM/Ml9b5f3wQvcIzC51zf6rziCAqsHZVt4LNVZ0UDE68+lNOt9vArcwUGjpg/iPiQN
         +1xxfUWqeQ/4Hj6p4+NK6nHrBoMuLnmJSzL3tLwuIYFxEn6hBBG6Kvuzgg/5vFTagzHr
         Y0scL9ENT6944TVfMynXYitAxk1bcvHRgChBDGSRB2/jmkRPH6OBbWegg96hWf5aK+QW
         1ujRGEesYpWwYEc0FZKLztTbl3d4h/Lmrb7hoIviLMBFO3U3dJUOAmAMO1WXTl4rIOmA
         cJag==
X-Forwarded-Encrypted: i=1; AL+hErGW1mx2i94ZgxkGOhWeSbgcb5leXDzHRJdxKxhQPeYLidBiMMjPg4pse5JMDi05L0qr6YPb5Pqr4HGpGiA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PxVmhbH76qeutkS44x0OJJ2qdAuzT7py8FhrTHwQ/oUnH4HzK
	2ffgj5vQluhOXBtBbRmiPyg8M1NHnKc2pbCF9xRfTnNcZFzMDfwl6pVR
X-Gm-Gg: AYBFou1hPGm2mq9+e3Hy+SkxaC7on9+P5GLSaUKp0CXFph8yi+emRzvL2ahDXISCWIl
	diZzDhGKZyvRHX1VMDnnobEzdVX4Ex0aKcF1myQwfP1UUZg9Lrgr6rebuDfeOWOcEpVq271Mhyj
	8Ut98gp4/KoiF7a4riXzDMOI8r2IhQxei0lbvsey7bZIFFNnjK0yUZXt//Ks9NMjLeu1pv0Hro1
	shL1dPGQgvBOZX3bXU2RLPvsV7pPO/runQ57WEEXoZIEGaLzQyaqRDek6m8RHVqcNDIxQISOD4z
	Upv9u54FaxPQqCtKB1L6dm4cYYgZC/QENK9WrsN5wfrbe4GBO4dtIoS0TDHIKvelnYBtINUiP/U
	0rJnqJfx3g7EUsAyCYNeyYXCFaAZxRUJJl1JiEV3/jIXi/6h/X5xrOgelA2D8zra4pRgJbSDrWl
	khoX8y7BgLDNbdZmtT8t/PrB6Peqzj8TeId/MZkUCBBJ1M9jV8uuSJ7yzKH72Y0bcq+MqwmaLs4
	sm858xyMeMlnYUilaKsff5zq52PO4PY3SFM5U7m9mp2C9c/ugcAqiVM05lECH/Svndb+0CLDPJ0
	9oectIFQo13DdIGLsACumFconplwKCsaOesq//v0DpOv+P2eWRuzxjCn4+9a+3uehRKvgVyKyUl
	pDPTbxGJGg6IRzgPYf/2Lbe554okc7UZuQopr1FmwuFGu+wZ7K5Ko4LeoFakFZlFl7nCZxtK8NP
	X1OTvQkjMQG78ZahUvu2x6PKvTNtZc5opQFlTbl9lVpEuSasCV1REq
X-Received: by 2002:a05:6830:718b:b0:84c:85e8:f922 with SMTP id 46e09a7af769-863159f47f7mr5177121a34.26.1795205324772;
        Fri, 20 Nov 2026 12:08:44 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316822ad4sm2746249a34.3.2026.11.20.12.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:08:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 13:08:37 -0700
Subject: [PATCH v3 07/11] nvmem: distinguish layout cells from provider
 cells
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
Message-Id: <20261120-submit-nvmem-provider-lifetime-v1-v3-7-523610652402@gmail.com>
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

Layouts and providers currently add cells through the same interface.
Record the owner when a layout adds a cell so removing that layout can
leave independently registered provider cells intact.

Add layout-specific registration helpers and convert all layout drivers.
Keep the shared U-Boot environment parser usable by both its layout
driver and the legacy provider, recording layout ownership only for the
layout caller.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c                 | 61 +++++++++++++++++++++++++++++-------
 drivers/nvmem/internals.h            |  1 +
 drivers/nvmem/layouts/fixed-layout.c |  2 +-
 drivers/nvmem/layouts/onie-tlv.c     | 19 +++++------
 drivers/nvmem/layouts/sl28vpd.c      |  2 +-
 drivers/nvmem/layouts/u-boot-env.c   | 22 +++++++++----
 include/linux/nvmem-provider.h       | 10 +++++-
 7 files changed, 87 insertions(+), 30 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index c74e3f4e1de6..49e80389e198 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -29,6 +29,7 @@
 #define FLAG_COMPAT		BIT(0)
 struct nvmem_cell_entry {
 	struct kref		refcnt;
+	struct nvmem_layout	*layout;
 	const char		*name;
 	int			offset;
 	size_t			raw_len;
@@ -707,16 +708,9 @@ static int nvmem_cell_info_to_nvmem_cell_entry(struct nvmem_device *nvmem,
 	return 0;
 }
 
-/**
- * nvmem_add_one_cell() - Add one cell information to an nvmem device
- *
- * @nvmem: nvmem device to add cells to.
- * @info: nvmem cell info to add to the device
- *
- * Return: 0 or negative error code on failure.
- */
-int nvmem_add_one_cell(struct nvmem_device *nvmem,
-		       const struct nvmem_cell_info *info)
+static int __nvmem_add_one_cell(struct nvmem_device *nvmem,
+				const struct nvmem_cell_info *info,
+				struct nvmem_layout *layout)
 {
 	struct nvmem_cell_entry *cell;
 	int rval;
@@ -735,6 +729,7 @@ int nvmem_add_one_cell(struct nvmem_device *nvmem,
 		return rval;
 	}
 
+	cell->layout = layout;
 	rval = nvmem_cell_entry_add(cell);
 	if (rval) {
 		kfree_const(cell->name);
@@ -742,8 +737,38 @@ int nvmem_add_one_cell(struct nvmem_device *nvmem,
 	}
 	return rval;
 }
+
+/**
+ * nvmem_add_one_cell() - Add one cell information to an nvmem device
+ *
+ * @nvmem: nvmem device to add cells to.
+ * @info: nvmem cell info to add to the device
+ *
+ * Return: 0 or negative error code on failure.
+ */
+int nvmem_add_one_cell(struct nvmem_device *nvmem,
+		       const struct nvmem_cell_info *info)
+{
+	return __nvmem_add_one_cell(nvmem, info, NULL);
+}
 EXPORT_SYMBOL_GPL(nvmem_add_one_cell);
 
+/**
+ * nvmem_layout_add_cell() - Add a cell owned by an NVMEM layout
+ * @layout: Layout registering the cell from its add_cells callback.
+ * @info: Cell description.
+ *
+ * Associate the cell with the layout rather than the provider.
+ *
+ * Return: 0 or a negative error code.
+ */
+int nvmem_layout_add_cell(struct nvmem_layout *layout,
+			  const struct nvmem_cell_info *info)
+{
+	return __nvmem_add_one_cell(layout->nvmem, info, layout);
+}
+EXPORT_SYMBOL_GPL(nvmem_layout_add_cell);
+
 /**
  * nvmem_add_cells() - Add cell information to an nvmem device
  *
@@ -868,7 +893,8 @@ static int nvmem_validate_keepouts(struct nvmem_device *nvmem)
 	return 0;
 }
 
-int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np)
+static int __nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np,
+				     struct nvmem_layout *layout)
 {
 	struct device *dev = &nvmem->dev;
 	const __be32 *addr;
@@ -910,7 +936,7 @@ int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np)
 		if (nvmem->fixup_dt_cell_info)
 			nvmem->fixup_dt_cell_info(nvmem, &info);
 
-		ret = nvmem_add_one_cell(nvmem, &info);
+		ret = __nvmem_add_one_cell(nvmem, &info, layout);
 		kfree(info.name);
 		if (ret) {
 			of_node_put(info.np);
@@ -920,8 +946,19 @@ int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np)
 
 	return 0;
 }
+
+int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np)
+{
+	return __nvmem_add_cells_from_dt(nvmem, np, NULL);
+}
 EXPORT_SYMBOL_GPL(nvmem_add_cells_from_dt);
 
+int nvmem_layout_add_cells_from_dt(struct nvmem_layout *layout, struct device_node *np)
+{
+	return __nvmem_add_cells_from_dt(layout->nvmem, np, layout);
+}
+EXPORT_SYMBOL_GPL(nvmem_layout_add_cells_from_dt);
+
 static int nvmem_add_cells_from_legacy_of(struct nvmem_device *nvmem)
 {
 	return nvmem_add_cells_from_dt(nvmem, nvmem->dev.of_node);
diff --git a/drivers/nvmem/internals.h b/drivers/nvmem/internals.h
index 79ea56822ebe..667955893b5c 100644
--- a/drivers/nvmem/internals.h
+++ b/drivers/nvmem/internals.h
@@ -44,6 +44,7 @@ struct nvmem_device {
 };
 
 int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np);
+int nvmem_layout_add_cells_from_dt(struct nvmem_layout *layout, struct device_node *np);
 
 #if IS_ENABLED(CONFIG_OF)
 int nvmem_layout_bus_register(void);
diff --git a/drivers/nvmem/layouts/fixed-layout.c b/drivers/nvmem/layouts/fixed-layout.c
index 635d448b3dd2..b97f39897a75 100644
--- a/drivers/nvmem/layouts/fixed-layout.c
+++ b/drivers/nvmem/layouts/fixed-layout.c
@@ -19,7 +19,7 @@ static int fixed_layout_add_cells(struct nvmem_layout *layout)
 	if (!np)
 		return -ENOENT;
 
-	ret = nvmem_add_cells_from_dt(layout->nvmem, np);
+	ret = nvmem_layout_add_cells_from_dt(layout, np);
 	of_node_put(np);
 
 	return ret;
diff --git a/drivers/nvmem/layouts/onie-tlv.c b/drivers/nvmem/layouts/onie-tlv.c
index 4da3a704388e..99e7a5406b4c 100644
--- a/drivers/nvmem/layouts/onie-tlv.c
+++ b/drivers/nvmem/layouts/onie-tlv.c
@@ -95,18 +95,19 @@ static nvmem_cell_post_process_t onie_tlv_read_cb(u8 type, u8 *buf)
 	return NULL;
 }
 
-static int onie_tlv_add_cells(struct device *dev, struct nvmem_device *nvmem,
+static int onie_tlv_add_cells(struct nvmem_layout *layout,
 			      size_t data_len, u8 *data)
 {
+	struct device *dev = &layout->dev;
 	struct nvmem_cell_info cell = {};
-	struct device_node *layout;
+	struct device_node *layout_np;
 	struct onie_tlv tlv;
 	unsigned int hdr_len = sizeof(struct onie_tlv_hdr);
 	unsigned int offset = 0;
 	int ret;
 
-	layout = of_nvmem_layout_get_container(nvmem);
-	if (!layout)
+	layout_np = of_nvmem_layout_get_container(layout->nvmem);
+	if (!layout_np)
 		return -ENOENT;
 
 	while (offset < data_len) {
@@ -123,13 +124,13 @@ static int onie_tlv_add_cells(struct device *dev, struct nvmem_device *nvmem,
 
 		cell.offset = hdr_len + offset + sizeof(tlv.type) + sizeof(tlv.len);
 		cell.bytes = tlv.len;
-		cell.np = of_get_child_by_name(layout, cell.name);
+		cell.np = of_get_child_by_name(layout_np, cell.name);
 		cell.read_post_process = onie_tlv_read_cb(tlv.type, data + offset + sizeof(tlv));
 
-		ret = nvmem_add_one_cell(nvmem, &cell);
+		ret = nvmem_layout_add_cell(layout, &cell);
 		if (ret) {
 			of_node_put(cell.np);
-			of_node_put(layout);
+			of_node_put(layout_np);
 			return ret;
 		}
 
@@ -137,7 +138,7 @@ static int onie_tlv_add_cells(struct device *dev, struct nvmem_device *nvmem,
 		offset += sizeof(tlv) + tlv.len;
 	}
 
-	of_node_put(layout);
+	of_node_put(layout_np);
 
 	return 0;
 }
@@ -222,7 +223,7 @@ static int onie_tlv_parse_table(struct nvmem_layout *layout)
 		return -EINVAL;
 
 	data = table + hdr_len;
-	ret = onie_tlv_add_cells(dev, nvmem, data_len, data);
+	ret = onie_tlv_add_cells(layout, data_len, data);
 	if (ret)
 		return ret;
 
diff --git a/drivers/nvmem/layouts/sl28vpd.c b/drivers/nvmem/layouts/sl28vpd.c
index 79de1e6947d0..1e65a0b6c61f 100644
--- a/drivers/nvmem/layouts/sl28vpd.c
+++ b/drivers/nvmem/layouts/sl28vpd.c
@@ -124,7 +124,7 @@ static int sl28vpd_add_cells(struct nvmem_layout *layout)
 		info.read_post_process = pinfo->read_post_process;
 		info.np = of_get_child_by_name(layout_np, pinfo->name);
 
-		ret = nvmem_add_one_cell(nvmem, &info);
+		ret = nvmem_layout_add_cell(layout, &info);
 		if (ret) {
 			of_node_put(info.np);
 			of_node_put(layout_np);
diff --git a/drivers/nvmem/layouts/u-boot-env.c b/drivers/nvmem/layouts/u-boot-env.c
index 33ec2350386f..f1fb206846ff 100644
--- a/drivers/nvmem/layouts/u-boot-env.c
+++ b/drivers/nvmem/layouts/u-boot-env.c
@@ -49,7 +49,8 @@ static int u_boot_env_read_post_process_ethaddr(void *context, const char *id, i
 	return 0;
 }
 
-static int u_boot_env_parse_cells(struct device *dev, struct nvmem_device *nvmem, uint8_t *buf,
+static int u_boot_env_parse_cells(struct device *dev, struct nvmem_device *nvmem,
+				  struct nvmem_layout *layout, uint8_t *buf,
 				  size_t data_offset, size_t data_len)
 {
 	char *data = buf + data_offset;
@@ -78,14 +79,17 @@ static int u_boot_env_parse_cells(struct device *dev, struct nvmem_device *nvmem
 			info.read_post_process = u_boot_env_read_post_process_ethaddr;
 		}
 
-		nvmem_add_one_cell(nvmem, &info);
+		if (layout)
+			nvmem_layout_add_cell(layout, &info);
+		else
+			nvmem_add_one_cell(nvmem, &info);
 	}
 
 	return 0;
 }
 
-int u_boot_env_parse(struct device *dev, struct nvmem_device *nvmem,
-		     enum u_boot_env_format format)
+static int __u_boot_env_parse(struct device *dev, struct nvmem_device *nvmem,
+			      struct nvmem_layout *layout, enum u_boot_env_format format)
 {
 	size_t crc32_data_offset;
 	size_t crc32_data_len;
@@ -156,13 +160,19 @@ int u_boot_env_parse(struct device *dev, struct nvmem_device *nvmem,
 	}
 
 	buf[dev_size - 1] = '\0';
-	err = u_boot_env_parse_cells(dev, nvmem, buf, data_offset, data_len);
+	err = u_boot_env_parse_cells(dev, nvmem, layout, buf, data_offset, data_len);
 
 err_kfree:
 	kfree(buf);
 err_out:
 	return err;
 }
+
+int u_boot_env_parse(struct device *dev, struct nvmem_device *nvmem,
+		     enum u_boot_env_format format)
+{
+	return __u_boot_env_parse(dev, nvmem, NULL, format);
+}
 EXPORT_SYMBOL_GPL(u_boot_env_parse);
 
 static int u_boot_env_add_cells(struct nvmem_layout *layout)
@@ -172,7 +182,7 @@ static int u_boot_env_add_cells(struct nvmem_layout *layout)
 
 	format = (uintptr_t)device_get_match_data(dev);
 
-	return u_boot_env_parse(dev, layout->nvmem, format);
+	return __u_boot_env_parse(dev, layout->nvmem, layout, format);
 }
 
 static int u_boot_env_probe(struct nvmem_layout *layout)
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index 6063fe5b7784..e0638bd50d1f 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -144,7 +144,7 @@ struct nvmem_config {
  * @nvmem:		The underlying NVMEM device
  * @add_cells:		Will be called if a nvmem device is found which
  *			has this layout. The function will add layout
- *			specific cells with nvmem_add_one_cell().
+ *			specific cells with nvmem_layout_add_cell().
  *
  * A nvmem device can hold a well defined structure which can just be
  * evaluated during runtime. For example a TLV list, or a list of "name=val"
@@ -173,6 +173,8 @@ struct nvmem_device *devm_nvmem_register(struct device *dev,
 
 int nvmem_add_one_cell(struct nvmem_device *nvmem,
 		       const struct nvmem_cell_info *info);
+int nvmem_layout_add_cell(struct nvmem_layout *layout,
+			  const struct nvmem_cell_info *info);
 
 int nvmem_layout_register(struct nvmem_layout *layout);
 void nvmem_layout_unregister(struct nvmem_layout *layout);
@@ -214,6 +216,12 @@ static inline int nvmem_layout_register(struct nvmem_layout *layout)
 
 static inline void nvmem_layout_unregister(struct nvmem_layout *layout) {}
 
+static inline int nvmem_layout_add_cell(struct nvmem_layout *layout,
+				       const struct nvmem_cell_info *info)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline int nvmem_add_cells_from_dt(struct nvmem_device *nvmem,
 					  struct device_node *np)
 {

-- 
2.53.0

