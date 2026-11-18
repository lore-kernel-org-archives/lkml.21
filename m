Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017349;
	b=1swxg1P66JbDb+QGdwpJXw57UvP3pvfQYLsM2GPnNUZ+qxlq2N2nYCfWJ86EUVBZ2FnB
	 k92XQHMHx5cpaPU4guPN+szH6pIDDMZPwsGHEe6IVQQzyie/h45bfdT5GKCvfuNXEYVLI
	 wjffQsnc6hXonWzqA5inm2a0c4tLwZii77TqVm78MchCIfuVc957f+OcJwpcb1aNMo9xf
	 jH2I8kotMN0Qa4G+s8nhDNv664nBz3hqBbrRWXo5jtkhjHk8En8qxBT6uSr7Kt7w2iAU5
	 KA8j4kiPqlnRbViGLOypscMNW0xPgQ7SMK6mlifCrAcSGoT1yYclQdeTyr1STOotMsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017349;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=vgP9cSb8lJhqY5azgUntFbPTb76b+oneMmPU0mkJZ4U=;
	b=Ke56vyQmdQqZtu9MXOy0r8sbk2llGWCK0wa/BQj2sB/w42wWL5fMQMfn0VDL20vPyZC/
	 +x4c1zUW3efgB7v7YRCJoWGB6CmrK4tP6KSRSKZ0+x24a9FaVG1Q/fZJIDojautIUigIm
	 3YLsMbK7eqKJdmfeEei9MTNEHWD1H2IZw9/AHyB8W+BxqHR2na2KHLDp+ykAJ6kly/25F
	 MlYlRWFsDA218cUJx/L2UZDT7iehWHp/Kzbyx4sx7dYJ6pfj1bEjrqEYf0kNLtUy2tM/F
	 dwQB04qo9r1Pcqu1c7VRgQKrSvtL3r8rBXQeFDnrqnSxro5rBgK6/uqdu+bBW3jdpIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZefU66TI;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9BF606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D9BF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZefU66TI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795017348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vgP9cSb8lJhqY5azgUntFbPTb76b+oneMmPU0mkJZ4U=;
	b=ZefU66TIdjzxxUigFm+PwKKRcxspPTjigWCImCVWYxDtp1HXOa27+mFWJ3CccNqQtRPBf3
	DAIW0kl3XzwzYtQG01V25VEXN8I7gJPpy8oibDktKe3TGyoMe+D0TKlCnMA3MoG4fC7D4M
	D1LTagZ6G5rN1tYiYUXASKM0H7MvFtg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-32-Hv76zvlfN8SXWdufgGQnmA-1; Wed,
 18 Nov 2026 15:55:41 +0000
X-MC-Unique: Hv76zvlfN8SXWdufgGQnmA-1
X-Mimecast-MFC-AGG-ID: Hv76zvlfN8SXWdufgGQnmA_1795017339
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3828A1956066;
	Wed, 18 Nov 2026 15:55:39 +0000 (UTC)
Received: from [10.17.16.204] (unknown [10.17.16.204])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 59C9B18004F7;
	Wed, 18 Nov 2026 15:55:36 +0000 (UTC)
Message-ID: <c40da4c4-1f70-44f7-983c-3349199b5b68@redhat.com>
Date: Wed, 18 Nov 2026 10:55:35 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] sched: BUG() in select_fallback_rq() at boot with
 isolcpus=domain on the boot CPU and CONFIG_CPUSETS=n
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Michal Hocko
 <mhocko@suse.com>, Tejun Heo <tj@kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, linux-kernel@vger.kernel.org
References: <20261117144817.265109-1-mathieu.desnoyers@efficios.com>
 <dd335ee6-c879-4bee-9ea8-6d9e9216fb0e@redhat.com>
 <av26-ojv3LkO2vXH@localhost.localdomain>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <av26-ojv3LkO2vXH@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 11/18/26 9:49 AM, Frederic Weisbecker wrote:
> Le Tue, Nov 17, 2026 at 10:13:02AM -0500, Waiman Long a écrit :
>> On 11/17/26 9:48 AM, Mathieu Desnoyers wrote:
>>> Hi,
>>>
>>> With CONFIG_CPUSETS=n, a kernel booted with isolcpus=domain,0 hits the
>>> BUG() in select_fallback_rq() during boot. CPU 0 is the boot CPU. I
>>> found it while testing a SCHED_DEADLINE series [1]. I then reproduced
>>> it on v7.4-rc2 alone. tip/master of 2026-11-17 and next-20261116 have
>>> the same code. A proposed fix follows the scissors line.
>>>
>>> Trigger
>>> =======
>>>
>>> Build x86-64 with CONFIG_CPUSETS=n. Boot a VM of 4 CPUs with
>>> isolcpus=domain,0 or isolcpus=domain,0,1. The kernel panics before
>>> init runs, in every boot.
>>>
>>> These boot fine:
>>> - the same kernel with isolcpus=domain,1,2, or without isolcpus;
>>> - a kernel with CONFIG_CPUSETS=y, with isolcpus=domain,0,1.
>> I am now thinking about disallowing the boot CPU from being domain isolated.
>> That will include using isolcpus=domain boot time isolation parameter as
>> well as in setting up isolated cpuset partition. Will that be a simpler
>> solution than fixing all these places where isolating the boot CPU will
>> cause various problems that need to be fixed?
> You can try that, hopefully nobody relies on that. nohz_full supports the
> boot CPU to be isolated but it's a heresy.

The upcoming runtime modification of nohz_full CPU will not support the 
boot CPU, at least for x86, as the boot CPU cannot be made offline. I 
would not recommend putting the boot CPU into nohz_full boot parameter, 
though we are not going to forbid it.

Cheers,
Longman

