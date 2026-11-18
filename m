Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019402;
	b=2aALbhX1Ia9XM1bp5QLMLBbyPd01ZPJRgvYfG9Ky2N9M1E1InUPYLQtEYwdwY4Fa3mii
	 tYcJGJOvMCipLQYNtmun3RFmP4F8uv8tMAQiYG8M3Kvr0PiR8zWDj5IKXCB37QKnD3elv
	 NIHHxFp9lwDwaKIIKu7h+ekNWp4ocUHilPZAUfiaVVuAnUOqr4D4vcwJ9bQTcef5Xe12g
	 JH4Y4zjZUC7dVm2KVGcKoLertxK5FPlnl54jgSIAVAZFuwEpmhnWcN/yTU3pjvqPh1Vma
	 zysr889Q1ci850OIFABoETwp5Da698zKKD78k9Vzhq0QzXJYOQU7Whg18g8DdkvZ7UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9rbmVMuhauk6RT7/BuxdWNH6HE9Yom6LLFGVubFIKV0=;
	b=YHmnHScsA/UYPOcVotkukaCnSwKOeMv3GvrRyglK8PI3kh73YpJorVWXhPWGeyHoU0MA
	 60jTC38oUR438ZV6X4GL529qYIhHahYO8BTn0zJTuzTkg+QxOanxbrfrShpI7FSGCnIak
	 L5k1S9hQNnjlLE4DhIW3Qk/XxXHLqhn9EUPqvjaUthCQqcLOCs9Mz7rOlafaCvQ4rFgE1
	 uNocz63ztsVJr4ihA7qx1VON6xrmYlwLBt6J05iTfWw0eaCyy63ZltI+GHoCKpxlenD0w
	 X0C3Fby7PCSGrMNILI1zedI3vsbee+lds0Y1GyrR6nXysyvK39sjaAiKO0qjgewF5OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nf5xowz6;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC738606A336
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC738606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nf5xowz6
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48dee593f18so1100944f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019396; x=1795624196; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9rbmVMuhauk6RT7/BuxdWNH6HE9Yom6LLFGVubFIKV0=;
        b=nf5xowz6xs1fO/Cnu0hzoxhSwK/UFLTqaZ/uGmJ7CY7mKUl+LqlOOjfjp/HUU7wzqC
         vz7hZ9k5WMWKGXPvMH9Rv1Dk++lBeekD1c5jTyqqARVUfLDOidN3ilDCXUe/2dCQ8kYS
         8ALc8DV1jlse+zYHVe5Hf+imz7Y+zP/HxqIHaw05/wACvbZfORPxVTP9TORec8/qEhLG
         cKov3PEYmiLc74EKe6VmzxQXOGmuAMNz+AYrgLnX7jS7o2xWZbQPFfdueVxq7uqTxg7+
         N7NQLGoi6gqa+m0NkoA/uGJq6YvMTYDvCQpWvGCs+UPoG5PZp+QlLmXc6+s9NQs+dxuv
         OuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019396; x=1795624196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9rbmVMuhauk6RT7/BuxdWNH6HE9Yom6LLFGVubFIKV0=;
        b=Y0I5apJqbykebuOIH2J3P2BxSeTBMuuk/Q3vavtQrxknuAm0MnI5Y1ChTVPtongYDs
         grHQGOYLcQSIzi95KZxPMKynELcXwFUvWutwLMMwHafm0HzlrggMhUGbuSyzj0fRLnuP
         sb+DH7e/aUHB3wZSa/DCXJlw9cWhVpk1RF7zgwDIxAei9BYfR/L5czUn/bTqmmNvPWOM
         VWXNj60m0Av3kICAP9jS1EfaL8Sx/AptP46wDGTdCpz/ZmGkBQ3z9qy/KqGRRSzpC7U1
         s6KJSx6PwiUAdm+uDIOBIusEJV7OHpv2q0C7ZjKKLVW+D7VA0idfI7xxy0eWovUiL+Ro
         CI/Q==
X-Forwarded-Encrypted: i=1; AL+hErHLVmCVxVIBR9h1I8Am5Z/7JkF0VRwJs3NRuZusx/w2ECz0BCTg1q4q1td3w8yZuwjORPr98yHghRKmCBY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TJIiFuqHHa1GquQacpI5Z/dk4GLdy/lvvDrN3cYWfJNeN4aED
	ZabD+Y4e0iKSEJOAd2646uRZ5LYSOOrfokXT3Ea4d04SYGkVQAaSOeN9duu4KCFflcA=
X-Gm-Gg: AZFdTZdjMUM4yv7XvIPiV0p/K7pdlH8j74x/5WylE3NpAfVpAVHISqE9R3zxded2Oeq
	4FgxB3SgE/xbgkdjvKOlHMemECTN02MH6+ZRKnyj3DoAi2qNVkKJukO+YKWH3no8FxZEJJ5r8lW
	6EDDfXkq+zuy9OqpS0Q3GmRH95pkxS+XeE6vkhZ5q+nOnOXiHcuAbOusoDmU00p0v/2PG87MfpK
	ioO12nCY3ht0UUo/Y1nMe3vToGcxoqmldLlT1ak6PWsxJGZ0iJN2wji/FM0l+vqI0HlHVmBGxu+
	3ESk4xKEpKiNy/Cm3S29gT5QtygP3JRfkbnv0Vlt4wjMxqiCt1v89yTl2WT1MTc6SLn9l9ps6yV
	QSpBSU6Y1CSYgr1EnxEgjH9vVcc1XrFMH6e8GekxyFczcMQizqNneNuCwq08q/oa03SA6estZnr
	4hYzP6+HsgtWCHwtd66rWoYEwehkzeQiGex7W485psWCcT4mqxpVeU6heOQAEPk4HSnJABU6CGr
	4Njf9SnuH1foWUFLXSx/Gua8VQo+tjodC0a4jIOrXVNDJ8tELoE71ooaE6+tozQeKiqXkY5f1Cf
	Jo+MDji2Ah+IuCfXB5pHTYxt6W8tbg3h
X-Received: by 2002:a5d:5888:0:b0:48f:bc59:ab9c with SMTP id ffacd0b85a97d-4a638338280mr6254961f8f.12.1795019396217;
        Wed, 18 Nov 2026 08:29:56 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:29:55 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:30 +0000
Subject: [PATCH 08/34] perf cs-etm: arm-spe: Use arch timestamp in HW
 tracers
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
Message-Id: <20261118-james-coresight-jit-v1-8-dad4d90747f6@linaro.org>
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

To allow the JIT dump records to be correlated with the HW timestamp in
trace, set JITDUMP_USE_ARCH_TIMESTAMP.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c    | 5 +++++
 tools/perf/arch/arm64/util/arm-spe.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index 84a5d7392a5f..809da6f1a892 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -909,6 +909,11 @@ struct auxtrace_record *cs_etm_record_init(int *err)
 		goto out;
 	}
 
+	if (setenv("JITDUMP_USE_ARCH_TIMESTAMP", "1", 1)) {
+		*err = -errno;
+		return NULL;
+	}
+
 	ptr = zalloc(sizeof(struct cs_etm_recording));
 	if (!ptr) {
 		*err = -ENOMEM;
diff --git a/tools/perf/arch/arm64/util/arm-spe.c b/tools/perf/arch/arm64/util/arm-spe.c
index 8d6a2bde2892..53899c7de846 100644
--- a/tools/perf/arch/arm64/util/arm-spe.c
+++ b/tools/perf/arch/arm64/util/arm-spe.c
@@ -521,6 +521,11 @@ struct auxtrace_record *arm_spe_recording_init(int *err,
 		return NULL;
 	}
 
+	if (setenv("JITDUMP_USE_ARCH_TIMESTAMP", "1", 1)) {
+		*err = -errno;
+		return NULL;
+	}
+
 	sper = zalloc(sizeof(struct arm_spe_recording));
 	if (!sper) {
 		*err = -ENOMEM;

-- 
2.43.0

