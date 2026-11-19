Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097908;
	b=y/rmbVscN5+Ia4jJwyNFDA7TDolAU+fF2DfbfndnjH7kct8Z+6XdtBH6JqTTcXCcb1Nm
	 phJTgjfXGox3Ns/HtMUkrK/M0GkgjsQrzDfWzb6Ch4IMp5YASEsPUOSBzNYZrYIDL/7zA
	 pk4D4NnK2vtGPT+zz9/31T9N7lAiWm9G+XeOj8KIxCUKTufx/LN1t3IiEqYEfoqvqcDUi
	 LWPmFVNDT7ozukb9EXPxyNV2YY0F/WaBjxVnevx1m50Cb7fg/EjxAhUxesDW9110hrFsx
	 /Hpwp301XR+qQggz56DPdsFWbl0i8Ym+4So939HmAvvwwFGNkTkjPJZc8k3P718TK7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097908;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=RigG/IIrtQGPjiX3IVH3cpZVDq33wmqZHZUoX+hefIc=;
	b=K3yhYpCmid47hV4NJFJg14RIGZ6OdmxoV0AQyuu0HddOh41A7oIdVpBHc1Y+q7inD8ya
	 X54v8s5sbBcFGvRvIQwClNb0USBjn/Gn0qveb1MCRMiql1eurtGdrpHPli0o2/GyZH/09
	 8odT2Sm6QmhTZBTVkxPd4P9DkkS27TCKTbrmm8RkAIQW0fOZ8iCTwRXtjKCLlF7I1Ru7f
	 UbXtsLFAQxq25U4+zuViN4x7kJcOUNVGeiZuFsx5teO9WH8VR9sOr++aI6LMfSSPX0VIj
	 6EKotBoRnnIfNsAhryoXtiUff/01T6qZJ5nwlnMZD/uhBT2U7ui25qDg1viVWBzS/GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ofABxdmM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099E9606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ofABxdmM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 922541F000C4;
	Thu, 19 Nov 2026 14:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795097907;
	bh=RigG/IIrtQGPjiX3IVH3cpZVDq33wmqZHZUoX+hefIc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ofABxdmM6JNAZpa5ROmlASSoJu2N59+mq2FfadCmx0tnn271Jz8ViopgORKeHMJzn
	 o0UEsadPfN1lfEB1ze7EPLwgpGkCd97L12Ihub2r8JKomDUCkS9fHH2lILkUeRRylV
	 90s6DzFQgiR7LiI78Amc5L/6B5AH1WaLQa2OD0enE9rjDYZSU4OmV6u/+S6zHDwVRg
	 g9TcIuibDd/TBO29EGdmSnwVO/qhs8dDnhhwVxRbEm+xcKyA5CagHgi2XAxMPwUpgu
	 1RFnJVEtBwwyMN0+TBBEKkP11kFRbaXLKse5WyBcGGmJ+hD8Cwhv/fZVdYphWGJXUg
	 piqTy+nfQqaBQ==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Francesco Dolcini <francesco@dolcini.it>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
In-Reply-To: <20261116162409.218059-1-francesco@dolcini.it>
References: <20261116162409.218059-1-francesco@dolcini.it>
Subject: Re: [PATCH v1] Revert "phy: freescale: fsl-samsung-hdmi:
 initialize default rate"
Message-Id: <179509790520.1342948.6264004404640336761.b4-ty@kernel.org>
Date: Thu, 19 Nov 2026 19:48:25 +0530
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
X-Mailer: b4 0.14.3


On Mon, 16 Nov 2026 17:24:08 +0100, Francesco Dolcini wrote:
> This reverts commit c01ccf91b257741e9edc374a465126bae9ae4711.
> 
> Programming the 74.25 MHz configuration at probe fails on i.MX8MP boards,
> the PHY probe aborts and HDMI is no longer available:
> 
>   fsl-samsung-hdmi-phy 32fdff00.phy: PLL failed to lock
>   fsl-samsung-hdmi-phy 32fdff00.phy: error -ETIMEDOUT: failed to configure default rate
>   fsl-samsung-hdmi-phy 32fdff00.phy: probe with driver fsl-samsung-hdmi-phy failed with error -110
> 
> [...]

Applied, thanks!

[1/1] Revert "phy: freescale: fsl-samsung-hdmi: initialize default rate"
      commit: 11cb7e479a15b631cbe5f9038a28de0a1966853b

Best regards,
-- 
~Vinod


