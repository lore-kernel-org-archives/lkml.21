Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804777;
	b=3NrTa70fn+pS49tz14fMF09w83thV6PHnEj0BcZbZZ1v8MhBu1BR1GmQEnxz4xDvF3Y8
	 b9aOZP0zUQJaPLB92jvX4xN25HC+fPkYIE0AUWtCVpKBNMSGEhM6qeRzmp3wKkAVUk2/4
	 jEWqRE3D2hfWKOVwJr09VzZ/sG40P36i+s5plx+6Kp2j+TkNUlZ3BE6DpPbF4JyxJK6L6
	 RF15/4qiwbJRPvmqtAB3BK0Vue+7KD5JpJ8Z91S8Do9gOM/orsvfwawOGN+PF3oGPwbH4
	 jmWnklVjhZvCvCg8l0cVJdCnA0/QIjDl9RxYkQK5Pi3sC9N2TLvlivp0m45xT7LgNQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804777;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=lbGYiPDuIZCD0wowch3/zCTgY7l065ITvzcpq4lCQS8=;
	b=UMv0GrhQLqPg7bADphBvvR57vI4/gBaSsT37uFRGcHm06GyQC34tQUtP3aD0t9t159zB
	 hlieyQ2gt+ByxIwo5gKHFRB84decnJm56GzphJLQ5otZuBWAWbC1sEe5qDmn7A2RmgrzG
	 EfPPPku+hsNCVfsVawMD4PBi0KpCPJS3PfH0DM0A4eo8+9Osb9dIbJnwF2Cm9c6vWb21X
	 cd0jvUgN40EGPim5KTXL0jWRxnygDl8qc3KWyuXahDeLCdx2Lwc0/Rzhx1NLzcb0ahvk3
	 zgJ2Pxk09sbU8UmPfP/Lmtn+l1vIwPIJapntj/V5bAfse9PFkOeHsZSKOUBvsRjPoEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aMSMishb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042FD606A6AA
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aMSMishb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABBD91F000C1;
	Fri, 27 Nov 2026 18:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804776;
	bh=lbGYiPDuIZCD0wowch3/zCTgY7l065ITvzcpq4lCQS8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aMSMishbltparIC+hpsli24VvITjp1M33HJP+WuWlal3p7XEew/5qkThNmFNd90IE
	 ZzGdDtcgNMr3vPqcGMBu5Y5tN4Sz/NhfdrAICTvD8Ws9bQ/Q+sihCq2LFgUjixMCvz
	 tHdcAW7I7mCizl3zCTDm5pjNoHL1OAHPMuMcCegNXjhBJxUjBrmt6WF+N5ZGg0kfA1
	 7iCLgKLvGgLC39k7vRirqqmXZzISgvS6u41+IQpCndXq2vavKrJIW4vKMAImTvcINy
	 OJ5YxEaayf3JmDVevVhfJuSZQwTSo9UHo+b7LZbKQv40xDxmvXsUmesnhiOnLWRyBI
	 fU1y+2OsCUzWw==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Yureka Lilian <yureka@cyberchaos.dev>,
	Marc Zyngier <maz@kernel.org>,
	Thorsten Blum <blum@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: idreg-override: Use property length in get_bootargs_cmdline()
Date: Fri, 27 Nov 2026 18:39:11 +0000
Message-ID: <179580045521.1450371.14748209917362714057.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261015192810.395975-2-blum@kernel.org>
References: <20261015192810.395975-2-blum@kernel.org>
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

On Thu, 15 Oct 2026 21:28:08 +0200, Thorsten Blum wrote:
> fdt_getprop() already provides the length of the bootargs property. Use
> it to reject a zero-length property before dereferencing it, and test
> the first byte directly instead of calling strlen().
> 
> 

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: idreg-override: Use property length in get_bootargs_cmdline()
      https://git.kernel.org/arm64/c/cfebe741eb91

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
