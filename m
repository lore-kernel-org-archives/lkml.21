Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=50.112.246.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448255;
	b=XU7KCkc+7yGGUCvoMPAyfW1XxwmeFURY+ewM/MsPxaiSiWYdOoIQLMfw8bb0jlW5hbHt
	 cAmoBJgsTWEWSgmlZtOjLqB9aeJZHXm/6Mr77TpJM7uawhZpTN0Hl/LuUbSRLPe7aU8q+
	 5IHr7T3nz3i6aX7SCqPRtVy348T7ym9i8qA7ZrOBDO8+qZigDxBRZ4rZlxLuOYadV/YL2
	 rwrCwF0ZQ1X+7vNfoL9yk3WD9ao0XVGHc8qxhM2Enc7QAfoOzmP0UDOjmLlVF3qyBrUow
	 zVfLDRMyEIGYRPsAwHh0638PObCLgLC4+HDavjq6QDxySRZpsV6WgmzQu/P/ZH1xJvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448255;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:X-Originating-IP:X-ClientProxiedBy:Content-Type:
	 Content-Transfer-Encoding;
	bh=K+rx6yYPpyPiJ2YjTMZ/suaeoif0QipuumgsrYY9fs4=;
	b=yRAOapEzzp/WQdf8wPshzcNtONxu2T3dpZFzTJ6SXK/T0GrcpKj79K5siNIn9m0X8Tmc
	 d/vS4iVsev7NomP7url+l1d+hGfHyRaMzZaxWKu6ckBJkDF03pAbqG6PvbiV5GZ5T2Aud
	 JJ2yJzB9oSiKzDJP5WdWFczMlKUTt2TRvInHCqYctEGNp/oGxjJY1mGZXl88aaaxmCYRL
	 IZgdps4ILeFlBTw5vPJ5zdXWQGoEkc46X5pV8+JNTSJcDmZFDuGFgEFq2/j6F24MUp/4s
	 ivLPHls8PTNJrV32+gpXUry3g1c9vSnYiCZgarDbjcBFBLrf/7k9ZPVea/ms3+F0u2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=YK5KN96x;
	arc=none smtp.remote-ip=50.112.246.219
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com [50.112.246.219])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B370B606A31E;
	Mon, 23 Nov 2026 15:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B370B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=YK5KN96x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1795448254; x=1826984254;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K+rx6yYPpyPiJ2YjTMZ/suaeoif0QipuumgsrYY9fs4=;
  b=YK5KN96xrNBmuBMy/m9HRb9ZP9IKhfUYVe0IutnYoC9Msf2lPCusZJ0T
   E4Uap8JKSOM1UWp0049lB8vUPyvMZhn3dICv2FSEHwrah1rJZnZCU1FpC
   q2B4CwKmHRbRvJcI+6vRhciOFpW3OvlPgibJ8xphiwDt7/LCBG72W4p5D
   X3X6bNaHzjuy5pcBMvlTjdLSvsHPeJU6mSsUP3QEfuqOrx5MV1MPOEDrw
   dERmFFjpQj9VWVm1RByQheCAMQUzX2HWwpAO2pSkb1MK4sH+KoOVBGGmN
   bXspITe1V7w9x6IhbfsYxjLU6Zgl32lkCEzwNQ/LY3Gmsq8QJ3LTQHVZA
   A==;
X-CSE-ConnectionGUID: 7bnPM5+JRyu5Y1+PK+Y6mw==
X-CSE-MsgGUID: 0iTn6TunQuy+ALvqr7SD4Q==
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="34720616"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 15:37:32 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.48:16665]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.36.204:2525] with esmtp (Farcaster)
 id 52d19a38-26bb-465d-85d4-058a1cd6f6f9; Mon, 23 Nov 2026 15:37:31 +0000 (UTC)
X-Farcaster-Flow-ID: 52d19a38-26bb-465d-85d4-058a1cd6f6f9
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.57;
 Mon, 23 Nov 2026 15:37:31 +0000
Received: from dev-dsk-sieberf-metal-1a-7543e84d.eu-west-1.amazon.com
 (172.19.116.227) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.57; Mon, 23 Nov 2026
 15:37:30 +0000
From: Fernand Sieber <sieberf@amazon.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: Ingo Molnar <mingo@kernel.org>, <linux-tip-commits@vger.kernel.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [tip: sched/urgent] selftests/sched: Add a core-sched forced-idle DL server test
Date: Mon, 23 Nov 2026 17:37:25 +0200
Message-ID: <20261123153725.33870-1-sieberf@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <179538776573.92412.6375274230600382710.tip-bot2@tip-bot2>
References: <20261112161548.78189-6-sieberf@amazon.com> <179538776573.92412.6375274230600382710.tip-bot2@tip-bot2>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ClientProxiedBy: EX19D031UWA002.ant.amazon.com (10.13.139.96) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Peter,

Thanks for picking these up. I think there's an issue with the split:
sched/urgent has the two fixes and the new selftest:

  d2583cb03113 ("sched/deadline: Clear stale rq->dl_server when core-sched replaces a pick")
  f4626e1c3c14 ("sched/deadline: Don't charge core-sched forced idle to the DL servers")
  6d6fca38f51f ("selftests/sched: Add a core-sched forced-idle DL server test")

but the ranking patch went to sched/core:

  87a825f3c680 ("sched/core: Rank DL server picks as deadline in the core-wide pick")
  https://lore.kernel.org/all/179542773720.92412.4774760214632371644.tip-bot2@tip-bot2/

Without it the selftest fails on sched/urgent (8/8 in QEMU, the CFS
task gets 0-1% against the 2.5% floor), and passes with it.

Could you move 87a825f3c680 to sched/urgent too? If you would rather
keep it for the merge window, the selftest should go to sched/core with
it.

Thanks,
Fernand



Amazon Development Centre (South Africa) (Proprietary) Limited
29 Gogosoa Street, Observatory, Cape Town, Western Cape, 7925, South Africa
Registration Number: 2004 / 034463 / 07

