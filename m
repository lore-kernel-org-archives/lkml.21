Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513996;
	b=J/XxJvVkue0pzouLhdSIEmKTjPpntzkggWwIQ6hJRTH2rRdV4atwpp/xfEUTlQsyF23I
	 tgOyd5Kc5tk9cl703aA8zG8uWnjoxxMYvPmglBosAaHg82VipUAMgVnaOXjMmZzeUeDev
	 hrELMTLqdT+PHDICyi+9OSCdZVAqTXWgXzt2wbl6FOoNeqRMU7dKO6NVfgj1+v/rdY3XQ
	 xVLhAof40aG7P+bsSHOnuYufcmb7rWI/VjRgrZ2qXWZvoskGPCoh2NBYHbXw90OB31vKl
	 jCIVnTDYC+pcL8gOH6t6Xzd3EGwnvseVu+nd3vioX+esygQoN8xP/GjayJRz42piVpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=s3HEy2luFzOKtpXEMJaCVU6qsnBsmUBR+KRo1CZ+Kxc=;
	b=tkEOEtT8qCie3rHcTFKlEaEMqVT6re736r2GmboLjEjqCBv5cIuqMTqGlzm6/AJ734aj
	 4bsrGZ4jXC7MiZTlv2GaCWKD/9+9Dlkq9h1aW9UE6uL1BuSShUGSHMhtCRPQYu+dwGi0L
	 2Fh3BKGQQfFw4FnurulRqq5h8S1GNJsieWkEPB0emeB1R7xzSMBOTcFmsCafjdRejyT1t
	 IZgnDLZwjyRPNlDlQvVmqlxIPMack9PaeralNMHybda70hjgLLzJn2a/3urtgr9qojZTO
	 txoyuYOUgkLBWuzasaAFiAb8osL5vgVyu+H6sitgJ9SAVmv42t79ZHdhx915VtFn3sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=o13itCkh;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B910606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B910606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=o13itCkh
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so32956645e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795513991; x=1796118791; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3HEy2luFzOKtpXEMJaCVU6qsnBsmUBR+KRo1CZ+Kxc=;
        b=o13itCkhMBF029+oImbtjlAQZs8479YW9/eib40OcJPcvsnajrtdwXo03Nl5nLZkur
         TQLkW4lWYxsfZlqOKgV5tJwIzNZ6sbb3NkpvReSLnkPpwiROhhBib4JxYRLSBHnFhk8n
         cdeCvYAbGTzKLvv+ctL4RaUISRw26U8N95eDywwht0RlIp9cbqjbsFcpmBEP4pNUoXcO
         MqyY667zhtA571uVGj8Fuo14Ufa9S1EEqRzQSBplvX8L4W3vrmw5w0VPZDLKODCPPl4/
         nm5uZi4/9p8GIdYukk6ooqIxsbyyGDNczi0v7NTdw7ppYBMU+8vsPJ59nE+cF0q/bHHx
         SyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513991; x=1796118791;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s3HEy2luFzOKtpXEMJaCVU6qsnBsmUBR+KRo1CZ+Kxc=;
        b=z5Rbz1JeqLRjruKAijYeZkfyV/SvDEM9CJImJfS+xQFDEldQxE+lsml++MpLjNmO2y
         f89sYlI1DAE8w0hYwKxOWXyknuIZFeeWco8uGJRvW1npgZNmWxBdaFgNKChI/Qap0Y//
         2Ma2nQ9iHGSD+QJyxK6pj3PqLVW/kF2+R+1BwgLDkZvTGiQZ7Q4ky7jF67XOEF5qYleg
         kWR0KpczcXK1CIsUXJyYWq/0wbwxS23hkB6PrqeQfoEt+kSquGY1K5xpD5xJiwOIphZ2
         89798Xs8xbEmayyr9dS3lIdocA8uWZH6ArsIqBTB5TK9R33Yk8phlrsxh9IzLIzhE+YJ
         6+GQ==
X-Forwarded-Encrypted: i=1; AL+hErHEW6YWbefsK+ghZsZIK8k6iZaw6gay/pUcRiwz0742IGt//K8w7kFj/UpPBs0WZTMmGKhlrK5TWbzSN4I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YvXm+9Vd49w3863Y1saDZrKe/u196j00v7iHj5A1/1K7Bsltp
	0TrE6iuoKlSOCi1UHHayhhzLn5+NI5fweNxv7bHx6mAI03eaUo4MIEfiUr+ZHWXcIsE=
X-Gm-Gg: AZFdTZd3BmcD85ONoVOMfpR3rDJHtAvDPWKX+mY8Hi/uaG6sJvzwOLAaJQNJqd+ysTk
	3siTz2XxA0bbB9bZTjKbjLd7UTCb3ZSNp1pJ1VFvZ57tkA/Mnj/MtAVJj6dc1KH1m1wZqWRZCPe
	27nE5S7KfXCAmloRTVdAH2NjvxxYBOwTxw5PzpvklC+BZ/M/HhdB1tMs6sxocUMNBJ0kq1jd3bU
	e3MiytTsT+ThaD6RpZtdegsu4HK2WKDR0EkgL/BGPUoubKTn4j9hFtVZ8q6p6xnpYL9OQeix9p5
	6y66I9/WqVAngTme63O40xqpghimo58FnfdMP46txuZ/Ko84G1JuM3GMFdA9gaBA2p86UxBSOzd
	pIrnyZNVB9ObcW8z5Y1juJcoQB+IHj8ncoqqODbwd2ePlzAcFXVvKsQSwqVUJkmYlH1aWKiqG9t
	7dinIyDAY3mVdYSSycc5Vsdh+8d2+3+00beiuhrYARYk8360oCELhSaoB1A2ZeSfokQgaid62tO
	Pu4qOR/WFZX9yenUcGpIdmOBRt1ZGi62XRfxGar75O69FExZjkhE5XgHQry+c6qycfXd5OBnpyT
	QrBtDB6nr10sNfUfrNcO0ve3IaJv2gh3a/xBXwb+uM4S9uSc0SXkruZjx4PeCGkKx+a4eAfa7/R
	jMQ==
X-Received: by 2002:a05:600c:4e0b:b0:4bb:6f45:2a79 with SMTP id 5b1f17b1804b1-4bb88817920mr309330195e9.22.1795513991045;
        Tue, 24 Nov 2026 01:53:11 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm435581505e9.2.2026.11.24.01.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 01:53:10 -0800 (PST)
Message-ID: <2fd706ef-8205-4564-bed7-527b6bae8790@baylibre.com>
Date: Tue, 24 Nov 2026 09:53:08 +0000
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
Subject: Re: [PATCH v18 5/8] accel/rocket: add a GET_PARAM ioctl for the
 hardware version
To: Jiaxing Hu <gahing@gahingwoo.com>, tomeu@tomeuvizoso.net,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com
Cc: royalnet026@gmail.com, sidong.yang@furiosa.ai,
 ulf.hansson@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
 sebastian.reichel@collabora.com, chaoyi.chen@rock-chips.com,
 shawn.lin@rock-chips.com, finley.xiao@rock-chips.com,
 diederik@cknow-tech.com, alchark@flipper.net, leonard@lausen.nl,
 vlwwwwww@gmail.com, jeff.hugo@oss.qualcomm.com,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1795478392.git.gahing@gahingwoo.com>
 <cbb77a43deedadb6667a84bd1c57030cf1c9ce74.1795478392.git.gahing@gahingwoo.com>
Content-Language: en-US
From: Daniel Drake <ddrake@baylibre.com>
In-Reply-To: <cbb77a43deedadb6667a84bd1c57030cf1c9ce74.1795478392.git.gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/11/2026 00:01, Jiaxing Hu wrote:
> Add DRM_IOCTL_ROCKET_GET_PARAM so that userspace can tell which NPU it
> runs on. DRM_ROCKET_PARAM_HW_VERSION returns an enum
> drm_rocket_hw_version value, taken from the compatible's match data when
> the first core probes. The PC_VERSION registers cannot be used: the
> RK3568 reads 0 from them.

I also spotted that the vendor driver uses compatible-based matching for
this kind of thing.

> @@ -197,6 +224,9 @@ static int rocket_probe(struct platform_device *pdev)
>  		devres_close_group(&drm_dev->dev, rdev_group);
>  	}
>  
> +	if (hw_version != rdev->hw_version)
> +		return -EINVAL;
> +

This check can be dropped, we can assume that a DT that gives cores with
a mix of hw versions is invalid and broken.

With that change feel free  to add my Reviewed-By

