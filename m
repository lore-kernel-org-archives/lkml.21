Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983639;
	b=1TKzazPouE00ljxTeFj7lUdrMTuJKhueGKJgdvjzuaBXmfMZoTA3/xUN/Zf9Va3p7nvC
	 GLJL6fNzMUealz6d9mic7NaB8BZZofCp1y+w1VFO+WlLuE0parw+IwHc4EyRgpu6o/l+o
	 SQYsTjpf+NzqJ+Szy9DoLweAl57a8y9A1LyRqr5ylu2Fl7uzlIjl5U0Mt1nitrSefI9iO
	 mS2asqYMOKLvauiVsiMFRJSWtg94XubxZ9gnQH+Eh+KgUkiS4QU4naT5C32p8eQgV6jJv
	 FrEarJkyeTd8t8GKK0kSnSOSp9Ld4sTS5Khp+G+cMQh6kZETrNk93qQR8ILA+R1jQZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983639;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=+LkSY5GlXR1Cv2REFbi0XBAyEkYgGEsqiwtvr/sPn20=;
	b=Lh3xZiBrt76Gf7eYymWff+b8jzGUxOnjwqrLQp0IXMLt8tz3GeEwC13J7U5zgfM9aNgy
	 u7b1iPf31nrzj6MGrc7slccjc0N4Hj454DODcKPvGmh2ChUztzy2vignMgFpKPRGgSoHB
	 oqohAt7dBYMguu2Hvh7yqsvjtczYkTd2/TwcY6qfhkY7oONELEhZSognMdUqp6bykrGip
	 kxmCDWNKtF4lUNsYaLUq5Hy4opCurGGjzpV71iX/fYB213zmMknHFTw8cxiZDxwzYeRGx
	 T0cxIGB75jD7eRDf6behFLksaf1T1NGB14pvsuScbS3RNPssCcwL0PqsmRVc1DF7Q1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	dkim=pass header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=nAKa9CPq;
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9157E606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9157E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=nAKa9CPq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+LkSY5GlXR1Cv2REFbi0XBAyEkYgGEsqiwtvr/sPn20=; t=1794983638; x=1795847638; 
	b=nAKa9CPql0z+1sMynzYMl8vekukgptl7utHFq5cKufEkBl/0vDkjijQJqZn6KgpgsQymqtpmM0q
	vw2xaH7w9B83apDnI3EjxYxL3BsAzXqzTDVB6yJpLraDtAd7yl6B9Qv5jjjYhD6p4yoFtUnCxF0Si
	/pA8yceNqqcdsMDEZlHGX6hTW5HKQM9+W8+WrGqqNXYM+/bnYT/SExyBsCXUkd9ZZakQxjoi5CM7U
	2j55xEuXZW5oIP98+aH7uiJ2AFRU2U/W4seAMrVbLiPAd7XX5MUXzNVDeoxsqKh68OVmUPuPw5FPE
	6wA0ILMQKg1Qpt5K7vdNoIAnikC+zjo8BnLg==;
Received: from [167.220.238.88] (helo=csail.mit.edu)
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <srivatsa@csail.mit.edu>)
	id 1xTZEw-00EuZP-Ef;
	Wed, 18 Nov 2026 01:33:54 -0500
Date: Wed, 18 Nov 2026 12:03:46 +0530
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
To: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
Cc: tgopinath@linux.microsoft.com, ssengar@linux.microsoft.com,
	michal.simek@amd.com, rajan.vaja@xilinx.com, tejas.patel@xilinx.com,
	abhyuday.godhasara@xilinx.com, gregkh@linuxfoundation.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	tglx@linutronix.de
Subject: Re: [PATCH 2/2] soc: xilinx: Fix event manager CPU hotplug state
 cleanup
Message-ID: <av1GyoUdnxMV_C2p@csail.mit.edu>
References: <20261103062051.676519-1-ptsm@linux.microsoft.com>
 <20261103063515.679043-1-ptsm@linux.microsoft.com>
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
In-Reply-To: <20261103063515.679043-1-ptsm@linux.microsoft.com>

On Mon, Nov 02, 2026 at 10:35:15PM -0800, Prasanna Kumar T S M wrote:
> On driver removal, the event manager removes the CPUHP_AP_ONLINE_DYN
> CPU hotplug state instead of the its actual state. This can leave the
> event manager callbacks dangling. Use the actual CPU hotplug state
> during driver removal.
> 
> Hotplug registration failures are also ignored, allowing probe to
> succeed without the callbacks needed to enable event interrupts on
> CPUs brought online later.
> 
> Fixes: c7fdb2404f66 ("drivers: soc: xilinx: add xilinx event management driver")
> Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
> ---
>  drivers/soc/xilinx/xlnx_event_manager.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/xilinx/xlnx_event_manager.c b/drivers/soc/xilinx/xlnx_event_manager.c
> index f733dc42b3b1..2d8bfeab4190 100644
> --- a/drivers/soc/xilinx/xlnx_event_manager.c
> +++ b/drivers/soc/xilinx/xlnx_event_manager.c
> @@ -24,6 +24,7 @@ static DEFINE_PER_CPU_READ_MOSTLY(int, dummy_cpu_number);
>  
>  static int virq_sgi;
>  static int event_manager_availability = -EACCES;
> +static enum cpuhp_state hp_state;
>  
>  /* SGI number used for Event management driver */
>  #define XLNX_EVENT_SGI_NUM	(15)
> @@ -625,8 +626,6 @@ static int xlnx_event_init_sgi(struct platform_device *pdev)
>  
>  static void xlnx_event_cleanup_sgi(struct platform_device *pdev)
>  {
> -	cpuhp_remove_state(CPUHP_AP_ONLINE_DYN);
> -
>  	on_each_cpu(xlnx_disable_percpu_irq, NULL, 1);
>  
>  	irq_clear_status_flags(virq_sgi, IRQ_PER_CPU);
> @@ -660,8 +659,13 @@ static int xlnx_event_manager_probe(struct platform_device *pdev)
>  	}
>  
>  	/* Setup function for the CPU hot-plug cases */
> -	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "soc/event:starting",
> -			  xlnx_event_cpuhp_start, xlnx_event_cpuhp_down);
> +	hp_state = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> +			"soc/event:starting", xlnx_event_cpuhp_start,

Let's change :starting to :online as per convention, as this is
associated with the ONLINE_DYN state.

Can we also edit the callback names for symmetry similar to the
suggestion for patch 1/2?

> +			xlnx_event_cpuhp_down);
> +	if (hp_state < 0) {
> +		xlnx_event_cleanup_sgi(pdev);
> +		return hp_state;
> +	}
>  
>  	ret = zynqmp_pm_register_sgi(sgi_num, 0);
>  	if (ret) {
> @@ -670,6 +674,7 @@ static int xlnx_event_manager_probe(struct platform_device *pdev)
>  		else
>  			dev_err(&pdev->dev, "SGI %d registration failed, err %d\n", sgi_num, ret);
>  
> +		cpuhp_remove_state(hp_state);
>  		xlnx_event_cleanup_sgi(pdev);
>  		return ret;
>  	}
> @@ -704,6 +709,7 @@ static void xlnx_event_manager_remove(struct platform_device *pdev)
>  	if (ret)
>  		dev_err(&pdev->dev, "SGI unregistration over TF-A failed with %d\n", ret);
>  
> +	cpuhp_remove_state(hp_state);
>  	xlnx_event_cleanup_sgi(pdev);
>  
>  	event_manager_availability = -EACCES;

It looks like this patch 2/2 doesn't have the kind of bugs in the
cleanup path that affected patch 1/2, so that's good.

Regards,
Srivatsa
