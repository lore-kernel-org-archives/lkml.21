Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606802;
	b=DAVntfEbBuSBX49+kg29+iWcmNDJFQb0RS6RO/Tzi3oME4rM51zNURKyOMymU5ojYFe3
	 thY/LBkWcxFiOcUm0s0Jlg81EUs9G/coNSkXvxfkCV2Ef9Fzd9bqz2LItKJISfWY/AlNG
	 LTSXB2/lcLdDq6fkdj5GaNr4jgV0a5qdX1YyOGFbxRFZ/sV2MwC7numOS2cle7S/f7x5L
	 H8JpCNB9wSPNIASak4iXBszNnWxeBwhbFjxfPiwHPcqQ/7CQymr0B8iTC5TZf/VEuleej
	 Y6yuNo4r4mdCmj1f0blDEFlWGTgt7KZoY4aX7lxe9SPscyxgt6G+GIl1pyrjaTk68NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=RuxpbZ0LJq2aGgYutmGiyBC8T4jNjUNwueH9TU0HUDg=;
	b=W5zp+wZB5Vw6np/vPNyKp/uA3N+8kZKgLLRKTtVAtlRsAG8upvVLcmuXSe4NRFE7O+BI
	 0bs3owshtL5pHXS99+HvrPLExoeISPSQsrjCOd6G6Z+KA/vNPgMrsuV9DiOloedoD2Ucg
	 dMcjYWPfIdOWKiu5MR7eYbZ9vZb4Xfu6ycYWEPfoMp2Ri7uSRzJ80YryTj1IbEFdbe4wB
	 vB0lLQgnnyeOnzNZtSaGI+p5kQMP9S5jAlYKnQ9dTZQ9H7Ld8E93AvXKLc3U/+YAWRZLW
	 PTnXi47Xgriy0PKmYspwqjaFkH8GO3QOl6NxaRijR3V2ADeiynsxOIjnMn5HputImDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZL6sTSrR;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4D7606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E4D7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZL6sTSrR
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so3990307f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795606801; x=1796211601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RuxpbZ0LJq2aGgYutmGiyBC8T4jNjUNwueH9TU0HUDg=;
        b=ZL6sTSrRr8LfUld7bxlNuGPDcR/LgsmPgZb5Y234g6GwKsMoXzJOTTqyzSmJLzoo27
         TZXJQJsFTFmrZ6ZLnjE+ysQ/9lJeQBcFxzhvmZeJAubKff4wEx2ChABgMkaqnN7/gRln
         v5U2uEIkv2RR9i/kKO825DiI2ck8AQS8xz2J4NpMJUgwAYEaiWcTAGASMlIRcojM+WdM
         dRW8Wr3a/BMhSIyL4vq8TZ+ozu+QeICiMUUdg85uPzl3xyquonBdbr4WD9Sa/pMk13Z2
         3SJywscPfdhEpfT8HJGnx0HTOu6MqdezMyvEqnDQD5QRVeXUL4tpV8XCIiNSvaOf7l9T
         0NlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606801; x=1796211601;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RuxpbZ0LJq2aGgYutmGiyBC8T4jNjUNwueH9TU0HUDg=;
        b=LQwtqYrsv6pLjk+iaqSSRq8zeDwECCO8kIy8oda0PQgG7hQtMceAZ1HnprMGfMPv3H
         C7O5EARbJlSluNzZgD6COoCp29+syi+nj8IAPwOY2HC6ZdrJVayM0rva313155d7r4G4
         ILYfYiWmLAjGzg+1PqYLRYgPoQUoiE4Py+tKepnVUDQ62bDLkZgUwhONg2XPmMd0S67G
         e8Io/epJ+b9PtQOpRWhyQBR2YcFmnbKZCfK8KiKHLcItLJ9f26sM9dFZVlxw+c6xg2pa
         atPP6tmVh8vHtHsKuy4szpsv/BLxVB49o0YvJjLGGQlNebA9p7cepguIuRHYLOrECGm6
         28vw==
X-Forwarded-Encrypted: i=1; AL+hErFYnG2kg70ukzfE3VVM7w2RaLJQECVde3NwMLehJ8qZgsn2uevgd/+QFVhpuY0aMTax40DRvPbMot9mLOQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UBQUGKXRC/t+Eq3gyTxaXi2mGOLlo++1/7aeRdPg++Qj2aRuW
	89Uilz5rqlFE9vU3DGZk0G5cGOSXCR2IdRFsyeJU8oART8sdO/paE7xNjrtOdqL01AU=
X-Gm-Gg: AZFdTZe7p+ET4FGHh6WoGEnpqRETR1VHVdrufyToBlpFh0CCMXXGvpJOc/G+tXPQ8SA
	wtsw4XYHJdWeqa/OrCvf9V/Hh8DV9MyT4ojkwC0eqfpMr2khhN/bfRE+sZxqsEktOSVwYwDlSSl
	xyV+5ZjnlJ3nmN2Wwlf26bbE0RRiH05nHJyfCK13b3yk3cFdUQqhMVBnvUhelOXSCDFs3Ch6dA7
	SyazqyzLUGFxn1JinAzVbvSNaVTNfHTWWAen5RuEi+elPZ1aIxsnyJo5xi4ojFiJ6YiVpjMxOsa
	lgNuQ6XQ1qFePmj7PqFUkKHiLLPRHyDxiOiEKiNhzad+hrwyPBBIPHwREjrhBKGDkx4cKo9QGnS
	RJIJrSZDqYENVwvb4dLYgp+45Pei/RZVnGWHhJG3kEW0T+8/PztRglqta3Thyl+V0fda5Np4euU
	7NuvnDQlfbznchWEsTq3vwh/ZNr4KkKFCf+hfTskJxNAG9d5a584qBJWTIcmdow9zp0/WP5H4AH
	RsZiUVQNo13bNksphMu+kRSFUVlX18dNJTC1QoO0JOKdIMe4UCqQx49CcB86eS0T14Ewhs+EjC1
	oJ0BjtnihycwW1S2aqu59K4JWt5F
X-Received: by 2002:a05:6000:24c3:b0:4a4:368:409d with SMTP id ffacd0b85a97d-4abaa9769d3mr37443004f8f.3.1795606800712;
        Wed, 25 Nov 2026 03:40:00 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm31635115f8f.34.2026.11.25.03.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:40:00 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 25 Nov 2026 12:43:59 +0100
To: Joshua Covington <joshuacov@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Radu Rendec <radu@rendec.net>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irqchip/irq-bcm2712-mip: Drop MSI_CHIP_FLAG_SET_ACK
Message-ID: <awbJ_8i4TUV7KZjv@apocalypse>
References: <20261121163809.86620-1-joshuacov@gmail.com>
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
In-Reply-To: <20261121163809.86620-1-joshuacov@gmail.com>

Hi Joshua,

On 16:38 Sat 21 Nov     , Joshua Covington wrote:
> Commit f35508b93a2f ("irqchip/irq-bcm2712-mip: Set EOI/ACK flags in
> msi_parent_ops") made the PCI MSI device chips ack through
> irq_chip_ack_parent(). Neither the MIP middle chip nor the GIC below it
> implements irq_ack, so any ack is a NULL pointer call.
> 
> The MIP vectors are handled by handle_fasteoi_irq(), which never acks,
> so this only shows when mask_ack_irq() runs, e.g. when a chained
> handler is removed. The RP1 driver does that on every teardown since
> commit 82aa033fef52 ("misc: rp1: clear chained IRQ handlers on
> teardown"), and the kernel panics:
> 
>   pc : 0x0
>   lr : irq_chip_ack_parent+0x1c/0x28
>   Call trace:
>    __irq_do_set_handler+0x248/0x24c
>    irq_set_chained_handler_and_data+0x6c/0x94
>    rp1_unregister_interrupts+0x3c/0xa8
> 
> The MIP hierarchy has no use for an ack, like the drivers fixed by
> commit fb0ea6e4878a ("irqchip: Drop MSI_CHIP_FLAG_SET_ACK from
> unsuspecting MSI drivers").
> 
> Fixes: f35508b93a2f ("irqchip/irq-bcm2712-mip: Set EOI/ACK flags in msi_parent_ops")
> Signed-off-by: Joshua Covington <joshuacov@gmail.com>
> ---
> The panic was reported on BCM2712 with 6.18.61 and later when the
> rp1_pci probe fails (https://github.com/openwrt/openwrt/pull/26530#issuecomment-6975561491).
> Tested on a Raspberry Pi CM5 with 6.18.64 and the Raspberry Pi
> downstream patches: with this patch, unbinding and binding rp1_pci
> again completes without a panic. Applies unchanged to v7.4-rc3 and
> builds there without warnings (W=1, GCC 13 and clang 18).
> 
>  drivers/irqchip/irq-bcm2712-mip.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-bcm2712-mip.c b/drivers/irqchip/irq-bcm2712-mip.c
> index 06a6ab627..12d9e3846 100644
> --- a/drivers/irqchip/irq-bcm2712-mip.c
> +++ b/drivers/irqchip/irq-bcm2712-mip.c
> @@ -163,7 +163,7 @@ static const struct irq_domain_ops mip_middle_domain_ops = {
>  static const struct msi_parent_ops mip_msi_parent_ops = {
>  	.supported_flags	= MIP_MSI_FLAGS_SUPPORTED,
>  	.required_flags		= MIP_MSI_FLAGS_REQUIRED,
> -	.chip_flags		= MSI_CHIP_FLAG_SET_EOI | MSI_CHIP_FLAG_SET_ACK,
> +	.chip_flags		= MSI_CHIP_FLAG_SET_EOI,
>  	.bus_select_token       = DOMAIN_BUS_GENERIC_MSI,
>  	.bus_select_mask	= MATCH_PCI_MSI,
>  	.prefix			= "MIP-MSI-",

Reviewed-by: Andrea della Porta <andrea.porta@suse.com>

> -- 
> 2.43.0
> 
