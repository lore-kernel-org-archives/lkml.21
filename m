Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660269;
	b=ZE5qDueeDRC4BeW0yTK1JBYbyj5/gQ8dDhu2Cscfp9wHF8185vZ9t0yq4wppp349g00x
	 GSOwZFV8xh9yk/79BLtL2x42eUtTwBSNRiVFu6PTWCaiM4Qo44j0Hsc5XewYDlRg1/3/e
	 qLS5cb1KgyUD9UrdPQ/h7LW74w8BhI5saxk+8ilN3abbP1Wkp7UbBvlQ2J6asezr6jx0S
	 5KXt4FwW9X9jpw8T+INs9kbFQzpE53NhgcjGibUgjyk57Phfy5Qlzn31wbDMEM/ob6kgT
	 orvGhooCLgAcJ0a0JzPkGbQ5RwpJo356Blx5suqJTzHqKz1XtjQtWns7AxgTUA0jtZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bvbkF+FagNR8/UNuqVZVR2ljn+gIjPoOIFfVu2xdwBA=;
	b=pIyu2UK6Yhdq23gXTNb9ce/AqzMve19vTa3a91ACWyNci/iJqSfgWjV50wW6DxJ/RY/I
	 +cx6VK3rVXz7mwgpZMhhKwSgwZ4DHWrOBXPe4KMNxWkdEizeHqAwqpjdrWnXBXCO/1IGp
	 EUrBDsFFt8uWGdv5lSvWAx5iwhpFTb342uADc5jqN6vv6qL3uLQ38zJ/2z7NEOtIxy10o
	 gloqEn+ompqoLCtBxY0pagOMzKvNDfDlsd7yCM2p4w1CcGr2qmjTHLYuPn+0sRJHeEP0i
	 C+mReqSATQCTKipgHKHN9hSkb0bjlMUenaqSzmr3tYjJ+NEMhCXQzfxDK+tgYYPDawg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uzNwwYvm;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A426C606A68F
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:31:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A426C606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uzNwwYvm
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a42b34e930so5623959f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795660267; x=1796265067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bvbkF+FagNR8/UNuqVZVR2ljn+gIjPoOIFfVu2xdwBA=;
        b=uzNwwYvmWZxNpgCcjtkt0YmFb7NI05MmmICXZjjwC/0O6AxtaAM3BiO/e6OGFvaOJH
         s+doCeAavqTofFOTuEbq4c20WMtbP+srgUcuJpyWmpZWRnNTJXuN8ylZTBP/DHw+ngXX
         oRFShL4254qtph3HlSv8+57yciSxhFCFqpUPa6eMC8al7yGiL2uglhzvQ7hBcsZT+xvZ
         vAbyeR5sfctNVXki00JeJmujkGgH4GzXK/cy/6dzoqH8QVmYcTNxZpsaiKLzpPwJusq4
         QvE4f4PomUq2HPclFTtpI/nHNRiqvz5fl6MNvQz0+Yn6wmeZ+fnwwkJRVuHCTVFF1g2l
         2g3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660267; x=1796265067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bvbkF+FagNR8/UNuqVZVR2ljn+gIjPoOIFfVu2xdwBA=;
        b=tlBW2Tj/Lc95DpvXrhUiRfTtZ7EhXXChsAYIaIGMVwCYyG34Kif+YnLf0J26o1cfcE
         hc7bz1ejYONKgvM0R7zT93zob8MZ3p+QvaGOer9wwrgF/k/pzdYpoqIjshJbVMKll3Ym
         JBs5qr0LOvK3YlVl4SvBh57j+OGuhmXTxl78qPAd5ZKi2w6fjRga8rbX8eT9Xed2d/s8
         392AFajDdTg9AUk7kJHk2O3B8AVG2VLcWYxZegPnPA4U4I/054g/JDM2TZEziS323eHq
         EXSOE0bXxzBifHRs76NhZ7AYIpvRthTfAPZw/2dpWU5QWOsoLUFvfS0Ny12VAh9d5uUF
         r+8A==
X-Forwarded-Encrypted: i=1; AL+hErHd14BZPXxLwWk/cyu/gTlAQGou3K2RWeZuT78IiphC+gpRmLJ3gxaoyTQiBJzm/he3AhYFbyRmSIAUuRo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DQgV+OF62qDIUaAhlkMgCw0RreaQxIPxwEPcS3glYIYFEp5JR
	pZaMmWG7fuORK5D5t4yEBqJMEk+W0PMLnGZxzGAuE+42JvLwzHDGGGYd
X-Gm-Gg: AZFdTZdoMfGMlmewJE2tosN1J2akSsx6Y7F0Nkdx3gxs8Ir9gu9m6hWX84XrN8nTYxq
	7+cxvjDi949zHK7ELxepzNz4HoEUSNRsU7JF+Ee6xqGg2XNxGO8R3PtwaxFRPB+KDKImljFsHTF
	EO4/xpgrjeNVgr1d+eaxorDrtBHWyNFM9mSB/rtB5MIRXL/4SocivMMVh0hO6MK1pDjM6/s3ky8
	foo2q0HgIRawdJxdc5raIMd7+MyKmBI71d2JFa0PU+eHO/BZqPe/bMVbrdPxb7OEBxNS9SEpRUM
	FV1MSYoVcpI+yhwxMh86FF4OxSeH+DLN9SGAvRIOrANi7mXAb07+v5+TJRhLLJtSAXiSOr8Y0x9
	dtYbeIdWZfh9emrRCO0S/7IcVfumUVwoArnB+TQxIHhWyZwbOu9IlbmO2GZsKDPurCuvmbPglAD
	B1UFJILn3kJxnZrEb5erH+2fP5tIG15lYkuU6swiM7MYwxcjvi0aibSGte9k+Gw83hu/kHuQ0QL
	MMOglydLAOPXmOg+qrxbTkPdHMWz1i36YtViOWT5s+bIvYZur7D/gwjYRS5qhdKeOiDHVvfer/2
	lypUrxpgjXOyziuVbdXIQLiJ19lVe+L/AB8kP6dqu2MkY8SFmFe/zLvML2T8D39pOrPAOTd9ndy
	4cd9KxBsBvTzrMLVBUt0ldcLkmQRtFJopKgPpnKrpWNOOP2e/D0MRV17xeO3fJPMl7sscRz3JNH
	kXNb6kyRxsSutdgEDDOKFFa0ipZj8bkDHcXNP1rA==
X-Received: by 2002:a5d:6f07:0:b0:48f:fcac:a5e2 with SMTP id ffacd0b85a97d-4abb47b243dmr35992009f8f.38.1795660266905;
        Wed, 25 Nov 2026 18:31:06 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b10e-d501-d0c4-b021-8d77-e472.310.pool.telefonica.de. [2a02:3100:b10e:d501:d0c4:b021:8d77:e472])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm37722445f8f.20.2026.11.25.18.31.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 18:31:06 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Hongyan Xia <hongyan.xia@transsion.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Song Liu <song@kernel.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [PATCH v2 1/3] arm64: Always inline raw preempt count updates
Date: Thu, 26 Nov 2026 03:30:52 +0100
Message-Id: <5ba8c2a33188f43f0b1d99d6ba97c8ea2e285f94.1795631277.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1795631277.git.kmehltretter@gmail.com>
References: <cover.1795631277.git.kmehltretter@gmail.com>
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

From: Hongyan Xia <hongyan.xia@transsion.com>

Raw preempt count updates can be emitted out of line by the compiler.
For a noinstr caller, that puts the update in ordinary instrumentable
text. Force __preempt_count_add() and __preempt_count_sub() inline so
their code stays in the caller's section.

Link: https://lore.kernel.org/all/c3a90368dd6c096af9d918e036a27728696fb8a4.1786603168.git.hongyan.xia@transsion.com/
Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>
[kmehltretter: split out the arm64 preempt.h hunk and rewrite the changelog]
Reviewed-by: Hongyan Xia <hongyan.xia@transsion.com>
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm64/include/asm/preempt.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index 75a592b7f47..f3a5c2cd193 100644
--- a/arch/arm64/include/asm/preempt.h
+++ b/arch/arm64/include/asm/preempt.h
@@ -41,14 +41,14 @@ static inline bool test_preempt_need_resched(void)
 	return !current_thread_info()->preempt.need_resched;
 }
 
-static inline void __preempt_count_add(int val)
+static __always_inline void __preempt_count_add(int val)
 {
 	u32 pc = READ_ONCE(current_thread_info()->preempt.count);
 	pc += val;
 	WRITE_ONCE(current_thread_info()->preempt.count, pc);
 }
 
-static inline void __preempt_count_sub(int val)
+static __always_inline void __preempt_count_sub(int val)
 {
 	u32 pc = READ_ONCE(current_thread_info()->preempt.count);
 	pc -= val;
-- 
2.39.5 (Apple Git-154)

