Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581456;
	b=0wR1YfP5ZAHhZv86elJQD24ANoJWXfyb1s/v6QD2nKc6h1nhMIfZaJoVWRM3o34mAgD2
	 yeyLaZHCBu/E3ILYd3C58mPOc0igr3DRlv6+olrUWFaxlEUfN7KPvdqx0CJeViAzH25VL
	 ElRVBHL9++bC6g4vw1rLUkfx4fHbcGbLk/S0LvNRWbDsV+jn2ktl7igNd4YYlFmNChQbF
	 c2e/D5pC/iwp9XB2Tkbhg7IPQgcAWovtvtPhj/3vv7xhWrT6iz0G+0WMVHw6QB6JkIZ4T
	 8DAlLq5EoEQeCOVThpShZn9bp1ePXbEeDDTYquJ7eIbH/cOumjF+IvCcFyzZCnSh9JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ry895IeeCwvvoVrLKPY1qGl5vh7XehrgPQ0oBew1BlU=;
	b=pXkcfKpvmzwJJBXI/0gKhNE8/M9CK1MX/t4RgyWbeEcE1wcamojvow0JVlNSRBDyNSZy
	 ixCo/diXjQncgUUroAqdB0hqxBVQv1vw1VeXVAeRPB3DwabQQFSumSD9KVJpBeIcfvy6Y
	 DBAXCO95g3fF0NjZ/dCWvm6BX01ELtlGNFFWKUZTagc2PCd3xyJcCeS/6UcB2gYxAQsSO
	 NxFdoBgUQlrOJA36nkwim0OLxq1oEjMhH/V5yUIUo+Y9G5tI5nvrYkWDiw7cLDNKHDCG1
	 IiqfdmXix3YfqLJpPgRRKTWnNdWNga94UTOoc5diwTGR0vpXCbEb1IR1cpo++nNa+SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j1c5+oH9;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5A3606A338
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B5A3606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j1c5+oH9
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b612fd74e1so1777053b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795581456; x=1796186256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ry895IeeCwvvoVrLKPY1qGl5vh7XehrgPQ0oBew1BlU=;
        b=j1c5+oH9X/OlciKGuwj7HM9ZcXGErk0YCUBDlVBZjkAxRohOl/4iwun0LbFAxgj53u
         3zED6Jp9CwXj/asYsoLD6YtH09GSxxKNgzFLjt+tiM27Wi12XKAxntb7OknkAxW/yHyx
         0I7BmEBbymCElBoPxCpE/eNHQnfIgh8lBWm9/CxOPP+xZSU9Z/+67vIbHeSE04iaPf91
         HnGVuF6sCD3kgaYm/5YFsc2zGtJ3cfmf9h1Ava4kQNbCOuD3gpnzvYYOYz36E95c7mIG
         UWuT3EaCKZYVUWd4M6e8RKy5rzR0gQUu7fE9qzm7L+FwoQguhYjMgmSCLtheIWD2TFqH
         icNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581456; x=1796186256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ry895IeeCwvvoVrLKPY1qGl5vh7XehrgPQ0oBew1BlU=;
        b=SyeK3F7M6vrofBmBPjVuXZ5fVOciILS+9BaL6061z2ODXWy9mLyMCpwadJ66k/OCH3
         s1zplU3IQ+pTnKQpl5aZMVjhshn6qWS1BLp/orCbMAdkJ9fk3s1AGtptsvyQawOdsylY
         aKebwETFb4bSCvp0tmFtcdSHOtxSHF69yDkCqB7jc2bhizJgMsFHvJ1Bz5YgJDjqRnIQ
         MhDSmcutjeC2DzlWJ8aVTmggmo56Goc0vqFK9hwvNTsj+jneSM60EFBMkv5gqZ2bc0lk
         E/BEXB7SagaT3Rlhj3nGtVlJvcu0jWW3aR+Rtdk57lxLNlfRrDYre20W/6tUB0gO2Qd1
         kUdg==
X-Forwarded-Encrypted: i=1; AL+hErEw+YyNqC8FGO7d2/iYmcJgMNApJruN65PnT+/KK+fREbUr1UGLHtxEBBOx8b/gbif5p2/9Y4BtLLRsR6M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nlPpx6fwrP6XbQknIlkEHEVJES22DjSaAf/rwURmRfVYEvHA7
	49rUJzOBgN6zMHmAboZ3u2tRjnPem+7yOyK85p8QuyCh4mZE2hgYjS3x
X-Gm-Gg: AZFdTZek06gmPxaV7KZN6//5eupKX8Eh2E9boFoPIXtW5E+5mPB+fzMmZvfrlXVLN77
	9jU+fyWBOb9bZq6Soh84VsvR+PWZ9CKrGh3FNGXbbtuntaha4di5Ftl9kKMi1fzpk5mMttTTxPq
	g3UfMQcjFjwQ7kxjckkKbOXqG3SJV7BAFYrMrFmu4VnlQ9+2+9Je4WOP6sJQxeOd3tHsfxOmrB6
	x3MODDVrWEMjf9e9OFSwDq337HS2efhis+IdYhQTj+0DvsXLWPgN5ZEBfTLm7H2LabKkVTAAFPY
	SzCqtGKpmeeh2Q7YUlTTwxcjwiOblqIAgki4UUcKS7lF/7c5i1WmE8NGDG+MqCddbP09vAIDDHr
	tvRMCEeieByDqoaf71pV3eZTTOXkZetWnJeCmyCKl/2m9fzTjXrOlloSb6jGbxeGTwCojNM/7jV
	TRYNsJRDrsRJxCTVFu7sVGd3OHEpJabJjgvv1LzNe8ghi+uMwkmRYDUZbkWcE8IypEiisp7CchN
	+0z8GJxX0xHBt5odxrt+yFDxaJUzlnxCHIF1myRIP+trmXDEpJdExbN3cBav3TlHRXEDp4wogcO
	xQ0d64xRG5S5lyfIRqwXeGdUYRk=
X-Received: by 2002:a05:6a00:b92:b0:882:6d80:e5ad with SMTP id d2e1a72fcca58-8c87bcbcee9mr14392696b3a.9.1795581455547;
        Tue, 24 Nov 2026 20:37:35 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45eccsm8215994b3a.31.2026.11.24.20.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:37:35 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Aksh Garg <a-garg7@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Rhys Tumelty <rhys@tumelty.co.uk>,
	Manikandan K Pillai <mpillai@cadence.com>,
	"vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Hans Zhang <18255117159@163.com>,
	Yao Zi <me@ziyao.cc>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 6/8] doc: phy: Document some bulk helper functions
Date: Wed, 25 Nov 2026 12:36:37 +0800
Message-ID: <20261125043639.249525-7-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125043639.249525-1-inochiama@gmail.com>
References: <20261125043639.249525-1-inochiama@gmail.com>
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

Document all newly added bulk helper function, it can be used to manage
a set of PHYs automatically. This is useful when the driver want to
simplify the management of multiple PHYs.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/driver-api/phy/phy.rst | 40 ++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/driver-api/phy/phy.rst b/Documentation/driver-api/phy/phy.rst
index 0865c2e94eec..cae3d4700814 100644
--- a/Documentation/driver-api/phy/phy.rst
+++ b/Documentation/driver-api/phy/phy.rst
@@ -114,6 +114,12 @@ it. This framework provides the following APIs to get a reference to the PHY.
 	struct phy *devm_of_phy_get_by_index(struct device *dev,
 					     struct device_node *np,
 					     int index);
+	int devm_phy_bulk_get(struct device *dev, int num_phys,
+			      struct phy_bulk_data *phys);
+	int devm_phy_bulk_get_all(struct device *dev,
+				  struct phy_bulk_data **phys);
+	int devm_of_phy_bulk_get_all(struct device *dev, struct device_node *np,
+				     struct phy_bulk_data **phys);
 
 phy_get, devm_phy_get and devm_phy_optional_get can be used to get the PHY.
 In the case of dt boot, the string arguments
@@ -129,6 +135,21 @@ Some generic drivers, such as ehci, may use multiple phys. In this case,
 devm_of_phy_get or devm_of_phy_get_by_index can be used to get a phy
 reference based on name or index.
 
+The bulk helpers are useful when a controller operates several PHYs together,
+for example the lanes of a single PCIe port. To get a set of PHYs by name,
+the driver supplies an array of ``struct phy_bulk_data`` with the ``id`` of
+each entry set to the corresponding PHY name. devm_phy_bulk_get() returns
+zero if it obtains all the requested PHYs or a negative error code on failure.
+The driver owns the array and keeps it valid until driver detach, when the
+PHY references are released.
+
+When a controller needs every PHY listed in a device node's ``phys`` property,
+devm_phy_bulk_get_all() obtains them from the controller's device node.
+devm_of_phy_bulk_get_all() does the same for an explicitly supplied device
+node. These functions return the number of PHYs listed in the node, which may
+be zero, or a negative error code on failure. They store the allocated array
+in ``*phys`` only when the return value is positive.
+
 It should be noted that NULL is a valid phy reference. All phy
 consumer calls on the NULL phy become NOPs. That is the release calls,
 the phy_init() and phy_exit() calls, and phy_power_on() and
@@ -149,6 +170,14 @@ The general order of calls should be::
     phy_exit()
     [[of_]phy_put()]
 
+After acquiring a set of PHYs with a bulk helper, the order is::
+
+    phy_bulk_init()
+    phy_bulk_power_on()
+    ...
+    phy_bulk_power_off()
+    phy_bulk_exit()
+
 Some PHY drivers may not implement :c:func:`phy_init` or :c:func:`phy_power_on`,
 but controllers should always call these functions to be compatible with other
 PHYs. Some PHYs may require :c:func:`phy_set_mode <phy_set_mode_ext>`, while
@@ -172,6 +201,12 @@ PHY framework provides 2 APIs to release a reference to the PHY.
 Both these APIs are used to release a reference to the PHY and devm_phy_put
 destroys the devres associated with this PHY.
 
+For devm_phy_bulk_get_all() and devm_of_phy_bulk_get_all(), driver detach
+releases both the PHY references and the allocated array. To release them
+earlier, use::
+
+	void devm_phy_bulk_put_all(struct device *dev, struct phy_bulk_data *phy);
+
 Destroying the PHY
 ==================
 
@@ -221,3 +256,8 @@ DeviceTree Binding
 
 The documentation for PHY dt binding can be found @
 Documentation/devicetree/bindings/phy/phy-bindings.txt
+
+Missing Bulk Helpers
+====================
+Currently, only a few bulk helper functions are added as they have users.
+Function not upstreamed can be found at https://lore.kernel.org/linux-phy/20260904083709.425893-1-inochiama@gmail.com/
-- 
2.56.1

