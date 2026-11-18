Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019400;
	b=5Pboj+PWiNYexZ00602wCdNMQGOvRCnOUD3Om6AVG1D/4+qFFoViqLQ0bw/1laE96/Fg
	 5XDeRpZpvvo8iXgRhVLYCrZXGbS+zesPv6DY+UTHOaQ7w8iDhLucv6MJeusFMJs1AdD72
	 z2Vnf/hCz0Bc4oTqP9zF0IzOj3zCJ3D8oEpra5CuqpiBOfOnZqXRu21IBidEfiEcOpJW1
	 obEpLwAUpWhjZlxEJlNzJGmfdGw6aLKFpeD2eTvmgXtSDmVqwPx+rpHT1787uldryVg+G
	 VnHrq3zBOLLTo+DPVbUlJHrRIZaWGiNiaOx2+UEVBRyD1mQRGQu94gGVnHibshv4rXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=7HY3Xyy42ADU9ACuHgExJQX2qZxHihPnkeqAIQZiRGg=;
	b=fGuNevaD/kzoythDZo/HgyB1mRSUgiFlon/4huFhRn/ELkEfS+Z9vSY1f1hiylJ9arCq
	 jbZhgTrWdYbsjb/WqzCGkXui0pCfHU0dpu6XibFTtLz4crKZ09pkP6p1DVBThEnWE6eFb
	 NbGlw4kfjw42kAnnaBfmb8PkCQIKjasqVv1DkGdgsaOw8yFyTxXJcA0dhQmPBOLSiYeEK
	 yh1RXp5g/pmlR2/67OfzW7rbw21Hlx9ej+HQmganDFXJeIecvMK8vvmAeDpW/wgHOc2Za
	 el6N69CO/U2wy73qPeLNNl0FpetHZMFeYbKr4gE8FItXRScU679AISLV+Y1hH8RWOgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qAbOZoyi;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F90660A260C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F90660A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qAbOZoyi
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b001cd92bso728580f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019392; x=1795624192; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7HY3Xyy42ADU9ACuHgExJQX2qZxHihPnkeqAIQZiRGg=;
        b=qAbOZoyijGrmkGVrE9dZMju6YUDkrGYAnVdUORu7ElyqcYvRc+hx6LZq+GuTECRIrT
         UkV87aQABtcpAi09GnhORkpXb3z90BC3I2q6P48dYheWgyGFHLOzxTuH40boB8wGVe08
         a8RUNF06kYthUwZ5AZv/PPQm2rZ/CyrWmedy7yGlVJ15xZlJdcP+n5momFJ1QU5RU90m
         GbZ2Fn+Q8RuqYNGy8ZgxpRVxaoMWNTfIVnuGaOqI2tF5xxRmUW8v69Q6JZxc+4sMAbaj
         ZTDDf1iHcE0QJlQUdPD7bqPwhvZzwtAWxcXxoBDuHCCl4Ceb4elTyQPj0cimoWlRgaU8
         uxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019392; x=1795624192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7HY3Xyy42ADU9ACuHgExJQX2qZxHihPnkeqAIQZiRGg=;
        b=QKNGGq+szJgQCMO7jyeQjNmBGnTvTg2E4hfEzjOdHjZxZJv/xUa41d0um4aF44mARa
         F8maLL7TOsnkKcpQZ07vUVy+IaiojutIiU0YnKRWXUWU19pnUIWmaSctt/Jna7VBbywz
         1EmoA98Zo2fR3r4OiY5KAXc2P7wBWIcffVQa+HBu7FHCLQ2ti/w5i6mMG1xR3gKx8EFr
         Y99NkmjQHkaMsUBOECfqFzZK9RaGCsYk8+ocfilhDfO6Q0d5xxdI993vPGGNX9Ku13zA
         pijc32AR8Rk7/ZbJzjLBDH0it2Po2+5wRDXq1Gt63p+um3e7ocBsXwQX4TjuscbaEDPZ
         rWVg==
X-Forwarded-Encrypted: i=1; AL+hErENfk6xePnDtD9kcoGJu4xALP4jJ3gxZ9x/GUXgMmUSDpYZjKpTrEtBU+z+l32wSihtIsttlCe40zswzrg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ymVLfu8Xxty8grpRxFDdlhi8uHycoVaApIAxuE5McC8xiGXft
	4pA48CURAZ6JgvUys36ZORchKnta1RIWJSqwWCGgrk6fVf+aKvPYIHrkD57kNgxeQyU=
X-Gm-Gg: AZFdTZeBV7BSIG44N5pPufah+w4ny13LAQtLMwP4ASp11IIDwqgwlbIXhGpSqhzAs0M
	G+eOumu0IgqSZZHOKO/aVLse4eGE4DwFYyZ0kMcD/KrLyA+5te5gXWvuI2yBzKGDMXxx3eziWDn
	w/Tw/OvrSX3ut8xaTwXE671WBiaQtAJXL6pJXaxI929A20mW0W9PGJaulCCI03uEvRm5zNI18D+
	DGWugFgkRjLaQeoPRMRKREZzaO+tWJ/aKiryiX6ff7fTtBwS6a8VFJv+WaaYKQ5K5eUZzDczhL8
	67Xz5ULnzGN0zkGWwaqboe5FNmF4il+jPjDP6G7Mr90dkfOREZ//DW99lpHYtesnbv6GGujIF5K
	C4CA+IuBnf3P7NFxQQnSeWe2bszJy8QE6T/lr8X2szpWptaJDtfMbXkN/EYX8kCy+2HrY7wvBQh
	ZZyVgpXw/0jFtTpIP+l9JAy+KTodlRRBU5B5e+XztbyYxF2qFrsE9hLRvNanRAcehxLbSdr4WBV
	Hfr9sfcW/VPuXqljX9Km4ysdNe3aBSkIGYwJMVu921TvWfUfnelxZz4bQpllHNx+bhd68Zg/+sb
	3irEfxy+Orb6rVS847FHO3UPkpzxC8Ao
X-Received: by 2002:a05:6000:15c8:b0:4a4:c39a:1d4d with SMTP id ffacd0b85a97d-4a63bea7683mr5023380f8f.52.1795019392133;
        Wed, 18 Nov 2026 08:29:52 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:29:51 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:26 +0000
Subject: [PATCH 04/34] perf libdw: Don't look up the module by ELF address
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
Message-Id: <20261118-james-coresight-jit-v1-4-dad4d90747f6@linaro.org>
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

libdw__addr2line() finds the module with dwfl_addrmodule() using the ELF
address. However, libdw reports modules loaded from disk at a fixed bias
of 0x10000, so any ELF address below that isn't considered to be in the
module. This means that source lines for very small binaries and JIT
files can't be found by libdw.

This used to be hidden by falling back to the next addr2line style, but
now missing information stops the fallback since commit (62d7cdc8d587
"perf libdw: Optimize fallback logic for missing DWARF"). So perf script
fails to show source line for these addresses.

Perf creates a separate Dwfl session for each DSO and only loads that
DSO's file into it, so take the session's only module instead of looking
it up by address to fix the issue.

Fixes: 88c51002d06f ("perf addr2line: Add a libdw implementation")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/libdw.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/libdw.c b/tools/perf/util/libdw.c
index 90767361f485..4f472ff9f1bf 100644
--- a/tools/perf/util/libdw.c
+++ b/tools/perf/util/libdw.c
@@ -164,6 +164,14 @@ static int libdw_a2l_cb(Dwarf_Die *die, void *_args)
 	return DWARF_CB_ABORT;
 }
 
+static int libdw__get_module(Dwfl_Module *mod, void **userdata __maybe_unused,
+			     const char *name __maybe_unused,
+			     Dwarf_Addr base __maybe_unused, void *arg)
+{
+	*(Dwfl_Module **)arg = mod;
+	return DWARF_CB_ABORT;
+}
+
 int libdw__addr2line(u64 addr, char **file, unsigned int *line_nr,
 		     struct dso *dso, bool unwind_inlines,
 		     struct inline_node *node, struct symbol *sym)
@@ -188,7 +196,13 @@ int libdw__addr2line(u64 addr, char **file, unsigned int *line_nr,
 		goto out;
 	}
 
-	mod = dwfl_addrmodule(dwfl, addr);
+	/*
+	 * The session only contains this DSO, but libdw places offline modules
+	 * away from address 0. Take the module directly rather than looking it
+	 * up by an ELF address, which isn't a module address.
+	 */
+	mod = NULL;
+	dwfl_getmodules(dwfl, libdw__get_module, &mod, 0);
 	if (!mod) {
 		ret = 0;
 		goto out;

-- 
2.43.0

