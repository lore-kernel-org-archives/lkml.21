Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.77.154.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795885573;
	b=KeWPLFMvyH6Rxl3poHFYib0eHFJjtnmsOx14AatIS9IYb+v51u65zp8tqyhEsF8px8bu
	 zhmg2eNnSXP5ezr6HeHKiaP4UphFtntazq/dJeADoPMwUoQf+YzeYbnk6LCPjxJ1wo8/C
	 Ll8ZPzAcirNE3meiY+4cVn1Q/tpzMZvrxhWPd9XXNMAlAFA9XrjQvLcH7tjsqIN+fju3q
	 rag5g+ErGda/ACM4a+mxqBvKKxMfZLzKGn9sUs8lcp6wfrYlo97gXbj7ksEuVefgaDAwM
	 Atf2ByPyMfNC1TS6ne2y0Q06OUOTR+q5wKHPh9KaBMZVWuPmd45Yf8g2oSauTx/jlpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795885573;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Spam-Status:
	 X-Spam-Checker-Version;
	bh=IL+abS4drh2AObDh33qBlAYz3+fsSFXOg4eQrW6BQ48=;
	b=MagfpF+lnIlDP59FrDPXi3Nm+LiD2iLgf42lU88NpOVzCkH0dRwaXmtwqmrzqqHIGVt/
	 JwiLhfinM2rS0Fff5cj0CNLrpHtaIldRJUpJ9ak17Th9Xh00YuRTsTjmI0gSjSHZ7LFGv
	 avJTD7/wSafxSlt1gbLiJg6cYDKmGEskVcH/w78wVVooGvwS3VBIemp4jkQ7XDc2IioSe
	 2q+wDmWDl4Sm/qFXmI/+LAjnwjoKbeLwr7xVL0Mal0Ug0K1Aj85OXTcFBeXMEKYPcBXVu
	 7ZAJtW0AvahBWCd0I+Rt27QWLPXxaS4YEi2ax04b5NPs8RibwL7vPNWRNS4P/RrjVjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.microsoft.com;
	spf=pass smtp.mailfrom=linux.microsoft.com;
	dkim=pass header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=RLqWNvtL;
	arc=none smtp.remote-ip=13.77.154.182
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31166606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31166606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=RLqWNvtL
Received: from [192.168.1.10] (unknown [52.172.102.219])
	by linux.microsoft.com (Postfix) with ESMTPSA id 9764120B7166;
	Sat, 28 Nov 2026 09:06:03 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9764120B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1795885566;
	bh=IL+abS4drh2AObDh33qBlAYz3+fsSFXOg4eQrW6BQ48=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RLqWNvtLz6mS1BX6YDSCfNAV5whm+Ov7yv0NAWVmfzLA24y/hx/+V8RhbW/huLLM6
	 OyYvqinv5K0glIcodmDC3nFkV76M1fDVnoM5GdxD0Sm9FOfubA2a0WvtztqKQxi1MV
	 DfAcMj+n4w8JIJOjXF9ieNnxL5a4rGEiZwP2LYaI=
Message-ID: <3a44999e-655b-409a-8806-cd434722ff45@linux.microsoft.com>
Date: Sat, 28 Nov 2026 22:36:08 +0530
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
Subject: Re: [PATCH 1/2] mailbox: zynqmp-ipi: Fix CPU hotplug state cleanup
To: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>,
 "Pandey, Radhey Shyam" <radheys@amd.com>
Cc: jassisinghbrar@gmail.com, michal.simek@amd.com, tanmay.shah@amd.com,
 saeed.nowshadi@amd.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ssengar@linux.microsoft.com,
 tgopinath@linux.microsoft.com, tglx@linutronix.de
References: <20261103062051.676519-1-ptsm@linux.microsoft.com>
 <15903ed0-d3bd-4cf9-a051-ec663411ae38@amd.com>
 <av1DetqUhUGqdyu3@csail.mit.edu>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <av1DetqUhUGqdyu3@csail.mit.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 18-11-2026 11:49, Srivatsa S. Bhat wrote:
> On Wed, Nov 04, 2026 at 11:23:33AM +0530, Pandey, Radhey Shyam wrote:
>> On 11/3/2026 11:50 AM, Prasanna Kumar T S M wrote:
>>> On driver removal, the CPUHP_AP_ONLINE_DYN CPU hotplug state is removed
>>> instead of the its actual state. This can leave the mailbox driver
>>> callbacks dangling. Use the actual CPU hotplug state during driver
>>> removal.
>>>
>>> Hotplug registration failures are also ignored, allowing probe to
>>> succeed without the callbacks needed to enable interrupts on CPUs
>>> brought online later.
>>>
>>> Fixes: 6ffb1635341be ("mailbox: zynqmp: handle SGI for shared IPI")
>>
> [...]
>>
>>> +			  xlnx_mbox_cpuhp_down);
>>> +	if (pdata->hp_state < 0) {
>>> +		irq_clear_status_flags(pdata->virq_sgi, IRQ_PER_CPU);
>>> +		free_percpu_irq(pdata->virq_sgi, &per_cpu_pdata);
>>> +		irq_dispose_mapping(pdata->virq_sgi);
>>> +		return pdata->hp_state;
>>
>>   1. The new error path double-frees and then hits BUG().
>> Please reconfirm.
>>
>> zynqmp_ipi_probe() sets pdata->irq_type before calling xlnx_mbox_init_sgi(),
>> and its only error label runs
>>    zynqmp_ipi_free_mboxes() → xlnx_mbox_cleanup_sgi() whenever irq_type ==
>> IPI_IRQ_TYPE_SGI. So the new unwind runs, then the caller's unwind repeats
>>    irq_clear_status_flags(), free_percpu_irq() and irq_dispose_mapping().
> 
> Good catch!
> 
>> Before any of that, cleanup calls cpuhp_remove_state(pdata->hp_state) with
>> the negative errno still in the field, and _cpuhp_remove_state_cpuslocked()
>> opens with BUG_ON(cpuhp_cb_check(state)), which rejects anything <=
>> CPUHP_OFFLINE. A failed hotplug registration now panics instead of failing
>> probe.
>>
> 
> So, xlnx_mbox_init_sgi() should simply return an error upon CPU
> hotplug registration failure and let the caller handle the cleanup;
> and in xlnx_mbox_cleanup_sgi(), a check for pdata->hp_state > 0 should
> be added like this:
> 
> if (pdata->hp_state > 0)
> 	cpuhp_remove_state(pdata->hp_state);
> 
> I think that ought to fix both the issues pointed out above.

Sure, I will incorporate these in v2.

> 
>>
>>> +	}
>>>    	return ret;
>>>    }
>>>    static void xlnx_mbox_cleanup_sgi(struct zynqmp_ipi_pdata *pdata)
>>>    {
>>> -	cpuhp_remove_state(CPUHP_AP_ONLINE_DYN);
>>> +	cpuhp_remove_state(pdata->hp_state);
>>>    	on_each_cpu(xlnx_disable_percpu_irq, NULL, 1);
>>
> 
> Regards,
> Srivatsa

