Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019392;
	b=fumcLL4nfAAp5XvYznEtoS9k/9TCK4OpevN4xSuSuC0uOj6Lrc8jyTDuJYRvW6m05ZCg
	 qpk0bSc2Dml3zn2lLdUOZJdTadHlu6G9ZPwilxNhuiVUXkJFczkM2IRbCwDge3J4JIQZ2
	 Tb/eQvFXpqJ0Yvt867u84smPVWy4lN6y9kMcRzB91FM364G3Ms7BdoM4wAb6Zms8TsW8f
	 YCeBPhecttGO/TZxFASkbBsTmhKfZocgfSpe38qE4rkfbohrtmkTWP7slYWM4hUVAnNJO
	 cWz4QQa08SsXqqmzsgVWch77ilxBW7xT3utv8Qts4vO+hcKiL1vwT/QmJ252ggLZnzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=wtMhJwiFYRL4oBCDekIESBHFFArV6HDfCX3FWyhzvOs=;
	b=CUAFC4+bLMdg37CJgv6/3h/BqFrnJo6PVij+6c5tXcNm6gpAmVy+aq8iPi1+H9PwfHYD
	 Mh+rn1CJD2qqFrYkSqgR930xvjzWWJbl/FEuYzmaPmtF9VF+vJ9mqNJBLrL8+GW9AF8t/
	 RjwPIFwRgarM1RTsoa8V43sFN7fMZGeo/HE8AKHAXj4jvWyO1F+lbEKfQnsodu4+i8dwY
	 1XNNUVtn47/DxqLjpG0R41sA9BYiMvhTRloD/Y8gH421yeJbJyr3YX+I/Dtc/pUHiCZLL
	 Lr588MRJRI43x/iezsrJT6jQG096Z8tz/2G+Q9uOTPALDA65aB2BmOjrzRVKBAobYxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="GkZUz/E0";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C7D60A261F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8C7D60A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GkZUz/E0
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a42b34e930so956921f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019390; x=1795624190; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wtMhJwiFYRL4oBCDekIESBHFFArV6HDfCX3FWyhzvOs=;
        b=GkZUz/E0rfw4x1dR1T8HjsvXLNcQsWb22zSpOEyAxWXOqd+ORu8BrqWUkRxpfawdHH
         Trz//46nEOV0KYF5X8zKR54L6xGsb1CkQ8iL/O1gJqFISPiyKN4oJLc/+Oc6Y3VN43Ru
         UWSCstdL4PFaJHxmtI3YWIN6KwR7wbdopAxfO5BxK4czj+d9cVQXalCYr9ADsTimXt4v
         ljtvr5FqtYDVqnj1bozQwggCaFD+5HaKDCwt9Xz3MFofhMVcdLIQSHusezpbVPB53FpS
         v4KFFASEp5QciM7s3uefV5ljqBjFgkH60c2sW5+IH9kYjQNxRLAilaWEModlNItp0RoF
         asoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019390; x=1795624190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wtMhJwiFYRL4oBCDekIESBHFFArV6HDfCX3FWyhzvOs=;
        b=VbsjuZMQkgyzZl4rwxVds8kr7pMQi9GLnHrr0YbQdhnDeHHt2DB2EnwN6ygSh0+aLt
         UulBGi9l0WmMI8BmdswD8NYoFaAl8l3brib5jWUD1BAH6j4aFhl/o2Njy5u3eEtog3SE
         4/rG9rcfhhaDiwxLjAnytvfNwDobDidSinn5/PHREKRNEYS2dB+ap+WHyNFlB9QI4I1C
         IOa1Vt3YEi8cZC4NGq27PtwWeV5oJgEnx3QRukJhlq92rvDNT6WfdO/Cy9XA+XQ0i0pM
         7N93FzzozG+yOHVL1xtbQsv2u4CBGK0LogUlc1qaVFhjm4ZYtz3UMix8aKuDMijKnrym
         rXSA==
X-Forwarded-Encrypted: i=1; AL+hErHy7QuldLzD4AsSpFpd+SwnQXx8ubNIXKkFaqccdk27Cdip6P+8y+JNOTHMmS4DuLJRvlsCER0cpL6Avjs=@vger.kernel.org
X-Gm-Message-State: APuU4Z86AfR2/s7vWyd2BuJggh8gPWrhraAXxYmIhNID53fT54zXxmmw
	NazogLVl6Bl8R82owufFazx9WC4+3z0erftU2ByEXtjgOlih7qSUSc8RtfOTavx+7l4=
X-Gm-Gg: AZFdTZeGRDRRmpiYDVihB3aFk3fTiOC/L9L5M/XDPdttWVmF1IiW1d5CLcct117tlkd
	mtBylVdwBVcaddGfMo07HPTApOJeLoMldx2Ydc4SeyMzGZuBXoUyxsK4RsoRvJuoTeP+exfOGo/
	SmpFIKDodglfOn9EylNwf0CQNdtVPbGb7aumGqvNfPkojY+HqhKXSPJglaTE6Cew6ibXMZVeBSx
	6p2AIWjJD6bIL/+8ao2uq+Sp1cbC3ZN9ws8t4BeMjbQv0qi6QKb07jHYQ9AMq+pFDjwZPb2uePA
	cH283BWeb2oaFXeHy87Azpg5sQfwaRuGCfsdomhb0vO0FtnIgrY1YSzoxackFT4DNY90ISG5hwT
	8NF691syYaPvAJMyfRbPEZAYu92+5PV34eAWloHfWqpyT056oOMayVk5uzUl+EqRtxNo9jh014c
	j7NDzK+Uv2SgcUJogeL8vC2A9KL3dv0nAGxhCORS56YMcXridv88dOKd6sgqpnxcHXWD8M3hi8V
	CRDBkuW8hK23ebkz8hOkdAQn0AvMxGqGPNRYUOWwiX1QR2vhULly+k0uDukzFeOkNcaBWrq2VWJ
	ErdJwXvzYcc2QdKWjcTF5L56NRZB7WUb
X-Received: by 2002:adf:e013:0:20b0:493:f3f2:2241 with SMTP id ffacd0b85a97d-4a63a1e0760mr4855589f8f.23.1795019389980;
        Wed, 18 Nov 2026 08:29:49 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:29:49 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:24 +0000
Subject: [PATCH 02/34] perf jit: Add name of clock in error message
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
Message-Id: <20261118-james-coresight-jit-v1-2-dad4d90747f6@linaro.org>
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

Use the full name in the error message. This is also a valid form of -k
argument and says exactly what clock is needed rather than having to
work out how these numbers map to clock names.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/jitdump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/jitdump.c b/tools/perf/util/jitdump.c
index 45a05316b3ca..4c1a71702f62 100644
--- a/tools/perf/util/jitdump.c
+++ b/tools/perf/util/jitdump.c
@@ -220,7 +220,7 @@ jit_open(struct jit_buf_desc *jd, const char *name)
 	 * validate event is using the correct clockid
 	 */
 	if (!jd->use_arch_timestamp && jit_validate_events(jd->session)) {
-		pr_err("error, jitted code must be sampled with perf record -k 1\n");
+		pr_err("error, jitted code must be sampled with perf record -k CLOCK_MONOTONIC\n");
 		goto error;
 	}
 

-- 
2.43.0

