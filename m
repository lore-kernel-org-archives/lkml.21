Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795873134;
	b=c1MJ0uPzz8EFea/SEukVt8FZVV0Fvq9QrCyo+GMsKyD4aC9gODUAdbQOBLIXtwJPOJWO
	 PNwoYFdVBjqj44/J3WMkvUzlYR42CpxmbnaLIBDqDO1s+Jgm7hM20c1VWN5jMUTPitK1N
	 f3+sGz62itBPyv3FnE8sA+As03iVFSNc2h67E5bOeOFBps8yKhaiiG+7/ukvXK5fRHogP
	 q8euiykGpGHu2Nb3Iu8lVgdVSyhbA96Q6QirV2EZqQ9YuZuYcincTEYPajP72en5ZPpyB
	 4NoqDAZ2LyA7Fne6nVuuCx78icKj9BliZRhu3sZtODfTf+wGCJF/TFMG91M1fwr3YHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795873134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dCmAGX2Omd/g9y7jDZCpeWTJ9I+W1z7gL0oCYL7gw10=;
	b=ryxLQvkOjh1rC3p0xBug6Gc97T2fjYd2q6M0+QVbNLigwBteSLDCDnWyFsEVdWNW8y/1
	 1Pccsf418aaUzEQmrbA3R1tlmzVV83aW2UZezxLbV2MWjqBaFxwY1P5FmCDGqq/6gPzWo
	 rSe7HcUzWcTzKArmrIMZQDgt4mGZA1vRJsYeu9JN25taLzaZzuxGPcXY3pQS6qMAZrpE8
	 3J9xuKhldQ657IyJYibGkxelv2JZ2dn5wZiOR+EQQBkk7SySdz26HIjO2jpst/L+k4aay
	 5d9366FhULz8Ca7zcweCeJgZ64WMArq1Q20wmzlHZX9dv6IjtpxJet0dMBPKnPdHm2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wTyeE1UY;
	arc=none smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14878606A323
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 13:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14878606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wTyeE1UY
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3adfed9a887so81548651fa.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 05:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795873132; x=1796477932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dCmAGX2Omd/g9y7jDZCpeWTJ9I+W1z7gL0oCYL7gw10=;
        b=wTyeE1UYXKFFlRlLAUJLkr9C9/Brmuh5IhKjiX+lPzzs+/9twKhj5S3a4LKPpGRO1R
         Z2KoeptxVlTXvErSql4Wy15JF/SLVpFMKE3Tj9EUe6EQhCTaBdAZKXYuA6NVcvs/TPa0
         Qonbh/BnIA+78Piovo5I7+tHAke7nbjedz8z0p8bN8hdosjDNMQR9HylVUq+qa6g9rxE
         hp2CX8u+SswX1VCZhDsVuBkYmC5Sh4ktO4nsAWbzXUuBQKmjxmqnJHPn5cEQB9AlR/ZP
         vDK9sEvN9TUdDS84TIyfSlMdsXwGKBS2IG8Jh7QSnZPqoFUCIk77zqz4WPa+L0yWaCgr
         0XBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795873132; x=1796477932;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCmAGX2Omd/g9y7jDZCpeWTJ9I+W1z7gL0oCYL7gw10=;
        b=vswltc6skIIMz2KScb37SIaR8f1p2fQotJ3itsFY9TgHz29HRF8BBJfdTBLaP0JQR7
         /n37E53+67vjCKkDJZX6cEdyEi55F1adB22/Vyya+/y+oec/FOB898FaLrLXGefFJT35
         bQJl/S7pwljJIsIpJXNCjQ1D2AzmCTYFYFJSImQ74wPbx2MAyxgtfpHGTl9Gzms3B1Mf
         x6bj4XA+C01MjOlBmDSMQzYKoWtSaXoi3d6dnWRxCwyzYYyXivae/fcals555UXtEEq0
         WIB4IZ0Q1yHmPoymGDjpm8otFHOi/MKBS6uI/4InhyD9HI3QSyryP2aJ838nPCbNHfKY
         yueA==
X-Forwarded-Encrypted: i=1; AL+hErFata2MQDoDbpEVs3eNdJ3ytPntS1mofnuXtxcSSgpwKr+yD1r0w4cOJ/6aVmf5f8GExh9mYMpyVe278b8=@vger.kernel.org
X-Gm-Message-State: APuU4Z95StduJjuRUQ7rkS360+ceBWIatuLvhtzFBQxek2jQzxd5cuSf
	sS7UGn3a/ilpphAhzNWDw1WITmtp3FBrb5YPHgfgwP3IuOKEU4652wS0
X-Gm-Gg: AZFdTZfPTtrR67kCSbmPaWUPhPWNqR0Y8HPMSnGfMnhBS4xlT0nWbw04U/WFQ5wGfl+
	gL51/6gFyNOrgBsHF6qvs+1+zPtdLGctimfmlUMHUpVjcfN746DCxmtsTa9/5dhG62w2CHOTKAQ
	cE7WcfdvB2eT/UfDuEykhYUL7Pmdn8m0eFBhLJ/x+ULNh8sYaTBxwqZ61wBcgzVbJUl2Pyp5ETu
	lANEqV6DtRTgU6PP3ae4/z/4l+6sT4cb2+BvajnFidz+LxX3gS77FrRDsjhUN72khVkQy9Ej/65
	2qMKBdfSut5fmvDr7n9SuDhjNi93xle2RD3TB5BPlwC9rskpeWHIRGSvRP5lJWz6gggph2BCIZF
	34vkhe2jzhje11ZBPqIMNO1pPSKIB+3Lp/O7/NzjyYF0cNUwjRBGqauMDyFcJTSNQrYP0ROz/Xs
	osK8oi8Gw5wbNKHmzI4S+Flf7TmLRfU6jIfgXdUjSGQCzoZu6bssokN4ZjL4UlmGgVjlPWhd8qY
	frG2zn364ebLwEpXuJKhgpZL+XYRf5veRK2/FhzZef0EmjSYU4TuvjcyJ7h75XBVFtOs3KjjF7Q
	G65MRSbsI6NB26J3KX2SWN0+tILXSndVOqH4s9l4z0sy
X-Received: by 2002:a05:6512:3b89:b0:5c3:3dfd:c4e8 with SMTP id 2adb3069b0e04-5c33dfdc807mr1617419e87.2.1795873131953;
        Sat, 28 Nov 2026 05:38:51 -0800 (PST)
Received: from [10.127.127.83] ([5.195.0.145])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff8b82sm6968991e87.16.2026.11.28.05.38.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Nov 2026 05:38:50 -0800 (PST)
Message-ID: <2528005e-67b5-4e23-a357-fbf853c2ff38@gmail.com>
Date: Sat, 28 Nov 2026 17:38:44 +0400
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
Subject: Re: [PATCH 10/12] clk: samsung: exynos8895: Terminate PLL rate tables
 with sentinels
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 Danilo Krummrich <dakr@kernel.org>, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20261127180416.3277544-1-lee@kernel.org>
 <20261127180416.3277544-11-lee@kernel.org>
Content-Language: en-US
From: ivaylo ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20261127180416.3277544-11-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/26 22:03, Lee Jones wrote:
> _samsung_clk_register_pll() sizes each PLL rate table by scanning until
> it encounters an entry with .rate == 0, then copies the counted entries
> into pll->rate_table.  However, pll_shared0_rate_table,
> pll_shared1_rate_table, pll_shared2_rate_table, pll_shared3_rate_table,
> and pll_shared4_rate_table all omit a terminating zero sentinel, causing
> out-of-bounds reads into adjacent read-only data and populating
> pll->rate_table with bogus entries.
>
> Append a sentinel entry to each of the 5 PLL rate tables.
>
> Fixes: 9174fac3b302 ("clk: samsung: Introduce Exynos8895 clock driver")

Looks good to me. Thanks, nice catch!

Reviewed-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>   drivers/clk/samsung/clk-exynos8895.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/drivers/clk/samsung/clk-exynos8895.c b/drivers/clk/samsung/clk-exynos8895.c
> index 259481c4276e..daf337f47e4f 100644
> --- a/drivers/clk/samsung/clk-exynos8895.c
> +++ b/drivers/clk/samsung/clk-exynos8895.c
> @@ -478,22 +478,27 @@ static const unsigned long top_clk_regs[] __initconst = {
>   
>   static const struct samsung_pll_rate_table pll_shared0_rate_table[] __initconst = {
>   	PLL_35XX_RATE(26 * MHZ, 2132000000U, 328, 4, 0),
> +	{ /* sentinel */ }
>   };
>   

...

Best regards,
Ivaylo
