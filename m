Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079465;
	b=hCyAjcEhSQjU5tjVfgIn7x3M7I3WrZ4T4YEP92CDuFDidt223cNZXXonKibCFUootesS
	 crx8EUFITv/I/XDSCOrRLuHzzqeEyASniFFPt8AWTtcZlzAxZZszweC/pqqooj5wd+kll
	 Sx1W5+Xdgb2pFO8DHPWZepnv2novOpKrm+dLkG8Jb35laKMDuekQnoQSgqcp+8VgZAjvk
	 +cgneFpG7SqVkfUij8ZghQXciUb6mAPMaE1hFX4uFu+N2sRRmlFttxB9KNDHjGieELusG
	 iWITtqZW8vckVKU70CKpCgbapl+GT4R+lsRsAlYhm59mA8cMieJ3EHYh1vYFQ8y9fDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079465;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=1wXo2Ean+v5dogF7isB/jAmkYOSH7J0/kaScTlMe+a0=;
	b=IZxtLzNpp/Qog57fUlZfzXtXcfrRAe5+CfaQx3ymO7utlNvxn3EgLJ8rwdmtOpxeya9B
	 o0dsniPjI8H2kRZKzW5NjpolLbY/qtJe6K7t5Zxy1AFv1IBgl16YJu2dKlEzMc13k6Zjp
	 dOzaoWK37+jSJ7BfKkYBIwYSpPRb4vpIunSExPfTo7QOeSaEvz2lCQkdHe5TKYykLGtv9
	 BzlC/H+AK/w9zsJ6Cadd2Pe2c66cAwy+fj2U7ws3lBFiuCfvRoJdbCV0f9+Xxiy3K+JS2
	 GKXyJDz+jJcpHG1ixJE8nWHvhvAK0FYEhNAIyy7dyeIWwaX9DsL6BLJKxIXB8QMM2eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gy4sR7wl;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428FF606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 428FF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gy4sR7wl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795079465; x=1826615465;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TwKL2cVNA2wSvRerlK0lGg5uidpfC+YBvaHdeAlrRPI=;
  b=gy4sR7wlXQyEA3wERO1JJw8DTKBP1zAyp4fKdFywH8d1BA3E5OGc8JJ2
   2nho+KlssE7xXlvWQbKIsCALXB3d9E6xPXvsOOJGid8GwpDpjpTBnUnPv
   Wp/lF+poou5rwxFWWTXA9RB5MjJ4IfCEaDoTY4vgAJxPHfzVRk933OTrX
   5DzxHuYTSoRY+H4XWLs3WiyYuJs/FwSgUozUyWoCXc4icb25Lz9RAJDt2
   9AtwGLWeoFi9QnEGoTR8b/xh+9rk8rsoFxK4UOSQmP2NMvaKi+q3Mwv+8
   nMNAIF152PWTD7H2xY6rW6i0GJP9RItyJSjS+w9Eab/mVyWrxmrxa52oG
   A==;
X-CSE-ConnectionGUID: OAIPA2vwTE6x2w0YrCDlvA==
X-CSE-MsgGUID: CQQ6r+noQJeNhSZevpPMSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3947352"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3947352"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 01:11:04 -0800
X-CSE-ConnectionGUID: BkI9faX1Rp+qjKgVuTP/+g==
X-CSE-MsgGUID: w9+D2hcERxewNvFhowJDFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10522805"
Received: from soc-pf6038af.clients.intel.com (HELO [10.217.180.38]) ([10.217.180.38])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 01:11:03 -0800
Message-ID: <d84c4173-c6b4-43c5-8a47-a5d9cb36ef06@linux.intel.com>
Date: Thu, 19 Nov 2026 10:11:01 +0100
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
Subject: Re: [PATCH char-misc-next v3 2/4] issei: add runtime pm
To: Alexander Usyskin <alexander.usyskin@intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Menachem Adin <menachem.adin@intel.com>,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
References: <20261111-issei_pm_and_itf-v3-0-4f4f6d626ff3@intel.com>
 <20261111-issei_pm_and_itf-v3-2-4f4f6d626ff3@intel.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
In-Reply-To: <20261111-issei_pm_and_itf-v3-2-4f4f6d626ff3@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11-Nov-26 8:40, Alexander Usyskin wrote:
> Add support for runtime power management.
> ISSE communication is based on send-receive transaction.
> Allow autosuspend with 60 seconds grace as firmware required
> to answer inside this timeframe.
> 
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>   drivers/misc/issei/host_client.c |   4 +
>   drivers/misc/issei/hw_heci.c     |  21 +++-
>   drivers/misc/issei/main.c        | 229 +++++++++++++++++++++------------------
>   drivers/misc/issei/pci_heci.c    |  21 ++++
>   4 files changed, 168 insertions(+), 107 deletions(-)
> 
> diff --git a/drivers/misc/issei/host_client.c b/drivers/misc/issei/host_client.c
> index 8f36d1c319ec..d16b5835c619 100644
> --- a/drivers/misc/issei/host_client.c
> +++ b/drivers/misc/issei/host_client.c
> @@ -7,6 +7,7 @@
>   #include <linux/kobject.h>
>   #include <linux/list.h>
>   #include <linux/overflow.h>
> +#include <linux/pm_runtime.h>
>   #include <linux/slab.h>
>   #include <linux/types.h>
>   #include <linux/wait.h>
> @@ -73,6 +74,7 @@ static void __issei_cl_clean_all_wbuf(struct issei_device *idev, struct issei_ho
>   		}
>   	}
>   	cl->write_in_progress = false;
> +	pm_runtime_put_autosuspend(idev->parent);
>   	/* synchronized under host client mutex */
>   	if (waitqueue_active(&cl->write_wait))
>   		wake_up_interruptible(&cl->write_wait);
> @@ -309,6 +311,7 @@ ssize_t issei_cl_write(struct issei_host_client *cl, const u8 *buf, size_t buf_s
>   	list_add_tail(&wbuf->list, &idev->write_queue);
>   	cl->write_in_progress = true;
>   	cl_dbg(idev, cl, "Write queued %zu bytes\n", buf_size);
> +	pm_runtime_get(idev->parent);
>   
>   	issei_poke_process_thread(idev);
>   
> @@ -353,6 +356,7 @@ int issei_cl_write_from_queue(struct issei_device *idev)
>   	if (ret >= 0)
>   		idev->ops->irq_write_generate(idev);
>   	cl->write_in_progress = false;
> +	pm_runtime_put_autosuspend(idev->parent);
>   	/* synchronized under host client mutex */
>   	if (waitqueue_active(&cl->write_wait))
>   		wake_up_interruptible(&cl->write_wait);
> diff --git a/drivers/misc/issei/hw_heci.c b/drivers/misc/issei/hw_heci.c
> index 501774aa95ff..1e39b285d4db 100644
> --- a/drivers/misc/issei/hw_heci.c
> +++ b/drivers/misc/issei/hw_heci.c
> @@ -8,6 +8,7 @@
>   #include <linux/err.h>
>   #include <linux/io.h>
>   #include <linux/pci.h>
> +#include <linux/pm_runtime.h>
>   #include <linux/sizes.h>
>   #include <linux/spinlock.h>
>   #include <linux/types.h>
> @@ -501,12 +502,20 @@ irqreturn_t issei_heci_irq_quick_handler(int irq, void *dev_id)
>   {
>   	struct issei_device *idev = dev_id;
>   	struct issei_heci_hw *hw = to_heci_hw(idev);
> +	irqreturn_t ret;
> +	int active;
>   	u32 reg;
>   
> -	reg = heci_hcsr_read(idev);
> -	if (!heci_irq_src(reg))
> +	active = pm_runtime_get_if_active(idev->parent);
> +	if (!active)
>   		return IRQ_NONE;
>   
> +	reg = heci_hcsr_read(idev);
> +	if (!heci_irq_src(reg)) {
> +		ret = IRQ_NONE;
> +		goto out;
> +	}
> +
>   	scoped_guard(spinlock_irqsave, &hw->access_lock) {
>   		reg = heci_hcsr_read(idev);
>   		heci_irq_clear(idev, reg);
> @@ -519,7 +528,13 @@ irqreturn_t issei_heci_irq_quick_handler(int irq, void *dev_id)
>   
>   	issei_poke_process_thread(idev);
>   
> -	return IRQ_HANDLED;
> +	ret = IRQ_HANDLED;
> +
> +out:
> +	if (active > 0)
> +		pm_runtime_put_autosuspend(idev->parent);
> +
> +	return ret;
>   }
>   
>   static const struct hw_heci_cfg hw_heci_pch_cfg = {
> diff --git a/drivers/misc/issei/main.c b/drivers/misc/issei/main.c
> index 8aaf2d47392b..c0b8606b17b3 100644
> --- a/drivers/misc/issei/main.c
> +++ b/drivers/misc/issei/main.c
> @@ -7,6 +7,7 @@
>   #include <linux/export.h>
>   #include <linux/jiffies.h>
>   #include <linux/kthread.h>
> +#include <linux/pm_runtime.h>
>   #include <linux/slab.h>
>   #include <linux/wait.h>
>   
> @@ -83,132 +84,152 @@ static int issei_process_write_msg(struct issei_device *idev)
>   	return issei_cl_write_from_queue(idev);
>   }
>   
> -static int issei_process_thread(void *_dev)
> +static bool issei_process_thread_worker(struct issei_device *idev, bool power_down,
> +					long *timeout, long *old_timeout)
>   {
> -	long timeout, old_timeout = MAX_SCHEDULE_TIMEOUT;
> -	struct issei_device *idev = _dev;
> -	bool power_down;
>   	int ret;
>   
> -	while (!kthread_should_stop()) {
> -		dev_dbg(&idev->dev, "process_work in %d\n", idev->rst_state);
> -		WRITE_ONCE(idev->has_data, false);
> -		power_down = idev->power_down; /* to save state */
> -		if (!idev->ops->hw_is_ready(idev) && idev->rst_state > ISSEI_RST_STATE_HW_READY) {
> -			if (!power_down)
> -				dev_dbg(&idev->dev, "HW not ready, resetting\n");
> -			idev->rst_state = ISSEI_RST_STATE_INIT;
> +	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(idev->parent, pm);
> +	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
> +	if (ret) {
> +		dev_err(&idev->dev, "Failed to acquire pm %d\n", ret);
> +		idev->rst_state = ISSEI_RST_STATE_INIT;
> +		return false;
> +	}
> +
> +	if (!idev->ops->hw_is_ready(idev) && idev->rst_state > ISSEI_RST_STATE_HW_READY) {
> +		if (!power_down)
> +			dev_dbg(&idev->dev, "HW not ready, resetting\n");
> +		idev->rst_state = ISSEI_RST_STATE_INIT;
> +	}
> +	if (power_down)
> +		idev->rst_state = ISSEI_RST_STATE_INIT;
> +	dev_dbg(&idev->dev, "reset_step in %d\n", idev->rst_state);
> +	*timeout = MAX_SCHEDULE_TIMEOUT;
> +	ret = 0;
> +	switch (idev->rst_state) {
> +	case ISSEI_RST_STATE_DISABLED:
> +		if (power_down) {
> +			dev_dbg(&idev->dev, "Interrupt in power down?\n");
> +			break;
>   		}
> -		if (power_down)
> -			idev->rst_state = ISSEI_RST_STATE_INIT;
> -		dev_dbg(&idev->dev, "reset_step in %d\n", idev->rst_state);
> -		timeout = MAX_SCHEDULE_TIMEOUT;
> -		ret = 0;
> -		switch (idev->rst_state) {
> -		case ISSEI_RST_STATE_DISABLED:
> -			if (power_down) {
> -				dev_dbg(&idev->dev, "Interrupt in power down?\n");
> +		idev->rst_state = ISSEI_RST_STATE_INIT;
> +		idev->reset_count = 0;
> +		fallthrough;
> +
> +	case ISSEI_RST_STATE_INIT:
> +		idev->ops->irq_clear(idev);
> +		idev->ops->irq_sync(idev);
> +
> +		if (!power_down) {
> +			if (!idev->reset_count)
> +				pm_runtime_get_noresume(idev->parent);
> +			idev->reset_count++;
> +			if (idev->reset_count > ISSEI_MAX_CONSEC_RESET) {
> +				dev_err(&idev->dev, "reset: reached maximal consecutive resets: disabling the device\n");
> +				issei_rst_state_set(idev, ISSEI_RST_STATE_DISABLED);
> +				pm_runtime_put_noidle(idev->parent);
>   				break;
>   			}
> -			idev->rst_state = ISSEI_RST_STATE_INIT;
> -			fallthrough;
> -
> -		case ISSEI_RST_STATE_INIT:
> -			idev->ops->irq_clear(idev);
> -			idev->ops->irq_sync(idev);
> -
> -			if (!power_down) {
> -				idev->reset_count++;
> -				if (idev->reset_count > ISSEI_MAX_CONSEC_RESET) {
> -					dev_err(&idev->dev, "reset: reached maximal consecutive resets: disabling the device\n");
> -					issei_rst_state_set(idev, ISSEI_RST_STATE_DISABLED);
> -					break;
> -				}
> -			}
> -
> -			ret = issei_reset(idev, power_down);
> -			if (power_down) {
> -				dev_dbg(&idev->dev, "Powering down\n");
> -				return 0;
> -			}
> -			if (ret)
> -				break;
> +		}
>   
> -			idev->rst_state = ISSEI_RST_STATE_HW_READY;
> -			timeout = msecs_to_jiffies(ISSEI_RST_HW_READY_TIMEOUT_MSEC);
> +		ret = issei_reset(idev, power_down);
> +		if (power_down) {
> +			dev_dbg(&idev->dev, "Powering down\n");
> +			return true;
> +		}
> +		if (ret)
>   			break;
>   
> -		case ISSEI_RST_STATE_HW_READY:
> -			if (!idev->ops->hw_is_ready(idev)) {
> -				dev_dbg(&idev->dev, "HW is not ready?\n");
> -				timeout = old_timeout;
> -				break;
> -			}
> -
> -			dev_dbg(&idev->dev, "HW is ready\n");
> -			idev->ops->hw_reset_release(idev);
> -			idev->ops->host_set_ready(idev);
> -			ret = idev->ops->setup_message_send(idev);
> -			if (ret)
> -				break;
> +		idev->rst_state = ISSEI_RST_STATE_HW_READY;
> +		*timeout = msecs_to_jiffies(ISSEI_RST_HW_READY_TIMEOUT_MSEC);
> +		break;
>   
> -			idev->rst_state = ISSEI_RST_STATE_SETUP;
> -			timeout = msecs_to_jiffies(ISSEI_RST_STEP_TIMEOUT_MSEC);
> +	case ISSEI_RST_STATE_HW_READY:
> +		if (!idev->ops->hw_is_ready(idev)) {
> +			dev_dbg(&idev->dev, "HW is not ready?\n");
> +			*timeout = *old_timeout;
>   			break;
> +		}
>   
> -		case ISSEI_RST_STATE_SETUP:
> -			ret = idev->ops->setup_message_recv(idev);
> -			if (ret) {
> -				if (ret == -ENODATA) {
> -					ret = 0;
> -					timeout = old_timeout;
> -				}
> -			} else {
> -				timeout = msecs_to_jiffies(ISSEI_RST_STEP_TIMEOUT_MSEC);
> -				ret = issei_ham_send_start_req(idev);
> -				idev->rst_state = ISSEI_RST_STATE_START;
> -			}
> +		dev_dbg(&idev->dev, "HW is ready\n");
> +		idev->ops->hw_reset_release(idev);
> +		idev->ops->host_set_ready(idev);
> +		ret = idev->ops->setup_message_send(idev);
> +		if (ret)
>   			break;
>   
> -		case ISSEI_RST_STATE_START:
> -			ret = issei_process_read_msg(idev);
> -			if (!ret) {
> -				timeout = msecs_to_jiffies(ISSEI_RST_STEP_TIMEOUT_MSEC);
> -				idev->rst_state = ISSEI_RST_STATE_CLIENT_ENUM;
> -			} else if (ret == -ENODATA) {
> +		idev->rst_state = ISSEI_RST_STATE_SETUP;
> +		*timeout = msecs_to_jiffies(ISSEI_RST_STEP_TIMEOUT_MSEC);
> +		break;
> +
> +	case ISSEI_RST_STATE_SETUP:
> +		ret = idev->ops->setup_message_recv(idev);
> +		if (ret) {
> +			if (ret == -ENODATA) {
>   				ret = 0;
> -				timeout = old_timeout;
> +				*timeout = *old_timeout;
>   			}
> -			break;
> +		} else {
> +			*timeout = msecs_to_jiffies(ISSEI_RST_STEP_TIMEOUT_MSEC);
> +			ret = issei_ham_send_start_req(idev);
> +			idev->rst_state = ISSEI_RST_STATE_START;
> +		}
> +		break;
> +
> +	case ISSEI_RST_STATE_START:
> +		ret = issei_process_read_msg(idev);
> +		if (!ret) {
> +			*timeout = msecs_to_jiffies(ISSEI_RST_STEP_TIMEOUT_MSEC);
> +			idev->rst_state = ISSEI_RST_STATE_CLIENT_ENUM;
> +		} else if (ret == -ENODATA) {
> +			ret = 0;
> +			*timeout = *old_timeout;
> +		}
> +		break;
>   
> -		case ISSEI_RST_STATE_CLIENT_ENUM:
> -			ret = issei_process_read_msg(idev);
> -			if (ret) {
> -				if (ret == -ENODATA) {
> -					ret = 0;
> -					timeout = old_timeout;
> -				}
> -			} else {
> -				idev->reset_count = 0;
> -				idev->rst_state = ISSEI_RST_STATE_DONE;
> -				dev_dbg(&idev->dev, "Reset finished successfully\n");
> +	case ISSEI_RST_STATE_CLIENT_ENUM:
> +		ret = issei_process_read_msg(idev);
> +		if (ret) {
> +			if (ret == -ENODATA) {
> +				ret = 0;
> +				*timeout = *old_timeout;
>   			}
> +		} else {
> +			idev->reset_count = 0;
> +			issei_rst_state_set(idev, ISSEI_RST_STATE_DONE);
> +			pm_runtime_put_autosuspend(idev->parent);
> +			dev_dbg(&idev->dev, "Reset finished successfully\n");
> +		}
> +		break;
> +
> +	case ISSEI_RST_STATE_DONE:
> +		ret = issei_process_read_msg(idev);
> +		if (ret != 0 && ret != -ENODATA)
>   			break;
>   
> -		case ISSEI_RST_STATE_DONE:
> -			ret = issei_process_read_msg(idev);
> -			if (ret != 0 && ret != -ENODATA)
> -				break;
> +		ret = issei_process_write_msg(idev);
> +		break;
> +	}
>   
> -			ret = issei_process_write_msg(idev);
> -			break;
> -		}
> +	if (ret) {
> +		dev_warn(&idev->dev, "Process failed ret = %d\n", ret);
> +		idev->rst_state = ISSEI_RST_STATE_INIT;
> +	}
> +	return false;
> +}
>   
> -		if (ret) {
> -			dev_warn(&idev->dev, "Process failed ret = %d\n", ret);
> -			idev->rst_state = ISSEI_RST_STATE_INIT;
> -			continue;
> -		}
> +static int issei_process_thread(void *_dev)
> +{
> +	long timeout, old_timeout = MAX_SCHEDULE_TIMEOUT;
> +	struct issei_device *idev = _dev;
> +
> +	while (!kthread_should_stop()) {
> +		dev_dbg(&idev->dev, "process_work in %d\n", idev->rst_state);
> +		WRITE_ONCE(idev->has_data, false);
> +
> +		if (issei_process_thread_worker(idev, idev->power_down, &timeout, &old_timeout))
> +			return 0;
>   
>   		/*
>   		 * Every thread that has data to process sets the 'has_data' flag and
> diff --git a/drivers/misc/issei/pci_heci.c b/drivers/misc/issei/pci_heci.c
> index 86c567a4bf0f..c58b51b3aad3 100644
> --- a/drivers/misc/issei/pci_heci.c
> +++ b/drivers/misc/issei/pci_heci.c
> @@ -8,11 +8,15 @@
>   #include <linux/module.h>
>   #include <linux/pci.h>
>   #include <linux/pm.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/time.h>
>   
>   #include "cdev.h"
>   #include "hw_heci.h"
>   #include "hw_heci_regs.h"
>   
> +#define HW_HECI_RPM_TIMEOUT_MSEC (60 * MSEC_PER_SEC)
> +
>   static int issei_heci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -70,6 +74,18 @@ static int issei_heci_probe(struct pci_dev *pdev, const struct pci_device_id *en
>   		goto free_irq;
>   	}
>   
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_set_autosuspend_delay(dev, HW_HECI_RPM_TIMEOUT_MSEC);
> +
> +	/*
> +	 * ISSEI requires to resume from runtime suspend mode
> +	 * in order to perform link reset flow upon system suspend.
> +	 */
> +	dev_pm_set_driver_flags(dev, DPM_FLAG_NO_DIRECT_COMPLETE);
> +
> +	pm_runtime_put_noidle(dev);
> +	pm_runtime_allow(dev);
> +
>   	return 0;
>   
>   free_irq:
> @@ -86,6 +102,11 @@ static void issei_heci_shutdown(struct pci_dev *pdev)
>   {
>   	struct issei_device *idev = pci_get_drvdata(pdev);
>   	struct issei_heci_hw *hw = to_heci_hw(idev);
> +	struct device *dev = &pdev->dev;
> +
> +	pm_runtime_dont_use_autosuspend(dev);
> +	pm_runtime_forbid(dev);
> +	pm_runtime_get_noresume(dev);
>   
>   	issei_stop(idev);
>   
> 

Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
