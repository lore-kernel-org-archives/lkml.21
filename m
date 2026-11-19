Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095163;
	b=bOcwBoylecoC+Ocmsd9ORHGGrn15GgYNUdu+J59CWBdhLUDguhFeSQnKw442zo0ZLqBn
	 z3w0oHQgqcT6RV8mu6JYhxbzlH0LKEPIgEcbEhdV7BGYeoj0WYz6arymP3SrPOIKF5oMv
	 mWJvqFVtmhrqyi5CgjDf2OWZ1jxokiGRBaXo4OrYu0Ob8HMkBEAB3B5pxXW6IrB8k3Rju
	 OeXIKnHCune9gWwTUx180pmKssZBzSk7DQRq+aIydW/Lkg2dmy4sMmaS4KVrfHHZEQync
	 hDNn+hqesiecgjKf5hiQXvKgNahUNXY9e9QRHVSFS7ywZpIhjJxRIyq0X0zXbIx4R+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095163;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=5M39K3SYmmJG/uu6Nrf7nIbhuUUU2dESxQqOUEafOSo=;
	b=ou+dlM7oFmQDUHo3i74UaE82fQsbyWE24gJQ20DUJUjkLw1hEf0Bct/Id+tScL8XMmO9
	 W+s+4UhTwqFLrHL74A9Ee+YqiZl21WZXzYz4e+hVoAcBXJ6jjXEtuIrbMC8WbVELfqaEK
	 yWt64MtHXMW/NLpG4mTGlkXaPzsq0XQZjVq3EjKCbzk19l40veZIuJx7eZQnIl03xkS7w
	 aU54qikwyLoPSoix6xrSGZnUwX3fC+n07npthl4BWZYt4brmC5SQ9cU5IcC9DLiYAurlD
	 1G1+K2T2BpB/qpGJLf4Kz97rptz+mNmiskQq7a8oQJCy4zh/jwBFn15E0Tx05Iyw6Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TINxLQrK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266C0606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TINxLQrK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA6B01F000C8;
	Thu, 19 Nov 2026 13:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795095162;
	bh=5M39K3SYmmJG/uu6Nrf7nIbhuUUU2dESxQqOUEafOSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TINxLQrKG34F1EB9e0P64dGTbPRbiN6OyeYoxP65YwfSHV+G6qiLWBgXZQ/jYMgh4
	 /WQModnOlcVyz5WnASWfzofarXgvnOVi3uzEMwMIOwA57X5qjpfFHMLUmEi8MXty6n
	 2cv4TkLFzhzZv+wmlx79YJfjEiNh97f8n5a/KaoUEAH9EnIkJum5+oVGokOA9M8opl
	 8eXAp9awIBQTbEGeiffU6hS/QXOSmctmA2mOycBw3vq8iqAfaXJmJ6KEIdJ4ij2jM+
	 ULN7Aq02gWWiYzEbLKChHm2DIZ/dmljHco0tvNJG97lzjmIKCpm583JkOp2FjrTEqA
	 Zk8A+NXTjbCTg==
Date: Thu, 19 Nov 2026 14:32:37 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>,
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/14] irqchip/gic-v5: Retain the L2 IST when mapping
 times out
Message-ID: <av76dQ_dMCWlTAse@red-moon>
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
 <20261118-host_gicv5_fixes-v3-4-13c1859e8aa3@arm.com>
 <CA+EHjTzPFjUOXCiccswH2xGvbiqgXPbSihov7MA0WuXn-SmrEg@mail.gmail.com>
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
In-Reply-To: <CA+EHjTzPFjUOXCiccswH2xGvbiqgXPbSihov7MA0WuXn-SmrEg@mail.gmail.com>

On Thu, Nov 19, 2026 at 12:00:15PM +0000, Fuad Tabba wrote:
> Hi Sascha,
> 
> On Wed, 18 Nov 2026 17:35:33 +0000, Sascha Bischoff
> <sascha.bischoff@arm.com> wrote:
> [...]
> > diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
> [...]
> > @@ -217,6 +217,10 @@ int gicv5_irs_iste_alloc(const u32 lpi)
> >          if (FIELD_GET(GICV5_ISTL1E_VALID, le64_to_cpu(l1ist[index])))
> >                  return 0;
> >
> > +        /* A previous map timed out; do not overwrite its pending L1 entry. */
> > +        if (READ_ONCE(l1ist[index]))
> > +                return -EBUSY;
> 
> Sashiko's review [1] didn't go on the list, in case you missed it.
> Sashiko found that l1ist[index] is read twice, and that on a

Yes, we should read it once but see below.

> non-coherent IRS a map completing after the timeout leaves a stale
> copy of the L1 entry in the cache for later allocations. Invalidating
> the entry before it's first read would fix the latter. Invalidating it
> on the timeout path wouldn't, since a later read can refill the line
> before the map completes.

Well, we don't know when the map completes do we ? Is invalidating
just before it is READ_ONCE() really "fixing" this (actually, is what
we are trying to do minimizing the false negatives ie l1 entries
that we wrote and became valid that we would detect as not valid ?)
or we need to sync the IRS and check for idle before the invalidation ?

I will give it more thought - I don't like this complexity much for
basically fixing a very close to fatal error.

Thanks,
Lorenzo

> With those fixed:
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> 
> Cheers,
> /fuad
> 
> [1] https://sashiko.dev/#/patchset/20261118-host_gicv5_fixes-v3-0-13c1859e8aa3%40arm.com
