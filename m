Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795189006;
	b=4IYODXMcfWA9fLp9oJ01/QF7tzR4dpnFaLcU1fNZ+jSH5lw7gsMM+0eYRSIhgfkdXyKc
	 svArWGSsJgzmwOuaTAD9vQsacb6svX2Y0mBAVffNRvaXsiETLBrtiMQ01WLa7VMERR1wI
	 +bV6j+mZ/3jH8zYwZbfdiGGJRmmlbhBAjKiB8Dzzyf9XlOh57biuxhz6zzIFlz5TLLs2z
	 EeTfF7YX4+vtSRISibUKv8XK3ft8+ZGXAf+oo85kzmipeNzD0s7eOAFLRA/jgKigEdjZ9
	 EEatGBFum1zWe55u0ht9CwkOJ70b25QepG0ysXeZpUvbuf4fws54Lm1SK3Q7hJWwdNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795189006;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=sQ1LmUXEwQYTb2JQcMNhEl4UkiEAtOkr56bCnNrszog=;
	b=VkipGzpGaALxHFWFRMl1YItu5MDBJJKRXE21wJmh/U0D6tae9Bkzw1fzLf8DNpj6O6Tu
	 BaibQKtqyt0g/13CdWbLnbn/1SjXBEBYH5mfzoSnPVeCcoKUP/+Srb6GgwKQA06BkgMxT
	 SnFtkSf9RZdUsXVHQDGTFFw1RMHEihJT5izp3kbZFYBK9Y0wZTtpInE5Y/r1JUzWgV2Bz
	 qYFO/AqYvWc2bCh7vBBy0/o5grGqETm6L9+iHJwNkSLYSc2NsQy0u4SiVL6VADklWKR/o
	 DYDcBN++tiRRDkVEZTrz+8/zpJMFVA2meTNkvsP5IQO7VcusPtaPUNqrPJy4BSw/lxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="LuHEGq/H";
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326D8606A330
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 326D8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LuHEGq/H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795189007; x=1826725007;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=guQmaM05KNedcFdL8H23N8AAwbzKvxv2ymikBzst2Q4=;
  b=LuHEGq/HBqsabT0QaPsOoMtLnF16j2I3NJ6aSmuqjiy9nLj6sPVLLCLU
   Fp+/EJDk9C6whutuQ2c2vwbx14W/622dv/eSkak+It/cq9lFZJP7lwCiv
   eGtSNplNVpC5CXQTxaqpsvrzGr93I2okazjwDmnVU+ZAeLehxzxotd9Go
   n0DG8SDhA1wmoqIYUfKI/rc/tvWZ+IrAo2fQuf4oVjZ3p12kV9Gt/YTvN
   4qmd+bUUPqCrbMDDV6+i+OM9qKNFOUpy556ZgQdXEmo8wOcwe+fEjF/GT
   AAfROu/is/+XiZauUn2XFNEQkleLBUXoBOGtxtqk2j23qfSZ8r3Faaoyb
   g==;
X-CSE-ConnectionGUID: 6dzfnE6EQhq1HqOH+wvqVg==
X-CSE-MsgGUID: O+CdktakQrqysOcY8A/nxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3915452"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3915452"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 07:36:46 -0800
X-CSE-ConnectionGUID: k2UQjxmZQuu8I4xwKlqQ3Q==
X-CSE-MsgGUID: jtvuB4J3Se67vKwFSijtxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10801130"
Received: from jjgreens-desk24.amr.corp.intel.com (HELO [10.125.109.138]) ([10.125.109.138])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 07:36:44 -0800
Message-ID: <cc1192ff-e8b1-40c9-b24a-c03f3e85ab20@intel.com>
Date: Fri, 20 Nov 2026 08:36:42 -0700
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
Subject: Re: [PATCH] ntb: fix peer_spad_read() returning -EINVAL instead of 0
To: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>, jdmason@kudzu.us
Cc: alok.a.tiwari@oracle.com, u.kleine-koenig@baylibre.com,
 den@valinux.co.jp, bhelgaas@google.com, mani@kernel.org, Frank.Li@nxp.com,
 Maciej.Grochowski@sony.com, linux-kernel@vger.kernel.org, trivial@kernel.org
References: <20261120084546.2018-1-zhangjiao2@cmss.chinamobile.com>
From: Dave Jiang <dave.jiang@intel.com>
Content-Language: en-US
In-Reply-To: <20261120084546.2018-1-zhangjiao2@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/20/26 1:45 AM, zhangjiao2 wrote:
> From: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> 
> The amd_ntb_peer_spad_read(), ntb_epf_peer_spad_read() and
> switchtec_ntb_peer_spad_read() functions have a return type of u32
> but return -EINVAL on error, which results in a garbage value
> (0xFFFFFFEA) being returned to callers. Other NTB hardware drivers
> (e.g. Intel's ndev_spad_read) correctly return 0 for out-of-range
> scratchpad indices.
> 
> Fix all three functions to return 0 on error, matching the
> established convention in the NTB subsystem.
> 
> Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>

> ---
>  drivers/ntb/hw/amd/ntb_hw_amd.c        | 2 +-
>  drivers/ntb/hw/epf/ntb_hw_epf.c        | 4 ++--
>  drivers/ntb/hw/mscc/ntb_hw_switchtec.c | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/ntb/hw/amd/ntb_hw_amd.c b/drivers/ntb/hw/amd/ntb_hw_amd.c
> index 36bee0d8ac6c..40ced4043340 100644
> --- a/drivers/ntb/hw/amd/ntb_hw_amd.c
> +++ b/drivers/ntb/hw/amd/ntb_hw_amd.c
> @@ -529,7 +529,7 @@ static u32 amd_ntb_peer_spad_read(struct ntb_dev *ntb, int pidx, int sidx)
>  	u32 offset;
>  
>  	if (sidx < 0 || sidx >= ndev->spad_count)
> -		return -EINVAL;
> +		return 0;
>  
>  	offset = ndev->peer_spad + (sidx << 2);
>  	return readl(mmio + AMD_SPAD_OFFSET + offset);
> diff --git a/drivers/ntb/hw/epf/ntb_hw_epf.c b/drivers/ntb/hw/epf/ntb_hw_epf.c
> index c47607d4f8a7..dcc5eb4bea74 100644
> --- a/drivers/ntb/hw/epf/ntb_hw_epf.c
> +++ b/drivers/ntb/hw/epf/ntb_hw_epf.c
> @@ -273,12 +273,12 @@ static u32 ntb_epf_peer_spad_read(struct ntb_dev *ntb, int pidx, int idx)
>  
>  	if (pidx != NTB_DEF_PEER_IDX) {
>  		dev_err(dev, "Unsupported Peer ID %d\n", pidx);
> -		return -EINVAL;
> +		return 0;
>  	}
>  
>  	if (idx < 0 || idx >= ndev->spad_count) {
>  		dev_err(dev, "WRITE: Invalid Peer ScratchPad Index %d\n", idx);
> -		return -EINVAL;
> +		return 0;
>  	}
>  
>  	offset = (idx << 2);
> diff --git a/drivers/ntb/hw/mscc/ntb_hw_switchtec.c b/drivers/ntb/hw/mscc/ntb_hw_switchtec.c
> index e38540b92716..a9fc94869aeb 100644
> --- a/drivers/ntb/hw/mscc/ntb_hw_switchtec.c
> +++ b/drivers/ntb/hw/mscc/ntb_hw_switchtec.c
> @@ -762,7 +762,7 @@ static u32 switchtec_ntb_peer_spad_read(struct ntb_dev *ntb, int pidx,
>  	struct switchtec_ntb *sndev = ntb_sndev(ntb);
>  
>  	if (pidx != NTB_DEF_PEER_IDX)
> -		return -EINVAL;
> +		return 0;
>  
>  	if (sidx < 0 || sidx >= ARRAY_SIZE(sndev->peer_shared->spad))
>  		return 0;

