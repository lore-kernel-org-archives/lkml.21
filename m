Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599366;
	b=bIDfYZY1YwkviT/dag1yeOJI7S6QM3+7t4g73WWNw/hwEzAhGFB4zmBkbOsYE6DIFI6t
	 hefdCfRdfndhnPHgqEDws1kic/3jSZvTyAlDfqrRY/dk/TGkgd7R2ADuDLJRSKyLSSRoZ
	 0dUbBsQSkL9qWm5thbBUUNd1gKwSxxVgfPo512B9PZeXGLESRylDGz4XbNFNGDOlcrjEF
	 r6O8TYAy8JwG7Mznsnr0ZmGjPFcVQpR8aEMXPNoR8rtkhJN+N2J1KaCs0HyBSLS0YaOv2
	 lh6bfRrBNcm9YhIpzjzXHt5FJmHnd+OeErirpS8Ga4iCnjp0Jsy0jwxZ0aiL3tU3jvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599366;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=9FicCzOySM1A+YM2AG2OjdAdR1S72uaob4KtLWz/tns=;
	b=Tram4QzC6sIWGp6bW8DN0mtto0El7HG4Oga+hiZyAmE1oDGvOKfBS157DgjurueiHmZM
	 RYEdUt1doJZVDhJHEqMWO34v4AK/Zd5eBbFSgGWrL7SYHWla4QxE0fGr1Su7CPc8bs9Lw
	 qyBaIH7xcKfQBZ4BIdVcWbadNe+TNhO4Rv5EQpMF1qqw+lLJetDxtkDq7YvDrrAGy/wO4
	 taakHFS9NMU/7wz7OKwQfOH6Fi1wnCZXwJ0of+BvOCABsHDRNElpdwWWI7GC7yzWIMDUB
	 8mZ1qNA9ppl+4OZEO4lcBK5veXwyJZ5J1Mv8KCv1aspqmEg65QDXkeplpmJooQ3+1Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AjP6ucja;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7F6606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AjP6ucja
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 136801F000C4;
	Wed, 25 Nov 2026 09:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795599365;
	bh=9FicCzOySM1A+YM2AG2OjdAdR1S72uaob4KtLWz/tns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AjP6ucjaRUjiZUxp98s57hjwgnFxVMJARXwwOViEX3wr81pPtQDq8EttAPU8Vy+JT
	 zT6n+ywZLlfUcxQirHRj7E2LX4HVYv4cSYcZ1RUSDdkIrY3QzjXXwR0TBIoVTdo0kT
	 h3IMkBimsUDR08QAXpmatAH/26QKwWk5hpAu1LgpkYiQziDwdDsF0Qq5JCNkuo06mD
	 S0zoV7LZSnpbDJHUpgcCgggfvrNQSEvW1aOqSh9pt6oIkKXsyDV3btR98A+20pizmg
	 0rYo12G0n0Efxo6iTC4HaVTfceMUYvb/f2L336hNBEOp6qeZgqcC5zWJs9n1+Y3l5K
	 pXNZKYxvB0uZA==
Date: Wed, 25 Nov 2026 09:36:02 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: vexpress: Fix SCU mapping leak in
 vexpress_smp_dt_prepare_cpus()
Message-ID: <20261125-ebony-worm-of-charisma-b4ab4f@sudeepholla>
References: <20261124155839.388319-2-oss.patchbox@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124155839.388319-2-oss.patchbox@gmail.com>

On Tue, Nov 24, 2026 at 03:58:35PM +0000, Yuho Choi wrote:
> vexpress_smp_dt_prepare_cpus() maps the SCU with of_iomap() only to
> pass it to scu_enable(), and never unmaps it. scu_enable() does not
> keep the address, and nothing else in the vexpress SMP code uses the
> SCU, so the mapping is leaked. The function runs once while bringing up
> the secondary CPUs, so a single mapping is leaked at boot.
> 
> Unmap the SCU after enabling it, as hisi_enable_scu_a9() does. Also
> skip scu_enable() when of_iomap() fails, instead of passing it a NULL
> pointer.
> 

https://patch.msgid.link/20261104145446.2767924-1-sudeep.holla@kernel.org

Already queued in -next.

-- 
Regards,
Sudeep
