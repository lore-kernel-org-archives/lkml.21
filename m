Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937440;
	b=0DH1jXaB+W8hAlixWigl2fp2sTpHLrL/80OxUtT12EZ5LLaRuN5kYV3GMb9YM3rdxYxK
	 oY8J+JXtVxN1lzIy6/r/iVFVOTT5UPNvWnVk+lgIj6UfY+sPVUkLcAHTWpVNyDLsPXX3n
	 L4AEtknK/jpsNkEkIKqzmRfmCVRoV7ZYdb+Tol9B3t/dE/8KC3X5pD1qEd6C9E0Da9SUM
	 aXU1iZXFQUjfKSyomO5SydjjbvUhm34TZMfnI4BFvUXh4sApnR99nno8ElVf4VSfNW4dD
	 RAQgm+e5jYdXc9QLSIS2CoHvLBXrN6zC3lRVVnJrdhhhMjlBMvKHoFDMa1l7ZDCBRyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=3Q050ARbfSsfp/DpsjpaNEHeBUmHeSTY5lbv5E8BhzU=;
	b=iRt2x1sw5PgndW7QILhb6bT3BxdCzZ/KQ0c1O4R5Xiqe+UGDftFaveqL6PXAcjuwgdGL
	 L/DIhv24x9d8890BnpwBELMUjrM+x9VezAKW7RzpdFi+12Y8dG0mSSLYuPqAIbKmIHxxm
	 bET9chP0mPbFHwEJ+Ux/fyinvMN4k7SwXhtdXOGZmJH2LySqtffk9Ph06DvqFQ+vNwm0I
	 vGbCkK5P+MltD5puy1YKkBUv8C/1CTKrKia1PNRuSKj2wFs2fZ1jl2G68qsJmx5l0MlJ+
	 GV+Ns7axtJ5w41vGKznL+mDiMZM8gB0hbmEhQwr21A7iUSr3ieBCD/XKLQMrmNeL4pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="n/CwXBKS";
	arc=none smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA51606A335
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BA51606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n/CwXBKS
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67bee1f693bso4310568d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937439; x=1795542239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Q050ARbfSsfp/DpsjpaNEHeBUmHeSTY5lbv5E8BhzU=;
        b=n/CwXBKSCZqpIA04JJ5NbKvxCnwgL3G9BAUIXC5FYK01pENP9r7wwlSDBQrw4GX67m
         g674QBB+ys/XPm110VWTGNMwCQCYxP9NJtevhduC9l8a8gjvaRaDtBnVXanlzbVa8SRi
         NY2If2122Z6CLQnImtswFcAwcHYOHdf/gdJf65PQiAijfNAPNhSb4z7enQvwcptooZXB
         IrfhlGEKMcsPSwTxtYycsBNzwoKYLuW5vU6BC8VApJHx49czybuQIsfIedeKPpnJx4gJ
         rG3kS/rBLMX8Bhoan4eCO47Es34q6Nf4moZSrGaglVr4we9mb3d4TiaYsR4ax16w7Iiu
         MAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937439; x=1795542239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Q050ARbfSsfp/DpsjpaNEHeBUmHeSTY5lbv5E8BhzU=;
        b=1EUDFo2i85f4adqEowYFvbA05ZMosrELXVkbMXuGF9iXA11F40Xj3w/bgC+3eWZdm5
         SpT7Rqz3080sl0ayBXYYGjKbRD6QJffUbgopd9tWRf5Vtf3sNGFk3zBsKqpRiTl/pL26
         sI7VAxXCLiUmf6Wkvx/U++sv/XJ8H+Wdj6Of7eYTH56JWIU9PSvpTLP1WAbxratbo8dj
         4Xmf4hbQaTRoic3tCoEPMq+ONMjKjFuEAhj05+1TAJIzeqzyGdQudL+i47ikdJPelkoE
         eaYNzFeooab8i73hmrNiDowFCNrqtgsaK891xc2FhcZOEjSboFTVM6gMmteVWUdR7wUW
         i/rg==
X-Forwarded-Encrypted: i=1; AL+hErHCgi5uz9DzgVX7NSwWEY/DuwWI3Sh/FD2s9/d/EmKxaGMAV0ioqwjSrOQ/KzKQb0LrMcHqA2p5qHOtH8M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TwttfYn5YXpmXc52bzNUkTzM12/IFgmqeqbnLtbCwoyWRx0ED
	wzUS2a/KqXzhxV6hDYTy5TVDziMadzb82Imj04DpQkdmKvKr73EL01m+nLO7y3/Vk7k=
X-Gm-Gg: AZFdTZeivRTxXpfU/+hTXORVKnreAU17L8Uuoe56JrFLImYhA2W9rerwvW/MjGmnhc6
	tEG+itYa63y+R5O0Hfe5KWjRxf5Yqwlw09+U086MxfcKi63h1BAZL5maQO5L149ZuHjMQilrypN
	lWMFKQFOwSZw8A+/wnBsZWBmIBEmuI19F50U9DoOMWVnoJ83mrhgGn7dDp30Vo52FwJmYDaJoqc
	XZ3yGTNLhvhu7m1Wc+Onx2nM/1w/I0x6/o6EXtuhwvvFAVIYgBSTke03dOAeI6xX3oI+BfLmhiL
	VEvFvr4e9xEDbqFgx8KqXd7bK6FWelfAQLEBzH6goatIWlYSUdlVpxtArOUQ4LBUHp97Sto4Afv
	qH3qOT2B5ew0QpRu+8qTILfZrAHQPjvk+Bz6+CEA+TzVgutAM4rsZVc+JHHb0zKnScbQi7LNvzB
	slWHbJg5sqQZn2PdmLbmUYRg8caxdJ9udZb5CZJmT9NYl/p0yIdFNAfa3R6tTjxQdVFY13syL6n
	XawSZZ+W0UXw8Am5hQjf6+qjsrukol37koa02cAUvmuRekG9EVApgpfxi/MvU+aUZT8jXveNw15
	U9ujG4xNyn9+PMUW7AEbS13UTCUMHIFeB/wBiMZXiV/x1/gGBqqoFw5RGWM5cmIGgzwl6+pmok7
	hu7p8CQ3u/MSBd+fCO3QLVejCxfUXae2ZbylOXYm/52Kc0b1R6DRKfZtBna+FnBz8PHFfZlmlNX
	mqy1fk0jc1kxgx3tIy2w==
X-Received: by 2002:a05:690e:4388:b0:67c:23f2:20b5 with SMTP id 956f58d0204a3-67dd3fb6e24mr106276d50.80.1794937439420;
        Tue, 17 Nov 2026 09:43:59 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67dd4014325sm203579d50.10.2026.11.17.09.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:43:58 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 17 Nov 2026 12:43:54 -0500
Subject: [PATCH v2 3/8] powerpc/perf: mpc7450: Remove the snoop retry
 alternatives
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
Message-Id: <20261117-ppc32-perf-v2-3-2072e9b90009@gmail.com>
References: <20261117-ppc32-perf-v2-0-2072e9b90009@gmail.com>
In-Reply-To: <20261117-ppc32-perf-v2-0-2072e9b90009@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, Paul Mackerras <paulus@ozlabs.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>, Tanushree Shah <tshah@linux.ibm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=NvUKFAnJYvy3hOkaAuE7MQC868qaMwIEUUCzFRI0sLA=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+TIoQ0e9ON3pcLOb7VES0uou7TuCJFbeX3cStB64ff
 ldjdmh/x0cWBjEuhpliiixx6xVZZrXtWOpzWvoXzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 CGToGMVD5PQYNDKLi0tTi3TTCooc8vJLEksy8/OK9fILUvMK0gv00jLTSjIy8ouKU4FG6OWllpi
 6OroZGRqYWDpamDlZOJqaODs7GTq5OTo6uzoZWZqbGDhbOpq4WpozcHEKwFzz6z0jwyuXVV2bkz
 RnrligaK7KXcjjULaTY8eDBa9ixTXkF/Tu+M/I8EEm98C0c1eNHDx26N19Obkq1Ob7j+kFLMtKe
 ++veildzAoA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The alternatives table treats 0x418, 0x50f and 0x60f as one event, but
the manual (MPC7450UM Rev. 5, Tables 11-12 to 11-14) describes three
different events that share the name "snoop retries":

  0x418  load/store snoops retried by the load/store unit
  0x50f  internal requests that are internally retried
  0x60f  snoop responses of "retry" to any access

On a 7448, over the same workload, counting r418, r50f and r60f
together, and then r418 in a group with r41c:

  r418                 1793
  r50f              1546267
  r60f              2266850
  r418 in {r41c,r418}  670562

r418 and r41c both need PMC4, so in the group the scheduler moves r418
to PMC5 or PMC6, which count other events, and reports 374 times the
real count.  Remove the row.

Fixes: 7325927e5a20 ("perf_counter: powerpc: Add processor back-end for MPC7450 family")
Reviewed-by: Tanushree Shah <tshah@linux.ibm.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/powerpc/perf/mpc7450-pmu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/perf/mpc7450-pmu.c b/arch/powerpc/perf/mpc7450-pmu.c
index 5a882d934645..9890c87c58ef 100644
--- a/arch/powerpc/perf/mpc7450-pmu.c
+++ b/arch/powerpc/perf/mpc7450-pmu.c
@@ -184,7 +184,6 @@ static int mpc7450_get_constraint(u64 event, unsigned long *maskp,
 
 static const unsigned int event_alternatives[][MAX_ALT] = {
 	{ 0x217, 0x317 },		/* PM_L1_DCACHE_MISS */
-	{ 0x418, 0x50f, 0x60f },	/* PM_SNOOP_RETRY */
 	{ 0x502, 0x602 },		/* PM_L2_HIT */
 	{ 0x503, 0x603 },		/* PM_L3_HIT */
 	{ 0x504, 0x604 },		/* PM_L2_ICACHE_MISS */

-- 
2.56.1

