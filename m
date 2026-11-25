Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601042;
	b=gbwtcuh75TgPcpR9Y9lAYJB+0vONbPa30xWgdEWbkU5AopjLZfifer8yarvyRchhIaNb
	 /x1YDC9EzGQmtMjNIVDK5sCBSoM43iUv5toLvWaTQrE/D47q3txKL8BkTMsc2ce7w5VcG
	 TZpu8ondStV1AnwcxIwI/4G0HI5ab+kJxVlJ1Nm/hIBuD37vg7D6is2mFtGUqYaIJkVvz
	 5hFqnxY99FGjBK4KlobkBuFNIeLoLYNQRjtoSB8lV4NmWZ4HItwDlGm26iPUmqeqqYVKL
	 fhikp7vR3/k6YMisXNsZz0IVi3JivMAOL2+6MEaEAsc95ngznO75PiDz3oKfnaOxBMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jY9qOc0xWy86TYB23oPhSaWC0qCicnAeytX8EZDNghU=;
	b=pXCo/zhtZi13UOAM0I0nC1vA1YQiwhbbi4ssHyPm7ldEsR2iEOnDlRyigCiuk+3y8VRq
	 0I1b/1AxESG2s/639UaVZGITnFlQhKQiAfH01PKF8IS8r5PldYaccn4J7EgGyyFflli6t
	 wmGDQpbj2qikNCQqZ57kIRsAMIxxGy2xwL0/+XJE+yTHogQ0nK7ZkO901K4ncBUGGGoXV
	 pFeLCOUFeUtqd6WrrYH1jVxhfj+yqsdAH7Eayjx4opmdfHhXsQJb6n69gU+hVxczG4NIJ
	 Y13hx9EAwX3p9wtYUMXqWqsiMkUXPN3LRDSZ3inwYTu4Pp5hrk3xfHJmBNLf+YR/VgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z6O+preA;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56543606A329
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56543606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z6O+preA
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b546061d58so12595105c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795601041; x=1796205841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jY9qOc0xWy86TYB23oPhSaWC0qCicnAeytX8EZDNghU=;
        b=z6O+preAdIolvfuN+jX8kUQlDus4PRUpHLxLCJAFY6MqqPHg24PvRv5TNlbtYCjx3N
         l3dmDoHhKMexzrvmzvuONr90yOMj5ZbfQiUWKo5DkAT+o042s71GFCmIpGjNWCFggoPR
         9+LgyLUxOuS0Cmf50jtYFv9aT/jDFyevtyT/RklgIujtUrnnPFjMwAwKSBTTwxYln5WI
         CvJNysUa4auHWQr7KGhzKSxmSGX+wyvYgtJYVcdh9SosiIywyR14z2+wkJGUuJyY3Odw
         OgEQod33oicHWnQpYvA3pb9rg/q3kWc7Fdh29haqAyhh0eIGM8O2o1eFEqE7lYhhUp4K
         0UWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601041; x=1796205841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jY9qOc0xWy86TYB23oPhSaWC0qCicnAeytX8EZDNghU=;
        b=yeuVJTzIRohi4cBWvdkhTzuUi9BpY/HR3PEelrBlBpc2B37OCjsPjL9j8inre4YkXV
         ku/01JEOfs7VAOgHFAp+iEHwebcwgRfXCEujM3g5QQTDFxRz27V3vBdWFM/rtYckAiS6
         DdssHBaqmUEJv5FUnSnuInVrh+MCWf+Gi3ZMg1WdmvuL5XmJLdj8CHD6cI0oEV8t+9kd
         YtMayAp+Egy6wUQPloCr2bC4IXvKQlJAIUfeNovwPNcu2X+rkxtWymXc0BVJwkFTQjdz
         7G4VJTwbQRNd3HYv2Os1usDOLRkB6j4w6+W7/woMBza3KSs0P003svj+IRkpZeFo60Y/
         YR4Q==
X-Forwarded-Encrypted: i=1; AL+hErFoiRpm5FAfCD+E6bzkPMUV7rLx1TLnkKeQP+Y9viy9/TXxpxuImgJOVIJhoPvatX3h3e1/dfBXKmwK9KY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yWHzLI66g+8DwbyHpziSyBxqsCXD45zWuMSpJLSxqCYJf2fqD
	ITPU3YdPH4rjOX3WlhuXG74uzKDBQukEdXjK9cTymZO6znffueYyHXrY
X-Gm-Gg: AZFdTZfZdQd9izAotbRaxwVUrjQElWiyz9Z5PHdVpvzSXvaJ7pFbcmmS/Tqh0INuCAR
	h49uDECj3bFR95cCFMJtDFO/1pbcWfv2WyUs5gi1EHY/qnLJkAGLz/wzgaOGUVUpRyQGhkj809h
	v5ILyxOuoK8A8ECjye97D3BqWz/tLgxEoo4d5r8odpiovdHN0pV6zJUK6+74h0FCDVpUV7zECaD
	qO7pfzNhf5EUBIvEOWUf6CpgMzgwZk9/v7liAETK1G05w8WgzzIQapnEb/iPlcHNE4y8RGjlYWq
	bj0qAg5/HseK/wsDpZSIbq3PdvA2127t7/xjnsQTHDbVBhsXpLzjPFLMnjCpQ+aIKqAd6Pv/RL/
	59rOda7uebKohlL1Qf8NmiBTQnrpHNk+1itkPHkGGxHB24RGhP2l2UJ7vtKuudv44u3p3k6ElAN
	utKpavdYMFxJ5eNPVeD6MVCvL1hLU7bEiERMhirwrAGayF0NUF3Kc/xiPVb3UE+qrPwD+vQTM4A
	y1DTz7pBD14AKY7UO6Anlt+Ln8iIoZ9p8s01Ye99TbEQ4g8dKv19CjAX5bglNgyKeyH5tu5y3Xy
	3Bol2mI01omBqtdKvWek
X-Received: by 2002:a05:701b:2704:b0:1b5:4f6d:8277 with SMTP id a92af1059eb24-1b5568e78b1mr16762572c88.26.1795601041141;
        Wed, 25 Nov 2026 02:04:01 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55ff0e4e6sm33863045c88.11.2026.11.25.02.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:04:00 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v4] arm64: perf: Drop the example the userspace counter section points at
Date: Wed, 25 Nov 2026 10:03:57 +0000
Message-ID: <20261125100357.1937729-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111034432.2020955-1-takano32@gmail.com>
References: <20261111034432.2020955-1-takano32@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Documentation/arch/arm64/perf.rst points at
tools/perf/arch/arm64/tests/user-events.c, in the text and in the link
target, but that file is not in the tree and no commit in the history
leading to this base has added one.

The section already describes how to use the libperf helpers and points at
tools/lib/perf/tests/test-evsel.c as the example, so the sentence that
sends the reader elsewhere is redundant.  Remove it and the link target
rather than pointing at another test, and give the commands to build and
run that example in the How-to section, next to the reference it belongs
to.

The edit and this changelog were written with the help of an LLM
assistant (Hermes Agent).  I reviewed the diff and the reasoning, and I
am responsible for the submission.

Fixes: aa1005d15d2a ("Documentation: arm64: Document PMU counters access from userspace")
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
v2: drop the reference instead of pointing it at another file, and give
    the libperf build and run commands in the How-to section.  The
    perf test -v user step is not moved; it is gone.
v3: drop the v1 review history so the commit log is the change alone.  The
    missing file is stated once.  Raised by Sashiko:
    https://lore.kernel.org/all/sashiko-outbox-208137@kernel.org/
v4: rebased onto v7.4-rc4, with the Fixes tag and the note about the tool
    that wrote this changelog back.  The diff is unchanged from v3:
    https://lore.kernel.org/all/20261111034432.2020955-1-takano32@gmail.com/
    v2 and v3 did not go to linux-arm-kernel; v1 did, and James Clark
    answered it there.

 Documentation/arch/arm64/perf.rst | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/Documentation/arch/arm64/perf.rst b/Documentation/arch/arm64/perf.rst
index 997fd716b82f..5b9cc2aeb642 100644
--- a/Documentation/arch/arm64/perf.rst
+++ b/Documentation/arch/arm64/perf.rst
@@ -131,7 +131,12 @@ changed.
 
 The userspace access is supported in libperf using the perf_evsel__mmap()
 and perf_evsel__read() functions. See `tools/lib/perf/tests/test-evsel.c`_ for
-an example.
+an example, which can be built and run from the source tree:
+
+.. code-block:: sh
+
+  make -C tools/lib/perf make-tests
+  tools/lib/perf/tests-static
 
 About heterogeneous systems
 ---------------------------
@@ -140,14 +145,6 @@ only be enabled when the tasks are pinned to a homogeneous subset of cores and
 the corresponding PMU instance is opened by specifying the 'type' attribute.
 The use of generic event types is not supported in this case.
 
-Have a look at `tools/perf/arch/arm64/tests/user-events.c`_ for an example. It
-can be run using the perf tool to check that the access to the registers works
-correctly from userspace:
-
-.. code-block:: sh
-
-  perf test -v user
-
 About chained events and counter sizes
 --------------------------------------
 The user can request either a 32-bit (config1:0 == 0) or 64-bit (config1:0 == 1)
@@ -160,8 +157,6 @@ userspace must treat the upper 32-bits read from the counter as UNKNOWN. The
 and should be used to mask the upper bits as needed.
 
 .. Links
-.. _tools/perf/arch/arm64/tests/user-events.c:
-   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/perf/arch/arm64/tests/user-events.c
 .. _tools/lib/perf/tests/test-evsel.c:
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/lib/perf/tests/test-evsel.c
 

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.53.0

