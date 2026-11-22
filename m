Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795318590;
	b=ZbTLZLGxZ4mykCptpypgvoIjEc8BBuDdN8S8tU22hfng7IJVr+9erCvZPdPSK69dDokw
	 wcGigk6ZdtX5hiBqyrvuWaURdcsq/A8d6ZyW69bgqi2tI+x36aK20gGw1SDl/Cm8WUzgm
	 JhaWg60MNB3lroe9pxyFTLuzd2gGGYNnvAolY4zGT+U7r7tQh7+kbMCJgY1fXqjAooKpI
	 hjA20gqFXFW/uq3F0vfUDSpOJZfiMhMona9Z/y8TFo3UfQNw9A1bu3t0U4T+2XRLYJzuA
	 KSqa4oj2xm43oNT8sa37Fw4sC7xShNDFPjc90Vfrtoh5kmD6UMVMpcS9IPi9ao5Qaow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795318590;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/tqPcpqVAecStEjIwZ9FM3/XXMxr61kp47GVYyXSz+0=;
	b=QDKQi7aRwaTEEfexV1dOiRSibQqZYz5UJDoE5XL8AC81VgtbPjmrhm3HKuPHGki6Q9CH
	 KUliiFTGS/CAhnRfTmq0H7UlEDZuR20uxb6+/vx62oyQwZ1dWnYeUtDDjdX134mgwY7fo
	 p9Ft2wKmGf51gpRkpEacR9sGjk6d7G2P3pkqKlNRLILRWmzMx2VzJaxly1X8ZVYJtc/GY
	 o/t3Gg3O1YmSGmyW5lUKmEawP3HQDRPh3QrChhTFWVPy/H5LOBrbT0B6YVVNvIbqtAOQ+
	 xiKdCtFzLAMBvOkPF9gXMke2hhW9yaxjC//rXdRveEdloPLXbbuDIoMBwMEZBOeyLKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hNKZ3mj0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58206606A330
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 03:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hNKZ3mj0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CE7F1F000C4;
	Sun, 22 Nov 2026 03:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795318589;
	bh=/tqPcpqVAecStEjIwZ9FM3/XXMxr61kp47GVYyXSz+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hNKZ3mj0sg55BrV1fPsLcJWaj2BRZ/pSdzlI4Rkw82CalLWZos5skIBLYcKkX8cEt
	 5MRUni+KV2TrU8EZIOmRscDjtLn1jTAEWd0/2kPlb52TtOpNQhcFzbpm6JCxen9NcF
	 faQBSheVkw+WW+pAYglCXP58YsjEB+ABpAMv03owuoB/LW5J3J6ZUyKiyfVKGK+yG/
	 WEjmXcH1XFFzUTR1sS1PvmmFTMq7NIxUEpaza+mDEvH4JFkQGh3wdmBqxVsDlr7/0f
	 vSrtOyzgTyXE1qkgC9V1cVm6vfnBpPFGn9REEsrIy1n+OOKMw5rBCKT6sLDSdIU0Cn
	 vBNvHGSEyZZNQ==
Date: Sat, 21 Nov 2026 19:36:28 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, leitao@debian.org, 
	keescook@chromium.org, hpa@zytor.com
Subject: Re: [PATCH 1/6] x86_64/entry: Unconditionally use -fno-jump-table
Message-ID: <awJjKo3Msile95tt@jpoimboe>
References: <20261102112549.714541309@infradead.org>
 <20261102114000.436794287@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261102114000.436794287@infradead.org>

On Mon, Nov 02, 2026 at 12:25:50PM +0100, Peter Zijlstra wrote:
> Currently we force -fno-jump-table for RETPOLINE=y || X86_KERNEL_IBT=y, which
> means that it is effectively disabled for most everyone these days.

-fno-jump-tables plural (here and in $SUBJECT)

-- 
Josh
