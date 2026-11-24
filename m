Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483405;
	b=erzrMn7UJLoGZkM+Gt3wsMpLTP49YmMZtZFpDM9JusYuQlx2DGechHVDaln82cE4KxrM
	 LnL9AhGSYKj+nfmauNIoTSMYtP1aNkXvexVtjD3Y6kOurbhI/U5Ix/JScX6NWiXc6+qnr
	 j6tzjtEeDHi7pNfy4T8a0ypD/iUaLhbU4x+P0qd0R4Lt7n7y6z+piSCA/u9ONF68BEXnx
	 OCHXf3zgf1aXEeZtReSnpwVBmC5vaxoE+EQatLlBxbrgTCwnEg7d0ZIRaBPEToCWaINUd
	 UH29yxuWS1ZI2m8hEaYvgMAU8D8MKxDSQqfuGWiga3prD42IViwE2y1856Cjv8q/h5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483405;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Cc:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=aIdkrIcEBnYbFZMLTuFDUr00LiXdmSauPCXD+770RBQ=;
	b=4R2wyarCZx1RZR/kRpH9JpCOLIixyCjVrt8m/Jh/k0xWAdpKIpVVyR52mCrxtfz0xnvP
	 mngT6yvNLtoZbSMCAlm3tHERvmrMiqz+knj/DB46H4APQWNMrhcx2rqtjaGqrHK3e5n23
	 Ci+rj/s+GpNx84Oayq3K5WDzLSFFUPOIiXtrWwPxbjSlLAjJORk93KPeGFXEXHjLWMW18
	 Aqv623QTeJaZAB1WDIvO2rkqQ2CznKRg/nxMnelqiQ5CmN9sbUWvrNZ9WBEeUPq+WPA7D
	 G6I/SUAbzgZZHrvc5SXdesATvNbW+q71nmUliqv8wuwqKECETTs6xDTlqGCB0aR9Ekw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vEpqCUQ2;
	arc=none smtp.remote-ip=95.215.58.144
Received: from mta1.migadu.com (out-144.mta1.migadu.com [95.215.58.144])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABB7606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CABB7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vEpqCUQ2
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=f+smgXsTlQwRlJ4wPJ0b96Vd0Rq9knVKNZEL9CzuofA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795483402; v=1; x=1796088202;
 b=vEpqCUQ2qXWKGt/F6KvQvNTmpWhVJcTJTNAeWiLNBLpUcqoIP5hfB1rBsQpLWrycl7iX2p2K
 3SM8jVvk6f5BajzEIdpVXfQFJGXWoMMKw3LndhdyxX4R1rqYwjg3L36cbkKKtdljqK3/TohxECJ
 Oe7yzO4m0K3fe9lXipfLXdC4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d71eace5cbf913ab;
	Tue, 24 Nov 2026 01:23:22 +0000
X-Mizu-Trace-ID: d71eace5cbf913ab
X-Migadu-Flow: FLOW_OUT
Message-ID: <973179f7-498a-4786-9c57-f42aa5a7c50b@linux.dev>
Date: Tue, 24 Nov 2026 09:23:10 +0800
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
Cc: shawn.lin@linux.dev, "ulfh@kernel.org" <ulfh@kernel.org>,
 "jh80.chung@samsung.com" <jh80.chung@samsung.com>,
 "shawn.lin@rock-chips.com" <shawn.lin@rock-chips.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mmc: dw_mmc: Read clk-phase DT settings earlier
To: "Brandt, Oliver - Lenze" <Oliver.Brandt@lenze.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
References: <2c5f6a551f5375a5f92728b1aee036d05eebad7f.camel@lenze.com>
From: Shawn Lin <shawn.lin@linux.dev>
In-Reply-To: <2c5f6a551f5375a5f92728b1aee036d05eebad7f.camel@lenze.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Brandt

在 2026/11/13 星期五 0:16, Brandt, Oliver - Lenze 写道:
> With a kernel 7.3.3 we saw the following on a SoCFPGA (Cyclone 5) based
> board during initialization when using a high-speed SD-card:
> 
>    dw_mmc ff704000.mmc: DW MMC controller at irq 53,32 bit host data width,1024 deep fifo
>    dw_mmc ff704000.mmc: Got CD GPIO
>    dw_mmc ff704000.mmc: Got WP GPIO
>    mmc_host mmc0: Bus speed = 50000000Hz (req 400000Hz, actual 396825HZ div = 63)
>    mmc_host mmc0: Bus speed = 50000000Hz (req 50000000Hz, actual 50000000HZ div = 0)
>    mmc0: error -110 whilst initialising SD card
>    mmc_host mmc0: Bus speed = 50000000Hz (req 300000Hz, actual 297619HZ div = 84)
>    mmc_host mmc0: Bus speed = 50000000Hz (req 50000000Hz, actual 50000000HZ div = 0)
>    mmc0: error -110 whilst initialising SD card
>    mmc_host mmc0: Bus speed = 50000000Hz (req 200000Hz, actual 200000HZ div = 125)
>    mmc_host mmc0: Bus speed = 50000000Hz (req 50000000Hz, actual 50000000HZ div = 0)
>    mmc0: error -110 whilst initialising SD card
>    mmc_host mmc0: Bus speed = 50000000Hz (req 100000Hz, actual 100000HZ div = 250)
>    mmc_host mmc0: Bus speed = 50000000Hz (req 50000000Hz, actual 50000000HZ div = 0)
>    mmc0: error -110 whilst initialising SD card
> 
> The SD-card was not usable in the following.
> 
> Reason: Since commit 3f1628baa51e ("mmc: dw_mmc-pltfm: Use phase_map for
> SoCFPGA clock phase configuration") host->phase_map is used in order to
> get the phase settings for MMC_TIMING_SD_HS. This is done in drv_data->init
> (dw_mci_socfpga_priv_init()) which is called before dw_mci_init_host(). As
> host->phase_map will be initialized only during dw_mci_init_host(), we'll
> call dw_mci_socfpga_priv_init() without the needed data.
> 
> Calling mmc_of_parse_clk_phase() from dw_mci_parse_dt() instead of
> dw_mci_init_host() ensures that we have valid data when calling
> dw_mci_socfpga_priv_init()
> 

Thanks for the fix.

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> Fixes: 3f1628baa51e ("mmc: dw_mmc-pltfm: Use phase_map for SoCFPGA clock phase configuration")
> Fixes: 0d944576c99e ("mmc: dw_mmc: Add parsing mmc_clk_phase_map support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Oliver Brandt <oliver.brandt@lenze.com>
> ---
> - Replacement for obsolete patch; Sashiko has found a much simpler and
>    cleaner solution.
> - Link to obsolete patch: https://lore.kernel.org/linux-mmc/140317dff0feb9d62b580b1e3170ccb10b8af181.camel@lenze.com/
> 
>   drivers/mmc/host/dw_mmc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
> index cf5cecc5491d5..cd44898d44f3c 100644
> --- a/drivers/mmc/host/dw_mmc.c
> +++ b/drivers/mmc/host/dw_mmc.c
> @@ -2850,8 +2850,6 @@ static int dw_mci_init_host(struct dw_mci *host)
>   	if (ret)
>   		return ret;
>   
> -	mmc_of_parse_clk_phase(host->dev, &host->phase_map);
> -
>   	ret = dw_mci_init_host_caps(host);
>   	if (ret)
>   		return ret;
> @@ -3143,6 +3141,8 @@ static int dw_mci_parse_dt(struct dw_mci *host)
>   	if (!host->bus_hz && !device_property_read_u32(dev, "clock-frequency", &clock_frequency))
>   		host->bus_hz = clock_frequency;
>   
> +	mmc_of_parse_clk_phase(host->dev, &host->phase_map);
> +
>   	if (drv_data && drv_data->parse_dt) {
>   		ret = drv_data->parse_dt(host);
>   		if (ret)

