Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795821276;
	b=d4M+NMTrvTsaEdh0KKwAGlMCfkqzkdNquR43q8FgefhBXKoKYfacpZAZlJGNsLo1XCMM
	 5wtb83J0lkj2O2MvWDCMyy9zFw5N6dCf/C4K/JfOBiz3zU/zc/p2wj1xAagRYMBjTsGs0
	 E5M6bXakz+vRw6HCBqcuV5tqgNzNF+2GFFcgu9LcABxFJJihT2l01Bc5LunqQcsrttk06
	 fF897xk34619g2jyX1zpw7CrNEavVpTPcu3s6xCZ+ldrVbNOWmYaIFAZdRmmhPhG4Er4L
	 J6v/123WPKmzmBImx1N0njiZPetsjCVLbd4DaPuWa7cACPvebFK5qvFgkUMHG6FYfmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795821276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Reply-To:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=FlbabcyVkuAXu5z0Ru/b/FDnkn/RtPfkCs5EqjzDxBs=;
	b=WINZxwd9cNuc8DKSYtfc6Xuc9zfRD23BWhF92nsoSNqw2y6d/7ZqrKyFJ6mXeMoV/cDd
	 6Qv+PatczLeBbiw4qYjxPj7uAJqptrx17s3KdMg0Etoia+ievNRd3WJxDnedpyKhc1ZPc
	 nB//oBN8+vzjbm8s/UzwIHbBfEwZJYwtYX3BGwcmhyUPzhOUoEIxnsZzwgof+G7znA5RW
	 8IXdRtKJO49IEBBHJp6E/jBt7aZmzlQQiDPCmZvDU5FllblRbOjC9ljN1mW45y5h6Z3wT
	 N4OSZJuMiG4N/bMtCEl05VmQy4n/Eb71q5NRCKGT8JA8B3tVRDSuhELYFNKJA8gnrtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zgHtotMa;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9957C606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 23:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9957C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zgHtotMa
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a3c08d6928so12772969c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795821275; x=1796426075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FlbabcyVkuAXu5z0Ru/b/FDnkn/RtPfkCs5EqjzDxBs=;
        b=zgHtotMapPNN2PKfS4quoYXD9Fae42cXuabk+6Q7nHJHGNtnBONo2fFiCjENeQ4vea
         j2XeQnLOxDt9Uut+lolR6zpNHEe290IZmeVJnRWOoeWG7+9hPs0BthPkswRNnkBwpFYh
         74pDSQF2ehhY8UtlZq3+CswhQxyMitsrvRJNjxktOofq8u6uq/wZJwqIpNuGjhpR/9P0
         uCpOcpwNDPdxpWzEqlr1H2i4uwlpGDMICDoxmQjGyfle7/uFdrVdOKRadXDwNJiDBUHS
         xVy/rOmYDTGHMWua0H72e0XiVcuCYjl+YfOojuE8waVzNdXCSXeB4otpUkhkes2CafRs
         k+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795821275; x=1796426075;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FlbabcyVkuAXu5z0Ru/b/FDnkn/RtPfkCs5EqjzDxBs=;
        b=QOpDpTJexyB//gusYwS3nxamLCGWox8zrbLVfzEYJHKyJ3kTXwGOV1doNbq/Ef+eDT
         Org7y7oVHGHi2Ec7OiqH60vr0cZgcgoNd79roLQ/JFROa/+jUfg+6ObDF8+cbR15FsUF
         zfgfAy17ypVAvGmNjt5EtGB1oPOIce20FfKAFOQJZPBDB2o+JVYYqzOWV8vkYmKP/lbZ
         p83yf4kNzHLEK20sM+R6l2lQWi6VyJszLsTxuxLaClfQ2v9S0wKsC9jkJFh0zbZrS3SV
         6eS/0YfhO1bo8/j/d8X0ZJ36EX7IxQdyDoejmTWaj7OGpaUZKeRSV/3ANRWEjLi19J4e
         6AXw==
X-Gm-Message-State: APuU4Z/iGWMzbmCV6iti7/jPWbtOTDVkI8PaEqtXjYdfbi/wXY80dA3h
	Yh0xuXuPRgzntVo5no1dsEwBVdh2Kh0Nt4ghmPLgTkcuD8JHndjtW7Ub
X-Gm-Gg: AZFdTZflayqAzvVPBwYzSF7adEjyVGI53VODq++/NAoLm25pOIvZs8iIv92H2PpHypY
	2TUn3skhr4XIPHvrrZwLIxgspHow30N7Dt+ux0sRxQ36G+Gwg26m6wpjL9CePnpcDQwxDXZmdlV
	g+PGDnLx8C0nMPKZVeAI/zU8VyMili/qjFtyNHjU+7g7F2US+QofnfdXGMKdUpCdd/ofuvpnot7
	TPvPOLphUjfBDBgMJIKEukVH26U326U0amo1S8bmGWQJZeB8hAkdvGp8O1KralJaDdi2fpWgP3V
	03IqiyELgergyoQpqeyZpC9FrwRByL37aNsxgtTgtOcC3h/8kW42BOeUhO0oZ0Dk4fvjdDc+4pk
	uy39LHvUyCPZurokhxXdNnkejq8ZylmsEq8YRJIDa+OYUB2/KgEUQRFnyFYku3n4ijN0OSb0byS
	YvWkju7eMvcGtAZcStjBtHX9OczcjxujKl7QscBq1GaGLFPpOeEESz3QV33mfLUDwh2PWPsYOVu
	F986VSJ2vrs45L7ZJezeZ/cK5qsrSiEiDRSxbZSfbtL5b2QgXIIGppYRpBK5eNk//UESwqHXLQZ
	YCXMXbXmYRSEG5V9+XrEP6Hhkl7S/m2PqIjfOsh3MQYVhs1P1GgSNqNnMyeBXExppRY=
X-Received: by 2002:a05:701b:4182:20b0:151:2e62:fe6d with SMTP id a92af1059eb24-1b5568a2ef4mr25852998c88.22.1795821274577;
        Fri, 27 Nov 2026 15:14:34 -0800 (PST)
Received: from [192.168.35.60] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm58356788c88.2.2026.11.27.15.14.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 15:14:33 -0800 (PST)
Message-ID: <fa303423-0dc6-4075-9c0a-d32dbc6d8631@gmail.com>
Date: Sat, 28 Nov 2026 08:14:30 +0900
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
Reply-To: chanwoo@kernel.org
Subject: Re: [PATCH] extcon: ptn5150: fix fwnode reference leak in
 ptn5150_i2c_probe()
Content-Language: ko
To: Miles Krause <mileskrause5200@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi
 <cw00.choi@samsung.com>, Xu Yang <xu.yang_2@nxp.com>,
 Frank Li <Frank.Li@nxp.com>
Cc: linux-kernel@vger.kernel.org
References: <20260906-extcon-ptn5150-fwnode-leak-v1-1-42c2ff731138@gmail.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20260906-extcon-ptn5150-fwnode-leak-v1-1-42c2ff731138@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/7/2026 4:49 AM, Miles Krause wrote:
> ptn5150_i2c_probe() looks up the "connector" child node with
> device_get_named_child_node(), but never releases the reference that
> the lookup returns.
> 
> fwnode_typec_switch_get() and fwnode_usb_role_switch_get() each take
> their own reference on the switch they hand back, so the caller still
> owns the fwnode reference.  Nothing in the driver drops it: the devm
> cleanup handler ptn5150_work_sync_and_put() releases info->role_sw and
> info->orient_sw only.  The node is therefore leaked on both error
> returns that follow the lookup, and on a fully successful probe.
> 
> Declare 'connector' with __free(fwnode_handle) so that the reference is
> released on every path out of the function.
> 
> Fixes: 842546c56345 ("extcon: ptn5150: Add Type-C orientation switch support")
> Signed-off-by: Miles Krause <mileskrause5200@gmail.com>
> ---
>  drivers/extcon/extcon-ptn5150.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/extcon/extcon-ptn5150.c b/drivers/extcon/extcon-ptn5150.c
> index eca1b140aeb0..ede38eec2466 100644
> --- a/drivers/extcon/extcon-ptn5150.c
> +++ b/drivers/extcon/extcon-ptn5150.c
> @@ -256,7 +256,6 @@ static int ptn5150_i2c_probe(struct i2c_client *i2c)
>  {
>  	struct device *dev = &i2c->dev;
>  	struct device_node *np = i2c->dev.of_node;
> -	struct fwnode_handle *connector;
>  	struct ptn5150_info *info;
>  	int ret;
>  
> @@ -343,7 +342,8 @@ static int ptn5150_i2c_probe(struct i2c_client *i2c)
>  	if (ret)
>  		return -EINVAL;
>  
> -	connector = device_get_named_child_node(dev, "connector");
> +	struct fwnode_handle *connector __free(fwnode_handle) =
> +		device_get_named_child_node(dev, "connector");
>  	if (connector) {
>  		info->orient_sw = fwnode_typec_switch_get(connector);
>  		if (IS_ERR(info->orient_sw))
> 
> ---
> base-commit: 88405f0ad1d5c680afe3ea0ce9345fa9e1deaac8
> change-id: 20260906-extcon-ptn5150-fwnode-leak-81c395149a9d
> 
> Best regards,

Applied it. Thanks.

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics
