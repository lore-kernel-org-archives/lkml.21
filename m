Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795659794;
	b=j6j1WloA8ayOlKeE72PBvl+0Zyg3/O92+C1VGZpjKkMqYPwsTlTzA7JdTQQ8V19ubd85
	 Mzhl/NDWW+LBNLsWmqKhz3b6xyLro3nG8ydG4sNVoGpiY95zG6FVfXkMZJqSiAHd3UELj
	 xIWzmHfgA6lQunzWUA1vM1XuHFVPVz8ldSZHIk2coC7GnaJyfliTY9CzvS1kR207m1eKU
	 /AJzHoZ5laM7EmrO0Z1S4yg0nWgJxeVkL8UDeeA/tClBcf1m+4QtxUKb2G3iJsr0bGkYx
	 8OMPMDL4gU1DAcw4TqjyMCPOpvpYNrUeyBRTX5rSzEImGUNTbyT9cNz5TawP7VsRMbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795659794;
	h=Received:DKIM-Signature:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:MIME-Version:Content-Type;
	bh=tBAer5mbEI2P84gV03vcEYGxCO1YYBq7hUZEwgArDEU=;
	b=mwV8P5wghcusBQ2zJZ5bev/na3qlDXIofRslvKIB+x1MsLBnRetDSK41QvU3yUcS+Aub
	 ZBTXHNTPBR39IYylBK1IH33f4uIpuaj+sz/kiRvxXI9ARg9LD/E2GCwjmHHvo7HjxExiK
	 XnPioUEDAMF3o5AmENdO3jovq5JVr+NQHZhNiwoGJAT7Cw20bfmSMMRanC4akBBQ6xeIa
	 MGKQ/9zwDckc7YozBhbVXhDxW7BprGRUJAXgIhRD6a84ef6YoBE9USKho1bacHK/EXXQJ
	 uP174JFlcHlXkup8FC13YvctL25bTFOihFNW++1pITHMZPeVscrEsx/fuVF7e0Be2cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SHAjJd0F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EC3606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SHAjJd0F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E34881F000C6;
	Thu, 26 Nov 2026 02:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795659793;
	bh=tBAer5mbEI2P84gV03vcEYGxCO1YYBq7hUZEwgArDEU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=SHAjJd0FqI1B2nYoUVany1KMvpDFyxjz0i964j5EBRmxNcAHQvq7X4oePGZqxKP6G
	 72WES/LzM0hnxXM/eUCSHsuslAqXNG+9si8irb9Z+tWUTWTIbU3IaFL4Kh4ektg5Dt
	 7SJ70/E0fp16HdBFSA1w1JjKs1sSZ4zXGQ6j8+MfC+3nAuAw7N0qLHZRze4GXreCTO
	 gpHdqyoH6Uw33/Mq+ctfNcIlZEefRuZqetKGTc4IcRPFBaD5kDksfZy+8sWAcXR2IC
	 hQigZMWMIN9b/9O/a+QS85e1Ey5sPHpGkXBqrC0oy95hNwFrAdBnu2EL0T+EHTGzrk
	 1HkJ+Z+dDX7fA==
Date: Wed, 25 Nov 2026 19:23:06 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Zishun Yi <vulab@iscas.ac.cn>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Kees Cook <kees@kernel.org>, Charlie Jenkins <charlie@rivosinc.com>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: Fix memory leak in apply_relocate_add
In-Reply-To: <20260509115100.1879716-1-vulab@iscas.ac.cn>
Message-ID: <a71f71b0-cdaa-4a14-55e2-6751881d3174@kernel.org>
References: <20260509115100.1879716-1-vulab@iscas.ac.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 9 May 2026, Zishun Yi wrote:

> The error path in apply_relocate_add() forgets to clean up the hashtable
> allocated at the beginning. But we should not use
> process_accumulated_relocations() as a cleanup function because some
> entries may be half-finished, and we cannot write incorrect values back
> to memory.
> 
> So, add cleanup_accumulated_relocations() for freeing all memory
> allocated in the error paths.

Thanks, queued for v7.5.


- Paul
