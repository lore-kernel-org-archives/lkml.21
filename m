Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982790;
	b=4LHty2aZ0TQfrV4xUJ3yPtD6poQ5wXO91Cv2vtTspe4ljFVLycGz7YVQkF02Jt48TDq7
	 yDEhZSW9JfCv490IBTB+9TFEB1MrEZKLLq/YAlmMZJePINx2nCb/jTYq56Dyqd/NnJDIr
	 xFYyQgXM5TmMx6pcMV3iczfIz+TbFJ2Ti5AtBjOeuj9s9viWigA4e5zc5FuCyBA9lDE7h
	 AJCaKepX4Aj7ly3Yzpfxw96qLdKwMWrKtj2agACdRIzSO7FgNy84flTSGA4tKqXbEx3OZ
	 9rIzGCZfnds/bFNdBidvWO7gZL7jBBqg5vI+Q6Vk2ABep7ARn+fr8F80uqoFUQFvpGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982790;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=jRRU8RPJrxcp7t0qWX4SXKqmEYCn8GHmGrRqIBb1xgs=;
	b=kz+U2DtrTN/Yp/Tq7CSMqUoG2MQ8SrJqpNOEzdI18oWmKskLxsCzgEUGy9wIIo/cFmg9
	 B6tdMWZCGJ10xR+zM8LZvwPI6PthmUZtRLAxUDyz138/+JZhdjDVNYCDF4AS+u09RLZbo
	 14qrh3iPeGPx43qYAwiq8/DgFx4EK8f3sjbORFyNdeqOnfmHRaAWDl1jWVg54mH9LgRL2
	 RiXlfBgKVclVC5qi2mixrOLRMJ+0UmoGFWtngkFW+tZZlUtXIOM6N6szLLdLrAOO8D+6E
	 6FhRN3mnv2UgFK5TnMTBshR5srJfD//Ztux6kVwXcnW8h8xUKiJtzKB7+GIoWVDYxzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	dkim=pass header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=n7yFg0me;
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7026D606A883
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7026D606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=n7yFg0me
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=jRRU8RPJrxcp7t0qWX4SXKqmEYCn8GHmGrRqIBb1xgs=; t=1794982790;
	x=1795846790; b=n7yFg0meSKM+jlEku3ZQONOSzVhPH25groFVv4YGxeNCjbq5p24Pp95gRIeBN
	BKSvtzsA1X66KH0MWp0mE9P/kxzsnTiChkWiOy02SsEP4G0p/Qbl03yfCh8gkjTWe0sh6N/Nsax38
	Ibty8aef1xFtbLdlOT8iLOyGhrUNxh/4Bpz3xkXA0YPbqMcOJ5TZsQJB8Mzi+ZW8/ki9pJhcP8Hrb
	Lnz/IlP0a8wnEs0TqvHKO6IEb8J55TuDKku0fjaOdyRsMLLG901BYOMXOOu3PBvs8bLSBx5smA3ch
	OUNOu0Wp6Mrt+s0udm9egUw6M5K+vsxIvWv87H0hGPKC+B9HBA==;
Received: from [167.220.238.88] (helo=csail.mit.edu)
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <srivatsa@csail.mit.edu>)
	id 1xTZ1G-00ErIB-KJ;
	Wed, 18 Nov 2026 01:19:47 -0500
Date: Wed, 18 Nov 2026 11:49:38 +0530
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
To: "Pandey, Radhey Shyam" <radheys@amd.com>
Cc: Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	jassisinghbrar@gmail.com, michal.simek@amd.com, tanmay.shah@amd.com,
	saeed.nowshadi@amd.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, ssengar@linux.microsoft.com,
	tgopinath@linux.microsoft.com, tglx@linutronix.de
Subject: Re: [PATCH 1/2] mailbox: zynqmp-ipi: Fix CPU hotplug state cleanup
Message-ID: <av1DetqUhUGqdyu3@csail.mit.edu>
References: <20261103062051.676519-1-ptsm@linux.microsoft.com>
 <15903ed0-d3bd-4cf9-a051-ec663411ae38@amd.com>
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
In-Reply-To: <15903ed0-d3bd-4cf9-a051-ec663411ae38@amd.com>

On Wed, Nov 04, 2026 at 11:23:33AM +0530, Pandey, Radhey Shyam wrote:
> On 11/3/2026 11:50 AM, Prasanna Kumar T S M wrote:
> > On driver removal, the CPUHP_AP_ONLINE_DYN CPU hotplug state is removed
> > instead of the its actual state. This can leave the mailbox driver
> > callbacks dangling. Use the actual CPU hotplug state during driver
> > removal.
> > 
> > Hotplug registration failures are also ignored, allowing probe to
> > succeed without the callbacks needed to enable interrupts on CPUs
> > brought online later.
> > 
> > Fixes: 6ffb1635341be ("mailbox: zynqmp: handle SGI for shared IPI")
> 
[...]
> 
> > +			  xlnx_mbox_cpuhp_down);
> > +	if (pdata->hp_state < 0) {
> > +		irq_clear_status_flags(pdata->virq_sgi, IRQ_PER_CPU);
> > +		free_percpu_irq(pdata->virq_sgi, &per_cpu_pdata);
> > +		irq_dispose_mapping(pdata->virq_sgi);
> > +		return pdata->hp_state;
> 
>  1. The new error path double-frees and then hits BUG().
> Please reconfirm.
> 
> zynqmp_ipi_probe() sets pdata->irq_type before calling xlnx_mbox_init_sgi(),
> and its only error label runs
>   zynqmp_ipi_free_mboxes() → xlnx_mbox_cleanup_sgi() whenever irq_type ==
> IPI_IRQ_TYPE_SGI. So the new unwind runs, then the caller's unwind repeats
>   irq_clear_status_flags(), free_percpu_irq() and irq_dispose_mapping().

Good catch!

> Before any of that, cleanup calls cpuhp_remove_state(pdata->hp_state) with
> the negative errno still in the field, and _cpuhp_remove_state_cpuslocked()
> opens with BUG_ON(cpuhp_cb_check(state)), which rejects anything <=
> CPUHP_OFFLINE. A failed hotplug registration now panics instead of failing
> probe.
> 

So, xlnx_mbox_init_sgi() should simply return an error upon CPU
hotplug registration failure and let the caller handle the cleanup;
and in xlnx_mbox_cleanup_sgi(), a check for pdata->hp_state > 0 should
be added like this:

if (pdata->hp_state > 0)
	cpuhp_remove_state(pdata->hp_state);

I think that ought to fix both the issues pointed out above.

> 
> > +	}
> >   	return ret;
> >   }
> >   static void xlnx_mbox_cleanup_sgi(struct zynqmp_ipi_pdata *pdata)
> >   {
> > -	cpuhp_remove_state(CPUHP_AP_ONLINE_DYN);
> > +	cpuhp_remove_state(pdata->hp_state);
> >   	on_each_cpu(xlnx_disable_percpu_irq, NULL, 1);
> 

Regards,
Srivatsa
