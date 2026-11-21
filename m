Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795234523;
	b=smN0ZaBKyNQrnONqzQTOLYp4AasZf6ItO5gSb9ATN52J0vLScfjYpeIzni/6SXHUuUbJ
	 ehFPFTrfZrGIPsTNbooBHGqAwdR57dx1MdxXeMljmHrW9rbY44UUd0LcGHIBsKTWPX6nV
	 cfhUNtMOOi/X1/4Ty6onlObpBmvgDsS286srMShTzX/4ps+BV2+hTy1jLPMzBpPxxOdr0
	 LjftCOrMRolqVHAlF8s1EBpiEZsMwVOphpj+5tonyMFrh9NgvcCIU/2MFsDTw4tf91bIt
	 lIwKP0osFGsJ1NAMXu4bHtWZ033hlyOz8a5Yi3kmrpN/YZJz3m83aBaES9onygka5yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795234523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rgf2pfOTtNT7kQ2FL/sm/kRfh/JMjlNMJIMy2PuRMDc=;
	b=AdVB7tilNcCn1mqOXj82jhxaAi7PbMziELVy82H7wQVQtudiuE6p7k0ulPPRDaVFT/6n
	 Hb3rdTVQ5gbJd2xZzjz3wR0mnChpTlJUQ2A7xigKcnZIKf9+AYsJHs3i9lffpoRl9UYRR
	 /9WQ8S1szSsbdWegUcu99INVkxwMkIVCSeIU96k+Fy6tycc95fBuUW48xOjMdD3BHhMJs
	 thg+xzXasw8guN3Z9Jfx4Gf10DQJ4ZemTU3gDRvCa2ewdZ7ykj2MLWbuAYL0DVgfeB+yp
	 2QBOkEp34eCY1u/hSxGr4+caJiVm1p+xzQDTM4I3c+qEaZ2N9pDTEt/fomE9aNRaw0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=W50lUg7z;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA2B606A6AF
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 04:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDA2B606A6AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=W50lUg7z
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso13494095e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1795234516; x=1795839316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rgf2pfOTtNT7kQ2FL/sm/kRfh/JMjlNMJIMy2PuRMDc=;
        b=W50lUg7zO2VQJaxQHeSZDrXxcqbNKyGHBwlJCh9QCPrDFCve8ShkHHcdELn+a4hccf
         kcS/6HcbnEUtQpv5cowIdL9JRAbQgN1u8WWA5KnjnK9mHCJK2VdDywNUrfAUJDnIpGry
         oXmqMIrLxnQ91QLoay5fxSnLVOWb+rx6oXpd6nrGOGRAzqiuw/zvyXMyi7G/ml70ZAO5
         ACNAaXQ+mHni0IMaLdodJNLAAsf5N/iu8UMddIvXacASAhdvkG+KcuRa5SlyFlzzjNEn
         0NXz3hD0R2oFuMF5+QEMWlC+htZ4AbFvMpLrqCFYsHqd3s/EXbA9sg50sYoSnAAiuaK6
         TwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795234516; x=1795839316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rgf2pfOTtNT7kQ2FL/sm/kRfh/JMjlNMJIMy2PuRMDc=;
        b=wNvO7Yyjluz71AIHsw/9vouPq8b6sFRHldtZU2Km4mOlqh3asjVvv0YE/EujX8gGrV
         V+VD1W4QuSgxMnjNg12AubXEdWXk1PsCVfitcGs4CAfi5KgoGUCAfkPUvMyAh9ZwfEWn
         qeX9zULIIZHg2pFFKpHMfs6Q/bpQ5t9lK4nXfkgDUXMYmkepc7nUQoirbENJGsM5NZQf
         SjD4WH+WjAuUsnGmMeuZ/hQiANgITcWGdNcvPBvr3Lp+Vfv0IEEauu5Kt1W9VKr5T3Sf
         Go45DgytqiOUsvTTDTEzKl372VPgdSxs0MkIFiPD7/6Q/mjkNaMuOVOaKLuCa4ccbxbB
         XWdQ==
X-Forwarded-Encrypted: i=1; AL+hErH3xKcoNYBo8vE51ZnaIP9GJ2NWbdIN57es4lsx3DgG8alz7bg5tl0Klez15bObFnEeEzcj+CWYS/tj0Y4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ArWiICxluvCt/0hkiIcGK3VQ7aASOG+0K7lnqY6PNBV3y5nFp
	EtG7BtUsCRAwc7W80pyfNQLR95A7KduWpawBK91nVuklW2ihDac+I4DkBnIk+p2RkdY=
X-Gm-Gg: AZFdTZcudMVJnWWRoRk5C7nMbpv45fSNv9YyYEHBrVQ6kXdpvqhmCihDW4wJXhEJBWN
	PS9fXdq2twZXL9ftmGTc8xEBD1gz8iC6YzTZ8ZVFXi63gGEccKKMVPY11p5oKFwf7J+Kcm3YcMr
	GPkE6Co8czETcDX96TE4s1MBTIA4GSzVyigvZZUJPrqdWnPAZfkPnJVttIA6My3aLLVGo0CCmor
	5HxcDvy6WFVEgUqbmuEq6mhMuP/+fIjhw3czAGtCoVdSfLgxczwhGX3tXUSaPwMFArEPOBvBTie
	w/wbie+Xe+J1w8p0vienKl/GHxsb9mE5e/LLip/yTVPOUw8T24LuvGyMwxhxWLWCH6JTssA/UlS
	xEjdcOorI39C57MwztMhjYGjFXgS1VDxITlJcUmh7m6SRb7D2INR0hkGS0uN06PMLa4FBRz2LaR
	JXC+OzJ6PDThVV7dZMlO1t2gpapqMhVqMRlCctVyGQ56FoYVTBDPiXqgQgEThRx8S+yd/Kml4RN
	7F/rZ+jIZp21PYoA+iHURNGUauU6Ntc/JGQzONaUTiDLZqAzW4qLFejD7Ea3L8TwV8rfeiXJe5e
	bPZimCPsrNjQ5Jh+KFUjlmQ3qTb8hzSjL3y4jM20mdJEiCcrJfjlyLIhpSNtdhFY/XrxZOadZ06
	Hkw==
X-Received: by 2002:a05:600c:3b1d:b0:4bb:6991:2330 with SMTP id 5b1f17b1804b1-4bb8881a890mr113432495e9.22.1795234516270;
        Fri, 20 Nov 2026 20:15:16 -0800 (PST)
Received: from aerith (host86-128-182-179.range86-128.btcentralplus.com. [86.128.182.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm90032175e9.4.2026.11.20.20.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 20:15:15 -0800 (PST)
From: Qais Yousef <qyousef@layalina.io>
To: Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Christian Loehle <christian.loehle@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Stultz <jstultz@google.com>,
	linux-kernel@vger.kernel.org,
	Kayra Cizmeci <kayracizmeci@gmail.com>,
	Qais Yousef <qyousef@layalina.io>
Subject: [PATCH v6 2/3] sched/uclamp: Use wrappers instead of open coding UCLAMP_FLAG_IDLE
Date: Sat, 21 Nov 2026 04:15:06 +0000
Message-ID: <20261121041507.39582-3-qyousef@layalina.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121041507.39582-1-qyousef@layalina.io>
References: <20261121041507.39582-1-qyousef@layalina.io>
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

We already have uclamp_rq_is_idle(), but it wasn't used everywhere.
Replace open coding with the function and add new wrapper to set and
clear the flag which enhances readability.

Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
Signed-off-by: Qais Yousef <qyousef@layalina.io>
---
 kernel/sched/core.c  | 14 +++++++-------
 kernel/sched/sched.h | 10 ++++++++++
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index c6780358a7975..a2035d66270b9 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -1626,7 +1626,7 @@ uclamp_idle_value(struct rq *rq, enum uclamp_id clamp_id,
 	 * max-clamp.
 	 */
 	if (clamp_id == UCLAMP_MAX) {
-		rq->uclamp_flags |= UCLAMP_FLAG_IDLE;
+		uclamp_rq_set_idle(rq);
 		return clamp_value;
 	}
 
@@ -1637,7 +1637,7 @@ static inline void uclamp_idle_reset(struct rq *rq, enum uclamp_id clamp_id,
 				     unsigned int clamp_value)
 {
 	/* Reset max-clamp retention only on idle exit */
-	if (!(rq->uclamp_flags & UCLAMP_FLAG_IDLE))
+	if (!uclamp_rq_is_idle(rq))
 		return;
 
 	uclamp_rq_set(rq, clamp_id, clamp_value);
@@ -1890,8 +1890,8 @@ static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags
 		uclamp_rq_inc_id(rq, p, clamp_id);
 
 	/* Reset clamp idle holding when there is one RUNNABLE task */
-	if (rq->uclamp_flags & UCLAMP_FLAG_IDLE)
-		rq->uclamp_flags &= ~UCLAMP_FLAG_IDLE;
+	if (uclamp_rq_is_idle(rq))
+		uclamp_rq_clear_idle(rq);
 }
 
 static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p)
@@ -1930,8 +1930,8 @@ static inline void uclamp_rq_reinc_id(struct rq *rq, struct task_struct *p,
 	 * Make sure to clear the idle flag if we've transiently reached 0
 	 * active tasks on rq.
 	 */
-	if (clamp_id == UCLAMP_MAX && (rq->uclamp_flags & UCLAMP_FLAG_IDLE))
-		rq->uclamp_flags &= ~UCLAMP_FLAG_IDLE;
+	if (clamp_id == UCLAMP_MAX && uclamp_rq_is_idle(rq))
+		uclamp_rq_clear_idle(rq);
 }
 
 static inline void
@@ -2122,7 +2122,7 @@ void init_uclamp_rq(struct rq *rq)
 		};
 	}
 
-	rq->uclamp_flags = UCLAMP_FLAG_IDLE;
+	uclamp_rq_set_idle(rq);
 }
 
 static void __init init_uclamp(void)
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index d87bdbd2121df..4706f73838a86 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3743,6 +3743,16 @@ static inline void uclamp_rq_set(struct rq *rq, enum uclamp_id clamp_id,
 	WRITE_ONCE(rq->uclamp[clamp_id].value, value);
 }
 
+static inline void uclamp_rq_set_idle(struct rq *rq)
+{
+	rq->uclamp_flags |= UCLAMP_FLAG_IDLE;
+}
+
+static inline void uclamp_rq_clear_idle(struct rq *rq)
+{
+	rq->uclamp_flags &= ~UCLAMP_FLAG_IDLE;
+}
+
 static inline bool uclamp_rq_is_idle(struct rq *rq)
 {
 	return rq->uclamp_flags & UCLAMP_FLAG_IDLE;
-- 
2.53.0

