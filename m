Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795671682;
	b=jElkTdCTfaW3TBj0XDeMWptlBAVFiHaFLlKcy7ewdziP6EWjn/Tds92ONzgPiDibIJEq
	 /10/7awKCrvdsc3dYcLXR/HllFdqCxqsquxvdNU7xQ90KwmjQ35DqiGjmecHo3IqMQ0WP
	 n+R61TaG2AKXyOxJ/VDsG9rvPboc7OR/Tll30uFKBphQZnV8/RBQQPPMm3qhSn7LBbO4c
	 WirT8VfRtbYAhTsLsBUu+8IQp7LEadX80J43ZHYFkZXN7JYFKyHnKv8Zig86KyRKc7oKO
	 xSN27RgJaIFUMR410yAu7khNeFdgejk5FWRyyETMmZ8jUFFtpfSyvXnTKznAIjsdV1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795671682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:In-Reply-To:References:From:Subject:To:Cc:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=aXkURdkuBYQdWWdqWRepiJVQhkxYqOLTa2nNf0PXwjc=;
	b=k3NETT8f8361A2Z2iSrvB23CsSixdKeqZXwVjODzX83XTlEkqGOIOepDQctMB5uB2kle
	 nECKMBaddegGIb3dlTLrQ3uuMWh167zRRAWoKloF4pK/yH8eGw2tiw/XGy7pPn5lr0PKA
	 yDQWVjx2LsAqxXxY2+F0T1VVPvrKMMj3e7NaT7hsaLpZF99d050wMoY/+PQs8VcvgMmyd
	 GZDOxs5AH4FQxZG24p0agB5xQjJ3t5u6I+E1WaFbUAkzdzNl33QEED+vpFy8E2gjAJ/Nl
	 GMJkY/ozGbkiHlZEw3QjhQWWGHH//W5JGVgHcramZi0cK2y+fpbbJl5w2AJcUz6YdGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=S2EbV8Cj;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E8B606A331
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2E8B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=S2EbV8Cj
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b4cd576f2aso49288227b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795671681; x=1796276481; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aXkURdkuBYQdWWdqWRepiJVQhkxYqOLTa2nNf0PXwjc=;
        b=S2EbV8Cjlbyw9JbXy2mD1LeCrIf1F5GFpCfgRh9I3HWQzDnGKDT0ldYUT8UNEtOvVe
         VK20hs/Qd6g8hf1AasqCC9MLdMqzXjn3Pg5sCdd0Ylo2bp//1RxAq9DzZXZEgqO49pcd
         dKnA2CQqn0HX0X+AqmfHFdqAYawtTEexYPBBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795671681; x=1796276481;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aXkURdkuBYQdWWdqWRepiJVQhkxYqOLTa2nNf0PXwjc=;
        b=ot5S7sNx94x88X3whmgtjBkh/lVUOOZlMcUFHiJZjxREkhy81z+xYWI9YOiPaP9tcG
         W1boZM6V8Lxqy+CZoF1LmmvcBeZiwPfCF3EGmKevpqc3IOAUg/a9Ya6LsKKXqB4iJc/n
         8SziJMAMeZ0EagY6scMeLZ65fBhgmC8f5xd2aP/B1P/ERewPKx06lZjKWuaZlO10pHTv
         ctt1T8rs3jw8cRbXp52NlEla4zT+pJwRSyVAXJJltqjBaf7tHCP7O9Njp610Ax3xSqy6
         KVoxJx9PMIWNv9Swdsa8zEUujbFI4SErRYdujc8056a/NveP0b1Ij7TSDl2xOJfqLH1x
         4QeA==
X-Forwarded-Encrypted: i=1; AL+hErHK43/OvA/fz/Rjtxllq+usjgPPBdVXvt52ib2898A0AO8t7OGofb9A8DFDqTcvD0Ucioiq88HDQz5kehY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8W1PNXsIkCIG/jVuqCY/uwkdcIYd/nixWP/Nowg7TgeMV4BabF
	RP4qhp6srzEMab9GiNSpgKDEIk6hPh+pkHC6OJReF4bD7f5PWQ0vkgJ39xhMq1ON51A=
X-Gm-Gg: AZFdTZegHMyEZUxtq5N+q45aFTiULmALWEhR4BruFkN4IBtPEppj9wHVC8NDRO71KVa
	bXjDIs7wvU88rXsRrM0QRIPIEim9ucsf5R/aZ46Vg4t/W87mcWS+YBWmX5qc3pFDKm2raFEv2CQ
	709fjGu3F1B28ugHcyeipuuFcVoG6xtCt0YT5iKG1vkiQc16hNkX8ljF400OpE3VxZMUcQqmbLe
	PM8F3tj/NekH2wvIqGs038HgiLcgMQ7qgdlCTh7pCJUPGq3p5mzJ+9q83fyhBcFKfaPomrIoEko
	hRrNhUCnbZGEYCpyv0HSspRiCUzCwedQJgfk7PewysBP/0yAem1R09piXt5CQOZXngP4RDX/Zln
	vJwZMsVdx4BxSz0PUPsHu/T9HMv8yyynSXXM9D7y61qOiT5RFQ8IMY41WcoCgIj6H0KshC2wu30
	4i6cyFN17b5kLMbf61goZK7PVlAbByAlPQxLmcUUwLUPnBJbFRf4LL9Yp/VUGqHV9ceH0refRbh
	K0XJMt+BIt1spiNzcOBbyR8ENz6wL2HwwQCVpeK1ltF3ea6bIlelOoUiLe2b9iNFpyTTIZQf4NE
	Yc2pEmAqt0ZhFTaLYE7I4jtDtwibLL7oSGMj+FmyF5zD80cWBRy2J9WM9RF2dKJDd9ScZcJDn0Z
	qjfu99y1+szD6LwTr1aFDcPXiYUcQGE8MyGQymggHX28I7fFukI0ZwdAxEGS+Y0wYMbGrNQh5fJ
	nimMwF4GYJI10YKhIOm4mqeE4Pf2RztbhzSg2wTs/TUhgFUfiirQCqL648vy9JEOKtzsia+NRnJ
	UqUYZgU1DDrAnHG/3EJ5o4=
X-Received: by 2002:a05:690c:799:b0:8b4:d584:6165 with SMTP id 00721157ae682-8b52043ff55mr84924517b3.21.1795671681052;
        Wed, 25 Nov 2026 21:41:21 -0800 (PST)
Received: from [172.20.0.2] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52030ff10sm79663677b3.33.2026.11.25.21.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:41:20 -0800 (PST)
Date: Wed, 25 Nov 2026 21:41:18 -0800
Message-ID: <dbdeffef59486589a893e2724546724b58443757.1795671629.git.chris@chrisdown.name>
In-Reply-To: <cover.1795671629.git.chris@chrisdown.name>
References: <cover.1795671629.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v3 2/2] selftests/cgroup: Test parsing of long fractions in
 cpu.uclamp.min
To: tj@kernel.org,
    hannes@cmpxchg.org,
    mkoutny@suse.com,
    shakeel.butt@linux.dev
Cc: cgroups@vger.kernel.org,
    linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Add a test to test_cpu that writes values to cpu.uclamp.min and reads
them back, checking that they are rounded to two decimal places and
that malformed or out of range values are rejected.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 tools/testing/selftests/cgroup/config     |  4 ++
 tools/testing/selftests/cgroup/test_cpu.c | 71 +++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/tools/testing/selftests/cgroup/config b/tools/testing/selftests/cgroup/config
index 39f979690dd3..c8b2c95a186e 100644
--- a/tools/testing/selftests/cgroup/config
+++ b/tools/testing/selftests/cgroup/config
@@ -2,5 +2,9 @@ CONFIG_CGROUPS=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CGROUP_SCHED=y
+CONFIG_CPU_FREQ=y
+CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
 CONFIG_MEMCG=y
 CONFIG_PAGE_COUNTER=y
+CONFIG_UCLAMP_TASK=y
+CONFIG_UCLAMP_TASK_GROUP=y
diff --git a/tools/testing/selftests/cgroup/test_cpu.c b/tools/testing/selftests/cgroup/test_cpu.c
index 3456e3e988c6..369d4930c1f4 100644
--- a/tools/testing/selftests/cgroup/test_cpu.c
+++ b/tools/testing/selftests/cgroup/test_cpu.c
@@ -809,6 +809,76 @@ cleanup:
 	return ret;
 }
 
+static int test_cpucg_uclamp_parse(const char *root)
+{
+	static const struct {
+		char *input;
+		char *expected;	/* NULL if the write must fail */
+	} cases[] = {
+		{ "12.34", "12.34\n" },
+		{ "50", "50.00\n" },
+		{ "0.125", "0.13\n" },
+		{ "0.999", "1.00\n" },
+		{ "100.01", NULL },
+		{ "abc", NULL },
+		{ "0.5000000000000", "0.50\n" },
+		{ "0.123456789012", "0.12\n" },
+		{ "0.99999999999999999999", "1.00\n" },
+		{ "0.0000000000000000000000000000000000", "0.00\n" },
+	};
+	int ret = KSFT_FAIL;
+	char buf[64];
+	char *cpucg;
+	int i, err;
+
+	cpucg = cg_name(root, "cpucg_test");
+	if (!cpucg)
+		goto cleanup;
+
+	if (cg_create(cpucg))
+		goto cleanup;
+
+	if (cg_read(cpucg, "cpu.uclamp.min", buf, sizeof(buf))) {
+		ret = KSFT_SKIP;
+		goto cleanup;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(cases); i++) {
+		err = cg_write(cpucg, "cpu.uclamp.min", cases[i].input);
+
+		if (!cases[i].expected) {
+			if (!err) {
+				ksft_print_msg("%s was accepted\n", cases[i].input);
+				goto cleanup;
+			}
+			continue;
+		}
+
+		if (err) {
+			ksft_print_msg("%s was rejected: %s\n", cases[i].input,
+				       strerror(-err));
+			goto cleanup;
+		}
+
+		if (cg_read(cpucg, "cpu.uclamp.min", buf, sizeof(buf)))
+			goto cleanup;
+
+		if (strcmp(buf, cases[i].expected)) {
+			ksft_print_msg("%s reads back as %s", cases[i].input,
+				       buf);
+			goto cleanup;
+		}
+	}
+
+	ret = KSFT_PASS;
+
+cleanup:
+	cg_destroy(cpucg);
+	free(cpucg);
+
+	return ret;
+}
+
 #define T(x) { x, #x }
 struct cpucg_test {
 	int (*fn)(const char *root);
@@ -823,6 +893,7 @@ struct cpucg_test {
 	T(test_cpucg_nested_weight_underprovisioned),
 	T(test_cpucg_max),
 	T(test_cpucg_max_nested),
+	T(test_cpucg_uclamp_parse),
 };
 #undef T
 
-- 
2.56.1

