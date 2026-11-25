Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795571957;
	b=GVdOZ/3HavnXAGb0qEZK9i3jJbINN03uPIBn3UusfbapFXurcOJGizO/GNYGk+VHf7+u
	 LfRgTqCCz6ilvObhRCfHVtqnNIU5qc6b7S12FLYhhA/EXH9Srvd4C8Up9FcrgTdb495yj
	 kEJmD/iRp7wG33rtLkFIbqBEzFB4Ph1XRDrYjww1yRC6xkGul91pEyDpY0+sgD+ajsNnI
	 FY4Og+6y0nn/DWpq/Uu0zJDL2MGZJq/yU0lyKwCzc+M8M+fEz5E3hO3P0zfgc0mbcjA7w
	 GvvxYpwuXPrqDa5eXGx/7xZg1hwnklshifVWk+w/lNCkqeMpoqs7fWrMuZVRkSN/geA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571957;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=6Bfo9PnNxUsOjrsw9jDKSy9Mkz4S+Lw8GjDBNMcmTAk=;
	b=GwPPjDyZ5vfG6gG5YatZZO2yqCHE+AwKDI6L65jTihLhdNxK17aXfLYufvu3ElDM0JCo
	 fYwqibGV0L1h/y7eqd+jrayTtIMq1ICJ4ADe1TxbpoUIJ0XCjtQfTTVRg/4fPXtn/blPo
	 lkAMcyUIaJf+8dkFeoHMXovh5i1PJ+dw9w9LyI42p0cux3H56FD3Es0FkvXdF+5M9Qeee
	 tB/cA/RglSn8Xpx/cQ63Jli3JlzYCOgeMTNyjPfF9ggWg3kVTBI4IvavKdl/AromatVhw
	 V7rA5TjYCHjAQ5XZDnyf9n+UC1Z3wQD82z76wCu3bIrwQ+VhXUpbOD0KVU542lEZ5wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=1RmML0td;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E419606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E419606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=1RmML0td
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=6Bfo9PnNxUsOjrsw9jDKSy9Mkz4S+Lw8GjDBNMcmTAk=;
	b=1RmML0td8ZCUoR8xQMJsMlAyfJuj55t4j+/eG+QnQ1585GnLecRgnyJARrnvFRxAK7e6/olPM
	t8E30gy33p15cFWpFwfxmmjo8jyGwB/dEyNsJtLnLFRROOHmM6xGjYjo/Z+qtKeR5oTyobkAkAh
	6wYCTeuT82Xc0R+Am5ctYE8=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jZ2sP3RD8z1ps8j;
	Wed, 25 Nov 2026 09:58:49 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 556124057F;
	Wed, 25 Nov 2026 09:59:06 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 25 Nov
 2026 09:59:05 +0800
Message-ID: <4d4734a9-5d0b-412e-aec8-ea4813619b98@huawei.com>
Date: Wed, 25 Nov 2026 09:59:04 +0800
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
To: Ben Horgan <ben.horgan@arm.com>, <james.morse@arm.com>,
	<reinette.chatre@intel.com>, <fenghuay@nvidia.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261124082708.1705024-1-ruanjinjie@huawei.com>
 <0db7751a-5189-4cc1-8865-cd184dbc5a32@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <0db7751a-5189-4cc1-8865-cd184dbc5a32@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/25 1:13, Ben Horgan 写道:
> Hi Jinjie,

Hi Ben,

> 
> Thanks for the patch and looking into this.
> 
> On 24/11/2026 08:27, Jinjie Ruan wrote:
>> The MPAM driver reprograms an MSC's configuration when the first CPU
>> that can access it comes online, and resets it, saving the bandwidth
>> monitor state, when the last one goes offline.
>>
>> The CPU that suspends the system stays online, so the MSCs it can
>> access, such as the L3 and memory side MSCs, are never seen going
>> offline by these cpuhp callbacks. An MSC can still lose its registers
>> while the system sleeps, for example when its power domain is not
>> retained across suspend-to-RAM. resctrl then reports the cached
>> configuration while the hardware is back at its defaults, and the
>> bandwidth monitor counters restart from zero, losing the traffic
>> counted before the sleep.
>>
>> Save the state from the driver's system sleep callback, which runs
>> while the MSC is still accessible, and reprogram it from the matching
>> resume callback. The cpuhp callbacks then leave the MSC alone: a second
>> save when its last CPU goes offline would find the monitors already
>> disabled by the first save, and lose the monitor configuration from
>> the saved state.
>>
>> Cc: James Morse <james.morse@arm.com>
>> Cc: Ben Horgan <ben.horgan@arm.com>
>> Cc: Reinette Chatre <reinette.chatre@intel.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  drivers/resctrl/mpam_devices.c  | 101 ++++++++++++++++++++++++--------
>>  drivers/resctrl/mpam_internal.h |   1 +
>>  2 files changed, 78 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index c067b6d57d71..49ace93280a7 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -23,6 +23,7 @@
>>  #include <linux/mailbox_client.h>
>>  #include <linux/mutex.h>
>>  #include <linux/platform_device.h>
>> +#include <linux/pm.h>
>>  #include <linux/printk.h>
>>  #include <linux/property.h>
>>  #include <linux/srcu.h>
>> @@ -2223,6 +2224,37 @@ static void _enable_percpu_irq(void *_irq)
>>  	enable_percpu_irq(*irq, IRQ_TYPE_NONE);
>>  }
>>  
>> +static void mpam_msc_power_on(struct mpam_msc *msc)
>> +{
>> +	mutex_lock(&msc->error_irq_lock);
>> +	if (msc->error_irq_hw_enabled)
>> +		mpam_touch_msc(msc, mpam_enable_msc_ecr, msc);
>> +	mutex_unlock(&msc->error_irq_lock);
>> +
>> +	mpam_reprogram_msc(msc);
>> +}
>> +
>> +static void mpam_msc_power_off(struct mpam_msc *msc)
>> +{
>> +	struct mpam_msc_ris *ris;
>> +
>> +	mutex_lock(&msc->cfg_lock);
>> +	list_for_each_entry_srcu(ris, &msc->ris, msc_list,
>> +				 srcu_read_lock_held(&mpam_srcu)) {
>> +		mpam_touch_msc(msc, &mpam_reset_ris, ris);
>> +
>> +		/*
>> +		 * The reset state for non-zero partid may be
>> +		 * lost while the CPUs are offline.
>> +		 */
>> +		ris->in_reset_state = false;
>> +
>> +		if (mpam_is_enabled())
>> +			mpam_touch_msc(msc, &mpam_save_mbwu_state, ris);
>> +	}
>> +	mutex_unlock(&msc->cfg_lock);
>> +}
>> +
>>  static int mpam_cpu_online(unsigned int cpu)
>>  {
>>  	struct mpam_msc *msc;
>> @@ -2236,14 +2268,8 @@ static int mpam_cpu_online(unsigned int cpu)
>>  		if (msc->reenable_error_ppi)
>>  			_enable_percpu_irq(&msc->reenable_error_ppi);
>>  
>> -		if (atomic_fetch_inc(&msc->online_refs) == 0) {
>> -			mutex_lock(&msc->error_irq_lock);
>> -			if (msc->error_irq_hw_enabled)
>> -				mpam_touch_msc(msc, mpam_enable_msc_ecr, msc);
>> -			mutex_unlock(&msc->error_irq_lock);
>> -
>> -			mpam_reprogram_msc(msc);
>> -		}
>> +		if (atomic_fetch_inc(&msc->online_refs) == 0 && !msc->pm_suspended)
>> +			mpam_msc_power_on(msc);
>>  	}
>>  
>>  	if (mpam_resctrl_enabled)
>> @@ -2304,30 +2330,56 @@ static int mpam_cpu_offline(unsigned int cpu)
>>  		if (msc->reenable_error_ppi)
>>  			disable_percpu_irq(msc->reenable_error_ppi);
>>  
>> -		if (atomic_dec_and_test(&msc->online_refs)) {
>> -			struct mpam_msc_ris *ris;
>> +		if (atomic_dec_and_test(&msc->online_refs) && !msc->pm_suspended)
>> +			mpam_msc_power_off(msc);
>> +	}
>>  
>> -			mutex_lock(&msc->cfg_lock);
>> -			list_for_each_entry_srcu(ris, &msc->ris, msc_list,
>> -						 srcu_read_lock_held(&mpam_srcu)) {
>> -				mpam_touch_msc(msc, &mpam_reset_ris, ris);
>> +	return 0;
>> +}
>>  
>> -				/*
>> -				 * The reset state for non-zero partid may be
>> -				 * lost while the CPUs are offline.
>> -				 */
>> -				ris->in_reset_state = false;
>> +static int mpam_msc_suspend(struct device *dev)
>> +{
>> +	struct mpam_msc *msc = dev_get_drvdata(dev);
>>  
>> -				if (mpam_is_enabled())
>> -					mpam_touch_msc(msc, &mpam_save_mbwu_state, ris);
>> -			}
>> -			mutex_unlock(&msc->cfg_lock);
>> -		}
>> +	if (!msc)
>> +		return 0;
>> +
>> +	guard(mutex)(&mpam_cpuhp_state_lock);
>> +	if (!mpam_is_enabled())
>> +		return 0;
>> +
>> +	guard(cpus_read_lock)();
>> +	guard(srcu)(&mpam_srcu);
>> +	if (atomic_read(&msc->online_refs)) {
>> +		mpam_msc_power_off(msc);
>> +		msc->pm_suspended = true;
>>  	}
>>  
>>  	return 0;
>>  }
>>  
>> +static int mpam_msc_resume(struct device *dev)
>> +{
>> +	struct mpam_msc *msc = dev_get_drvdata(dev);
>> +
>> +	if (!msc)
>> +		return 0;
>> +
>> +	guard(mutex)(&mpam_cpuhp_state_lock);
>> +	if (!mpam_is_enabled() || !msc->pm_suspended)
>> +		return 0;
>> +
>> +	guard(cpus_read_lock)();
>> +	guard(srcu)(&mpam_srcu);
>> +	msc->pm_suspended = false;
>> +	if (atomic_read(&msc->online_refs))
>> +		mpam_msc_power_on(msc);
>> +
>> +	return 0;
>> +}
>> +
>> +static DEFINE_SIMPLE_DEV_PM_OPS(mpam_msc_pm_ops, mpam_msc_suspend, mpam_msc_resume);
> 
> If I understand correctly this covers both system system and hibernate but the commit message just
> mentions system suspend. Is that the case?

Yes, this patch cover both suspend and hibernate, this should be updated
in the commit message.

Additionally, it seems we can first add a patch to extract the
mpam_msc_power_on/off() helpers? This would make things look clearer.

Best regards,
Jinjie

> 
> Thanks,
> 
> Ben
> 
>> +
>>  static void mpam_register_cpuhp_callbacks(int (*online)(unsigned int online),
>>  					  int (*offline)(unsigned int offline),
>>  					  char *name)
>> @@ -2578,6 +2630,7 @@ static struct platform_driver mpam_msc_driver = {
>>  	.driver = {
>>  		.name = "mpam_msc",
>>  		.suppress_bind_attrs = true,
>> +		.pm = pm_sleep_ptr(&mpam_msc_pm_ops),
>>  	},
>>  	.probe = mpam_msc_drv_probe,
>>  	.remove = mpam_msc_drv_remove,
>> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
>> index 1f86cc158100..2e6da63c61c6 100644
>> --- a/drivers/resctrl/mpam_internal.h
>> +++ b/drivers/resctrl/mpam_internal.h
>> @@ -86,6 +86,7 @@ struct mpam_msc {
>>  	struct mpam_msc * __percpu	*error_dev_id;
>>  
>>  	atomic_t		online_refs;
>> +	bool			pm_suspended;
>>  
>>  	/*
>>  	 * probe_lock is only taken during discovery. After discovery these
> 

