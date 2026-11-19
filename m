Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=92.121.34.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082112;
	b=CrZPSv4Xt4GZMLvFgOvdpic14kcyTzzyBkYQbNJNQPHX0FI/FiNIDemIsOZkfX0/+yhr
	 VHQR8esgqJZfG1noftxMiQPPBPeAiHC3dl4+d8syt65M4CTOUAEruEHRcHC2AHz7KIBOD
	 oypOqgkp7aqO7EjEFJkUh6QVCEd901evjLkNmAUmLXxnVDGtA46jzZ5cPCxmCnieSoHve
	 jDZxSuWTD19yEQYTqfmbJhloyaGMVXztfWLk/eDzpJIMS7rwtfLCoHVl+Z7PeZ5FwqqY4
	 X+OlLcPmtWc0V+laopsuHk+p66BUHzflMAmOFdkgO0ql2NhAR0caya4ydnQMu2+wZGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082112;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Virus-Scanned;
	bh=HDFfJMYjA/4PDkZED5h1rnMl4E/X0Rt7XsAkxCIQK1c=;
	b=guKxEBhaPcKU72MK5xaB0uypzuWB833b/pHHZOTMXOeFsleqtrLvHoi40qQ9KCgz3iaD
	 dLR8ZeR7x1U04u0Q0PEUCLFbTpOZwTmmTZsSSs1oUfGMdXB4rt+18llc1xnbWAYG231Va
	 QZMsZ8A7DM03g9wQpMuqIuRJKrA6Ln59yhivAJDIhfEcpAl4HdH7DWrf/CWtekUo6MZPO
	 wrKivNjLUhFWC0QZzftZjpX/jKYlaFlR3f6oATx6M6asa42YKcC9++yqDoMdHABCkTxol
	 0FxkRBstPUm3kf3u90azN1MlobAKJNqujGKEBlKxKZm3A8VSXI/ORW4rnTwVXTMeE6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	arc=none smtp.remote-ip=92.121.34.13
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAE7606A339
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:55:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AAE7606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id F3EAA1A004C;
	Thu, 19 Nov 2026 10:55:03 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BE37A1A003D;
	Thu, 19 Nov 2026 10:55:03 +0100 (CET)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 0E5431800068;
	Thu, 19 Nov 2026 17:55:00 +0800 (+08)
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com,
	broonie@kernel.org,
	mfd@lists.linux.dev,
	lee@kernel.org,
	Frank.Li@nxp.com,
	lgirdwood@gmail.com
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: [PATCH v22 1/5] i3c: hub: Mark downstream DT addresses as desired on parent bus
Date: Thu, 19 Nov 2026 15:24:45 +0530
Message-Id: <20261119095449.555593-2-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261119095449.555593-1-lakshay.piplani@nxp.com>
References: <20261119095449.555593-1-lakshay.piplani@nxp.com>
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
X-Virus-Scanned: ClamAV using ClamSMTP

I3C devices behind hub target ports share the parent controller's
dynamic address space. Their assigned dynamic addresses from Device
Tree must be preserved so that parent DAA does not allocate the same
addresses to other devices.

Previously, the hub reserved these addresses by marking the parent
bus slots as I3C_ADDR_SLOT_I3C_DEV, even though the downstream devices
were not attached to the parent bus. This could cause address
reconciliation to incorrectly treat these slots as occupied by
orphaned I3C devices.

Introduce i3c_bus_set_addr_slot_desired() to mark an address as
desired without changing its current slot status.

Use this helper when processing downstream I3C devices described in
Device Tree. This allows parent DAA to avoid the desired addresses
while keeping the slots free until the corresponding devices are
actually attached.

Keep the desired address markings for the lifetime of the parent bus,
as they represent the fixed Device Tree topology.

Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>

---
Changes in v22:
 - Add a generic I3C core fix for downstream DT-assigned address handling
   on the parent bus.
 - Introduce i3c_bus_set_addr_slot_desired() to set
   I3C_ADDR_SLOT_EXT_DESIRED without changing slot occupancy.
 - Avoid treating downstream addresses as orphaned parent-bus devices
   during DAA reconciliation.
 - Preserve downstream address preferences across parent DAA.
---
---
 drivers/i3c/hub.c          | 18 +++++++++++-------
 drivers/i3c/master.c       | 20 ++++++++++++++++++++
 include/linux/i3c/master.h |  2 ++
 3 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/drivers/i3c/hub.c b/drivers/i3c/hub.c
index 539028768084..95eec5b0cada 100644
--- a/drivers/i3c/hub.c
+++ b/drivers/i3c/hub.c
@@ -763,10 +763,15 @@ EXPORT_SYMBOL_GPL(i3c_hub_init);
  * @hubc: I3C hub controller for a target-port virtual bus.
  * @node: Target-port bus Device Tree node.
  *
- * Reserve parent bus address slots for the assigned dynamic address of each
- * downstream I3C device described in the Device Tree, so that parent DAA does
- * not hand the same address to another device. Downstream devices behind hub
- * target ports share the parent controller's dynamic address space.
+ * Mark the assigned dynamic address of each downstream I3C device described in
+ * the Device Tree as desired on the parent bus, so that parent DAA avoids
+ * handing the same address to another device while it is still free.
+ * Downstream devices behind hub target ports share the parent controller's
+ * dynamic address space.
+ *
+ * A desired address is only a preference: the slot stays free, so the parent
+ * does not report it as occupied and address reconciliation does not mistake
+ * it for an orphaned device that has to be probed.
  *
  * The reservations describe a fixed Device Tree topology and are kept for the
  * lifetime of the parent bus; they are not released when a target port is
@@ -816,9 +821,8 @@ int i3c_hub_reserve_parent_addrslots_from_dt(struct i3c_hub_controller *hubc,
 		status = i3c_bus_get_addr_slot_status(&parent->bus,
 						      assigned_addr);
 		if (status == I3C_ADDR_SLOT_FREE)
-			i3c_bus_set_addr_slot_status(&parent->bus,
-						     assigned_addr,
-						     I3C_ADDR_SLOT_I3C_DEV);
+			i3c_bus_set_addr_slot_desired(&parent->bus,
+						      assigned_addr);
 		i3c_bus_maintenance_unlock(&parent->bus);
 	}
 	return 0;
diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 9928c5dffb5b..146edbc279a3 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -448,6 +448,26 @@ void i3c_bus_set_addr_slot_status(struct i3c_bus *bus, u16 addr,
 }
 EXPORT_SYMBOL_GPL(i3c_bus_set_addr_slot_status);
 
+/**
+ * i3c_bus_set_addr_slot_desired() - Mark an I3C address as desired
+ * @bus: I3C bus.
+ * @addr: I3C address preferred by a device.
+ *
+ * Record that a device would like @addr without claiming that a device
+ * already uses it. Dynamic address assignment then avoids @addr while it
+ * is still free, but address reconciliation does not treat it as an
+ * orphaned device.
+ *
+ * The caller must hold the bus maintenance lock.
+ */
+void i3c_bus_set_addr_slot_desired(struct i3c_bus *bus, u16 addr)
+{
+	/* Narrow mask: set the desired flag without touching the status. */
+	i3c_bus_set_addr_slot_status_mask(bus, addr, I3C_ADDR_SLOT_EXT_DESIRED,
+					  I3C_ADDR_SLOT_EXT_DESIRED);
+}
+EXPORT_SYMBOL_GPL(i3c_bus_set_addr_slot_desired);
+
 static bool i3c_bus_dev_addr_is_avail(struct i3c_bus *bus, u8 addr)
 {
 	enum i3c_addr_slot_status status;
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index d58070a72a49..6c90ccb41e49 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -793,6 +793,8 @@ i3c_bus_get_addr_slot_status(struct i3c_bus *bus, u16 addr);
 void i3c_bus_set_addr_slot_status(struct i3c_bus *bus, u16 addr,
 				  enum i3c_addr_slot_status status);
 
+void i3c_bus_set_addr_slot_desired(struct i3c_bus *bus, u16 addr);
+
 void i3c_bus_maintenance_lock(struct i3c_bus *bus);
 void i3c_bus_maintenance_unlock(struct i3c_bus *bus);
 #endif /* I3C_MASTER_H */
-- 
2.25.1

