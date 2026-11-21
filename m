Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795245435;
	b=cA+zvhRQsNcLqRrFCuRFXWBnsaP7pCjVyYvc3EwZ7WIeTzPhW3Sizv0Kg6EbeBY4RiZQ
	 QC9jNrvrHr+ZBH0XSci3cQo5X/IINWdu+ZsoReG9H1qVNFkeQAwhiilgqhRoNgCWy1xFo
	 oQXFjrganYdAmwcEjXCHUogUxl0ECLKvyojpefEDDQFNeO0AywoWYV7t80qd8TM/9UbLx
	 /6ESZQmeFEqQyZyNrNFoZ3l/ajPh7hQIsEuBvw+1GdTKDZm0LnHB+ef49s3PsmrwwI4B1
	 nj0QJi0z/OoG1XqUiL1xR70iZhqU5A9+y6M1ZqMsmL6GnW3+HwUg0NDpQk65vaSQRYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795245435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=pH2BPzLxsd8NvvUmkGMcSjMobCCeF4ip9zrDbmpxIGM=;
	b=DhIHW5tLx/QrD0dG2l5UfUzBoNZUcDHjvZ6I8E2h+kvHuVsVhMIhXDCrCckizbL19+Iq
	 i7+cOWYTWpk1zTB12GpLJReGiX8wUC2Cjye0JaoCdFJn4mZKZaLUC7SzxFYGjKs0lxQBV
	 NwwKQjRkJjj2C41Qm54bdxEFQYW3ks+pKKDUZWNv+mW/a7KC9n5GVHPuJ3ZK+SDp1nH7J
	 R16vR/6ZauTCdnocu1GleKUey92p6+msO6tITbUFF0yONRip2/WQhrGruwoLYfMTZDh+O
	 Eh6ATxCX4bQzNw9Ri+EKwwavl4vwh0k5DwXDbsNN7Aj5Aa78H48pIF6f8f0adgLqkGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AyoryBAc;
	arc=none smtp.remote-ip=209.85.161.69
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0151C606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 07:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0151C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AyoryBAc
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-71adbb7d16eso1659402eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795245434; x=1795850234; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pH2BPzLxsd8NvvUmkGMcSjMobCCeF4ip9zrDbmpxIGM=;
        b=AyoryBAcRunfyWWAGqFDErv0RmvC4RgRkn3jugqZMjtIJ9iCPdzd50JCSf221odRMI
         BQjbPO6mToI62dJjz1rb6REi5XkXBmQsBG0sd/cPto+9Cfyft9J7tlZnQec8psjk9x35
         z3hQCWMa6Jnq5GiMDqNz8S21PmU0B2i7GZagWIpMsb/gopFnd4CBWujiw265AYtDoUG1
         KvhPD8BRn8BdTHzO7ADyrD67xmNSfnTBmOjlXMJrUi/tgrVkdfAhAGBgtWulk5KST00l
         2XILaQ/LDp0NlaLygFNsnRvGb7FezxZS3XIr/B8lvf6zloxKctYZOxdBp1Fjw0PP3/z/
         VNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795245434; x=1795850234;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pH2BPzLxsd8NvvUmkGMcSjMobCCeF4ip9zrDbmpxIGM=;
        b=XfXrVP0FszwmSF4QzOvOikZMHN8IJD/PzBJw2irFJoFDUf2x8Et7v5dQ+3MTn7v0pz
         JROWr9/0CEfy8vszdD0Q5f75RWXHnXHGBEN0ILHogNsyufUUK71vqmmPO3fIKDTzP5IU
         mMAQ9mg4/QdXQr68P503OZZ5ZdGpzDzXxaXWiV1M9kFiO7J8qyieSroj7mTRyLb+5EZz
         dHO182f1I+ujJaO7nj5zUhvssG1v8DHgkj7FoMJblqs8WNXz4c4xsfMk0fva5V/U7Bm6
         E0ZMJkMdepf+IpGizAFM7ufWouNd3NVQmyHkoWbVFD9FEBxinMXl/1aFD4gZUAOXxLgJ
         b6QQ==
X-Forwarded-Encrypted: i=1; AL+hErE7XBug+A9QEnFTA0ZGqo5d6Dodht59Ob6ctNs9jbPqEUa2GPrItnDViGyQYVHExD46LFaiRdKQd/ePpk8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IvuiaVgjglEbm4eu5yCw/SF80JLCA+qmI+f/2fzFSjHMTDRb8
	E719+UoKLyNjmNgPNk2ZTvhrRh4RwcWFMVIbginekPcPmLh6Jk+jpVg5gxXQf6iINmwGNUC89IF
	klMa56B6lyw==
X-Received: from oachw30.prod.google.com ([2002:a05:6871:cc9e:b0:49e:13a7:3e26])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6820:60a:b0:71a:f24a:a3ab
 with SMTP id 006d021491bc7-71b32773f58mr4894729eaf.44.1795245433543; Fri, 20
 Nov 2026 23:17:13 -0800 (PST)
Date: Fri, 20 Nov 2026 23:16:42 -0800
In-Reply-To: <20261121071651.67118-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261121071651.67118-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261121071651.67118-2-irogers@google.com>
Subject: [PATCH v7 01/10] perf kmem: Fix alloc_func_regex leak on error in build_alloc_func_list()
From: Ian Rogers <irogers@google.com>
To: Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Alireza Haghdoost <haghdoost@uber.com>, Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In build_alloc_func_list(), after regcomp(&alloc_func_regex, ...)
succeeds, the early error returns on map__load() failure and realloc()
failure return without calling regfree(&alloc_func_regex), leaking the
compiled regular expression buffer.

Call regfree(&alloc_func_regex) on both error paths before returning.

Fixes: c9758cc45699 ("perf kmem: Implement stat --page --caller")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-kmem.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/perf/builtin-kmem.c b/tools/perf/builtin-kmem.c
index 8693c6b135ca..1404b523a785 100644
--- a/tools/perf/builtin-kmem.c
+++ b/tools/perf/builtin-kmem.c
@@ -364,6 +364,7 @@ static int build_alloc_func_list(void)
 	kernel_map = machine__kernel_map(machine);
 	if (map__load(kernel_map) < 0) {
 		pr_err("cannot load kernel map\n");
+		regfree(&alloc_func_regex);
 		return -ENOENT;
 	}
 
@@ -373,8 +374,10 @@ static int build_alloc_func_list(void)
 
 		func = realloc(alloc_func_list,
 			       (nr_alloc_funcs + 1) * sizeof(*func));
-		if (func == NULL)
+		if (func == NULL) {
+			regfree(&alloc_func_regex);
 			return -ENOMEM;
+		}
 
 		pr_debug("alloc func: %s\n", sym->name);
 		func[nr_alloc_funcs].start = sym->start;
-- 
2.56.1.750.gf70dc682cf-goog

