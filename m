Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795876097;
	b=y/p2zqaY7HOREvYfZU3b6Mt33fPtCVTgiBwQdd/oB4IQtWHeMAbT3bo+DAWnTZgC7J0W
	 YpIu0fXzAR0cWkDSpS1spMsv+NTvXCzFuWFXLxPSr+2NLVrCxZwCDF7+UaGNoFqms+Fzc
	 kTT1OkdBVcd2HJZXUbQr3LzulBKC5OsJlEFBv16gIAIlNbIWXGF20lvZNJvtfTCv2nvUV
	 GxTwZvyrqh0wzjvBCCCxE8Ytc6bFcjFDiW5o+uSFJZGH6n4UrB5X868Hsk1XIaftO1Xg7
	 9af5RC5/EBPQxAMoP9X2J5FKr9+KF6isw0dAu8uWg3F/mvQPVFHWMLFQDZ6a7B8jxFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795876097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SVXDDamLHMF92XnuX0UjakXuHcnZyMGPGvNPTWLGMxo=;
	b=bQe4Q4Tfmw8iovkKaqw9/iVKFnC+Hn+1rVDobzmlZePg2rkCNVBA7nj5jwQMlOMYtHZf
	 gLOG73el0Dt2SG8lwsgKYbuId71hXzzkX+wcXgXdK5py8fQhL2E9oMauDaOjLWYFXcLF1
	 SPtmHFhXiNLm2dfm4+dqIi2zNE+lBUy7htJ+L02UnnN4ZuRp8aCHULiMnF9Z3E7gOM7Lu
	 lgFcW9BRCTII5UM76jMa5bn7Pgo71l7u4N5Ql21LdXPGbfJGyn3BgKdfpAHkseD+WkoCW
	 LDn5VB8IBKe4R97Nefxs3jnraZZDoUBNW5CiSClS/qbgIp5jyKGOCNRZP40h8u9S3zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ece1USJV;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706B4606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 14:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 706B4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ece1USJV
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b894d9a075so9940021a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795876096; x=1796480896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SVXDDamLHMF92XnuX0UjakXuHcnZyMGPGvNPTWLGMxo=;
        b=Ece1USJV+dGTn5Owg1jCUwffrcrgKvqQOTDu05sdL7GQYK+8jyRf69VgBxqm2/5Bul
         7lg1bUinaEEgR/evmcR0/+DhgsMGsod/LG3FT2aTl7uCIzYmilu//qljKzFg1udAm4b7
         E6kvEiK/GyQHvy6oXYfn+yPXb/2Q+7gMziq/DDdbPhTTtwC4d8Jv4Z8ZrDx4vA6CUf8W
         wCK0Jwp3xTgG83ABKn7epoWfhD24lO2RjOX4a0IAAsXBt6AUq2Sw3LSsEUKGUyqVGxX+
         wVv8CRWFLOxid7EXsxQvgbTP5ztWnH+018szdP4nmMXYBgnB8DTqRbJV6/hLfq0B73Tz
         H3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795876096; x=1796480896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SVXDDamLHMF92XnuX0UjakXuHcnZyMGPGvNPTWLGMxo=;
        b=S3kWOvDf8mBtUEo8uHRVD7BI06B1z5HPyVXMN0AEW0XBGV5ULXfin1f/++foYMKe93
         GsPglCJ/754PqF07b3rp8R2K5wahekrMU5BXpO5355UQrjO5EhVl8QD9aGQigVawiHyK
         XSEUUGy/BYq7CkKJzSJYzx21DHQ3vloXnhb/p2i3e6MzEEa9u4Jo/cWLgqDdKEN8DzN7
         5RZUyWm+Zpi+0YHjy9W3wH9zmn9hcdBHUai6g4zIDYNRhN9+FLj4/LzvvPxM4yTrBjUH
         V72oZoRF5i+FjVfJxCxcjKZVpOIigwEKgrFNNOUCrRQZlN5cawD5JUrMQ5pFf/iY0SeQ
         ijYw==
X-Forwarded-Encrypted: i=1; AL+hErHMCx17jdcDMY3xIVbPibB26olp4lKArv/Vcl9Twb6Uu+nVtMdedC+vLd3jPozrnE4ur1y4KOKnJj/FpYs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8G5FGPqujOf4Hu7JJoFKfLj2Buxt4m2BpI/KfcePbIrdJwjrW5
	kSrE+tvZz2QzYLUlW6giRlbxtJlwrEC1IF8ouzrSpOctT1EHBCGjZCWc
X-Gm-Gg: AZFdTZcqdRPQdvKJlNf50/DW9QGxSxhXogYwicDGwDbShFQMATNDoTNhNA6DuU8g8l0
	PcS5K5wKNc4rczEEZ3i8WoiokvNjzuwvuizDkB3HPzKpGgUFx85odpvv8+v6p/zYpBtBwgSd59X
	snfslvi5lZ/KlcUQltoyHjQtFPiOxVQ4Mx2EoGVoqvqe4wCzsrq1eQOHiJLR5IOGc14cc0ZQGsT
	ZrHks5A5EenITN5xxXR3iiMl/tLdtH3SVBySgfY+asUMsrTxoXFhzMZ1VbHctq4N4gzG7FXf7ox
	9WWhAvSm/gd4dYp/zuQLjlc5n0WM3bnzjvvhhUgNZ2BnQC93A5G8zbj2ab0PVcjWiu3ApqdEHs0
	cdaXW1Eyluf4z7Ufh/7OGwLjCvE+DCLFMizE9B6I03h37cBRBl4Td0xApQbPK7f2j/9B4rAFfS2
	/KNDP4CDs13JMSUdZVqhA12Up6Xh/8Rqco+P/aGBZQzl+zTzhwDs5fI4TYrLoDN0ZICo6p6hjAS
	l5WavzEsR0QYsozRM67Op5Cq27VydXE42/n3QuOoMGZq62L82BjKI0vQhIK+0MOwRBwICNFJ/bv
	7oEA26BQ6SECTZU0qiqYiaFGqOE7lzIdyjcO6wYFs7bUkFcvK/L2CxDPiyajeZc+U4fTP7WdDtd
	zRYivfb0qckIVxs6F
X-Received: by 2002:a05:6402:249c:b0:6bb:7b37:2e09 with SMTP id 4fb4d7f45d1cf-6bb7b372ed2mr4454533a12.32.1795876095428;
        Sat, 28 Nov 2026 06:28:15 -0800 (PST)
Received: from kernel.. ([191.40.25.3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36e35ca6sm12448436a12.4.2026.11.28.06.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 06:28:15 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: dave@stgolabs.net,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	boqun@kernel.org,
	urezki@gmail.com
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Kunwu Chan <chentao@kylinos.cn>
Subject: [PATCH v3 7/7] rcutorture: Accept TRIVIAL-PREEMPT skips in kasan-aux.sh
Date: Sat, 28 Nov 2026 22:27:29 +0800
Message-ID: <20261128142729.3756679-8-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128142729.3756679-1-kunwu.chan@gmail.com>
References: <20261128142729.3756679-1-kunwu.chan@gmail.com>
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

The TRIVIAL-PREEMPT scenario selects trivial-preempt, which has no
callback or barrier operations. The kernel correctly skips the
KASAN aux-stack self-test, but kasan-aux.sh rejects the saved flavor
and kasan-aux-check.sh does not recognize the expected skip.

Accept trivial-preempt in both scripts and require its skip message
and a successful torture run, as for the other skip-only flavors.

Cc: Kunwu Chan <kunwu.chan@gmail.com>
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 tools/testing/selftests/rcutorture/bin/kasan-aux-check.sh | 2 +-
 tools/testing/selftests/rcutorture/bin/kasan-aux.sh       | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/rcutorture/bin/kasan-aux-check.sh b/tools/testing/selftests/rcutorture/bin/kasan-aux-check.sh
index 7a6f425975207..5518ca507557f 100755
--- a/tools/testing/selftests/rcutorture/bin/kasan-aux-check.sh
+++ b/tools/testing/selftests/rcutorture/bin/kasan-aux-check.sh
@@ -25,7 +25,7 @@ BEGIN {
 	test_name = "rcutorture: WARN: KASAN aux-stack call_" flavor "()";
 	success = flavor "-torture:--- End of test: SUCCESS: ";
 	skip_name = "rcutorture: " flavor " has no callback/barrier ops, skipping KASAN test";
-	skip_mode = flavor ~ /^(tasks-rude|busted|trivial)$/;
+	skip_mode = flavor ~ /^(tasks-rude|busted|trivial(-preempt)?)$/;
 }
 
 function fail(message)
diff --git a/tools/testing/selftests/rcutorture/bin/kasan-aux.sh b/tools/testing/selftests/rcutorture/bin/kasan-aux.sh
index ae7896658e94d..6b6d9971f03d7 100755
--- a/tools/testing/selftests/rcutorture/bin/kasan-aux.sh
+++ b/tools/testing/selftests/rcutorture/bin/kasan-aux.sh
@@ -157,7 +157,8 @@ check_results () {
 			}
 		END {
 			if (!valid || commands != 1 || !multi_shot ||
-			    flavor !~ /^(rcu|srcu|srcud|tasks|tasks-tracing|tasks-rude|busted|trivial)$/)
+			    (flavor !~ /^(rcu|srcu|srcud|tasks|tasks-tracing)$/ &&
+			     flavor !~ /^(tasks-rude|busted|trivial(-preempt)?)$/))
 				exit 1;
 			print flavor;
 		}' "$dir/qemu-cmd")
-- 
2.43.0

