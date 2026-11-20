Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795200927;
	b=MH7TlkoQzyofXl9XJ+byrL5Svvau9i6LQUu2lfSsqd4NnHR5dNdGtbrIJnqTnOF7toT9
	 U5VDWMoYqT8wh+uMQuS3IZoMpCjbr8hDirCbHIFbJ0AH81XZZPPV5XLB+lGF5ldvzzjyr
	 vAeAgBwzefrDF6qEg2wr7fp9u16ZlYtFa5UtMLI+pUgvx1g88cgYWq/XhSVUIPtwXW2k2
	 XY0HIWmioZiyf/yRGCdfiAAzNaTrFi9Bez6G0FBjhNOm7YecDFP079CiRgiqsk51l2uaX
	 RN9XUbP89hHIWwh3c5RMAS00k1d7ATvvdyHyZxInF5CbgLbFF44mfMqKuv/HY8rutWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795200927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Wuk00b9eLmhHzHLvGG3EJliaZoNXCpQANQ1QWK+whx4=;
	b=TPSye7o9iThnB5qNVVM1CHsVucdNMfOmHvLCK2obcVszjUegq3vLSrLalhN8HESRyRgA
	 RFf2k0S7Z5Kx00eXIYl2fkZOePnDevBqze1EepEZS7w09qoJHdVcfNVu/gUWakbj3Crxu
	 8M1z2ubTmUopTm/2nrNNPZMbyuBuRsZ8bJpnfx+Ki992GcL9hGiGIdkhoKlhAhMhdeTyb
	 /F9n4vo/MhF3Xhcli5PRI3MfD45gzWOcGs7aCFjpLBl16Lh5g6x8lp7R4PIH9g/NW9rAa
	 h/Yj4WNC9sje50+6m/ZTrouvBMHdyvKGQj+E3Wcv7qNPpPI3ukFr1lgrjSrhSlff+Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sUUT+0Xr;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D0660A2611
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:55:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9D0660A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sUUT+0Xr
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a210470b49so11487775e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795200915; x=1795805715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wuk00b9eLmhHzHLvGG3EJliaZoNXCpQANQ1QWK+whx4=;
        b=sUUT+0Xr9xTEoMZOJHO/iXeSHe5Kpr2fL5S9hSf1mpS43sA4UGgmP0Kua/SBqbOSUL
         wYjkW+b/mf9EFLxxG85+v4pWM9q6A8vBW6b8kFIk2AYzGRS0o3LpOnjdNBLQZoiCj8xl
         MGECZ0Ea7MobZpTyIsIYtMwLjrtVJ3ISlrwc/DlORT3BqKVGOYsIotZ/c8zT3N3+98pO
         TVGDL9UpqI1FB0ZkKx0rnDKECDVFEBld8sHYuona7Zrwo9sAqrlOt9r6c99TK/24OSpd
         qxwKhwH+vw3OabttLiXM6ESAomMLoGaGFuRTsBmmC6r7lItmWVx/3enXG/DGKDBmXslQ
         4iIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795200915; x=1795805715;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wuk00b9eLmhHzHLvGG3EJliaZoNXCpQANQ1QWK+whx4=;
        b=z25eUKGocm3OJZrOaWgrKHTgN52g5Z8JuG1xih8aPyVFG9kSOxIaY0w/Jv40Hlc2SJ
         NpBxZspC72oJBTJkn3qJvXgQTi+P5v/6g9D3WKQPheSjEaDLFPXDMRqDEzc0we0OH0ce
         mmCT1QpChn9lsqYCEs1emZ4Z84OiIt5/K/D0Vy/5KfWsWG9w/wbT/iGfiUTOSQYHSQRf
         8vZBM1R+ovmjIT0BC/g/1rrqQh4CSKat6IdkklG+d9MdgbUUFcqGFBJy+Rl/0Gm5Y3RF
         aK6WtuTAc7CXsR6U9lTmjWi4bX3SmJhfSktr+3XuYndjr5U57r7goUbGOV41O2U41YL+
         s29Q==
X-Forwarded-Encrypted: i=1; AL+hErEsOerPii7CZftMkWbHEydLlrBhgNHjr8ippy73GZkL7ptBDXNX40/yZnNrTmVOPf41X14Oxbnq3F7hAVQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NgJDJmSDyyawmJuA3S+mI/Oo5c1EF+LMLmmyJLnbWZOq96plG
	eOSYUo6aYF8GYkO7Lbq4sc5X1mVmx0QPBP8k4LiiAF9z0pw/7omd8Owm
X-Gm-Gg: AYBFou09+nOB4dDaHzqzc3g3XBNITF/fuQa11Ei9j9x9NyisLu2UKpg64a+BL63oh7p
	/sFiESdsZ5lWnLVRqxtqa29idkvvjviA955jNRsjw5jR2r4kzh14HM1xbHL3GrrLPv2EdXP2cMS
	hZvinTvUYxUUb+HWaAFFu6U4NvOAvgZQ/l9+680Wu36YvXkwpWkA/RFrXm0woOKZkHthudNQsAs
	7XVeJo+USSFMzdEz9uoQVmKbpwK6Sn78Mf0hZW+MC3qYi2Q449SHTSomsfJdDpttiPWIa4guUgo
	nTZXyHyNY1o6Ub5rlf/BTMlohxXHflzoVQuC+mZf1HnS6pg4wH5vOcm7CrJQWp31gXNKHAC9TcZ
	PLcU1ftejNePkSirrrtVD6EjRLNgT7tS2bnhZ6yLppxMfy9J1UwJPAzdLw/pRp/abQxwXJxMP0u
	28D+5ghFMSO3Xc6R0xlnt8bXzPqtD5eeHFe8Wx5FcrRUrBW/ITqsORWLNT9OFC0q++wmTwF4f6W
	6mJ+ncYrWlrxvgcePHJwkEOfGBKLyyhT6bIL5hIe8yik08uxQBg8UD0EeBPwyzryABk/I89MRrP
	tpv3dDSOgV6UWOaHI7pvKGZgjQtxML4y8rFRSNARTfzfvWascIpBy+fbbUOU3kjMCg==
X-Received: by 2002:a05:600c:6708:b0:4ba:7e6:53d6 with SMTP id 5b1f17b1804b1-4bb88940848mr77734805e9.33.1795200914798;
        Fri, 20 Nov 2026 10:55:14 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm173162855e9.0.2026.11.20.10.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:55:14 -0800 (PST)
Date: Fri, 20 Nov 2026 18:55:13 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Usama Arif <usama.arif@linux.dev>
Cc: tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, kees@kernel.org,
 hpa@zytor.com, gustavoars@kernel.org, ardb@kernel.org, hca@linux.ibm.com,
 nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
 justinstitt@google.com, linux-hardening@vger.kernel.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org, riel@surriel.com,
 shakeel.butt@linux.dev, kernel-team@meta.com, rkeilty@meta.com,
 atish.patra@linux.dev, dgreid@meta.com
Subject: Re: [PATCH 2/2] x86/kstack_erase: Use REP STOSQ for large stack
 fills
Message-ID: <20261120185513.0445f0b1@pumpkin>
In-Reply-To: <20261119213147.1094488-3-usama.arif@linux.dev>
References: <20261119213147.1094488-1-usama.arif@linux.dev>
	<20261119213147.1094488-3-usama.arif@linux.dev>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 19 Nov 2026 13:31:08 -0800
Usama Arif <usama.arif@linux.dev> wrote:

> With KSTACK_ERASE, every return to user space poisons the part of the
> task stack that was used since the previous return. The generic
> __stackleak_poison() does that one word per loop iteration, so a syscall
> that went 1-2 KiB deep pays for 128-256 separate stores. On Meta hosts
> running many small VMs, stackleak_erase() accounts for about 1.5% of
> non-idle host kernel cycles.
> 
> Override __stackleak_poison() on x86-64, as s390 already does, through
> the hook added by commit 491a78663e03 ("stackleak: allow to specify arch
> specific stackleak poison function"). Fill spans larger than 512 bytes
> with REP STOSQ and keep the word loop for shorter ones, where the fixed
> startup cost of REP STOSQ does not pay off. REP STOSQ starts to win at
> about 300-400 bytes on Zen 5c and Cooper Lake, so on both no span gets
> slower.

As a matter of interest (and separately from the exact code) how did you
measure the performance to get the 300-400 byte gain point?

If the count is variable - likely in real life, you'll get a branch
misprediction penalty (about 20 clocks on zen5) every time you change
between the two choices.
The copy loop will have another mispredict penalty for the loop itself.

So you are likely to get an overall improvement if you use 'rep stos'
for all lengths - even the ones for with it is slightly slower.
Unless, that is, you know at compile time that most of the length
will be short.

David

> 
> The fill is inline asm, so the noinstr function still makes no calls.
> memset64() would be the same instruction, but it is only static inline,
> and with KMSAN it is an out-of-line function.
> 
> In a Zen 5c KVM guest, stackleak_erase() got about 35% cheaper per return
> to user space (71 ns to 46 ns, scan included) over a futex, epoll, procfs
> and Unix socket syscall mix. Same-vCPU futex wake/wait and Unix socket
> sendmsg()/recvmsg() ping-pong round trips got 5-8% faster.
> 
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> ---
>  arch/x86/include/asm/processor.h | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
> index 77488ff5eb8c7c..049231d484ad0e 100644
> --- a/arch/x86/include/asm/processor.h
> +++ b/arch/x86/include/asm/processor.h
> @@ -580,6 +580,31 @@ static __always_inline bool on_thread_stack(void)
>  			       current_stack_pointer) < THREAD_SIZE;
>  }
>  
> +#ifdef CONFIG_X86_64
> +#define __stackleak_poison __stackleak_poison
> +static __always_inline void __stackleak_poison(unsigned long erase_low,
> +					       unsigned long erase_high,
> +					       unsigned long poison)
> +{
> +	unsigned long count;
> +
> +	/* Short spans do not amortize the startup cost of REP STOSQ. */
> +	if (erase_high <= erase_low + 512) {
> +		while (erase_low < erase_high) {
> +			*(unsigned long *)erase_low = poison;
> +			erase_low += sizeof(unsigned long);
> +		}
> +		return;
> +	}
> +
> +	count = (erase_high - erase_low) / sizeof(unsigned long);
> +	asm volatile("rep stosq"
> +		     : "+D" (erase_low), "+c" (count)
> +		     : "a" (poison)
> +		     : "memory");
> +}
> +#endif
> +
>  #ifdef CONFIG_PARAVIRT_XXL
>  #include <asm/paravirt.h>
>  #else

