Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540407;
	b=1MB+xnP2rIJIXCUpXtWWZOPGriBgPQmQeTkpPc73Ikdu/1jiNevoWcdsogwz2Fn82yTc
	 Kv6xc3ti4oaYw0bj0DYYMxIo9RrOfMJxOFp5+eVoGuSnytStarKgUjrUTUCbs6hYA6MMa
	 R2dxrCca2R7Q9o9ygQhmLzfjw/3LtHKpyHTc/zLs/J3uCCc2d4HRLc3TO0Z9iovD9+O03
	 EVTUTLm4Vz204+htyvqV/KdxThgbrVUs+Q1+WkBbr8hFkyNkX4N2pU7Sgr/bA0/FOPBzS
	 kCpJKYspW+dlGnRK040T0+UvR/wdJore7KGdhnWL7N/YbDKsPWwOd5xmEukjnMmYm6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540407;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=+PbzB0xCkTWEycEy8rkSNwKqkAxrWhfHDIvHL929Xx8=;
	b=xMqMnNF3WDDc7Mfdui7xI2qeyMJ5XzjTImKS8yrScNwflCkyK7kcWjexpl3wUhwCHDXE
	 WzW4Bwe0gbUjBE0SUBdJ7/yohpZ+inr/FPJaeLpsXzN0msQjgZ6XkKpZmkhDiIjN0w8Un
	 QceJxIiHHiedhITrJCwc/ArfXNGlLSc5braUQMloVgwX9ft4bHC6qCC5jiOFYotHm61s1
	 OEqxdC+X+C6QigNTwd7fVZXKrM0E+FWbMPoOYdQCyfaqUqf/O0tDqT/r5NhOp6tTVnLUc
	 fi1Vc5RfWzh57FHslu9vqGEqC8L4cq7HkginD28+24wvzEJZ9OSYYRNXz6PYQPEJeDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=kqmy5gpm;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4FC606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B4FC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=kqmy5gpm
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D71F21C25;
	Tue, 24 Nov 2026 09:13:23 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA9603F763;
	Tue, 24 Nov 2026 09:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795540406; bh=mQvvQlu+WKj7+RLxU16Cz7BdMtaylQyW0xRrOxnSqAo=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=kqmy5gpmI6ohqVy2e0XAnM+InGNAlHisEecFf7n60v5NMGGJM2Zm3otoF0SjFt/v6
	 +nlBe05Je/8VcpKLAZ2ITJtIyWbGKdeR4PeWH9dasOV7eYISVV5mzB9+F960+fCvR1
	 hfnA3S+qv/Les4J2Y/aqUBUru7rw7xmTcOV9zdT4=
Message-ID: <0db7751a-5189-4cc1-8865-cd184dbc5a32@arm.com>
Date: Tue, 24 Nov 2026 17:13:24 +0000
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
Subject: Re: [PATCH RFC] arm_mpam: Save and restore the MSC state across
 system sleep
To: Jinjie Ruan <ruanjinjie@huawei.com>, james.morse@arm.com,
 reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261124082708.1705024-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261124082708.1705024-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jinjie,

Thanks for the patch and looking into this.

On 24/11/2026 08:27, Jinjie Ruan wrote:
> The MPAM driver reprograms an MSC's configuration when the first CPU
> that can access it comes online, and resets it, saving the bandwidth
> monitor state, when the last one goes offline.
> 
> The CPU that suspends the system stays online, so the MSCs it can
> access, such as the L3 and memory side MSCs, are never seen going
> offline by these cpuhp callbacks. An MSC can still lose its registers
> while the system sleeps, for example when its power domain is not
> retained across suspend-to-RAM. resctrl then reports the cached
> configuration while the hardware is back at its defaults, and the
> bandwidth monitor counters restart from zero, losing the traffic
> counted before the sleep.
> 
> Save the state from the driver's system sleep callback, which runs
> while the MSC is still accessible, and reprogram it from the matching
> resume callback. The cpuhp callbacks then leave the MSC alone: a second
> save when its last CPU goes offline would find the monitors already
> disabled by the first save, and lose the monitor configuration from
> the saved state.
> 
> Cc: James Morse <james.morse@arm.com>
> Cc: Ben Horgan <ben.horgan@arm.com>
> Cc: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/resctrl/mpam_devices.c  | 101 ++++++++++++++++++++++++--------
>  drivers/resctrl/mpam_internal.h |   1 +
>  2 files changed, 78 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index c067b6d57d71..49ace93280a7 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -23,6 +23,7 @@
>  #include <linux/mailbox_client.h>
>  #include <linux/mutex.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm.h>
>  #include <linux/printk.h>
>  #include <linux/property.h>
>  #include <linux/srcu.h>
> @@ -2223,6 +2224,37 @@ static void _enable_percpu_irq(void *_irq)
>  	enable_percpu_irq(*irq, IRQ_TYPE_NONE);
>  }
>  
> +static void mpam_msc_power_on(struct mpam_msc *msc)
> +{
> +	mutex_lock(&msc->error_irq_lock);
> +	if (msc->error_irq_hw_enabled)
> +		mpam_touch_msc(msc, mpam_enable_msc_ecr, msc);
> +	mutex_unlock(&msc->error_irq_lock);
> +
> +	mpam_reprogram_msc(msc);
> +}
> +
> +static void mpam_msc_power_off(struct mpam_msc *msc)
> +{
> +	struct mpam_msc_ris *ris;
> +
> +	mutex_lock(&msc->cfg_lock);
> +	list_for_each_entry_srcu(ris, &msc->ris, msc_list,
> +				 srcu_read_lock_held(&mpam_srcu)) {
> +		mpam_touch_msc(msc, &mpam_reset_ris, ris);
> +
> +		/*
> +		 * The reset state for non-zero partid may be
> +		 * lost while the CPUs are offline.
> +		 */
> +		ris->in_reset_state = false;
> +
> +		if (mpam_is_enabled())
> +			mpam_touch_msc(msc, &mpam_save_mbwu_state, ris);
> +	}
> +	mutex_unlock(&msc->cfg_lock);
> +}
> +
>  static int mpam_cpu_online(unsigned int cpu)
>  {
>  	struct mpam_msc *msc;
> @@ -2236,14 +2268,8 @@ static int mpam_cpu_online(unsigned int cpu)
>  		if (msc->reenable_error_ppi)
>  			_enable_percpu_irq(&msc->reenable_error_ppi);
>  
> -		if (atomic_fetch_inc(&msc->online_refs) == 0) {
> -			mutex_lock(&msc->error_irq_lock);
> -			if (msc->error_irq_hw_enabled)
> -				mpam_touch_msc(msc, mpam_enable_msc_ecr, msc);
> -			mutex_unlock(&msc->error_irq_lock);
> -
> -			mpam_reprogram_msc(msc);
> -		}
> +		if (atomic_fetch_inc(&msc->online_refs) == 0 && !msc->pm_suspended)
> +			mpam_msc_power_on(msc);
>  	}
>  
>  	if (mpam_resctrl_enabled)
> @@ -2304,30 +2330,56 @@ static int mpam_cpu_offline(unsigned int cpu)
>  		if (msc->reenable_error_ppi)
>  			disable_percpu_irq(msc->reenable_error_ppi);
>  
> -		if (atomic_dec_and_test(&msc->online_refs)) {
> -			struct mpam_msc_ris *ris;
> +		if (atomic_dec_and_test(&msc->online_refs) && !msc->pm_suspended)
> +			mpam_msc_power_off(msc);
> +	}
>  
> -			mutex_lock(&msc->cfg_lock);
> -			list_for_each_entry_srcu(ris, &msc->ris, msc_list,
> -						 srcu_read_lock_held(&mpam_srcu)) {
> -				mpam_touch_msc(msc, &mpam_reset_ris, ris);
> +	return 0;
> +}
>  
> -				/*
> -				 * The reset state for non-zero partid may be
> -				 * lost while the CPUs are offline.
> -				 */
> -				ris->in_reset_state = false;
> +static int mpam_msc_suspend(struct device *dev)
> +{
> +	struct mpam_msc *msc = dev_get_drvdata(dev);
>  
> -				if (mpam_is_enabled())
> -					mpam_touch_msc(msc, &mpam_save_mbwu_state, ris);
> -			}
> -			mutex_unlock(&msc->cfg_lock);
> -		}
> +	if (!msc)
> +		return 0;
> +
> +	guard(mutex)(&mpam_cpuhp_state_lock);
> +	if (!mpam_is_enabled())
> +		return 0;
> +
> +	guard(cpus_read_lock)();
> +	guard(srcu)(&mpam_srcu);
> +	if (atomic_read(&msc->online_refs)) {
> +		mpam_msc_power_off(msc);
> +		msc->pm_suspended = true;
>  	}
>  
>  	return 0;
>  }
>  
> +static int mpam_msc_resume(struct device *dev)
> +{
> +	struct mpam_msc *msc = dev_get_drvdata(dev);
> +
> +	if (!msc)
> +		return 0;
> +
> +	guard(mutex)(&mpam_cpuhp_state_lock);
> +	if (!mpam_is_enabled() || !msc->pm_suspended)
> +		return 0;
> +
> +	guard(cpus_read_lock)();
> +	guard(srcu)(&mpam_srcu);
> +	msc->pm_suspended = false;
> +	if (atomic_read(&msc->online_refs))
> +		mpam_msc_power_on(msc);
> +
> +	return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(mpam_msc_pm_ops, mpam_msc_suspend, mpam_msc_resume);

If I understand correctly this covers both system system and hibernate but the commit message just
mentions system suspend. Is that the case?

Thanks,

Ben

> +
>  static void mpam_register_cpuhp_callbacks(int (*online)(unsigned int online),
>  					  int (*offline)(unsigned int offline),
>  					  char *name)
> @@ -2578,6 +2630,7 @@ static struct platform_driver mpam_msc_driver = {
>  	.driver = {
>  		.name = "mpam_msc",
>  		.suppress_bind_attrs = true,
> +		.pm = pm_sleep_ptr(&mpam_msc_pm_ops),
>  	},
>  	.probe = mpam_msc_drv_probe,
>  	.remove = mpam_msc_drv_remove,
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 1f86cc158100..2e6da63c61c6 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -86,6 +86,7 @@ struct mpam_msc {
>  	struct mpam_msc * __percpu	*error_dev_id;
>  
>  	atomic_t		online_refs;
> +	bool			pm_suspended;
>  
>  	/*
>  	 * probe_lock is only taken during discovery. After discovery these

