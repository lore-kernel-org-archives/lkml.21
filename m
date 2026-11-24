Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508846;
	b=Ph71gOiXByi2bortKGK9ws6ec5QHxIwekrzyepaBLRdgr5TAcW+LLd0hFJ3V7QvNJGdM
	 tqXIBLzXfxeclgtu5R8hZZTkz07ZmujnlPB/XzQfxpzOyhaHjHCnefWuf1DRH//QdhbM+
	 S/Qqo5zYXX+Tls5T+Mo7gT8/JKWvCRp59D1K+FQrlmAwQc05xZVoHA5BqlIoKmcQNS09T
	 xfhCLx4HqTl80jxQtitLPSBzyBeyb/nmgaRj4lfgT1E3o/nc5TRUD24re9RzPtWF0b4wr
	 6zMwKRkCjqwkGjSFAMyXGWBqTb11+o6scRqC65xi1x2P0jX9Z9UVCdbUtM01B7kNINw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508846;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=oO9NoKkGUBW79Pz13XzckI1UHKiYF6Aol+ytGcTDdWY=;
	b=ymM2IL8zIUYMfjm15N13vKz3otrEJYdY64ivtxpn+5B88tHv8nXJjXEye1Xsb8fq8V+r
	 ZZqqWggnuLjikNbr5ibG8cT/lFOEGSfpzIiTIWp/BYH39AB4RzPP6MpTN/DjK1B6Zath1
	 E4RklKV004fmYQyMod2dKjpspuKw8RvPNmqbf0OyN64Q8bU4VDCP9bI3CzONS+Ph4JbHE
	 EpdhwViz6Ynq9Kj4Zsxuro6oXvJakGc4I6q2zBQJc7AssUrok31SK81t4BDeBkZgkgkuw
	 ZYfXITmD41tXbDSPrlqT9AsVkdMt8rYTOBH1zs11Qv40nfpP7AIzF7XtIQAkY6SoY8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=2UC03c4o;
	arc=none smtp.remote-ip=113.46.200.223
Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BBB606A683
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85BBB606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=2UC03c4o
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=oO9NoKkGUBW79Pz13XzckI1UHKiYF6Aol+ytGcTDdWY=;
	b=2UC03c4oNo2p/hq51MOvjt8zUjY+V12fB21OirzeR5P9Jzj8Uualt8s0Y0cgEV+oDIVhLbFhD
	X7VYFn+aWIrkk7GoPYNjU1E4L+3RKQ/0zfCKvDWH+ijCuxMzXttt8LBdCwEfG6vsVP7F8XDF/NK
	hj0EZbBZFzmBOKn6JEe0BK8=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4jYbWY0jpGzmVWs;
	Tue, 24 Nov 2026 16:26:49 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 3C3C44057C;
	Tue, 24 Nov 2026 16:27:12 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 24 Nov
 2026 16:27:11 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH RFC] arm_mpam: Save and restore the MSC state across system sleep
Date: Tue, 24 Nov 2026 16:27:08 +0800
Message-ID: <20261124082708.1705024-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
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
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)

The MPAM driver reprograms an MSC's configuration when the first CPU
that can access it comes online, and resets it, saving the bandwidth
monitor state, when the last one goes offline.

The CPU that suspends the system stays online, so the MSCs it can
access, such as the L3 and memory side MSCs, are never seen going
offline by these cpuhp callbacks. An MSC can still lose its registers
while the system sleeps, for example when its power domain is not
retained across suspend-to-RAM. resctrl then reports the cached
configuration while the hardware is back at its defaults, and the
bandwidth monitor counters restart from zero, losing the traffic
counted before the sleep.

Save the state from the driver's system sleep callback, which runs
while the MSC is still accessible, and reprogram it from the matching
resume callback. The cpuhp callbacks then leave the MSC alone: a second
save when its last CPU goes offline would find the monitors already
disabled by the first save, and lose the monitor configuration from
the saved state.

Cc: James Morse <james.morse@arm.com>
Cc: Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_devices.c  | 101 ++++++++++++++++++++++++--------
 drivers/resctrl/mpam_internal.h |   1 +
 2 files changed, 78 insertions(+), 24 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index c067b6d57d71..49ace93280a7 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -23,6 +23,7 @@
 #include <linux/mailbox_client.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
 #include <linux/printk.h>
 #include <linux/property.h>
 #include <linux/srcu.h>
@@ -2223,6 +2224,37 @@ static void _enable_percpu_irq(void *_irq)
 	enable_percpu_irq(*irq, IRQ_TYPE_NONE);
 }
 
+static void mpam_msc_power_on(struct mpam_msc *msc)
+{
+	mutex_lock(&msc->error_irq_lock);
+	if (msc->error_irq_hw_enabled)
+		mpam_touch_msc(msc, mpam_enable_msc_ecr, msc);
+	mutex_unlock(&msc->error_irq_lock);
+
+	mpam_reprogram_msc(msc);
+}
+
+static void mpam_msc_power_off(struct mpam_msc *msc)
+{
+	struct mpam_msc_ris *ris;
+
+	mutex_lock(&msc->cfg_lock);
+	list_for_each_entry_srcu(ris, &msc->ris, msc_list,
+				 srcu_read_lock_held(&mpam_srcu)) {
+		mpam_touch_msc(msc, &mpam_reset_ris, ris);
+
+		/*
+		 * The reset state for non-zero partid may be
+		 * lost while the CPUs are offline.
+		 */
+		ris->in_reset_state = false;
+
+		if (mpam_is_enabled())
+			mpam_touch_msc(msc, &mpam_save_mbwu_state, ris);
+	}
+	mutex_unlock(&msc->cfg_lock);
+}
+
 static int mpam_cpu_online(unsigned int cpu)
 {
 	struct mpam_msc *msc;
@@ -2236,14 +2268,8 @@ static int mpam_cpu_online(unsigned int cpu)
 		if (msc->reenable_error_ppi)
 			_enable_percpu_irq(&msc->reenable_error_ppi);
 
-		if (atomic_fetch_inc(&msc->online_refs) == 0) {
-			mutex_lock(&msc->error_irq_lock);
-			if (msc->error_irq_hw_enabled)
-				mpam_touch_msc(msc, mpam_enable_msc_ecr, msc);
-			mutex_unlock(&msc->error_irq_lock);
-
-			mpam_reprogram_msc(msc);
-		}
+		if (atomic_fetch_inc(&msc->online_refs) == 0 && !msc->pm_suspended)
+			mpam_msc_power_on(msc);
 	}
 
 	if (mpam_resctrl_enabled)
@@ -2304,30 +2330,56 @@ static int mpam_cpu_offline(unsigned int cpu)
 		if (msc->reenable_error_ppi)
 			disable_percpu_irq(msc->reenable_error_ppi);
 
-		if (atomic_dec_and_test(&msc->online_refs)) {
-			struct mpam_msc_ris *ris;
+		if (atomic_dec_and_test(&msc->online_refs) && !msc->pm_suspended)
+			mpam_msc_power_off(msc);
+	}
 
-			mutex_lock(&msc->cfg_lock);
-			list_for_each_entry_srcu(ris, &msc->ris, msc_list,
-						 srcu_read_lock_held(&mpam_srcu)) {
-				mpam_touch_msc(msc, &mpam_reset_ris, ris);
+	return 0;
+}
 
-				/*
-				 * The reset state for non-zero partid may be
-				 * lost while the CPUs are offline.
-				 */
-				ris->in_reset_state = false;
+static int mpam_msc_suspend(struct device *dev)
+{
+	struct mpam_msc *msc = dev_get_drvdata(dev);
 
-				if (mpam_is_enabled())
-					mpam_touch_msc(msc, &mpam_save_mbwu_state, ris);
-			}
-			mutex_unlock(&msc->cfg_lock);
-		}
+	if (!msc)
+		return 0;
+
+	guard(mutex)(&mpam_cpuhp_state_lock);
+	if (!mpam_is_enabled())
+		return 0;
+
+	guard(cpus_read_lock)();
+	guard(srcu)(&mpam_srcu);
+	if (atomic_read(&msc->online_refs)) {
+		mpam_msc_power_off(msc);
+		msc->pm_suspended = true;
 	}
 
 	return 0;
 }
 
+static int mpam_msc_resume(struct device *dev)
+{
+	struct mpam_msc *msc = dev_get_drvdata(dev);
+
+	if (!msc)
+		return 0;
+
+	guard(mutex)(&mpam_cpuhp_state_lock);
+	if (!mpam_is_enabled() || !msc->pm_suspended)
+		return 0;
+
+	guard(cpus_read_lock)();
+	guard(srcu)(&mpam_srcu);
+	msc->pm_suspended = false;
+	if (atomic_read(&msc->online_refs))
+		mpam_msc_power_on(msc);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(mpam_msc_pm_ops, mpam_msc_suspend, mpam_msc_resume);
+
 static void mpam_register_cpuhp_callbacks(int (*online)(unsigned int online),
 					  int (*offline)(unsigned int offline),
 					  char *name)
@@ -2578,6 +2630,7 @@ static struct platform_driver mpam_msc_driver = {
 	.driver = {
 		.name = "mpam_msc",
 		.suppress_bind_attrs = true,
+		.pm = pm_sleep_ptr(&mpam_msc_pm_ops),
 	},
 	.probe = mpam_msc_drv_probe,
 	.remove = mpam_msc_drv_remove,
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 1f86cc158100..2e6da63c61c6 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -86,6 +86,7 @@ struct mpam_msc {
 	struct mpam_msc * __percpu	*error_dev_id;
 
 	atomic_t		online_refs;
+	bool			pm_suspended;
 
 	/*
 	 * probe_lock is only taken during discovery. After discovery these
-- 
2.34.1

