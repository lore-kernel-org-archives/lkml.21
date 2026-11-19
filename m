Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079367;
	b=iB84tffRaYX30b0dB/ybx+tdhmfcd9kvbBuvbe7jba/3+V+G+Iup2UZY4JP2a6FDvyOX
	 LoR+S0gFRH3Fe0qBcs0cWAXwAPCjjSanJuHrsba9cbx78Ez9EVgTf6PeTLKd99gt/mc28
	 /OTg0OrtMIqk1gszUtyJbg8xPhPIKMz0rMZMLah3tzzZW2OiTnZTEDLzslY/xDSpMQjuF
	 WBQMG1/hilbrdSFguTC8613HWegEScJ0hVhVJy5EHW9vzdLWK6V/FG8kh+78tATMBJ3DH
	 ufSkLl1z+/1ES+a+Rlg5qV8vuFFj1koYoxzF9QwGpUE6PwHaq/WeI5qRCFry5wuEtPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079367;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=bmqScXkBzu1zxFz1d9mOGDhHfSZdO8b83Au6tolTP44=;
	b=fECVTsbY56DSwkPuRgPwQLTq258ldCisnoA3VzH3UPE52LFGgRWaxBLP/6fwb+RPdr5j
	 kt2KIfZyxFnH5fSpDHOVHrtBPdDMDcFfshj/VAjmUrwRvFgmEOgG1moxoDezlgcF2n2k9
	 2feAT/VvB9q/bBENNjdn5fY6pYitXYvo1wE62ezdAQjLWwx9kbo+p1wp5BI20k5yYwJNK
	 2L+ax0R/u174Np0PizwfSFp3t533yxm+3MQqCKIDTL39GqJBD8iKnEIIWNy+9gsmso4Y9
	 6W3O1f3q3bEJrQMQbdq81TkfjJAk/keVcqmZjXwP6IgybIEmlIBh3w7lPIyidOmss9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BSq5wGzk;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D47B606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D47B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BSq5wGzk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795079366; x=1826615366;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FMVvhMKvY0QJ1qqQIwazR4V5Ajyvoj3If/EBlLB/Bws=;
  b=BSq5wGzk1360cpoTOR+f+Ay6RHbOMnZHKnM568n/0HTEuT6cRwci8Bbh
   AfBHb6oFqoLtM9Yai/AujjfhgDqWqvxEVrCZ02bGY+x5mBWQvZ6iylYQ8
   efKQ8XNqRPF32sTpPh0j29DuoevwHMjg5RCCFFyOAxaiQENVPwsWcFBl1
   UAmA+6z+3nJOVK+R568+s3S2Cb5QlsOGFJP34opQkxqfTWvrwUTd0PQEU
   bL3TSTdUC6lDwBV5HaCY7JSSeV5JFgLUFm0b7gQp6Dj+h+KCqeuYdsiRR
   1Q6KHUWH9C0e34N//80wTOQLeVDtk5AbXCSGpLUk4ye5NZ4lvzu+oqbJ4
   Q==;
X-CSE-ConnectionGUID: qzW1Bp5ySO6Hx2kWV0wHKQ==
X-CSE-MsgGUID: 07qJndSPTZGEFuIpl8JKOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3765342"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3765342"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 01:09:26 -0800
X-CSE-ConnectionGUID: ruLrTCDGQ9S320Xh6XIMMQ==
X-CSE-MsgGUID: hAQY/JzRQJSFIU4ynCmYTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10296394"
Received: from soc-pf6038af.clients.intel.com (HELO [10.217.180.38]) ([10.217.180.38])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 01:09:24 -0800
Message-ID: <720ac744-2f0e-4b46-a28e-aa635079b45d@linux.intel.com>
Date: Thu, 19 Nov 2026 10:09:21 +0100
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
Subject: Re: [PATCH char-misc-next v3 1/4] issei: save power_down flag while
 processing event
To: Alexander Usyskin <alexander.usyskin@intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Menachem Adin <menachem.adin@intel.com>,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
References: <20261111-issei_pm_and_itf-v3-0-4f4f6d626ff3@intel.com>
 <20261111-issei_pm_and_itf-v3-1-4f4f6d626ff3@intel.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
In-Reply-To: <20261111-issei_pm_and_itf-v3-1-4f4f6d626ff3@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11-Nov-26 8:40, Alexander Usyskin wrote:
> Change in power_down flag may confuse event thread.
> Save flag status at the first available moment and
> work according to saved value.
> 
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>   drivers/misc/issei/main.c | 22 ++++++++++++----------
>   1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/misc/issei/main.c b/drivers/misc/issei/main.c
> index 5987fb340250..8aaf2d47392b 100644
> --- a/drivers/misc/issei/main.c
> +++ b/drivers/misc/issei/main.c
> @@ -24,7 +24,7 @@ static void issei_rst_state_set(struct issei_device *idev, enum issei_rst_state
>   		wake_up(&idev->wait_rst_state);
>   }
>   
> -static int issei_reset(struct issei_device *idev)
> +static int issei_reset(struct issei_device *idev, bool power_down)
>   {
>   	int ret;
>   
> @@ -34,14 +34,14 @@ static int issei_reset(struct issei_device *idev)
>   	issei_fw_cl_remove_all(idev);
>   	/* No need to check for overflow here, the counter is used only for info */
>   	idev->all_reset_count++;
> -	ret = idev->ops->hw_reset(idev, !idev->power_down);
> +	ret = idev->ops->hw_reset(idev, !power_down);
>   	issei_dmam_setup(idev);
>   	if (ret) {
>   		dev_err(&idev->dev, "hw_reset failed ret = %d\n", ret);
>   		return ret;
>   	}
>   
> -	if (idev->power_down) {
> +	if (power_down) {
>   		dev_dbg(&idev->dev, "powering down: end of reset\n");
>   		issei_rst_state_set(idev, ISSEI_RST_STATE_DISABLED);
>   		return -ENODEV;
> @@ -87,24 +87,26 @@ static int issei_process_thread(void *_dev)
>   {
>   	long timeout, old_timeout = MAX_SCHEDULE_TIMEOUT;
>   	struct issei_device *idev = _dev;
> +	bool power_down;
>   	int ret;
>   
>   	while (!kthread_should_stop()) {
>   		dev_dbg(&idev->dev, "process_work in %d\n", idev->rst_state);
> +		WRITE_ONCE(idev->has_data, false);
> +		power_down = idev->power_down; /* to save state */
>   		if (!idev->ops->hw_is_ready(idev) && idev->rst_state > ISSEI_RST_STATE_HW_READY) {
> -			if (!idev->power_down)
> +			if (!power_down)
>   				dev_dbg(&idev->dev, "HW not ready, resetting\n");
>   			idev->rst_state = ISSEI_RST_STATE_INIT;
>   		}
> -		if (idev->power_down)
> +		if (power_down)
>   			idev->rst_state = ISSEI_RST_STATE_INIT;
> -		WRITE_ONCE(idev->has_data, false);
>   		dev_dbg(&idev->dev, "reset_step in %d\n", idev->rst_state);
>   		timeout = MAX_SCHEDULE_TIMEOUT;
>   		ret = 0;
>   		switch (idev->rst_state) {
>   		case ISSEI_RST_STATE_DISABLED:
> -			if (idev->power_down) {
> +			if (power_down) {
>   				dev_dbg(&idev->dev, "Interrupt in power down?\n");
>   				break;
>   			}
> @@ -115,7 +117,7 @@ static int issei_process_thread(void *_dev)
>   			idev->ops->irq_clear(idev);
>   			idev->ops->irq_sync(idev);
>   
> -			if (!idev->power_down) {
> +			if (!power_down) {
>   				idev->reset_count++;
>   				if (idev->reset_count > ISSEI_MAX_CONSEC_RESET) {
>   					dev_err(&idev->dev, "reset: reached maximal consecutive resets: disabling the device\n");
> @@ -124,8 +126,8 @@ static int issei_process_thread(void *_dev)
>   				}
>   			}
>   
> -			ret = issei_reset(idev);
> -			if (idev->power_down) {
> +			ret = issei_reset(idev, power_down);
> +			if (power_down) {
>   				dev_dbg(&idev->dev, "Powering down\n");
>   				return 0;
>   			}
> 

Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>

