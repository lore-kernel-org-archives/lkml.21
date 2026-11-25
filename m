Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620517;
	b=r4zxPFisrBM5b11SYD5QdUhPuH+6nAElmLrIsgMCDpSJ2pTdOBljcuEkBoVfijND++IE
	 Knsi8c6umIKuJl+UUkcT5T6oI8oginTcRsV76hPgruwkurcWB1rkLg5xKndxb9Ll5crCq
	 bRtpbxi7dOwcElUBOIDsY/L2sWR1aQBUsHBhIwHg5JTn0wxUQiDISGmGO82K1kxnMrUk4
	 mE1hBXUZe2xYtq25HKTpdv6hz+ZSqQ8Bo7a/ngpyfQrQBXfiKZiibIMfa1H79fDhfouyt
	 g0GFmxT24pykVRkVYQNlQC64IVQLEpwKYBTWJViDVpPQPkJpxSjVu2DgL0B/OfQQltA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4tA4R3M1tGeqFN2000iz5S9/N8qTO7Ro+JjVYjnPFCI=;
	b=DJ0yz4uXvmpF9d7yVvwJm/yD7SLww0F1qa4YOTZ+eenrPz/MXc8qWo58lc5R/rqSYvCK
	 YZcxNPQ9aWtIsAwYR4G3okGU3upO4HMVo9eYT+uVXZHNuHhavnypyYQiJkwV8POUIfxP9
	 Ma7Z+Qy8PlVcUvBtTu1eL4UlrfVVQgrdM+Ci+Jhw94usuX3hAPtIof/f80wOUZhU1KfWY
	 KtTfyj46ncJwxUzgxu4J0i/E95xFZkJOjrGeT3GzgcRTVi1lywEf1DBjiFCvFcaVnHu5B
	 mh2k6CQjNP7vyHRs1vdKY4zEFM2IcHq96bgcUuXx3BJb+CE9cKgzZ+SMUmLrCuLagcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d7AJtqC3;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25FB606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B25FB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d7AJtqC3
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-49355a50d11so292460f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795620515; x=1796225315; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4tA4R3M1tGeqFN2000iz5S9/N8qTO7Ro+JjVYjnPFCI=;
        b=d7AJtqC3ItPc1GagK909ghnkB75xgGBmrWvrF1nHM8yjGyUu+GypKXUncZze9Nq+em
         a69o4b4ituyrhiECVj1p7plkFrQgUIAHrIxis+RvnVbp9yYs+5mUkE5PLtYA4u33cC5c
         1KUIHM5bQsnKTMuT055SSpwdHcAmbHOMedkTsZiPv7QgQQWG1juRDlANZ4RRiyKQYlDJ
         T3rivTor3/LtHWpWutwaNWl6dHxC4QnzKzuCigvarCYXWfApjNBqvMtYua4AYUH/i31f
         IpTCuGm+6IP1nxHBi8ggylJQPkNIgdykWRDhfxz9Y3FNbbQW0EN5kMXsRIwEoZZcRjRQ
         +YOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620515; x=1796225315;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4tA4R3M1tGeqFN2000iz5S9/N8qTO7Ro+JjVYjnPFCI=;
        b=MDohkoOtSPROvXhbYwwhr1/L2IlICYwYY5glGIlyXVthdWp2+6TIZ13bAvqKNMPL/H
         Ce0pgS4iPgLZOuymNFKagTkqjfxeHOh4iisJOfbH5b97jq2hWuUEQdmFw/WgrWlcNawd
         w/xrFjhFbhbl/ItFmYbGTnBZiIoU7u1EX0zK0ASTyucakMTGxEGCK45r19iMznrrA0qO
         BbycRzXGKQg85obVEJIa2z6TFe6U8GAuWlR2m/DxE3nG4tsZTc9O10e4m70X0zhjjyDD
         DxspMSVCinqVF2JCvr5PEO4nnI1TzmPV5xY6wVR1YTv5Y5Z+ObS11S72H+lbSCT31YPj
         ZtVg==
X-Forwarded-Encrypted: i=1; AL+hErHA2QebalYWN2foRVkQZrcMbrUUtuw+pai8GVsGPtSXxnZ9vwx2IvOJNgwhaZeSJObKFU4uvAa7wxm+doA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WLgHTId/1xO4T7gVlOAvyWF5haMl02aR9YdrHIHu9Fk3mP7fR
	4LXBYhY00IE1AuZh3NnInBbEqZIu+sHadpIr1lbQq5koTkYpBJ2jpdmh
X-Gm-Gg: AZFdTZfaKo1QDNi3sb/VYPbvKHfRY5YBdnFCAvHouDZba/jHiXR0WcKVYExKcJXgZhd
	76k23QPWLL20nwrkw7tYBMyDYcpfwGGwenFXZF60HGRI+gNmN7y05+4m3KnN55NaMYqAqQU9bGH
	OJOZAutKb1WIgzL8iLIJY/hcwqeHCg54HheDa5j2kADu1niVMmzayHOogwtxjYXQFlNn6kq7I0C
	ta+ZSOes+JTT4DDeWx5pt8QsLlJljX3mB7yhMxoVi+0pHj913L1Q8KhfErj0OhV0zzzYoWYIzrA
	22ygQFwXKDkBj4wU5TYyCpVbIphcblfX06+Ic5Qh0Aex8TFS91Veu1bWmi65+N6rrm/Sj2T7rka
	KHabEbnONi4fcVsmH08KAAkVymBNXiD3maIqBXnE+CZRrnnk6qBuu2dERuSxlDBEor8PD0YaKmM
	+Pi6QIDHTGjxQp3bJ57qt3dd1eg+MJyur5kqpswH9KyGtqdbgx6zWNgCabtFaoEPSzhJr+E3WGR
	lZoFFLZYpat7y0hr81TkZliE97elTLORRfHNTBQBhWM287L70v5tcUTIke2VruM0lZHsh0HI3W2
	8jac5TDNhloI/wEJJImV
X-Received: by 2002:a5d:5e01:0:b0:4a8:eed3:770 with SMTP id ffacd0b85a97d-4abb47b25eemr37771369f8f.4.1795620514919;
        Wed, 25 Nov 2026 07:28:34 -0800 (PST)
Received: from skbuf ([2a02:2f04:d401:2601:d3cc:6bc:a861:f9da])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm34443459f8f.10.2026.11.25.07.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:28:34 -0800 (PST)
Date: Wed, 25 Nov 2026 17:28:30 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Aksh Garg <a-garg7@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rhys Tumelty <rhys@tumelty.co.uk>, 
	Manikandan K Pillai <mpillai@cadence.com>, "vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, Hans Zhang <18255117159@163.com>, Yao Zi <me@ziyao.cc>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-phy@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v5 6/8] doc: phy: Document some bulk helper functions
Message-ID: <awb-MUCgZJn94Lbx@skbuf>
References: <20261125043639.249525-1-inochiama@gmail.com>
 <20261125043639.249525-7-inochiama@gmail.com>
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
In-Reply-To: <20261125043639.249525-7-inochiama@gmail.com>

On Wed, Nov 25, 2026 at 12:36:37PM +0800, Inochi Amaoto wrote:
> Document all newly added bulk helper function, it can be used to manage
> a set of PHYs automatically. This is useful when the driver want to
> simplify the management of multiple PHYs.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  Documentation/driver-api/phy/phy.rst | 40 ++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/Documentation/driver-api/phy/phy.rst b/Documentation/driver-api/phy/phy.rst
> index 0865c2e94eec..cae3d4700814 100644
> --- a/Documentation/driver-api/phy/phy.rst
> +++ b/Documentation/driver-api/phy/phy.rst
> @@ -114,6 +114,12 @@ it. This framework provides the following APIs to get a reference to the PHY.
>  	struct phy *devm_of_phy_get_by_index(struct device *dev,
>  					     struct device_node *np,
>  					     int index);
> +	int devm_phy_bulk_get(struct device *dev, int num_phys,
> +			      struct phy_bulk_data *phys);
> +	int devm_phy_bulk_get_all(struct device *dev,
> +				  struct phy_bulk_data **phys);
> +	int devm_of_phy_bulk_get_all(struct device *dev, struct device_node *np,
> +				     struct phy_bulk_data **phys);
>  
>  phy_get, devm_phy_get and devm_phy_optional_get can be used to get the PHY.
>  In the case of dt boot, the string arguments
> @@ -129,6 +135,21 @@ Some generic drivers, such as ehci, may use multiple phys. In this case,
>  devm_of_phy_get or devm_of_phy_get_by_index can be used to get a phy
>  reference based on name or index.
>  
> +The bulk helpers are useful when a controller operates several PHYs together,
> +for example the lanes of a single PCIe port. To get a set of PHYs by name,
> +the driver supplies an array of ``struct phy_bulk_data`` with the ``id`` of
> +each entry set to the corresponding PHY name. devm_phy_bulk_get() returns
> +zero if it obtains all the requested PHYs or a negative error code on failure.
> +The driver owns the array and keeps it valid until driver detach, when the
> +PHY references are released.
> +
> +When a controller needs every PHY listed in a device node's ``phys`` property,
> +devm_phy_bulk_get_all() obtains them from the controller's device node.
> +devm_of_phy_bulk_get_all() does the same for an explicitly supplied device
> +node. These functions return the number of PHYs listed in the node, which may
> +be zero, or a negative error code on failure. They store the allocated array
> +in ``*phys`` only when the return value is positive.
> +
>  It should be noted that NULL is a valid phy reference. All phy
>  consumer calls on the NULL phy become NOPs. That is the release calls,
>  the phy_init() and phy_exit() calls, and phy_power_on() and
> @@ -149,6 +170,14 @@ The general order of calls should be::
>      phy_exit()
>      [[of_]phy_put()]
>  
> +After acquiring a set of PHYs with a bulk helper, the order is::
> +
> +    phy_bulk_init()
> +    phy_bulk_power_on()
> +    ...
> +    phy_bulk_power_off()
> +    phy_bulk_exit()
> +
>  Some PHY drivers may not implement :c:func:`phy_init` or :c:func:`phy_power_on`,
>  but controllers should always call these functions to be compatible with other
>  PHYs. Some PHYs may require :c:func:`phy_set_mode <phy_set_mode_ext>`, while
> @@ -172,6 +201,12 @@ PHY framework provides 2 APIs to release a reference to the PHY.
>  Both these APIs are used to release a reference to the PHY and devm_phy_put
>  destroys the devres associated with this PHY.
>  
> +For devm_phy_bulk_get_all() and devm_of_phy_bulk_get_all(), driver detach
> +releases both the PHY references and the allocated array. To release them
> +earlier, use::
> +
> +	void devm_phy_bulk_put_all(struct device *dev, struct phy_bulk_data *phy);
> +
>  Destroying the PHY
>  ==================
>  
> @@ -221,3 +256,8 @@ DeviceTree Binding
>  
>  The documentation for PHY dt binding can be found @
>  Documentation/devicetree/bindings/phy/phy-bindings.txt
> +
> +Missing Bulk Helpers
> +====================
> +Currently, only a few bulk helper functions are added as they have users.
> +Function not upstreamed can be found at https://lore.kernel.org/linux-phy/20260904083709.425893-1-inochiama@gmail.com/

s/Function/Functions/

Other than that:
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

Thanks for updating the documentation, this is appreciated.
