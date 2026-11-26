Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686785;
	b=Q+tuII7ZRewwm2Auu+YqRDtyj4aH74LyD+FfY0ghFI3zJXJ/UArpIzbBbt/J216Jf+2+
	 M9TDW/+/gJAd/odhNgOpIUiiM0arzkwYI4su0UNrDS2BpwAEU9dbVSWX5hiqczi2v5MW4
	 25ESxoXjHa005vWQdumRr+bzRLfLI6gTq76S2PKJRnCXg9swKYlRiDKOtJrJ8CHn9lzzt
	 arG/sYZZaeikXfJutfYtRsH/ZpiOllwS7Wg6pZPavrN7QI6gbyRpkMJh/93GzKS4TBufY
	 LSmOqMENkTVhLdsG9hYpLxyZ3ijVdKmseJRjXkF9eqJGZGMFpKaF5y3qske/ooYzTqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686785;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=hxx4Z+PT5skip33hqlx+gbmYrQHS+Cj16Snp6bOMpEs=;
	b=0sEscQgKC8bQYOm2tmygQGI9I4xGpA68Jn4tvFhOq09h5xRzzOXqlH3KlrqPKHkgs/01
	 eBit13ZKExtWIO6RcuWEgPto08sq8Gd2x2npEx9CZiXbEE+2cCZaIsXd/jyrBC1SMbRiY
	 1VW3IaAehM0Bn3Zs0/G23YrZ3I8uKHDmE8i8l7jHSTVQud7yySmkpW3k28+M+/LUkopgx
	 Eqw7K5cpmvugEW05wFgN92yd1CLtdzvsWfPF90oWwWZiWENuR3n5Y9WN6zIleHse0OKL5
	 qJOmjqoZbh0K9K5cG8/f+a9Rj9eSkIu3jqkvvZEhO2tdZMKkrNVPRvnrNQoTQkzukEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=3Dcuhl4K;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=KmSOnaFz;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F077606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:53:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F077606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=3Dcuhl4K;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=KmSOnaFz
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795686782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hxx4Z+PT5skip33hqlx+gbmYrQHS+Cj16Snp6bOMpEs=;
	b=3Dcuhl4KQo7cCYyezdEUvreQRdKeyE1Tl6dXFDxwSGgQqZa1cFOLUU33PISwFslyKtQCru
	/jzHeo9iuOMfBxi+AETeDQGV7NWGYUEory3MklQVu4CKmOKn6ZCvkPq06PN1iXUWEhVTLi
	CeUJ/8BWKw/Dw2z2ofq7YgHU/FLisC8Xzt/aDLRqXz8AUeC4ZQIdgS2Ar0DzXKnfFtDcQ9
	f3afxGXxThS2w28CKNoXDXNj7E/Ar5p675NFqVwa3t3y6lSykqs7X93q604be7ctc/mb6I
	fQlAj6JTMO6n+R4AKedf6ii+Ovev4mLIdlEMAzr8Fg7jF5yiPs2GwXq7NUCdwA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795686782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hxx4Z+PT5skip33hqlx+gbmYrQHS+Cj16Snp6bOMpEs=;
	b=KmSOnaFz1wBt2a8kvzSbltPcy0Tb3+zK+dI1uU+I3Ey3s0OnMPpfda+QicPJA9B6V2mSaO
	BobrfoHpeMr/hVBw==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Ryan Roberts <ryan.roberts@arm.com>, Breno Leitao
 <leitao@debian.org>, printk@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH printk v4 4/8] printk: nbcon: Use @reason instead of
 global variable to check flush policy
In-Reply-To: <awW7AFsiUkhRWdqy@pathway.suse.cz>
References: <20261121163557.963029-1-john.ogness@linutronix.de>
 <20261121163557.963029-5-john.ogness@linutronix.de>
 <awW7AFsiUkhRWdqy@pathway.suse.cz>
Date: Thu, 26 Nov 2026 10:59:02 +0106
Message-ID: <87ld6f7wch.fsf@jogness.linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On 2026-11-24, Petr Mladek <pmladek@suse.com> wrote:
>> --- a/kernel/printk/nbcon.c
>> +++ b/kernel/printk/nbcon.c
>> @@ -1453,24 +1453,31 @@ enum nbcon_prio nbcon_get_default_prio(void)
>>  	return NBCON_PRIO_NORMAL;
>>  }
>>  
>> -/*
>> - * Track if it is allowed to perform unsafe hostile takeovers of console
>> - * ownership. When true, console drivers might perform unsafe actions while
>> - * printing. It is externally available via nbcon_allow_unsafe_takeover().
>> - */
>> -static bool panic_nbcon_allow_unsafe_takeover;
>> -
>>  /**
>>   * nbcon_allow_unsafe_takeover - Check if unsafe console takeovers are allowed
>> + *					for a specified console and reason
>>   *
>> - * Return:	True, when it is permitted to perform unsafe console printing
>> + * @con:	The console to check
>> + * @reason:	The reason for the unsafe takeover
>>   *
>> - * This is also used by console_is_usable() to determine if it is allowed to
>> - * call write_atomic() callbacks flagged as unsafe (CON_NBCON_ATOMIC_UNSAFE).
>> + * Return:	True, when @con is allowed to perform unsafe console printing
>>   */
>> -static bool nbcon_allow_unsafe_takeover(void)
>> +static bool nbcon_allow_unsafe_takeover(struct console *con, enum pr_flush_reason reason)
>
> Nit: It seems that the @con parameter is not used in this version.
>      So, it might trigger a warning during bisection.

It was a lazy attempt to reduce code churn within the series. I will add
@con in the patch that actually needs it.

John
