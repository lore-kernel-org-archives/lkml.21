Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795216661;
	b=qfxsCpdVJIRlfNRT6nPCMyPW0a0N0NpnNYqjcx5ittC8/maIURq7rR6I0T3ko3KIdYGX
	 ybIGI5NlgQxIPxs4Wg6wG3Ti0iYaFDFpnn4blcFi253oxgfvAceLFSWkkkW4bpXOPAwVT
	 Rjbpm8/+HxQHLS84UYoJ7CtktW+rZkRzYoXpkibtn4o2vo8JKbF8/PoaDkVbUkIMk9dYh
	 l1DER2CFFz8uTxTD4/EZHzgy7Jz9qvF12sVXNOnNt92foOmd5Z9FyR1/S9LFDhictddiw
	 T8aMLH3pEIaACb6Phnogj5ujw/do/CJIa4Jgs1qTCoXRI5GKIXl1wWt0r/9cGKt8IrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795216661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=726kVL6F6TcMsPO3zHhLa7Egh+S7OR+DlorMBz5s0zc=;
	b=3g7BNbgh7ygK4vzAQE/UJzG7J/6vigUSBPn7x3OixY9aCkPT56DAgPwrmXfyQ7FLMGVU
	 +RrdLwT6/AvoE7NvQan7Q6bfIJAicOOsbJtyOulSoO1Nxl532tAeHLA1PmvzyLtxgbNsO
	 PnCv4hRaKhQvlnrEaz3bCqs8Y0+NjaZvTIhRSB4g0nw70gYEwqnktmwdR2+KYODqlB+ON
	 osxSXGTDDL8utSuX+Xy/EBPDh39OHLjxOQYJOsbkFpoa4Y1AwomHdURnyrLhn0QzGwDLs
	 lTCGzjFhDEqcybAf15Fvae9f672meH+yrzorLxBnzsbH3lLsuA2WnfKi48eNuRCDDUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oD80inq1;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71608606A698
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:17:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71608606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oD80inq1
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso16148425e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795216660; x=1795821460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=726kVL6F6TcMsPO3zHhLa7Egh+S7OR+DlorMBz5s0zc=;
        b=oD80inq1OCi7sES2mZDguKm7iyjfIQpmNo57rsodReJicMZiMJ6FTJg1dEvz8vLIze
         Iy7ugQ9nzgZFaYlcarFHnSoY6M1asQ05+hnWEjOVVAWuLGcA72nzo2Om76rkqGpmFxZ8
         7jU8oVXrWNa9gUvrdtwjG9aDYv7MEv1agucz/fVVZnyDF7DyyZeweEg9XEacOHHch7hu
         NYKudRf1jwDyP8HHjL824XRBWRJXj4iTPzSmVcj5WCQElNJXKXzHOvWhzU4wfIjn8xCi
         XwSu9OhPflwp2fqeB/NNKfXrDUD5VheszfxMeFQQYrBPKaAoV0EnZDIZM0LAGfqSL7Oq
         PxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795216660; x=1795821460;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=726kVL6F6TcMsPO3zHhLa7Egh+S7OR+DlorMBz5s0zc=;
        b=Gzoa/4G3jPrFwvkYDrJF4iQDVy0MyW8699Ji/KhQ2oguJp7kpWDzRH4tf0ADCHms8y
         gHEGOwZxPDkrKqiJ5Irb4CLGgLvNuwQUE6n0rPmDbW98WRArY4cwZ5Ad/wIKmj/2ECBU
         FcIDJ4VA+DELMkiBure/PcQfyIoBGzJgc/GXiK3RcSRUo8b1aK1QP403Uy6Lqq6v2afx
         3YlKoy36dC1VduSL0HKuyG5dWInsLznAQsrgeeSC7yPxK8m56liKnLf4mFdqRv5cVQGL
         PluyB607Mf+hyNN6rZHv8TnS+Lc5uhwOSAlsA81PmkN3Gk1DLqsfICIimNvo8B1hcLt7
         LXEg==
X-Forwarded-Encrypted: i=1; AL+hErEjwqxIECez1Gwi0IA190ON+vunqw9BNU0lq8MQ1qgdZ+ftwn6Tw1XlZm7mioET1r9uWfhxrf9cwesD/Fw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xmlYJmGYfxf5M191L/KbIb0HlTlPCWEQnHv8CzxZgNyLBrbmo
	VsqsBF8RDVD2XT1YWZXujZVpIlPVu/6TRaVO0wD4H73WlnLzWi5Xb5b0
X-Gm-Gg: AYBFou3xlxBC24rWBtCrFvn11wxKXWIj4u80XXrj2YvKg33cO1NIQb8oRU0JLrS98A1
	qT81xUQrH6tLaohV82chhhSIbWyp3e5ebgiXGin721UYtshMyrN8uGdMRnvzf3z0BGeh7yUihTK
	lPC/tRPY97kJVpwqui+tO2rueNpriZLerJZP8/gHyrZLvuDW8Yy4BIhPJDJ+CgR8u1RVtJ/il/q
	94Sh5w43Nx8fJBERqGH+UCuPrQpp6O+ViOoVvrtm3y0QxNxmWOl6JGvR/MZABBryXPJtr/GvL2f
	09n4FbOvjUuGTq9SGvg6Tt4VtdJB7aZTJ4G6xrEJuDx10yB6TLmGHTlvNBSGypYmzbO22HTfrY1
	91noC4ltCgTqEqdTuTyO5lKeo64ZuXJMQDLMGDD37sylcLrxcyn3CciqkxLrDpcofIqO8J9QJW0
	oPrUgtz6aG1qsOCVoxNxbUB5TI4zf85PRpG72edNz8U+b6Bk/RqX7vP0cRyRUUCmDH6LT02hYNB
	C5mJaAsEemllu8QrCvDHCSVa0jNplK8XpkajgYSLNyDswVozdq19r1JNOtrdOYt9nb4a5/kA1le
	dy/tcJqATa1JHDWIGAdjuAikZcIYL3MbFgUnoqp7+l4JkqYLtRkFeWoqmGzauKFBhyAmGH7MkCC
	FQPAB53r4gHfX+y0mt+qeI0r9G6riLqOVz28=
X-Received: by 2002:a05:600c:820c:b0:4bb:6f6a:1976 with SMTP id 5b1f17b1804b1-4bb887c2923mr101689825e9.2.1795216659651;
        Fri, 20 Nov 2026 15:17:39 -0800 (PST)
Received: from pc.tail250202.ts.net ([87.110.86.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm151650265e9.15.2026.11.20.15.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:17:37 -0800 (PST)
Date: Sat, 21 Nov 2026 01:17:35 +0200
From: Janis Edvarts Lacis <janislacis06@gmail.com>
To: Antonio Quartulli <antonio@mandelbit.com>
Cc: intel-wired-lan@lists.osuosl.org, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>, Kurt Kanzenbach <kurt@linutronix.de>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net v4 1/4] igb: don't touch rings that don't exist when
 disabling an XSK pool
Message-ID: <xupy6jbpnziq2qji54zjbvm7neggrwkxg3sfrhlolmrd6ysifl@zptk6ynkbu5f>
References: <20261120210134.133238-1-antonio@mandelbit.com>
 <20261120210134.133238-2-antonio@mandelbit.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20261120210134.133238-2-antonio@mandelbit.com>

On 20 Nov 22:01, Antonio Quartulli wrote:
>xsk_get_pool_from_qid() checks the queue id against the stack's real
>queue counts, which can be higher than the number of rings the device
>has: on 82576, enabling VFs leaves a single Tx queue while keeping two
>Rx queues, and igb can fall back from MSI-X to MSI with a single queue
>on resume. Disabling the pool of such a queue, e.g. one bound to queue 1
>before enabling VFs, then passes a NULL Tx ring to
>igb_txrx_ring_disable().
>
>Only disable and re-enable the rings the device has: skip the queue if
>it has no Rx ring, and only the Tx part if it has no Tx ring, so that
>an Rx ring using the pool still stops using it.
>

What happens if a pool is bound to, say, queue 1 and the socket stays 
open across a runtime resume that falls back from MSI-X to MSI 
(queue 1 becomes invalid)?

If the socket is closed after igb_rtnl_resume_task() has reduced both
real queue counts to one, xsk_get_pool_from_qid() will return NULL for
queue 1. As I read it, igb_xsk_pool_disable() then returns -EINVAL
before doing the cleanup and resources get leaked.

I may be mistaken here, if so, please let me know :)

Best regards,
Janis
