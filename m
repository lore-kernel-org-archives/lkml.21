Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452419;
	b=rU6sOn0dxfEWB5jpYJB9wMFcXIxTNZJCIdu+AwiEe1iPUn/BmNCewBcOC5CwbjJFSQhP
	 igCTkLB8znOiYdo0yVEw+Ce1witNoxlxyRgBhpmYrF+z14c3KZeypC+K6E7+9Ut7raier
	 P9/tMGWsyTKzph9thISP2oY2jhiyaUuZqAsiSsE4FR1VLSMR6+VVEgdSN41O39YDHQ6XS
	 N3F6+fqro2e2qHA6s1q8zladuyyHq9h7oLCmdHO3pWG0cPr3b5FRS4yjR4aqgnpgbTrDm
	 VXks1oLsOi2KhUEN/FpXhf9xNZnprA1BiCFdzAG2dsBwe/T9xbdcFfav2UBm/lGQY0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=38ThHGN7lYw60F8stffW8ELZ5EIKExZvYvBv6qCER8M=;
	b=P945UJWLGJk88fdwWuXC/uUc3XfHfoffSs+U1DuSKPkB7KnELD4eHgtVku2h+6M4rmKN
	 iFAchyC8XzChwaEF1jV0vYD5K2W7IRfgsDgRA8PVGeARKSElzj+7pkcwR5xuqw+cRW+uT
	 w13UtgJY+R0yTqEuaX+uP97d2/Vx83cxTbf8vjUsvZslBEPpgf4mXKzdbUIlVkBjTAY+e
	 WINjUcpivks7HzsU5G1VQclmFFTxSA4H3erCd24+9jpAx9Gfwhzn9QvwJN1zwalXAY5ue
	 9MTTwglVilYf3wg7JIRQJRV+iqHGGXrESK8DxTBGUabsqQ/k0aPqMiPZUSjJ9qlWw5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jJC9oaSW;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D4B606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50D4B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jJC9oaSW
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so29738985e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795452417; x=1796057217; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=38ThHGN7lYw60F8stffW8ELZ5EIKExZvYvBv6qCER8M=;
        b=jJC9oaSW7CD6jpJ1jOiTOA3zsBPz/z2c/NP21tUzNtSOhbywSVGN7U6oA/koRxRuBd
         Ck0x5sEn5YhXWAXu+OnJ9cW2M4JPmm3yzQBr03X8bpeiwESMAbGZvgpqpX4tPlwpZa7I
         /BhrTxzbstx4+MlIdWMfirMVjwAa7vqt8RxH4A3kyB9cUP7JIxOgrK9arK2VQgpLMXyI
         AsY35X3pxCWybG8b0LzAFK+xv17C26vyYF4t0VY7AbofZ+ttMLh7zCHRzPWMGuWYZTuJ
         FcCjK2VUXDV5p2XjDe03bJ6U/J1Jx/lENHoDdI5PRatk7yCDBo5PxQgPpO7MQes7Cuuz
         MPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452417; x=1796057217;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=38ThHGN7lYw60F8stffW8ELZ5EIKExZvYvBv6qCER8M=;
        b=Xk0+J6D6XbcHqKCcugsF06efNfpZklXXrZ/2i3C06pEO5WQnzM+AbfGLEtMLIOLknw
         eWxL97GbXUdrwVroXM7Dx5HgWs4y5MEb7a/Q2MjL9rkkYm1RQM+SZ/iAPHPvyDVfeXYZ
         fiae0jr9vMeKDXB0r1H0VOGwr06oEIlAkqde5ziiu4xVmP/+VvsNwcJX1p+o7tuzP9hu
         GjwVum4ZUorBdDoFjJbB59lqxu7P0NY7o7qDlrUmxmqfSnns/nmspZ1j07lkF8mmb3SN
         rcAok7+AiLxBm1eOqB2ZCV5wVW9iHOPeAItweGeQYe7vmXiLXKPFTqrSjnjeNbxCpVdZ
         UbIg==
X-Forwarded-Encrypted: i=1; AL+hErFUYsN0vwJXOtdsy1QoGKSri75LOCysCIyZ4a36gsoyVcoSv5dCmGrJY4QRpS9slSvLObdaUQndhYUY5oo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/P31ihB4Rn9w+Uqq9Ld1c6UPXAfuR2M2Gfzq8HU/8keHIwa8ix
	qVWJcweOxwKc6ff2cyKCuQaXHWx/Uv245wIyEG8/72vuWW6ay3pN3/gQjcn4aST6yc4=
X-Gm-Gg: AZFdTZfRZJcdlmOrKqpEtL0ux6yi2mQ3P+XO4/XIqaB5bxur9re8F+w15IVuJAjY3V3
	AL+c44yp6gSrG/INBIKBZz/xp1uTEO4fEyK+E85DRdZCYHqVwscVDkUUzZmRwq5vkKTnvuISoQJ
	4lR1GcUq4TqBLIGyZ+d+hP7rJhgokHeaZX3lkwBf/b3od7loaf8lrDNx2VmrhMvTGRzNWpJ5f8b
	yak+vZF+s9gs06MvTFfC7YNnXW67ppq+u5OPSjL2IBbIM3x+V5u1A91NVynGcb0h0fizJ4SqiPV
	cYohFHKAnkgvAc8px5Mx9KzBMvL9ZdxkXSBZF5H1Gpnj4TBFtsy4BLL6BbAHNqkMpks4NYfeBnd
	AdbpF9tgv4hixbr15wR9fJDGKbPFhY33ELL7rROwkdrupbJk+nnAywHLnDB4C+BwdPC+I6UuvOL
	aXVqtQjypqhYjxf1mOb3XQIRc9ANo22PZi8UNRVd1UhX0s9p2mNp8IN9BkBBCCkWwrNXZyXn3kK
	Or0Adz4JT83H1SAEa8Rxs7DyArDk0DHtdr+wokIff6ANMnUJ6K85XKYhtFp4mgUuNHhlcNp2Naf
	xtkO/pwjaRJ38BdFxpQE8tegahh9gRWC
X-Received: by 2002:a05:600c:a085:b0:4bb:7bee:5496 with SMTP id 5b1f17b1804b1-4bb8880f04dmr270221135e9.13.1795452417425;
        Mon, 23 Nov 2026 08:46:57 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9065744esm163707885e9.1.2026.11.23.08.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:46:56 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 23 Nov 2026 16:46:38 +0000
Subject: [PATCH] perf build: Only enable context analysis with Clang 23 or
 later
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
Message-Id: <20261123-james-perf-late-parse-attr-v1-1-cfebcd81a962@linaro.org>
X-B4-Tracking: v=1; b=H4sIAO5tBGsC/yXMQQrCMBAF0KuUWTtgUi2NV5EuxvqjKVrDTBSh9
 O5GXb7NW8igCUaHZiHFK1l6zBVu09B4lfkCTudq8lvfOedbnuQO4wyNfJMCzqIGllKUdwiha3v
 X70OkGmRFTO9ffhz+tudpwli+I63rB2JKa89+AAAA
X-Change-ID: 20261123-james-perf-late-parse-attr-4e996381859f
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

Context analysis requires Clang 23 or later (see
Documentation/dev-tools/context-analysis.rst), otherwise the build fails
on older versions, e.g. Clang 18:

  util/env.h:142:39: error: use of undeclared identifier 'lock'
    142 |    struct rb_root          infos __guarded_by(&lock);

Only enable it when the Clang version is supported. Leave the other
thread safety options enabled if they exist because they don't cause
build failures at the moment, and might provide benefits even without
-DWARN_CONTEXT_ANALYSIS.

Fixes: 321967859933 ("perf build: Enable context analysis and Clang thread-safety flags")
Signed-off-by: James Clark <james.clark@linaro.org>
---
Assisted by Claude Opus 5.5
---
 tools/perf/Makefile.config | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index aed2e952c8f3..f5adceee5589 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -65,11 +65,15 @@ ifeq ($(CC_NO_CLANG), 0)
     CXX := $(CXX) $(CLANG_FLAGS) -fintegrated-as
   endif
 
-  # Enable context analysis (linux/compiler-context-analysis.h gates its Clang
-  # attributes behind WARN_CONTEXT_ANALYSIS) and Clang thread-safety checks.
-  CFLAGS += -DWARN_CONTEXT_ANALYSIS -Wthread-safety
+  CFLAGS += -Wthread-safety
   CFLAGS += $(call cc-option,-Wthread-safety-pointer -Wthread-safety-beta)
-  CFLAGS += $(call cc-option,-fexperimental-late-parse-attributes)
+
+  # Enable context analysis (linux/compiler-context-analysis.h gates its Clang
+  # attributes behind WARN_CONTEXT_ANALYSIS). Requires Clang 23 or later.
+  CLANG_MAJOR := $(shell echo __clang_major__ | $(CC) -E -P -x c - 2>/dev/null)
+  ifeq ($(shell test "$(CLANG_MAJOR)" -ge 23 2>/dev/null && echo y),y)
+    CFLAGS += -DWARN_CONTEXT_ANALYSIS -fexperimental-late-parse-attributes
+  endif
 endif
 
 include $(srctree)/tools/scripts/Makefile.arch

---
base-commit: eb79d2fbc230d41b009e49f20671303c6efbd946
change-id: 20261123-james-perf-late-parse-attr-4e996381859f

Best regards,
--  
James Clark <james.clark@linaro.org>

