Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106557;
	b=uN5VqtMg7GDmNDXr4f8d+TuHWdhAsMHs7+GJI6Ux9bWiZzmOibT/IZtQ+aO5hq3Wr7Ga
	 GRZyqRpmbNWUsKp1DxBhgi3kVpEfJrCL2VZzm1OUD4FagJnFcYaaxPOT1PhS8GcMMsQgU
	 h37AEfhLGkutEHlWTAlUJM1DJ0Qc4swcPbQHLEl3rRU/JwE/OfM+Bd/6J4NWYdIMd8xFV
	 3aDU0p70r+Wq+TBS/ZmV7LmeSwSXfX/Vx1uqYmgbO00ry+LitklfRvvnvqi/UioA5jJ8A
	 DiK2vKoZzVCecLl+/7MDb17STaJq8wUnbSuizNrDorFyuxy3PvO8UG8wOH8wrN5VFow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106557;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=oct6fbqQrky6pqRbjZN6yqPuHBh9eEiJJWEjiymO1tQ=;
	b=h1lnLgcTp0e+YeeuJnCI6/zwGng/S4sjvMTQM1GlsljwdtM0MmPU2+XqfMkDh1uKhN1w
	 ssbhkESMyal1F8QiUHRV7hWoiaiZ0O5oWmjWHLpSppQK1JKEHkSyPLBO+LtuuS97BjPVO
	 hQxGLXXtSnkmFjmrWiHocnQ+YSivqKUltoCS5GZzn+4l7KEUFaZsiVLFDp1iV97UP1KAw
	 81EP6QyL9g9Sbr2DU6KemS3d0TGWaaPPP1l3QUwrxsU3GAoXPw1VlogfCzFA6KRq5bg0h
	 w3B15cc+t+xuFOGXjPVoFyy5TTPDcL5n1zKCYYDSfjr4hfUy+U8qKfVbWY0SAMc6W0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QRygU5J6;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095DF606A33F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 095DF606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QRygU5J6
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-8629ef48703so1433710a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795106556; x=1795711356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oct6fbqQrky6pqRbjZN6yqPuHBh9eEiJJWEjiymO1tQ=;
        b=QRygU5J69n2x2RxxKS2RnkJVjBp9cCA87X51cI+Py25x2rsy17WwFs7fAmP8z07pwO
         YHEu5NrkgqxmN4z1pcqIR6BCevlc5TQWKBJAh7e8supZNQ+6Et8tXX9L2hOI7MEyXjcw
         nJ+zX2DaBx7iSlCaMjwDFm3N0Tgf1vLRqRYVImNamKXX/JtHc8Ewe+wgi5+tMyYveP3f
         lVBEAEVyNpSc4QWZV5CnuRyyaxW/5RjPVCcdgavPaVWunWamFtwwFXLGQLjOQPqDnh39
         tmPynizwN+9Tc2+S3Qe+LB8N9YLo+rl3O5brLjNDWNWA/uXr5gdBHhnBiTVc5ARiivt5
         KPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106556; x=1795711356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oct6fbqQrky6pqRbjZN6yqPuHBh9eEiJJWEjiymO1tQ=;
        b=K2M2MEUjQWxiZa0Xl4RsRmN36FTvJCkWi//j6tEo6fvWSw6XE/dFjMOEKV2189hulX
         jyN7guXZ10ka7isG6eG566iW0JJMpdkQV6A7Vvxq+x8m53KCru/Y8Q56LuSwsyi+n2ti
         TKnlztvMSpYFZ2oJ8nfknJuAsV4WKUtQkw8RGEuM/8B/ApXEImwgM62H+o/HP9sMP6D+
         nEbdqLmr13ugqrypjoYP03wyxjlp+swtggg2L7g82zCQiyyWDGPlSgPielOtkhxlD3mw
         MGc7m0V2S3NpgkLvUxaFQ3JSpAfQs4P+CkfjWyjz55R1Vc8Io4QQc4I9fxT10JsAqLGn
         K6eA==
X-Forwarded-Encrypted: i=1; AL+hErHKX8rpszUp61ECH+52XLNKvLxVFmNKk16eaB10kQYwExsmUzqkGEzAC3ewyQLeL08bXVDr5OIewhRhyq8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jLFOJsK0xLakKMjrXeFdv8B+DRtMzLo+1UZpFnOcXYrEl31eV
	zq7+KCkZMNJw4VoSI/ag5Rl5XwzyamxnI91ypCUJ9pDZFvbqdL9alSNV
X-Gm-Gg: AYBFou3o5/7BN7g5qsIUrKa9rJfFiIK5TkM/honx2Yu0IEtsyPU7aAf7X3/VMMtTQnj
	fDLwg/xXJQV4Upfbjn5jDjEC4zqae8m52QjaVWzF5eyjHhreIk0CX//h+mWw7KOh0K3X1KGzcPf
	x7iGucg32iIgBZk5GfR4anKhf4htsBL4CWGTCCLXiznjy0QXPo81fDBpdv1rpg1iBw6rjKJhCGq
	g4TImVmJ+fxZoxt4b4Cc5SiwLWYDSygVcpWMZTvgHLd3T/fap3u0JtTjeVUtz4bLfBD28ADrsR2
	qSeF6VSe0iA7+as2Oq1IoFy3DL1e4CYJffsbDk2v2Of9bZZ7dpZF6JgCvhRX1SFyYK4vefXSsJd
	ToZklT7KpGT/KQkwBrxDcy6X7SkQq5wt3y0hbMuwIstR0Wnkrde1U1/raUVw0HtFzuOIK47cfxU
	wW60vOBuz0mzlex7DqRKGW67DFHzIQCu8L6bEUgCiDTMgdbf64Z4bd4DaP5sbDkVwBXRJL+xQH9
	q9Hf7gFKy/8tGzJ7kEI+TSxPAAxf4LQsUd4iNJRSzTfi9xzx4XBS1wYh7SDpKGtIM6VOWLgn+K3
	ZCBSUfzZ+wVUXXY5vg/vR2NsPfaV2KlwT2G1KM+FkRX6oIAh2SkGr4xBZPoM9Cq8I44ldlXoKOm
	qubLFDNwTmLJOW/9Vcz3meksKDLcu9OVLSFZmIBKZt4p4cvXNRNmp/bJIn/T8HF7ASRdBzJTI3z
	q0lnlQbO0Vo5SZRm93/c44VAOSaFm1TY+glhj8S6yQ9K4gCScuibk=
X-Received: by 2002:a05:6820:c0c2:20b0:715:2400:9579 with SMTP id 006d021491bc7-71b395e67c2mr77143eaf.56.1795106555758;
        Thu, 19 Nov 2026 08:42:35 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e4a6dsm341975eaf.13.2026.11.19.08.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:42:35 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:42:05 -0700
Subject: [PATCH v2 07/11] nvmem: distinguish layout cells from provider
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
Message-Id: <20261119-submit-nvmem-provider-lifetime-v1-v2-7-8fca3ec5f18c@gmail.com>
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

