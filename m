Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630157;
	b=vg5MZDP2OQIBpaAUydQAJZdeLzR08t7486rKjqKhs0qdEwmFxJ8lBGL+jGw7AWKAyvo0
	 n6lIpgXPqxvekzrHl/nWCBwoH/Vsjc7QzLLz+iVkw4ZzM+9qyfD/9XwkE93UYu8gElXkD
	 34otrQjXXsX1o4C40NlaWA0PWIMIYwO2IpEShen6CzW38YvwV6LgcugMzKmkm1BX5EHG0
	 iRpaAAwX1mNy6kXD8lXWtbRO96sq3hySJWNaT+mb4Yw8wfdYzR0qQH8AIc68boWun8JLR
	 gm75yW1/2jHqmOOodVdNGFej3QDTzXz+UQHxLsfFLUnOigJ8YbaPjpMLub3g17MZ3fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=n8n5tDJ1QOqDEhRtmlicy55Rb8TPjcq3KM03nYmFhZc=;
	b=t6H1c8BEY9jOr5LUw+Xy90wFE2HtXvBu4pDcHa48r8CXuM/rYrxVIMxzjc+6ByoPf8V7
	 AIRNOoam8ejHSndfXPFKaJS/vZIJbvRE0xJW6iiR8fMnHgl9lihJbTObIIXAYoj37OwyK
	 o70+55h0ogW3wbyIBr5/FInq61a/tS0Ig9p0LGj5hn7UV9n0Y19SctA4YnksDaDYS5z8K
	 WAnZ0S2zbT93NZ7F+kNh3XV1LbdbeNKOlQIgeTcusacnKhDyaaRy4auXHvBFDc7G9PQ82
	 IO1fNbzTyqFA96fFKBNAnIhFzMF3bC0r2w7kb9P2hFmcGxsprXM7mkF4Kk/IJRsip4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PMkj2F6l;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92314606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92314606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PMkj2F6l
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-38190551625so12059491eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795630157; x=1796234957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n8n5tDJ1QOqDEhRtmlicy55Rb8TPjcq3KM03nYmFhZc=;
        b=PMkj2F6l9Kte4r4QCIegXGVBJYBAWUVVgBZPDs/+h67BY99iDAMnxIbu+mfxpR3wPL
         EGyLZkCVK8khjxw2zgIxaDsd/NkVCW2OnHJqqoYcb58+uOrk6qlCaXyAz9DjlR0PSEip
         +r/uExs0fuiSkgc/qdh7JDfDIgfUaWRlUtzHaF5z/HQ6M9SBtGmDoAzEI8cbUOdndDiM
         HUSCXBa67p3T0brBxhbYuGSKdRSxQLKP4zcOHpCmj8MzE3nJJL+dFZIRkFPeUpA6QTaK
         m7lxwQ0t4qzn1GZ9arQEEIBj8JiUlccY1Qs2FnAzId05hYHhMRa7+IiPSmfGhPRbCziT
         JRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630157; x=1796234957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n8n5tDJ1QOqDEhRtmlicy55Rb8TPjcq3KM03nYmFhZc=;
        b=qKmyRPttKkqfvmFzsp3bDjdLA94e7zXT0zVTgLZO195HZdseO14geqMKANT1wSreda
         jM6y7zYchc6zW7OaXfU1Z6Gd/9x+ifebPnJxaWh+31XCR3VVribRt9noNbwfMzwzR2i1
         fphVjfZMhqOB13BCsv8QcRwmIpccAqjU0QSqYVNa5a4/D7/RgMYboVztHqTiE2FIB1fJ
         G4GrvwYWgZ+Ruycwm8Z75yKUY/8uXrX84F8flfKSLGUdxOaadDAtfK898xuR55mnb8eF
         w383jff84IUSTCq/avAI6hUe0X6JLmO7bZN52gXy59LfzHnP/T6U+7aUjHe4Hl0VlpIZ
         2o2A==
X-Forwarded-Encrypted: i=1; AL+hErEKFLqr1NZ2ZPpM/Denr7SxyVwsXJwv1c830RYXmXHHxsQ7Cu1CZhvU6dFW4abXPCmEq5hw29dZPxY7oI8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7IbM2EUCX/o0MmemB05o5CbRwUHLRgrqXed7gb1uENkSQjWgx
	DXoQFYGoIdqED40TheP1nVh+7muwBynj5qzIaMoNbPWovoKdGMAcDJAs
X-Gm-Gg: AZFdTZeOypZY9B4gPxI5I/WmkjG1ylvCVVg7khwd3vN3NU4F3ay5QjeDsK/appca4dh
	16C3TVi3IWp6bAiJMQH8HhbHanFq4klEmh6UOE2Maj9A7YGSCEuMBjazn8WmvxFckWuiodiCp5z
	BDFAS+7us3LGe/4ix13zgAk9a3309zQ0OrKKrXQ8CHVqmRTaLDk+oi2of+qc9lcfeVccXinuZyA
	Jh0FoSsap6IOBlKcZROgmFglYCFUEehZVrsuKRyVyC49qU6qPNiutTh1htCfGiN3qxeePYlbwWx
	clPXHKTs6TyQkz1bZepJTCJITeA5ceaO09MF8+nBiJRJ4ULcY65bx5fXZAGDLbdAPfM7aobmFTy
	oTaPC6CyVbVRM2O0XVFfZw76HmuRhHdwYV7dRqMOSe05ms0OMFQNLZwNDAcA14INOMHapzgnuAt
	k6/DplxG1qV6BJH4PNV0AmvEMmCfzdD9pW+pCn5rNVTMeh0WQuC9gP3i2tVavwIKGsczfJrZ6e2
	jcDXgaHu7w5rtW41PJN4PYdS/GEXUOBYuLXYMbNgKZRqtfJtGbie3YlsQcTRF3LuI2TAYiw0oid
	o0doOfepHWnnQ2yb2Il4Ft1zRaQGbp+Es6bZtnDE0w==
X-Received: by 2002:a05:7301:6188:10b0:386:9ba8:2864 with SMTP id 5a478bee46e88-3869ba82acfmr13784633eec.0.1795630156307;
        Wed, 25 Nov 2026 10:09:16 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm98983110eec.3.2026.11.25.10.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:09:15 -0800 (PST)
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
Subject: [PATCH 1/2] perf tools: Sync the x86 cpufeatures header
Date: Wed, 25 Nov 2026 18:09:11 +0000
Message-ID: <20261125180912.2388197-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
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

X86_FEATURE_TSA_FILL_NO was added to the kernel copy in
commit cf27412f19c9 ("x86/bugs: Mitigate TSA on AMD Zen5") and not to
the copy perf carries, so check-headers.sh reports a difference:

  diff -u tools/arch/x86/include/asm/cpufeatures.h \
         arch/x86/include/asm/cpufeatures.h

Copy the line over, which is what the script asks for.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 tools/arch/x86/include/asm/cpufeatures.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/arch/x86/include/asm/cpufeatures.h b/tools/arch/x86/include/asm/cpufeatures.h
index 61930f0d4578..303467a498b8 100644
--- a/tools/arch/x86/include/asm/cpufeatures.h
+++ b/tools/arch/x86/include/asm/cpufeatures.h
@@ -432,6 +432,7 @@
 #define X86_FEATURE_CPPC_PERF_PRIO	(17*32+ 2) /* CPPC Floor Perf support */
 #define X86_FEATURE_SMCA		(17*32+ 3) /* "smca" Scalable MCA */
 #define X86_FEATURE_BTB_CTX_ISOLATION	(17*32+ 4) /* AMD: Branch predictions contexts isolated */
+#define X86_FEATURE_TSA_FILL_NO		(17*32+ 5) /* AMD CPU not vulnerable to TSA-FILL */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:0 (EDX), word 18 */
 #define X86_FEATURE_AVX512_4VNNIW	(18*32+ 2) /* "avx512_4vnniw" AVX-512 Neural Network Instructions */

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.53.0

