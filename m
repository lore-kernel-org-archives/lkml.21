Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019391;
	b=SF4nMCR/NwRaZMEPJTxvOWVv4poLvDMw7dEuFmrzqJnp8LlrZ28zYAnPrchv62SlQhig
	 aaEN9Hz+4+u3Hxp35nKmus1fAIImqFelrZjZ4noTKchehQOtYGXgvzETJU0/U2loQc2Qs
	 MRDoq4HL3gysN5OgH7qQWj/VkHXO5Is1Wiq5D8eoUWhnrtXLHLuoUzF8c+0yW28G1vvK3
	 LrahlHvbJOohyIcedVPX4xMqPmY0apUx/s6ZQBuyy380HwS1GjlVl6uaxnPg9GdD5Co4T
	 3SbQIiyuEbCtVRGOCwsW89+ewfUlDTT2y/IU8tUXgOh4tW+QtF08Q4utJ7nFn8f7z+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZoY49G9OBW2Ss+uxh9zKm04Sv5cGEWU0IEPT/pkp6FA=;
	b=0DBA3qRyPlF1t0SbTi7V9ADyyhux4sXEgWo5hON2T85hdFm2IYrRuGsk9lmPRNJGzGBz
	 2x8hNw7HlT6M7AT3dO/05fR1qZREbGd5K47EslpDu/dw4SpX7f0YncTV7/7y9haAnb1hY
	 yfh7hn9Izov+ewcsZ9/OBMotnTMTHRICZtp/HKwHOqfYCBPLAJQ7Y7lcOu2Y9KrwY322O
	 6yCzjd5oJUwJEjYcGGkJ7xVHz65nlIT7kpC2dSfAAiNi7YF7Tl/d3i6oX8hHCuU2KeezW
	 0NjSluCeGR7Wa6Hqjr7kyBRDbL0ILQtRqNddgADUA6x5AjxYa0WStHIpYsMFOxRS66Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ItxjA1sV;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF08606A339
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DF08606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ItxjA1sV
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1037846f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019389; x=1795624189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZoY49G9OBW2Ss+uxh9zKm04Sv5cGEWU0IEPT/pkp6FA=;
        b=ItxjA1sVIskn2bXlZ8MTSXkdRYNJRscOn99Rj9xvDeRBspcvHJp4myUSRG1aCmqm6E
         LhPNNj9jqiVN/6CMIlYllbOqVP4DCwD7ioMPADk5wxEhjTFuu/3YmhZpPpdzMc6FlLRD
         pRYPa14fW6iY5u+eS74t4wnyLRfXxd7j0gFDg1HDgG8BJUXIFLX1diV9WjCN5u3Uc0ka
         54FFZ2zDykxmpIjiTs1eJI6GSXG0jQJlFA9uItihYz2rSPs5LJw2olI5hpOiiyXazoMd
         F0E8dRo9+TqspRbRJsMExuh52UnO02AhmhSTtaRiY+FUxk813z13SuNh91xV6/5Ubbdu
         XKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019389; x=1795624189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZoY49G9OBW2Ss+uxh9zKm04Sv5cGEWU0IEPT/pkp6FA=;
        b=pUED5YlBJPaBv+jc8D6ElZZrFADaXoSDboLs+zFfcYlNLKvw6OR4cHOLYwXF1QbTmN
         si4DGXlKc2qKJ5HYps4AM29IJT4ToSeaxd6+KJ/In8g2I8oeQKIBJtL8P3z/0h4fD52i
         gTEW0bHDacOiWEy4h+4B083QHW3HEz1mNlXQHo0ShpRwLd2azMZJXEg19xyp3/IUz8dn
         yAsyDD3qlIl4tGmT99Xi9P7MZ4TVmKP9CIKboNR/xv1b8Z8dshw5Zo6omNsCCCXItGP8
         NpKofpY3n66q4ETmh+Otsg4fyg2Zhw8X2jrAaPOyxk/eWdPPwMHy43DeMmQnW/jXcFvW
         4W0g==
X-Forwarded-Encrypted: i=1; AL+hErFuyM2lE0Ltsf3ju56e3AF1GR89aA5qQ6xFe5N0XiuFa46Pn176znAY0lidNleuuH920waiYj1zXIargY0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YsuhTvUYbsTD8aKoBSTG1nyi0t15vhFpFVlXTxY/E4LX1Kl/Y
	MU1ZgylchHrFOIsrwxqMY436xdFyGsL6l5qk2szGPt72DT2cNh62NRD2shQVZpBpxdY=
X-Gm-Gg: AZFdTZfOIrwX9ir1cohbCyMqrg70RzQLt/xEDfEsQeu5VkcjBRiMevaiOm7AolltMJA
	Jg6HjoUvimr/0FCsZeIHceDiYxj25EDBbx9akybshBZlMuQjC3JLUa75L5ObxkZrRWla4nGD9/2
	LxF9wAS27kyaM5hBmYqchi8K6hftP7EnNmcMU+JKoXYE6caognDLhM0TbO9Fr4dAs/5y9MLFgHt
	Krn9VO2cFZKjTCm2mOeLVxbt9E+fLSpGBf/Qm+sna7jICm7leGixTRhxcsdYnoOqfjy4VkU1fQ7
	fV9XQqThsOc/HPX8Q3Gk6NdcxcTaZrHweYtBXDVxkyvKcTvazvUKcU4+FlEkrBGUkVC7vlR1/Rb
	c28qmMwoYO8Om6pXGguNepnp7tnAc9RvjQZuySLkXZh6+BD0zHsCiEG3PZmYEEElUje/o73Qp/6
	5UZl84xGN95+SXBXb8wBrxsv2dCOTangH5Ia1gzSfdVo96Wj6Y2weVYvJX8QSibmFJazERay51y
	BFloxYkMJGfkjOXxY1m6Ub9O5pKR1ieuS8F3hkJS16vP+243107N7NGKIKeziLqZW3Ua/D4K6Nh
	qQETVwFIFlV9Bs9qsXtI5r/6O52r+7ac
X-Received: by 2002:a05:6000:61e:b0:4a8:e472:a50 with SMTP id ffacd0b85a97d-4a8e4720c5amr42347f8f.7.1795019388940;
        Wed, 18 Nov 2026 08:29:48 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:29:48 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:23 +0000
Subject: [PATCH 01/34] perf jit: Support JITDUMP_USE_ARCH_TIMESTAMP on
 arm64
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
Message-Id: <20261118-james-coresight-jit-v1-1-dad4d90747f6@linaro.org>
References: <20261118-james-coresight-jit-v1-0-dad4d90747f6@linaro.org>
In-Reply-To: <20261118-james-coresight-jit-v1-0-dad4d90747f6@linaro.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
 Leo Yan <leo.yan@arm.com>, Amir Ayupov <aaupov@fb.com>, 
 Suyash Mahar <smahar@meta.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

CLOCK_MONOTONIC can't be correlated with timestamps in trace, so to
allow the JVMTI agent to be used with SPE and Coresight, use CNTVCT_EL0
when JITDUMP_USE_ARCH_TIMESTAMP is set.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/jvmti/jvmti_agent.c       | 5 +++++
 tools/perf/tests/workloads/jitdump.c | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/tools/perf/jvmti/jvmti_agent.c b/tools/perf/jvmti/jvmti_agent.c
index 526dcaf9f079..674eed455586 100644
--- a/tools/perf/jvmti/jvmti_agent.c
+++ b/tools/perf/jvmti/jvmti_agent.c
@@ -96,6 +96,11 @@ get_arch_timestamp(void)
 	asm volatile("rdtsc" : "=a" (low), "=d" (high));
 
 	return low | ((uint64_t)high) << 32;
+#elif defined(__aarch64__)
+	uint64_t val;
+
+	asm volatile("mrs %0, cntvct_el0" : "=r" (val));
+	return val;
 #else
 	return 0;
 #endif
diff --git a/tools/perf/tests/workloads/jitdump.c b/tools/perf/tests/workloads/jitdump.c
index 01cbbbd564e8..8422b66ee600 100644
--- a/tools/perf/tests/workloads/jitdump.c
+++ b/tools/perf/tests/workloads/jitdump.c
@@ -34,6 +34,11 @@ static inline uint64_t get_timestamp(void)
 	asm volatile("rdtsc" : "=a"(low), "=d"(high));
 
 	return low | ((uint64_t)high) << 32;
+#elif defined(__aarch64__)
+	uint64_t val;
+
+	asm volatile("mrs %0, cntvct_el0" : "=r" (val));
+	return val;
 #else
 	struct timespec ts;
 	int ret;
@@ -55,7 +60,7 @@ static FILE *open_jitdump(void)
 		.pid = getpid(),
 		.timestamp = get_timestamp(),
 		.flags =
-#if defined(__x86_64__) || defined(__i386__)
+#if defined(__x86_64__) || defined(__i386__) || defined(__aarch64__)
 			JITDUMP_FLAGS_ARCH_TIMESTAMP,
 #else
 			0,

-- 
2.43.0

