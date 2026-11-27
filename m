Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776581;
	b=rkxJOcaPD1RMUV+nX6RDRt/wP//YX1c5vHxy40qU8Blb5N3dhKk2k/TRNeAbbsjsJO+1
	 pZosjJjml+b+IwbWELVx4edYz5DibNBfjoh8ni4mFqTi2EEcNvU8vYAdmda6l1GeJKGXn
	 42oeuvzKOeUNWxHzNQmgy2q2njNx665IeGkK1v9I7V9S4iJTnEiBVv8v0QPN9PlOYvWhv
	 VtIgkRGA+1CEHiVlObBTxRDKzmAe+3YqJYP61pJXEnZSs+fukum9/5elldrIQKk7xudvb
	 1wvLZ1Cv8S2CZsAw6lZ3RYBGlC2JVJ95JsG+BBsAZjduOtEdvBmCslsNt6GL0MjXaFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776581;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=IcEA9dPcTlpji09bXny7ezXUzoQ2jqu5L/vdXff+2iI=;
	b=QM0el3/f7YIkEeacIL8YaMqVEWd7lymj0/4p/UsecE2/lmoO4/h9o1drxygUjLYpwuNk
	 sQhVzraOXrX4aQpnih6vEKsO032naUH6yYLgtb3C77fLkuUNKAye7RO9cYRHAZbl7+Ak7
	 ZiMzwOc6z8Yk4aNIQCPDAEfq7AXqjK7TR9+Oe8L8Zz26zuGmeStdF+HInnTzcsVVJaEey
	 qyrFsjy0C36jUv3FM2VZ0qWK0jxHdJ3LHLYBgbUGeuW9eWn2g36zc/hB+tKo91HWgb+AU
	 2k7W+Ul152cKGiJrGzNEwvBCYxEIk7CTgAh4miIUoN3ir4fgGCkhF3H+rZEYels00dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ePJclbi8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7202B606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ePJclbi8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A3CF1F00926;
	Fri, 27 Nov 2026 10:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795776580;
	bh=IcEA9dPcTlpji09bXny7ezXUzoQ2jqu5L/vdXff+2iI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=ePJclbi84ZZO1HynMHU6EZ/+5DN+Ag23NvYsf6I9ENlea9KmJR2bKDu2xsRTgNr/u
	 sbabWgtrv1X/kP8CP4eqVuPcmt0p0ib2KZ8ik3jI9L+EejrQSQruVFwqqdPACWdCGk
	 Sllde/YIN+tc0dy9vvCPaMet4petTylf3Lbj/O744yCCvvaqcRRlUVmIPUtjGA0e5+
	 ZaCX6/OXjOvNjlTxiCWZB0+uW51s4/Ve6bJpqMyl2nU4JsxSqDCA4ZLhBsudt+tqWb
	 jzJQiVe9/e7Ky0jgrsGb6Fh3nUm1gllKKccCu67WdCoIObdSIhGnYVei7t7EL43ECq
	 gee3z8a5hrRcQ==
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
Subject: Re: [PATCH v18 7/7] phy: rockchip: usbdp: Add DP lane setup to
 power state update
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
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Yury Smirnov <yurymonzon@gmail.com>
In-Reply-To: <20261119-b4-rockchip-usbdp-cleanup-part3-v18-7-fb325e336494@collabora.com>
References: <20261119-b4-rockchip-usbdp-cleanup-part3-v18-0-fb325e336494@collabora.com>
 <20261119-b4-rockchip-usbdp-cleanup-part3-v18-7-fb325e336494@collabora.com>
Date: Fri, 27 Nov 2026 16:19:31 +0530
Message-Id: <179577657153.3421.994234967991437071.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1047; i=mani@kernel.org;
 h=from:subject:message-id; bh=iRJSuUy+SAo/tkGHxCiOt5iyW9VDqeVLmgn8opG8SWw=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCWA+eKy4RGmNpnPAXM7J0CYb9Ln3q1ViRZtTb
 ZD0qD9eVu+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawlgPgAKCRBVnxHm/pHO
 9WQNB/994YBqzxSkskHsh6yfJEEnIP9O10oejnnuT4tSbUhaNqeqLXS4oUGDgnH/RzcJzeVpSJ0
 OT5iEUMjEFodXHLQ9hnOzxzl+GRf7Tmybqrn4hJuWu0IVepatW4Fv/mY0zRtZT7dJ5YRFyCc3vt
 ccd7UqaRrEu/1YNqdC1f5dVqko30LOnq0RmO1Bmb7KD0dc5SFA5oZSl4k8z/V6I0Ee54IeTfrMQ
 uyQZWFkTrZ2i2MSsdBSNCvnPtxE3UslVGY0sVH2wGOabN/fkcFsXn7q+4vB6DhZC3sgD3zJ9t8W
 4YvcekKk7qbl8UQt1+xwkno8BF9CgBlZ9fQW5f62nW8GLYZm
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-19 20:40 +0100, Sebastian Reichel wrote:
> DP lane map and AUX orientation are only configured in the DP PHY
> power_on callback right now. This means when the DP controller keeps
> the display enabled after a cable is unplugged, it will not come back
> properly with the cable re-plugged in swapped orientation.
> 
> To fix the issue, we update the DP lane mux configuration in the power
> state update. This gets some special handling, because calling
> rk_udphy_dp_lane_select() accesses the VOGRF which needs the DP
> controller's power domain enabled. It is active while the DP controller
> has the PHY powered on.
> 
> Apart from that VOGRF may lose its state when the DP controller is
> disabled, so we keep the DP PHY power hook as-is instead of fully
> relying on the power state update function.
> 
> Reported-by: Yury Smirnov <yurymonzon@gmail.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


