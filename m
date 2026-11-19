Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079395;
	b=RBUz5B3rdf1nUOF4981fWksCx+xNGfx3rVbOxZZ6ijrmFHEXqZdXMNFqEssFgNlhRebq
	 kgme7KsbI9S9VEhUDvtQSs092fXjcoCpcoJUxXlQ4n9+M8xEnIE/+riFno73ZAKsMLV+e
	 X8idRifWwi2O4i8LeaYaQauEjxOeHYDznVZ50rSPy6uIvCf6x1HgF3Cv9LsJDYghuceFN
	 6dP5yyGSAYdDilKvr2uzl6nyX3E/epOZZpFF0wI+JTS90EtGaG5B35BDsMqGdlPsz5RC0
	 iRhxWOhTyd16yv0qoGwmiEe85HQ4AsP6r0+bYW490fpVYoLvD94/9Ql/8c7qfzG/r/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079395;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=MxS1b/SVSgwDdYGDRvXWDILIeCmO1vLu6p15qE+/NqM=;
	b=ujgPh4zV0NhPIa4atcDIsyEcZCVAEZzoLLIAH+D6mAD19H+UP4dg/k9ipoof5bdvL4rg
	 9XSmLY4k0ThLxbM79jkaFSQXxZFAeRiknD8ofmMgjY5e1ed7H+yMs1v243jrs/VpqpND/
	 W60bJiSSEj6ErIw6TbOqUtfXA3Uq3EbhAQ1WIHFcoIA+DaC2h5Y6iK2V4bXWA7WQlAtCA
	 eSb8ruWUgWFutATFSnxi8RBGZfHfiqmw3Egi2VyJSTiGdq9A+mwfpz+jnprC1GG+XzJrz
	 UgxqScdd05XdXRnqtXVbCnQtb43p/7BRpxR6RR1mU3FspnZzeloWpaaUfy2q6ZB3GyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GTNpP5z3;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B80606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5B80606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GTNpP5z3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795079395; x=1826615395;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jNkAaRJNEIGsrW8DPSMUGq0EHquHDVmF3tKrlifUE9c=;
  b=GTNpP5z3ID5FkWlCGA4+XUdRaNYatV8bJcydHWPifsASkyj5s1Eo63/J
   a66WhtxeRbxui0iygajV3bIUumsLLRdqkiut3de5x8FX6WUF4eLiYom4r
   0BruJDF8x+TjcD+wnAJAPG0LTCh2FA8ZscgUi0uyplmu/coGWwocpcnNR
   xO1uLhb4+Nr9AHxilK43E/AX1/qA/WIh9hNYHTxpPM0RiQqvLFIM62cqF
   NtkdgrXJTepuMSp8ROyRPs7ZTIbRdCcHnR0nGmENs5Zi7e4e8I47VhiqH
   dj1WB0Y8rsh0tLf2vjzl5rk6kGGdcZlZNtH03o8hwZHeoBFFGrh7NpIne
   A==;
X-CSE-ConnectionGUID: bCyN0jv5RuWxPlLGYR5JWw==
X-CSE-MsgGUID: pPs1uykSQ9e1AVJCs+5B6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3765392"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3765392"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 01:09:55 -0800
X-CSE-ConnectionGUID: 0wfwS56uRnimvnqfF0B+KQ==
X-CSE-MsgGUID: OfFtFjt2Qc+2TD3Rvd9U5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10296433"
Received: from soc-pf6038af.clients.intel.com (HELO [10.217.180.38]) ([10.217.180.38])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 01:09:53 -0800
Message-ID: <bf484fbe-7ac1-4fa5-9d56-5cb9f11e6f7a@linux.intel.com>
Date: Thu, 19 Nov 2026 10:09:51 +0100
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
Subject: Re: [PATCH char-misc-next v3 3/4] issei: host_client: add dma
 allocation support
To: Alexander Usyskin <alexander.usyskin@intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Menachem Adin <menachem.adin@intel.com>,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
References: <20261111-issei_pm_and_itf-v3-0-4f4f6d626ff3@intel.com>
 <20261111-issei_pm_and_itf-v3-3-4f4f6d626ff3@intel.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
In-Reply-To: <20261111-issei_pm_and_itf-v3-3-4f4f6d626ff3@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11-Nov-26 8:40, Alexander Usyskin wrote:
> Add functions to allow dedicated DMA buffer allocated on current
> hardware device per host client.
> 
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>   drivers/misc/issei/host_client.c | 66 ++++++++++++++++++++++++++++++++++++++++
>   drivers/misc/issei/host_client.h | 12 ++++++++
>   drivers/misc/issei/issei_dev.h   |  3 ++
>   3 files changed, 81 insertions(+)
> 
> diff --git a/drivers/misc/issei/host_client.c b/drivers/misc/issei/host_client.c
> index d16b5835c619..751296e3dc25 100644
> --- a/drivers/misc/issei/host_client.c
> +++ b/drivers/misc/issei/host_client.c
> @@ -2,6 +2,7 @@
>   /* Copyright (C) 2023-2026 Intel Corporation */
>   #include <linux/cleanup.h>
>   #include <linux/dev_printk.h>
> +#include <linux/dma-mapping.h>
>   #include <linux/err.h>
>   #include <linux/fs.h>
>   #include <linux/kobject.h>
> @@ -112,6 +113,17 @@ static void __issei_cl_disconnect(struct issei_device *idev, struct issei_host_c
>   	cl_dbg(idev, cl, "Disconnected\n");
>   }
>   
> +static void __issei_cl_dma_unmap(struct issei_host_client *cl)
> +{
> +	if (!cl->dma_size)
> +		return;
> +
> +	dma_free_coherent(cl->idev->parent, cl->dma_size, cl->dma_vaddr, cl->dma_daddr);
> +	cl->dma_size = 0;
> +	cl->dma_vaddr = NULL;
> +	cl->dma_daddr = 0;
> +}
> +
>   static void __issei_cl_init(struct issei_host_client *cl, struct issei_device *idev,
>   			    u16 id, struct file *fp)
>   {
> @@ -185,6 +197,8 @@ void issei_cl_remove(struct issei_host_client *cl)
>   
>   	__issei_cl_disconnect(idev, cl);
>   
> +	__issei_cl_dma_unmap(cl);
> +
>   	cl_dbg(idev, cl, "Removed\n");
>   	kfree(cl);
>   }
> @@ -521,3 +535,55 @@ void issei_cl_clean_all_wbuf(struct issei_host_client *cl)
>   
>   	__issei_cl_clean_all_wbuf(idev, cl);
>   }
> +
> +/**
> + * issei_cl_dma_map - allocate DMA mapping for client
> + *
> + * @cl: host client
> + * @size: memory size to allocate
> + * @daddr: pointer for buffer DMA address
> + * @vaddr: pointer for buffer virtual address
> + *
> + * Return: 0 on success, < 0 on error
> + */
> +int issei_cl_dma_map(struct issei_host_client *cl, size_t size,
> +		     dma_addr_t *daddr, void **vaddr)
> +{
> +	struct issei_device *idev = cl->idev;
> +
> +	if (size == 0 || size > ISSEI_HOST_DMA_MAX_SIZE) {
> +		cl_err(idev, cl, "The size is out of bounds.\n");
> +		return -EINVAL;
> +	}
> +
> +	guard(mutex)(&idev->client_lock);
> +
> +	if (cl->dma_size) {
> +		cl_err(idev, cl, "DMA already allocated.\n");
> +		return -EALREADY;
> +	}
> +
> +	cl->dma_vaddr = dma_alloc_coherent(cl->idev->parent, size, &cl->dma_daddr, GFP_KERNEL);
> +	if (!cl->dma_vaddr)
> +		return -ENOMEM;
> +
> +	cl->dma_size = size;
> +
> +	*daddr = cl->dma_daddr;
> +	*vaddr = cl->dma_vaddr;
> +	return 0;
> +}
> +
> +/**
> + * issei_cl_dma_unmap - deallocate DMA mapping for client
> + *
> + * @cl: host client
> + */
> +void issei_cl_dma_unmap(struct issei_host_client *cl)
> +{
> +	struct issei_device *idev = cl->idev;
> +
> +	guard(mutex)(&idev->client_lock);
> +
> +	__issei_cl_dma_unmap(cl);
> +}
> diff --git a/drivers/misc/issei/host_client.h b/drivers/misc/issei/host_client.h
> index 05e2f4ade9c3..987cee609676 100644
> --- a/drivers/misc/issei/host_client.h
> +++ b/drivers/misc/issei/host_client.h
> @@ -38,6 +38,10 @@ enum issei_host_client_state {
>    * @read_wait: waitqueue for read object
>    * @read_data: received data pointer
>    * @read_data_size: received data size
> + *
> + * @dma_vaddr: allocated DMA buffer virtual address
> + * @dma_daddr: allocated DMA buffer DMA address
> + * @dma_size: allocated DMA buffer size, zero if no buffer allocated
>    */
>   struct issei_host_client {
>   	struct list_head list;
> @@ -54,6 +58,10 @@ struct issei_host_client {
>   	wait_queue_head_t read_wait;
>   	u8 *read_data;
>   	size_t read_data_size;
> +
> +	void *dma_vaddr;
> +	dma_addr_t dma_daddr;
> +	size_t dma_size;
>   };
>   
>   struct issei_host_client *issei_cl_create(struct issei_device *idev, struct file *fp);
> @@ -72,4 +80,8 @@ int issei_cl_check_read(struct issei_host_client *cl);
>   int issei_cl_check_write(struct issei_host_client *cl);
>   void issei_cl_clean_all_wbuf(struct issei_host_client *cl);
>   
> +int issei_cl_dma_map(struct issei_host_client *cl, size_t size,
> +		     dma_addr_t *daddr, void **vaddr);
> +void issei_cl_dma_unmap(struct issei_host_client *cl);
> +
>   #endif /* ISSEI_HOST_CLIENT_H_ */
> diff --git a/drivers/misc/issei/issei_dev.h b/drivers/misc/issei/issei_dev.h
> index b47c4a7c2da4..244dc62ad85f 100644
> --- a/drivers/misc/issei/issei_dev.h
> +++ b/drivers/misc/issei/issei_dev.h
> @@ -6,6 +6,7 @@
>   #include <linux/device.h>
>   #include <linux/mutex.h>
>   #include <linux/sched.h>
> +#include <linux/sizes.h>
>   #include <linux/time64.h>
>   #include <linux/types.h>
>   #include <linux/wait.h>
> @@ -31,6 +32,8 @@ extern struct class *issei_class;
>   #define ISSEI_STOP_TIMEOUT_MSEC         500
>   #define ISSEI_WRITE_TIMEOUT_MSEC        (MSEC_PER_SEC)
>   
> +#define ISSEI_HOST_DMA_MAX_SIZE	        SZ_64M
> +
>   /**
>    * struct issei_write_buf - write buffer object
>    * @list: linked list pointer
> 

Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
