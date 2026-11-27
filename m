Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795777004;
	b=QYJrCrGAqQxDRozyFqrQcV7j/0ugGoiOQj301PsJdbhCU97Lr2BGpXpPOgaG/2DXV7UC
	 qhvntgE1YpdWuQeuGO8ta/jRrb7pg9IG6Yyo0Fj3Cf8q/tadVOizFIBeDGNwX5rZoHcGo
	 7j9eWPPxT5HaoWWbrylhw+oQekoRJ8eY2EVbZtZ2yB0dZ3ApnwZGZVEPDo/HmB2u22hh0
	 PtTj6M4IkfvxnIt1cJ0J/inUzMlRATD22ENZsD5qvCvnyZFrRQbDsvDMfDwsinCKOs5Z3
	 saN5k+cN7RmXWud+delrWip4+V8O6lYIm0uHwMcud23zLXnh6GVY4eNFwafLl4DE6Vg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=C+G9MD1YETmf62awSsJnA8r3aF77m2xP9BdbBEqhs7Q=;
	b=TqlH84SEUwtgYTypfnyGyO7w2/HDi9cMOdBhjUpiWYE84CrYiCrGAxq9VMNb71R4Wkrq
	 P3mHsX/9l8toXyQQtWJ8QDM687DVHjBKmXQSopqol9GYB+oCDNdzB85Ld4ybb5BDAY+wE
	 vYqIpMtFg4Mo+tTPdSBwyjBJhMFo8D+dpIXAzRAdaLrOodgj/Q5r2XBeT1mlMHnQEtBlM
	 vMHfqtN//nv31sv9V6PaBy27B7Zfr0PrJ90M8IdsS2SMVR5TPqZr0aj0RQimHdfTfdbvh
	 JJFGcVi8poX3w6EGy/D4cB9ha5lNkHKiUXD/tKq5hkjyv6zOMPaYIWrfFO4qE81Og+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SA+3qEPS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F84606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1F84606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SA+3qEPS
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-4ad89c49e0dso2495591fac.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:56:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795777003; cv=none;
        d=google.com; s=arc-20260327;
        b=ayfFpzAjOiRX8morogV1UiuA6DqxTV8p14g2lCqLPO2w+TIuWLySm3e+OlFzSEpiBS
         QSLD1rzLKwt7HGYY1GKgkSPZLmrxkhE35pEamrWLHsEoeqTEQcewrO8fqSHsGDsjUr1B
         Vx5eZoIn6TqSNqF+nljrP/fFvSouLe2EnIpun1gtqcHz2CaswlYmhtKLo66olPQR312I
         n54Ojy7ZmgEVcPYsMHjpBeyk6FnKSw3M6qLpjA95Y9B8Paa6CFx0LdiqUg4wAFElWuAv
         8zY6U6ArdwgNMY9YXgdUOq/bMR4qPZijEn65G3jdBAj8mZL6mCDurfBv+18sFPSTCrFu
         0P+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=C+G9MD1YETmf62awSsJnA8r3aF77m2xP9BdbBEqhs7Q=;
        fh=/5NYF4bAcr7aVvFD4yrJs+lMNqpMj6hsNx2j2qYRBGc=;
        b=as4YDZPXcAiwHn96fqQjRpe+vVfzpvb2EIVwNElcd1okpDSyNCoHcaXfgMZVAFAOpZ
         mvZm8ZyJFdELPTJ8wk4fWZXezSH7l7dCfI+v65Jm0It60xACY2/r0ObXBmgEK0QTSboj
         xtm5fbnjmDwD8RAUXh5T38y6tM/z4/MP+4DxNQv1ctXHNj34LHn8FM/V1dTp4jVKHNhf
         AyU4c5CL9vALNNvyQkSpwLPdDo8N6q6HORodfsPFLPudOilTXDSOXpebjyq3IyoFPQMK
         C5R/GeNbKlaLES/rM+/X6TrURQpcwxXNa5LTFZ2HpFr8OUDAEDBzXwmoErWupyfBRRtl
         9G8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795777003; x=1796381803; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C+G9MD1YETmf62awSsJnA8r3aF77m2xP9BdbBEqhs7Q=;
        b=SA+3qEPSnsArNIrrfZSSnr6k90iPLdHMqPX+EaLNJl1+rMYZ3NbUoXwa90eFJKlp8+
         ptAEhVKlMTWcsz7NnW/WRwPJsYncN4+WCmoifhL2vANXvazfTvmDuNuiPZ5vWGzC/dYV
         9rJEl1XOevzQzS4s0NoMVN3XA/Xn9J6UaO2vW9iXODIWwsC/HlYy3imYT15hWjkLOslp
         1jLCuCPX/ssyBwQGkIxwCNw6JXqehdRbo5Avr4Ukvie/sEcBD/os9QCrH9UDPbNzxELH
         YTygYXxSS/Y2wr6LKGt3nJqlA6O5WceG9Eo6F0e4YQx55w8cUXGhwEtBzR82RdBz6rcF
         kaQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795777003; x=1796381803;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C+G9MD1YETmf62awSsJnA8r3aF77m2xP9BdbBEqhs7Q=;
        b=I+pznp4r2jpueQPT4HH8Y33qK4ISObapWapFJwErvsjFpNaSW6/ZQ5SvANM6wjNg2U
         vqQ8+Fun2MLc+9LLnT622YXJasXy7bC3R4pUe5eSYMc/o7QKMY+bD2jORRC8kXV7mAof
         n9VMu60mOVxK6J0bCtmerNwol+cu+ySSEs4yLQJKbtfpdmBfzUv8xTSrBtMiV5R25XoZ
         KHT8PxOZyUycrrH+bcYEaaMV9ldoM/ZImO+e6ofuT9Vt8mszt1Zxap+fb801uoiEPzNf
         keCLu7dacZUA7YAoxXnDgyTdu6c6lRicgYnwKHIjDnIK+A12UcvalKjms2v2xzPQ+3sp
         UcXQ==
X-Forwarded-Encrypted: i=1; AL+hErEKWaPVUX2y0uZZYAt2Z7UByKvajWUOcRC+PGGik4XU9tzdh0jW15FVYm8gU9vtMN4As+eR9tvZuNrFuLI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TDSoe2d/qyaScNzbSg1P0FURvLPnqiSrBU+0YsvdfTldJkoSh
	Sm2Vne3QH7UVUlTj9ROoBRA8TIrSAIKZmhr/3KsD4X4LDtuSN/FQ25xg0cJSPFuGhZyTuPXQhE/
	Y6mPWmBelnltJg1M0hemLysvCb8GkhG8=
X-Gm-Gg: AZFdTZcc6nT/VkLiM7TjUcw+ZYNBhw6/UhaZJYC0uzQCbUvfdyEfRVO20wwtNz/5STM
	P54FY4AdBM2p71+TCwDGt1KurVq54P3S7Y8L5s/hMYNA9/4dK63BfBB2Hk8RRVgdMF9wlcnshCs
	bw22ArF8w7AvwqLqw+/k2KeU601HJjxpcDVg6DdA7H0qn0YFN1of6kdYQVv1IbrHWcT/ggcIMA3
	0ogcN0Ef6RDYMsh4oyzP8i2x7n34srHAq4tCtu2FLmaCcU75yoVt+bnpgvs5jEa0pjD0ktT9Ag+
	YvADEALCTtpRkwA9gtCQRMA/yeFCfcBklnVZFmlzGvc4jb8S3wXwh1oBT/sCrrlqVN5UJ5ta8SP
	xvP9xSKyig0ADzMYH7C0ur6Cy8ZRignkXCQIEJLijH3q6iHTkG2p6lj2K/um/f4arFw==
X-Received: by 2002:a05:6808:6d92:b0:574:93c0:5aea with SMTP id
 5614622812f47-57a0c6c050dmr21770536b6e.63.1795777002704; Fri, 27 Nov 2026
 02:56:42 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 27 Nov 2026 05:56:42 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Lee Youngjoon <getfeus@gmail.com>
Date: Fri, 27 Nov 2026 05:56:42 -0500
X-Gm-Features: Aa3M54rDmdf4zHHYDtRAD-zOujdJiLrziVZuYZztEqHqEQISApJqxYvgDcdWXNI
Message-ID: <CA+m4KrDVNkHhqJhRVv7NRWhStNq8ZW+BfyAme6ZZrN-gqr9Q7g@mail.gmail.com>
Subject: [PATCH v2] cpuidle: psci: Skip Gaokun3 cluster power-down in s2idle
To: ulfh@kernel.org
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, christian.loehle@arm.com, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The Huawei MateBook E Go (Gaokun3) fails to resume from s2idle when
the SC8280XP cluster idle state (0x4100c344) is available. Keep the
cluster idle state in the Device Tree so its runtime idle governor
and the RPMh next-wakeup lookup retain the existing configuration.

For the Gaokun3 cluster domain, wrap the system power-down decision
and reject the cluster transition during s2idle. Leave the runtime
power-down callback and per-CPU idle states intact.

On a GK-W7X running firmware 2.18, the candidate booted with the
original cluster idle state in DT and resumed in the same boot after
159 seconds of s2idle using the power button and no RTC alarm. The
cluster genpd counters showed 510 runtime uses and zero s2idle uses.
The test kernel also carried a separate RPMh KTIME_MAX guard.

Link: https://lore.kernel.org/r/CA+m4KrB1p2u_y92phm-xpn3up=kebi1OmiVc3X4CCdFzHT9-5Q@mail.gmail.com
Signed-off-by: Lee Youngjoon <getfeus@gmail.com>
---
Changes in v2:
- Keep the DT state and runtime governor in place.
- Limit the workaround to the system governor's s2idle decision.

--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -9,6 +9,7 @@

 #define pr_fmt(fmt) "CPUidle PSCI: " fmt

+#include <linux/suspend.h>
 #include <linux/cpu.h>
 #include <linux/device.h>
 #include <linux/kernel.h>
@@ -41,6 +42,20 @@
 	return 0;
 }

+/*
+ * The Gaokun3 cluster state fails to resume from s2idle. Keep the
+ * normal governor for runtime idle and reject only s2idle power-down.
+ */
+static bool gaokun3_cluster_system_power_down_ok(struct dev_pm_domain *pd)
+{
+	if (pm_suspend_target_state == PM_SUSPEND_TO_IDLE)
+		return false;
+
+	return pm_domain_cpu_gov.system_power_down_ok(pd);
+}
+
+static struct dev_power_governor gaokun3_cluster_gov;
+
 static int psci_pd_init(struct device_node *np, bool use_osi)
 {
 	struct generic_pm_domain *pd;
@@ -71,6 +86,13 @@

 	/* Use governor for CPU PM domains if it has some states to manage. */
 	pd_gov = pd->states ? &pm_domain_cpu_gov : NULL;
+	if (pd_gov && of_machine_is_compatible("huawei,gaokun3") &&
+	    of_node_name_eq(np, "power-domain-cpu-cluster0")) {
+		gaokun3_cluster_gov = pm_domain_cpu_gov;
+		gaokun3_cluster_gov.system_power_down_ok =
+			gaokun3_cluster_system_power_down_ok;
+		pd_gov = &gaokun3_cluster_gov;
+	}

 	ret = pm_genpd_init(pd, pd_gov, use_osi);
 	if (ret)
