Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019404;
	b=3hKCBj0xDumUHVyGkE5CPUm9Flh6t1jLkBu+EG/9JeHkbCof44ZsFiMQjwFlp1BXM7Bv
	 0oEk1iwKgmyHfQw2OhC60hHCDT9uxmoAKtFTNV/AA31MhVzWYZrqosam0299A5EvyIZT+
	 n1YmaZyAiU2ppsczP0F9E08H5VSSS/qKn58SWwIY5lk3KaRtTlwhEFQjMIWTPVBArok4q
	 FE6vFo0CkGD060BxEwC3dZ3SNwu/xuN+oXcqdRpMx0d5HULIZHbeXq9Tc5Vh561YIt48W
	 J9HbrwxEEN5fRy555Nw7/co7lifYf85l5rEN/1n2CEHKf6K8STAg93/ADcskPTDTp7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=XqjkmMfgNZGBMzqUNuESUkbxBno+SUpnXC2EkRATNvQ=;
	b=GoB51N66SuW5mjoqRdHrFM7LO+vdqkas7Hu/KbSCkqy0XBN1oxazS60eUn5xOxkvhxtw
	 RUIjir3y5azDJKkfAvD35c7wBr66Xaa/QLYDydBiWAo4vtGvLZvQi3psFhqJMKmNt3b+e
	 /6JCVdLrbEX//zSuit1ROMOQd41BEjS1BqiRGhfgJXVKu8PVJ3ftI/LEQTE369Ewp9LJg
	 RBPBRjmqtLriHrp3wrzMCc7kPLp0erYYZJ5fv9oCawQVKciSZCFEKZ5pRKIsBeTXFkJmb
	 cU0RKHUe8xf4twe6fM0ThrU/CTMyxSgQXEJ0u6keUB7xzSq0TNj/c+GRgbPcR5/td6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Vy+e7XXW;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECDC60A261F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:29:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CECDC60A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Vy+e7XXW
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e09aa5264so691000f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019397; x=1795624197; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XqjkmMfgNZGBMzqUNuESUkbxBno+SUpnXC2EkRATNvQ=;
        b=Vy+e7XXW0pN2gfvhsLmJ/6EuzVd4ve2EwwSC91+KhZzJzsm4PxbO/08l7QGjiF/2ao
         ZocZMbuwmKdgRp6WoTdNkKI5AXIvoxUowMT1iINq2Jz1REUPrPls+vBGd+pOBxprRupr
         CbbvlXvWFULM/HYU7uSAJ83oyGvA6ebgXFZ4aDRqlYlY1/9qrBmEyz3fBTGisfqSE0Bg
         dHiIPNHtHLg9lE91uruGqAdUlGDVy5UIq4HwvzEK+aSn0RwdIRQG6auA+Blyf/2bYUpt
         493T4nKuSB/xcwSc5g1vuWoO7s3+al3fR3ZHOja43O4nIQpUX9sI1ku0zFyOxjLgVGNC
         MlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019397; x=1795624197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XqjkmMfgNZGBMzqUNuESUkbxBno+SUpnXC2EkRATNvQ=;
        b=OGBMEHLZiUUrERsrjmGi10d6dnKgooWDh3tkDOK3nBYqxyQTQjQoJi5vSf/qKkxeA+
         0WmczVgHbzm83iRGXJTDrFWebHA515pbFsPSM9cMMGroJ/M8BadDxzEVEGYAZXi4zHRe
         cbRLi5e/1j1MVOjW0XjTqpsYetzJoeqZcahN+sTin2ySy/SHYn+4V4teifJubxspypTs
         Tin4ATe+OZfVPNkGkU3xdo/TDVY3R+wCEvT6ZKHAeS9RK70mmIFgPzRXycZN8mIyI3RJ
         0F+H9xFmkfY9zmKfcE+FYDuGOfTQF4lMP/iZ0G4DN+FHJiFbLm7KQwSi2YmTr5DYvnUo
         XCIQ==
X-Forwarded-Encrypted: i=1; AL+hErE3e2KcjJiCaH3K3ML/N+FDNqQJzfW8AZD/r6NPQSfaXAldYjU1+bjUKT4n7+ybfUylPI9iq0iAfs4uHeA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Vu7SoEB1pCPzmiBkcVsZ9z5ayrNTz5L5IIvGfNqM/1hIThYyE
	6XWGVt2Rr+s2baBDlv4E82PcfAluEKnYsXiDfPuE52KGZGzHMKXtCLs/j2u4aK6cFoQ=
X-Gm-Gg: AYBFou0xXr7BMi1n2UiDgTl2q2cJxYNvu1g1uLRGpNObaypiv5q6Su2s7umN0LnLRRm
	R8b0PLjrO1x/djtCe72MKnzjChozhjcv+28T1XLj3waZhqqyC462SFpPcnPMR6OM8j3OUlnNICB
	ulnL4evIG9qsmA/o8d78oE+3giJHECHSnX5pkAORDBI2zsJOFqTv+rkMMfvp5lkOIRfHlVKX6DF
	zyC1WBv5WVtu2lUV3ib/ZG3E8Hf5J07621wWN8OSCLAVNK4WP25OEMZ0FOgoqloTd07fM0KawVQ
	1ztUef9DnzmnblmWZa/UE3OcNLzCKukeBYuW1YttgARSR2/Z1stQCb4XI59VWVZUe39/y49lRQR
	J/pnJDsN5iq3/rznJhE4z74LTjfJ5K5Zl5jPd/XffE2IbYKU/DMWEvNFQAv+6mJXeoAqMH2iB9u
	iGxR1y3JV+JCMi59CMPAdrgqUkWePFq7VAQMXg2yu41qCo2IaGRU2vm/vBpXaP0Rgsbx/AEF/ep
	2LiHH/QerdfDCnTTmguA+S04oUmBcAUikUF9DmC2ujwd3ZrEiyU6yuXb626C+BKjV9E8H0UfgCn
	MwrGYFdrFAp4bWdTBmfv2+M4EJn2DPxv
X-Received: by 2002:a05:600c:83ca:b0:4bb:60b1:4409 with SMTP id 5b1f17b1804b1-4bb7da26fb7mr62550495e9.19.1795019397271;
        Wed, 18 Nov 2026 08:29:57 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:29:56 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:31 +0000
Subject: [PATCH 09/34] perf cs-etm: arm-spe: Report error if default clock
 isn't used
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
Message-Id: <20261118-james-coresight-jit-v1-9-dad4d90747f6@linaro.org>
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

Coresight already reported an error if a different clock was used, but
this also applies to SPE so add the same error there.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c    | 2 +-
 tools/perf/arch/arm64/util/arm-spe.c | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index 809da6f1a892..5a64c17cf254 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -365,7 +365,7 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 		return ret;
 
 	if (opts->use_clockid) {
-		pr_err("Cannot use clockid (-k option) with %s\n",
+		pr_err("Cannot use clockid (-k option) with %s, can only correlate samples with the default clock.\n",
 		       CORESIGHT_ETM_PMU_NAME);
 		return -EINVAL;
 	}
diff --git a/tools/perf/arch/arm64/util/arm-spe.c b/tools/perf/arch/arm64/util/arm-spe.c
index 53899c7de846..834419f04617 100644
--- a/tools/perf/arch/arm64/util/arm-spe.c
+++ b/tools/perf/arch/arm64/util/arm-spe.c
@@ -416,6 +416,12 @@ static int arm_spe_recording_options(struct auxtrace_record *itr,
 				       evsel->pmu->name);
 				return -EINVAL;
 			}
+
+			if (opts->use_clockid) {
+				pr_err("Cannot use clockid (-k option) with %s, can only correlate samples with the default clock.\n",
+				       evsel->pmu->name);
+				return -EINVAL;
+			}
 		}
 	}
 

-- 
2.43.0

