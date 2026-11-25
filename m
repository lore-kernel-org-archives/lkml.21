Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630160;
	b=f4WLgEwXPPmDRBN9z8EtBqtQ3sGHqIIy/dSMwolgQGzCMfPtaL1wpAekNn0+pWZdG2yp
	 tcRC3ndt44esWpYDSMYgtlTQIBiXM+zYLRXhYBXSSt34XNGbhX4eqKBdczPmhO/79Ud+n
	 US0BVAqxG5GHzYoQs9P1JCNsR7dPm90AeIogbhBVMMje2r1TglSvDrqEp4wlVkyYRru5G
	 mjcJkAGTxSPf8QUTFgSzzfy1lzz4BmEMUh7GNH0exhvZ3EGRp2sJ0Q8Zs1MAZBXzOWmhf
	 teQuMf9cpl4+0IOFPNilJ81jDVxHCIks3+AZd0xAWQOZjTfmyRlrPnKvNkxaiC+sg0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cG4RLLEisLeuv1nOnGbVHMdbGJ1Wto1enwMwozM53pk=;
	b=kg13yXPtLi19fwJO0x+hrTw5vhmEuzG0Ap7W6mW+j4WC1mlDdcnee9jwrsmPuRwnFYOW
	 LN65EN7Yxam2MfrY73+i6G9SnVbTL49t68gEnjBjZrRo4mm20YPsfPc7HQRpShfa90srJ
	 TDLR7lGDlGpIzK/uDpPAF+76vJsLgZJ6rv1/sGYE8dgwNXZ68q9o3BwUlvQeSkQ8wU1mB
	 Yje3U20C0E/Q4VDqxHg4Xe1PUnrimDWMWV0615w32W0KJmmtBVAOae4MQbsBrGLa1vuyw
	 qwQ+d0EQ10OsfkCrx2o4Qk6qeY+sjsT1CDkhKr/g4ljxFfqWnUDcfyMpY5FRUW78XVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=opDCLUHz;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0808606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:09:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0808606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=opDCLUHz
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-38190551625so12059602eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795630159; x=1796234959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cG4RLLEisLeuv1nOnGbVHMdbGJ1Wto1enwMwozM53pk=;
        b=opDCLUHzaV5+Wfq9y8kHe0DAkBuHzAjldtQ2UWfWWgbNnH+T/5J5qxJiwFKZFGcd+V
         Kgj4AZQVkfJYH7SbL8sHvGF4wzQFgOUDOa+A1kZX42uocIdrMfYutsk0cTFLx0pwWlki
         YCcKQB/gn3DgfKyFORYYSC3M+Dns3rq+dmKp0fOUcZ+dzBUJ8SWCQ+E8M8Dme6HzttG8
         RTWXeLO8UAZdwcgusieB71zSiUBrFcmDDOTshUClKGGLn3yNfpqLb2tKbJWSAfF4l/II
         8eXTgh4ehM/Gdp6AgfGym/kmEtQ3EC0o1cbV+a6OjO18p/NdTetcn4NGJIKlBziQn4mV
         DwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630159; x=1796234959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cG4RLLEisLeuv1nOnGbVHMdbGJ1Wto1enwMwozM53pk=;
        b=BGcNuTmvWVXvGws6u/xKzygAK2fKJ5H3ThYVa7Lp2cpk5KFVZ/0tTeZhlK5Ab+1Ck/
         18b5SLrm+DXzK6qiaIrFhlMNQWHdUTrtIpEKW+UnSfQC812JA/f1ng/WrXoCMgR22051
         6hU44sbKgWTfSJdN7HieSS76Xur1Wu70lX8nLRys1slr+Cv7hd9FzAFoWH/5b+Bv/rdD
         48ahaGYetG9JPal8u1n4q48NF+7ntS4+0kjZ8NWGUoGBnfC4hpygPS0AbgIlWC/BnaVV
         7CFr0B3Go3VQIcIZ43jyV6DhoHaFMRG3830lAMrvXYAn0vNsOzSMHCpDW70IUrfMG90e
         Ykdg==
X-Forwarded-Encrypted: i=1; AL+hErHM4IymTOy/RwGFVyxQHKnqk8sfTQBe65heImaG6p7bUHbwO27ZmY350GJWjq2XgIHgSUcDXKSEJaGCCL4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pq25td1yFK4byHLS8VOj0z1W1VxdUlfmWL03Kywy9CRk0qiKX
	m6cNwX6Jsmm4472l9E3Wod6XMK/0TGIo3/io8JAbzkBZAeKXRN8O8L4D
X-Gm-Gg: AZFdTZePbPeQHlyHiVnurImcJ25u7+0oYItcECXacuG2HrgO31RHkq/ohnwOxKMmBe2
	R9xuV0dgGLpq7BYp1Q2hZ9wSdYF2WKK/BHayLITIuP9J1iOH/29SUyaioA4sMXlwuCv+7WyX2BI
	VFfSM7aIu7XngoBrSEMtfN4fFahLocjQvHFeQwkbKLKO97dtgSwicECltyHCTzrbDt7vYvz9k4O
	gqXEF71IgXSpaCh/ZIomiF6vtrDj2b/evThxRfyGOWwVyEDsPrnWGE74jv11XxqMg81Zt+I1Q9v
	PDJRBloSJ9bsSHMwQxPl2y7domwqRoxFMG8nkr3baREZn/SKwjSakLyfwbgc97udP5HT2DFZWj8
	yz7kWKpzZFi3my9LsukufIvSKhzuENioX38J3H9xh6C8Cx0VzhusqxfQhxFz6AZsPE0PgVY4tN/
	A6qxWw90dLBu1ScIyH2Q+qtfR3SNnwKRx9wWmUAniVtZ3qRp1bwoVzONCVitSxfKkQtpQbDsOJ/
	Z+nGwvcCtFzFhHKRks6vOYHc1oL25Kw7WvK/m1JZ7sOxA3o/C3idxJslOuLa6yh/72OY2Yk1ldH
	5V1TuQFqQ1BjifgLP5ZB
X-Received: by 2002:a05:693c:60d4:b0:37e:fac6:7ef1 with SMTP id 5a478bee46e88-38571120627mr19259410eec.39.1795630158685;
        Wed, 25 Nov 2026 10:09:18 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm98983110eec.3.2026.11.25.10.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:09:18 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH 2/2] perf build: Make check-headers.sh fail on a difference
Date: Wed, 25 Nov 2026 18:09:12 +0000
Message-ID: <20261125180912.2388197-2-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125180912.2388197-1-takano32@gmail.com>
References: <20261125180912.2388197-1-takano32@gmail.com>
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

The script collects the stale copies in FAILURES, prints them and exits
with the status of the last echo, so `make check-headers` succeeds on a
tree whose copies are out of sync and cannot be used as a gate.  This is
what it prints for a stale x86 cpufeatures.h:

  Warning: Kernel ABI header differences:
    diff -u tools/arch/x86/include/asm/cpufeatures.h \
           arch/x86/include/asm/cpufeatures.h

Exit 1 when the array is not empty, so a caller can tell the two apart.

The list that fills the array has a typo: include/linux/list-sort.h does
not exist, the file is list_sort.h.  check_2() tests the source file with
-f and skips the pair silently, so that copy was never checked.  The two
files are identical today, and the pair is compared now.

Verification: with a difference in either file the script exits 1 and
names the pair; with none it exits 0 and prints nothing.  Before the
change it exited 0 in both cases.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 tools/perf/check-headers.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/perf/check-headers.sh b/tools/perf/check-headers.sh
index 531c0e0e84df..3211e5f3dd9a 100755
--- a/tools/perf/check-headers.sh
+++ b/tools/perf/check-headers.sh
@@ -28,7 +28,7 @@ declare -a FILES=(
   "include/vdso/unaligned.h"
   "include/linux/gfp_types.h"
   "include/linux/hash.h"
-  "include/linux/list-sort.h"
+  "include/linux/list_sort.h"
   "include/uapi/linux/hw_breakpoint.h"
   "arch/x86/include/asm/cpufeatures.h"
   "arch/x86/include/asm/inat_types.h"
@@ -231,4 +231,5 @@ then
   do
     echo "  diff -u $i"
   done
+  exit 1
 fi
-- 
2.53.0

