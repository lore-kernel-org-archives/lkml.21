Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705712;
	b=oQ7urYHd2ofBco3sZijeutTdkzkb20CyVr7gmBY616ZD4uJvU+4jxJQXokWoGjzBRKzh
	 6TAzQFCyNPo7zDz/RdOddkT73Qmv4ZT3N+QnkqMoDBaF4Mziu13dtrRo+GTVczBvmGJQD
	 RqyQE8MMrxtNyVfuAaxKJyzF6xqi5V+H93XRVambcLad1dPUAefM/Nlz/00e9t+F54Oa9
	 L3PwjdQ8o/4j/+ROKBPqYhLMweuXc8al5LyOmS+NPuVpI9UYWyIoiB0uxdtLrj1Z85ubt
	 STjOTN6gxf1GfCa/W8IeRqyzlLI5N/o0nwiLrm0fU2Z9QCrWhY3RBxUMHHGi74SSV3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705712;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=JNt3KV+/k4qN5uTRrHg3mu6ikRqMaMAV9t3LTRqvweg=;
	b=d2xKtp6dJuYPZXuXVQLzf+ZhVvd0XqcRzmqOaCok3bU5mqPpSrVBEE9PxriamrsOUkN6
	 BqO+l4IfqV7aO8jSO8wzsOdQy7sXaIxPmixJHrbU7w21Irl1D5aQXvJar2xxhLPsM5SRO
	 ijmS20+9OH4TvQZoyCfGWrI3TRm6av+30AzNIfcIkDzyepWXq/3u6rzli3X/3qL7FHP/S
	 L7qZEGpMKkjJPEuaFEfuqZXHB1KeHUkF9+mTgApXim4d5klaT4oObwfjRW7/Z6r0L3lLA
	 27OTKVgnZDJoHFeioRk/kJT/Xoa0oH/Vo+vEtkWXOJ/4S1YHQtfsNLXk1nlYKekE9ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AiV4lx8K;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=aWfBCAhN;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D40606A334
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60D40606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AiV4lx8K;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=aWfBCAhN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795705710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JNt3KV+/k4qN5uTRrHg3mu6ikRqMaMAV9t3LTRqvweg=;
	b=AiV4lx8KVZ6cWuRxkrDbWvYcbiyDbC7gjCumwwqM1uKQScr3ha45acm2V+365f2LSVcsyJ
	tECDraZDZWNrUOFqNnMkRoPag9WaqUMlqd+Q2ZT9tnousXTzAurkZTav16gU8n3LXUuFkw
	MdGhXc+CLYesyqt9Qkc+YJicJSAjkJI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-uAIUmHuZPbiUT2MuUNs0cg-1; Thu, 26 Nov 2026 15:08:28 +0000
X-MC-Unique: uAIUmHuZPbiUT2MuUNs0cg-1
X-Mimecast-MFC-AGG-ID: uAIUmHuZPbiUT2MuUNs0cg_1795705707
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4bb818d8dcfso35753425e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795705707; x=1796310507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JNt3KV+/k4qN5uTRrHg3mu6ikRqMaMAV9t3LTRqvweg=;
        b=aWfBCAhNCuWExZQgFadVZctq4i5Lw1rEhzTWX1jHNiA/Tu5v7JZm1A/ITIMnbvNTLv
         1tbt6SGddmX7hMDqbmBspsYOVa5Vf9YycjF9M79vFzBhFtsQaaQkH+xtchYesfRS3dPk
         7GjqGb7tRmFJcUqMlEIs6Iv0spoCg4Vy4QnKSDXB2IkAmr0DFk1zPmXrP0dIb47yNZqO
         NXk8+2Mkt22FxhQPcwgx/MS9kAYWk9kb6Xh/rVRfWy74xsWpOZ9nMhPDEC/Y1eKgHOep
         czfEdutUvFbXo4J2EveZ8v2+2C4HAmB+0F3XGl/EO/iMx5F5FSQoaHqen0ro5xLaeucc
         JahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705707; x=1796310507;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JNt3KV+/k4qN5uTRrHg3mu6ikRqMaMAV9t3LTRqvweg=;
        b=WPwDYJ42UWG+UILtLJL/vcBLQ1VQuEh6vqkwjYuVwVLgn8lkswMI76zQNHyPpWvAnJ
         XaCnU2P4lICGWfSvlcld/60yHgXVohirb1Bx3V7TSpPy561TUGqqtbdlM3tOMs/+3Qu9
         wLhOs8fQRkZ0sZ+i6yv9V/Yq0TkVLCbeoMLqHkwcG/ou4RoViYRV7KEt7xgpHq/jY+Kq
         7vtjloPKOqkXMoXqBLzKc5rWtEF3fRBHgx2SA57ICcdkbPwal9Ga/z8JPFMz06x62L/A
         3/2WUPcsGEtdDGbEJ2j854vjePDTp44CV4iRHmrGLMolszxi8/Qjh50mbaZ+JLawKaZB
         Gsog==
X-Forwarded-Encrypted: i=1; AL+hErEX1J8aHopukTzHPoefz7PfE07XFPPoxtlsBxxic/ckVCxyzb0/beWB/WHYjkjB24V054bj+cuUYVajAh0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/P/UFV5l0MSkpLPluM/dki7K7yBHM5ty0dVAAJ4P2e4G1cH1F0
	M2Ql80WfQIBQTxt9qvHNDA8JmIYCFycDjyBcdY9BxrsTSWW+NA/Rpz2Al+IwfO7cCqLf+jSqDvj
	PrWqO/8whU8DC2D/OMwP3mm6zU7aoJJu9nblnRLvBQM9dE6KtlsD8dPQthU9dKAnZtA==
X-Gm-Gg: AZFdTZcmwvSyfEF9RAhV+uVcpwrN9YoCkCdlFqiCs4WhQKx99yeRWCxBA7LDkeRHuph
	0BFANufv0hWbu35t2mvYbXbfQuSLDhMb7+E59pGXRoa+L7xDcZFrefnoRWB5s5yxt7R88srcNfQ
	yoWcPZf3NXJIEjsCayVCllBvwtH7DXmRnuYIHROBOC4aVWQeryIZH1w4t5jM9xrVSCx3ko28bUr
	CswcffOlb3X+TrkQsuaYDyhbo7jiUF+ExUJgZ3f7f/dHA1snCwwRECPZo6CR0KdP/1yD9P3L0df
	FeZMBOzsLlbegEw8UhyeRbbd/7TVCDtLX0uzAITzVOJWHoofH8nmxfP0oPbnZGJRFiKAgtImiW+
	KgRUZ1JSEgxgmCo3DL7OXAGy+yAg/3mQ2qAZM/2J1UbKuXAAYY1j2JD5a/mfwfShhZjbVOMqGYP
	GDxFCkAN8+zVF7YzBGqr5n/FtHFzJkxghhx2R67SXg+6xT
X-Received: by 2002:a05:600c:4f0f:b0:4bb:87f4:3674 with SMTP id 5b1f17b1804b1-4bb8880ef40mr544861345e9.15.1795705707143;
        Thu, 26 Nov 2026 07:08:27 -0800 (PST)
X-Received: by 2002:a05:600c:4f0f:b0:4bb:87f4:3674 with SMTP id 5b1f17b1804b1-4bb8880ef40mr544860695e9.15.1795705706702;
        Thu, 26 Nov 2026 07:08:26 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm33713793f8f.35.2026.11.26.07.08.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:08:26 -0800 (PST)
Message-ID: <9ec9f5db-b550-4e34-a299-7c45bf00ba48@redhat.com>
Date: Thu, 26 Nov 2026 16:08:24 +0100
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
Subject: Re: [PATCH net v2 2/2] net: net_test: add tests for
 netif_tx_stop_queue() trans_start
To: Curtis McBurney <cmcburney@telcobridges.com>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 horms@kernel.org, andrew+netdev@lunn.ch, willemb@google.com,
 toke@redhat.com, daniel@iogearbox.net, almasrymina@google.com,
 linux-kernel@vger.kernel.org
References: <20261119141633.3118789-1-cmcburney@telcobridges.com>
 <20261119141633.3118789-3-cmcburney@telcobridges.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261119141633.3118789-3-cmcburney@telcobridges.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 15:16, Curtis McBurney wrote:
> Add KUnit tests for the txq->trans_start handling of
> netif_tx_stop_queue(), which dev_watchdog() uses to detect a stuck
> queue:
> 
>    - a stop on a running queue writes trans_start
>    - a stop on a queue already stopped by the driver keeps trans_start
>    - a stop after netif_tx_start_queue() writes trans_start again
>    - a stop on a queue stopped only by BQL (__QUEUE_STATE_STACK_XOFF)
>      writes trans_start
> 
> txq_stop_keeps_stamp_stopped_queue fails without the previous patch.
> 
> The tests run on a single thread and do not cover a wake that races
> with a stop. The previous patch removes that race by construction: a
> stop that finds the bit set writes neither trans_start nor the bit.
> 
> Tested on UML with CONFIG_KUNIT, CONFIG_NET and CONFIG_NET_TEST:
> 
>    tools/testing/kunit/kunit.py run --kunitconfig=<cfg> 'net_core.txq_*'
> 
> Claude Code (Anthropic) wrote these tests and this changelog.
> 
> Signed-off-by: Curtis McBurney <cmcburney@telcobridges.com>
Does not apply cleanly. Please rebase and repost.

/P

