Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048225;
	b=jSzkeyERLHWAD4OveL1JnxhBSKDIh11UdJR0H9xoYIYOpHmC/ES6pTVrDX/qJYHi0a/6
	 I9azTPbtdYfpF8LhWnYM+N+lWT2vnlEitpNK50PmT4VbgmvFx0v0f65i29DpR3NZ916iX
	 tp4aE266TWiDqELgFFkRrdKPdfpoLRA+aELEFSq+T96LMc4zYjRpgN238QWld/1A+1oMx
	 CsjQaH9zXbzuc7Dl5B3Rhk/HFMwOhhtc79XqV674JZr5ohLxMQeJxt5kbhZWo6i6oStw4
	 kytbDGFDAietUa8O9VP9qJA6TcAD/qy5yUfZFIFHUEWBwJCUvgb/NtldTt3M9MT2/bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QAnazgbAEbBUyJvl2IrarULxEN8A8O9+J2KxABxOX8o=;
	b=YuxF2Wc0Qeb+whH4CEMSFmsOJtGp70HYknaEBebKsoqNqHRKRvDNDLTiN7Bl2fDMiPb+
	 kK5zb8Hft1cuy1xSR8t4/w+8yH8ezvSpyTkvcc9t/mJ8gLO4G/wUZKDup8xo60HwCTkeM
	 lezt05M0XH1EqHg86uH1Z/H1s2bStGUhDBsXJy+xtDgyZYFsyMROm3JcYggfvxuQ8zOvl
	 bYuXBZUIu5SZAKsqIXuxdKe9ldwUa/DVycpPDOp3f/v/+hlOWUNbpWyOjRXSLlshHRi63
	 JgcTJPZH63x7oszlGSmoSUf5EuIM64I8B5lr/Zmr0X6IuhSuID/xNoaVnWfPmo5exTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pZOt97z7;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB29606A335
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CB29606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pZOt97z7
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c505a0acbc1so37797866b.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795048223; x=1795653023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QAnazgbAEbBUyJvl2IrarULxEN8A8O9+J2KxABxOX8o=;
        b=pZOt97z7oXYPDrXer2WA3LC4yS2BO044M6yHvur62qVooM8RRujv164PxvZTmPo/pC
         YTEyg0l2pdWvhT0e5vGapkbYWYaYe3zfm57V5SEkCRSwoYTGKPt+j28zJ9yFfRInOOuB
         lzSi+wlIQEF81Lp9DT3Umx/ywacnX078dJoyLGYL9vOlkpyQFEyjy/DF9LiNhwPi5EyT
         Git1WOgf3JoINy8xjyg1h/YpZYHcf6SXMKRVkDFoTJoaB7P7W4H0f0kvgM7IIh+8lO9R
         X4InlCI0k0LphUqOqKDtpA8OnIVQAbh7KPZ73XVJDa8x/3ujv3VJNy9ATUKlAHSKa9HK
         Biww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795048223; x=1795653023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QAnazgbAEbBUyJvl2IrarULxEN8A8O9+J2KxABxOX8o=;
        b=IH7M6WqRUDCvqIqwAjOFjfSqPgfk/5t91CbYwebOhzB4LLWom7Z7bGZjgzMHCt279K
         wL8wNWGEXCjVYWEVvb+JUFIarfQEku+jnIFNEtaJhdCOUUZRGF04llKdZdI6pA6e1Mts
         TsmRSJHpdfSqM7wIxvvzUgOToajpM4bGlm6Lf4M1zppB0hF4WKXCEhWSuXirCXJoKWPM
         tNGq2Nk9Sp63pyfP+k0jiVUAS3bVb6e48vdE4EHUWvDUZDTnNWT4GT2X/Fjje3CUxz1v
         k3nC4ZcPtLhJXOi+TPFK94wH2xeDFFc8O4F+fHCJUTKyLWki8m0lRLHwVsN8S+cphuQy
         kWyg==
X-Forwarded-Encrypted: i=1; AL+hErEAIQ5t6mxpjknRvd0KfX2ksuFB5DICtuqRk3A1tTHNme3S1wh+3MG1gL03+sFU4P65JKuqzsGWXaf991k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/i0YzWe3hukKmZ4q0jWJeda3CyGeQ7Sc4DsbBCdnsLf3PK92zP
	W3MF3GtGfiggi3lDGAT8MyEMh9ZJOMxHdP8k9UTsPrWdtjBWrj4KkhlK
X-Gm-Gg: AYBFou2+2xVeijtlR/Fx7KVPjCMkcJ/DKuKMtQmbBeW2d7CeQ/K4m6ei59ZsUYvWmVs
	BuGiHl+xiHxmMlxM1wnZRDJTRaRMDyD7SSI3boH/w2jDj6wIwfAafpS6dsbWUCxEfM1s699f6W2
	GFAjWVc3C7COIKQM4y94ZrTcSmCeTWfZFJ6cqkakr1QtLqiXm+5+BAX/NAjHWxzWdfdn+1d790/
	z4WZMqyIYSoRH/u2bWHXXmDxW7dn8fnUZapAwJ6OMl1gkYj4dncJ9u6JqDdH2tm2xDp3ul4JBrc
	VGuLrZio5HZmzjKb2r+o7JnN0A8QGWZW9nOzkt+3gxR2LUwUFUxqQ85fWl2xcP4aLxf7yexH/fU
	CJmF98vcbxAQvdqbGhPKObeYjwdDMJF+i2wdv/Jkypw2j3842kYZwyp2IfUlujF97ESrmS3GA/H
	HmX/IAmRIsG8DZa0Nn3LEVlmvRe5Bmq1Lg7h5xTpR7LyLeWhaV4L5I1bQsHgL0j8evBsLviSoFU
	DKLHiEQpqRNUlrfIuK9ojHEyMKntwxL6k8crd3/zoGTZGXOjihlhp870x83jcqIsk25sk3KWTAn
	A3JzVmsPfpSqlhAKdvV16blxqCZayYBxRz+2UDakdkX3JPiZgkoawgVrk7m8U75ebIHFl8w9aQ=
	=
X-Received: by 2002:a05:6402:2422:b0:6b8:4f3e:62c8 with SMTP id 4fb4d7f45d1cf-6b8877decc6mr4950784a12.0.1795048223372;
        Wed, 18 Nov 2026 16:30:23 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.208.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b88a001123sm1729744a12.21.2026.11.18.16.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:30:22 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: tianyi@cloudflare.com,
	hangbin.liu@linux.dev
Cc: kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net v4 1/3] selftests: net: veth: propagate channel-check failures to exit status
Date: Thu, 19 Nov 2026 01:30:00 +0100
Message-ID: <20261119003003.40482-2-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119003003.40482-1-emmaonana18@gmail.com>
References: <CAG4wq-d_30-B4wQZu48ZQXAORM4QxRqPfmYsmoHS0hiYp1EtTA@mail.gmail.com>
 <20261119003003.40482-1-emmaonana18@gmail.com>
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

chk_channels() reports mismatches with a "fail" line but never sets
ret, so the script exits 0 even when channel counts are wrong. Every
other check helper in the file (__chk_flag, chk_xdp_feature, chk_gro)
sets ret=1 on failure, and all chk_channels() call sites expect the
check to pass. Set ret=1 on mismatch.

Fixes: 1ec2230fc721 ("selftests: net: veth: add tests for set_channel")
Tested-by: Tianyi Gao <tianyi@cloudflare.com>
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/veth.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 64c2a5a59821d..5c1dbe1516bb4 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -130,6 +130,7 @@ chk_channels() {
 		echo " ok "
 	else
 		echo " fail rx:$rx:$cur_rx tx:$tx:$cur_tx combined:n/a:$cur_combined"
+		ret=1
 	fi
 }
 
-- 
2.43.0

