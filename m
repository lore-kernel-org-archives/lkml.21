Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560028;
	b=5NGfqIyR3yshsOvHeXnyM0yFs5ko6uSbFl6PASgxRRy+VCAVBtESkEzs4MHp4UWJz5si
	 jlZbHQMPRsm/E5D8eJQ9Dr0bj7Ijdyxm1Tknj00Uny/x3+QwoneTdUVOT2RqSw4T/p/RM
	 hShIb9InfWLr24JLpzbdWbVAGaeZERGpgY9xbfPZ0RaUWecyXNy6wXlakHokIKeTytAC6
	 VdNPca4p60Br+ZLU1tlP4N/3Z3Y3nXMQwEpsEJYU/NIFd9H4KDSZNxKDrKwbdfBTxBQV0
	 hALYw2yK3OCgsqy4MpaTbVoJaa1cxdlPDoVGFKLCMpR5i4ub1WuQdfzHVOv8cF0pUVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=JOCmGA8B2Uq2+zJvRdES8SJMT4yxwQscY2TEqlok9v8=;
	b=auqCrR2CVgrDgrGTqpXCQNl1g5ZaOJDB4xNPnO20n00HzDxGBqrHiv7J/VPaafjcTDDh
	 WCCtrd7jc8DznFnR9p9BAMh+7AbmO4sp6dwrKw8pqHqO0W7uNg/Al0vAWXMrkrOnXvhsC
	 q4eaWOZ0rwO8ysKMJErffcUxHskLcrFOAgYKntOC3h3AnPXBlmKEJWW9+75xeQojE0PGM
	 RTOSlKQMrsVPsWo2j3bazKd1nMfNyfSBLN2HaRPv/WqFIRnXl8W5/vRrVXp+wLJ/sy9HY
	 2FFSaeiIRfa+1A9tFJPaHJkecgoSGHq9h2r+6+AggLDgZStlAoWEIpHT4FUcSc+797w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r7v6WinU;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD1B606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFD1B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r7v6WinU
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-497614c95f0so2885001f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795560026; x=1796164826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JOCmGA8B2Uq2+zJvRdES8SJMT4yxwQscY2TEqlok9v8=;
        b=r7v6WinUGeszRtkezT8nV0OpkmQgAlO4t/Ibf501kbCTo/8E+GKetj06QTOMER3U5s
         SA+CG69s0yLb4+xw+xht5D18dC+Am7pihj5SF1FkQJVm08VQAJAil44npdi+zbbW7+mk
         eR/JCCvpx8PCuRy1YevgOn6QVYr+2i/eXykSGfWm8tAxA2MCGtdPVJCDKxXf6dsjQ8rd
         K8hj5VzdozXuKqDXK8ln4LAoqYds8FXQWMcE1GsKS66IR7+k3574QvbutwQjIMbLKJ6I
         6TwiyYli6edRu6mZH14diI/7/jRD8odHiTmp2CxJU8POl0elMOnDvFAJs9f1AuW7DDwH
         77nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560026; x=1796164826;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JOCmGA8B2Uq2+zJvRdES8SJMT4yxwQscY2TEqlok9v8=;
        b=W6tnM7e1dc9hRmXPTAZ/HYeo+rTJ1F6FZ8EnDAMrrJdWVFhgcdeuBKXE1eVD+WKWZy
         UKUtZZS7rQq84Mfn3dgsVM8wqogwHRv28YYfjqGojY0vEL2rP4UN+xBf75E4UqlMJ633
         o7JtdDajj/VTvFXkIJdDJVckdt2J7wf2afdP7nrxaBdDc40tAQ2kuB9h6IRVhCxRELTi
         I7mOGZUtszoxA9kRMYMPe9ORqV8ybhatRe974XudANBQCi7ducIy3iwpPBpTuy0D+in6
         sd2Mx6q/1DLR2zUZNTsHKZh9HP3ZFdrBzSG0rvhcuUs6lCQnRfeNpn3Ci4fXi00wtY7+
         BjWA==
X-Forwarded-Encrypted: i=1; AL+hErFP4RTaVZzINd7Dh9tb0nVwuZLFnaeMxXoeJrj85JLryE8rBxmiaticgu7kTWEczg/8glVXtLhFEjCCxW4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Fuyp7ITINmBQ+EQOf43T8ux+9gjqYRJK9tRXicI2bixM+3Sla
	ZaysIsli4oN4nzM1U4d8OniLwqaRatFPOL9lJ/towGFf2ltfJTY+P8s/
X-Gm-Gg: AZFdTZeUjADdiMGjYaawkB++dF0l0o3IJmZFYM2u8QGjJ8RicFGekEzJOaIou5FX9ul
	929QTG2zGuk9mFqsyrAsosiDJwaNewgZXbPsQpCSL6aBoGDYU7UgwAbXk+8uHzXGAcoDkvXBXw6
	tq+5Y+o0ya4cbpHM7eCtsUfrG7FRot57Rn3WHJU9NrmVfsGKIFOvbx5BOs1vHZwSePwjSmeqBDo
	O/SwDdWjZVj8ZIFGh7ohGN7mrIZ+1FHGzTGLpTdv4+QLtMPcIeeml9dDYc69SItwTfIH+cSIiY0
	0FiqFOYTYk2XEU8GYnbHEEQuBUH+9h+9l5egQotsS53VZZ04vtuejxALJbK01uVFXyHPqD6bwWg
	vkqUxnzB+rCEnDMphgiOAva8YJMONCrPRVhLLQ10L0Eu/3AOFV2ONSKbDwVBILs1vdVTLRdzGYL
	WPPV4QlLd9zU6u0GG9G0+Nk5Fr81GtgtAGd81YEDaEeTJUmItAiX3o4sDIl6yON4+iMwA8UxIpB
	DoarOVdwZnjqpSo5ULk5Q60cPJPAFQ5mcxu5XZwjvlBhIy+VR1cB2IlJ7soW6L9YyymIOdSUjdA
	czTAhvr9A3JDvMH7VGRW1GjjhQ8CfsQxecjZe6g=
X-Received: by 2002:a05:6000:3107:b0:4aa:1ae2:ff2a with SMTP id ffacd0b85a97d-4abaa977260mr38417929f8f.2.1795560025876;
        Tue, 24 Nov 2026 14:40:25 -0800 (PST)
Received: from [10.86.0.4] ([185.13.181.2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm30861494f8f.44.2026.11.24.14.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 14:40:25 -0800 (PST)
Message-ID: <9e637227-030e-46a5-9a95-91956e5219af@gmail.com>
Date: Tue, 24 Nov 2026 23:40:25 +0100
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
Subject: Re: [PATCH net v3] ipv6: fix ioam6_id_wide sysctl on 32-bit
 architectures
To: Shashank Mohan Jain <jain.sm@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Joel Granados
 <joel.granados@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261123023036.88754-1-jain.sm@gmail.com>
Content-Language: en-US
From: Justin Iurman <justin.iurman@gmail.com>
In-Reply-To: <20261123023036.88754-1-jain.sm@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 03:30, Shashank Mohan Jain wrote:
> net.ipv6.ioam6_id_wide stores a u64 (netns_sysctl_ipv6.ioam6_id_wide),
> but its table entry uses proc_doulongvec_minmax() with .maxlen =
> sizeof(u64) and .extra2 pointing at a u64. On 32-bit, unsigned long is
> 4 bytes, so the handler treats the field as a vector of two 32-bit
> values and reads the u64 max through an unsigned long pointer:
> 
>   - reading prints two numbers ("4294967295 16777215" by default on
>     little-endian);
>   - writing one value only replaces one half of the u64: on
>     little-endian "echo 5 >" leaves 0x00ffffff00000005; on big-endian it
>     sets the upper half, and the range check uses the upper word of
>     ioam6_id_wide_max (0x00ffffff).
> 
> The wide namespace ID emitted in IOAM trace data is then not the
> configured value. Same class of issue as commit 162cf592b577
> ("net/smc: fix limit_smc_hs sysctl on big-endian architecture").
> 
> There is no u64 variant of proc_doulongvec_minmax(), so add a small
> local handler. On 64-bit it calls proc_doulongvec_minmax() as before,
> so nothing changes there. On 32-bit it goes through proc_dostring() and
> kstrtou64(): it reads and writes one value, parses it with base 0
> (decimal, hex or octal), accepts surrounding white space, and returns
> -EINVAL for a value above IOAM6_DEFAULT_ID_WIDE, for a write of only
> "\n", and for a write of 24 bytes or more. A generic u64 helper in
> kernel/sysctl.c would be a larger change for net and stable; it can
> follow in net-next.
> 
> The 32-bit parser is not identical to proc_doulongvec_minmax() for
> unusual input: a second value after a space is rejected rather than
> ignored, and a leading "+" is accepted. As the sysctl did not work on
> 32-bit before, this only affects input that was already broken there.
> 
> The bug was discovered by an AI coding agent (Claude Code) reading the
> code. It was confirmed and the fix tested on i386 and x86_64 kernels
> under QEMU, with a small static test program as init: before the fix,
> i386 reads "4294967295 16777215", and after "echo 5" it reads
> "5 16777215". With the fix, i386 reads and writes a single 64-bit value,
> and x86_64 behaves exactly as before. No kernel change was needed to
> reproduce it.
> 
> Fixes: 9ee11f0fff20 ("ipv6: ioam: Data plane support for Pre-allocated Trace")
> Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
> ---
> v3:
>   - Keep proc_doulongvec_minmax() on 64-bit, so 64-bit parsing does not
>     change at all; the string based parser is used on 32-bit only
>     (Sashiko review of v2 listed several 64-bit parsing differences).
>   - Set .procname in the temporary table, so the sysctl write warning
>     names ioam6_id_wide (Sashiko review of v2).
> v2: https://lore.kernel.org/netdev/20261122013848.14287-1-jain.sm@gmail.com/
>   - Keep -EINVAL for a write of only "\n", as before; a continued write
>     at a non-zero offset in strict mode is still ignored (Justin Iurman).
>   - Changelog: describe how the bug was found and how the fix was tested
>     in plain English, instead of an Assisted-by tag.
>   - Cc the sysctl maintainers.
> v1: https://lore.kernel.org/netdev/20261118042958.83243-1-jain.sm@gmail.com/
> 
> Prepared with Claude Code (Anthropic), model Claude Opus 5.5
> (claude-opus-5-5).
> 
> Tested on net.git main af6737b90668: x86_64 and i386 defconfig builds,
> plus a build-only 32-bit big-endian powerpc (pmac32_defconfig). W=1
> shows no warnings for sysctl_net_ipv6.o before or after.
> Under QEMU (TCG) with a small static test program as init, x86_64 gives
> exactly the same output as the unpatched kernel for every case. i386
> reads and writes one 64-bit value, with the same results as v2. With
> sysctl_writes_strict=0, the "file position was not 0" warning names
> ioam6_id_wide on i386, as it does on x86_64.
> The big-endian kernel was built only, not run.
> 
> I did not add Cc: stable; please add it if you think it fits.
> 
>   net/ipv6/sysctl_net_ipv6.c | 49 +++++++++++++++++++++++++++++++++++++-
>   1 file changed, 48 insertions(+), 1 deletion(-)
> 
> diff --git a/net/ipv6/sysctl_net_ipv6.c b/net/ipv6/sysctl_net_ipv6.c
> index 1a0a36dcda..c93ccf7e98 100644
> --- a/net/ipv6/sysctl_net_ipv6.c
> +++ b/net/ipv6/sysctl_net_ipv6.c
> @@ -30,6 +30,53 @@ static u32 rt6_multipath_hash_fields_all_mask =
>   static u32 ioam6_id_max = IOAM6_DEFAULT_ID;
>   static u64 ioam6_id_wide_max = IOAM6_DEFAULT_ID_WIDE;
>   
> +/* unsigned long is 32-bit on some arches, so handle the u64 here */
> +static int proc_ioam6_id_wide(const struct ctl_table *table, int write,
> +			      void *buffer, size_t *lenp, loff_t *ppos)
> +{
> +	u64 *valp = table->data;
> +	char buf[24] = "";
> +	const struct ctl_table tmp = {
> +		.procname	= table->procname,
> +		.data		= buf,
> +		.maxlen		= sizeof(buf),
> +	};
> +	loff_t pos = *ppos;
> +	u64 val;
> +	int ret;
> +
> +	/* on 64-bit, unsigned long is a u64: keep the generic handler */
> +	if (IS_ENABLED(CONFIG_64BIT))
> +		return proc_doulongvec_minmax(table, write, buffer, lenp, ppos);
> +
> +	if (!write) {
> +		snprintf(buf, sizeof(buf), "%llu", READ_ONCE(*valp));
> +		return proc_dostring(&tmp, write, buffer, lenp, ppos);
> +	}
> +
> +	/* an empty write changes nothing, as with proc_doulongvec_minmax() */
> +	if (!*lenp)
> +		return 0;
> +
> +	/* reject what may not fit in buf, proc_dostring() would truncate it */
> +	if (*lenp >= sizeof(buf))
> +		return -EINVAL;
> +
> +	ret = proc_dostring(&tmp, write, buffer, lenp, ppos);
> +	if (ret)
> +		return ret;
> +
> +	/* a lone "\n" is invalid, a continued write in strict mode is ignored */
> +	if (!buf[0])
> +		return pos ? 0 : -EINVAL;
> +
> +	if (kstrtou64(strim(buf), 0, &val) || val > ioam6_id_wide_max)
> +		return -EINVAL;
> +
> +	WRITE_ONCE(*valp, val);
> +	return 0;
> +}
> +
>   static int proc_rt6_multipath_hash_policy(const struct ctl_table *table, int write,
>   					  void *buffer, size_t *lenp, loff_t *ppos)
>   {
> @@ -210,7 +257,7 @@ static const struct ctl_table ipv6_table_template[] = {
>   		.data		= &init_net.ipv6.sysctl.ioam6_id_wide,
>   		.maxlen		= sizeof(u64),
>   		.mode		= 0644,
> -		.proc_handler	= proc_doulongvec_minmax,
> +		.proc_handler	= proc_ioam6_id_wide,
>   		.extra2		= &ioam6_id_wide_max,
>   	},
>   };

Reviewed-by: Justin Iurman <justin.iurman@gmail.com>
