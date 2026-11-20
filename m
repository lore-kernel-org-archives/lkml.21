Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.34.181.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171284;
	b=1BpQU2Uw791t97Xxk8510zH01zPz/eFg4MZUusmp1tCbSiH9dqMhikmh0AyVrzEwa6wS
	 XZwVIe2WqwxoHk7Kd5NHoLGko6yIUu+uBpjFGnJHIWPSendxWkTa1kFB3tKva2BWzrosb
	 lu8tMuGei8Lp5LY0mTR9MAFeCsEIgg2doLluRppZTrQRg5fTVYxMH5ewUFFQb3JGkT5wK
	 kkIGl/+Bod7p11RZ2737s5JRrCYC4I3nrO42HLqph1kQC5Rvj1EVm1ftqSfhTrH/wUdaG
	 6heHCjHFjSdsgjj5bdVeVWqCTrbCdYCFhAazAAEXXBmOfrDeicbZJ9BVzf6ZLYCLFQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171284;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=lwGWXbNEkhnM8PJUnFziS9MwC/AdSKAEspfXKjOdCwA=;
	b=o9ej5ZQIOHOMA72a0B34mp+nnhWwBqXuTWrs51uBYiyHKOl5giqJ1iUREMLvEodkI2Wf
	 kR2kZ8rSRuSjVG9uk11Art2tErVr5cMVK7QSpLLLAZQ0celWO8WBiTbe8i11/cf+CcXoC
	 m4GyPHWNYoyGs3JDkVRpP17sEkMhJph2gWozpPjCMB6suuiSGCe0iXzMKTdrGdIdnZq27
	 AFc6Hfb3np7K8YioAW7ZMvO5dtYPQnE/qi90sfBwrGB02g1cQ5u2os1ZmbQVmUtdPQ8eP
	 bI/iah6QdQOZG0VjoPI1kRwY5ZKki/KkNdrVLgbTIoCgHv1GD9N63iAK0QiwSup093w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.de;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.de header.i=@amazon.de header.a=rsa-sha256 header.s=amazoncorp2 header.b=MSV1tS7A;
	arc=none smtp.remote-ip=52.34.181.151
Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.34.181.151])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C7C606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6C7C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.de header.i=@amazon.de header.a=rsa-sha256 header.s=amazoncorp2 header.b=MSV1tS7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1795171281; x=1826707281;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lwGWXbNEkhnM8PJUnFziS9MwC/AdSKAEspfXKjOdCwA=;
  b=MSV1tS7A8D3EhiHA4y3W0Wg9jTT3n+LiWUaHCnfMuIHILc97XZbWzo43
   WIK6KOerwEQu/hPINZqnY7DCMIO+VycmKtSarjUGRoBFiFFQx7nhTJyDt
   FT6XHLVgDp1YWu/Wzip4ZSFuSTCwJ51D6RzCpylOx99tEdRsZEI9Kc+u5
   L29da3tFes67tdHg4cYpiv8AdW9tE8VqrANOEB7unRLWLbEylGQUy2u5Z
   /dXk13XPmFIgWTL6aapWBfEDSsSGrA5TIauwik7Vn1leimmvVraoKl0RK
   aXoRvD3n2MfX7GMVq8qWy7kcBpSkrzIMTPm02GWyDI8LaUj/ABRZN0vu4
   g==;
X-CSE-ConnectionGUID: dCDBdLjcQP2ZIzYKjqmMkg==
X-CSE-MsgGUID: GO1UvuatSsWiw8tgAKQd7w==
X-IronPort-AV: E=Sophos;i="6.27,222,1787011200"; 
   d="scan'208";a="34660822"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 10:41:19 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:12061]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.8.86:2525] with esmtp (Farcaster)
 id a85e5126-bb8c-4695-a7b1-a7ce87d99b39; Fri, 20 Nov 2026 10:41:19 +0000 (UTC)
X-Farcaster-Flow-ID: a85e5126-bb8c-4695-a7b1-a7ce87d99b39
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.57;
 Fri, 20 Nov 2026 10:41:18 +0000
Received: from dev-dsk-lshahed-1a-d9c3b839.eu-west-1.amazon.com
 (172.19.123.145) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.57; Fri, 20 Nov 2026
 10:41:16 +0000
From: Ibrahim Elshahed <lshahed@amazon.de>
To: Peter Zijlstra <peterz@infradead.org>
CC: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall
	<bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
	<vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, Josh Don
	<joshdon@google.com>, <linux-kernel@vger.kernel.org>,
	<nh-open-source@amazon.com>, Fernand Sieber <sieberf@amazon.com>, Roman Kagan
	<rkagan@amazon.de>
Subject: Re: [PATCH 2/2] sched/core: Don't skip a pending core-wide pick on idle re-entry
Date: Fri, 20 Nov 2026 10:41:08 +0000
Message-ID: <20261120104108.73673-1-lshahed@amazon.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118144027.GZ1779021@noisy.programming.kicks-ass.net>
References: <20261118144027.GZ1779021@noisy.programming.kicks-ass.net>
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
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWA003.ant.amazon.com (10.13.139.47) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

On Wed, Nov 18, 2026 at 03:40:41PM +0100, Peter Zijlstra wrote:
> I'm not sure I understand the rq->core_pick condition here. We already
> have !rq->nr_running, and if we have rq->core_pick, then nr_running must
> be non-zero, right?

Right, the check only mattered without patch 1. I'll drop it in v2 and
keep only core_forceidle_count.
