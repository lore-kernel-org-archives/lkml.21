Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643197;
	b=sW/cuqniFIhqlNplW0ZTtdwNiG0fsjeew7Gg3Jlm0LACMnZCbq5FsUPGwgNYsPNaVTMS
	 hq+21AQJphI1NM7W37PgweIjSh8pGFifqP0yK4pVy5r/TBw3EgnNY8Q3/LKjaBr0qae9h
	 LE10u6IbNbwjdb+SlHgHWon3dB3KVBSl3f64hxpLEYB54Fviy4mP7TX/E9Psxs4M4NKW0
	 g+B6pfXVaQA+CTU5bov82O842GmJ3CHkps6oZjrh4GERd3N9qzZP/oIZDK2vEk+ViFoAl
	 EHPJZ4Xhw4c4W8FYVcJasd5SBgQfE7x9NMkOHVKys0+1jhBjv3nUIm8fmE+VWXQh9LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ECZfLCqovArdDXRBWaYMU5CLXc1REyLj6z5OT4Fz8Bo=;
	b=uxd2RAslzNkqfRjFoZL6Om/JDGb2HdSOutiu+cNSLF4RCyF6wJ9wQAPZawxeaVQoSDMN
	 0Ybm16r9MyCMNcHOQ+GjKgwHLcEycwfENv1pzHbAc6EDsoMQHi2d5agjJjlKEzakDUl8K
	 /DdK86jLKeCkPiOKs7J2gXiiON4WfvgjXkWEhOtpM8bCbhkc55oOFATbgoE8r14f3yhMx
	 gAA/J5HJ52bgUqtYLlVFzt8hmpO8x0ULOomzpr61yHs/ogvwhh1vuuO6XdIDfL4Tw0K9o
	 At84Qv9Xc+29edCWBJzThcdBtaCXBXK1W4SsuEe720Q0Jc/HD2lT1fUNG3opXv5Ka0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q6DDfZ3C;
	arc=none smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC78D606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC78D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q6DDfZ3C
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c15ccd7fb5so3905913e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795643195; x=1796247995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ECZfLCqovArdDXRBWaYMU5CLXc1REyLj6z5OT4Fz8Bo=;
        b=Q6DDfZ3CCebl4e9HvBobZzkLW/P8sKHU0HU2C9ODPcInP3WzlLsfZiDv0nQcnmYBbQ
         xGmgYPdGNZlf5Izomd71XWWUHcCtOjZ0kL0u5lTw4AyLwBRkZm1eaEBFLm9/aZ8EvFJH
         T85M2uadjTRj+zwqY0M/MZAeZ+r/qR0zt4mKQt3pZeG9X9FbYrSNUhIESPh5PNr1cDEL
         yOLEhumkriehOb2kpvtlMALMbEEIHBwsEyjhjPdIBYpN6Dc32cSe+3hpeu7QHU+hgDtW
         SdfOKmzpj0LsGzC1MB0ODQJLMNn4Q5gNrI1U1DmdOpDXlvYCmFF/7naKQQR/ZrJAwC7K
         a6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795643195; x=1796247995;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ECZfLCqovArdDXRBWaYMU5CLXc1REyLj6z5OT4Fz8Bo=;
        b=yYvfUVjIqQYRzxSsDV6mRfla5PfsAmSDMIdonFwAMfEx++N7Ere2hywYNgTmFnJxca
         atx/I/6ELFGJcTBdqrz03V9ujJqvYgwwnHIXl1B/fekPdOEftXbDPnpPmsvtZb+XMDrn
         dcJ9vW0XxD5DndsK5FlZMGH4A0XITpLNm8mlGJ7sI+obo454nuWbk5PrcfLtEiyHTlML
         brKVJdU6ylbCM0dyf07C7kJaB2Pp3Q8p/VIq+pI93UXeFeC/3tvny0n/3zd3Uwnr1yfG
         KfdzWpMLByfBjO0UB65zgieUwqtEs40P8fI/BA0FmNINO0Bz+YnwaA4O6byXgmwRBHER
         KZGQ==
X-Forwarded-Encrypted: i=1; AL+hErFc6cFkqpV8ZOvmcsOHSW3mppS9Kg4mpHpeymcLgSlNT68N9CSZPejM6J1Z6LOdTsiNPPLSvyb5tP3JjHM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FciIDhO9+1H9OsY4FNwpYQkXiu7WrhWhvYz6gEGUnHmvori/A
	BnJsP0QtkAiHwp8JwuC6pyVe6mc5OsE6Tyj3MtMMSFVkeiFzivCZvaI0
X-Gm-Gg: AZFdTZdAku8fpKan4JoXo7v6ahHrCWXko1WEgpOyo4nqmGUOxYm4Fw3I+qUp7leEfvP
	/ZbPTDrbo+T57RM2ivU6tdxb9HpLI+udUkXfrwDw4LzmrZQSwCQI5gozb4sk/z2YSLfFthDryDF
	FFoKeZQjniRVAwc/xuRBICVIBJwW+Ss+IDTEtJpdzrlIX0tHK1kkU37wvwszHmGbO0evrqM5SM6
	vP/F4FGuxo4vK1V3kA508u5zQGNe/4FO+rBW5R7l4aQutEPZ2z6AIPQcILUFPdff70Qur5wReU1
	fXptw++ituoYEAZnG+2zi9nrNWeRLYRyKyyLM91kk9WlQfjeQJZ+37m+gzOp3n36/ANuRRou7Hu
	fsoLUn47bdth+SnN24IQc7A4NLjaMEJBFi1odkaUpdAmRzN+6u4qI2CY1QGF8hYqYmsxX13I3/n
	EFYuDWK7GEF0rHFZyx5cGQJYHmKd4GkmjYnpLeyunlKIbEsNxnROXQnOZ5OgkLx6Qt4PlZFQyHI
	E028Pw3Wz4gJoCk0wYlMLfxFWs/Vk3XeUCia1gPE0o8ZEgAbuclYxtQ8ypGrXckDqPG7MxFUy+x
	KBxrgooI1Pvpr9/i9lnZTepZwcnCKg763X71suUaacem3MBL4iM+G/TOJiP2aA==
X-Received: by 2002:a05:6512:3b08:b0:5c1:b29a:1ba3 with SMTP id 2adb3069b0e04-5c1bc7d5ce5mr7798199e87.29.1795643194950;
        Wed, 25 Nov 2026 13:46:34 -0800 (PST)
Received: from [192.168.0.103] ([46.8.6.187])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd04327bsm4896168e87.51.2026.11.25.13.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 13:46:34 -0800 (PST)
Message-ID: <edfb1d04-0d55-47ed-b1cb-dcd8c5df75ce@gmail.com>
Date: Thu, 26 Nov 2026 00:46:33 +0300
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
Subject: Re: [PATCH] percpu_ref: make percpu_ref_switch_lock per percpu_ref
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, dennis@kernel.org, tj@kernel.org, cl@gentwo.org,
 zhengqi.arch@bytedance.com, linux-kernel@vger.kernel.org
References: <01612865-faa0-4fe5-8184-a177f104843f@gmail.com>
 <6c943754-05b5-4017-9145-0d145766909a@gmail.com>
 <20261125113537.bdb168bfe8962ef1aefc097b@linux-foundation.org>
Content-Language: en-US
From: Egor Shalashnov <shalasheg@gmail.com>
In-Reply-To: <20261125113537.bdb168bfe8962ef1aefc097b@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 25/11/2026 22:35, Andrew Morton wrote:
> Well, an unpublished module isn't very useful for us.
> 
> And an intense microbenchmark isn't as interesting as a real-world
> workload.  So can you please provide more details about what "our
> workload" is doing and some measurements on how much this patch
> improves that workload?

The workload is a full-volume discard on an out-of-tree storage
block device backed by NVMe drives. The test machine has 128 logical CPUs.

The device maintains a percpu_ref for each independently managed
logical region of a thin volume. Normal I/O holds a reference while accessing 
that region. To process a discard, we kill the affected references and
wait for outstanding I/O to drain before removing the mappings.
After the metadata updates complete, we reinitialize the references
so the regions can accept I/O again.

A large discard repeats this lifecycle for many regions, with
different regions processed concurrently on multiple CPUs. Although
the regions are independent, their kill and reinit operations
contend on the global percpu_ref_switch_lock.

We measured the elapsed time of blkdiscard over the entire volume,
refilling the volume before each run.

Volume    Global lock    Per-reference lock    Speedup
 1 TB       3.424 s            1.218 s            2.81x
 8 TB      27.943 s            6.133 s            4.56x
16 TB      56.021 s            8.591 s            6.52x

> Alternatively, this looks like somewhere where a hashed spinlock will
> work well.  A static array of 32(?) cacheline_aligned spinlocks, hash
> the percpu_ref* onto one of those.  That'll get 90% of the benefit
> without growing percpu_ref.

This might be a better approach. I'll compare it with the global-lock
and per-reference-lock variants and report the results.
