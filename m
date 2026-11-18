Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795037220;
	b=5qsXeqcqxyCGyKny36hmIsYyNZ5fZ6lz4j8xOQTggfbxy38/kFShBxRgRyqRW2e/YGxQ
	 jSlIE8YTsCFcjUWBdt/oz/Nbtt6/ZlA588lRyc7r1C8l0mTeghY6Dueu7IhWCuXdgsE7R
	 U2Q2I7/qgDRO6OO2/KVrBSmE+IQ1+7mRYxJ4T3mtb2/fxNYY3yFC6UIUGQDbJf5o8JxpO
	 BGz4Oju4uj1thOMUmjv9tm+DwH/8HdQXYdvSAVKPc3jpISvBWPr8LEmxxrFlSeFiRX6E7
	 NiguhWueZk11ffo/JiAqGbQqQ0fpBrdID3uOtM6+YrniMDGIZbjhC2ZrD9a2d3f/rUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795037220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=1bS4ZwGQg8uJ+f7Y+a2FFJOJtfKOuwyuAYnXgPVM07A=;
	b=S/hf2ByZvK+KeblJEPcOBRozvoYc+9PTphl/8Ft+X+UHsch1jkg7bBXcKYR3I4TqO0Al
	 mDUSsfgWFUlDeW7+KWx5joBD7INDqhXHAb6B3/bqEiPYUtzDU3rxdLvC7rtAHMSnNWjGj
	 Fr+ojl/vOwn94nXElrKE3ItOfPO+koILfLt0FxTe2hMHxSBuP4DGrcOWWmo5RpAhNT5j6
	 cG+ogIbCcT0xEfGZZ6r7WM1gXtQxdxRSCRjkcGk8ZAGnKQKxRIFDefvRwzMBIG10YPJ3d
	 ntj7MNUZhCV7D1/Z0XQ9Nu+bBfBR529LLmOLJ3g/Zi5KxMw5hWqQefMzf4RC12QOF+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ctshao.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="ae4s22r/";
	arc=none smtp.remote-ip=209.85.210.72
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29C4606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B29C4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ctshao.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ae4s22r/
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-8488f31d754so1060141a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795037218; x=1795642018; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1bS4ZwGQg8uJ+f7Y+a2FFJOJtfKOuwyuAYnXgPVM07A=;
        b=ae4s22r/sYFADCDDv5hLEpMhWoeb3vC1D05D1SQWEfBl5Gel9c3/eFlDModFC5YHur
         jaevPBUbV1ZcUZBw7ReRyGa5KA6uMp4+lstqkC/NPiUfmY2HhqEi1sntbJqgo30RVmrl
         3ubUfXfNMzSiOAjZZ83J5bM55CmOQejgAL20XkPgCx5EyUGVZUveKCXQNQKjAd0nL1So
         YrX+a38Qe79kE1yLCrkJB63HQiA8XlZ48Zwjg2cMGGchZFE9SI9uqERafx/vLv5wdNuA
         OeO93vuC0KgBL6JMEGXDwIVe2a8W4gBL2N8TMACu/Kbbyv54UaHe1HarjlzmJ8Xisx2u
         Woqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795037218; x=1795642018;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1bS4ZwGQg8uJ+f7Y+a2FFJOJtfKOuwyuAYnXgPVM07A=;
        b=DzDf9Uc6jQ8i8ECceREyTZlheSoPLsAFFZIQDNSuiQHKl4cnMFgvqT8eFWlsQU6eK3
         EMmRkI0s9gIJYC2DFAPM5ObwBw+i3BFtCbZPaSW6cuyLx3jYGBo9vn5zXmZX8vkSebKT
         0dCd4VNI8iFTzpVJsdFhDqdTl/Hs7wJImZUE3aRtQhbWgmALmVU0lG+U+rvAbCZiAP9u
         GQe+e7gHfocYw6bUCJxdPjxQ8yfCZY8FFmAcn8biUOlCoF5s6lKYegxyMJiHyyKu0xxw
         ywJf37j64V/0VSnnDpo56DhwNK3Q85sLxuk/U7HWnzhrGYud7Qj29ii6Tu2MSWuVshej
         0iVQ==
X-Forwarded-Encrypted: i=1; AL+hErEgyVDjj7tjRymP6kGQzdICLsi3D5w+SQySYUE5fNWx3tc8q304dsrzJmG5F3u9bIaPX20O1C3UELd1JXo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FeqApWdPgabTzWzXsgBIyCu7jgenUhPy1niKLUTBBAckLs6KR
	evSQMLX8NV6y731bsiSMagk09j3TOhuHGZCbpWc75/v7ElC1zFuCVjH4E/WPypvs8IXYFKAWRHf
	8Kgaf6g==
X-Received: from iocre7-n1.prod.google.com ([2002:a05:6602:87c7:10b0:9e8:de6c:a5a3])
 (user=ctshao job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:87d1:b0:571:a186:d6b9
 with SMTP id 5614622812f47-57740b4759cmr4859253b6e.13.1795037218323; Wed, 18
 Nov 2026 13:26:58 -0800 (PST)
Date: Wed, 18 Nov 2026 13:26:52 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118212655.2262601-1-ctshao@google.com>
Subject: [PATCH v1 0/3] perf vendor events intel: update
From: Chun-Tse Shao <ctshao@google.com>
To: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org
Cc: mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	irogers@google.com, adrian.hunter@intel.com, james.clark@linaro.org, 
	dapeng1.mi@linux.intel.com, thomas.falcon@intel.com, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chun-Tse Shao <ctshao@google.com>
Content-Type: text/plain; charset="UTF-8"

Sync Intel PMU JSON event files with the latest Intel perfmon repository
(https://github.com/intel/perfmon/commit/1e224c0fd9d9):
- Add Diamond Rapids (DMR) v1.00 events
- Update Lunar Lake (LNL) events from v1.26 to v1.27
- Update Nova Lake (NVL) events from v1.04 to v1.05

Chun-Tse Shao (3):
  perf vendor events intel: Add diamondrapids v1.00 events
  perf vendor events intel: Update lunarlake events from 1.26 to 1.27
  perf vendor events intel: Update novalake events from 1.04 to 1.05

 .../arch/x86/diamondrapids/cache.json         |  952 +++++++++++
 .../arch/x86/diamondrapids/counter.json       |   52 +
 .../x86/diamondrapids/floating-point.json     |  419 +++++
 .../arch/x86/diamondrapids/frontend.json      |  458 ++++++
 .../arch/x86/diamondrapids/memory.json        |  295 ++++
 .../arch/x86/diamondrapids/other.json         |  777 +++++++++
 .../arch/x86/diamondrapids/pipeline.json      | 1423 +++++++++++++++++
 .../arch/x86/diamondrapids/uncore-cache.json  |  292 ++++
 .../arch/x86/diamondrapids/uncore-cxl.json    |   22 +
 .../diamondrapids/uncore-interconnect.json    |  218 +++
 .../arch/x86/diamondrapids/uncore-io.json     |  386 +++++
 .../arch/x86/diamondrapids/uncore-memory.json |  939 +++++++++++
 .../x86/diamondrapids/virtual-memory.json     |  266 +++
 .../pmu-events/arch/x86/lunarlake/cache.json  |    2 +-
 .../pmu-events/arch/x86/lunarlake/memory.json |   27 +-
 .../pmu-events/arch/x86/lunarlake/other.json  |   19 +
 .../arch/x86/lunarlake/pipeline.json          |   44 +-
 tools/perf/pmu-events/arch/x86/mapfile.csv    |    5 +-
 .../pmu-events/arch/x86/novalake/cache.json   |   13 +-
 .../pmu-events/arch/x86/novalake/counter.json |    5 +
 .../arch/x86/novalake/floating-point.json     |    4 +-
 .../pmu-events/arch/x86/novalake/memory.json  |   39 +-
 .../pmu-events/arch/x86/novalake/other.json   |   84 +
 .../arch/x86/novalake/pipeline.json           |   75 +
 .../arch/x86/novalake/uncore-cache.json       |   11 +
 25 files changed, 6814 insertions(+), 13 deletions(-)
 create mode 100644 tools/perf/pmu-events/arch/x86/diamondrapids/cache.json
 create mode 100644 tools/perf/pmu-events/arch/x86/diamondrapids/counter.json
 create mode 100644 tools/perf/pmu-events/arch/x86/diamondrapids/floating-point.json
 create mode 100644 tools/perf/pmu-events/arch/x86/diamondrapids/frontend.json
 create mode 100644 tools/perf/pmu-events/arch/x86/diamondrapids/memory.json
 create mode 100644 tools/perf/pmu-events/arch/x86/diamondrapids/other.json
 create mode 100644 tools/perf/pmu-events/arch/x86/diamondrapids/pipeline.json
 create mode 100644 tools/perf/pmu-events/arch/x86/diamondrapids/uncore-cache.json
 create mode 100644 tools/perf/pmu-events/arch/x86/diamondrapids/uncore-cxl.json
 create mode 100644 tools/perf/pmu-events/arch/x86/diamondrapids/uncore-interconnect.json
 create mode 100644 tools/perf/pmu-events/arch/x86/diamondrapids/uncore-io.json
 create mode 100644 tools/perf/pmu-events/arch/x86/diamondrapids/uncore-memory.json
 create mode 100644 tools/perf/pmu-events/arch/x86/diamondrapids/virtual-memory.json
 create mode 100644 tools/perf/pmu-events/arch/x86/novalake/uncore-cache.json

-- 
2.56.1.708.g77570a6a1d-goog

