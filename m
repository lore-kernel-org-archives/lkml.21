Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795715784;
	b=pb6KBoJyUaO/kGYz6LaCu1pj4hzzB1MB1fx/Ls/cXX/q32uUCIXImNL+ahTSfoI/RaM9
	 AmECk1hHlNo4rEHrazxBct6m648grRVkl8Tls+dg0fCVYnMw0oCB99gmqq8NsBHhOf1YN
	 KtqcwHzf3CEOsCYqv4o4L/LDG3a/vvVnXWB18rhnl1+vKqoPAm1AO72/ASkEkOXtsV8VF
	 6r7W09OKXKcWee7GODdlGcrW0Lsx41fiB1tJO37RoLsMcQTrhpvhO2uAi9VfvDBhuS3Eh
	 QlknHoxaOK1h4qmPkiA+T93oXXg/4/Hl+w3rMLGsOa6idq3gFbDN74UZVxIOehAxUYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795715784;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=mr0bQkccB1U5mIDJr2ilPGqZODIc5rowh2SbF+JihyU=;
	b=SEzYNqUy+YqdPezFrfV3My2W0K+OWmxYjIArs5dD0FFQzFPexdnpg9DCOuIMpY4yfc/B
	 zabdCgAxCguBPNXlIMTvqC8Yy3i/1MWf6o4LDpe93Ow5Q1z/WAcvIiDhg4u+ftnp8Tsi9
	 a8gVsuxVsir9blQGu8Vsy9spypQHEB4H3gG0Uy13LWzPtsNT+7eGuQ0Z/1A0pnTHnrSdw
	 kdXytxWN5uUDRMFf7JebE4xjNkM1E7fIzjpqbeSR2gExhf8vv71DzwPiSNdea9vvTXXtT
	 7JVh4vzCfGy/p1iXYK3ikuaxsmRMtadkbYEzpE8r3ZaU7H2fuDAy6OscvEy3cINXxLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k51hQG8F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A549C606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k51hQG8F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A332E1F000D8;
	Thu, 26 Nov 2026 17:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795715783;
	bh=mr0bQkccB1U5mIDJr2ilPGqZODIc5rowh2SbF+JihyU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=k51hQG8Fjyj3IE03hcECbxNRM+dG6XnLjuBgwlrTJVy5rnwwFL7vFrgSDGLAFITld
	 5HO7uv+BE/78iJOQTHgwWzeQ4slzvZgcH4bMQk6AO6zVzfDZFj+urTC8gRO9HbBme6
	 HK3NFyHRwlXSZXXxAjPv+PAjieWcPJYfgvSML4BkjOGcN6tFmcadmJXo9MbkE1NzzZ
	 dhOX5jz2xudfH4A8tDroVaJrqNHrkG1AZihOm+iXm4k2Zlc+Esitr1KM44Gb1SCUxW
	 ewuGGJvfl6ArufcUfFkViuBfvf6Rb34Tmad3bx3NlR8/S5jG3m3Vm/05VCA64YO9s3
	 6Lvf6jETxDzLw==
From: Will Deacon <will@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tamas Petz <tamas.petz@arm.com>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	Suyash Mahar <smahar@meta.com>,
	Amir Ayupov <aaupov@fb.com>,
	Leo Yan <leo.yan@arm.com>
Cc: catalin.marinas@arm.com,
	mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org
Subject: Re: [PATCH v2 00/23] coresight: trbe: Refactor buffer and IRQ handling
Date: Thu, 26 Nov 2026 17:56:14 +0000
Message-ID: <179571394630.2992027.10346522745976163448.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 16 Oct 2026 17:54:58 +0100, Leo Yan wrote:
> This series follows the earlier TRBE buffer refactoring posting [1].
> The work is now split into two parts. This first part contains fixes
> and refactoring in preparation for wrap and trigger mode support.
> Support for those modes will be sent separately.
> 
> The patches are grouped as follows for easier review:
> 
> [...]

Applied sysregs update to arm64 (for-next/sysregs), thanks!

[01/23] arm64/sysreg: Define TRBSR_EL1.EC event classes
        https://git.kernel.org/arm64/c/9d3009259f0a

NOTE: I included the asm/sysreg.h change from patch 12 as well and added
a comment noting that the BSC encodings only apply for "Other" buffer
management events. Ideally, we'd be able to namespace those in the
sysreg file for each of the MSS2 encodings but I couldn't figure out an
easy way to do that.

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
