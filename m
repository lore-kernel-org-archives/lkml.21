Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.77.154.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795885540;
	b=mcXeSpb4sfmK3Ls7xJZu675ZMlf6wWG8BClTQf8+YIm6FydeSRG9OAD0zFMk9xiXyqlv
	 lM/PLJJu0n81uxAQwgh7ZUsBhSULYdpeV0lLpT1v4cP643IlaY2JgEb2FThybxbiYfe7/
	 V/+XQxKNgCkhGmZ/v+OUmWCxs6KAUM/bE7+Mk1HWPiTM/yANAmGlmH7Nq1bLNcLovWp25
	 RjwWIHov7W1cNhd/l7zThxCV22Ei7FCcJZa02Q6gMQ3YDESxQdo5Btdqk1elGzXtve06Q
	 14cWOjU4yyOIhZoVLZ3t7Tt5RiiZ3l9yVReJSpg/EIXgJdX+FPgndef806K5O85vNBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795885540;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Spam-Status:
	 X-Spam-Checker-Version;
	bh=3bYdss1ed8s9M0znVEnCKXW7uP24Gi2rVDF9qKwxSjc=;
	b=0piXC6eraiIqN5PVLJZyA/2DDStkb6dV3fCe1nuzmtBwDYCGZWNExqdMazs+oZHeVYxX
	 RGEYp6apsvL5WxuGVoUL7ZXB/2WG6bpx2/NV72W3Ui8kcxyXJNeHD95sSAe9plKXGO85v
	 d+V1Z3GTxmN3xvrDx3Q2/7Kmaf8x01xUesdJ06HKo0fILgla6KghpgCeG4pT0MA+PxEEo
	 kPTO7VbVMF3LTyvsQgmRR8dpWdEABOJOPIOQov1IDduqugIcQNTLyu7G6DP03pIfrBffN
	 HbW/9rhslQFgo72ZYmo6A36nxoVN/mfgbeADvAcurpAPlE8Y94JT03Ou680RQvB4HZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.microsoft.com;
	spf=pass smtp.mailfrom=linux.microsoft.com;
	dkim=pass header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=WJSalcbm;
	arc=none smtp.remote-ip=13.77.154.182
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9791606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9791606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=WJSalcbm
Received: from [192.168.1.10] (unknown [52.172.102.219])
	by linux.microsoft.com (Postfix) with ESMTPSA id 3876420B7166;
	Sat, 28 Nov 2026 09:05:30 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3876420B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1795885532;
	bh=3bYdss1ed8s9M0znVEnCKXW7uP24Gi2rVDF9qKwxSjc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WJSalcbmSk3eA5Cove7z2u1LFojqCxdYnyjycX8sUp7f/QOYlnZKxDsPewI1mPjlw
	 jSYOifXHNNwJVVRWPlp1XIR3RthSovELv42l0AbZ7ymt4Ifk+RWM9PBZJzAYeNm/Md
	 PI7qMqmBE8lxaaPY0JAevP/kFgGfqddkdhHxj0gQ=
Message-ID: <d47482fa-f2bc-4ebb-97f6-fc305751d4da@linux.microsoft.com>
Date: Sat, 28 Nov 2026 22:35:34 +0530
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
Subject: Re: [PATCH 2/2] soc: xilinx: Fix event manager CPU hotplug state
 cleanup
To: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Cc: tgopinath@linux.microsoft.com, ssengar@linux.microsoft.com,
 michal.simek@amd.com, rajan.vaja@xilinx.com, tejas.patel@xilinx.com,
 abhyuday.godhasara@xilinx.com, gregkh@linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 tglx@linutronix.de
References: <20261103062051.676519-1-ptsm@linux.microsoft.com>
 <20261103063515.679043-1-ptsm@linux.microsoft.com>
 <av1GyoUdnxMV_C2p@csail.mit.edu>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <av1GyoUdnxMV_C2p@csail.mit.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Srivatsa,

On 18-11-2026 12:03, Srivatsa S. Bhat wrote:
> On Mon, Nov 02, 2026 at 10:35:15PM -0800, Prasanna Kumar T S M wrote:
>> On driver removal, the event manager removes the CPUHP_AP_ONLINE_DYN
>> CPU hotplug state instead of the its actual state. This can leave the
>> event manager callbacks dangling. Use the actual CPU hotplug state
>> during driver removal.
>>
>> Hotplug registration failures are also ignored, allowing probe to
>> succeed without the callbacks needed to enable event interrupts on
>> CPUs brought online later.
>>
>> Fixes: c7fdb2404f66 ("drivers: soc: xilinx: add xilinx event management driver")
>> Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
>> ---
>>   drivers/soc/xilinx/xlnx_event_manager.c | 14 ++++++++++----
>>   1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/soc/xilinx/xlnx_event_manager.c b/drivers/soc/xilinx/xlnx_event_manager.c
>> index f733dc42b3b1..2d8bfeab4190 100644
>> --- a/drivers/soc/xilinx/xlnx_event_manager.c
>> +++ b/drivers/soc/xilinx/xlnx_event_manager.c
>> @@ -24,6 +24,7 @@ static DEFINE_PER_CPU_READ_MOSTLY(int, dummy_cpu_number);
>>   
>>   static int virq_sgi;
>>   static int event_manager_availability = -EACCES;
>> +static enum cpuhp_state hp_state;
>>   
>>   /* SGI number used for Event management driver */
>>   #define XLNX_EVENT_SGI_NUM	(15)
>> @@ -625,8 +626,6 @@ static int xlnx_event_init_sgi(struct platform_device *pdev)
>>   
>>   static void xlnx_event_cleanup_sgi(struct platform_device *pdev)
>>   {
>> -	cpuhp_remove_state(CPUHP_AP_ONLINE_DYN);
>> -
>>   	on_each_cpu(xlnx_disable_percpu_irq, NULL, 1);
>>   
>>   	irq_clear_status_flags(virq_sgi, IRQ_PER_CPU);
>> @@ -660,8 +659,13 @@ static int xlnx_event_manager_probe(struct platform_device *pdev)
>>   	}
>>   
>>   	/* Setup function for the CPU hot-plug cases */
>> -	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "soc/event:starting",
>> -			  xlnx_event_cpuhp_start, xlnx_event_cpuhp_down);
>> +	hp_state = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
>> +			"soc/event:starting", xlnx_event_cpuhp_start,
> 
> Let's change :starting to :online as per convention, as this is
> associated with the ONLINE_DYN state.
> 
> Can we also edit the callback names for symmetry similar to the
> suggestion for patch 1/2?

I will incorporate these in v2.

> 
>> +			xlnx_event_cpuhp_down);
>> +	if (hp_state < 0) {
>> +		xlnx_event_cleanup_sgi(pdev);
>> +		return hp_state;
>> +	}
>>   
>>   	ret = zynqmp_pm_register_sgi(sgi_num, 0);
>>   	if (ret) {
>> @@ -670,6 +674,7 @@ static int xlnx_event_manager_probe(struct platform_device *pdev)
>>   		else
>>   			dev_err(&pdev->dev, "SGI %d registration failed, err %d\n", sgi_num, ret);
>>   
>> +		cpuhp_remove_state(hp_state);
>>   		xlnx_event_cleanup_sgi(pdev);
>>   		return ret;
>>   	}
>> @@ -704,6 +709,7 @@ static void xlnx_event_manager_remove(struct platform_device *pdev)
>>   	if (ret)
>>   		dev_err(&pdev->dev, "SGI unregistration over TF-A failed with %d\n", ret);
>>   
>> +	cpuhp_remove_state(hp_state);
>>   	xlnx_event_cleanup_sgi(pdev);
>>   
>>   	event_manager_availability = -EACCES;
> 
> It looks like this patch 2/2 doesn't have the kind of bugs in the
> cleanup path that affected patch 1/2, so that's good.
> 
> Regards,
> Srivatsa

