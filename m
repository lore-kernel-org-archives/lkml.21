Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514219;
	b=X0qEFfYDHiV06pXdheWk7pNX65c8uyB8qeEJUOkFgKEepB+dqkbBL62n5BMYkiwQfv2z
	 1rwvlTwcazbWZ63U7a59FysSlXnlvHf35IWqpvXFGZ0AIyYVbF/k6C58E64yH8gLw5AwS
	 2Ho4qnglbBAMHYApwhW29omSh5Jjq3/ldOsnnDIHkMAcMmas4zsz3RPtS+GptjP7P/30H
	 zGVLbSK3U5GB+3FMsqtMURjWT6a3l/XpIaXKMujB6s/bUu5DBMe1vw/l+vgXiCVKjHBAG
	 rqJlZTIen8Yf0PDjQofrbQNC/NZAivJlRJgKmgU4SuXENLTSGnJgO1ct3oOPfoJ9j/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Z7ixIHGB/x6muOCf12bPPxl1sG73TY3AqjMKZ2p7Iqw=;
	b=2npSsTAddg1BLYA9MAFiPX8DPVa86PkgGB5bPe1H/HbPSSWcevRYDIAEdAiTFipbbGSy
	 0pHS0XpHQCQHB9T52YwD7yBW00O5vB9NB5tYkn/fNTNx6YEd5be14dIgMa1EiGIB6QNO3
	 plPVUUxbCpky6Y/fjNj6BBPuqVumMqaMHREib4HQ21dmCECgYTq50N8HjlASayulOpp/q
	 JkgZViYTmqcqH2nqc1sb4+Ik4oZ8zAmL2IjC+XRfRIIspj88rGXpURVZEYBQ/x2H2uuWt
	 sD+N5duvEWE9qOSAAmDy/Ja1sM0He7f6s81+wtaqxdRlv3EL/xwaFqCco8bq3ixweUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fmCLP9gt;
	arc=none smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E17606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58E17606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fmCLP9gt
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c0ea47f5b8so455915e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795514217; x=1796119017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z7ixIHGB/x6muOCf12bPPxl1sG73TY3AqjMKZ2p7Iqw=;
        b=fmCLP9gtyFynzPpKhVinxN3fvX0HMhPJbqD1her/p9bj1TkyZMQ3CUW2x1K2iN6Q6x
         wZ4W5yjzxqt3fzPs1oofjP/eOC6ezr++bplcBpOLgydsEwa/ibvh5ZgR4ciR1XPO9Nun
         tJP8gaFyKB3uXo1JAq1nJVoyQ3d6zu2DJFMcAnm9FOJt6bYNI5jAISAfNXrcQZLMqqbS
         XbcOsFJ/qBdpwrj8ya6lkp1s4F/MKwr8F9x6FTOxCEkFzlQMc66c57dzu5b4dZXrAyqU
         sjyN/lSUSN7rV1QbdPFM53mzZAdsRIXj0FmSSgxsnNdCJIdXXBRN5ZSI4uvoC3MJhezY
         xrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514217; x=1796119017;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z7ixIHGB/x6muOCf12bPPxl1sG73TY3AqjMKZ2p7Iqw=;
        b=iQHn4ANgOYq7V++ms/OSMsmxjeBI2ivgOT3QdJ1YLH7+DlX05/nbl1LYUqeex+XWL+
         vjcOsQ0uTLSSdG1ZiWuDPTvtqC1em/U/eehFWQlm+Q4TMEJO5xeY5B48nbFCLvLU0bTP
         XAix2AwCknt5KqrC9Yzq68RFiEQl44p6txZAta62Su4kRZJzyHXUDGZZqUGzrUec+bn4
         BEh0mzf1+8vT0ENuNoRMpvmjFTO8CxCHdqaYLnWA2plDR2EE2qo4Zplb7+2koh4faTsp
         Z/UbtkrZ/tGG536DDjaK/43n6eLyKFRlhGWmdvp22r8CLYN3DuyvXuqjh9UOxBUtAdRO
         X9Cw==
X-Forwarded-Encrypted: i=1; AL+hErG+mslN2Du2L7T73ewrE+T2oBueQC4IB4BZuwpwlX5hnP8GJmAABpt8Vm1WvBd1ARdV1ti2MfdiL1F0fDc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+glo8OMu5uIeMsE6r9B9ZQPk25gssmM/esTYnNTxLsiGh7knpk
	DU1WCiFlLSH856ZF5lkfjoebN0lLzYBWnKa3qvfSFanIH7RBfpoTTXOqTc3OzZvTL00=
X-Gm-Gg: AZFdTZdSwGJ7W+WfqQx3b0bT734Rx5injlg+6+Hx8WYUJZcASydvQOUaVON/nOqun5t
	vEf1QxapNEgzQCD22Rc33r4/GomcYdYUQNPo87E7uAWqW3VnIUsy1nsUP0MLewZcgnygXxUXMyu
	TrEj3ig5kiltsmIAaJ44QjQ3ElWy4Zc1ggbIVnwU8bHIaDYf6B7/aC3sX0rhbVN6umTnhABlQSe
	BjUveY1bvmTVilkh00ftjLjbUEvEGcZaLxir5JAhvEDAafrqFuDVnOJvgIUoerlK7j9EpVrdmZO
	ZDE2PTGWqj5lK/qrmTpbSJlgnwdC0OOLIhjRBqmGOiZwtcOn4Eq60zoyOmjgPaveZgMkXVchE5w
	0o3B++X5SgjxIoJHsG66JeGEph9dVorWu7b3IN3fM3nioIim46753hNHa0xx1PoL81s84B96kFb
	DV5YKUQz5lpl5ssszZEZbeBpocWhR05Z2AlmthldUXoZTc4ojn13WKdqGL2eRwDYlGrLLVCry+6
	6Wzgj5WaWySTOrRWod7CBlML7R9Pv+JXCPkXj6MMbvYRpUXKLrYKqSvSoPQ48qiYScYlRexcYI4
	dgvYD0KhTHOMA+jXFxZvNXVjhTIIdsIx12HFLwxqbKjgfniYOXs3JO7VztJ6HDJJgI+w7d3aA3f
	9PvYZHsU=
X-Received: by 2002:a05:6512:b88:b0:5c1:5488:f57d with SMTP id 2adb3069b0e04-5c1bc85b735mr5132306e87.4.1795514217327;
        Tue, 24 Nov 2026 01:56:57 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff86c4sm3570448e87.22.2026.11.24.01.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 01:56:57 -0800 (PST)
Message-ID: <da038528-5b25-4956-a14f-1827ffe2eef8@linaro.org>
Date: Tue, 24 Nov 2026 11:56:44 +0200
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
Subject: Re: [PATCH v3 2/7] dt-bindings: media: qcom,sm8150-camss: Add SM8150
 CAMSS
To: Andrew Gigena <mail@andrewgigena.dev>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v3-2-0103e8a0bbcd@andrewgigena.dev>
 <21be3761-9da9-48c6-aaa1-b56f8625167a@linaro.org>
 <ab79818e-4b4c-4b58-bd2f-57d9ae4cddc3@andrewgigena.dev>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <ab79818e-4b4c-4b58-bd2f-57d9ae4cddc3@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew.

On 11/11/26 01:46, Andrew Gigena wrote:
> Hi Vladimir,
> 
>> That's an intermix of names, and you will get a review comment from
>> Krzysztof about it, I stand aside.
>>
>> Here too.
> 
> Krzysztof did comment. I kept the vfe0/csid0/vfe1/csid1 order from
> sc8280xp-camss.yaml in reg-names and interrupt-names, and asked him if
> he prefers another grouping.

Exactly.

>> Drop 'gcc_axi_sf'.
> 
> Downstream sm8150-camera.dtsi feeds GCC_CAMERA_SF_AXI_CLK to CPAS and
> x1e80100-camss.yaml has gcc_axi_sf, so it is used. Can you explain why it
> should go?

There is no CPAS in the upstream CAMSS stack, and it makes it irrelevant,
that's why I asked to remove it.

I believe one day CPAS will be modelled as a separate device tree node and
device driver, then it gets its SF AXI clock.

>> Drop 'cam_' prefix and 'cam_sf_0_mnoc' also.
> 
> Prefix dropped. I kept sf_0_mnoc because SM8150 has a CAMNOC SF path.
> Should I remove it too?
> 

Yes, please remove the interconnect, it adds nothing for upstream, and
I believe your tests will show that the image streaming is not broken,
if there is no 'cam_sf_0_mnoc'.

>> Or C-PHY, right?..
>> In fact you shall drop bus-type from here, because the link between
>> CAMSS and PHY's output is not a CSI-2 bus, it makes it inapplicable.
> 
> Agreed, bus-type is gone from the CAMSS ports. It only exists on the PHY
> sensor input now.
> 

Thank you so much for working on SM8150 CAMSS support, will be glad to
review the next version of the changes.

-- 
Best wishes,
Vladimir
