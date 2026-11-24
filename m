Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554385;
	b=0wXnT8GzzR2H/F7KlxtBnA/a6pVeeow6kidSh37RI+0juaAQen5Nb+c/8jaoSD2E0Je+
	 9FHAvynW4Y22kcl/P1DAJ2Jn6f7OCcAGJ8Ae9g1WTOyiO7rNz3TtcybNWVBvhH3h0CRYA
	 IcJ86Vmc5gjNUjPUAATRTAVmaA7hBXFKevFbAbah7ROVyawGEmzGgjc+I4m2zypw9kX+c
	 uWK71IXixr5FRJ9fBchhGt/u22gcBmCyb5BiThi3kX1a9rt8mCT1CN8wRRytYI0+tdnzB
	 qo7dRpx/Fdysn3dqKURjSKbNgljdgmmwxzlemqtba3mXMnTqdxoU/pdUDiqtJofTG0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=mwwyg1wadSz/IGArbbVIMcgSOkUHtQo++G3SrtkcA/E=;
	b=c7RKtZbrgtD9VWA+gA3/AZ21gfo3bDPeIQLhiucZ3/7Um/XkUjyPF7kZ7vbM6TbQuTpS
	 ASjuz3F8XNk/dW2hv2HgGU5teH6OYChxJUfQxT9Yes+d5kKOdUQpAJpm08KIi10wdZBOZ
	 oqB3HYVOQ/tK02bKHHOouxDV8hw2jS/2Kfes6FnYyixZGc+he732QmwAwISe7HLGXJCEp
	 6mtYCjmjTq1r/XmLCuTk4X03Q5q1aNa169cWSatIQQJALtLq3vDN3BcAq0mZ3+IQDQMVt
	 AiRNRAXMcEiP9mRkBSpMENSIEZXX9qFUKvWPJ2XKILN4s7lbYjLrrZIo+LIY9qLwjJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fqkTrU4n;
	arc=none smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650EC606A339
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 650EC606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fqkTrU4n
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c1a947b4adso4068920e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795554383; x=1796159183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mwwyg1wadSz/IGArbbVIMcgSOkUHtQo++G3SrtkcA/E=;
        b=fqkTrU4ny69e7tF0XWtdxeXgE0hs/VMk7P/hJq2x87A773A7q9BNLzevXjud+3ikPk
         RAyD4KJepcS3T/qEfPCYqswEy9t85mNYN1mw80IuxlJ0lqoEIgiRpbLEzxk+FFGuE71j
         xV+UzXmk6MZDPX7tDnBdQZFLq0AtKaClHPBiqrBcSbTePTMvkoFSfd/jTYoRtA+Q3tpZ
         t1riYQfDkNGWWhcYCB9Y4ImuSEOO5kwIN8NrhLXax4OLevrF6OffB3JfuEbS1zKd59aP
         Gprhz51IuE1BOE9nBIHRil26bx6N8CkyS3O76jTDZVMGXqzp/wsI6SqAVqcDcut3OQk0
         NKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554383; x=1796159183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mwwyg1wadSz/IGArbbVIMcgSOkUHtQo++G3SrtkcA/E=;
        b=wXQTbI1mTclt11ACgwbdcjGRedwy46PKGUhWVfEQMRQNvsGQnZKT1gmQ+Z50uqzk1i
         nTHDKgNseL2MUEL0knyBmFwDQ1jNjtwCNiL1G7WfDsGmlP+c2JUFik+cmKv+7aycVT+G
         pyht1qShEaEQZ27DbV3n0mA2kcMlTwGyCYMfV6xnV8ww4XRTFKmw5PtL42w4j8/AEhXF
         WVq6ScOGu4oOpYY1jehOcmNBjfTyGjakzAIXEada40waH1ndal1KT6KhF2fFnvbINc09
         GRTbseHWMcbgf7yTXJ20syEI83tvB6bjAR3frC/YtA1ZuyVqZresCy51NpIAhBSh7kCA
         O/5w==
X-Gm-Message-State: APuU4Z91TbCAHx/wI5kgHHoNs1xBF5cxM5CZ//wzlEbg0BVeEsa1lW0I
	B2LtzZ6S+DhSIqhQHGDn5IJhJrQT7d7pJ0Y0i3272kfYkdA0j6a0iA89
X-Gm-Gg: AZFdTZdLh2oXmIjjdproEEIvBEArFnVLvl1PoFQTa4kICJGB6ZfSadS1POLzAgVPLXe
	KdEGrBHTb0d75q5SbcpbR4K05iBsQk/vlsYkv5KVa36uvbi/5i+zsl9L0vRmWz3sOVoa0qof9U1
	7nWHupfPgNkIqWHhF/q2JHXNu6UtX47T+2MqawkoAdW/KE2ib+8WaiLtWiQhk0cq3jovXGpN37G
	vMiiLwyHuWF0Q38os+ajhNfxEy5WSRAdE4kV/18BQS06EeSmnKeLdbZkT3MktGvtsL32wbtxg08
	gSDEKBCestCHjxrrQvszlNKz0sCvF0QpPorrD0fa3EYX1gs0j7zMzl2K9yg8j8SRcLWKz3Senvy
	HORrrXoTzR6lM1D+jTN9CsTXsf8p358DwcLbU6dXUwCYdMi6mIxmRC4jSnNT7INAyo6vjWsEEZi
	hJOrRTfblQcAFZcTBvYrmJYkTM36Xf6dC22VeBPwQDHwz/oPF0CQfEv37o6leW5rT7N9L0Z5yCP
	eGglA7gEK2mMAp2uXm2CPCRChN6f10lDFVgRdDul7kv9fH0Y8iLDPjFH+Oaf16+wj7ccDNcf/KO
	6HTstnrUIv1yyxOlLalikB4CjvlY2twyN4HVeiZJ
X-Received: by 2002:a05:6512:304e:b0:5c1:4bbc:45cf with SMTP id 2adb3069b0e04-5c1bc8a5cf6mr4939287e87.48.1795554382454;
        Tue, 24 Nov 2026 13:06:22 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd041813sm4099045e87.53.2026.11.24.13.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:06:21 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Date: Tue, 24 Nov 2026 22:06:02 +0100
Subject: [PATCH v2 4/6] soc/tegra: pmc: Add an option to keep the VDE
 partition on
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
Message-Id: <20261124-t20-for-upstream-v2-4-440116846f97@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6250;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=8aQIWKsuUD75ETq/pPpdqwmEzRuqAG5ipSwE5lLUaJI=;
 b=owGbwMvMwCVmYeTc/TaVxZzxtFoSQzbrHycB/WsHsnlW719omFOcHeO7YP8xK/bLOl3rLuyfZ
 tgf/Iipo5SFQYyLQVZMkcXsodAXnnle7ze83NoJM4eVCWQIAxenAExkwVqGv8JHcqO/WJ92fzfl
 wPz1SjFs0XESampsyz/J3NJimZH60oWR4VrR89eSaz+3uSi0qDGLJVlU557/5Lhq9QKT1K95D40
 b+AA=
X-Developer-Key: i=arturkow2000@gmail.com; a=openpgp;
 fpr=F60710C8D69E03A01A2801CD87A47D20C2709637

After a warm reset, which doesn't reset the PMC, Tegra20's boot ROM
hangs if the VDE partition is powered off. The driver powers the
partition off when it registers it, and genpd powers it off whenever
the VDE is idle. The VDE driver powers it on again when the system
shuts down, since commit 8f0c714ad9be ("media: staging: tegra-vde: Turn
ON power domain on shutdown"), which covers regular reboots. A watchdog
reset doesn't go through the shutdown, so it still hangs the system
instead of rebooting it.

Add the vde_always_on module parameter, which keeps the partition
powered on, at the cost of its idle power. It only applies to Tegra20,
as later SoCs aren't affected. It's a parameter rather than a device
tree property, as trading the idle power for working watchdog resets is
a policy choice, not a description of the hardware. Instead of powering
the partition off when registering it, the driver runs the power up
sequence on it, which puts its clocks, resets and clamps into the same
known state without cutting its power, and registers its genpd as always
on. tegra_powergate_set() also doesn't power it off, which covers the
legacy power gating API.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 12 ++++++
 drivers/soc/tegra/pmc.c                         | 55 +++++++++++++++++++++++--
 2 files changed, 63 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index dce9b8f3ae980..7cf080d4c3310 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7567,6 +7567,18 @@ Kernel parameters
 
 	tdfx=		[HW,DRM]
 
+	tegra_pmc.vde_always_on=
+			[HW,ARM] Tegra20 only. Never power off the VDE power
+			partition. After a warm reset, which doesn't reset
+			the PMC, the boot ROM of Tegra20 hangs if the
+			partition is off. The VDE driver powers it on when
+			the system shuts down for a regular reboot, but a
+			watchdog reset doesn't go through the shutdown and
+			hangs. Keeping the partition on makes watchdog resets
+			work, at the cost of its idle power.
+			Format: <bool>
+			Default: false
+
 	test_suspend=	[SUSPEND]
 			Format: { "mem" | "standby" | "freeze" }[,N]
 			Specify "mem" (for Suspend-to-RAM) or "standby" (for
diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 721e9596b07d0..abef3fed637ff 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -522,6 +522,29 @@ static struct tegra_pmc *early_pmc = &(struct tegra_pmc) {
 };
 #endif
 
+#ifdef MODULE_PARAM_PREFIX
+#undef MODULE_PARAM_PREFIX
+#endif
+#define MODULE_PARAM_PREFIX "tegra_pmc."
+
+/*
+ * After a warm reset, which doesn't reset the PMC, Tegra20's boot ROM hangs if
+ * the VDE partition is powered off. The VDE driver powers it on at shutdown,
+ * but a watchdog reset doesn't go through the shutdown and hangs. Keeping the
+ * partition powered on makes watchdog resets work, at the cost of its idle
+ * power. Later SoCs aren't affected, so this only applies to Tegra20.
+ */
+static bool vde_always_on;
+module_param(vde_always_on, bool, 0444);
+MODULE_PARM_DESC(vde_always_on,
+		 "Tegra20: never power off the VDE partition (default: false)");
+
+static bool tegra_powergate_is_always_on(unsigned int id)
+{
+	return vde_always_on && tegra_get_chip_id() == TEGRA20 &&
+	       id == TEGRA_POWERGATE_VDEC;
+}
+
 static inline struct tegra_powergate *
 to_powergate(struct generic_pm_domain *domain)
 {
@@ -697,6 +720,10 @@ static int tegra_powergate_set(struct tegra_pmc *pmc, unsigned int id,
 	if (id == TEGRA_POWERGATE_3D && pmc->soc->has_gpu_clamps)
 		return -EINVAL;
 
+	/* the partition is kept powered, also against the legacy API */
+	if (!new_state && tegra_powergate_is_always_on(id))
+		return 0;
+
 	mutex_lock(&pmc->powergates_lock);
 
 	if (tegra_powergate_state(pmc, id) == new_state) {
@@ -1319,6 +1346,7 @@ static int tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
 	struct device *dev = pmc->dev;
 	struct tegra_powergate *pg;
 	int id, err = 0;
+	bool always_on;
 	bool off;
 
 	pg = kzalloc_obj(*pg);
@@ -1346,6 +1374,7 @@ static int tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
 	pg->pmc = pmc;
 
 	off = !tegra_powergate_is_powered(pmc, pg->id);
+	always_on = tegra_powergate_is_always_on(pg->id);
 
 	err = tegra_powergate_of_get_clks(pg, np);
 	if (err < 0) {
@@ -1363,9 +1392,20 @@ static int tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
 	 * If the power-domain is off, then ensure the resets are asserted.
 	 * If the power-domain is on, then power down to ensure that when is
 	 * it turned on the power-domain, clocks and resets are all in the
-	 * expected state.
+	 * expected state. A power-domain that is kept on is powered up instead,
+	 * which puts it into the same state without powering it off.
 	 */
-	if (off) {
+	if (always_on) {
+		err = tegra_powergate_power_up(pg, true);
+		if (err) {
+			dev_err(dev, "failed to turn on PM domain %s: %d\n",
+				pg->genpd.name, err);
+			goto remove_resets;
+		}
+
+		dev_info(dev, "keeping PM domain %s powered on\n",
+			 pg->genpd.name);
+	} else if (off) {
 		err = reset_control_assert(pg->reset);
 		if (err) {
 			pr_err("failed to assert resets: %d\n", err);
@@ -1385,11 +1425,18 @@ static int tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
 	 * the domain and skip the genpd registration.
 	 */
 	if (!IS_ENABLED(CONFIG_PM_GENERIC_DOMAINS)) {
-		WARN_ON(tegra_powergate_power_up(pg, true));
+		if (!always_on)
+			WARN_ON(tegra_powergate_power_up(pg, true));
 		goto remove_resets;
 	}
 
-	err = pm_genpd_init(&pg->genpd, NULL, true);
+	if (always_on) {
+		/* as tegra_genpd_power_on() does after powering up */
+		reset_control_release(pg->reset);
+		pg->genpd.flags |= GENPD_FLAG_ALWAYS_ON;
+	}
+
+	err = pm_genpd_init(&pg->genpd, NULL, !always_on);
 	if (err < 0) {
 		dev_err(dev, "failed to initialise PM domain %pOFn: %d\n", np,
 		       err);

-- 
2.56.1

