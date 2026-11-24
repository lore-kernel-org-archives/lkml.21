Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795491223;
	b=qoNriuQoT5kL/ItO5R1h/dQlSi1c41xGfHTuHp3q9+7CQMdSxd96CKp1mDCznH0PRbb1
	 pJ34r7BOfKup80/v2UYeUbFTHaK3W+5rs0PLben9hCiX3s4SSgqG/vCFT4Dr7qnBHi7HT
	 Mfmy/FVa9V9yFe0xZnXYJJtnRdH3O6Swekor5vGcFg8H9QpfMBtQ+pB4A/pJZke009Zk/
	 f8/fgoIspVnc1gxTT/hidkyTEjBVfRV73YJn7DEvsDjb8JYBbdtxzd+pcycgwcFMpU80l
	 UaQIkMEUQh4h3ZWm8r6OMsQwzs7a3Fs/bwnIHDKAwrjPxjH88WbeX+c9xUW3QBgdudg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795491223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lP3ch59NAPtwcIuspqlGBS3z7FlOBtLkp+myFltPlfI=;
	b=2YUpt/cYbp0PX6Z+6sac2hnZnt39nqrbmb4gbXORMgRHzSLTB5Zein73aEDXqgq4AwgQ
	 /+tn1S0nnSUCacm9LODdQap49UlKiFn612nLA5Z7XL7lECJCNpWZemOA/O1sQ7LHPeIw3
	 Ku3nU6aDXuT7zDOhiWsDyjsZr6xbcQmQoN0BW5zp/Q7QI+e90rnNeakpN6xw7LS9qtBat
	 bXerQd2fKKNTJpA2Hff4H2hPMZS48FHpq5wjyRaF5jFHCcmmHRZt3CnqHQ3WjRg6hOUQq
	 U40GNcAnkjtfs1Bi7PLqkAqYQfMlQviZLBDffELHUX67EcI7rXehpB5fV1SxcG1p8vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g9qMj1DA;
	arc=none smtp.remote-ip=74.125.227.133
Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A8B606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86A8B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g9qMj1DA
Received: by mail-pj2-f5.google.com with SMTP id 98e67ed59e1d1-3b411059cd2so914056a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795491222; x=1796096022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lP3ch59NAPtwcIuspqlGBS3z7FlOBtLkp+myFltPlfI=;
        b=g9qMj1DAfbSgv7PoH2K/ov7yLNupPTQrt80IYN2IyGMQKt/62HIN8JUH2r6VxjqVjc
         wBdYQZv0nmz7dkzwhKZ/9aJxi0tucck3CQoH9+uR5crt/CJCZ0e2HvFaxk4FRtoZ9P8M
         X+AcoYaqkNKLpD23XqRkpwtkDp1wWAIgBnfrvbbfiWoUQVKbV7YZ0AmuUCdsT1BrCxKf
         KJs7Vrmg4n3r4eaujkRyJAWqs8Ci7ZjkvEQoLhxBly9Ft7fcqRtFlAthjSyY/kGr6pwC
         ipqGX6vH3amwTQzkqmBbgZF500997lie+Cw/g+XnctUUHvOtRrqYgC55hm9xyE7eFxTl
         kkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795491222; x=1796096022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lP3ch59NAPtwcIuspqlGBS3z7FlOBtLkp+myFltPlfI=;
        b=ahRscybQcVAnlutCbGlyJzMXLOcabJtu6MAr01wFKiMn50e78dn6H9j/GLXBdIj0Do
         x5GrOVS5l5Oae3ymkU7unULwekK6M1hrBV0BesCkgyT4JLN5RHbDuaedKWf1/jGZ2Ojh
         Z/nMD/Zm2QfOPOjsjwGsnixNW5mWojDlU2pA7Dfbuyz2EE0gMn+EtPtQ3y9+Sq9VA0zH
         1rdarAwMk57IzqEX6phin9665PHbVXsJOV+jBHyGyeEmWoPK4Txva7qh9CtOXt29vYDy
         DU+ReLbzMy8kC9qOEx5pw9lB2/eimXNJH3HTH6gHzBkN4vU3kWwBE3usMZDto/Bdh9Mr
         bE4g==
X-Forwarded-Encrypted: i=1; AL+hErFrK9r0zb+U1an3rnmQJvveNlDScobDPcYuEjtHxJkbrZcqTrsnXyrs6tiSzFkZ5l3CK0/Lz1WWzGoAVHE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JcFIeqQfqYRl3fDWsRIUU1OaOHf9tPt+LLFRZcsZhp+I5dc95
	1AmrfJfNv8DuUfu4PLrjiKX4yrUYOaHAHGOKC0NRQBmLE7jE+3dX0lim
X-Gm-Gg: AZFdTZeR3wyFw1GltW/Z6QBeHHtTZHXPL4xOFcgg/Ea5pE+m/hiFW5lQk4SIV+U7KIK
	tTglg8t0aXE+TeZ8lzrsDksy2ThRI5+wp5f/mmOClGGvT3J+n7cLZsYbH0eD9TZj7t46wDmaxeY
	Pj+dSFSR0j0X4+4Rus0B0F3oZAKTPzH06teFhXAyp8NB71xOYmJ+fGwc1EaWl4adC5ZOnYs7Gra
	LrqQf3Ug2og0sI8QLUscr1c33HaTlcBWcSUz2lzzdmvUlREA/WaEhmx+FR9lZi7XZIee0HiajCR
	TFQRm8P4jkIqGIAaPXf1fV+gAeqWT7GgH1ThCM6CbM0VA8qRftagE0R9ttdwIazbL/RtdX7WPTY
	rpXrBQIL4+bzfXoQPvjWvXabLQe64BhIqmLXk4b9Srl8cIKd1UdQSSEvODwBfP7gU4cRUClJpEa
	//8GSCbJ/7LGnPRjZYXpkJMjnt5EyVXGt60lVaVpAqQg6JKNzMczMrXJOGpDwp5qgVoaWcR+irI
	fEi6FdNiL1jmZZZONTvavOvnFDeifUl0m4OHhg3FEQ54HY4nq2KEn/2A7OFV9DLtA1Vraho9jjg
	2Bulh7LxVA1SuApKWJKTSyVkK8f2EGhjFF487lMvVQ==
X-Received: by 2002:a05:6a20:7489:b0:3f9:a6b6:e16b with SMTP id adf61e73a8af0-4014c94a618mr11685070637.21.1795491221907;
        Mon, 23 Nov 2026 19:33:41 -0800 (PST)
Received: from q-Legion-Y7000-IRX9.. ([223.86.210.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077bff6sm6495773b3a.3.2026.11.23.19.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 19:33:41 -0800 (PST)
From: Bingyu Xian <shanbeeyoo@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <andrew.jones@linux.dev>
Cc: Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	Bingyu Xian <shanbeeyoo@gmail.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] KVM: selftests: Fail explicitly when schedstat cannot be read
Date: Tue, 24 Nov 2026 11:33:27 +0800
Message-Id: <20261124033328.612894-2-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124033328.612894-1-shanbeeyoo@gmail.com>
References: <20261124033328.612894-1-shanbeeyoo@gmail.com>
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

get_run_delay() currently passes a failed fopen() result directly to
fscanf(), and substitutes MIN_RUN_DELAY_NS when parsing fails. Steal-time
checks need real scheduling delay measurements, so neither dereferencing a
null stream nor returning a fabricated constant is suitable; repeated parse
failures also cause polling loops to spin indefinitely.

Assert that opening /proc/<tid>/schedstat and parsing both fields succeed.

Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Bingyu Xian <shanbeeyoo@gmail.com>
---
 tools/testing/selftests/kvm/lib/test_util.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/test_util.c b/tools/testing/selftests/kvm/lib/test_util.c
index f5f7189f9..eccb03153 100644
--- a/tools/testing/selftests/kvm/lib/test_util.c
+++ b/tools/testing/selftests/kvm/lib/test_util.c
@@ -417,13 +417,14 @@ long get_run_delay(void)
 	char path[64];
 	long val[2];
 	FILE *fp;
+	int ret;
 
 	sprintf(path, "/proc/%ld/schedstat", (long)kvm_gettid());
 	fp = fopen(path, "r");
-	/* Return MIN_RUN_DELAY_NS upon failure just to be safe */
-	if (fscanf(fp, "%ld %ld ", &val[0], &val[1]) < 2)
-		val[1] = MIN_RUN_DELAY_NS;
+	TEST_ASSERT(fp, "Failed to open %s: %s", path, strerror(errno));
+	ret = fscanf(fp, "%ld %ld ", &val[0], &val[1]);
 	fclose(fp);
+	TEST_ASSERT(ret == 2, "Failed to parse run delay from %s", path);
 
 	return val[1];
 }
-- 
2.34.1

