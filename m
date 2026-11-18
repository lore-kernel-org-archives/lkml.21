Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982112;
	b=zsb/wttlLPJlGpF9lR2TyLrh/LJmENdc0Z0WXo9iEoltdyBUYnzmU/pStODm3fLj4Lef
	 gxezzaFUZI73yhDKO5yvnqCgorEgJzpZWXNoKaUh7BJKDUFrfW/vqJ6xnkdNc2ke4PMZd
	 koP1Y7oHSpmH3A4Fs7K7/vTuu67BMg7ztI5PyRwXZRxOVnIxwtyAMvW8Nx55K/trVCiRy
	 pPboPf5u15Tfhecgz82l2+ZEj2KZgE+1YvOEyfnAd/UnUZeQV4/RMul73oJhgYyhEb/rk
	 syNqTPJ9e73CO8bHp+HIGwuAZD9HUBJrd/gTB2vVr4k9e5b0BYEM8DNm2RaCA+qPYag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982112;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=GFY5eXhrSXz7DCVGm5HhwAGhhVHVuaa22feO3ifIlN4=;
	b=shs0cJT2kk6Tk4uqGnfXSuudNebFjlPb6r1XquAIM4mCZe+3f8KOaAIHHxY7rjRYvG6o
	 JCwDXT1s7wlZN6hyVy6ZmZ549Pwo2RnjMJpfFhpG+faSKhbziJV6YkxMunBJtI/6874dN
	 +AnyZMo6+e70rgGdcq44CfkRzqFIN5YCmnvxk2Ly5/oZT0jc0dJ0QjfEv7pJRfAolkLjT
	 0axjDuk4yNJcnZlONDZ6xGv2YjvJqQI1OXQkqX56wtlvHCtcX8i2uARkatmmbOGg0uWxx
	 Ac+oxG9HU6CwJ1XoN7p0Ej5e52FQ35ZdlzlebraQgRInjEh0mCINHLVEt2CodcCaw9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	dkim=pass header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=FzrOLv3w;
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCEF606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFCEF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=FzrOLv3w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=GFY5eXhrSXz7DCVGm5HhwAGhhVHVuaa22feO3ifIlN4=; t=1794982111;
	x=1795846111; b=FzrOLv3wIYXTH4tN5Q4pkvf9BtW0C7P4hb2/ZL2DsEAEwvsAAeyxQRzWWNtDK
	dK7keKhltZ6/ofs7jikitbM5PMJJb73XST52yBxlT/62zxWEal9f1K48GPucNJI8beeaXgehecPy/
	gDnLqrHpF7lAVCBQgf81lAdM1IMlxVPvSLlwjFhYDL3AI2GGFIOXwe4Jps3nVJ2x+Es1FgCMzxEuF
	ocyznxvdGxgXbkfOgaJWA3U74PaF8eA3ROuB5z7ZoQ0mPW4NV7K81IGazbhBbLKTytcyL17IGg/r5
	GzzrWschfMgo6Vy9uEM7PF7XGQ7SbJ+6KFEZ2m6fFhtvgYHJiw==;
Received: from [167.220.238.88] (helo=csail.mit.edu)
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <srivatsa@csail.mit.edu>)
	id 1xTYqJ-00EpBt-C4;
	Wed, 18 Nov 2026 01:08:27 -0500
Date: Wed, 18 Nov 2026 11:38:14 +0530
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
To: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
Cc: "Pandey, Radhey Shyam" <radheys@amd.com>, jassisinghbrar@gmail.com,
	michal.simek@amd.com, tanmay.shah@amd.com, saeed.nowshadi@amd.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	ssengar@linux.microsoft.com, tgopinath@linux.microsoft.com,
	tglx@linutronix.de
Subject: Re: [PATCH 1/2] mailbox: zynqmp-ipi: Fix CPU hotplug state cleanup
Message-ID: <av1Azk3TNy05J-Z3@csail.mit.edu>
References: <20261103062051.676519-1-ptsm@linux.microsoft.com>
 <15903ed0-d3bd-4cf9-a051-ec663411ae38@amd.com>
 <439409ae-bd42-459e-9c0d-21fc5629f635@linux.microsoft.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <439409ae-bd42-459e-9c0d-21fc5629f635@linux.microsoft.com>

On Wed, Nov 04, 2026 at 04:51:28PM +0530, Prasanna Kumar T S M wrote:
> Hi Radhey Shyam,
> 
> Thanks for reviewing this.
> 
> On 04-11-2026 11:23, Pandey, Radhey Shyam wrote:
> > On 11/3/2026 11:50 AM, Prasanna Kumar T S M wrote:
> > > On driver removal, the CPUHP_AP_ONLINE_DYN CPU hotplug state is removed
> > > instead of the its actual state. This can leave the mailbox driver
> > > callbacks dangling. Use the actual CPU hotplug state during driver
> > > removal.
> > > 
> > > Hotplug registration failures are also ignored, allowing probe to
> > > succeed without the callbacks needed to enable interrupts on CPUs
> > > brought online later.
> > > 

[...]

> > > @@ -863,15 +864,22 @@ static int xlnx_mbox_init_sgi(struct
> > > platform_device *pdev,
> > >       irq_set_status_flags(pdata->virq_sgi, IRQ_PER_CPU);
> > >       /* Setup function for the CPU hot-plug cases */
> > > -    cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "mailbox/sgi:starting",
> > > -              xlnx_mbox_cpuhp_start, xlnx_mbox_cpuhp_down);
> > > +    pdata->hp_state = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> > > +              "mailbox/sgi:starting", xlnx_mbox_cpuhp_start,
> > 
> > what is :starting here ?
> 
> I used the existing string.

Let's please fix it while we are at it. The convention is to match the
mode in the @name argument to the CPU hotplug state that it is
associated with. So in this case, :online would be the right one to
use instead of :starting.

Also, could you consider editing the names of the callbacks for
symmetry? Ex: We can rename them to xlnx_mbox_cpuhp_startup() and
xlnx_mbox_cpuhp_teardown() instead of _start() and _down() that are
used today.

Regards,
Srivatsa
