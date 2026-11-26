Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795656527;
	b=cdKpJnIteYRvZdy/kTdkni4p0VqGtLG5vhK26dz94MZqGqMXco7jp3MkN25ULD5eUAE9
	 Fh8zfS4l9z5TvrOePCjMFwWsWq+qApaIEghVEx0KKE+k1wAhCaJS9XLHfO7Vnp/V90mcC
	 c8dA6yyp6j8CPwyW4XFyc1yFOYKUObdQRT26x4fCzcfHE2ooRaDUD6mv4SHgblqghb9bv
	 CafFD8Xv7KcVXYttB1BP8Sa1djVW8HsbuCBvBt6FqDzvV2lpZVcofz64K6PQDv2awP4v5
	 oBp7Gq9v3kQpQC5hpbVsHI3EMDh7eHEJfrP+FkH1DJLIZ101y5wnGpVuBzWvmuuu6kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795656527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rK7aPmmvXiL6XpyeY6EQscDfnGKaXYyc+M/DVxvrmBw=;
	b=Wono5aT8SrxIsIYsiDhUuxWp7hJMTVXQ3zINUbwx8AjsZJI8UBS1F7SKlgdYir2SmwEt
	 wckCSXTLlI0IS4Ev7L36lz3LPfogYoj+Saggp4Ohl6O9X5Xb3l47rT+n2RvujmpOeXv2j
	 oHEJ/F+GMyZJLnl7XR7BQuBaygYMdh/cBCxL7brT6strUID1wX5ELC3/g1bLIRqrkgm9h
	 HmY4VASVtqGeT6M5O0XHw1UAw/Ew+PjRQdFkTeUsqZ17wccQxdmKseylxJMp/upS9bCAs
	 tKebJzdFmGNVi3DFiNIOBFPjGPf2BNV/vZIoRrnEjpn4g4E393Bpf0JZ8TfREIlWDwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=p5AczPMI;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9983606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:28:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9983606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=p5AczPMI
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso2941434f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1795656525; x=1796261325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rK7aPmmvXiL6XpyeY6EQscDfnGKaXYyc+M/DVxvrmBw=;
        b=p5AczPMITS6oRvyGQNiW6diQX/NatdhMZjSbgm9f0xNFKiSkrl/OJIDzSpAeDNz4Nx
         gbHBppsZ8lqqo94tGx+yrPglk9qIye5nj6URxUcPd1tttA5ruq+PXdA5tVaza9rFGPb+
         PEUC4pPld50oFnVdIQzCtRnaGuuAuf1e/ZadOjjC+3kGQppSWEDdlHBtxgaQmEx5estf
         ZZxH84/51ZCmWiAiNlYat4mgGA9uRYs6x3Phbbc3RtpT36EE4Z3yUyHe10XMurRdljA7
         ByTWQyfaW1u/xQg04lhcsd7XSkrB+5N36h2clzzVFwxNcRWA37Of4hRZ+fIkJjBF41GR
         bF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795656525; x=1796261325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rK7aPmmvXiL6XpyeY6EQscDfnGKaXYyc+M/DVxvrmBw=;
        b=QFYefuFV2WOCt96l7pdrEcn3k84hL+sE3kxNJ8FaM/sYOuVlsvjjZYw7dSN75rE/J1
         +BNVFjqV1IdLq+BNooc8ppOm0L5+wP3y0FV6YwdPqU+fMJJJMoSG/scHQyj0/dcA/Lv5
         1RAdVT8un6LGO1Aymrpb+zEfy5YB3fYfcNGxmYhhQpPfTiaAOvhUOh6BNj7p/th28aKJ
         naFcugduju9kVleuBiLQIvFt7Uppli97k0SoMGQFXkBI7Y/aS9JduCNwtCzP4Hz0rE1u
         bmXIJWleMuMhg20iV9MMHdDOWsAu5vFJWrmIcVTFBV/8acp4T19jUl/SbqGCJ7gAhq9Y
         4a6g==
X-Forwarded-Encrypted: i=1; AL+hErE915pm2B8WBmBDXV1jQrsOzvkWsXVPDXrL33UB2qj6m4Ee1gv1tT9R5JIMk/Q8SpFtqEYsoCPP5+w+EcI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Iy8ZbeyBims9ke0sRnZgUmaY0jQPU6i8X5UqNC1WkNMponNN4
	FAFzyYn7Vx6mEec5K1n/ohL5FHYOhkatlX1PMNoYNrvQLLzJn+P9VxPBwC6A9E0n+6A=
X-Gm-Gg: AZFdTZej3wDTFP9BXo9IDPXHFm0eG9/EOZgOUQcTp3oMFkdybKW99q8tZBpUW36zFlb
	EoyfCptHGNrOCzeGDYq4dDnB0YYMFZ61L/6HYPyvRD+pkx1zmgShssE/l3Qhkj9CUKvJKQCGa95
	aVlaMfzT1VgmaucdHBr8r/O9YlOaqK7Y5aZrCuJ35bIphVpNhai43oxdalYR1cwvjwXOl48hG7o
	HzaLUH328+FYSiJusep/fxqJxrXgXJi1xJv9vn4CcqgAzxPL4e9Wi1PXOdDzrmvo4/mXeJVd7Et
	rsspo9w97FBNce1ADVF79Wcwas36j/q5xUUggZ5+n30dF6D6nEIApCiEVX0/0ZcsVg/uz7z6wF8
	J+/FVkxorqcofDHF5xB7P8W21Fi7tSyBthGNBDrmtlw81CYrHXxPBRYv/1Gs8+AI4+R8L6qeIvo
	r1di9RTxE8vHIqZ6Ftk33V4DCvjGd6+ZJVn0miii7pke8Jp2eX7QN6Aoz6JDbL7GJ+RRlWKTnvy
	0UH63RLwVMZj55NTac3D8lLHWAyeYfXfS4i7wFgFcq0fs+ZACwvPT5F9AhmmBN3WCh2XO2Tt4+L
	yKKR5phrWGW4Mokdq9FcIC/l5qD3c3xlJBoG9swNmVZCtoqlzwuAMV62DtSoc7MZ01i0E3o8dIH
	btY9sV42nlA==
X-Received: by 2002:a05:6000:2f87:b0:4a6:bc53:246b with SMTP id ffacd0b85a97d-4abb5144ebdmr36740200f8f.30.1795656525269;
        Wed, 25 Nov 2026 17:28:45 -0800 (PST)
Received: from aerith (host109-153-232-219.range109-153.btcentralplus.com. [109.153.232.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm30520335f8f.35.2026.11.25.17.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 17:28:44 -0800 (PST)
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
Subject: [PATCH v7 2/3] sched/uclamp: Use wrappers instead of open coding UCLAMP_FLAG_IDLE
Date: Thu, 26 Nov 2026 01:28:35 +0000
Message-ID: <20261126012836.15205-3-qyousef@layalina.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126012836.15205-1-qyousef@layalina.io>
References: <20261126012836.15205-1-qyousef@layalina.io>
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
index 23009278cc9a4..04c396435413a 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -1654,7 +1654,7 @@ uclamp_idle_value(struct rq *rq, enum uclamp_id clamp_id,
 	 * max-clamp.
 	 */
 	if (clamp_id == UCLAMP_MAX) {
-		rq->uclamp_flags |= UCLAMP_FLAG_IDLE;
+		uclamp_rq_set_idle(rq);
 		return clamp_value;
 	}
 
@@ -1665,7 +1665,7 @@ static inline void uclamp_idle_reset(struct rq *rq, enum uclamp_id clamp_id,
 				     unsigned int clamp_value)
 {
 	/* Reset max-clamp retention only on idle exit */
-	if (!(rq->uclamp_flags & UCLAMP_FLAG_IDLE))
+	if (!uclamp_rq_is_idle(rq))
 		return;
 
 	uclamp_rq_set(rq, clamp_id, clamp_value);
@@ -1918,8 +1918,8 @@ static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags
 		uclamp_rq_inc_id(rq, p, clamp_id);
 
 	/* Reset clamp idle holding when there is one RUNNABLE task */
-	if (rq->uclamp_flags & UCLAMP_FLAG_IDLE)
-		rq->uclamp_flags &= ~UCLAMP_FLAG_IDLE;
+	if (uclamp_rq_is_idle(rq))
+		uclamp_rq_clear_idle(rq);
 }
 
 static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p)
@@ -1958,8 +1958,8 @@ static inline void uclamp_rq_reinc_id(struct rq *rq, struct task_struct *p,
 	 * Make sure to clear the idle flag if we've transiently reached 0
 	 * active tasks on rq.
 	 */
-	if (clamp_id == UCLAMP_MAX && (rq->uclamp_flags & UCLAMP_FLAG_IDLE))
-		rq->uclamp_flags &= ~UCLAMP_FLAG_IDLE;
+	if (clamp_id == UCLAMP_MAX && uclamp_rq_is_idle(rq))
+		uclamp_rq_clear_idle(rq);
 }
 
 static inline void
@@ -2149,7 +2149,7 @@ void init_uclamp_rq(struct rq *rq)
 		uclamp_rq_set(rq, clamp_id, uclamp_none(clamp_id));
 	}
 
-	rq->uclamp_flags = UCLAMP_FLAG_IDLE;
+	uclamp_rq_set_idle(rq);
 }
 
 static void __init init_uclamp(void)
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 3cbaea9e29406..8fcac9b6be9cd 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3854,6 +3854,16 @@ static inline void uclamp_rq_set(struct rq *rq, enum uclamp_id clamp_id,
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

