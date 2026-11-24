Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517996;
	b=A88nDVgDCf9Gbq/7YIMbOZnl6Oz5eAf+p567MinwEGdPtA1DaVg/EmWTlQVdHKH/0pW/
	 ykbjzu1nERzjYptmDN+dJ9Ql6BA+MAKJkQPC+YDz2J1spYLfmO0yOF4IfgS/6j00zVCsD
	 BAyH1MqWmkc/dRY1nG41WIrjATcJwgnaoSwcTusw2M4tSMv5scyNAFUisgPzT3E3BUPnv
	 2xpAUvNb0Ic7Q1td6fIuh9WU1NCgcDyT7GyD/I26qdmf7g6ZVOiFxWruAnri19SUHvpCH
	 Or3A96WlxhQVzo3UsICMRr/MFRHDju1WdpDOeG0ysUWHCWkEJe0sPt9RuiKcNXjIPTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517996;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=cF/6djvTEEZ8CwvBNurkZV9cycUNuzsQhk1QXHo3YTE=;
	b=p+dkuNL0UjL5v9/dFfvuxOtDZfgDUSwLfleNl/dF4lL8GS/jWI488O3sS4UVm8Dspj2R
	 WGzYk+cf9Yb5ZdK7G83Q1D01iEzyBaJSZ/UEYFVLzqrbDmc/7ag4UBPiDJhVZY5lPXM8U
	 sSPCM79J9AFot31qp29a+OfeZ33gn9KOZlyeak6E26FUyseQvvk6jT+BsboT2dtIf04ch
	 264QTB2Gakad/7jUuGq9qCYdSRHlhwTeBjALt/XgPUeLwAoCiGLxNnpa6F9bnb8npILmi
	 v9xCWdsDB7pjU+iYi3VHvcp+LM8P95jtRBzSQ9VJWpcRpa35Qh2/U3Xx8UEtwRlhcjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S5lkZfm+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D337606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S5lkZfm+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F1BD1F000C0;
	Tue, 24 Nov 2026 10:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795517995;
	bh=cF/6djvTEEZ8CwvBNurkZV9cycUNuzsQhk1QXHo3YTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S5lkZfm+MFeGOIpNjApOliu/J4XeoGuotqSW8wK/f7ig32L8dv3OhCmRrlU6jVo2b
	 U9IaMqlp2njS6zluMCSHW58wHBZq9UF+PZusz+GfV1WtBYwTMQDxIWiI3DeDHNQTl+
	 jrlMVuM/nBJ1lu/K37kbL4Q+CWfKqDAM5CyMnYt55k2yMjHyoZ/SNDkaW8g+OUxKFP
	 8KLRQ0f8HQVbAaXcf6t+nJGAB5Rdr06S2PN8EkLY6iuYqkPku2UaUGoTDUwramM8Xg
	 pfGvshmv1XsOvMaKul6u9Ke9pFmxfAUomnHM78JU83/452AoIrnEKYZFq1LL+wnNsO
	 O0hIIYTkg4vqQ==
Date: Tue, 24 Nov 2026 16:29:51 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: ti: Convert to subsys_platform_driver()
Message-ID: <awVuJ2z1N1ZTGFCy@parshuram>
References: <20261104113337.1634199-1-peng.fan@oss.nxp.com>
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
In-Reply-To: <20261104113337.1634199-1-peng.fan@oss.nxp.com>

On 04-11-26, 19:33, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Replace the open-coded subsys_initcall()/module_exit() platform driver
> registration with subsys_platform_driver().

You should have split by driver. I have picked similar change from Brian

-- 
~Vinod
