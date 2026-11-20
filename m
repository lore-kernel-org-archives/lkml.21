Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795212841;
	b=vsisZrUhxP4NtTaXlX22eiGpYU74qiCsEnVpPaL8lbQsl1O8GJxXns2rmGipsbPNxQhf
	 oQZtftwb6vV8x3N6dpuCfpuI5ojENV1mBMs6MowxvwQwiDP+JuHI9OVn1ntO3bVbT0IDI
	 O0S5lqwi+qh30Hxw8DdxdD8p5aACS1jEupkiYP1a+dQJCZQLXQU7B9V3Hllz03LdFl/xd
	 527IgjFYkIIW1lQL6Hpcw3XChiIaTrLrm1HtKK3OhCakm62EbuFzdp2SzV6L3gBCmR2p5
	 D9Jw1SGQcqhdWIEJJ5r8gFK7y5Kb/XstbVG82MYBZ5XsCUd0WEprxn08ki7iDagpZsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795212841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=VstbANpJzGmmJC7LhvRbkS5fgmk2WrM9lQ7Ho0E2PCY=;
	b=G6VsmDuKj95c2WtuiC2tHurALl67azKcI9zbmXVMS9mKXXQ3zqHR0w7FSu8KpinDSGgI
	 FXrp4ygQ8AtDpYJy2LLsrKT/V6/VDrFBkL9J3QLJTqzFBWSlpDNB6TgNop12KPVfkzsYr
	 Exc51tmc+52rosUJBzvruNVhfN9m7dwcyXs6fVGyRaanw7Az9H4qD4amw6FLn2NTjWtd0
	 OM9l5e/PxtXsmcd9F+99W5kD85wAdSDcLDfxUSfy9Srkk4Zbx8vIMI58iYk9skLyBKPax
	 ZnyNLYSJcdL2vDVV3edhQ01OWG4VeCUyelnsCWH/dvlySb/SFraBdp1xopNi6Zo6g1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=E0iXOWMJ;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0F7606A6B3
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E0F7606A6B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=E0iXOWMJ
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b53bfc9534so398052c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795212838; x=1795817638; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VstbANpJzGmmJC7LhvRbkS5fgmk2WrM9lQ7Ho0E2PCY=;
        b=E0iXOWMJ1GZygeDzXydDm970/AMkl832gVrnoR943d01zPzeykbgLk2GE6euotbBEq
         Ak9dQ7uhuYCqJtD07fG3fMi2aWmwRpRfTKA8L1R8zLZ9ncZwXfmBNNVc9S8dDDIjcE/f
         YBYfwO/X0KQACEl1unyVcl9R7+eMQ6XLWbClhFqcOolLZ0Vh13JTZ8FygCvWZNUqrcCH
         vWHuk3q6j+feuSD13EMxPUWmLVLVrE+V+ehx3G4PmU0mJQSogJqAaJQwXHZ66B7tAKYO
         ubr8hmCFVQ/5ZQYdyjAoWr2OiOVmKnuUIsqlrnmimrQQOEfINftKc+/LoCQ4hSF8GccZ
         5r3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795212838; x=1795817638;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VstbANpJzGmmJC7LhvRbkS5fgmk2WrM9lQ7Ho0E2PCY=;
        b=aVyhH1Tyl0u+sIDCE9LkCfx7Jl9U2gU104g/DQBVtVb/3q05q2f+qjsPGaIKv0bNi2
         ADKPphA79eC5+Toebuo2z9WeDtF6N11GW+tOBwTuW+bRB63Jh7JkN2lskFSFTb6BCQoQ
         cWbrJROYBK7B8N4NplZQa7z94QbEMP1Dr2srD60+cPeC9I1tozzqJ2zPE6MdEr0AAobV
         e4cv++JV2BO1fZs+wJ77lHpheaITVqFDYVAAd55LIWhnqYhoM7MzbP5400SXunr74iS+
         HtQF943jPYnsRSsbMAbhgQJlxZGDpnKH6jEvXl6cVNgYrpJ2T3G8FQoyMzZq3vD5cSbs
         /8Kw==
X-Forwarded-Encrypted: i=1; AL+hErES3Yr1uxMA5H/quidlx6yeqe2hc8rPEQiwOCUihzcT8jNUtrBknBB/x8mV1cNTSgwfJ5IyUzHDJkdkZz0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9a++BXWcP6ypwOwAem9L4ELu1LSdEZVgw4ir1ZEEAWvEGMlV4y
	a35Y35KXypgXBaMQb+17woeSuahUgABk2aijcP+zEkjfjQmXUMr9mcmxX8ZzLQDEVeAjf4SZjNI
	6NAFVti3CYg==
X-Received: from dleb16-n2.prod.google.com ([2002:a05:701b:4250:20b0:1ac:2245:a27b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ea8c:b0:154:fa0b:6df1
 with SMTP id a92af1059eb24-1b5568e1559mr4071055c88.37.1795212837609; Fri, 20
 Nov 2026 14:13:57 -0800 (PST)
Date: Fri, 20 Nov 2026 14:13:06 -0800
In-Reply-To: <20261120221332.2245191-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261120221332.2245191-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120221332.2245191-6-irogers@google.com>
Subject: [PATCH v3 05/30] perf env: Make lazy perf_env initialization thread-safe
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Guard lazy initialization of kernel_is_64_bit, nr_cpus_avail, e_machine,
cpuid, nr_pmu_mappings, pmu_mappings, and numa_map in struct perf_env
with env->lock, and use DO_ONCE() to initialize the cached host utsname
structure. This prevents data races when multiple threads concurrently
query a shared struct perf_env.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/env.c     | 178 +++++++++++++++++++++++++-------------
 tools/perf/util/session.c |  15 +++-
 2 files changed, 131 insertions(+), 62 deletions(-)

diff --git a/tools/perf/util/env.c b/tools/perf/util/env.c
index 50993b0dedc5..4ab46ca6b4ef 100644
--- a/tools/perf/util/env.c
+++ b/tools/perf/util/env.c
@@ -313,18 +313,17 @@ void perf_env__init(struct perf_env *env)
 	mutex_init(&env->lock);
 }
 
-static void perf_env__init_kernel_mode(struct perf_env *env)
+static const char *uts_machine(void)
 {
-	const char *arch = env->arch;
+	static struct utsname uts;
 
-	if (!arch) {
-		static struct utsname uts = { .machine[0] = '\0', };
+	DO_ONCE(uname, &uts);
+	return uts.machine[0] != '\0' ? uts.machine : NULL;
+}
 
-		if (uts.machine[0] == '\0')
-			uname(&uts);
-		if (uts.machine[0] != '\0')
-			arch = uts.machine;
-	}
+static void perf_env__init_kernel_mode(struct perf_env *env)
+{
+	const char *arch = env->arch ?: uts_machine();
 
 	if (arch) {
 		if (strstr(arch, "64") || strstr(arch, "s390x"))
@@ -340,10 +339,15 @@ static void perf_env__init_kernel_mode(struct perf_env *env)
 
 int perf_env__kernel_is_64_bit(struct perf_env *env)
 {
+	int is_64_bit;
+
+	mutex_lock(&env->lock);
 	if (env->kernel_is_64_bit == -1)
 		perf_env__init_kernel_mode(env);
+	is_64_bit = env->kernel_is_64_bit;
+	mutex_unlock(&env->lock);
 
-	return env->kernel_is_64_bit;
+	return is_64_bit;
 }
 
 bool perf_arch_is_big_endian(const char *arch)
@@ -474,7 +478,6 @@ int perf_env__read_pmu_mappings(struct perf_env *env)
 		pr_debug("pmu mappings not available\n");
 		return -ENOENT;
 	}
-	env->nr_pmu_mappings = pmu_num;
 
 	if (strbuf_init(&sb, 128 * pmu_num) < 0)
 		return -ENOMEM;
@@ -488,6 +491,7 @@ int perf_env__read_pmu_mappings(struct perf_env *env)
 	}
 
 	env->pmu_mappings = strbuf_detach(&sb, NULL);
+	env->nr_pmu_mappings = pmu_num;
 
 	return 0;
 
@@ -632,7 +636,17 @@ int perf_env__read_core_pmu_caps(struct perf_env *env)
 
 int perf_env__nr_cpus_avail(struct perf_env *env)
 {
-	return env && !perf_env__read_nr_cpus_avail(env) ? env->nr_cpus_avail : 0;
+	int nr_cpus = 0;
+
+	if (!env)
+		return 0;
+
+	mutex_lock(&env->lock);
+	if (!perf_env__read_nr_cpus_avail(env))
+		nr_cpus = env->nr_cpus_avail;
+	mutex_unlock(&env->lock);
+
+	return nr_cpus;
 }
 
 void cpu_cache_level__free(struct cpu_cache_level *cache)
@@ -780,7 +794,7 @@ static const char *e_machine_to_perf_arch(uint16_t e_machine)
 	return "unknown";
 }
 
-uint16_t perf_env__e_machine_nocache(struct perf_env *env, uint32_t *e_flags)
+static uint16_t __perf_env__e_machine_nocache(struct perf_env *env, uint32_t *e_flags)
 {
 	uint16_t e_machine = EM_NONE;
 	const char *arch = NULL;
@@ -794,14 +808,8 @@ uint16_t perf_env__e_machine_nocache(struct perf_env *env, uint32_t *e_flags)
 		is_64_bit = env->kernel_is_64_bit;
 	}
 
-	if (!arch) {
-		static struct utsname uts = { .machine[0] = '\0', };
-
-		if (uts.machine[0] == '\0')
-			uname(&uts);
-		if (uts.machine[0] != '\0')
-			arch = uts.machine;
-	}
+	if (!arch)
+		arch = uts_machine();
 
 	e_machine = perf_arch_to_e_machine(arch, is_64_bit);
 
@@ -811,18 +819,37 @@ uint16_t perf_env__e_machine_nocache(struct perf_env *env, uint32_t *e_flags)
 	return e_machine;
 }
 
+uint16_t perf_env__e_machine_nocache(struct perf_env *env, uint32_t *e_flags)
+{
+	uint16_t e_machine;
+
+	if (!env)
+		return __perf_env__e_machine_nocache(NULL, e_flags);
+
+	mutex_lock(&env->lock);
+	e_machine = __perf_env__e_machine_nocache(env, e_flags);
+	mutex_unlock(&env->lock);
+
+	return e_machine;
+}
+
 uint16_t perf_env__e_machine(struct perf_env *env, uint32_t *e_flags)
 {
 	uint16_t e_machine;
 	uint32_t local_e_flags = 0;
 
-	if (env && env->e_machine != EM_NONE) {
+	if (!env)
+		return __perf_env__e_machine_nocache(NULL, e_flags);
+
+	mutex_lock(&env->lock);
+	if (env->e_machine != EM_NONE) {
 		if (e_flags)
 			*e_flags = env->e_flags;
-
-		return env->e_machine;
+		e_machine = env->e_machine;
+		mutex_unlock(&env->lock);
+		return e_machine;
 	}
-	e_machine = perf_env__e_machine_nocache(env, &local_e_flags);
+	e_machine = __perf_env__e_machine_nocache(env, &local_e_flags);
 	/*
 	 * Only cache the e_machine in perf_env if env->arch is not NULL.
 	 * If env->arch is NULL, the e_machine is just a fallback to EM_HOST.
@@ -830,10 +857,12 @@ uint16_t perf_env__e_machine(struct perf_env *env, uint32_t *e_flags)
 	 * thread-based session e_machine scanning later in
 	 * perf_session__e_machine().
 	 */
-	if (env && env->arch) {
+	if (env->arch) {
 		env->e_machine = e_machine;
 		env->e_flags = local_e_flags;
 	}
+	mutex_unlock(&env->lock);
+
 	if (e_flags)
 		*e_flags = local_e_flags;
 
@@ -846,13 +875,11 @@ const char *perf_env__arch(struct perf_env *env)
 	const char *arch;
 
 	if (!env) {
-		static struct utsname uts = { .machine[0] = '\0', };
-		uint16_t host_e_machine;
+		const char *host_arch = uts_machine();
+
+		if (host_arch) {
+			uint16_t host_e_machine = perf_arch_to_e_machine(host_arch, -1);
 
-		if (uts.machine[0] == '\0')
-			uname(&uts);
-		if (uts.machine[0] != '\0') {
-			host_e_machine = perf_arch_to_e_machine(uts.machine, -1);
 			return e_machine_to_perf_arch(host_e_machine);
 		}
 		return e_machine_to_perf_arch(EM_HOST);
@@ -884,45 +911,60 @@ const char *perf_env__arch_strerrno(uint16_t e_machine, int err)
 
 const char *perf_env__cpuid(struct perf_env *env)
 {
-	int status;
+	const char *cpuid;
 
+	mutex_lock(&env->lock);
 	if (!env->cpuid) { /* Assume local operation */
-		status = perf_env__read_cpuid(env);
-		if (status)
+		if (perf_env__read_cpuid(env)) {
+			mutex_unlock(&env->lock);
 			return NULL;
+		}
 	}
+	cpuid = env->cpuid;
+	mutex_unlock(&env->lock);
 
-	return env->cpuid;
+	return cpuid;
 }
 
 int perf_env__nr_pmu_mappings(struct perf_env *env)
 {
-	int status;
+	int nr;
 
+	mutex_lock(&env->lock);
 	if (!env->nr_pmu_mappings) { /* Assume local operation */
-		status = perf_env__read_pmu_mappings(env);
-		if (status)
+		if (perf_env__read_pmu_mappings(env)) {
+			mutex_unlock(&env->lock);
 			return 0;
+		}
 	}
+	nr = env->nr_pmu_mappings;
+	mutex_unlock(&env->lock);
 
-	return env->nr_pmu_mappings;
+	return nr;
 }
 
 const char *perf_env__pmu_mappings(struct perf_env *env)
 {
-	int status;
+	const char *mappings;
 
+	mutex_lock(&env->lock);
 	if (!env->pmu_mappings) { /* Assume local operation */
-		status = perf_env__read_pmu_mappings(env);
-		if (status)
+		if (perf_env__read_pmu_mappings(env)) {
+			mutex_unlock(&env->lock);
 			return NULL;
+		}
 	}
+	mappings = env->pmu_mappings;
+	mutex_unlock(&env->lock);
 
-	return env->pmu_mappings;
+	return mappings;
 }
 
 int perf_env__numa_node(struct perf_env *env, struct perf_cpu cpu)
 {
+	int node;
+
+	mutex_lock(&env->lock);
 	if (!env->nr_numa_map) {
 		struct numa_node *nn;
 		int i, nr = 0;
@@ -939,8 +981,10 @@ int perf_env__numa_node(struct perf_env *env, struct perf_cpu cpu)
 		 * it for missing cpus, which return node -1
 		 */
 		env->numa_map = malloc(nr * sizeof(int));
-		if (!env->numa_map)
+		if (!env->numa_map) {
+			mutex_unlock(&env->lock);
 			return -1;
+		}
 
 		for (i = 0; i < nr; i++)
 			env->numa_map[i] = -1;
@@ -957,25 +1001,37 @@ int perf_env__numa_node(struct perf_env *env, struct perf_cpu cpu)
 		}
 	}
 
-	return cpu.cpu >= 0 && cpu.cpu < env->nr_numa_map ? env->numa_map[cpu.cpu] : -1;
+	node = cpu.cpu >= 0 && cpu.cpu < env->nr_numa_map ? env->numa_map[cpu.cpu] : -1;
+	mutex_unlock(&env->lock);
+
+	return node;
 }
 
 bool perf_env__has_pmu_mapping(struct perf_env *env, const char *pmu_name)
 {
-	char *pmu_mapping = env->pmu_mappings, *colon;
+	char *pmu_mapping, *colon;
+	bool ret = false;
+
+	mutex_lock(&env->lock);
+	pmu_mapping = env->pmu_mappings;
+	if (!pmu_mapping)
+		goto out_unlock;
 
 	for (int i = 0; i < env->nr_pmu_mappings; ++i) {
 		if (strtoul(pmu_mapping, &colon, 0) == ULONG_MAX || *colon != ':')
-			goto out_error;
+			goto out_unlock;
 
 		pmu_mapping = colon + 1;
-		if (strcmp(pmu_mapping, pmu_name) == 0)
-			return true;
+		if (strcmp(pmu_mapping, pmu_name) == 0) {
+			ret = true;
+			break;
+		}
 
 		pmu_mapping += strlen(pmu_mapping) + 1;
 	}
-out_error:
-	return false;
+out_unlock:
+	mutex_unlock(&env->lock);
+	return ret;
 }
 
 char *perf_env__find_pmu_cap(struct perf_env *env, const char *pmu_name,
@@ -1043,12 +1099,13 @@ void perf_env__find_br_cntr_info(struct perf_env *env,
 
 bool perf_env__is_x86_amd_cpu(struct perf_env *env)
 {
-	static int is_amd; /* 0: Uninitialized, 1: Yes, -1: No */
+	bool is_amd;
 
-	if (is_amd == 0)
-		is_amd = env->cpuid && strstarts(env->cpuid, "AuthenticAMD") ? 1 : -1;
+	mutex_lock(&env->lock);
+	is_amd = env->cpuid && strstarts(env->cpuid, "AuthenticAMD");
+	mutex_unlock(&env->lock);
 
-	return is_amd >= 1 ? true : false;
+	return is_amd;
 }
 
 bool x86__is_amd_cpu(void)
@@ -1066,12 +1123,13 @@ bool x86__is_amd_cpu(void)
 
 bool perf_env__is_x86_intel_cpu(struct perf_env *env)
 {
-	static int is_intel; /* 0: Uninitialized, 1: Yes, -1: No */
+	bool is_intel;
 
-	if (is_intel == 0)
-		is_intel = env->cpuid && strstarts(env->cpuid, "GenuineIntel") ? 1 : -1;
+	mutex_lock(&env->lock);
+	is_intel = env->cpuid && strstarts(env->cpuid, "GenuineIntel");
+	mutex_unlock(&env->lock);
 
-	return is_intel >= 1 ? true : false;
+	return is_intel;
 }
 
 bool x86__is_intel_cpu(void)
diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
index a58b4fe44b62..51511f0c00e9 100644
--- a/tools/perf/util/session.c
+++ b/tools/perf/util/session.c
@@ -4235,8 +4235,17 @@ uint16_t perf_session__e_machine(struct perf_session *session, uint32_t *e_flags
 	 * more accurate threads.
 	 */
 	env = perf_session__env(session);
-	if (env && env->e_machine != EM_NONE)
-		return perf_env__e_machine(env, e_flags);
+	if (env) {
+		uint16_t e_machine;
+
+		mutex_lock(&env->lock);
+		e_machine = env->e_machine;
+		if (e_machine != EM_NONE && e_flags)
+			*e_flags = env->e_flags;
+		mutex_unlock(&env->lock);
+		if (e_machine != EM_NONE)
+			return e_machine;
+	}
 
 	/*
 	 * Compute from threads, note this is more accurate than
@@ -4249,8 +4258,10 @@ uint16_t perf_session__e_machine(struct perf_session *session, uint32_t *e_flags
 
 	if (args.e_machine != EM_NONE) {
 		if (env) {
+			mutex_lock(&env->lock);
 			env->e_machine = args.e_machine;
 			env->e_flags = args.e_flags;
+			mutex_unlock(&env->lock);
 		}
 		if (e_flags)
 			*e_flags = args.e_flags;
-- 
2.56.1.750.gf70dc682cf-goog

