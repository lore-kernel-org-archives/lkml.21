Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795089242;
	b=jlD8ID95G3FJJ8CT2+rOmE5o9jqUkkeBZjSr5x94LvV/LyPHch7UgAJDdYbYM/0Vg1Zk
	 JtY0NoffZrEHXOykXrm7aIUpgZZZ64hlw2zOWqpCvzS+MckSKH5hNuq4c8A+Hh3MV48Xe
	 bXuN3Au0DQJ9ks9YI+t5B17LadgFK3tMrdHNAk68jlLM6HFz83WhceFv/ud8hc35vGlib
	 rINBgNtSN7kNeMMR082AV33+vgbbVFZU2jmY3B/42J0XU6w1N/IhRgFWL5un6VGKtJUv9
	 Ib95tPOpPd2sQ263GNgmR8xCX3JVhR8yw4mk+5ovJYdU1VTt71v6t0vAX3KYxxTmg8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089242;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=PiHF220QlxLkv+FhGHdBRQS6RD228RAM8FakmbcJw/I=;
	b=1niuQDZA/hKSav97UMWrQZk861ecbJ32/4ZuuFdjFpNfxslE5OM/kyZXuZf8r/de9BIE
	 si0JXyANgbZ4l4fhEWj/f2oGS/5OzR1vUoE8/a1tdjHf/lSF/J+49Kgo7RecQC1p0Kegh
	 m8vbBYkKoxLmmJGP0xDetFDbdmKt0Y7m+Y/PsL1/lGg4AsyhPQtoI9OPq+1fyD6KKjTBI
	 qXs+qu9dJSG3ooQQZyWuy40KaWxCnp/PEbOkl/WS92g7aWo4I9MOElzR3w0/IqcRjqxC1
	 QSVH3IHP7WSDQqg8+5mnaM/fupyVJwZ5w/gapQq1P7FkQbCqHR205Nu30nLTJTtDY3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AtT0y9z8;
	arc=none smtp.remote-ip=91.218.175.220
Received: from mta0.migadu.com (out-220.mta0.migadu.com [91.218.175.220])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F11606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70F11606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AtT0y9z8
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PiHF220QlxLkv+FhGHdBRQS6RD228RAM8FakmbcJw/I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795089239; v=1; x=1795694039;
 b=AtT0y9z8uYZIB3w/TY+f5qpmBwB8X9OLJA1fVWX1P3tnF/ZrRR3ok0JZ2nA19+JwWhlpTVsG
 kuTsoApkzfekemK7cZosMUsPN5N2+NC/anXVGG3tldlJFibiK5zIwz4YD68jJiQ1FsyIJeepTtN
 eFVMMGt3hfLkHCFKs2+BLWUM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a3e49b01340626ea;
	Thu, 19 Nov 2026 11:53:59 +0000
X-Mizu-Trace-ID: a3e49b01340626ea
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c144eb2f43so5407e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:53:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHJI1WTg0ufAecbYzx1gGn0WO7G/pPH54miNgxJuQRbf25BB2tF1W98BwzVB1keP14yIBuo9cmgt9bU6sU=@vger.kernel.org
X-Gm-Message-State: APuU4Z//l1UntgFAEfmaJ6Jbh10k7M7B2P5s46ko6d/FJUxl6XEH9xh9
	OCRZUud9wZ34rY6sZauRNmJvS4Y3B7F20tAFt1cKkN44QeNWHbEIPHu3YvVF5srPfnwQC+VClYe
	FVKJktZGdm35XglkV4atxd9rF+boH6UpZk7+OHnfb
X-Received: by 2002:a05:6512:6ce:b0:5bf:f81a:f24e with SMTP id
 2adb3069b0e04-5c1b6701822mr62577e87.10.1795089238356; Thu, 19 Nov 2026
 03:53:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com> <20261118-host_gicv5_fixes-v3-3-13c1859e8aa3@arm.com>
In-Reply-To: <20261118-host_gicv5_fixes-v3-3-13c1859e8aa3@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 19 Nov 2026 11:53:22 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwoP36opJYeZ6Ba4aLE8f5igZzW9+LSbuZkztr51bRdxg@mail.gmail.com>
X-Gm-Features: AclHuK_AZe_Vokv4qAU_qUJNPMBSmI_bbzFthqZ3V5RG14Q6YAF6hocR_sZcPPU
Message-ID: <CA+EHjTwoP36opJYeZ6Ba4aLE8f5igZzW9+LSbuZkztr51bRdxg@mail.gmail.com>
Subject: Re: [PATCH v3 03/14] irqchip/gic-v5: Serialise IRS synchronisation requests
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Timothy Hayes <timothy.hayes@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jonathan Cameron <jic23@kernel.org>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sascha,

On Wed, 18 Nov 2026 17:35:32 +0000, Sascha Bischoff
<sascha.bischoff@arm.com> wrote:
> IRS_SYNCR writes are ignored while IRS_SYNC_STATUSR.IDLE is clear.
> Concurrent calls to gicv5_irs_syncr() can overlap, causing a request
> to be dropped. A caller can then observe the earlier request
> completing and assume that its own events have been processed.
>
> gicv5_irs_syncr() may need to be called in atomic context. Serialise
> the request and completion poll with a raw spinlock, and use atomic
> polling.
>
> Fixes: 57d72196dfc8 ("irqchip/gic-v5: Add GICv5 ITS support")
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: stable@vger.kernel.org

I don't think two calls can overlap in the host driver today. The only
caller is gicv5_its_irq_domain_free(), and since the LPI domain is the
parent of every ITS domain, irq_domain_free_irqs() holds the LPI
domain's mutex around that call. Do we need the Fixes: and Cc: stable
tags then?

That said:
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
