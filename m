Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.12.53.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171306;
	b=uvAPm34SJPwphbSNhsfrrzN3O/rlvDmYeuPOabWcNFtmfLibkmMmisAaZOPvjYl71T/R
	 JAzjGoNRPj41FAqHglBPmapRdPXJExzIBuVlRG5eGGyrsElJDnvSMC/QLZbs2nzHVrk39
	 zshw3nHPcVSAnD1zWzp8mLtNvtjiR92sbrfEUUuATFB/k9cEN2FHyBQilTLdwcW9E13Qw
	 DxABvHhCvdawdTA4Ap49ZmLQDhBn6zNJYZ3ALoKLcToX63gzV6KaKvEyjMC+ar7kvEhs9
	 4tq+Oi8+zspMhLcM4q68T+aUFfmyEJlejuIPTDO7msvsYCbpQkRLZZJ7/F9T2qNYYdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171306;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=8ZkH3C7FN+L4lwvS5XXDmqz8WPNr/tnPGV5wnp3bIBU=;
	b=wrHrbl4JlOU5T2UCoXmaLd0soJ2bdK7/QdqhAwry23EJL0+eWvR8DMhQKa9Jp+jIIcAy
	 jG9COD2H+fScQIKHU12zcAea+T3pgzjrRgrTOdDr+vtBE81FLU++Ye8QMOzBKSfN5nyeg
	 YMVMmKXqSVz/7m58yow0ylRsn+0Bb5wqgXjlQZ14L0QQTlr4YSwvFxJRRAng0IM7VoSSK
	 GiYf+wXrnypUtRaduTEc6/ivBYxnjk79a+L2qIvfoYBqpgUWXg7FIf4RIxTNrgAC4RbfX
	 pD2kDEwU3ZfgrWZ2mWwnqCyCityRwtblNa8FcTOI/U/NPP5M59Zg3YxogDhLySEv8TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.de;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.de header.i=@amazon.de header.a=rsa-sha256 header.s=amazoncorp2 header.b=ko1ToMy8;
	arc=none smtp.remote-ip=52.12.53.23
Received: from pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.12.53.23])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69A6606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E69A6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.de header.i=@amazon.de header.a=rsa-sha256 header.s=amazoncorp2 header.b=ko1ToMy8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1795171305; x=1826707305;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8ZkH3C7FN+L4lwvS5XXDmqz8WPNr/tnPGV5wnp3bIBU=;
  b=ko1ToMy8GuAJ4RXxhDamjh+3DKFCuHggIImsWStTpleZc64zuKmXsM/m
   9+/BFxOAP2hO7jA+OU3yJh7U2YQMWkOXiTUxCqbKCztaVKq1fUBeSSxtt
   PrhBuQOEspmu+7ajmOuOpLkz/zaiDId3QEok1SiTn7DvavKOdPTj8zp9N
   v9EFfAMkrpEOIUjxYdfDOV9YXkfBd084poE32yPtEMqOMLfYou5tdikfP
   UqAheBqiMYcYNqD7HpYdbiT4y7yRQG4cOK1uVjKIaoQrxtEUAL0OCRVzY
   10uH8JhOPBU9Bcbj+olIhnjr+hmcuQ2+mP1fQxJ8HvuEB7o+Z7rcbbymK
   A==;
X-CSE-ConnectionGUID: 7uBa8vIPQqeu3VdwDfFA9w==
X-CSE-MsgGUID: l2BbZ1UHST262PRtRKOlwA==
X-IronPort-AV: E=Sophos;i="6.27,222,1787011200"; 
   d="scan'208";a="34510299"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 10:41:42 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:9317]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.36.222:2525] with esmtp (Farcaster)
 id ea3ceb02-7d1f-4be9-82f7-a0b9ecc40b14; Fri, 20 Nov 2026 10:41:42 +0000 (UTC)
X-Farcaster-Flow-ID: ea3ceb02-7d1f-4be9-82f7-a0b9ecc40b14
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Fri, 20 Nov 2026 10:41:41 +0000
Received: from dev-dsk-lshahed-1a-d9c3b839.eu-west-1.amazon.com
 (172.19.123.145) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.57; Fri, 20 Nov 2026
 10:41:39 +0000
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
Subject: Re: [PATCH 0/2] sched/core: Fix stale core_pick and forced idle after SM_IDLE fast path
Date: Fri, 20 Nov 2026 10:41:32 +0000
Message-ID: <20261120104132.74241-1-lshahed@amazon.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118144149.GA1779021@noisy.programming.kicks-ass.net>
References: <20261118144149.GA1779021@noisy.programming.kicks-ass.net>
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
X-ClientProxiedBy: EX19D031UWA001.ant.amazon.com (10.13.139.88) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

On Wed, Nov 18, 2026 at 03:41:58PM +0100, Peter Zijlstra wrote:
> Does it make sense to stick these in the selftests thing?

Yes, will be added in v2.
