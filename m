Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804780;
	b=g+z0LAKBS9r47g10gftPECcXm8d+cTasqajzcao9ZKVVpbMt6/Y33emFWEPu20vkQU21
	 5+1flbZipht782CkElNE1mR3ruPX+eI4SqsVDcBW9ACt64RBx1syBDTT4PXky11q5nOQC
	 aocMRbkBoT6Mm7EFMDLwswC+B77MQyr8v8Hi01G23WjK+kA+YfI6qImiWKC8eEvC7QSe7
	 MGcXz9kEufpBYVP9MIjGE1+y5LCr3/Lse2yiR9LwY7+8C65CfX7Rlv6jJ5ATUS1kf3Jps
	 wtfRC78ciA4QiAxn715dt90uCsKT+3HG59i7cetwL1aA5om/I5HcIwAUdb8aQQmICOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804780;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=89RMRIKWWNaBea6ane5hEPw20FRJlePAyLcF62QfklU=;
	b=4FzraDkoY4zX6c5PmMUMXoW4sFKKlqBwCEq+rAUA6hbONOLumsCih7GGjkGrE+oiPrwr
	 L2L0qkrXsjk8bF2ScTTc00NI9MjNodCzoensiyf0dOBFLjjxjhwyvvg9pgJ/NUTVUn/Uw
	 2gL0rsK5hZMs6kVuBk8I2MvQb9fRu1NHBXPAoTqCQ0Gaprea/z/j1sYVnDaCNrs6gSf7K
	 vAUAiSOC5g6KEzQdgtOvceFPYLx2+cw3aMd8l6E3ZIXQHuglKqm7xLIOXLOtFzmJrWLtR
	 /cs5+qEDJ+9pIsg21O7lJC0scKeizsUeoGvclFlDMLXGaNBA/i874CJstAbb3vEPG1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jQtt4+ii;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A2960A2611
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jQtt4+ii
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9981F000C1;
	Fri, 27 Nov 2026 18:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804779;
	bh=89RMRIKWWNaBea6ane5hEPw20FRJlePAyLcF62QfklU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jQtt4+iiEUJaEq4hN4+2BgJ/ay4ze84LOlKVtro/iTenbCE1eN2aDuzgDJURlAOf8
	 TVPK50fxKHgOU/dC4u4faJ0/0YodGF6xqo5MSJDE/gDcrj/WdgLkcLJTQBHhW7T9Z5
	 pduIqiWoMC8fTzOXJHqj39wz5KHPmpnLE9cn1Zot2NCtojXvrWBzA6x2UL2xg88xqz
	 GlzLTtQY3CATZt0aJ57EwRkuvDgK9NR9mSs9crgc9aVdjus9DeVmGVBLH9xtvqJhef
	 Lze5GUh7LuEpnIGh89tdxKBjlOnBielMN5Tc7cw2nHRESU7MZKl03W8u4wnjRSBKrY
	 dx8RVnw2j+vyA==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Thorsten Blum <blum@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: patching: Use uintptr_t in aarch64_insn_patch_text_nosync()
Date: Fri, 27 Nov 2026 18:39:12 +0000
Message-ID: <179580147175.1460223.17763348667928173059.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104095943.97344-3-blum@kernel.org>
References: <20261104095943.97344-3-blum@kernel.org>
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

On Wed, 04 Nov 2026 10:59:43 +0100, Thorsten Blum wrote:
> Use uintptr_t for tp instead of casting it multiple times and pass addr
> directly to aarch64_insn_write().
> 
> 

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: patching: Use uintptr_t in aarch64_insn_patch_text_nosync()
      https://git.kernel.org/arm64/c/df82e34e4a18

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
