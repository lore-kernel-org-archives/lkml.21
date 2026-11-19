Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108001;
	b=P+CFqdfteVKIn0waJoaLVcv0ZfIhqqTmwSMsRxk6Xnvoic4oQfERv0cGpmwiZtneBDWF
	 qLC0iZylG0wFSicTT4bOjwbeI1gJX+G4PtqbkCccSvG1a9Aa/wyq6wga4L3dpCEDozp1M
	 dYno+l6W/mGgjeBYMtvne6DFZLutnNjHc8DiERbPrJ19QK8ctkgQQQ/c81+tNfsJktvWe
	 35bll64oL3oWvBPYc/G2Z0s5REzengm/lZR0/0pAQP/ouHnLGAP+yLj2Mw2D9a+ZaWMLo
	 iCq+5u0IhkLNSFa7h/Tg71YyJH0ndD5oPWfBMZENzcBOgq0aehDDRx3WxK8xgRcabgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=F9rpw5yC+CwnnMf+RRz/bADcuyoWhuGDUJSy47EIYmg=;
	b=WtCDIgN6yE+dYKuP1Z6Ehhi/t79QYybZiHZpTnbSoLxuTonqLxqaHn658LZjVN4YSoKA
	 g6Gu7ecxKVAKGmouEorgtluRum5Owtn8QcQ0pRBn0k9JR1w6nhMD4BKxWOF625DMeOjH3
	 jDeANVA+YE5SKRatrOTOelLVvPUtmZmmueh88D451S1/qfF6T5e0MaRvADwEcRrm5zyw7
	 gV0xtGPNPeCdh+Rm3H1Hg794ZXxx8nELZ5Q4BlIZO7b5cQL+TBEVlH1n8NInoFYMA7Zcx
	 Ss59vYS4JoK4SZVFBJSjQfSMgTyjFLtvE2pQabHC2WhRtrpbdGLzF6hcbDj/Sy8Ydtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JjcDLcip;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D83606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68D83606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JjcDLcip
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3b5b49cabso2093855c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108001; x=1795712801; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F9rpw5yC+CwnnMf+RRz/bADcuyoWhuGDUJSy47EIYmg=;
        b=JjcDLcipm/D4g0GDnifVcL7v6roG4oy3Eh1UtVPDG6BcGAnkeUk5wnWuIJWo9IvaK9
         8h5Gp4fsDne+vVf5FTSOKHC6dwDBXIHEbcI8rx1kpMBsUcvU6wXuG/ClshFUxpKCqSGc
         HC3pO8p8RmhQJklohvt4NIfMt0SPXMQIvaxvTYuKQhMQ4q/bWl01pvXAUjtmgcMj87L2
         OZ8nE1wJWZbKJr0pAAvtpH+KbdSXNS9tgQ2lnwDajU8ogZSAK+4ChOGHpPSmLRLctu7x
         2oVWFKCEkg2qLYcI2AQRe7v15lgPjntxqJjBtcd0TI9ccfHXCln1X84m7C48Z8Enbvjn
         BtAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108001; x=1795712801;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F9rpw5yC+CwnnMf+RRz/bADcuyoWhuGDUJSy47EIYmg=;
        b=MXzfHSNSee+qXmbHgsZjnu2dHFi8mtWHoJfkyBQaILWysy1ohcsIoFjerp381WQiPH
         6trUtZ9L6B0iuC0yVu6Um1XqgjWeXfRqLfhC9iGDjkBHXzoQ/NJeBr7aJ5GW5Fhhcl0e
         ztkQMhDvoZLSwalzGV9H/SS7VLTzJ7Ed30ansZ8t93gHxL2nAY7oB4uGxcRNgR2eVQQ6
         6L2FY97rcOMoAF1QuX7JyIDi8kCsfJtx9TgwD/NFX7OJqfFAPIbwXT/bSzUDR25IegMT
         ErioGsO3HMum/u4oB7v6rEJcVAI2jsqefhX8cTWqCB7fEyvA98+S9JWLO/Kf/7aqOKPO
         EwSg==
X-Forwarded-Encrypted: i=1; AL+hErFLB2DklYiykyDISnhax93SOLiA7ngGKJGqLOHljOvO7JXJDWQiShDAuTBnhIBUJd1aw18D7OfPb8AX/RA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/frTpAwVCzjSG8yubKZtVPXBQDcA5tIlykjXaga7xJnuN3xR2m
	ueTgPpeat1ELCx2rX3aFCXqR2roU3NtaMmc5+W1lDwWOh25l4zGu4cf/IbNVBQn4t/gGkEX2+DL
	LurIbY/sOAg==
X-Received: from dlbrx8.prod.google.com ([2002:a05:7022:1708:b0:1a7:44f:3bc7])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:230b:b0:147:a685:9125
 with SMTP id a92af1059eb24-1b5567c0421mr210863c88.2.1795108000056; Thu, 19
 Nov 2026 09:06:40 -0800 (PST)
Date: Thu, 19 Nov 2026 09:06:36 -0800
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
Message-ID: <20261119170636.1520696-1-irogers@google.com>
Subject: [PATCH] kunit: fix uninitialized err and static suite kfree() when disabled
From: Ian Rogers <irogers@google.com>
To: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>
Cc: Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Commit e38f53f04824 ("kunit: Return void from kunit_run_all_tests()")
removed the zero-initialization of 'err' in kunit_run_all_tests(),
overlooking two live consumers of 'err':

1. When KUnit is disabled at runtime (kunit.enable=0) while any suite or
   attribute filter is configured (via kunit.filter_glob, kunit.filter, or
   CONFIG_KUNIT_DEFAULT_FILTER*), kunit_run_all_tests() sets suite_set to
   normal_suite_set (pointing directly into the static .kunit_test_suites
   linker section when init_num_suites == 0) and jumps to free_out before
   kunit_filter_suites() runs. At free_out, 'if (err)' reads uninitialized
   stack memory and either calls kunit_free_suite_set() on static linker
   symbols (panicking at boot) or stores them in kunit_boot_suites.
2. When kunit.filter is set without kunit.filter_glob,
   kunit_filter_suites() never initializes *err on the success path (or
   on !copy OOM), so 'if (*err)' reads uninitialized stack memory and
   aborts KUnit execution.

Check kunit_enabled() before merging or filtering suites and jump directly
to 'out', initialize 'err' to 0 in both kunit_run_all_tests() and
kunit_filter_suites(), and report -ENOMEM when suite pointer copy
allocation fails.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 (-Werror) and
-Wconditional-uninitialized; not boot-tested with KUnit kernel parameters.

Fixes: fb6988b83b4c ("kunit: fix use-after-free in debugfs when using kunit.filter")
Fixes: e38f53f04824 ("kunit: Return void from kunit_run_all_tests()")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 lib/kunit/executor.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
index c798a02470d8..5525f4da0bc9 100644
--- a/lib/kunit/executor.c
+++ b/lib/kunit/executor.c
@@ -189,8 +189,11 @@ kunit_filter_suites(const struct kunit_suite_set *suite_set,
 
 	const size_t max = suite_set->end - suite_set->start;
 
+	*err = 0;
+
 	copy = kzalloc_objs(*copy, max);
 	if (!copy) { /* won't be able to run anything, return an empty set */
+		*err = -ENOMEM;
 		return filtered;
 	}
 	copy_start = copy;
@@ -382,7 +385,12 @@ void kunit_run_all_tests(void)
 		__kunit_suites_start, __kunit_suites_end,
 	};
 	size_t init_num_suites = init_suite_set.end - init_suite_set.start;
-	int err;
+	int err = 0;
+
+	if (!kunit_enabled()) {
+		pr_info("kunit: disabled\n");
+		goto out;
+	}
 
 	if (init_num_suites > 0) {
 		suite_set = kunit_merge_suite_sets(init_suite_set, normal_suite_set);
@@ -391,11 +399,6 @@ void kunit_run_all_tests(void)
 	} else
 		suite_set = normal_suite_set;
 
-	if (!kunit_enabled()) {
-		pr_info("kunit: disabled\n");
-		goto free_out;
-	}
-
 	if (filter_glob_param || filter_param) {
 		filtered_suite_set = kunit_filter_suites(&suite_set, filter_glob_param,
 				filter_param, filter_action_param, &err);
-- 
2.56.1.708.g77570a6a1d-goog

