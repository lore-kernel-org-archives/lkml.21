Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795007;
	b=TKPg8eX5NqraKoi+u3z6vwyQtuDWzkuYwxnCOSd4/satsB1Q9lKDqZ5ABkv1iBagyT+T
	 /rAe68zn84bOHOsgMDFL3TSWIjQ6Yw6ckIPrC/LZpUcrvXNAXZQsPX14aYTSJTegfr4ma
	 uh7T8314oLyk3b12JiCywHjdC9a9ZIR1sTSG2tXCbwW5VQKuHZY8flAAmouktjOzXWD7m
	 gUq8jSlGbX0bgN/CZ5usRHQg4RcITIiSO2NsMfHeBE5pIsSdBycaHx2GypvbcRynMdujR
	 E76mPPPZQSSbqOcBvHqykGeEMQH539ciYk5YLLNNgJ8byT6laNQkGXo3Osr/iEpZAiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795007;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=d2gkvcTQhqVNxfgCYpbytR0aMjvFOwtBiuoUNwkUCk0=;
	b=yIgqEBlbbcIjQTtAGD9t5Gp9oQSiP/I8EcdhuCK0mMIk4KJzzaDGrrIu2XUILIiuoZ7m
	 2ox2c9vnoTGG/tiWPtQAGgQ483v6WkETNZTc4WL2Y3A64TM3YV0wwQSqymBbhs0ln0jC0
	 sJxa0Os3eGeQfmMIkooECyb0xyW+b2Gv15slsLvrFMxJg1Ze/+PygMBEHUZjJ4lyxQwTW
	 KhnVFsdwOCdlNnUsliE8iEltvSWVzlh3oohkHZBRIugwoIeq0kkwCGr3TuXJ4soYhacCk
	 Gj64YkZA6tqBb1TobIqbXmRBigFfeG5mpP670HszSBc6mGYFSQNbIyOHKUzpkzL23sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SahMT15e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C11606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SahMT15e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34CB11F000C1;
	Fri, 27 Nov 2026 15:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795795005;
	bh=d2gkvcTQhqVNxfgCYpbytR0aMjvFOwtBiuoUNwkUCk0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=SahMT15e+Mw8bAI3qm/C8CkEpyrR3poZcyCCG+O3cQx/PUHk9GfyAd/1do4Wx09tH
	 SVZYDRZQ2Z3tFtdt9/SdkTl7EFvsCFwa35DZvfJdAX5PyssJSV9xNG98om1UcQjzMY
	 TgbhKZCxj+ZAYJKlG4mNFdjxKawhNhib8uQv0ai4DqlEHMuq2RwBzE+FKttsMu37Un
	 mFJHBoDCP2nwtg5kR/ht61Gan816Fj0/c/QkQn+2f/D1IWYp6+5iqAMeMmJV7XTz8w
	 knswM4qqBz92Rnqr7LhnPJZHB98XtO9jeMXitI00L7Ig19H/5ymjSVVNxP0aCNrWSV
	 7Jws3KBb1LkIA==
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
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] phy: rockchip: inno-dsidphy: fix 1.5 GHz rate units
From: Manivannan Sadhasivam <mani@kernel.org>
To: ZhuXiangyu <1194781887@qq.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Manivannan Sadhasivam <mani@kernel.org>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <tencent_6A9CF9A2529C8FA2C04933F2D5D1A259B506@qq.com>
References: <tencent_6A9CF9A2529C8FA2C04933F2D5D1A259B506@qq.com>
Date: Fri, 27 Nov 2026 21:26:39 +0530
Message-Id: <179579499956.13164.15319858609781281248.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1195; i=mani@kernel.org;
 h=from:subject:message-id; bh=JKpbtCK2JkAgBPs2b311Dibv7xLHsRcbwvwSIjvxYW4=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCag6Y2hXrBVdQE7US8NPgGPvLjUq4b8u/F+Rb
 8vCxkS4y5GJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawmoOgAKCRBVnxHm/pHO
 9UvJB/4r8pSs1S39KS8J9xLmWC1tD6KVIPYe/5oi87nxtREL0A4zFzNW4jB/UaVA0qFtCRryvrj
 u8XX/58IyKvQk1lQ/ov6I1lHpRHdjL/GA1L4erSlDnKsrIDbo9pmLE8gy4TbK6nTaPh0x+qXcRi
 xU5Xwpv+/KTNB7fg8AW9AiI0zUZDMOuQrYXSIuysKmytoOa40oggHDPNj+FqyrXFTGyvj4yuk0/
 y5WHSqoRkLVLgWR9optSPpCgnRNztbKEygHL3ac+IpbfOHtJEphlJn+PfbqxoLMFnvvO5OWA2v4
 4F1sBxvhsWTpr25gLtW2rq8Wg+yIsw1SB5ULHCrjX4o4e3LY
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-22 01:11 +0800, ZhuXiangyu wrote:
> The 1.5 GHz Innosilicon DSI PHY timing table stores its rates in Mbps,
> whereas the other timing tables and the lookup loop use Hz. When
> enabling a mode, the driver compares inno->pll.rate in Hz (e.g.
> 372000000) against timings[].rate in Mbps (e.g. 400), so no entry
> matches. The loop falls through to the last, fastest entry and programs
> an excessively large TLPX/LPX counter, preventing panels from decoding
> low-power DCS initialization commands.
> 
> Convert the 1.5 GHz timing table rate values to Hz so the lookup
> selects the matching entry.
> 
> Tested on an RK3506B board: the panel receives the low-power init
> sequence and the framebuffer console displays properly.
> 
> Fixes: 785a9d5bb145 ("phy: rockchip: inno-dsidphy: Add support for rk3506")
> Signed-off-by: Xiangyu Zhu <1194781887@qq.com>
> ---
> Changes in v2:
> - Split out from the combined drm/phy patch into a standalone phy
>   subsystem patch per Heiko's review.
> - Limit recipients to phy and Rockchip maintainers/lists.
> - Fix Signed-off-by author name formatting.

You fixed the sob, but patch author is still not fixed.

- Mani


