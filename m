Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944323;
	b=uybJEYk/FzHqYTiu7+jbz+yIlrHrFLid5wP02akqTk4lRT9WrVSv0HX+L3h/NsjcgrGq
	 2wslwBnBhK29mWBih43SLgbgulwkAYZ7wsH4BNww8U9YoxFw1bMwMpsf+gklWKCO7iK93
	 k5AaJsdeYvbAURJ2kctUTe+g3WDCBj9g3QofGznvVk7NEFtaMHznpb9iZ1Y1jvictfx7d
	 3mIChjhaWlorvaOH9TNzCJH3YvwvutDLdB3qIjmVY1wjRjTZ5kJyt8VNUqWViHDp/ZO6j
	 xqIdw+zeOQ0/ck/PjhLCmkkVGlk2kuOCQgE1TPTKcp9kraLYEqB38OVf2Z6mDnVRhJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=6rFErE0i5Y2PWDxw+9q3X+0ibTPYPSnkikClXBrp3y4=;
	b=T1ym7QoKQNQhvowoVThoyFO1rX8oWCydUguK2Bp6yj3LAt0VjJ8GewRzWgzqvcETCG83
	 omaKF36xMqQl6sdtts5QjLeaippZWu8Gozb96jq1piF8/OdOCk49fMk6lzMnK3unO8aDU
	 rZFKk4tsESiILWKByEgbOtmk9MdQzUXKBay+GmV2cpXRpQioj+FCpIAeXZt/yNWblLyU5
	 5SW34qF2p2x1w09xSvb74bCNyLVD/ILd95ireO3p/TXi+orgenfqQ3wjh1vDhKemt2sug
	 nNB4F3srmJGMhyJO3S6YU2989STSBNr3kwMFW6kup/pGYMScjeMq07dcvIvTRyhYEgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PvKhVR4O;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0833B606A8BB
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0833B606A8BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PvKhVR4O
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6df5e315bd1so150459eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794944322; x=1795549122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6rFErE0i5Y2PWDxw+9q3X+0ibTPYPSnkikClXBrp3y4=;
        b=PvKhVR4OuaKxpIYkmDg65yyu2dRBPLlQA9w9fmzyi0fbMPvNxXASl7Pyhs76q+Pc0d
         Mz1ZHJgrMz9oduGPTKK7iwxyG8/uETdwNzEMMuDfT28+zvTsPETEl6D0t9fI2J2j9QKB
         MT1vPtzRHGOaW+0Qam34HeNpUvkDLVwG+Agu49t9lH7HZUwEKWRt1IaTFGP6+OXY4nkN
         A+GK1s7yWzLropAf7buPBzWkLBHX1ERsqg/HzsX6Mk0mx7L+6cxRsODWDYapANRZ30Mz
         Hv5GmgHBY2pqh/IMtnewHUdpWvbO2M/nX6da7VTgdPNOGb1CIRnykYGtjMPUofH0sszX
         YpfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944322; x=1795549122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6rFErE0i5Y2PWDxw+9q3X+0ibTPYPSnkikClXBrp3y4=;
        b=vL70NiB63bXGdv2eQ5zJCBYVbEAJJFjnMxV64zbu/w2rtrxhdUMIdME2G7+IMv3rRK
         29ENMjxUp7D4gZB4wxVATsZIYW/zHE0V5WMoWqTRlBO4b+L9/SfM9Zu7WWJM929tkrPc
         jIkKLkdyOg4hkvvydcCCmztBTWL6gCx6O2LS4WfFhBooX430MxfRW1xS107dK5I6gPko
         HsXeeGMtS+YE84lkPZpPJ5QCA1FnaC2AxEHdz33v4KrUkL3CFIsC+vXz+aD1hjN1JnT9
         6pz0Ov9hkGVBLYcAOB4NnyQv7SqxLpC8y3iCmcmBvTM0LcWC20p8UxEHkza6THlXBevW
         15dQ==
X-Forwarded-Encrypted: i=1; AL+hErHFj1QrNfgNC5KU9T/1ZcHIAb+kADu2EBq76h4dksesh97tTW37L73gQtJNaCOWQLvnVPxOtHgvVVHRd68=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tpEgQVjYzcq97EAj7QBhfz9MSmR/ZyhPJcYD3uZ4MGdi8ukKf
	ePMfgzDrL5lmboHwh88rYnNBuYjgSR/B7z+dMP5a6rM2Ibb+JwZO5UGu
X-Gm-Gg: AYBFou3NIA6uckQ/hKZscVHTMZbVXqMGKYPBxUOusZf1lfp0z6sgA/UdjlN4xIAWbTK
	mCT0bb6xs8GC3UxHSZv+1N07jhPjOCwbxg63SIg2nx3Bb8wguHDb2av9MfVDw0fCESkD+s3Oeju
	FnBqo4tnz8P+RSaPiFA5CpCMRvD+bBsCJs4/t2MB3mbKZ25qkQTy7jiZWM/Sjqwvj5EWrdoEICI
	CFzAyEC2mNl+Q/+ycJ4njIAGMqEg7JST8sxtEYebk7eghekMJ8nucJ6p81CJv8h//zlpSnHCeHJ
	BehMUwxIhGrBDFsK3yGpYP7N6rXOCj8iNaUjG/h6HfsmcwRcjEzF1zvmoo3+8R6MzJbDnHqWtWT
	sdqz2yhfmt9IIP6mXn8/9+L+LGaHkCF5U5xonMTETDxTtrnD6K0Srp1U5mvP7dciyZHnGSh2NCE
	zvBoRKnm0r+RwOkgzG9DqUWax5l+8dLrKcDSVpwZH53qeOEMrmRm0cDYgZpES3MiqDJFZwASWyA
	41j6WKHqvNLEwAg7ezFU76gNX3nVeZdF2rdj/jhgZ4GKEWUqGzasKJR1f1rgUTIJDOwZ1ZBNq+v
	1itV6h8CnJUpo3nzXImfoJGoUt4W1HfWwpkOES/sJqBrzLw1APXbf/0DF8j3T2KEgxN+nyLp1Xs
	nssbVL0JWCu5/sImgjqtlk0+YzC/KZRv6cPcJmkMWLfPcrO6MigsqdPqlyI+SJYcWT7lVTIpF60
	xxmvsoZFajmLgKp8zovUXnSAm5iLf+CfwqxyFqB9KRWNlN2D82R1w=
X-Received: by 2002:a05:6820:410d:b0:70b:a287:72b5 with SMTP id 006d021491bc7-71b18476f73mr234539eaf.20.1794944321863;
        Tue, 17 Nov 2026 11:38:41 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b192272ffsm146281eaf.2.2026.11.17.11.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:38:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 12:38:14 -0700
Subject: [PATCH 07/11] nvmem: distinguish layout cells from provider cells
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
Message-Id: <20261117-submit-nvmem-provider-lifetime-v1-v1-7-3cfbd48812b5@gmail.com>
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
index 14cc70e8ce78..57c1da5ab547 100644
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
@@ -726,16 +727,9 @@ static int nvmem_cell_info_to_nvmem_cell_entry(struct nvmem_device *nvmem,
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
@@ -755,12 +749,43 @@ int nvmem_add_one_cell(struct nvmem_device *nvmem,
 	}
 
 	kref_init(&cell->refcnt);
+	cell->layout = layout;
 	nvmem_cell_entry_add(cell);
 
 	return 0;
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
@@ -882,7 +907,8 @@ static int nvmem_validate_keepouts(struct nvmem_device *nvmem)
 	return 0;
 }
 
-int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np)
+static int __nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np,
+				     struct nvmem_layout *layout)
 {
 	struct device *dev = &nvmem->dev;
 	const __be32 *addr;
@@ -924,7 +950,7 @@ int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np)
 		if (nvmem->fixup_dt_cell_info)
 			nvmem->fixup_dt_cell_info(nvmem, &info);
 
-		ret = nvmem_add_one_cell(nvmem, &info);
+		ret = __nvmem_add_one_cell(nvmem, &info, layout);
 		kfree(info.name);
 		if (ret) {
 			of_node_put(info.np);
@@ -934,8 +960,19 @@ int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np)
 
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

