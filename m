Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776519;
	b=Lt5ecfRkXNDMOJlyHCWcyR00UvXwN58gSifpZ09z6gC5w0hvrXbTfCiGskxNqC8RITC4
	 Zre5TYiG7M5LA9Z0LxlP0tfoaTSnLkoxPcJS8XsOPka1+oZER23f2efGzbPWEu4svh+5F
	 vK3f8IHD+LaVPhcFQVxVSi0Jn0q++8hc7bKK2986bnZf+3VR4TqsjD+TZUWa0o2XaRs8D
	 H43qDhXhF6cLPYYXD79OdXyl8viZhdLN2yabLmKyanKoTDscgeZqRZq5vUCN3aoWotK+q
	 jrVhBKQIOLtd08VNzLcd09fejZaN4/QBn78EovjGfNViPhh3GqnGrKuGEzG5uOS75Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776519;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=xbIVzEbL8kVnnZTjUzEkeuHQU6E0lvFPu/zhf9T/vnY=;
	b=S0r6AC0CiOg1986kXKhWgbX7wAJS8tEFTOVgjzj6tj8mTQs5DuUClvyyqboipbFlFrbg
	 1W0s+HoVlnSvrGdW0RHEuAjLTX2VkYuOZS/d7PC6UqFBJSjiklBxSdQZ73dxtyndIZjLF
	 ixWBS+p/vsD+gqDB7OeOk8BbMQ3k8CcOSPRkqclVVzfT7DZCZIsFn8sCKTaA4K97GyS6l
	 wROkgQOAADGrrzcUUNYr0Mrq84yz41hLF6PHzHIrfioRjH1SNIQ8iF4i8oodahTzFuYID
	 RH2J7fv7bL+aPd7jjnW/tvAhueqw/xkSBwSvV55/xW3R7KzMZWmFMRo4pVmJG0mSwWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Kbr/pnQ1";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA08606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kbr/pnQ1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56ACC1F00893;
	Fri, 27 Nov 2026 10:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795776518;
	bh=xbIVzEbL8kVnnZTjUzEkeuHQU6E0lvFPu/zhf9T/vnY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Kbr/pnQ1fLCyX99zsQPvOOFZJGiaTl5WmYwmioPQq3E1aZ3NU1kb2zjhKu7ZW1EIf
	 YrxQDBSJGF72g7DTrYF9V83aFbKIplXZ6cwKCG6smoF+JJCCW0v9vEQaQzRxDe7/l9
	 9LGS9nRNnBFROCMkeWCOOTauod0tXo4AsLWv8Sosgv/VkDQBrLx6//V19amCCgSsJ7
	 iVahPWd9MFzx7qID/fHTNJUoJRDI6vFT21XqyPSmcyDvoNH/YUHDgE8kY0F+P6VOLY
	 nDI6KLMIU4oz86NmaZeuSa4HChBphsS5JqXX/KbyrA6WBAPu5BgtEOd3V4vVR7++aq
	 nvVvNwvxvTbZA==
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
Subject: Re: [PATCH v18 1/7] phy: rockchip: usbdp: Disable USB3 port during
 normal power-on
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>, 
 Igor Paunovic <royalnet026@gmail.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Alexey Charkov <alchark@flipper.net>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com
In-Reply-To: <20261119-b4-rockchip-usbdp-cleanup-part3-v18-1-fb325e336494@collabora.com>
References: <20261119-b4-rockchip-usbdp-cleanup-part3-v18-0-fb325e336494@collabora.com>
 <20261119-b4-rockchip-usbdp-cleanup-part3-v18-1-fb325e336494@collabora.com>
Date: Fri, 27 Nov 2026 16:18:24 +0530
Message-Id: <179577650427.3421.13284769035629435945.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=728; i=mani@kernel.org;
 h=from:subject:message-id; bh=Hcccq0AVhGSNy+J7A6d1nbyFCmB2XvvEI6d3xYzYvcY=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCV/7EWPHe5YpwqnHnHnu6N5jcMJFThHeLYpuT
 rGsyyzCW76JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawlf+wAKCRBVnxHm/pHO
 9WVbB/sEL9JxyPEqg/bZ3k/FFPESBckNQlW/bsQnS+IWMqUC/A5lpMnw18OZcT1hujJbY96wgFr
 727lYb36eNrxxtjB+tH3ezFhtMfrXixWd7ndiceUD2nuU/1fPm0X0RNlkvhtEKKLiXtpR3W2C47
 7r5gQO6qWfSKgzsvGpO9+VwbtjEaCrQz7lkAOPsi0KwkxguaPrD0e5ifFRseVJPaa3KYX4DK5ET
 /3lCnPVmKPOipnYW1HRzxzh1k4d7Kz9E4FE56K9IEGHS4XZUvRCwRiSX7jjph5gcyd1rlcD7mAC
 N72Cj1tkoDySD/JjXEuebB0QaSoc35T6QTXxqgSpKqw9XoJ4
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-19 20:40 +0100, Sebastian Reichel wrote:
> In the reset path, the USB3 port is disabled. This re-routes the clock
> going from the PHY to the USB3 controller. This adds the same to the
> normal power-on path, so that it behaves exactly the same (except that
> the clocks routed to the PHY stay enabled in the reset path).
> 
> This hasn't been done so far, as it requires the recently introduced
> PHY reset infrastructure to avoid the PHY PLL not locking during
> startup.
> 
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


