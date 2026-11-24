Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795519223;
	b=JxjHgAF64keDMmRn3U+SfHy93Nly42qOtqW+G31d/Prf8ZmomncrtWIdeISk9a14PnGw
	 h5dOpL95vFBDorUBdVAFYxYYlAlRWE5PRzjLMtcEwy66CRPZF6mLCj/fPW+l5RUpVkuZx
	 pCVe29uMEwQUeN3QcrTtijoZuoWyCiv8NUnqshHn4eT0fdwuR3a1zv++XuyNEsaY+md83
	 Z4jRjrFGs4RQ89xSYZapb6gL3zvGHJkAngdMcF07x7bh6MgPl0Rwy2Esi8U3hTBbhp/lf
	 vHdchdUD68bPIjOGDyKfWD5J6k8ldueUOdyxmD3VjgB/P8G1GQsF+z8GFK8VSPm9aTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795519223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=3e7U36tgKq4gEQ+90CgTo1iDnNbphPgZ7xu5pUJFaCM=;
	b=bXfW/aYuBW2JhRh3PIYf3D0TJuJuR39pTU14j6+Gjg3qQfzr/pzJ6XFHb8FASgmbGQQB
	 VVDb+0TAYl6au6MN3mw6K2kd5vGpZfry4b1HKuAJRXo7tGJ5T1OLa5aXpDljoRsMW7arx
	 0bAPhbTNuuKFZM5Sd9dyJmCxOF7ce9Bjo8znL1XO0AzzM7Xz9+6GeSy625tucWbS/jkTZ
	 gWSLFPgSncbXEVK6e9s2koVkXfQ7IuWqrIdXRViGeZ+enQXh0Pb9d+M3qMi43lK9jMbDk
	 7U1ong1X5LRYRJKSQgOL6d5SYIcVcoqxHcwlqMDv5h9qMtoJB2R3qQ6DJT2YBC+rg+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=p5dQEcvj;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED303606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED303606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=p5dQEcvj
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso42048155e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795519221; x=1796124021; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3e7U36tgKq4gEQ+90CgTo1iDnNbphPgZ7xu5pUJFaCM=;
        b=p5dQEcvjGV+RRmM1EKsSu7B533etbNSD96+oX4JpX/464/PTJTdYKGGAeq4fLrYKXy
         U+syPxC9c/s0xRoWcW/VhTmvO/MM84LmWOK7NzNEd4DriFtr1MDUBweXI4d0sNoXbCnU
         DvMoyCEwTz4b1i6h7Pm+cav4VtKADY+b55EyWK9zY+aaYnRj2vUaw1eGEH3HNLWe5ktQ
         ifh6O4H+cN2CLGRNT8ZyHcFyNH9MASmTwMLbiXuszOwIVsANJ+q13hxLgab+r4igvjT/
         cSyrCk8GzLKNA/vag9ZcrA53JVqA0+iaYdmiBeeozUk1SZ5n6n2OKFECZJ9EVSu1sG3i
         qjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795519221; x=1796124021;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3e7U36tgKq4gEQ+90CgTo1iDnNbphPgZ7xu5pUJFaCM=;
        b=xdp/7mWvdLRluVml2ckzkfBcYHXx09XvOepPBaaLlOfBi0PLArOzdSq/TkZ5sMycyn
         jugyRGNCt5dKUf3IAbqJ+DfBgV7mTNTeoFJBLnKqhilB07NhQGs0lyLxL0xdWdeULh0M
         Pw8sXGT5JFYoBMcLTW+uMapr8rzZaPl7WkJSRxQtUy2BCw+KLOyH8VXf4mX1Is7PxW18
         FBbRWQSkBbaWH0tQSqGImaAGyk566MBJbNWTGstucFgBLD7Uir+Tw0R6xMVTB/IXmEXW
         IgPIzwOwkm5QuE2kB9WBwJcgW9ibEd5Lv9vtG6ZL9NieEJaU2RchMN5HGQ6rig7zTpAJ
         9x6A==
X-Forwarded-Encrypted: i=1; AL+hErG5Knba0WHFNrpoeI4655b2THGKdZpAErtkJFU1AkenF1lU/UIdOpNiiDU7ZwurbjsffwodmfHvvwL1El8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1Pl3RNNk9qRuYnSkAkPClYF+rkIMmLUk/NzvF/TlE+Og7CFsY
	hu9rNhXXGE3qNZYHu2jUE5Anrz/UnKp3gkR+8QbQia7P/9Y+iq2OeJEgS+52netIKtKS3+tmPix
	7T8CY4/8=
X-Gm-Gg: AZFdTZe/2Vuss6dykp5RPmt1YGM5aRx20mF5ndvl1P1UrNx9eLuGRiTWlYmo+jB7fQD
	naolZZSUBTcTXvMGQQus5x7N/XtsxATzHqPPbQ6B1YD1a75lJ55Nj/wIR6ARjsbJ1vEMHv0Yskx
	CbL97fKGC8aVas4Jy6MlNlkUHn+y/NaC/3sjPtKuoe1vzyjQK6WlVtVZ4tsywu5HcAK8E9fRIMp
	29s57HdWn19HkS01Ls8pD5b1TnHIF3a2zSIvtG0/e2Hj+3H4iDZ/1kvhtaPCCz5vK/br+ZpGiiE
	q4Y2ViBo2EFikCe9h7jG3IcsS1XHcvcVgi5gowF85n7CEd00Y9XLa6QSdPpxZk3dOYvM0pCOuEO
	ITejkrCQZ5By/a4hXXCyC7tFBlHld0ptNDysDuIw+752wZY3yvlAb1b6uHetsBuman6aPK6yFLX
	lie21yB/MSo83cZurIACmBvzaBTvO0jtU1ovodC4qFk7N7rIrmZ5H8SCrFXqcyBChHSOiWHqMAM
	wGBXwS+6EClji/Z887Xv0LTv2fcX6eVGJwB44S1X/gGlc1i93r4jSvQLjM5au0mdzgxun4y78Mh
	uIMzVMigFU7GRMm5DlR/rxSy1HEW5IZd
X-Received: by 2002:a05:600c:820e:b0:4ac:da92:2bd4 with SMTP id 5b1f17b1804b1-4bb887c9936mr288699765e9.1.1795519221332;
        Tue, 24 Nov 2026 03:20:21 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm504908295e9.11.2026.11.24.03.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 03:20:20 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Tue, 24 Nov 2026 11:20:08 +0000
Subject: [PATCH v2] perf build: Stub out __guarded_by() on older Clang
 versions
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
Message-Id: <20261124-james-perf-late-parse-attr-v2-1-cb8b00d904a7@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOdyBWsC/42NQQ6CMBAAv2J6do0tSqgn/2E4lLKFJUjJbiUaw
 t8F/IDHSSYzsxJkQlG3w6wYJxKKwwrmeFC+dUODQPXKypxNrrXJoHNPFBiRA/QuIYyOBcGlxHB
 Ba/Os0MXVBrUGRsZA7z3+KH8sr6pDn7biZrQkKfJnv0968/4aTRo0+ICVrwvtbG7uPQ2O4ylyo
 8plWb4IK7op1wAAAA==
X-Change-ID: 20261123-james-perf-late-parse-attr-4e996381859f
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

__guarded_by() annotations that reference struct members require Clang
19 or later [1], otherwise the build fails on older versions, e.g. Clang
18:

  util/env.h:142:39: error: use of undeclared identifier 'lock'
    142 |    struct rb_root          infos __guarded_by(&lock);

Stub out __guarded_by() and __pt_guarded_by() on older versions, but
keep the rest of the context analysis enabled. Add an exception to
check-headers.sh for the tools only change.

[1]: https://github.com/llvm/llvm-project/pull/95455

Fixes: 321967859933 ("perf build: Enable context analysis and Clang thread-safety flags")
Signed-off-by: James Clark <james.clark@linaro.org>
---
Assisted by Claude Opus 5.5
---
Changes in v2:
- Only stub out __guarded_by() on < Clang 19 so all the other working
  checks remain on all other compiler versions.
- Change summary from "perf build: Only enable context analysis with Clang 23 or later"
- Link to v1: https://patch.msgid.link/20261123-james-perf-late-parse-attr-v1-1-cfebcd81a962@linaro.org
---
 tools/include/linux/compiler-context-analysis.h | 8 ++++++++
 tools/perf/check-headers.sh                     | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/include/linux/compiler-context-analysis.h b/tools/include/linux/compiler-context-analysis.h
index 024e303188ad..2806fb5f79d3 100644
--- a/tools/include/linux/compiler-context-analysis.h
+++ b/tools/include/linux/compiler-context-analysis.h
@@ -60,7 +60,11 @@
  *		long counter __guarded_by(&lock1, &lock2);
  *	};
  */
+#if defined(__clang__) && __clang_major__ < 19
+# define __guarded_by(...)
+#else
 # define __guarded_by(...)		__attribute__((guarded_by(__VA_ARGS__)))
+#endif /* __clang_major__ < 19 */
 
 /**
  * __pt_guarded_by() - struct member and globals attribute, declares pointed-to
@@ -85,7 +89,11 @@
  *		long *counter __pt_guarded_by(&lock1, &lock2);
  *	};
  */
+#if defined(__clang__) && __clang_major__ < 19
+# define __pt_guarded_by(...)
+#else
 # define __pt_guarded_by(...)		__attribute__((pt_guarded_by(__VA_ARGS__)))
+#endif /* __clang_major__ < 19 */
 
 /**
  * context_lock_struct() - declare or define a context lock struct
diff --git a/tools/perf/check-headers.sh b/tools/perf/check-headers.sh
index c6b2ecadf9b1..caa7ab26968c 100755
--- a/tools/perf/check-headers.sh
+++ b/tools/perf/check-headers.sh
@@ -23,7 +23,6 @@ declare -a FILES=(
   "include/linux/bits.h"
   "include/vdso/bits.h"
   "include/linux/cfi_types.h"
-  "include/linux/compiler-context-analysis.h"
   "include/linux/const.h"
   "include/vdso/const.h"
   "include/vdso/unaligned.h"
@@ -193,6 +192,7 @@ check include/uapi/asm-generic/mman.h '-I "^#include <\(uapi/\)*asm-generic/mman
 check include/uapi/linux/mman.h       '-I "^#include <\(uapi/\)*asm/mman.h>"'
 check include/linux/build_bug.h       '-I "^#\(ifndef\|endif\)\( \/\/\)* static_assert$"'
 check include/linux/ctype.h	      '-I "isdigit("'
+check include/linux/compiler-context-analysis.h '-I "__clang_major__ < 19" -I "^# define __\(pt_\)*guarded_by(...)$"'
 check lib/ctype.c		      '-I "^EXPORT_SYMBOL" -I "^#include <linux/export.h>" -B'
 
 # diff non-symmetric files

---
base-commit: eb79d2fbc230d41b009e49f20671303c6efbd946
change-id: 20261123-james-perf-late-parse-attr-4e996381859f

Best regards,
--  
James Clark <james.clark@linaro.org>

