Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522978;
	b=zR8GJ9IzK4RfBsjiDCR5XsLqblChF1KLwVttI04SYXTE/SrQj6qDgI7vqL65pfSFqVPV
	 31/tdXn3j2ecG0IWmCr3RIQUyg59Iuc0sEcUHQs1Xnzw7Ou8TwMOOG9qZyf/Ix3lZeDrS
	 8wsBJTIHqxKv8Pd9v+HUjiWsZke4tVhhlyWlQg7CLAammTCZfmJ0wvSgmsXt90PA9IulJ
	 bCG2PrrNqXpOCDDpT0tKirT65XM1FUFsq/UHwXnfDsiTsbOFL/ygNm0zW7G6xSYi/ZNx9
	 52C6XT65kaQ9zAsi7tZDKylayRLNJokhs8IItxi58y7QB5e55Kg6iAKBFOvI50P+/sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522978;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=CZmnlRLrVn7TKC0eRYBcOv8qoLYbJZDm6R825+quuX8=;
	b=Ydi/vSYiIJk8qOeP+i20E/H/tE9nY/Cj75pcQqYxHCOoP0lTXvB2VLgPj09WGP+opWZk
	 U7w4mlxgmOtpJzDkbyg5Ipmd6xXAW9N8676iRmRZGeWbN8OA4xSz1/bBkM1GTncWyCEQ9
	 31lahmfZRTO8XkA4uouwEMOlTsjRPt7444FvC7AmtnRUuCJZnZ5DwMt036tpeoavVxxm3
	 OXtwXz8fBtALDWaNpxEWvDtgw4S4y4Pb57Fr4fsiW6/h6Q6f95V6+xNeJc1VrMgasGdVv
	 TTxqPy6KlefRLTNZmk4QoyUEiuCDA2sUZxSS5KYfoN8BP/SbfErss/l+q/H/lFOHtrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nf+81qer;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F76606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nf+81qer
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A12251F000D2;
	Tue, 24 Nov 2026 12:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795522978;
	bh=CZmnlRLrVn7TKC0eRYBcOv8qoLYbJZDm6R825+quuX8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=nf+81qerX3QWP87nKis5VHpOeiytntaO6Tt+zsS0VfhUnVtc9Gp0Qlui0Xe6bmWdL
	 AxoPZH0zXdx6MLO22CllsbfDe562pk8cDEsyNR2PBrzLVnktmQs/P+1Cq2auZqJn2R
	 08j2WPQyFIW83F9Z0eN8HuWYLKhX0/zIsybUYqOAzh+5La7EMu97AtP+upTpuSbEWk
	 1jSG1ZPHsmXzlWskT4A0+JtuJex0bQUuYt7uMrY314j706j0XlZmWGGJ7GXRRkMHbg
	 9DPOuUl9RmMpyhZc6AxeAblS0Vhw9HrfHPUOxebQs/yVjM2fIfDkslUTm5PXvSIEgg
	 O2t6TUE3fs4VA==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261106-phy-subsys-v1-0-9a443422e563@redhat.com>
References: <20261106-phy-subsys-v1-0-9a443422e563@redhat.com>
Subject: Re: [PATCH 0/2] phy: convert to subsys_platform_driver()
Message-Id: <179552297628.405998.9109278185683497000.b4-ty@kernel.org>
Date: Tue, 24 Nov 2026 17:52:56 +0530
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


On Fri, 06 Nov 2026 19:25:19 -0500, Brian Masney wrote:
> Reduce boilerplate code in these drivers and convert them over to use
> the macro subsys_platform_driver().
> 
> 

Applied, thanks!

[1/2] phy: ti: omap-control: convert to subsys_platform_driver()
      commit: 849bb62d5c2c30950ec5b8d497de6fb3f4060acd
[2/2] phy: ti: phy-twl4030-usb: convert to subsys_platform_driver()
      commit: 495f98f8dc61da7c5d9ad11ac7d07ee2cd2154cc

Best regards,
-- 
~Vinod


