Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706661;
	b=eQ0PlBRI6aExphG7ivqPClJGaM6WPH9mufhE7eIwt5ENau+MdeJCMgl5OjOf6+ukwtqm
	 gcmHOIOMI+1Bn94EQz80m9EKTbitryh/NdcHEWYDsqmhugIGy72NLUFVGB7lUg1POwfad
	 qDcplxXBzsdCXJjgxd+iLwNTI06JQcTUOwYPp8YoHHLoG1cuieU05/5FykHrW0VDgsq6X
	 ErPut3px23qK78PLtIpg3pbSVRBwy67h8hjRkLhK5QG7pizYhSRJJQmx3gW7EaMR5cUqM
	 DQturoP9d1Qv2Q9akqUq6L5xNj0P1HZRM1JDRK3ob2NilFnSTpeC81uv39fv5i/3MQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706661;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=6YNUCBOxZzbaaIa80epVPWrKGpoBdiWN4H2qUJKH3bg=;
	b=J49tx+Qa9wRtwKUAjH0torKDErCrau9ewYU3em5wpmVuGiioEkgy6nJ9I0AiZcngQRCz
	 qBFjp0FFnUYzz5/YY32z0vRcNgLnwXY43K+C9zfxXCDja1uN18V80blc7Di/vn2L9FnU5
	 PK8KPLGZjiLobE0cCpj2QpK7iotOexg+UzXx1atN2x8h+HS4uFQUOqDxTvQuGjoXZGfRX
	 HRueRsLzZUcjPpVth6J9erPufrkveltzcQ6/QDBM7569m0rF22oSQvzMkE2CTcVKe3P2f
	 vbv2w8xK90k7Spjgp/qEnCVCD5BjyRhiFajkf0u5WeR9Bbi4v9d6PbgVJaoVQqF87Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aG3K1lbx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D3E606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aG3K1lbx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2836A1F000C0;
	Thu, 26 Nov 2026 15:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795706660;
	bh=6YNUCBOxZzbaaIa80epVPWrKGpoBdiWN4H2qUJKH3bg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aG3K1lbxJdNQGkoZwOuncDLk8MpFaN5wA8+RFmzyJ+5N+Ed9vr8n80WbRwTAvDGBi
	 3rq9sd1ripHtNaJjPbKsVp+i9nxZQ5jalECZQiEk2h1KgrcimxIR/BjdIyT1TEhj4R
	 O9+LAkHzts53apA71G6ZGEqvQHghuozgFbLmH32klpQGcyLEMJiHzgkYFMDT56qq1H
	 avGbhO8UaQFFJweFRkLGWevka2hsie7oZ6snAA2GVNaB9aOenGDeveZfWZef71+41h
	 ApaInbo/yVwhIjUECptCRrxh8vtb3MB9JEEa3jbZRDwGDIQhm6u4Hqc13DY9pzkMJE
	 fqKJl+t5ZbKiw==
Date: Thu, 26 Nov 2026 15:24:14 +0000
From: Will Deacon <will@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tamas Petz <tamas.petz@arm.com>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org
Subject: Re: [PATCH v2 01/23] arm64/sysreg: Define TRBSR_EL1.EC event classes
Message-ID: <awhPHldqbDgiVH8A@willie-the-truck>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-1-3f57cf3199b1@arm.com>
 <dfea6dc5-6a2f-4006-8bbd-37844b6b5986@arm.com>
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
In-Reply-To: <dfea6dc5-6a2f-4006-8bbd-37844b6b5986@arm.com>

On Thu, Nov 26, 2026 at 10:24:17AM +0000, Suzuki K Poulose wrote:
> Catalin, Will,
> 
> 
> On 16/10/2026 17:54, Leo Yan wrote:
> > TRBSR_EL1.EC identifies the cause of a trace buffer management event,
> > but the sysreg description does not name its architected values. Define
> > the five encodings as an unsigned enum so TRBE status handling can
> > refer to each cause by name.
> > 
> > The values cover other events, Granule Protection Check faults,
> > implementation-defined events, and stage 1 and stage 2 Data Aborts on
> > writes to the trace buffer, as specified by Arm ARM (ARM DDI 0487 M.c).
> > 
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> 
> Are you ok with me taking this via the coresight tree ?

The sysregs file gets updated quite regularly, so let me stick this patch
on a shared branch for you.

Will
