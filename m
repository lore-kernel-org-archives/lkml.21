Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795261077;
	b=0CdrbTx+Hn1Pa+pWL19X19Iw7wRUqxorscUF1AvREBHyU/4DRxX93j7/64iWLuQjF8dw
	 ZH6YYRXqz33l67Yxsg101Plr16Qnwbp5O9GVBYZIJLv9fnjBZ/r4FrvEAqxEGuKu27Mo2
	 aKrjYds+ZBx7IXndn4ZidrZlCeGHezaumrf8RHRPWUh6dkN2L5Dw4W7X/ZtqU90IkBEWz
	 en01qXly6pH/eSw3xOUjss1STJvglUJugCCNlUtBrecf+7/5h+Qdl0NxasFaR/0IrECqa
	 hhCauFHhXEsc858RUsnSSapjShrxk4mKMMxBNZNPtz9hH6d+7NBAHsIaxA8Ke3YDyHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795261077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QWBZ24J2L01VeEpwZsAilZvLBxGps9oMKqAOB5tV14o=;
	b=mMhY+G1zSaRQlPw3Ljpr6lFZIaO30WCGxqBVrC6KspQvcZCg/+XlHGtrENJWOPwhRh6y
	 Eho+QRyk/bmF9pvQxOthSmVK7iL9J4Q9HzGJ+N0muFj8w+n+0LnmYqgOGxXNjTc0M+79l
	 rZ0+WZRQqbgEVHme9Sq9GFsi9BJBr56bTeSd/zkq0xMV+w6w6CY/hxyNoLlOvYoB01qgH
	 P6jt0+4kA8xaYedVJjRpK55N+nfEL4O4/hdBTpmBd5wKJA5O7P1mfGXvRs3PpmGPUxv0q
	 E9EsyFsH0hs99jPJpxjzsPNXu79RBWc6nKCt/oS2DcDri/wDAkXRqjKBuV5oHOlOt5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=pardini.net;
	spf=pass smtp.mailfrom=pardini.net;
	dkim=pass header.d=pardini.net header.i=@pardini.net header.a=rsa-sha256 header.s=google header.b="C/+fmriv";
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC49606A325
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FC49606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pardini.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pardini.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pardini.net header.i=@pardini.net header.a=rsa-sha256 header.s=google header.b=C/+fmriv
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b887ca9f5cso2450464a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1795261074; x=1795865874; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QWBZ24J2L01VeEpwZsAilZvLBxGps9oMKqAOB5tV14o=;
        b=C/+fmrivfDTC9cEzCN8TJCFXm4mvDOp8Zb5DvRINqYe+CZIjnSj9ZQYWMeftgURNEL
         wT6+UdMDYrKy8cGBl7mc3zPQXdOMB2dYQte3y5KERVlx1260ZIdBVbw1f2dCmyp/WleF
         azBlghCLUTmhGlYgC3tn/maDmXVD/+4ZPn3yvPmq7L8No/35PRDrLpQUB6fuTrNdbLGF
         rOC9iI9Q7s5eMjkK3JxtXIqpgrN4+oIJdeAqGy88US2Fncmmo82c+Mh4R/Cyq2sEh0n6
         DwEtwJJxHaneQFBNr8i/LuxikvGNmARJkGhsqCVQ3QVGTgAeMJZ8V+ccn1FnqzaOTWTB
         mHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795261074; x=1795865874;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QWBZ24J2L01VeEpwZsAilZvLBxGps9oMKqAOB5tV14o=;
        b=bSiDvOSF25Dwz8XJkSq9hiK7T/xmFFY00A7gqSbCYvhuSIOsY82ncTSzxP84Gf751r
         N9sawAUBxjTTfffXedgc5Ew9vvjIntz4Av8A2MMumNjQhdhifDj0Y5R1rYZDqQpspCQ0
         n6n+LnviDyvRi27qHrdhv5YE5O5/m1JjdIHW8WLXOK/Uqz06lr+XVHHJ1mB2IPhG3HmB
         J/I9VmbsXa0Ju2l0l7uDusJk9j8OSix8NxoeyDm3iD1ojhtqB3E/6sKEjP2BAKX+PX74
         3qWYLOL/4jDm3hmCRL8s6cq2c99bzMZS/hK9FaeLrhNPPOkATnqnFjYbMewS9cBMxHbr
         aMqg==
X-Forwarded-Encrypted: i=1; AL+hErEI/tiEzI+IpnPyHKLQ0N09/lWbNXgVer/zN1cCl/xl2Vq1R2V9ZHnUBJScP32LWjl0myW9AraibknKH+A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0AWdvymQOl5ftH5TWV7dz9dDACnorCQIEuV5t9TgaogCv1i4Z
	fifPxjlbElhktsBMef6MM2JkZbJUpIWDHf4l7GHAjsfH6lE7xlQKVVMdriHlD3aI7g==
X-Gm-Gg: AZFdTZdI5YhH3VyTUvB/9x0bbxnxCdY8hKtl0tGp/oAKeArsj38qtTgEEDjTu2Nn//J
	8uMUSORwTm8mbY64bE2tYzeQ/1c8iVnixOojdkwdft2rnzjas/LTLr/J8dYqFT7OVV6M1TBPyKn
	3YCeGHlF05BmalmFa2Rm31DwyEZ7ItvRu0XC9IndbINLIFUk6PYhvumN89OyQ0HcgFgG7PWkEa6
	wpQs5gy/em71XGwZNBTVXKJFoSXEeyXXH34x+1csCDu0Dw/nUw7Lu7q0rMYuOuwXlB3UtW/tmVb
	/O+Mmwpki6hFF65vVKzM2MwWeGxnoV7MnLS4uBHHZFB/SgJ6F/ojsT+BYC83Ghrq8Au9wff/sZa
	bQcoI8vN4LV+Och2g6HsL51JkEteLG0JEo/H88hBCjNAuZz37+JKVvxPBqGx9H0yxSxnUmmV6+K
	hzL+i1qCv/2oaeoQPZT2abZgovGN2klRJB/x0NsPmkMxlaA04xskOogyBMMDU9XmVNWOzLtfgwa
	C9XGJvXhmJokRUSf7BPfhPi3LPSvS4TXiGh7EDm/nt4HA77pfvtV7f1ozrycxTtsnDZbvMKexiu
	m3o6A51i3TOvonoTfFm1/jFP0qumONnv7tnbgWK00sPIohZbadGt9gxWjNVKMoScwUNcFuN2HE9
	3VHq1ty/dYjGKonDZMrqqLrdv16rIDK9jVH0JogVMjCHCTWBSuvygCa4J1KUE23XaOGpRSIotnN
	D2
X-Received: by 2002:a05:6402:1cc3:b0:6b8:7816:8735 with SMTP id 4fb4d7f45d1cf-6ba37cc09f1mr4099511a12.3.1795261074138;
        Sat, 21 Nov 2026 03:37:54 -0800 (PST)
Received: from ?IPV6:2a02:a466:4d7a:0:409e:13f1:8f3d:aa19? (2a02-a466-4d7a-0-409e-13f1-8f3d-aa19.fixed6.kpn.net. [2a02:a466:4d7a:0:409e:13f1:8f3d:aa19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e91c3sm2202346a12.19.2026.11.21.03.37.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 03:37:52 -0800 (PST)
Message-ID: <1cf0e772-e5ab-485f-bd6a-d1088e01ad1e@pardini.net>
Date: Sat, 21 Nov 2026 12:37:52 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 0/6] usb: dwc3: introduce Rockchip glue driver
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Igor Paunovic <royalnet026@gmail.com>, Alexey Charkov <alchark@flipper.net>,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-phy@lists.infradead.org, kernel@collabora.com
References: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com>
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2026 02:01, Sebastian Reichel wrote:
> The recent Rockchip platforms have a combined PHY, which does USB3 and
> DisplayPort as well as muxing the lines in arbitrary order.
[...]

Thanks for the series! Tested on a Mekotronics R58X-Pro (RK3588,
FUSB302, source-only Type-C) on v7.4-rc3, with usbdp part3 v18:

RTL8156 2.5G USB NIC, flipped (reverse, normal, reverse): 5 Gbps every 
time. Before the series, reverse needed a dwc3 rebind.

Apple USB-C Digital AV Multiport adapter (A2119): a SanDisk Extreme Pro 
USB 3 stick on it reads ~220 MB/s at 5 Gbps while DP alt mode runs, in 
both orientations.

Tested-by: Ricardo Pardini <ricardo@pardini.net> # Mekotronics R58X-Pro 
(RK3588)

mvg,
Ricardo

