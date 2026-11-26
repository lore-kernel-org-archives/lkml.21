Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697781;
	b=bjDr54PwndgOeJrsiZqKdcCOyD3PPJrvfmPWk8trdp0+5S4eL4xTLwU2fCqROiiEHSwv
	 CBhIkYVW8XdbXrEILw0Af7g8YmH06/4BH94bdiDJqYod04EBhAK8jmI3JqFFeqdPJ5Dt/
	 BIMLTCKrUpr9NGkjCe9cOxGzi/dzzhXCOKATGfqYQU6oTIWniXFIwvHJ6IfxRZJgdTrxu
	 NMiIT/BFZ0JIH8fvJ8QRayK0FNzR1CVPr/YM5RMwrm2Dr+V9jPeigb+dnN/kUuRq5Z3Zf
	 eBH61nhQUVxOjZ1MoGTwDJrROUBT6nI1dMleIoGb53I2CltVqxTlSPSgX1MEoOdR/aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697781;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=58hb1JUkizKcvYpieBEuU5KEwx15qhIK09NZzjLHXWw=;
	b=FOAfd/ECAT/cTPhE7e3dSXY18RQREk7qk4Cl6PSb6IddlHn5CyAGyY1LuWCB7sooxJ4b
	 /okPRXljVCiNVTm71+RFcEB6EAjiwW4pxe1V0sweEvbnf9V5pN9pzVop+Slg81qTtp/x2
	 uuSdh4sHFjDc2zs6cmG24fAU4XohM8FZwc7UBB2jXs39PGNp+NbPbtu0+jl4+8KjEJ5pX
	 48+jAS+fwcu2NzNbnpJHe36Uy/Hx66/ShgWC9DKzMOR9zWKh7+WwgzZRKNCQXbHn/jHFa
	 FWF/NPTaxY9CFQzSBD9eHTNcJA30uroX3iGpaiAihnPa1Gwlx948YC0lkrGpWahszxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=oggTPtwE;
	arc=none smtp.remote-ip=113.46.200.220
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CE9606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46CE9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=oggTPtwE
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=58hb1JUkizKcvYpieBEuU5KEwx15qhIK09NZzjLHXWw=;
	b=oggTPtwEFoztiPe+KGK0ATj2ui9oLosZhZzyve1xjKhZat6pibB4am5RVj99EoLO9VejY5Jmp
	i7GmASL4Ls01bB4pY++0QfWtIsaKGxC+nOtn1U7V45kXHcukGdJq4Cm69uyjUNw8Ecrjpk/sRKG
	scBUYFg7DTtfaMw9G+O+Zoc=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jZxNc0nsdz12LDD;
	Thu, 26 Nov 2026 20:55:28 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 971AA4056D;
	Thu, 26 Nov 2026 20:56:15 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 26 Nov
 2026 20:56:14 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <gshan@redhat.com>, <jic23@kernel.org>,
	<catalin.marinas@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 2/2] arm_mpam: Save and restore the MSC state across system sleep
Date: Thu, 26 Nov 2026 20:56:07 +0800
Message-ID: <20261126125607.2304487-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126125607.2304487-1-ruanjinjie@huawei.com>
References: <20261126125607.2304487-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)

The driver saves an MSC's state when its last CPU goes offline, and
restores it when the first CPU comes online. The CPU that suspends
the system stays online, so these cpuhp callbacks never save the
MSCs it can access, such as the L3 and memory side MSCs. An MSC can
still lose its registers while the system sleeps, for example when
its power domain is not retained across suspend-to-RAM. resctrl
then reports the cached configuration while the hardware is back at
its defaults. The bandwidth monitor counters restart from zero,
losing the traffic counted before the sleep.

Save the state from the driver's system sleep callbacks, which run
while the MSC is still accessible, and restore it from the matching
resume callbacks; hibernation runs the same pair. The cpuhp
callbacks leave a suspended MSC alone, so the saved monitor state is
not overwritten by a second save as the secondary CPUs go offline.

The resctrl overflow and limbo workers are not frozen, and keep
reading the monitors while the MSC is suspended. A read reprograms
the monitor's control registers, re-enabling the monitor that the
save just disabled and restarting its counter from zero. Make the
monitor reads report the counter as unavailable instead, and let
the config writes update the cached configuration only, while the
MSC is suspended.

Fixes: 09b89d2a72f3 ("arm_mpam: Allow configuration to be applied and restored during cpu online")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org> # 6.19+
Cc: James Morse <james.morse@arm.com>
Cc: Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
---
 drivers/resctrl/mpam_devices.c  | 76 +++++++++++++++++++++++++++++++--
 drivers/resctrl/mpam_internal.h |  7 +++
 2 files changed, 80 insertions(+), 3 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 562f21a8869c..4ab8de49f02d 100644
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
@@ -1601,7 +1602,16 @@ static void __ris_msmon_read(void *arg)
 		return;
 	}
 
-	__ris_msmon_read_locked(m);
+	/*
+	 * A read would re-enable the monitor disabled for system sleep
+	 * and restart its counter from zero, only to read back NRDY.
+	 * Report the counter as unavailable instead of -EBUSY, which the
+	 * resctrl workers would keep retrying.
+	 */
+	if (READ_ONCE(msc->pm_suspended))
+		m->err = -EINVAL;
+	else
+		__ris_msmon_read_locked(m);
 
 	mpam_mon_sel_unlock(msc);
 }
@@ -2267,7 +2277,7 @@ static int mpam_cpu_online(unsigned int cpu)
 		if (msc->reenable_error_ppi)
 			_enable_percpu_irq(&msc->reenable_error_ppi);
 
-		if (atomic_fetch_inc(&msc->online_refs) == 0)
+		if (atomic_fetch_inc(&msc->online_refs) == 0 && !READ_ONCE(msc->pm_suspended))
 			mpam_msc_power_on(msc);
 	}
 
@@ -2329,13 +2339,65 @@ static int mpam_cpu_offline(unsigned int cpu)
 		if (msc->reenable_error_ppi)
 			disable_percpu_irq(msc->reenable_error_ppi);
 
-		if (atomic_dec_and_test(&msc->online_refs))
+		if (atomic_dec_and_test(&msc->online_refs) && !READ_ONCE(msc->pm_suspended))
 			mpam_msc_power_off(msc);
 	}
 
 	return 0;
 }
 
+static int mpam_msc_suspend(struct device *dev)
+{
+	struct mpam_msc *msc = dev_get_drvdata(dev);
+
+	if (!msc)
+		return 0;
+
+	guard(mutex)(&mpam_cpuhp_state_lock);
+	if (!mpam_is_enabled())
+		return 0;
+
+	guard(cpus_read_lock)();
+	guard(srcu)(&mpam_srcu);
+	if (!atomic_read(&msc->online_refs))
+		return 0;
+
+	/*
+	 * The save disables the monitors. Set the flag before it so the
+	 * resctrl workers stop reading them: a reader takes cfg_lock or
+	 * mon_sel_lock, and the save takes both, so a read either completes
+	 * before the save or sees the flag.
+	 */
+	WRITE_ONCE(msc->pm_suspended, true);
+	mpam_msc_power_off(msc);
+
+	return 0;
+}
+
+static int mpam_msc_resume(struct device *dev)
+{
+	struct mpam_msc *msc = dev_get_drvdata(dev);
+
+	if (!msc)
+		return 0;
+
+	guard(mutex)(&mpam_cpuhp_state_lock);
+	if (!mpam_is_enabled() || !READ_ONCE(msc->pm_suspended))
+		return 0;
+
+	guard(cpus_read_lock)();
+	guard(srcu)(&mpam_srcu);
+	if (atomic_read(&msc->online_refs))
+		mpam_msc_power_on(msc);
+
+	/* Let the monitor reads back in once the state is restored. */
+	WRITE_ONCE(msc->pm_suspended, false);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(mpam_msc_pm_ops, mpam_msc_suspend, mpam_msc_resume);
+
 static void mpam_register_cpuhp_callbacks(int (*online)(unsigned int online),
 					  int (*offline)(unsigned int offline),
 					  char *name)
@@ -2586,6 +2648,7 @@ static struct platform_driver mpam_msc_driver = {
 	.driver = {
 		.name = "mpam_msc",
 		.suppress_bind_attrs = true,
+		.pm = pm_sleep_ptr(&mpam_msc_pm_ops),
 	},
 	.probe = mpam_msc_drv_probe,
 	.remove = mpam_msc_drv_remove,
@@ -3443,6 +3506,13 @@ int mpam_apply_config(struct mpam_component *comp, u16 partid,
 		msc = vmsc->msc;
 
 		guard(mutex)(&msc->cfg_lock);
+		/*
+		 * The cache was updated above; the MSC is reprogrammed from
+		 * it on resume, so this write is not lost.
+		 */
+		if (READ_ONCE(msc->pm_suspended))
+			continue;
+
 		list_for_each_entry_srcu(ris, &vmsc->ris, vmsc_list,
 					 srcu_read_lock_held(&mpam_srcu)) {
 			arg.ris = ris;
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 1f86cc158100..0a2f2d35871d 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -87,6 +87,13 @@ struct mpam_msc {
 
 	atomic_t		online_refs;
 
+	/*
+	 * Set while the MSC state is saved for system sleep. The cpuhp
+	 * callbacks then leave the MSC alone, and the monitor reads and
+	 * config writes skip the hardware.
+	 */
+	bool			pm_suspended;
+
 	/*
 	 * probe_lock is only taken during discovery. After discovery these
 	 * properties become read-only and the lists are protected by SRCU.
-- 
2.34.1

