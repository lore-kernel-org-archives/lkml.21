Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795520031;
	b=I4GFNmP8zV3L7FvKUNHm8syrcmtp4Lgm0DWP4FkR0gqhnhXAiu4a8G8mwmMWr3is1Kil
	 O/4kRrXFTFxOJo5xUMkRLcTKvwODScgKp9fbabI7WE2xppOI7yoQaZWk88O/MKa16rT5R
	 39hqCSKvGXXrTqn/NCBJ00jdy4yfYJbyY4RpPwtQTvP2phijY5b+EYekon1HQVuJi9wZD
	 /YZLZjNcfExfBT+3TmHpzA0vUOIFosJRpV5oL7caK766E2YKBWOdkHbW8760cnlcf0tjn
	 qBVaIY3eZ+mBytcKQq5xDixODxeziVWGHnJp5I3YN+znmcjcI9AwlCTMoWJtEy0DnMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795520031;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=1J7Web4u1psnSF4QBdJ6aHCPuKUAX0/CwZlSXWic3/8=;
	b=DVv4Or/lSsVZzKU4Lde10m5ccAGGJnnT8ZcSvUrJodLu1ZBKuCCWTfpZHsl3vhqYfdM1
	 HOYDZ6AcuMo8x81ua71650L9rQnO3hrI+hvhYisNgwCu0/nubSyj63r9Zs/I9cKanrhEG
	 ZhudmO32MdyevGJiB5KNYpdpnyJzElWdTmiiDpbIWJND0L5I+pXuGLSi+D6J0w/Bp7WEi
	 SmjK5FBYVZ76dtf86SJBCPiy3dQbH2OfwLXQlkZkqK8LlGirKTb3Zvys5yQTpmX43RBi+
	 hoHGpAS0PdZmUP5FjKWyDgAM48tbdBsdUt7eOGEngy5tj4VF0mmOKuSI39qLfw9ySmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Spn7587T;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41749606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41749606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Spn7587T
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so34925725e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795520029; x=1796124829; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1J7Web4u1psnSF4QBdJ6aHCPuKUAX0/CwZlSXWic3/8=;
        b=Spn7587Ti8W9cVT2FPz9CQAEL9DMYhjHK/NIWHzepK06a3cCmbGsbKyva/M6ZQqSem
         sbZqx9t7qOWJmtaVuCVhNZHi4JHVXcIzQHAiLco21CVq6X9P60lzvr+5plSbXI9/UaI5
         msSX2zxbTJRYCVRd5GyYewUkUHq6OKqqCmnJqdhwG7jP3Epgs8F7dwqOHPZbu0uSMi0+
         x4KV3fHfvT/HsPdPBHenjFEBsO/XvuqLDSIfAbNtQ0GnFlGiw6NszpJE2rOAj3/CzLJQ
         PpfhrdNN2dtZ4HxcY8T/A4iHypxxpIqWJ/08Pas/ZkpW/IZLm82y7MJE1dgh1ed/PUAe
         DobQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795520029; x=1796124829;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1J7Web4u1psnSF4QBdJ6aHCPuKUAX0/CwZlSXWic3/8=;
        b=gDXtQ2Z2xuNx0pZvfrrBkaXFFJfW445SLHPBhZylrGm+0nBYxcAqqFv/UPuN1GnNqR
         xnUpGh3iUmivX3YVkMHPHpVytuFiiBdP3pgeRx3HmK1hu1tZpYuAlHoXKCaYZQZ14vAc
         vuDLzAJpx+8FGXRWx+yu8tA9caM70RNEJ9FwR8ZRPTtSRvTA6lIWOE1xrjyheYJlwP5c
         dFSanCb6tSQ0JTSdADYCipe1D4wja5/1VNzMXaevNGAMQEgPYx6eNrAPijPJKACVZXCF
         Zi8GXsr0vfKrxiLk5B6sMOwsUV3h76MP85WdHybhdR6BfykEYKzquoNmLjkQWfvf/29a
         mnmA==
X-Forwarded-Encrypted: i=1; AL+hErHR86Bi4lDpQigx1JJYKkzEU6xR2TsmbFcmKwABQJcb33fmCazSmlLZhHjoF3ryE6xUoA/1SNalJ3N9dK0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8z+GOtQwY3hQXt3un6wrq1JGBjZ5qWMcg+wEZfgMozGsjEkAL+
	gparLZ+Af8gxcejbLE1SkWoZceLQYYHjtPbinNVHScdTbyNE1DHCOD/wND5KQgAFukU=
X-Gm-Gg: AZFdTZfR5v3t4XDM/qYjyvFUlnnyLJ/H5Mpb97WUo3QyhA2i4VyQ4TlSUN9sY05OF3/
	6r42BiWJLcvjxoyxWHBwuwXgjKSIv0eYmk9v6KvwpLD/qNTw/c7qYJXxHIKymE+l4PxSXgiCK4M
	QPlMYJRFiI3dSrE9+WuVtGz4n0KbmgpngTdTNC2qxV9yb1uFWdv5D1WYip7z56243nny3JUFGM9
	SZ/twtEJPRaxagVsnMMawTA5mtGYwVIY/ghrbPQlSTIcOfjLglcfCjXq7vZlluq5ZL51P/Ewlp6
	KSrdx4P63iaANHrKzqeEYtiFqMY0YPS5FMhh6HYZEYaf9fbdMT9n6V5mXWMZxtGqk4wKT08diWG
	bvk4nwl9a0jolHMXoo0sCwYJsg/jdYdrlpTczswnDnLrJzYc8co30pkldWwS1bgdu9zL7SdpqDA
	5foX/pDsjJ8K2RfSLwSj2j2i/W3pGGMQfNdySrhHqKxe3PY69vj7mCMcwtJ5NpiTyzqzTfjuQY6
	BF6vB8OsXdCdZOKAgH/dGy+cdUYLR1fYpVG9TgOphRaI34cW0zknif1bPJ1nSzMAlMo74Burkmn
	nQkYpd27dFwRzAho7Q7w5nTdO1MZxCNSaHxh/ZpkBhBxNL91+koBmw==
X-Received: by 2002:a05:600c:670b:b0:4a6:30c3:1114 with SMTP id 5b1f17b1804b1-4bb88922df3mr273001885e9.12.1795520029457;
        Tue, 24 Nov 2026 03:33:49 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067a0e6sm186691865e9.4.2026.11.24.03.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 03:33:49 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Tue, 24 Nov 2026 11:33:33 +0000
Subject: [PATCH v3] perf build: Stub out __guarded_by() on older Clang
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
Message-Id: <20261124-james-perf-late-parse-attr-v3-1-f9e906dd9da5@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAx2BWsC/43NQQ6CMBCF4auQrh3TFkTqynsYFy0MUIKUTCvRE
 O4uxY1ujMs/efnezDySRc9OycwIJ+utG9ZIdwkrWz00CLZam0kucyFkCp2+oYcRqYZeB4RRk0f
 QIRBkqFSeFqI4qJqtwEhY28eGX67v9nfTYRmiGBet9cHRc3ufRNz9dTQJEFDWaMqqEFrl8tzbQ
 ZPbO2pYfJrkp5X9tGS0TGE4rxTP9PHLWpblBaovJS4jAQAA
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
Changes in v3:
- Fix check-headers.sh diff warning (Sashiko)
- Link to v2: https://patch.msgid.link/20261124-james-perf-late-parse-attr-v2-1-cb8b00d904a7@linaro.org

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
index 024e303188ad..b6619cdc295c 100644
--- a/tools/include/linux/compiler-context-analysis.h
+++ b/tools/include/linux/compiler-context-analysis.h
@@ -60,7 +60,11 @@
  *		long counter __guarded_by(&lock1, &lock2);
  *	};
  */
+#if defined(__clang__) && __clang_major__ < 19
+# define __guarded_by(...)
+#else /* !(__clang_major__ < 19) */
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
+#else /* !(__clang_major__ < 19) */
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

