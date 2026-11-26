Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693960;
	b=AIqogieVG2fXdQpfvBwxdZX8moUdE6t1f6bY50h88SYyJlMfRwBUPhnSigEmRRN9Sfa/
	 xKEKUyK4QxjMLVz3O7+v2wo9MDe/wPWcxqoKL1jLvxZK8JKpbH30CF9QUNL/mdwQgfzcT
	 E9S1s58OwVNS1wAiBv+jnQ+Dk9S93E4YnZs1eVwjE2jVXnBeL6X3ELpPqyqgODkerHgfK
	 Kbewt/OTBmZuOyz0QE917CKWe9G/nDnSSTxikpGQK45NzMZW6DuIKdKnnCjW5X3Ux88UM
	 h+oRZUrcDTSmWHKJwqasvG4xAU1wJDgeDdJnoVnwtMe6P3y0T7rFbo03nWKyk3D7nyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Jz3Gl0iMuNeLWn97inBKvNEHHQ8P8yZhhufhRbL7IZA=;
	b=Iz4QVhB72jmDvd1f7k2nmsIhYRA+bSWuPNvXdKlmRkEL+20xigGigv3NaOHVM/PXqqKb
	 8uzaUfi4VZeEMeeb/Ao0VQAM8XVwiUH5AZfx6wSb9WMBNoKTRSmP17ExunLN8JU0NW1lG
	 SsMvWF8pctlHnMj3UuVWlc/BLjpqHy8/dXLwzSZD6qGeLdPHM0GLDWEsyPngQBW5AiU+A
	 2hk5j6UBJtlo0+TmeQxBVlcMhK+l5guWrbcOt1QhOI1oJPeb52gg/4rvllxvGkr+Opsos
	 rksnTQ3v7ls3CKtA0XwuWyP1KS2fNreGMmcSp8YBmmS9CT36tzmFLuPGoQsZ/I5M41g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oxrUK1DK;
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE66606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BE66606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oxrUK1DK
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2f066a193bbso35296665ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795693959; x=1796298759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jz3Gl0iMuNeLWn97inBKvNEHHQ8P8yZhhufhRbL7IZA=;
        b=oxrUK1DKoynAXQWjzS9XaX8PirGiSfvGKnxZkuHtSZhQTILXepSdd6mKVhdsEFrQCg
         UY4x4P35bQHpmzFnckv0W6diUBUl0NQsR0yALoQHwP7Wtz1wKnaL3OLAPsJZn6gVnuQT
         W9ACofB7wHUWmlLJzwRAaQFAwzjq6kyODH3E/2SeCws3Qg1AsVC5bqfIB9NC483kZG4M
         7lTFxRNcIaf36MaVzIwZRZgcRPJzO+Mx0lRjFj8cHJ7kZ5e2NgPyHPhF1fy0jltNNf7N
         NsRIsi2iYnY27gv5vWJKZzzqPcm+3VfrzJB7p65bg4tdNfQt+ocmdKtr4of5vwS/ncTd
         51MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693959; x=1796298759;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jz3Gl0iMuNeLWn97inBKvNEHHQ8P8yZhhufhRbL7IZA=;
        b=upxsc3iHkiOZP9VWwiPUUUO48InTUE4/NaGNCLGOiAV7xbXMDzZnjTNLUIlUFUPiLk
         nH9uYCpamP9ZfH5nMMdMn9CtIFOamMUXUL1Tl9B3Nn9+WuTYb9o8AI2ylO1aTyVCABd5
         f+nHZ2VeWk0sR4R7VHF29sLZHIa/oIK7u+qGRT8YKfP5YQf/wR4FyR34M50OlnMQh6zM
         Ny42429TJWfUpeSkWkzdZy5hy7qKEeeuBXhXxW/mdiD3GBJTghfrljPwrrMxX3CiW0wF
         HMU5pz6KW6TsUWWDxyEtjtIkPGVpP6cs+ciFBDzHTSaITDCjhtFymXsL0qfzi9dL5WIq
         s+jg==
X-Forwarded-Encrypted: i=1; AL+hErGK5GHyMQ6lnVJoYtZLifbij4BciyA3w76D3LToYCDl5xO2O74kZDL4onpfngsHe4g9mkNHj+jwLpd4GaY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qImkA0Pj5JxepMjHvAglT7hYJWuPev660G3IS8RlvUAFYbq2p
	yzfckeTvuWsJoMAtx+MF06U51uAsPIIeb1n38XNjV1UlqS58ZSWESIxo
X-Gm-Gg: AZFdTZfUevt+F0A5wHuSGF+ZSWMDHMHDF0DV3cXSMYK29yZsu0F8LM53QZdP2GJzvq+
	puftO5RtH3rVmVLavKCL5t0AQdW4ge+H24xZl/ea0dH5fQmx741esizMp+m2+Qg8aSh9DXeCYBv
	MQLfWoYqsBWHxET71f4VuvbS/9OYFYfX2E3J7JB6GXqyCbeb8ARTx4fmAvelVfQqrYKRlNUMTzF
	iG+Ya1BOeRhGSaRiznVxHbsRjcVGYHmWBq7k/tVmUj3B0J+tRbJszhNbHtiyLuKXXUIrQO8w0nS
	WAEmvBb0gyxl822E9uqd31XnAceX6FCpULm4tjHi5TGOj3EN+pSl9ylxnlyqmAgOxnNoT4cly2J
	U3JGBoPJnoflE3wB0BBAedjRq0Gymu/knHkL8DNW118p7+BdFiUaW/BSv3Lb3+QpvAsgqHCTioS
	rtWjA7EbXvGN763OuQSzn3zN0zMIVYaI1LiBCxdJG0TQ4HgUE7ml29Z3XztX2sJO0yEu0XlrRKh
	8hkUcOznYGi9ynt9jSKpcW42KSMWNBJlx0JN3D6cXNzmrGL1jXb6kMmwq378LhRGMk1E4YxzLfY
	IOQ9958CwCLsn6zqHVOmTfJFyg==
X-Received: by 2002:a17:903:1c3:b0:2f0:41c7:9a3c with SMTP id d9443c01a7336-2f041c7b2ebmr213510435ad.8.1795693959476;
        Thu, 26 Nov 2026 03:52:39 -0800 (PST)
Received: from nixos ([2409:8a28:ae4:7f20:61d:93ac:f2c5:2564])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f191464sm105486475ad.1.2026.11.26.03.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:52:38 -0800 (PST)
From: Zixin Wang <w1355457260@gmail.com>
To: bigeasy@linutronix.de
Cc: frederic@kernel.org,
	darwi@linutronix.de,
	john.ogness@linutronix.de,
	linux-doc@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	corbet@lwn.net,
	wagi@monom.org,
	atomlin@atomlin.com,
	linux-kernel@vger.kernel.org,
	Zixin Wang <w1355457260@gmail.com>
Subject: Re: [PATCH v6] Documentation: real-time: Add runtime tuning guide
Date: Thu, 26 Nov 2026 11:52:26 +0000
Message-ID: <20261126115226.617382-1-w1355457260@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261125150114.eWhmDZrv@linutronix.de>
References: <20261125074658.33117-1-w1355457260@gmail.com> <awbgq0xQyJATel0_@localhost.localdomain> <20261125150114.eWhmDZrv@linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Sebastian,

On 2026-11-25 15:01, Sebastian Andrzej Siewior wrote:
> This is pointless. The enqueue-to-invocation latency is meaningless. If
> you have a RT task which preempts another task in its RCU-read section
> then the grace period (and the invocation of all callbacks) will be
> delayed until that RT task is done. Either way, even with things like
> RCU-LAZY the callbacks can be delayed even further. That is fine.
> Nothing really should rely on the callback execution.
>
> The important part would be time spent in call_rcu(). And the latency
> observed by an "real-time task" outside of RCU that is affected by this.
> Also I prefer testing these things on bare metal so the host not pause
> the guest for some reason.

Thanks for the correction and the detailed explanation.  I agree that
enqueue-to-invocation latency is not a meaningful metric; v7 no longer
uses the QEMU result and keeps only a brief description of the tradeoff.
I also followed your suggestion to reference the existing CPU isolation
documentation instead of duplicating it.

Thanks also to Frederic for confirming the call_rcu() perspective.

Thanks,
Zixin
