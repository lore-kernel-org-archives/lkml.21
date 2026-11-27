Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804773;
	b=sylDKy+t925KlMoomRkKqCJQC2tP8OnSDBt3Szml447oy0sqYzHXHTigRq9iuGhhwPy7
	 n0ZOSTOX/IS9Wp5jQNazcliCY5Y8vtO6/FsgxFmyqAnZMuFkjGo7Y+C6yvLy23lCXPW9j
	 ng0oIdWyd6fCwnJXJ35AGZiXTFVVUPFM04iDfMQflvAlavr+puGhOrkxCUQLFek7hqnqj
	 HM92dCj2EEjM3o5mKiKbzliRjb1gCRsSwaxCvxC96HhVt1MT+/hTtydDeW9JIOlLpns6x
	 Ur8lJfh9RtyNPhUP0d2ENpliSjm34hZXV6+l/zGDaib4EL0xAJNmte0/f2JKcHM0ZXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804773;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=21n4jgLl2RFy6qQf89ym+eEtym8Unqbb4FHCfy3oL6I=;
	b=RorPSFVJcVvdUb0qdyejI+rpdRFsd0XyYvrvxPivnr/dLbD1funMZjdaUb9acC2QB2cG
	 pyxD7bdqBAddkhyJbCVOn0smndAmm9FA8DQ5T1kQpNvN/2trhbuoM5gr7GLE7tkZ7VB0Q
	 QXAUeMNrMgkqxGqc9aBb14dQzsVHEbqDBDVZ5K2pa15VkVqrvZd4NbxMPez6xHWb34Tgx
	 vkRS7RmfKc2OKjcz+PZGzOrYPUlFVtwN8nilh66SS7zeifGbo0tanMn+YL0J6xcO6o5Wq
	 7SSUnHjqINtNVHqpdp29CkOMzLFFMhvWA6xEQJHYJsPgdleaWvXomP3WsahCE5WY09g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KGaJLABs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B101C606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KGaJLABs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 286CE1F00898;
	Fri, 27 Nov 2026 18:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804773;
	bh=21n4jgLl2RFy6qQf89ym+eEtym8Unqbb4FHCfy3oL6I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KGaJLABs79HCa38B6JkmspkKQmrssIT289NbQxgnRfXEZ0wT7ipArV+OKJ8CAqoX6
	 2cA+QUngmULIdHvvIvsnIkhq2qheXyR2ehpU0ER1FVHdmb+WTVLzgJKSIEkSxavH7F
	 GhqDVEhqoTQZCIw9Ro2NmZ0diNWyOKNC/LKCeTzgAisKTWJd/1YER95KkUBj7I6m5E
	 /VVBYWb3Iw1ojpO3n8YKi3pUrVJ3sHfnW5MnBo+6TGTbbB5GHyYjEsQm64rKN7c+0F
	 K8geFaDtMU5gxPnvX71ZoNL143tIihxD9uoMc/GRKurX49P8WqjYEpa24TwmaOc7Z/
	 7XMU5YNZsGwTA==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Yureka Lilian <yureka@cyberchaos.dev>,
	Marc Zyngier <maz@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Thorsten Blum <blum@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: idreg-override: Detect trailing "--" in __parse_cmdline()
Date: Fri, 27 Nov 2026 18:39:10 +0000
Message-ID: <179580056732.1451621.10540784344972164138.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261015161054.357595-3-blum@kernel.org>
References: <20261015161054.357595-3-blum@kernel.org>
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

On Thu, 15 Oct 2026 18:10:54 +0200, Thorsten Blum wrote:
> __parse_cmdline() detects "--" only if it is followed by whitespace.
> However, at the end of the command line, it converts the dashes to
> underscores and tries to match "__" as an option.
> 
> Detect trailing "--" directly instead of converting it to "__".
> 
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: idreg-override: Detect trailing "--" in __parse_cmdline()
      https://git.kernel.org/arm64/c/067dd30eb3c9

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
