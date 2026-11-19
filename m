Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795114346;
	b=xX5athRYZHHh5JUsm0bxWQq+THhr2vyDb5S3b8rScOVz1PlP2gAbzmFAujufEdACjDcP
	 oT0lQwe94t+x6f9TVyY+6UCb6so0yrfi6ZqGOkUsPhchfHVeP4JZuxGE0wQN/sKvIaHWW
	 IMi2PgSRPH+J0lrW6qVsQADlvgHBR/H31Oq86wpDGENOiW2OsFPdWUC2yTanYauDQl+jl
	 qsJ7xQ3QiDRebPmu/un0Lj46RAFOVFvXX/rxgqjVqeRsILOtZixl7pfYLVYWm6sDpf/v1
	 NSjdEMYDj6gvpTx/WUrraA6sDslODHLGVbv2oK5q6bZkOeH3jbJt00TSG1zANqlfP8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=pLq92bALDfzVSwPCFwlrCOZ9rlSOsAmXjgSBQp7hHGc=;
	b=VnZcDyrB8SxhBp9zcDtkHHIKnaLyEsbosvkgJji9GxeCDQ1hRKBnrnFWkStPjqY1leZZ
	 CwB6fBB6ytQi13BDwP8gDpDOYAXm2tJ2hXo8TzpITlkN2dqj9SRsukoPxWLOuiaBoKAng
	 P2RR71VO6FVHuLV0fXBKxpuxCk6cKSX8JXvd783LBNQzJOJ3wuS23EnM1dJxHfEHSxw8y
	 5AyEKbTpBwjwoa0J3YIj00O21Yo6PSFYwzuFzodV7rtBdW6r8enJ9xCfxwIM8nAr0N5kH
	 kP5bhzzFxdlINJrqXxyvY+KHkV7u766bPvioAr4Dxr//jlBUq6vAGp8IMYo1PXtDabQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Tk39+s2P;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC26360A6F7F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC26360A6F7F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Tk39+s2P
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4e778acdbc6so171526b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114345; x=1795719145; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLq92bALDfzVSwPCFwlrCOZ9rlSOsAmXjgSBQp7hHGc=;
        b=Tk39+s2PF7TzJCqELszbOhUyF4TYDgFSc/xNOI6cR3l16fmcVNtuohC02GSEIBYfjJ
         8lyf1v1YWJRA0pHtYPiFRUZk1x+qt7hbgEQ1+Sfq6aA1qdH277jleFQij8npLpsEgo+Q
         GLOi3fjdHLmqOTbwgd0L+ATBcdhXzcuo81CDJYR0FLJNT2dcvt9PO2lAt9GxrE5Ltyic
         OXv2BF4klsX1OW/d8/cWZR6tOyqh0uzlT/P4U1Y5YxU+DcCawNy6iinsACcrR9l9/Qu5
         TwDBryt1RZuU+kd/qnguQFYSHmrO6oq/+3p+VY1b7Jg9CVW8fOF8UJgptO0s/ncgyQ2q
         r4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114345; x=1795719145;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLq92bALDfzVSwPCFwlrCOZ9rlSOsAmXjgSBQp7hHGc=;
        b=GTtkvphzi0YX5MGk1pegPApqpuwmcg1JiDjw9QRD9C+1nLRKBat82OPouwyNDjfFRh
         5Zy/cHuDRATy5dk8bdKo1UzdjCDEppod/QIVwP3ajS0TRkEFRz9WUDo0eJzoVSMmAcb/
         S3umJXhk/igNzTr9X7E721XDlmPnqu/ZwExDKgaA+IrRtJ74kHbcLKJYLFYJjOFXeR1X
         RMcSRiX/MUQJqXCRSdbDx0vyuZ0sYpy56Ylc0pyAJEShQVaNjEsHEPeZXCUeC6SwNVGs
         1+ykdjvvH653iNWmtcMuciPAND9XI8qTALpHbwhXE+ZUHby2Nj39+mEcmSFnENYPWPUN
         TADw==
X-Forwarded-Encrypted: i=1; AL+hErHQLjKa7nM2P0nQ0sWY20+GNg1+/XkL3BYV82wg7lsj14uAsQMnJCr/G3JcMJkG4wsPqe5TdDbY3rWZXDc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ca/DrygOk5KW9hctN4onlYgdDUUEO41ulxP80XEmRGhGSR9m2
	D4RUvbdghodUKBqB4qTqmoFSGozI9rWrayFjw3C0uVTdJ5lgxfauv3mYzNkPCRtm3yPuvWDHpqq
	qkCzajXtAMeJ+1dY4t1RWg0igCA==
X-Received: from ioo10-n2.prod.google.com ([2002:a05:6602:864a:20b0:9c7:8645:9285])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:178b:b0:55c:8ed:4db8 with SMTP id 5614622812f47-57a0cbda8b5mr953892b6e.62.1795114344372;
 Thu, 19 Nov 2026 10:52:24 -0800 (PST)
Date: Thu, 19 Nov 2026 18:51:51 +0000
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119185215.632334-10-coltonlewis@google.com>
Subject: [PATCH v10 09/33] perf: arm_pmuv3: Allocate counter indices from high
 to low
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, James Clark <james.clark@linaro.org>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Mingwei Zhang <mizhang@google.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

MDCR_EL2.HPMN assigns low-index general-purpose counters (0..HPMN-1) to
the guest and high-index counters (HPMN..N-1) to the host. Allocate host
event counters from high index to low index to minimize collisions with
guest counter partitions and avoid rescheduling host perf events on vCPU
load when enough upper counters are free.

When allocating a 64-bit chained pair (even counter idx - 1 paired with
odd counter idx), verify that both idx and idx - 1 are present in
cpuc->cntr_mask so an odd HPMN boundary cannot allocate a guest-owned
even counter as the lower half of a host chained event.

Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 drivers/perf/arm_pmuv3.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 9ce915754b0a5..667ce27d2347c 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -957,10 +957,12 @@ static int armv8pmu_get_single_idx(struct pmu_hw_events *cpuc)
 {
 	int idx;
 
-	for_each_set_bit(idx, cpuc->cntr_mask, ARMV8_PMU_MAX_GENERAL_COUNTERS) {
-		if (!test_and_set_bit(idx, cpuc->used_mask))
+	for (idx = ARMV8_PMU_MAX_GENERAL_COUNTERS - 1; idx >= 0; idx--) {
+		if (test_bit(idx, cpuc->cntr_mask) &&
+		    !test_and_set_bit(idx, cpuc->used_mask))
 			return idx;
 	}
+
 	return -EAGAIN;
 }
 
@@ -972,17 +974,22 @@ static int armv8pmu_get_chain_idx(struct pmu_hw_events *cpuc)
 	 * Chaining requires two consecutive event counters, where
 	 * the lower idx must be even.
 	 */
-	for_each_set_bit(idx, cpuc->cntr_mask, ARMV8_PMU_MAX_GENERAL_COUNTERS) {
+	for (idx = ARMV8_PMU_MAX_GENERAL_COUNTERS - 1; idx >= 0; idx--) {
 		if (!(idx & 0x1))
 			continue;
-		if (!test_and_set_bit(idx, cpuc->used_mask)) {
-			/* Check if the preceding even counter is available */
-			if (!test_and_set_bit(idx - 1, cpuc->used_mask))
-				return idx;
-			/* Release the Odd counter */
-			clear_bit(idx, cpuc->used_mask);
+
+		if (test_bit(idx, cpuc->cntr_mask) &&
+		    test_bit(idx - 1, cpuc->cntr_mask)) {
+			if (!test_and_set_bit(idx, cpuc->used_mask)) {
+				/* Check if the preceding even counter is available */
+				if (!test_and_set_bit(idx - 1, cpuc->used_mask))
+					return idx;
+				/* Release the Odd counter */
+				clear_bit(idx, cpuc->used_mask);
+			}
 		}
 	}
+
 	return -EAGAIN;
 }
 
-- 
2.56.1.708.g77570a6a1d-goog

