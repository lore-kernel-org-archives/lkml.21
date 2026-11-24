Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554387;
	b=nmruG1SmnK/CAxLlux8EMK4JbrMQ4XUV8Dodm2dNyDLC10mhJvgYcKEo2/+wtdqOhRs5
	 UXTKlOs2fseli9xYI1yHQDrEtUPl/Od0N62/Nwf9mlWxcfOACM85titUEzNfDTfDeH+w8
	 Tb3YRUTbLHnB/dJC7U1JWpLkxLOTTSKvO31rwd55vISBNzb9WnD4XRahzDQL/84Z4vHVE
	 RBQNLLG6vwa1Q/A13EUEm6rlZRIunM8gmcnUUxFvmVzLLIkQ1I1nPpwYsG7CIi+QnHApq
	 f0dtbyEQLrs/S/DmXFcqs9VrrfW3tlB5sVp3qZVIoVdZBOa89Cjc3oJ65Wyp46JDVeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=lNAaswrlG/59voK0420Q09D/s4OeQ1/KcKb6MhRwXG4=;
	b=131MvPkRTkItjneHO6hG2en0NVc6kiQZjj7E9QFEzxg8LunL9esd+p15+YzLKOUKm/yt
	 s8+lwDdAn17B1OIWLUVa+rIDZF4UtpS9Y4BkLR6g1otu/t87fdntA88REUcJIBzkBpR72
	 qSWnZnP9xGaKF8sDCNDBtuW4VvE865ZiyQs8zvw2tLxvwPpv5Eq4zdbgDz/Omb/dFipkY
	 IINieaSoBBY3XIXbZEpej6ysY8zfJFRpwSWO4jhV3Wsczw2yj8ueg+DejhaLDfD2oXnqM
	 +8dyDdAP5iLRT+jeoAM12D3LevO4QpSxaVj6vJRoUZ5GQswtytRjVCnu2+xtEZndghA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nM66Qirx;
	arc=none smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5623606A680
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5623606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nM66Qirx
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ab3b29a298so41343361fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795554385; x=1796159185; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lNAaswrlG/59voK0420Q09D/s4OeQ1/KcKb6MhRwXG4=;
        b=nM66QirxXo8lJFAl/96/3+7oSdudDPzwD0KFHXIFXevFQgXZvH1CAn54rdGiOjjIyd
         pYzp7aXjpGaluKDR1+sR2Dpqjtksx33A3rgSzJiq+5teCnlX4RAgzl8JLzkxRW7AcoLK
         M5QWAQ8KseDuCOC5WfWxYQZU0vW4r3/Nu7y2NCX5TDfIP4GMEDhJarvdxQ1N//LI1WgB
         fD/Y6q05Y/fEyH0oiC0Z0hxEoJMgRRIjsAhBFmiedIpIiO1SfPvu6YbxfVTv27RdU/Q/
         T2kIEd/6cmjx9amkSCEhQFl3mFJGYba/hlBY5esjtfgG9jLCr8K8M49u6Pfby24cxpiV
         K1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554385; x=1796159185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lNAaswrlG/59voK0420Q09D/s4OeQ1/KcKb6MhRwXG4=;
        b=1s4/Rx52Ux9pwdRpQBXkxZLLHXbomRMddMEf9u5sCyPDFCIGkEtFcjXEVhu25SdzP/
         G31MlMX2X8w8fKsC9kC9fdeuIlQ7DaCczXvDD6QIrAAmfHKvnfV3pJU/ePM40o2st8z9
         CgG8VNG0gvae43V/6IWQNx1EcVpuutO/z4XwrwcPx95wS6p59Qpk1cs5a36vxCqgLO6O
         17iZeQpSTe7TQZM1Z8L1z/F9frKo5JBP4Tgk5klHfVORyNrYhzN7/CTUK44zDpEcSsVl
         tVrx4U1SIIiPFg6WTlYxseHXrfchXX6hn5Lks6vHwywHvWHhFa2HBasSgp5k5a0oGy89
         8LdQ==
X-Gm-Message-State: APuU4Z8Gm5LS+UEYs7mES+zwSkqTJhX/FSqHE4USvHmlkwg++ZIolaUO
	4cjfU8B5ShAsYIugL9nRAJ5ZI7BCGvt/r4wXx/bnRaHRKmWfe7W0g/Zp
X-Gm-Gg: AZFdTZeg+8XTg104ODYleaqGt84WWMiY+sEzxFaF+PQH75fOQerNzU15/GG6MxAvZ/A
	joYQBDwl5Oc3FAYMzbSlzpV6FTBioheQ79fjv0HF7CknJJTnhlMMVCIKfZD1LjNMUTpfWu0I+Fe
	uf0Bjpxxj8h/PpTofNTvI9hpIzL7UFagvW+G6vQIkCQ6XGkgMBkObhLITX3Z8SK1uitpqxwa5T2
	iQ67QMbvz29xzfnGEiEKP+whiPciyyMnINbAvKO4hMFYTibFsTYpnjL59zdBnnYzjt+YxZXUcjC
	MpBxJoEt/Z3FLsiKD42V5CdC4jX2Ys1sp5ewIihtfEtvn+eiw9byI1+4qU+xlmXw1eLS8s0qizy
	qkM/FZ02lb6iSGlh7wKC77iYPFHpvggDrEZNCS1WZ6e0mksf86fJ5pQtvapT08oheKcc6UslFTT
	q1MjXxK6nSDLOTxn8dUhE+aYTLNzFOEuAFPDDanxugbe89IMwaxAS2ABPEEWPWjrkSs7XWguFXK
	VqTAa1wpgRDdIO4anLsiwXM0p0eAMR+dd1hP+y2ka5keH3fT/ac6hr+qHcDosj6xw+E/w5dodBs
	9JZ6Y1U9jxi0EIasopIfq3zAnFq8XPmlaj0Ih3+adrZxix4g7Z3dKnqmfH3Wyg==
X-Received: by 2002:a05:6512:31c3:b0:5bf:b945:4334 with SMTP id 2adb3069b0e04-5c1bc907788mr4479568e87.67.1795554384653;
        Tue, 24 Nov 2026 13:06:24 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd041813sm4099045e87.53.2026.11.24.13.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:06:24 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Date: Tue, 24 Nov 2026 22:06:03 +0100
Subject: [PATCH v2 5/6] soc/tegra: pmc: Add a partition power off notifier
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
Message-Id: <20261124-t20-for-upstream-v2-5-440116846f97@gmail.com>
References: <20261124-t20-for-upstream-v2-0-440116846f97@gmail.com>
In-Reply-To: <20261124-t20-for-upstream-v2-0-440116846f97@gmail.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org, 
 clamor95@gmail.com, Artur Kowalski <arturkow2000@gmail.com>, 
 linux-clk@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7068;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=EIJn9URgd+OIum2dJE2qaWWljUi0FVplkW6brLl+DU4=;
 b=owGbwMvMwCVmYeTc/TaVxZzxtFoSQzbrH+fSmPkGfSuWePWJPL+426dkmlJn31Xlf1Msbzg2/
 giyfrOso5SFQYyLQVZMkcXsodAXnnle7ze83NoJM4eVCWQIAxenAExkvTnDP8ULh96eNvhvu6Qn
 +vcil+RlVw6ufMaqXSWh/fH4tWy1qlCGPzz1RUFvd68+nvbFZZ/Cp50n43+t1lvNvPLEPhOG8FM
 X9zIBAA==
X-Developer-Key: i=arturkow2000@gmail.com; a=openpgp;
 fpr=F60710C8D69E03A01A2801CD87A47D20C2709637

After a watchdog reset, which doesn't reset the PMC, Tegra20's boot ROM
hangs if the VDE partition is powered off. Unless booted with
tegra_pmc.vde_always_on=1, the PMC driver powers the partition off when
it registers it, and genpd powers it off while the VDE is idle. The
Tegra20 watchdog driver will need to stop the watchdog before that
happens.

genpd notifiers can't be used for this: they only reach devices attached
to the domain, which the watchdog isn't, and the partitions are powered
off before their genpds are registered. Add a notifier that is called
before a partition is powered off, from tegra_powergate_set(), which all
power off paths go through.

When a notifier is registered, it is also called for every partition that
is already powered off, except one kept powered on with
tegra_pmc.vde_always_on, which the PMC driver powers on when it registers
it. A lock is held across both the notification and the power off, so a
partition can't be powered off unnoticed while a notifier is being
registered. Registration uses the early PMC, so it works before the PMC
driver has probed, which is when the partitions are first powered off.
The notifier, including the hook on the power off path, is therefore only
built on 32-bit ARM, the only architecture with an early PMC.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 drivers/soc/tegra/pmc.c | 105 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/soc/tegra/pmc.h |  19 +++++++++
 2 files changed, 124 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index abef3fed637ff..d959ae4d0f13b 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -31,6 +31,7 @@
 #include <linux/irq.h>
 #include <linux/irq_work.h>
 #include <linux/kernel.h>
+#include <linux/notifier.h>
 #include <linux/of_address.h>
 #include <linux/of_clk.h>
 #include <linux/of.h>
@@ -520,6 +521,34 @@ static struct tegra_pmc *early_pmc = &(struct tegra_pmc) {
 	.base = NULL,
 	.suspend_mode = TEGRA_SUSPEND_NOT_READY,
 };
+
+/*
+ * Notified before a partition is powered off. The lock is held across the
+ * notification and the power off, so that a notifier being registered either
+ * sees the partition still powered or is notified.
+ */
+static DEFINE_MUTEX(tegra_powergate_nh_lock);
+static RAW_NOTIFIER_HEAD(tegra_powergate_nh);
+
+static void tegra_powergate_power_off_begin(unsigned int id)
+{
+	mutex_lock(&tegra_powergate_nh_lock);
+	raw_notifier_call_chain(&tegra_powergate_nh,
+				TEGRA_PMC_POWERGATE_POWER_OFF, &id);
+}
+
+static void tegra_powergate_power_off_end(void)
+{
+	mutex_unlock(&tegra_powergate_nh_lock);
+}
+#else
+static inline void tegra_powergate_power_off_begin(unsigned int id)
+{
+}
+
+static inline void tegra_powergate_power_off_end(void)
+{
+}
 #endif
 
 #ifdef MODULE_PARAM_PREFIX
@@ -731,8 +760,14 @@ static int tegra_powergate_set(struct tegra_pmc *pmc, unsigned int id,
 		return 0;
 	}
 
+	if (!new_state)
+		tegra_powergate_power_off_begin(id);
+
 	err = pmc->soc->powergate_set(pmc, id, new_state);
 
+	if (!new_state)
+		tegra_powergate_power_off_end();
+
 	mutex_unlock(&pmc->powergates_lock);
 
 	return err;
@@ -5167,6 +5202,76 @@ int tegra_pmc_cpu_remove_clamping(unsigned int cpuid)
 	return tegra_pmc_powergate_remove_clamping(early_pmc, id);
 }
 
+/**
+ * tegra_pmc_powergate_register_notifier() - get notified of partition power off
+ * @nb: notifier block
+ *
+ * The notifier is called with %TEGRA_PMC_POWERGATE_POWER_OFF and a pointer to
+ * the partition ID (unsigned int) as data before a partition is powered off,
+ * from a context that may sleep. The PMC's partition locks are held, so the
+ * notifier must not call back into the PMC to control partitions or register
+ * notifiers. Its return value is ignored. It is also called for every partition
+ * that is already powered off before this function returns, so a partition is
+ * either still powered once the function returns or the notifier has been
+ * called for it. A partition that is kept powered on (tegra_pmc.vde_always_on)
+ * is never reported, as the driver powers it on when it registers it.
+ *
+ * This works before the PMC driver has probed, as the PMC is set up early on
+ * 32-bit ARM, so it covers the partitions that the driver powers off when it
+ * registers them.
+ */
+int tegra_pmc_powergate_register_notifier(struct notifier_block *nb)
+{
+	unsigned int id;
+	int err;
+
+	mutex_lock(&tegra_powergate_nh_lock);
+
+	err = raw_notifier_chain_register(&tegra_powergate_nh, nb);
+	if (err)
+		goto unlock;
+
+	/* the base is switched to the driver's mapping under this lock */
+	mutex_lock(&early_pmc->powergates_lock);
+
+	if (early_pmc->base && early_pmc->soc) {
+		for (id = 0; id < early_pmc->soc->num_powergates; id++) {
+			/* powered on when the driver registers it */
+			if (tegra_powergate_is_always_on(id))
+				continue;
+
+			if (tegra_powergate_is_powered(early_pmc, id) == 0)
+				nb->notifier_call(nb,
+						  TEGRA_PMC_POWERGATE_POWER_OFF,
+						  &id);
+		}
+	}
+
+	mutex_unlock(&early_pmc->powergates_lock);
+
+unlock:
+	mutex_unlock(&tegra_powergate_nh_lock);
+
+	return err;
+}
+EXPORT_SYMBOL(tegra_pmc_powergate_register_notifier);
+
+/**
+ * tegra_pmc_powergate_unregister_notifier() - unregister a power off notifier
+ * @nb: notifier block registered with tegra_pmc_powergate_register_notifier()
+ */
+int tegra_pmc_powergate_unregister_notifier(struct notifier_block *nb)
+{
+	int err;
+
+	mutex_lock(&tegra_powergate_nh_lock);
+	err = raw_notifier_chain_unregister(&tegra_powergate_nh, nb);
+	mutex_unlock(&tegra_powergate_nh_lock);
+
+	return err;
+}
+EXPORT_SYMBOL(tegra_pmc_powergate_unregister_notifier);
+
 bool tegra_pmc_core_domain_state_synced(void)
 {
 	return early_pmc->core_domain_state_synced;
diff --git a/include/soc/tegra/pmc.h b/include/soc/tegra/pmc.h
index 53f6d02889dbd..c574a6e81a1ad 100644
--- a/include/soc/tegra/pmc.h
+++ b/include/soc/tegra/pmc.h
@@ -231,14 +231,33 @@ static inline void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
 #endif
 #endif
 
+/* event of the partition power off notifier, data points to the partition ID */
+#define TEGRA_PMC_POWERGATE_POWER_OFF	0
+
+struct notifier_block;
+
 #if defined(CONFIG_ARM) && defined(CONFIG_SOC_TEGRA_PMC)
 bool tegra_pmc_core_domain_state_synced(void);
+int tegra_pmc_powergate_register_notifier(struct notifier_block *nb);
+int tegra_pmc_powergate_unregister_notifier(struct notifier_block *nb);
 #else
 /* needed for COMPILE_TEST */
 static inline bool tegra_pmc_core_domain_state_synced(void)
 {
 	return false;
 }
+
+static inline int
+tegra_pmc_powergate_register_notifier(struct notifier_block *nb)
+{
+	return -ENOSYS;
+}
+
+static inline int
+tegra_pmc_powergate_unregister_notifier(struct notifier_block *nb)
+{
+	return -ENOSYS;
+}
 #endif
 
 #endif /* __SOC_TEGRA_PMC_H__ */

-- 
2.56.1

