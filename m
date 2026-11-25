Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795619555;
	b=kWEeSETYii27KEFDGSybGOdTiCaYDuSeNT3NLnto3REil0dxxd30p44fOzHS74Gl8qSW
	 e96e4/cb3n2o4rHw+J4s+m+BDasP/9k/GuvUVgmeVMLQ1Tei1OLC15oqEEwd8b6vShEgk
	 XIuVwdKd6d8ipRdbkIaqLI4cm5ErzOVrwsMLMatCm9lkkLZ44e5C33XbHySCgu+oAoA+0
	 qsXy1j8xhal1XZD0R7WUPSoFutcPrhhSyuTDqFH7WquIs7a1hRKk7uMKbbdAR6djGgUMS
	 aGFqNKfnTj2FADuqbm9RYX0hf34brskCkzv0FHPnI0FM+0ZOFib9piiL19k4zGMZPwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xo7WrNxk6dDX7UKfTjZ4Wt8i+/bBKGXUCuSojJqGcJo=;
	b=N3vrNGreUvdXLo9qBHJnhSSgCXE99qo4+serMk7xdJRd1dqn+TODdR3aCIVRBvyVtx09
	 ag5w6cLFrgmQGlQrdreDd53mTnhPybcmlqJ8wuHQETqkpo91cK2r2H4pYsPWGWVFu9iB9
	 Nz/csomOB4LYSzcuve8/b7Lgyh6U0o6RYJnrOLk54FrDcJQRxfmMzyYIRgIEvPgwrxdzf
	 xhiwCQ9qvOcl+QPzdGnNvAsvcUP9P6PcWuG+xdFK6zgBENTObQc5UscfY0Z/hb/HPE50a
	 iF+ScqMHYLbtCs8brVjh8oaEXbKyBk+ppYC/QvijpUHXzamz1pxc+Uwu6kEmNVAHOsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QATYt15W;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F035D606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:12:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F035D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QATYt15W
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso2708234f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795619553; x=1796224353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xo7WrNxk6dDX7UKfTjZ4Wt8i+/bBKGXUCuSojJqGcJo=;
        b=QATYt15Wc2i9zQCF4Mx/YgQf4+CuE7f1zDfg6RnQkma8WXyUsfpY+83jhy/dnVXOW3
         oMFMgGozeiesmo6n49VGOqCfg7utivB12q1lOCQjjbkrpAt7QYhAi7HEuJnTgE3gMlwE
         dFWqMaxhebp10aUyvV6TjN/RlpTrEHvWWpqEuRGy6pmVI7/q3EaWlmIJt9XnqKvlyawy
         xCHBz8toWYSo0tn95hHMrhx2BYq44rEXmXldrdrKKYIArA8RJoOtABmRkaEPEO9BoNnX
         A2JFUjyrR62DK2RIqKNfSbNO1MPENqaku/wCsFVyL3FitRqjm8yjZJOXj7Rv9VwIHkq3
         uuOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795619553; x=1796224353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xo7WrNxk6dDX7UKfTjZ4Wt8i+/bBKGXUCuSojJqGcJo=;
        b=LitgrGfU+6jjSC3//teOviPhUZsLbEtLhZsF+am6ZIPQiP5l9jjhxrUvkUeyxDLySg
         FDVSsmgiutYlDKIsTVSJafF0SQGuuwsvSQP/ByXl4A5gq44gifRM+rHl2E6jdgZoQBFs
         mzO1VHwADKVBWKlpjvbqmIMgTsSuOrSWHQvaxbB3iZOZYJiGA8WhCa6nb53k+8hxyxNq
         AMBlvU+TacLGxC3gDkG1hqruSfOLDsI9y8aRDNWC/cu4YSWHgROZ6IidGMLH5B7ON2Hk
         KQRPJglQAXZVtFH5VaTIzxq5jgud4DWhDLxjZhljPe92pvkD/DwlteVLV8KjwreGG+GN
         o2IQ==
X-Forwarded-Encrypted: i=1; AL+hErF0cOn2cbEVBMOJaz9pfyS4OKj4I5eebKCtPYFjYbuYNcDnAbPlx854ONl2q1U7M/WwEhYEh4/JWG2M7lI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pwrufh5rrl4uwTZ2/dHMgFn+QBQbnERpWBOghmfipSJbzjUaQ
	+VX//ufvXUxfE97WKHKG1z46zTtQ4xAxprFZuk1jeJRaB3LM7Gya7z3JLZcANGaVMQQaL2oWMIE
	RXa1c
X-Gm-Gg: AZFdTZeOviXXTkgrgJaB+8On/NEVeTOvXV6+OlxoFOZHl6zYkw+Du898n+i6Hiia2UX
	ShtfNjKTCJz5Z8b9pH5qSbzFNvkofFqpXdfMN/HsKygo48qWxFVGSzwQlld/UyL6/s2hG7D+yOY
	qCI1/BaYqc2jd2TOP03ETcQLI/V4WosN3IXodk5jJvBZpOs/1jHXsQGMpQ35XcsW60tKFQUyBSu
	lGpn/te72zyIfHkJ+bjzTv7WpStLzSRoJLkOJnNLTrVcx8UMcDyvbEc/DYn+RvW3rrxRuGgsbH9
	ErnwtnypSFD8oZ1b/vDnllrJl4Y4H9taVtGCEi+YLdB8Df/PUyhJrRW20AngFt74gC3LCwvnF4e
	s226WT9wJV5Xe3w3GW21p8D6v+JmCQuxKQfbEJfjsadXLUdEofLXxR0Y9N9JH+2Fa03qdsUyvaY
	Q0gLawdyTQGUGrX8jlVCKnDqmvHbgL0tEXRZd1pG0wO1a0rPTz1DxjquI8wcEOH8wIF5d1h2Zwa
	0Ogr/alH4TpwwoCc7GayEBk5kbpR0AI7PBb2kHmgYhFMvmRsubnwBvNsKf8PA0DAJKlmdWx6/Q+
	94zdvlLA1cStOtkS6qzHNAUm3mKy/gTL
X-Received: by 2002:a05:600c:638e:b0:4bb:6c5e:b006 with SMTP id 5b1f17b1804b1-4bb887e265fmr343043815e9.3.1795619553431;
        Wed, 25 Nov 2026 07:12:33 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm39845282f8f.24.2026.11.25.07.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:12:33 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 25 Nov 2026 15:12:14 +0000
Subject: [PATCH 1/2] perf kvm: Don't pass an ERR_PTR to
 perf_session__delete()
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
Message-Id: <20261125-james-perf-kvm-live-file-v1-1-946f478ce2a1@linaro.org>
References: <20261125-james-perf-kvm-live-file-v1-0-946f478ce2a1@linaro.org>
In-Reply-To: <20261125-james-perf-kvm-live-file-v1-0-946f478ce2a1@linaro.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>, 
 Mukesh Ojha <quic_mojha@quicinc.com>, 
 Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>, Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

If perf_session__new() fails, kvm->session is left holding the ERR_PTR
value when jumping to the out label. The cleanup then calls
perf_session__delete() on it, which only checks for NULL and goes on to
dereference the error pointer.

Fix it by clearing kvm->session before the goto. builtin-top.c and
builtin-lock.c already follow the exact same pattern.

Fixes: 6ef81c55a2b6 ("perf session: Return error code for perf_session__new() function on failure")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/builtin-kvm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/perf/builtin-kvm.c b/tools/perf/builtin-kvm.c
index 67eb3f667c99..785b761fb951 100644
--- a/tools/perf/builtin-kvm.c
+++ b/tools/perf/builtin-kvm.c
@@ -1926,6 +1926,7 @@ static int kvm_events_live(struct perf_kvm_stat *kvm,
 	kvm->session = perf_session__new(&data, &kvm->tool);
 	if (IS_ERR(kvm->session)) {
 		err = PTR_ERR(kvm->session);
+		kvm->session = NULL;
 		goto out;
 	}
 	kvm->session->evlist = kvm->evlist;

-- 
2.43.0

