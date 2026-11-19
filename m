Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079418;
	b=NeZoTf23DDHrSvcQWCzkoY61wtqIn91hPAby4BwEQVLOqMjfqEz1y30K3lsDZVh3NPnL
	 YeRcHd48lWX1dZ26hTjE4guFXXMgkLOGr2aSIqqvPmMecFNhfBEy30UsMGO/GEKokm4j1
	 NJkoOBXgXHR9srvvhEucc/s45/QsBWFA8NTOTZoJR0d8F9XliVxMrGbYv0/zPsUi1kzor
	 NhgSTqsEAiemDST2Pf7BTzF7klADL0k9qseXlzZ4iCRX2eF8IJ3pY4LW6F0Bf9pghjRN2
	 mdxF8inh7gVxOTKftH+yByafszgZsRo+pknTUse9BBXal54CJsEKh4E54osZETnFaYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079418;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=8D8McCZAEafy3zAie693lsJ2O/RvKFYomeqzha6/PZs=;
	b=Yzz38RT1X0Je2ZR//DHNoEzoos5KA6h2rdGQ2BogY3jsLYfOfBFvDXoGMikbs/tEGZ4T
	 ywHJ/MHQ5NOpDi3SsOdwZJsqfdO60E5idChu8HZSe9TJaFO8YU/FUV9hBAytjLCXtwB7d
	 h8FRnI5J1yB4pYZF6MMzAOE+OvuKcEdn1Ou5jvPayMluLCdQ9V7AHFKYGKqOnVRbyBqiY
	 XNo1iUPll5vYtqAc/vHMBmqYPIvz6Ne6J0HwBq2J8e+l6xhvvGlW+O4nC08eyazT2PwtW
	 tPs8gbhD0ys/U6laIgUnq4/G48FPIwJ+MMAWILIoDzVsI1AY5wILXQl7HcmUH1U3zrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U0F7wxwe;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE79606A332
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAE79606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U0F7wxwe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795079418; x=1826615418;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=52ddcLaG9kxnewIcdkUVX/V6qbON1n85bHQlSRLp7JA=;
  b=U0F7wxweeSdzVjkumW5B4R1hOT3VDMGSLHIzv0NsLF3Pjm+XbhFuLQyu
   XMuDzFYMUidZPPIF6BlJd+K2H7PoY83Ip0CIqJQSNT6cGLXIgDZ9cyTEb
   sUDklzsbC5sdjI6p/bCEwzWui7ztdHNl9Tgq4zftgUpMv9H1IbM/EAC1q
   t+L/cHHtUXDsZmZcHSdjj81PpYsRHn0GYA6W1Ac9ctYvh4Tnz1BFdQklM
   1hljOhUtqcDPkTFYljmRVVWnHX1bKEHVlt+lLoUFMxtIG2McvOAnUFAnq
   Y1CQLyRmDDUW/7T4vQiaYBCnnP0L02NrL62WtL84cDuU3StEJDxoL12Rn
   w==;
X-CSE-ConnectionGUID: MpAK5DzHS8ed+yM56k5O6w==
X-CSE-MsgGUID: YGhURI6gTb2E6wffl4JTpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3765434"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3765434"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 01:10:18 -0800
X-CSE-ConnectionGUID: ck2CoZx8Qem1zeg+aAQn9Q==
X-CSE-MsgGUID: 2HsJyedWRmGuDelT3Igu6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10296488"
Received: from soc-pf6038af.clients.intel.com (HELO [10.217.180.38]) ([10.217.180.38])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 01:10:16 -0800
Message-ID: <0f6ce460-2e6d-46eb-8282-6f9413a05857@linux.intel.com>
Date: Thu, 19 Nov 2026 10:10:14 +0100
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
Subject: Re: [PATCH char-misc-next v3 4/4] issei: add driver to driver
 interface
To: Alexander Usyskin <alexander.usyskin@intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Menachem Adin <menachem.adin@intel.com>,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Reuven Abliyev <reuvenab@gmail.com>
References: <20261111-issei_pm_and_itf-v3-0-4f4f6d626ff3@intel.com>
 <20261111-issei_pm_and_itf-v3-4-4f4f6d626ff3@intel.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
In-Reply-To: <20261111-issei_pm_and_itf-v3-4-4f4f6d626ff3@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11-Nov-26 8:40, Alexander Usyskin wrote:
> Add new interface that enables communication with ISSEI device
> from the kernel modules.
> First intended consumer is an NPU driver.
> 
> Co-developed-by: Reuven Abliyev <reuvenab@gmail.com>
> Signed-off-by: Reuven Abliyev <reuvenab@gmail.com>
> Co-developed-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>   MAINTAINERS                       |   1 +
>   drivers/misc/issei/Makefile       |   1 +
>   drivers/misc/issei/cdev.c         |  12 +-
>   drivers/misc/issei/issei_device.c | 269 ++++++++++++++++++++++++++++++++++++++
>   include/linux/issei_device.h      |  31 +++++
>   5 files changed, 308 insertions(+), 6 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb315065..1633cc41d95b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13761,6 +13761,7 @@ S:	Supported
>   F:	Documentation/ABI/testing/sysfs-class-issei
>   F:	Documentation/driver-api/issei/issei.rst
>   F:	drivers/misc/issei/
> +F:	include/linux/issei_device.h
>   F:	include/uapi/linux/issei.h
>   
>   INTEL SGX
> diff --git a/drivers/misc/issei/Makefile b/drivers/misc/issei/Makefile
> index 8fac360c3342..b689784357f4 100644
> --- a/drivers/misc/issei/Makefile
> +++ b/drivers/misc/issei/Makefile
> @@ -8,6 +8,7 @@ issei-objs += dma.o
>   issei-objs += fw_client.o
>   issei-objs += host_client.o
>   issei-objs += ham.o
> +issei-objs += issei_device.o
>   issei-objs += main.o
>   
>   obj-$(CONFIG_INTEL_SSEI_HW_HECI) += issei-heci.o
> diff --git a/drivers/misc/issei/cdev.c b/drivers/misc/issei/cdev.c
> index b7d65e2d0813..f5a3ebbf8740 100644
> --- a/drivers/misc/issei/cdev.c
> +++ b/drivers/misc/issei/cdev.c
> @@ -272,14 +272,14 @@ static const struct file_operations issei_fops = {
>   	.poll = issei_poll,
>   };
>   
> -static void issei_device_release(struct device *dev)
> +static void issei_dev_release(struct device *dev)
>   {
>   	kfree(dev_get_drvdata(dev));
>   }
>   
> -static void issei_device_init(struct issei_device *idev, struct device *parent,
> -			      const struct issei_dma_length *dma_length,
> -			      const struct issei_hw_ops *ops)
> +static void issei_dev_init(struct issei_device *idev, struct device *parent,
> +			   const struct issei_dma_length *dma_length,
> +			   const struct issei_hw_ops *ops)
>   {
>   	idev->parent = parent;
>   	idev->power_down = false;
> @@ -322,7 +322,7 @@ struct issei_device *issei_register(size_t hw_size, struct device *parent,
>   	if (!idev)
>   		return ERR_PTR(-ENOMEM);
>   
> -	issei_device_init(idev, parent, dma_length, ops);
> +	issei_dev_init(idev, parent, dma_length, ops);
>   
>   	ret = xa_alloc(&issei_minor_xa, &minor, idev, XA_LIMIT(0, ISSEI_MAX_DEVS), GFP_KERNEL);
>   	if (ret < 0) {
> @@ -339,7 +339,7 @@ struct issei_device *issei_register(size_t hw_size, struct device *parent,
>   	idev->dev.class = issei_class;
>   	idev->dev.parent = parent;
>   	idev->dev.groups = issei_groups;
> -	idev->dev.release = issei_device_release;
> +	idev->dev.release = issei_dev_release;
>   	dev_set_drvdata(&idev->dev, idev);
>   
>   	idev->cdev = cdev_alloc();
> diff --git a/drivers/misc/issei/issei_device.c b/drivers/misc/issei/issei_device.c
> new file mode 100644
> index 000000000000..9c90b4a7a6aa
> --- /dev/null
> +++ b/drivers/misc/issei/issei_device.c
> @@ -0,0 +1,269 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (C) 2025-2026 Intel Corporation */
> +#include <linux/cleanup.h>
> +#include <linux/device.h>
> +#include <linux/jiffies.h>
> +#include <linux/err.h>
> +#include <linux/export.h>
> +#include <linux/sched/signal.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/types.h>
> +#include <linux/uuid.h>
> +#include <linux/wait.h>
> +
> +#include <linux/issei.h>
> +#include <linux/issei_device.h>
> +
> +#include "issei_dev.h"
> +#include "host_client.h"
> +
> +#define ISSEI_DEVICE_CNT_TO_MS 200
> +
> +/**
> + * issei_device_open - open issei device context.
> + * @match: pointer to callback that should return non-zero when matching device is found
> + * @data: user data to pass to match callback
> + *
> + * Return: pointer to opaque context on success, ERR_PTR on error
> + */
> +void *issei_device_open(int (*match)(struct device *, const void *), const void *data)
> +{
> +	struct issei_host_client *cl;
> +	struct issei_device *idev;
> +	struct device *dev;
> +
> +	dev = class_find_device(issei_class, NULL, data, match);
> +	if (!dev)
> +		return ERR_PTR(-ENODEV);
> +
> +	idev = dev_get_drvdata(dev);
> +
> +	cl = issei_cl_create(idev, NULL);
> +	if (IS_ERR(cl))
> +		put_device(dev);
> +
> +	return cl;
> +}
> +EXPORT_SYMBOL_GPL(issei_device_open);
> +
> +/**
> + * issei_device_release - release issei device context.
> + * @ctx: opaque context
> + */
> +void issei_device_release(void *ctx)
> +{
> +	struct issei_host_client *cl = ctx;
> +	struct issei_device *idev = cl->idev;
> +
> +	issei_cl_remove(cl);
> +	put_device(&idev->dev);
> +}
> +EXPORT_SYMBOL_GPL(issei_device_release);
> +
> +/**
> + * issei_device_connect - connect to the firmware client.
> + * @ctx: opaque context
> + * @client_uuid: UUID of firmware client to connect
> + * @conn: pointer for client data to fill on successful connection
> + *
> + * Return: 0 on success, <0 on error
> + */
> +int issei_device_connect(void *ctx, const uuid_t *client_uuid, struct issei_client *conn)
> +{
> +	struct issei_host_client *cl = ctx;
> +	struct issei_device *idev = cl->idev;
> +	long ret;
> +
> +	if (idev->rst_state != ISSEI_RST_STATE_DONE) {
> +		ret = wait_event_interruptible_timeout(idev->wait_rst_state,
> +						       idev->rst_state == ISSEI_RST_STATE_DONE,
> +						       msecs_to_jiffies(ISSEI_DEVICE_CNT_TO_MS));
> +		if (ret == 0) /* timeout */
> +			ret = -ETIMEDOUT;
> +		if (ret < 0) {
> +			dev_dbg(&idev->dev, "Device is in transition ret = %ld\n", ret);
> +			return ret;
> +		}
> +	}
> +	return issei_cl_connect(cl, client_uuid, &conn->max_msg_length,
> +				&conn->protocol_version, &conn->flags);
> +}
> +EXPORT_SYMBOL_GPL(issei_device_connect);
> +
> +/**
> + * issei_device_disconnect - disconnect from the firmware client.
> + * @ctx: opaque context
> + *
> + * Return: 0 on success, <0 on error
> + */
> +int issei_device_disconnect(void *ctx)
> +{
> +	struct issei_host_client *cl = ctx;
> +	struct issei_device *idev = cl->idev;
> +
> +	if (idev->rst_state != ISSEI_RST_STATE_DONE) {
> +		dev_dbg(&idev->dev, "Device is in transition\n");
> +		return -ENODEV;
> +	}
> +
> +	return issei_cl_disconnect(cl);
> +}
> +EXPORT_SYMBOL_GPL(issei_device_disconnect);
> +
> +/**
> + * issei_device_write - send data to the firmware client.
> + * @ctx: opaque context
> + * @ubuf: data to send
> + * @length: data length
> + * @timeout: operation timeout in milliseconds
> + *
> + * Return: >=0 data length on success, <0 on error
> + */
> +ssize_t issei_device_write(void *ctx, const u8 *ubuf, size_t length, unsigned long timeout)
> +{
> +	struct issei_host_client *cl = ctx;
> +	struct issei_device *idev = cl->idev;
> +	ssize_t ret;
> +	long wret;
> +
> +	if (idev->rst_state != ISSEI_RST_STATE_DONE) {
> +		dev_dbg(&idev->dev, "Device is in transition\n");
> +		return -EBUSY;
> +	}
> +
> +	if (!length)
> +		return 0;
> +
> +	/* sanity check */
> +	if (length > idev->dma.length.h2f) {
> +		dev_dbg(&idev->dev, "Write is too big %zu > %zu\n", length,
> +			idev->dma.length.h2f);
> +		return -EFBIG;
> +	}
> +
> +	u8 *buf __free(kfree) = kmemdup(ubuf, length, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	do {
> +		ret = issei_cl_write(cl, buf, length);
> +		if (ret < 0 && ret != -EAGAIN)
> +			return ret;
> +		/* buf is consumed by issei_cl_write on success */
> +		if (ret >= 0)
> +			retain_and_null_ptr(buf);
> +		wret = wait_event_interruptible_timeout(cl->write_wait,
> +							issei_cl_check_write(cl) != 1,
> +							msecs_to_jiffies(timeout));
> +		if (wret == 0) /* timeout */
> +			wret = -ETIMEDOUT;
> +		if (wret < 0) {
> +			issei_cl_clean_all_wbuf(cl);
> +			dev_dbg(&idev->dev, "Failed writing data ret = %zd\n", ret);
> +			return wret;
> +		}
> +	} while (ret == -EAGAIN);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(issei_device_write);
> +
> +/**
> + * issei_device_read - receive data from the firmware client.
> + * @ctx: opaque context
> + * @ubuf: buffer for data
> + * @length: buffer length
> + * @timeout: operation timeout in milliseconds
> + *
> + * Return: >=0 data length on success, <0 on error
> + */
> +ssize_t issei_device_read(void *ctx, u8 *ubuf, size_t length, unsigned long timeout)
> +{
> +	struct issei_host_client *cl = ctx;
> +	struct issei_device *idev = cl->idev;
> +	u8 *data = NULL;
> +	ssize_t ret;
> +
> +	if (idev->rst_state != ISSEI_RST_STATE_DONE) {
> +		dev_dbg(&idev->dev, "Device is in transition\n");
> +		return -EBUSY;
> +	}
> +
> +	if (!length)
> +		return 0;
> +
> +	/* sanity check */
> +	if (length > idev->dma.length.f2h) {
> +		dev_dbg(&idev->dev, "Read is too big %zu > %zu\n", length,
> +			idev->dma.length.f2h);
> +		return -EFBIG;
> +	}
> +
> +	ret = issei_cl_read(cl, &data, length);
> +	if (ret < 0) {
> +		if (ret != -ENOENT)
> +			return ret;
> +
> +		ret = wait_event_interruptible_timeout(cl->read_wait,
> +						       issei_cl_check_read(cl) != 0,
> +						       timeout);
> +		if (ret == 0) /* timeout */
> +			ret = -ETIMEDOUT;
> +		if (ret < 0) {
> +			dev_dbg(&idev->dev, "Failed reading data ret = %zd\n", ret);
> +			return ret;
> +		}
> +		ret = issei_cl_read(cl, &data, length);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	memcpy(ubuf, data, ret);
> +	kfree(data);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(issei_device_read);
> +
> +/**
> + * issei_device_dma_map - allocate DMA buffer on parent device.
> + * @ctx: opaque context
> + * @size: buffer size
> + * @daddr: pointer for buffer DMA address
> + * @vaddr: pointer for buffer virtual address
> + *
> + * Return: 0 on success, <0 on error
> + */
> +int issei_device_dma_map(void *ctx, size_t size, dma_addr_t *daddr, void **vaddr)
> +{
> +	struct issei_host_client *cl = ctx;
> +
> +	return issei_cl_dma_map(cl, size, daddr, vaddr);
> +}
> +EXPORT_SYMBOL_GPL(issei_device_dma_map);
> +
> +/**
> + * issei_device_dma_unmap - deallocate DMA buffer.
> + * @ctx: opaque context
> + */
> +void issei_device_dma_unmap(void *ctx)
> +{
> +	struct issei_host_client *cl = ctx;
> +
> +	issei_cl_dma_unmap(cl);
> +}
> +EXPORT_SYMBOL_GPL(issei_device_dma_unmap);
> +
> +/**
> + * issei_device_register_interface - register class interface for issei class.
> + * @intf: interface structure
> + *
> + * Return: 0 on success, <0 on error
> + */
> +int issei_device_register_interface(struct class_interface *intf)
> +{
> +	intf->class = issei_class;
> +
> +	return class_interface_register(intf);
> +}
> +EXPORT_SYMBOL_GPL(issei_device_register_interface);
> diff --git a/include/linux/issei_device.h b/include/linux/issei_device.h
> new file mode 100644
> index 000000000000..2775aa1c1ed8
> --- /dev/null
> +++ b/include/linux/issei_device.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (C) 2025-2026 Intel Corporation */
> +#ifndef _ISSEI_DEVICE_H_
> +#define _ISSEI_DEVICE_H_
> +
> +#include <linux/issei.h>
> +#include <linux/types.h>
> +#include <linux/uuid.h>
> +
> +/* add MODULE_IMPORT_NS("INTEL_SSEI") to use these APIs */
> +
> +struct class_interface;
> +struct device;
> +
> +void *issei_device_open(int (*match)(struct device *, const void *), const void *data);
> +void issei_device_release(void *ctx);
> +
> +int issei_device_connect(void *ctx, const uuid_t *client_uuid, struct issei_client *conn);
> +int issei_device_disconnect(void *ctx);
> +
> +ssize_t issei_device_write(void *ctx, const u8 *ubuf, size_t length, unsigned long timeout);
> +ssize_t issei_device_read(void *ctx, u8 *ubuf, size_t length, unsigned long timeout);
> +
> +int issei_device_dma_map(void *ctx, size_t size, dma_addr_t *daddr, void **vaddr);
> +void issei_device_dma_unmap(void *ctx);
> +
> +int issei_device_register_interface(struct class_interface *intf);
> +#define issei_device_unregister_interface(intf) \
> +	class_interface_unregister(intf)
> +
> +#endif /* _ISSEI_DEVICE_H_ */
> 

Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
