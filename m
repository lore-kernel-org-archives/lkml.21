Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108551;
	b=MilLboq24WbUym7kFaKhOTer0xAMeuTPezazwh/KLgKOXR4vJElj7CMQQLv5djt7x3rW
	 6FM7AT+PS29ioNN/sR11msXpAaUjbnjhqtVih68owc23NrRDEWIs1lKRqj41xFCF1SqKV
	 S3osg2nnWtTLTtMDwE5783EBwrqtuR8zdX5AEtLLu9sAM0PYtWRr4Z+sEJA1QCiH6xEs+
	 XgFzPaep9h2e5u9iFCUVZsdF3xdN3Nn1+ei9fh457lgpYUBagj5A/E/IpJv0bkV/VD1/Q
	 68oWegZQ9jKZFOYZD9uVmAB/5QzImwGHzSRSTYt2iu4JS/48m86Td//ZLZFLBH7tIAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lTBFXfA4/IjpYPeV/USh7z3mUhareSyfqpp2hDcaHsY=;
	b=5WmZ+cPW/mA73YQdzX6xzDRsNP8d+52b3U5znRIbV+b+vIC0ubr09S0bZgKUnhx6F/jF
	 UBp9kI80wO13sNv2VyvG2gs/SsIFureo0V2nvfnWpAyfkhjmTJnCYygfJsYmoCys27Ut3
	 i5YdiBrBy9noPvBglEE4beuvivw7NjkBpDO2XZC3lqs36cCiGZbTroZLyqpxh8UQgWsqo
	 Hs/7qg/NMCgHtVfmiJmmu6krdzEBr8Lluj86kZnPaTEwVmdtITPBdb0F0XlCi81KAWpIH
	 rDytIGqfHqDzMCvQsm9AjueVqJJC8N4RVGo5IQH2R19n7Jqqja0V/GNhcvEH59qk0jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="JjAe/V4a";
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E230606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E230606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JjAe/V4a
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e9ae391a05so8694915ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795108551; x=1795713351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lTBFXfA4/IjpYPeV/USh7z3mUhareSyfqpp2hDcaHsY=;
        b=JjAe/V4afYZG6YG/6auHVc/XaCUGoznUPsaAt101z5rOyqvAKe0uafsmwd1Xh7eyNL
         mX+E5+xpG+EsTIxGfLPNG0hZTfF20kEY2mPxf4vMz+bv6ynUctPkQpORAPmJibxWRQe0
         YoUd4YAV6qemcnvpSR4E2VZFp5CnNbQtS1xsDeBlMsT4r1cvCZq8t134KSaVMHqtytqJ
         YXI5X2+e9HWnGL5ghGcm7s9Sj+4Tp3+yg6Rezg+QDvSpD7P+53rE8NMQxcAjm0hhbdmb
         I8sZHpzx9+P1v7fjNCIs8r+CRNVWpRlAtmoDxry6buWSvbEQKmRAOaPdJbujqpSm551z
         0S8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108551; x=1795713351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lTBFXfA4/IjpYPeV/USh7z3mUhareSyfqpp2hDcaHsY=;
        b=LSdvCAKz+ec0Wsr/5KnF2Ob685R+LivNqgOAIV18vLfw5A5Ajl2J4YyYI4qB8Nmvzp
         mQHm9421TRxM9fxAXqt9UVtgRL7sFh2Yi1eacGjmiOD2SmQm5a3D3ba/UkEjsvp5nojD
         8fkwWFu779QKCjKcTflUR5GgZ5r7uQcl7o9GQA7OrvYM2cWVLJ6kuKH0bSRDOCLZcGsF
         +AeOPJAta4IdwvinAfpqJoUVh3ADFyVwnqoYplrzitmYK1/Wx3U3htbIU5heiymolqQ8
         BxvnDZ1eDiLBUxN9cpthrywr6tGp9TPMr6GJJzEaiVkfHSp02ASGOpiHE6xxtdJqx1Ax
         5U2A==
X-Forwarded-Encrypted: i=1; AL+hErHWFXBUOh0Si0ckQmoanbKCTiHtgg5UIg7eToVY7Xdjvh5TKFYjlu5oQbL2zIBOkaI06Kg+LUNinfejYUg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JFFgm57UOSMp4pQVoy1HFxE+APV9EOBdNkJEc1CoBo+pd4lHt
	xFoWj00gf85/vaXY8BRD/EmUITHiif8CC2GCTV3Y5psPzgfWf76cA0S3
X-Gm-Gg: AZFdTZebOGiOSEEDWlhd0qtifPt4UGxkVPIk0KhiEhTjN/kbu5T03QoBeKxslURsxJq
	mIMdeynf37UINc2bDlwErye2xsi4c1RnVm84bBUvLhrwau8i/1vI3cQUqCjTAj9eBfZAQyGHhjw
	//mPhczMbeUSOayhuCpYHzyqv8LVbhTK0kgGedt5fE2POp1ClNXSPJIXOMn3alH53OTlIdy9Uj5
	KyAfVWWHNfmGbz3WjTGD4X5XEVnfF25g6Gr+cotd6SlUm9RbJMCm2mEoTR8I4CrC6/08U7J5CK5
	XIddqWIE8wmZGpnxY94kIvXQrvn7TNhfQE+Epq6kPUIbx4hkc5VIDrEIAKk/bfiuWiGOvf4ga07
	+TkHWGMAFYSftRrloLbehMMEi/v0uMqeNIc1QAwYVHRi9NlayNwOTd/eQwGz8qH031fzxAKmz9A
	QPWjZfh3o3Qe6XDFkRIsoq/yWnxzGDH6BxqwsEKyIV2r6b4bYXN84sNg+KlGPc/q4MyHMkxDP58
	+s6mABnzOklXyCuixn4ePm1PSiKhDKQkrKK/94ykGkq0dAjDqhS4QFI2PG6EQI9uPIYz9fNBLoP
	LZPC6GbDc9Rs9NJs/d8kivo6T/8Xy5/Qryry4CxyHjjyiXXFGSQf
X-Received: by 2002:a17:902:ea01:b0:2e9:5178:4e83 with SMTP id d9443c01a7336-2f03f2413e4mr3783595ad.38.1795108550763;
        Thu, 19 Nov 2026 09:15:50 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6213:28::4:379])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee848c1sm3185305ad.10.2026.11.19.09.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:15:50 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v6] net: dsa: motorcomm: Add devlink info and resources
Date: Fri, 20 Nov 2026 01:15:06 +0800
Message-ID: <20261119171528.681819-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose the ASIC model via devlink info (ASIC_ID), and register devlink
resources for ACLs and meters. Document the devlink support.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
v6:
 - add devlink document
v5: https://lore.kernel.org/r/20261116121627.1182631-1-mmyangfl@gmail.com
 - minor stylistic fixes
v4: https://lore.kernel.org/r/20261112002031.1475005-1-mmyangfl@gmail.com
 - remove FDB-related changes
v3: https://lore.kernel.org/r/20261109163117.1792478-1-mmyangfl@gmail.com
 - remove the buggy sub-resources
v2: https://lore.kernel.org/r/20261108094512.1285796-1-mmyangfl@gmail.com
 - fix issues reported by sashiko
 Documentation/networking/devlink/index.rst  |   1 +
 Documentation/networking/devlink/yt921x.rst |  37 +++++++
 MAINTAINERS                                 |   1 +
 drivers/net/dsa/motorcomm/Makefile          |   1 +
 drivers/net/dsa/motorcomm/chip.c            |   8 ++
 drivers/net/dsa/motorcomm/devlink.c         | 107 ++++++++++++++++++++
 drivers/net/dsa/motorcomm/devlink.h         |  18 ++++
 7 files changed, 173 insertions(+)
 create mode 100644 Documentation/networking/devlink/yt921x.rst
 create mode 100644 drivers/net/dsa/motorcomm/devlink.c
 create mode 100644 drivers/net/dsa/motorcomm/devlink.h

diff --git a/Documentation/networking/devlink/index.rst b/Documentation/networking/devlink/index.rst
index 03f49389a755..be0d59cbaa3c 100644
--- a/Documentation/networking/devlink/index.rst
+++ b/Documentation/networking/devlink/index.rst
@@ -104,4 +104,5 @@ parameters, info versions, and other features it supports.
    sfc
    stmmac
    ti-cpsw-switch
+   yt921x
    zl3073x
diff --git a/Documentation/networking/devlink/yt921x.rst b/Documentation/networking/devlink/yt921x.rst
new file mode 100644
index 000000000000..7ccb75a30029
--- /dev/null
+++ b/Documentation/networking/devlink/yt921x.rst
@@ -0,0 +1,37 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=======================
+yt921x devlink support
+=======================
+
+This document describes the devlink features implemented by the ``yt921x``
+device driver.
+
+Info versions
+=============
+
+The ``yt921x`` driver reports the following devlink info versions.
+
+.. list-table:: devlink info versions implemented
+
+   * - Name
+     - Description
+   * - ``asic.id``
+     - ASIC model name as reported by the driver.
+
+Resources
+=========
+
+The ``yt921x`` driver exposes the following devlink resources to monitor
+hardware occupancy.
+
+.. list-table:: Driver-specific resources implemented
+   :widths: 5 95
+
+   * - Name
+     - Description
+   * - ``ACL``
+     - TCAM entries available for ACL rules, 384 entries in total, organized
+       as 48 blocks of 8 entries.
+   * - ``meters``
+     - Meters available for ACL rules to police matching flows, 64 in total.
diff --git a/MAINTAINERS b/MAINTAINERS
index 40bb77cbc6b0..8ef92c9ff65f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18974,6 +18974,7 @@ M:	David Yang <mmyangfl@gmail.com>
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/dsa/motorcomm,yt921x.yaml
+F:	Documentation/networking/devlink/yt921x.rst
 F:	drivers/net/dsa/motorcomm/
 F:	net/dsa/tag_yt921x.c
 
diff --git a/drivers/net/dsa/motorcomm/Makefile b/drivers/net/dsa/motorcomm/Makefile
index 9eaa59f699e8..0b31d815ce43 100644
--- a/drivers/net/dsa/motorcomm/Makefile
+++ b/drivers/net/dsa/motorcomm/Makefile
@@ -2,6 +2,7 @@
 obj-$(CONFIG_NET_DSA_YT921X) += yt921x.o
 yt921x-objs := chip.o
 yt921x-$(CONFIG_NET_DSA_YT921X_LEDS) += leds.o
+yt921x-objs += devlink.o
 yt921x-objs += mdio_bus.o
 yt921x-objs += mib.o
 yt921x-objs += pcs-921x.o
diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 35e70b322608..dca5bc593848 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -26,6 +26,7 @@
 #include <net/ieee8021q.h>
 
 #include "chip.h"
+#include "devlink.h"
 #include "leds.h"
 #include "mdio_bus.h"
 #include "mib.h"
@@ -2149,6 +2150,8 @@ static void yt921x_dsa_teardown(struct dsa_switch *ds)
 
 	yt921x_leds_remove(priv);
 #endif
+
+	dsa_devlink_resources_unregister(ds);
 }
 
 static int yt921x_chip_detect(struct yt921x_priv *priv)
@@ -2483,6 +2486,10 @@ static int yt921x_dsa_setup(struct dsa_switch *ds)
 	if (res)
 		return res;
 
+	res = yt921x_devlink_setup(priv);
+	if (res)
+		return res;
+
 #if IS_ENABLED(CONFIG_NET_DSA_YT921X_LEDS)
 	res = yt921x_leds_setup(priv);
 	if (res)
@@ -2571,6 +2578,7 @@ static const struct dsa_switch_ops yt921x_dsa_switch_ops = {
 	.port_add_dscp_prio	= yt921x_dsa_port_add_dscp_prio,
 #endif
 	/* chip */
+	.devlink_info_get	= yt921x_dsa_devlink_info_get,
 	.teardown		= yt921x_dsa_teardown,
 	.setup			= yt921x_dsa_setup,
 };
diff --git a/drivers/net/dsa/motorcomm/devlink.c b/drivers/net/dsa/motorcomm/devlink.c
new file mode 100644
index 000000000000..a896aa99fb3e
--- /dev/null
+++ b/drivers/net/dsa/motorcomm/devlink.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2026 David Yang
+ */
+
+#include "chip.h"
+#include "devlink.h"
+#include "tc.h"
+
+int
+yt921x_dsa_devlink_info_get(struct dsa_switch *ds, struct devlink_info_req *req,
+			    struct netlink_ext_ack *extack)
+{
+	struct yt921x_priv *priv = dsa_to_yt921x_priv(ds);
+	int res;
+
+	res = devlink_info_version_fixed_put(req,
+					     DEVLINK_INFO_VERSION_GENERIC_ASIC_ID,
+					     priv->info->name);
+	if (res)
+		return res;
+
+	return 0;
+}
+
+static u64 yt921x_devlink_occ_get_acl(void *ctx)
+{
+	struct yt921x_priv *priv = ctx;
+	unsigned int count = 0;
+
+	mutex_lock(&priv->reg_lock);
+	for (unsigned int i = 0; i < YT921X_ACL_BLK_NUM; i++)
+		count += hweight8(priv->acl_masks[i]);
+	mutex_unlock(&priv->reg_lock);
+
+	return count;
+}
+
+static u64 yt921x_devlink_occ_get_meter(void *ctx)
+{
+	struct yt921x_priv *priv = ctx;
+	u64 count;
+
+	mutex_lock(&priv->reg_lock);
+	count = bitmap_weight(priv->meters_map, YT921X_METER_NUM);
+	mutex_unlock(&priv->reg_lock);
+
+	return count;
+}
+
+enum yt921x_devlink_resource_id {
+	YT921X_DEVLINK_RESOURCE_ID_NONE,  /* DEVLINK_RESOURCE_ID_PARENT_TOP */
+	YT921X_DEVLINK_RESOURCE_ID_ACL,
+	YT921X_DEVLINK_RESOURCE_ID_METER,
+};
+
+struct yt921x_devlink_resource {
+	const char *name;
+	devlink_resource_occ_get_t *occ_get;
+	unsigned short size;
+	unsigned char id;
+	unsigned char parent_id;
+};
+
+static const struct yt921x_devlink_resource yt921x_devlink_resources[] = {
+	{
+		"ACL", yt921x_devlink_occ_get_acl,
+		YT921X_ACL_NUM,
+		YT921X_DEVLINK_RESOURCE_ID_ACL,
+		DEVLINK_RESOURCE_ID_PARENT_TOP,
+	},
+	{
+		"meters", yt921x_devlink_occ_get_meter,
+		YT921X_METER_NUM,
+		YT921X_DEVLINK_RESOURCE_ID_METER,
+		DEVLINK_RESOURCE_ID_PARENT_TOP,
+	},
+};
+
+int yt921x_devlink_setup(struct yt921x_priv *priv)
+{
+	struct dsa_switch *ds = &priv->ds;
+	int res;
+
+	for (int i = 0; i < ARRAY_SIZE(yt921x_devlink_resources); i++) {
+		struct devlink_resource_size_params size_params;
+		const struct yt921x_devlink_resource *r;
+
+		r = &yt921x_devlink_resources[i];
+
+		devlink_resource_size_params_init(&size_params, r->size,
+						  r->size, 1,
+						  DEVLINK_RESOURCE_UNIT_ENTRY);
+
+		res = dsa_devlink_resource_register(ds, r->name, r->size, r->id,
+						    r->parent_id, &size_params);
+		if (res) {
+			dsa_devlink_resources_unregister(ds);
+			return res;
+		}
+
+		dsa_devlink_resource_occ_get_register(ds, r->id, r->occ_get,
+						      priv);
+	}
+
+	return 0;
+}
diff --git a/drivers/net/dsa/motorcomm/devlink.h b/drivers/net/dsa/motorcomm/devlink.h
new file mode 100644
index 000000000000..184b9f05742e
--- /dev/null
+++ b/drivers/net/dsa/motorcomm/devlink.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2026 David Yang
+ */
+
+#ifndef _YT_DEVLINK_H
+#define _YT_DEVLINK_H
+
+#include <net/dsa.h>
+
+struct yt921x_priv;
+
+int
+yt921x_dsa_devlink_info_get(struct dsa_switch *ds, struct devlink_info_req *req,
+			    struct netlink_ext_ack *extack);
+int yt921x_devlink_setup(struct yt921x_priv *priv);
+
+#endif
-- 
2.53.0

