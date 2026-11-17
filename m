Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=31.217.193.162
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794942767;
	b=yWIyhUfbseOB2yB/fQZYhp4V1vCSDy/PVY+E3a2orL1fhqmB11oDdnlOPeR3jmCfSjYC
	 5KWwE6nw/HtMZtbFJC+B9VXqzOV31H7DQ5HnubeswFNCLrARN+lEo1BIHhbE56TJiSYjz
	 dWQMnAysLIF4yKoZ6Q+DDjoxo5VJt2U2sltzyqGBHODXu7SZfhDBMMPBfWIn+gzAk6IrG
	 3icaHmzSNAHqA8bL0QizlDj0oXqbzdCprA/i0ClZtqMfV/D559RiT5UKPOSykLWWwz18D
	 ONg3WflHCGzG0Sjwu+xhXnuolp/nvglUHZ77h45o/mxJNj3w6qO19X2hpUtnulSpJEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942767;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:
	 X-Hostingpalvelu-MailScanner-Information:
	 X-Hostingpalvelu-MailScanner-ID:X-Hostingpalvelu-MailScanner:
	 X-Hostingpalvelu-MailScanner-SpamCheck:
	 X-Hostingpalvelu-MailScanner-From:X-Spam-Status:X-Spam-Flag:
	 X-AntiAbuse;
	bh=PKAJlPULgSNwpVMPDAkMM1KzSZqRI2YIU66I+onRyDY=;
	b=NDcMoS17uXRxHRezS4h+U5W+z9ZiAX1bK8EHIv5pKLKgjGl9SVqnPB13RagZQzXpRbuT
	 953DfPw2KEXyvP8GtGQGaDtlsY9JvoYK2QQV96csaVNUb9wDzEdj8zNclNnJz39o5Rn46
	 uiM0ZVCAu7ahGk0RoAhra9B3mvkz1hdPg2IqXE8AGm3iXUbVTA58jBZ2HDWp4R454m8mp
	 vrC+drXy/9WSR/CbtuvaD55uUaR2XG7qsMF1c2h6xzOzS5TxVmxWFKiIHm1zeMEt+3/gN
	 sVbhcd+ZGki9kklCT9KLWmSYQqa+LHW6qLim5Nlueez/ovjR9LiGJOsm1ke/m5MG8YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bitmer.com;
	spf=pass smtp.mailfrom=bitmer.com;
	dkim=pass header.d=bitmer.com header.i=@bitmer.com header.a=rsa-sha256 header.s=default header.b=LSAGin4H;
	arc=none smtp.remote-ip=31.217.193.162
Received: from wp23.hostingpalvelu.fi (wp23.hostingpalvelu.fi [31.217.193.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344DA606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:12:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 344DA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitmer.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitmer.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bitmer.com header.i=@bitmer.com header.a=rsa-sha256 header.s=default header.b=LSAGin4H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitmer.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PKAJlPULgSNwpVMPDAkMM1KzSZqRI2YIU66I+onRyDY=; b=LSAGin4Hx1HLmgg3FProD5TvSi
	JJjiEyRkY1z8aQ/6tXNW504kGqqk+k5dfwNHD0U6m3es3TLUcU3qRp5/uhh9TAVzysj88J/peEysx
	CfxtTk8Lgwl1S2e1rbsNxdboxEyXTpWNgTWvvfVQnHIcxeh/YS2sDoVJDJMv6R1fKEqNpIJYAwRYW
	fdvDIR6g01pAUzFrKpc1uQEwgnRBlf/cbTB60xIDyShqSBe8AulAmP21HI6fVye9U5v/dN/wQwLtY
	t59VizorgNka1eat2DjR3qzgR7lkJ49nj3BGOs3/esg5//NJFVO7xhLDlosk7rTdXiwvn4GANjXvK
	dj1PQWlQ==;
Received: from 91-155-183-156.elisa-laajakaista.fi ([91.155.183.156]:38068 helo=[192.168.0.14])
	by wp23.hostingpalvelu.fi with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.97.1)
	(envelope-from <jarkko.nikula@bitmer.com>)
	id 1xTObW-00000008Epg-02lP;
	Tue, 17 Nov 2026 20:12:30 +0100
Message-ID: <a8679a17-b4cb-49ab-86f0-af24d4b4f4cd@bitmer.com>
Date: Tue, 17 Nov 2026 21:12:25 +0200
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
Subject: Re: [PATCH 1/2] ASoC: ti: omap-mcbsp: Use all 8 bits of CLKGDV
To: Joseph Telaak <joseph@telaak.dev>, Sen Wang <sen@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261116-omap-mcbsp-tdm-slot-v1-0-6c9f7aa45a29@telaak.dev>
 <20261116-omap-mcbsp-tdm-slot-v1-1-6c9f7aa45a29@telaak.dev>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@bitmer.com>
In-Reply-To: <20261116-omap-mcbsp-tdm-slot-v1-1-6c9f7aa45a29@telaak.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Hostingpalvelu-MailScanner-Information: Please contact the ISP for more information
X-Hostingpalvelu-MailScanner-ID: 1xTObW-00000008Epg-02lP
X-Hostingpalvelu-MailScanner: Found to be clean
X-Hostingpalvelu-MailScanner-SpamCheck: not spam, SpamAssassin (score=0.711,
	required 5, ALL_TRUSTED -1.00, KAM_DMARC_QUARANTINE 1.50,
	KAM_DMARC_STATUS 0.01, KAM_MANYTO 0.20, TVD_RCVD_IP 0.00)
X-Hostingpalvelu-MailScanner-From: jarkko.nikula@bitmer.com
X-Spam-Flag: NO
X-AntiAbuse: Primary Hostname - wp23.hostingpalvelu.fi ; Original Domain - vger.kernel.org ; Sender Address Domain - bitmer.com

Hi

On 11/17/26 12:03 AM, Joseph Telaak wrote:
> CLKGDV is bits 7:0 of SRGR1, as its comment says and as set_clkdiv()
> intends with CLKGDV(0xff), but the macro masks the value with 0x7f, so
> a divider above 128 is written modulo 128.
>
> Mask with 0xff. The only set_clkdiv() user, omap3pandora, divides by 8,
> so nothing changes for it; this lets the set_tdm_slot() support that
> follows use dividers up to 256.
>
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>
> ---
>   sound/soc/ti/omap-mcbsp-priv.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/ti/omap-mcbsp-priv.h b/sound/soc/ti/omap-mcbsp-priv.h
> index da519ea1f303..324c5d7d431d 100644
> --- a/sound/soc/ti/omap-mcbsp-priv.h
> +++ b/sound/soc/ti/omap-mcbsp-priv.h
> @@ -136,7 +136,7 @@ enum {
>   #define XPHASE			BIT(15)
>   
>   /************************* McBSP SRGR1 bit definitions ************************/
> -#define CLKGDV(value)		((value) & 0x7f)		/* Bits 0:7 */
> +#define CLKGDV(value)		((value) & 0xff)		/* Bits 0:7 */
>   #define FWID(value)		(((value) & 0xff) << 8)	/* Bits 8:15 */
Nice, this has been unnoticed since 2012.

Acked-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
