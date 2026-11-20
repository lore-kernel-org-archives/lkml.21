Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207322;
	b=IX7ZPq0g0wkPz4uoHKbkZujdv/cNoF2bPVPu9b1YkN/7RUIUU2BdNVHi+EjBSNrfhgXz
	 NV9+LJiGpBnATMtis1pIAj8hwyJqcP1eID9LA/YThsqn0cS4xe7sVbxyajICrNtYAsUqB
	 MU8GxzaNnppncSfDaA2Cq+qoqhfNBnuKr4rnv69vydTRhSX9JxMd3+kretOyZi1x5gR0X
	 ctL3C6cCp5zhrjdo7olZSpfJhVo/vL0gEkFmuk2FCiYR1oACvUn6x0UbGGoNADb5vwSMM
	 SW/9vwMkspwI8Z6LcLHwxDj83wUehVaHPjcRYwKDxqA/1ceq8ljuBl5TpX6Fje+XCig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5QxBvONaph7bgEQd2yve9sMSGV8Ex3XSmsjoj7Q3FaE=;
	b=DGcQRS75xHspZzOe5f4d97cPvRUCbxZoVsVT/mjqCv/veN0Z8zU0Gn3iuTW//gzyAeaY
	 KhwWug413IVVdmIOkVo8A1V/EfiYncFVyMgDYniFNnoFH0lQjIEiuQKew2ZSHNZQOCM2m
	 8zAekR00GcxtEvrufzdcFbfn0Gg5X22BdXtV1zIoR5UQstgM+YF6TWVKvSPW3q3qJ/2H1
	 BwjLpPaTIZDpwU1bRBMtGGxZxI3vjNTk3fblImfe/Qkpclby6FguQIrjgEpX/T8glouB5
	 yBzGFuHzcDW8QMmg9txl24FY7FOayI62fcf0kei60nF8cvTk5FdvgNoHS2U37jsSrMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=Vl1HSM5D;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9E7606A6E8
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED9E7606A6E8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=Vl1HSM5D
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-862b3938d98so676284a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1795207317; x=1795812117; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5QxBvONaph7bgEQd2yve9sMSGV8Ex3XSmsjoj7Q3FaE=;
        b=Vl1HSM5Dg4a6MsPM4I93FkkgPRtjc3rWi3iATtBxbHp8Z4tHYt5JXwo9uspigYOcxu
         z/MeFF8aE4OfqsXT/npJlnN1NlT52TAgI0le4F3aEw6KDXZ1Wf7QWnqYPD47wOt75BZA
         MfAU2R20N+oMrvmqb8HYRH9jqlkY17mZzgQJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207317; x=1795812117;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5QxBvONaph7bgEQd2yve9sMSGV8Ex3XSmsjoj7Q3FaE=;
        b=GM/PLYKyerGHxhmS1o5hmIAAcC3crc4pHXxXNsFd4sXyzAjtR4RqKxRJOghNwD0kvb
         oxM7RR45J7NgDQ2rCeYAxop+awSW4iYV8ezLYkKfqrvFZHkdDLluUojS/rsdnSu41Tqt
         ofjIq1nCuTUUuf/m6+DPyQhT9CrYj7hG7uNtoeF8rlgb312xOC6bYXEC5HqxAmdwqSrM
         TrqpB2O1qXJ29P+FY0yHlu1LvYk41HL4jSCfsHSzc0b1HomI9l/6VGK33ee4amXmKT7V
         zDdrqFYcOKSHPjAXSLLcyf/iqOGYw3dYtx6D6pqD26yT576WIkU3LHmkWDg2XEIODELv
         ANqw==
X-Forwarded-Encrypted: i=1; AL+hErEoJHObqCWazfH5rKQHVC4hw8dZV6C4h0R8dXTbwx5qYOJTi1waDENrhXVoZfJNozVLkl5J0/jZQeKoSLI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+A84iHTB7WbuFekVdXUasF3wFLzuqqI5ARaPGVNHkflBT5gG0A
	y4CUBAFJjzQiYd92By4kI8xIT84dPj4I4BVdtXu45tK/KgR3nWBczKfvSiiVt6aem+I=
X-Gm-Gg: AYBFou0StQbvu23u7afpIiAyeDlUScKJYOzYfSmTsXlxMAidqxaJPfeo5XCG0Q+3UO7
	byQlph0AlTaqYv0zxv7JnrcOvBkLp9Qbf7eF757hLK6SAaccUYcxajXBSRE5DgoKmr+4AOhT10V
	6NvtvL1tGUWNAOO+Tzht480Wmn6+5gpLPJkTzcEtlH0Gj4Dt8ycLdndtuCntTXaSMZ4QbUCsPO6
	mH9kOoXDRHm12njO4dwuUq/I59t2DWNJyqSZkf3m4sGue7KUO7Pd+/G9OxmbXw/9j4Jzu2mR48P
	xdXLGqsVYc8Lu+m2x/4iZxPDksqrAEQTtv1D/oZjxmkv/EFC2NebPcIrgXbmndDsSHi8VKeXvUK
	wL6lBlplMUrGPChLLst3//ZPwSsTBxEZ540vyUY0xBm2VRbBCNXUsW/vBJlFNKRwuvH17/oChMB
	sTG5Wh0Yly5xQexsLTGQz8OWkEgB281JCKIa5sffYD/qH5Gm60ShsmBQ1ISF6eQAXaJcFlW3Lt1
	0I7vEqg1vguyyV2IuvKkrkQLG0DPKiqH5mQywpBT1Gq9/OB/Sx3gbUgZLHHVvda+W4fzgeDaLfC
	EtP903Q81JSvCVyh16G7soP81i+yeIJGEWOzsW0=
X-Received: by 2002:a05:6820:55da:20b0:71a:f228:3222 with SMTP id 006d021491bc7-71b3957e687mr3021698eaf.77.1795207316762;
        Fri, 20 Nov 2026 12:41:56 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dd6e7sm3198832a34.12.2026.11.20.12.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 12:41:55 -0800 (PST)
Message-ID: <69cde473-bd68-4bf5-be03-c68f411ec116@linuxfoundation.org>
Date: Fri, 20 Nov 2026 13:41:52 -0700
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
Subject: Re: [PATCH v3] cpupower: fix use-after-free and stale limits in
 frequency-set
To: Lukas Beckmann <lbckmnn@mailbox.org>, Thomas Renninger <trenn@suse.com>,
 Shuah Khan <shuah@kernel.org>, "John B. Wyatt IV" <jwyatt@redhat.com>,
 John Kacur <jkacur@redhat.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20261118-cpupower-freq-set-use-after-free-v3-1-3e021315b579@mailbox.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261118-cpupower-freq-set-use-after-free-v3-1-3e021315b579@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/26 13:06, Lukas Beckmann wrote:
> do_new_policy() directly fills the unset fields of new_pol from the
> current CPU's policy. This is problematic because do_new_policy() is
> called with the same new_pol for multiple CPUs by do_one_cpu() in the
> slow path. This results in stale values in new_pol being applied
> (starting from the second CPU that should be changed), and even a
> use-after-free (for the governor string).
> 
> Fix this by building the target policy from new_pol and the current
> policy in do_new_policy() instead of filling the missing values into
> new_pol.
> 
> Fixes: 7fe2f6399a84 ("cpupowerutils - cpufrequtils extended with quite some features")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lukas Beckmann <lbckmnn@mailbox.org>
> ---
> Testing and minimal reproducer:
> 
> Running the command
> 
>      ./cpupower frequency-set --max 2500MHz --min 2500MHz
> 
> with ASAN reports the use-after-free before, but not after the patch.
> 
> Run the following commands:
> 
>      # set CPU 0 to a different maximum than CPU 1
>      echo 2000000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
>      echo 3000000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
> 
>      # Change min and governor (but not max) of CPU 0 and 1
>      ./cpupower -c 0,1 frequency-set --min 1GHz -g performance
> 
>      # See if max got changed
>      cat /sys/devices/system/cpu/cpu[0,1]/cpufreq/scaling_max_freq
> 
> This shows that the stale maximum of CPU0 is used for CPU1 before the
> patch, but not after the patch.
> ---
> Changes in v3:
> - Keep the original if conditions (no functional change)
> - Link to v2: https://patch.msgid.link/20261115-cpupower-freq-set-use-after-free-v2-1-6b91f1630165@mailbox.org
> 
> Changes in v2:
> - use a shorter changelog and testing section
> - build temp_pol from new_pol and cur_pol instead of copying new_pol
> - Link to v1: https://patch.msgid.link/20261112-cpupower-freq-set-use-after-free-v1-1-4e0034927b3f@mailbox.org
> ---
>   tools/power/cpupower/utils/cpufreq-set.c | 17 ++++++++++++-----
>   1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/power/cpupower/utils/cpufreq-set.c b/tools/power/cpupower/utils/cpufreq-set.c
> index 06cd4b280132..0bbf303d3317 100644
> --- a/tools/power/cpupower/utils/cpufreq-set.c
> +++ b/tools/power/cpupower/utils/cpufreq-set.c
> @@ -141,9 +141,10 @@ static unsigned long string_to_frequency(const char *str)
>   	}
>   }
>   
> -static int do_new_policy(unsigned int cpu, struct cpufreq_policy *new_pol)
> +static int do_new_policy(unsigned int cpu, const struct cpufreq_policy *new_pol)

Why do you need the above change?

>   {
>   	struct cpufreq_policy *cur_pol = cpufreq_get_policy(cpu);
> +	struct cpufreq_policy temp_pol;
>   	int ret;
>   
>   	if (!cur_pol) {
> @@ -152,15 +153,21 @@ static int do_new_policy(unsigned int cpu, struct cpufreq_policy *new_pol)
>   	}
>   
>   	if (!new_pol->min)
> -		new_pol->min = cur_pol->min;
> +		temp_pol.min = cur_pol->min;
> +	else
> +		temp_pol.min = new_pol->min;
>   
>   	if (!new_pol->max)
> -		new_pol->max = cur_pol->max;
> +		temp_pol.max = cur_pol->max;
> +	else
> +		temp_pol.max = new_pol->max;
>   
>   	if (!new_pol->governor)
> -		new_pol->governor = cur_pol->governor;
> +		temp_pol.governor = cur_pol->governor;
> +	else
> +		temp_pol.governor = new_pol->governor;
>   
> -	ret = cpufreq_set_policy(cpu, new_pol);
> +	ret = cpufreq_set_policy(cpu, &temp_pol);
>   
>   	cpufreq_put_policy(cur_pol);
>   
> 
thanks,
-- Shuah
