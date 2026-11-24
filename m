Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534511;
	b=5pbPBBZ/SuXSyZazMfQwNnEPwk7rOHyIWws35j0F8BCjG18gCevZadSRHIAwSxnkfNxu
	 4j1Q4KhPdb7n+7izL2rpf599BZ8JQ421grKk/eIOf9fvz4nhFTqbs+fSVkA/TAOmC9hCS
	 MXWjek+7Vv3kORKAWtt0RdtJvWiVIDRm9pazWfVtmfk6jGKbegVt1w/SNasxV+nDP5SqE
	 sUAvEb5TI3M8tL/tYq/mzj0qez7JWXmAwPLROkC06kSmUwbC0ete8K+XQBPGhbtbBWl8I
	 pjIvXPiWyc+DPc6uNV1W79PBodtFYxpjXA1IEzx0PpULyO0QFIuVU243Jp2OjE/KXag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534511;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=dXFaLZetJ8SRrPD7gq+eCxSdvOq4XyZytn0D86Q0n2Y=;
	b=tn27U1AISUm8YIXnos2+vi9IYjIWQkklP1Uc6jDXVmh9qSNaOiSpiSPdjAtTwFiSnOlN
	 4Sy0UonjvIj1lLPq/ka5Kcc3ALoj9ATJCtJ5V0aRtA3LcxK0fo+PEvARCPGfbhnrIefjB
	 CY34k3810H+XSyL49Mo52atwVfy24Nf8lZ3p/xtsuP87c0qJG4H1Nfkl8/Pi3dWOvICwW
	 /tv6ZegGrZ7A7D2x+Bp9NgxLlAd0hlz80XOnUlGNrNGeyNZlef/yoGuQ+KrCSbIj0JRz8
	 M7yO6Odgp3OpEmsxA/BFyUfrCsQTiK3c6brsIbaKVEaynOWXipcJNVGkYJIuyjEcVKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Fn8y9Wtw;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 312DB606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:35:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 312DB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Fn8y9Wtw
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 991C4339;
	Tue, 24 Nov 2026 07:35:07 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 21DEA3F763;
	Tue, 24 Nov 2026 07:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795534510; bh=mW2BtmkAlIECVmLfUMdR7ew9cRxGXGwviSOU1SjuL8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fn8y9WtwvYt+9zItLgXBv0cDUCHw+2yj8AmRfwM28AvJ0hD+O/KtS7S5cij6XrtuJ
	 ETa1SEiqIdbBkwywxSjqr+vVWy4k7GaNV4oIVmjYGYOyPZLi3oOCwdyY/NsJb0r7wI
	 O5S9cwWfQ5Mo8Z7/TA3hgHbjHZHcljyyKAmo+pdM=
Date: Tue, 24 Nov 2026 15:35:08 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
	Vlad Poenaru <vlad.wing@gmail.com>, Amir Ayupov <aaupov@fb.com>,
	Suyash Mahar <smahar@meta.com>, Song Liu <song@kernel.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: perf: End AUX output when an event is
 throttled
Message-ID: <20261124153508.GA7209@e132581.arm.com>
References: <20261124-arm_cs_fix_throttling_oops-v1-1-3ad1dfad0159@arm.com>
 <09e172d0-3ef5-44ef-a966-7db3b8a4af9a@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09e172d0-3ef5-44ef-a966-7db3b8a4af9a@arm.com>

On Tue, Nov 24, 2026 at 01:06:04PM +0000, Suzuki K Poulose wrote:

> > Check AUX handle ownership before updating the buffer or ending AUX
> > output. Drop the post-update check because the full stop runs with
> > local IRQs disabled, which prevents the TRBE IRQ from closing the
> > handle during the stop.

...

> > +	if (mode & PERF_EF_UPDATE) {
> >   		/* update trace information */
> > -		if (!sink_ops(sink)->update_buffer)
> > -			return;
> > -
> > -		size = sink_ops(sink)->update_buffer(sink, handle,
> > -					      event_data->snk_config);
> > -		/*
> > -		 * Make sure the handle is still valid as the
> > -		 * sink could have closed it from an IRQ.
> > -		 * The sink driver must handle the race with
> > -		 * update_buffer() and IRQ. Thus either we
> > -		 * should get a valid handle and valid size
> > -		 * (which may be 0).
> > -		 *
> > -		 * But we should never get a non-zero size with
> > -		 * an invalid handle.
> > -		 */
> > -		if (READ_ONCE(handle->event))
> > -			perf_aux_output_end(handle, size);
> > -		else
> > -			WARN_ON(size);
> > +		if (sink_ops(sink)->update_buffer)
> > +			size = sink_ops(sink)->update_buffer(sink, handle,
> > +							     event_data->snk_config);
> 
> Could we retain the READ_ONCE() check to handle the TRBE case here ? This
> looks like introducing a regression. Something like :
> 
> 		if (!READ_ONCE(handle->event)) {
> 			WARN_ON(size);
> 			goto out;
> 		}
> 
> 
> >   	}
> 
> 
> Otherwise looks good to me

etm_event_stop() runs with local IRQ disabled, so the TRBE IRQ handler
cannot close the AUX handle during the stop. If the handler closed it
earlier, the ownership check before update_buffer() catches that case.

The second READ_ONCE(handle->event) check is redundant and is safe to
be removed.

Thanks,
Leo
