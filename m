Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795244335;
	b=gdguCfBEwTmkq5JZHiFBd7e33KeJF5xRWyvmFmcERAvPUvZDpCELPe2IuHVfWW6VWkQY
	 UnxR5YbGDHHWJhd5OB9VZcEkY2vhDAywwCKL/LaQtrp14s4hZ8Ymv4o3tNGMRrXxeq0n8
	 1OF1JMjGR/MfnJJQjAkh+pY80+4uU+4abR/SfBwIMFI9JgbrZFMabhhfp182jKtamZ+/T
	 HGjYDp3W0WQE4kuTuQ+GI1kNDOOr9X388JRdEJ2JDFalvlAr/TnZjbOIr34dX9/nEg99d
	 iEuQ6f15skw5UZo1fxyEfJNen4iNNcFbRnmjpMSYDipde83vui4V2o2GDPBwO+UX0eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=fuvtSLQkw2xn+flfUo7lSRyM8NUUkLIzaxviYb0ux+A=;
	b=ZEYIkRnirGPdvAW8iUx+2POF/cYYWK834+ZnUVoeNVtdbRaR9sYmkatDogIYxjmWs6cG
	 t77wVDXAyhw/bxfRWO6paQsTI7Df2UMx5lMk2NW4IXI3ZW+ZrT7ruxnvk/IN+hvc5b4lb
	 vkGfqsrg2AZeiIAcOMchX9I9HAr34qwk+OemDi8LpWeHDIttkQ5SIJQGNxC5MTIGWBOUn
	 ikEXqRBEsQ20koQlQpQp+ZB8RxNGCFwjcZrFj1bawePtT3cRu3+G/4QzKxZKBTn+Fosqu
	 SugL/71DBOh9pIcdcpu/2yDfkUtttoc6n+NpH0j6TQWirNbDdWqBa+8Ski7bEay+yjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ApjPnM0W;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC76606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 06:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FC76606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ApjPnM0W
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so1732097a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795244334; x=1795849134; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fuvtSLQkw2xn+flfUo7lSRyM8NUUkLIzaxviYb0ux+A=;
        b=ApjPnM0WSy+DEjdxx4HXB5SaWqeVaqag+bp6fZgUE04lay/Z/09sMx3Fcc4za8tgIY
         w3WYxB9bQhSOYGyK1GPJGcFDVXKpfzio1NAn1Zd7Jgd5LoQ51+/a0GayJmK4K5BLZLI8
         6PIQ72R271ICn5hqYHKT2MZKtZwD3DXaKBjExptYPnUPOBgTXtpSxJI71pWyuNW+4xyC
         S9BzR3Ao+sm4DcPl1hFehw3wBNj96z4DigKGRNaW/cVKwUfFO1YJeMid9bSPPNAd3QUn
         OR+yAE86+asFeoi0xc3smPWoW38wOUr439/BE/5rKPA3SPspwD1l688LV/3n5Rd+0giz
         QqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795244334; x=1795849134;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fuvtSLQkw2xn+flfUo7lSRyM8NUUkLIzaxviYb0ux+A=;
        b=1N8dWNFqqdeyNONpbOC6iRYwhz7pZ+JUPZWymuwchhn8Fk7zfjSNORT8aWM/kpEmDf
         YT4pj6XXhKA3akJeOBEsHaFN12XXh6JRjLXCe8U6qR+TX9oUr/5WzaytDzey5J6Y0Mnn
         VRRUfbAx6aFD7K3d9uecEunWqXpwizBIj03jXViWLLdKYRMSYS8dmnH+v+87yz2zWYHr
         IPn54UCuah18ul4MGd3rddset0Y3dRI1tBBH9ygB1lRHl4M//i8xzfnm74/7X75C3r7o
         F2bnQCiuyLNteIo1Rxyj9OajWZG+dG0xZssaKQNfkKrrn/h6lHyGInOuZPT4ehcJ/zxL
         eUhg==
X-Forwarded-Encrypted: i=1; AL+hErFQzi1kfsZZqsIEUHDKPqrfJByryORlQiHvJNtygn0s3QNDxwkCEgtiU6lHF5mBIVods0lHglcV9+eD69c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q58O0+oXKSAerJZFEGkqivLGObBcZvLHlFGIFAEhziI3taziR
	9Dc1xFEAOe63z4nVJz3v4HRV3JCZPBpma0KUGXUU51hkJLsBwny87fMbT7j6MpELDO/2NkYocgE
	a9ngeeVIqvw==
X-Received: from plgw12.prod.google.com ([2002:a17:902:e88c:b0:2ed:4e53:853d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:164d:b0:3b3:a575:846a
 with SMTP id 98e67ed59e1d1-3b40a5de1bcmr4960690a91.22.1795244334321; Fri, 20
 Nov 2026 22:58:54 -0800 (PST)
Date: Fri, 20 Nov 2026 22:57:54 -0800
In-Reply-To: <20261121065813.4143649-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261121065813.4143649-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261121065813.4143649-6-irogers@google.com>
Subject: [PATCH v15 05/23] perf build: Enable context analysis and Clang
 thread-safety flags
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Weilin Wang <weilin.wang@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Define -DWARN_CONTEXT_ANALYSIS for Clang builds so the context analysis
attributes in linux/compiler-context-analysis.h expand to Clang's
thread-safety attributes rather than no-ops, matching the kernel's
scripts/Makefile.context-analysis.

Also include tools/build/Build.include (updating TMPOUT to place
temporary probe directories under $(OUTPUT) when set) and use cc-option
to enable -Wthread-safety-pointer, -Wthread-safety-beta, and
-fexperimental-late-parse-attributes when supported by Clang.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/build/Build.include  | 4 ++--
 tools/perf/Makefile.config | 9 +++++++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/tools/build/Build.include b/tools/build/Build.include
index cd0baa7a168d..cce5e4673ba6 100644
--- a/tools/build/Build.include
+++ b/tools/build/Build.include
@@ -113,7 +113,7 @@ rust_flags   = $(filter-out $(RUST_FLAGS_REMOVE_$(obj)), $(rust_flags_2))
 host_c_flags = -Wp,-MD,$(depfile) -Wp,-MT,$@ $(HOSTCFLAGS) -D"BUILD_STR(s)=\#s" $(HOSTCFLAGS_$(basetarget).o) $(HOSTCFLAGS_$(obj))
 
 # output directory for tests below
-TMPOUT = .tmp_$$$$
+TMPOUT = $(if $(OUTPUT),$(OUTPUT)/,).tmp_$$$$
 
 # try-run
 # Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
@@ -121,8 +121,8 @@ TMPOUT = .tmp_$$$$
 # automatically cleaned up.
 try-run = $(shell set -e;		\
 	TMP=$(TMPOUT)/tmp;		\
-	mkdir -p $(TMPOUT);		\
 	trap "rm -rf $(TMPOUT)" EXIT;	\
+	mkdir -p $(TMPOUT);		\
 	if ($(1)) >/dev/null 2>&1;	\
 	then echo "$(2)";		\
 	else echo "$(3)";		\
diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 1cee80c531ab..aed2e952c8f3 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -12,6 +12,8 @@ ifneq ($(obj-perf),)
 obj-perf := $(abspath $(obj-perf))/
 endif
 
+include $(srctree)/tools/build/Build.include
+
 $(shell printf "" > $(OUTPUT).config-detected)
 detected     = $(shell echo "$(1)=y"       >> $(OUTPUT).config-detected)
 detected_var = $(shell echo "$(1)=$($(1))" >> $(OUTPUT).config-detected)
@@ -63,8 +65,11 @@ ifeq ($(CC_NO_CLANG), 0)
     CXX := $(CXX) $(CLANG_FLAGS) -fintegrated-as
   endif
 
-  # Enabled Wthread-safety analysis for clang builds.
-  CFLAGS += -Wthread-safety
+  # Enable context analysis (linux/compiler-context-analysis.h gates its Clang
+  # attributes behind WARN_CONTEXT_ANALYSIS) and Clang thread-safety checks.
+  CFLAGS += -DWARN_CONTEXT_ANALYSIS -Wthread-safety
+  CFLAGS += $(call cc-option,-Wthread-safety-pointer -Wthread-safety-beta)
+  CFLAGS += $(call cc-option,-fexperimental-late-parse-attributes)
 endif
 
 include $(srctree)/tools/scripts/Makefile.arch
-- 
2.56.1.750.gf70dc682cf-goog

