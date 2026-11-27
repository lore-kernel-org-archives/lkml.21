Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804986;
	b=YVR8EWoqCIvGdI1Q+gd+XIhblis7Who8MBEhZ+bqMfIeujsOgdSM0OX2XReYclmciKqR
	 /FIasdCQdcNUaJktg54mTgTR16f9y1yqssC+fEHC3Ch2kkZsNE7vaj8mHJtoaH0jagwhP
	 Dzj31uOiCJiEuttN8gCHhvzcXDWalRnbdDoa5nA+ivTyHOyEdgvKoxaiBY9S1BBBDMqIx
	 xbtzVlb6WneeuN/rJ625e5USOzvFilB7xWwdCcKTVXrKOJhHozY6iya0toT5n12bO3w3c
	 HrJxGUPoGj+inOxKMnHgRCGDhHZtX54NkEEmVGV0Cd1zuE6E+f19FtQZ6FzQKNKwVmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804986;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=qrI+q31BIpWtMoEbziu548DpuRgk3fdVsj3KMauVdqQ=;
	b=z7fbn9xjWb/qmbSrGkTrvT4+4BhQjPfSaXC3gekRejwIHhygx8pXskLLiG92qjVbZUEB
	 K04oDJvSyIsVyT4zp6tpiplutWp72HMIPqTfieg7qwIPwhDkB67WYYXga0IQD6RnP1LKJ
	 X118vaZWa53hQ8U0p7MiMZ18L1D1FwoSvJNaPgC/PqL4+rJQGaQFuLLWthlC8IqYNJTLK
	 SdaRYCkD6Y2mH10I0CGueKC0TwF2CJqL0aW4U1XKcb0V6N/OuGEaTE0AuLhjZ6bv0WzmI
	 vwwTrBHSCazPWhhl+BAStybcf5u6qtUo2r0ZdqUsECIrUhZHKfCLEK82PsPar23E0yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WPREk5If;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129D8606A331
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WPREk5If
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB8E31F0089A;
	Fri, 27 Nov 2026 18:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804985;
	bh=qrI+q31BIpWtMoEbziu548DpuRgk3fdVsj3KMauVdqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WPREk5If5fx4c3eNJOCqTPQJnLKG1UkUOw+ME9wh9lL70Eb4bii/CkcUosaOQHVZm
	 xYT28Bmw07Sjk1H4ANb2WECnCkli+gmX2p6T0A6docMsBUL+/UKF+NhGC+uxa8NCVn
	 YveYex0mi5DzkGsxF9o+l+l61Hn+jRx3K3BqL8YFT1uitTWyWU7vnurDBzBTHxe6pA
	 Rbmdjc6/rhgN65WynmuEGWqxbCrl8G5NlriduOU0rTIdn3ifZPFuwep1raWAEz3ESH
	 LzE1NhO8zTEjjIYr1YwJw5cBbIAuABjN0kuvhB5biMiMZ+jgjqiqUGsXrLqtOxOXKD
	 9K1VAI+S1nwyA==
Date: Fri, 27 Nov 2026 18:43:00 +0000
From: Will Deacon <will@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kas@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] arm64: Kconfig: Don't select CPUMASK_OFFSTACK with 64K
 pages
Message-ID: <awnPNMn6AIH17d_K@willie-the-truck>
References: <20261007-arm_stack-v1-1-b48dad5fa8b2@debian.org>
 <auCSG2OmNMQKp3dq@gmail.com>
 <auRxNDAe_tv-mCvk@willie-the-truck>
 <auR0kSCYyo31Inxf@gmail.com>
 <auSFVKVuGryqTgjG@willie-the-truck>
 <auSem6kzc2d52n-H@gmail.com>
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
In-Reply-To: <auSem6kzc2d52n-H@gmail.com>

On Fri, Oct 30, 2026 at 06:50:18AM -0700, Breno Leitao wrote:
> On Fri, Oct 30, 2026 at 11:53:56AM +0000, Will Deacon wrote:
> > Because you might have thousands of CPUs?
> 
> I checked that case. I built defconfig with 64K pages and NR_CPUS=4096,
> with and without this patch, and compared clang's -fstack-usage output.
> 
> With the patch, 62 functions grow by 512 bytes or more. The worst are in
> cpuset: update_prstate(), cpuset_write_resmask() and
> cpuset_handle_hotplug() grow by ~1.5K, to 1648 bytes. Nothing crosses
> FRAME_WARN, and the largest frame in the build goes from 1312 to 1648
> bytes, out of a 64K stack.
> 
> I believe this higher frame usage is still way better than the kmalloc
> at function invocation (the reason for this patch), but honestly I don't
> have real numbers, and I am happy to take them, if it is worth.
> 
> > Because copying these things by value could be expensive?
> 
> Hmm, I _think_ having the cpumask on the stack or not doesn't change how
> it is passed. cpumask_var_t is either a pointer or a one-element array,
> which decays to a pointer, so callees get a struct cpumask * in both
> cases.
> 
> Which copies do you have in mind?

Fair enough, I hadn't looked too closely into that. But the fundamental
observation remains that the page size and the number of CPUs are
unrelated.

Will
