Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102133;
	b=RfJTLEq/2vFSq9+VNfJnOv5hbbJbYUv5xJbPHd5GL3TDQcDwANMTEACXJUjG0M9smsy2
	 lygmeX9a40Iafn6AwpELBYphh/LSVb7Yzxy7P5Gwb4o5y7z5PWvQIjP07wUN9Z4MU8oEU
	 0RPhGen5s55c316yulJ69fJl5Elkg3RB+vHVC+JdAxqXgOY0c+EWXJg6UZ2c1KrQOr4bG
	 juGFCbo48XhZaxIvrvKwN/xgx8Tyv/vrKmhtJXRyEDGuww+b80ib15I61UiPRL5OvopW3
	 NocOKIj8WkUvei+OgAMt/W8LPHF2N7ZCG6p58p+oFw0gM9wSLIJ/vZbAejhUXgK0uAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102133;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=EnCDLxnmp1LtFNKo0mdaWIcazXe0vBte7heTqEDGpdo=;
	b=dUav69f2Zwfej+6UnXLnKLu7UH+K2aagdCTK5GOb8ZprY/NoNQQxEaCL/7uprJDCqK+r
	 WT3qlrzThdXh/SYZ1bzpaQ21ry3rDbsC8mReilOLboVahpttAQQwy9/lmxO/BVTQQHW3Q
	 yAGUQJ38PozAqExc6vfQm9q2D9uAbDrJkC/2gh7MVO7Sax7wAtoPldJOyqLXbAlLsMps7
	 7hVcgnJ2ocLJQsUbhFuoNPvbYEJY4i4fXIdMyrty2FFPE82fpr2CFjYGVotSEdDlvmkjP
	 M2p0DuKZmJQ32E40jkf4YtbxacnUFUXQeBSxKoxmsCYWlaIPfktYby0dF46jwcKUIIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CAIR+2uE;
	arc=none smtp.remote-ip=91.218.175.226
Received: from mta0.migadu.com (out-226.mta0.migadu.com [91.218.175.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78B4606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A78B4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CAIR+2uE
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xstZUCpagJm1EvnCuEHUwHSA5x2dm2sB96xZUJUAL50=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795102130; v=1; x=1795706930;
 b=CAIR+2uEwTXazYn2CoAM6aGyMboKmP/VT4odluvBCO1k6QqlvH/DJA1DHZjGDHiHaRrW/GUq
 ai6jTx+PP4QZVu3Ms/9K8qEnjIXT4eR5Xi6fySeImWWrXRl5N+9K+hX/3PDJfqXBSpGPC/tYefV
 ikT7EEry5SDtUanVbfSf8RLg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c83126158e430bdc;
	Thu, 19 Nov 2026 15:28:50 +0000
X-Mizu-Trace-ID: c83126158e430bdc
X-Migadu-Flow: FLOW_OUT
Message-ID: <0f262ab4-9431-4720-9422-0ee2155fa933@linux.dev>
Date: Thu, 19 Nov 2026 15:28:49 +0000
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
Subject: Re: [PATCH v3 02/58] mtd: acquire an MTD handle from a referenced
 class device
To: James Hilliard <james.hilliard1@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
 <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-2-ce537999741d@gmail.com>
Content-Language: en-US
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-2-ce537999741d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/2026 01:27, James Hilliard wrote:
> PTP OCP locates flash through the device hierarchy and uses driver data
> directly. A class-device reference does not keep an MTD registered or own
> the backing object needed by an erase or write.
> 
> Look up the exact device under mtd_table_mutex and acquire an ordinary MTD
> handle before returning it. Use that handle for the OCP update and release
> it on every exit. A removed device cannot be confused with a replacement
> that reuses its name or number.
> 
> Cc: Richard Cochran <richardcochran@gmail.com>
> Cc: Jonathan Lemon <jonathan.lemon@gmail.com>
> Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   drivers/mtd/mtdcore.c   | 23 +++++++++++++++++++++++
>   drivers/ptp/ptp_ocp.c   |  7 ++++++-
>   include/linux/mtd/mtd.h |  1 +
>   3 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 30b16f135f07..620326279957 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -1329,6 +1329,29 @@ struct mtd_info *get_mtd_device(struct mtd_info *mtd, int num)
>   EXPORT_SYMBOL_GPL(get_mtd_device);
>   
>   
> +/**
> + * get_mtd_device_by_dev - acquire the MTD associated with a class device
> + * @dev: referenced MTD class device
> + *
> + * Return: a referenced MTD, or an error if the device has been removed.
> + */
> +struct mtd_info *get_mtd_device_by_dev(struct device *dev)
> +{
> +	struct mtd_info *mtd;
> +	int err;
> +
> +	guard(mutex)(&mtd_table_mutex);
> +	mtd_for_each_device(mtd) {
> +		if (&mtd->dev != dev)
> +			continue;
> +		err = __get_mtd_device(mtd);
> +		return err ? ERR_PTR(err) : mtd;
> +	}
> +	return ERR_PTR(-ENODEV);
> +}
> +EXPORT_SYMBOL_GPL(get_mtd_device_by_dev);
> +
> +
>   int __get_mtd_device(struct mtd_info *mtd)
>   {
>   	struct mtd_info *master = mtd_get_master(mtd);
> diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
> index 3d26ec1f7b9e..459aeb24ae6b 100644
> --- a/drivers/ptp/ptp_ocp.c
> +++ b/drivers/ptp/ptp_ocp.c
> @@ -2083,7 +2083,7 @@ static int
>   ptp_ocp_devlink_flash(struct devlink *devlink, struct device *dev,
>   		      const struct firmware *fw)
>   {
> -	struct mtd_info *mtd = dev_get_drvdata(dev);
> +	struct mtd_info *mtd;
>   	struct ptp_ocp *bp = devlink_priv(devlink);
>   	size_t off, len, size, resid, wrote;
>   	struct erase_info erase;
> @@ -2091,6 +2091,10 @@ ptp_ocp_devlink_flash(struct devlink *devlink, struct device *dev,
>   	const u8 *data;
>   	int err;
>   
> +	mtd = get_mtd_device_by_dev(dev);
> +	if (IS_ERR(mtd))
> +		return PTR_ERR(mtd);
> +
>   	err = ptp_ocp_devlink_fw_image(devlink, fw, &data, &size);
>   	if (err)
>   		goto out;
> @@ -2120,6 +2124,7 @@ ptp_ocp_devlink_flash(struct devlink *devlink, struct device *dev,
>   		resid -= len;
>   	}
>   out:
> +	put_mtd_device(mtd);
>   	return err;
>   }
>   
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index cd7b4671c456..745655e0d462 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -684,6 +684,7 @@ extern int mtd_device_parse_register(struct mtd_info *mtd,
>   	mtd_device_parse_register(master, NULL, NULL, parts, nr_parts)
>   extern int mtd_device_unregister(struct mtd_info *master);
>   extern struct mtd_info *get_mtd_device(struct mtd_info *mtd, int num);
> +struct mtd_info *get_mtd_device_by_dev(struct device *dev);
>   extern int __get_mtd_device(struct mtd_info *mtd);
>   extern void __put_mtd_device(struct mtd_info *mtd);
>   extern struct mtd_info *of_get_mtd_device_by_node(struct device_node *np);
> 

Acked-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
