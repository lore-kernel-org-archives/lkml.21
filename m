Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606171;
	b=aTTkvvka6kHL4mlgyL4ybh92mCZ1HQCg5WIbQPQERZsgUVeswHMyyGQpDHgFahi55DUu
	 FYt6VgeZWEH4u6nnxpzbQl0o6Bv/PYgqOiFu9OyTeT2S3qAxEH97/0QZFxT066xbFLbuG
	 fVoypcz7qzY98PmBaP7/qoSYgfvEfYMA2bBNjnM2lF1vihatSWKgKfDKwPqToJFfy5B8r
	 SDq9vwwVQMl3VSMWDsx3NefdvG838/Uzj2DD5DkHP54U7jBluBKWeQSOKP7yHYuf7SKdm
	 lJyGZVYlqwjvOKkPQdLOWXbR20NNGK4/HFhvw1VEgLY5m79CyjjGbpKBIgtiMgobHqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606171;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2Uy0XGyjRWeZduI+QemS8fnn6dEoZHmbYbaW4IWMums=;
	b=P7Ia53t6opjB7z3WfkIyO7YKLLuAskE1xhJqWMn6kqz7A7/uU044lq2It23nPo4m1tPd
	 ZKmmpr+US2LGw36CE27D6Xv+i59acqcchqMkIqYDP0L6SnKaUk3/apqxrUfXIK2HlPpJ7
	 23u9HW9yH1ZBNHwZhnfJP1A8oD3q3FYII59/VgpCWxL2oayz2AHgvZNOSZR7TAb8AE4jO
	 0rVNWVGTIgAJOluwv/lSPbMctk+BMuV+xenoYokAYyxi3RwPDRyIQNjtF8NMBxViGcEyW
	 3FGAcG/gmnkvOey8WsloNGUsVtckm4xB02/Pfhh58cVKQasqcolFHpX/HpthQjSS8tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e6OegtaG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BubfuO0H;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B965F606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B965F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e6OegtaG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BubfuO0H
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mtlp2359510
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Uy0XGyjRWeZduI+QemS8fnn6dEoZHmbYbaW4IWMums=; b=e6OegtaGInFUPutr
	xoB686l7E14sFW4/MDMG49y1YmlA1pE/4QYDw7c29MqYp/WNyb15lmmQXBly+F0+
	jeyr/2c5RHVHe3GQL80Lp4u4PN9y8OFRz9uK3USNRWkxN+emW7FjZulurShPOsMC
	9T049D1nh3FBmhMdEfOtksuWcDVl7vcb6+vze8l0wWJZ7AX+03UmWDEiIGoM3f0a
	5kh30NGczVgeffrLsu+REb1t4lzOuXAcaVBw1gTS06mM6yZWAsQMXAYaz+3gnQUA
	q1SwXHkK9LRyUqj8C+o7t2ONvooxUc3Q1Uaq+nSrJmzKzwj09gr+OBXda9uwMJxs
	lWjwKw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5nu6a9ub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:29:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso3842698a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795606168; x=1796210968; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Uy0XGyjRWeZduI+QemS8fnn6dEoZHmbYbaW4IWMums=;
        b=BubfuO0HNLJUom8gNGI0oen/HUXAkl854BZv9U5SHzMb/UrJvL34LOItyFb7u8qGN3
         xgqMZHkiMbO/n3dwJ2/E0HKipSGclBpMX4Oex6I0ya5rLe6GFlKVgSQkYYZD3y/87j5X
         YguMvgFI9wuCM0/QuCoPThnf6JfG5ohWgHgoSqB3LDnpt0/RwcVJKQ5PtRIHkj5ETvHf
         4U+SSmZXP+Mz3QkIhmjChlHwbvIXgDaj7abD9ZHIFezj34/PauE2uxWwop7R4g2C6f9U
         WMPRxjNqEuG3MBA+H5WrKp4N6hk7MIqsPrdHoDn0jO3/Nl9C6Kbi+2RRdQz2XdYDqoi6
         VFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606168; x=1796210968;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Uy0XGyjRWeZduI+QemS8fnn6dEoZHmbYbaW4IWMums=;
        b=1klbI13LntfVuI6l3FLlDX1I3i6XDSsErLH0VKyuH3puWe1PSz6Sirf29x2aMAB7vH
         ekuXEMdGSdwtJCBXgUeSTBGlC8dc95rzkK19jtjJ9LXBME0FTuKdoE5xSsyxNXgwHRrB
         0tEH83kZGuNxZqYho/AqbLmRiAIFnjr73mo4zslnMPIFg5Fqx70ihovFEOD+3LAuI07A
         W8scxIUtuNp87ecy3SWJoex6IXuOPGEIetMBR3bhrI+8itUQuRPGg5KCiIRlXKzz6ItF
         Ru6LttcxGoAIT4BJQKWQCQpW36/rWR44WSoxkOVEemQy2lE3YB28oSLRCRL32xde9gBB
         OqYw==
X-Forwarded-Encrypted: i=1; AL+hErF8elC+HdxkHPWQTz4sYxzrXkRuxyQ20THxALFmaXi8FZqSxjuHJwIL61EQWzoFcyDTDUJEBnYPKq5iWug=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YskvEpRYJuaWow+fg/oHm0Y3AbCQR74u+CV2LCBo7YN5DEf4i
	4uzkKVjJ+wq3VJYSLdoMY0k/n/ybQWyge5LzrrVLOq6CBfPVR0d2PuEkPuNSIik4iHQT358DYIP
	quK55KYLQDnecJCi1ezQ7iw6Nvrujr3XKiY4lad8hiiiKN9z//pRXP3FbsLF0obWYR3E=
X-Gm-Gg: AZFdTZfAeGu0zCf+iUIwNuP4rbddiJqhRwWpGHyBNlRuf1Nw5pUuaENrNTjDk2gslKf
	CnAYpbiFE4+upY3gnJJc4EeCgRdpd4nsSXnxAJx8VVLKVwaHrAqev8rixHQE+nur6AtqsWwW/4J
	0h52pCHIgxm1/kPdlwFAiTU6h48suuqv/Kl0iEurJH5XXRDliM4XyzNakyVqB4Ni6xaS9AM29S7
	Pd/3EJCHxVNQdPll0K+8icmWv4FRS+wTD5Yoh5E/jESydAH8/KtSsor4Y3tcJRw/XckAGXFoZao
	HIawTnI0OGqSaSEvIbRJA5uoADWCPi1EDhnCdzxW83oW2HCX3LPjNHPg8Z9zMpt0Qcusarpefqy
	O/jMKB91GZgzA2NHYQdXSeVPwNz04hMa+QP9eyGQMfgm+w5ogxhjlm6FoJ3EGxAh852UH/7tLzt
	tI+/ywstXBobGDUV6neRpePY6znQL7wZDP66IixsQM5Io9jiOyXYgMyYeooCdnK5WF2g==
X-Received: by 2002:a17:90a:e70c:b0:3b4:22d:e078 with SMTP id 98e67ed59e1d1-3b41c7c238fmr16206687a91.1.1795606168183;
        Wed, 25 Nov 2026 03:29:28 -0800 (PST)
X-Received: by 2002:a17:90a:e70c:b0:3b4:22d:e078 with SMTP id 98e67ed59e1d1-3b41c7c238fmr16206670a91.1.1795606167641;
        Wed, 25 Nov 2026 03:29:27 -0800 (PST)
Received: from [10.79.116.36] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcafe0sm29497670a91.16.2026.11.25.03.29.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:29:27 -0800 (PST)
Message-ID: <578f89a4-e905-453d-9ba8-f885b17f70cb@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 16:59:21 +0530
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
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add qcom,remote-owned pin
 configuration support
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Prasad Sodagudi <quic_psodagud@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-egpio_fix-v1-0-569d220a4748@oss.qualcomm.com>
 <20261106-egpio_fix-v1-2-569d220a4748@oss.qualcomm.com>
 <m3znhsvgj33ipd655d3nzjnx5q74kx4cn3jwoeuarov7j6mdhx@cj6qrl65ps2n>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <m3znhsvgj33ipd655d3nzjnx5q74kx4cn3jwoeuarov7j6mdhx@cj6qrl65ps2n>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: H8FHqJu8v3-Z1SMsG1VEK4F7HH_TtJ_-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NSBTYWx0ZWRfXwrHi3RvhUC/l
 NiHvRSakicOZlbR1DdTQhy2uqS98GLHFXbidVr8Ic870lvD5j4wXMCimdP86Cstzb6BngqCTaZU
 C59ThuWHydTLbPWEpxrGHziMFHDZ3ZE=
X-Proofpoint-GUID: H8FHqJu8v3-Z1SMsG1VEK4F7HH_TtJ_-
X-Authority-Analysis: v=2.4 cv=Vra2kO2n c=1 sm=1 tr=0 ts=6b06c69a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=PjqW6EFSHK4lKDxzUDkA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NSBTYWx0ZWRfX3N1dEQ7hxiGX
 r6wkJaAS3/Qke+Em9Ap4heuliXubgyzR5KRU+uK1ggPLY5ZAZgxKTFIpCPxK9DPUXLSGfQcnPnz
 PfHuHxRgqydgmXklgT6E8RfeMo71XxHr65IwtJqcrOEyFD152ueVsmXrT8dVD+2e4fOo3+oi7Ph
 PgiDz3KA0lb7UA5/aNHy39cBFOOWLE7co9NY+GQ7h7daxn8oPczAgara8LaYNEwmUttmjqgiRnq
 75YrpOEyVQi4oscpznLjigCFLepGG9r8nxdrZnzvk0NZH0XCAj13D/EamKUjEGosxOjt2ZmKOdK
 PN8/LnvoZlBv6s4/Ru7bM5WWmqYxmwSkoMahfrxdMOwGhtJqkK/zfZzDX/ORRQNCwLgIVtLJ+la
 gK+EHNiDdU5cyqKjjXuqeAYz4k6pVo0ATIDO1tJi88fwngYXF0G9um8J60EwBLeEWjJB0t8w1e5
 mJ4x/WFEA2s3F8IfMqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250045

On 11/10/2026 4:57 PM, Bartosz Golaszewski wrote:
> On Fri, Nov 06, 2026 at 01:29:42PM +0530, Pankaj Patil wrote:
>> The eGPIO support added was incomplete since pin ownership is independent
>> of the selected mux function: the eGPIO present bit only describes
>> whether a pin is capable of being owned remotely, and the enable bit
>> selects the owner - 1 sets the owner as APPS and 0 sets the owner as
>> remote io. At present it's a mux level decision by setting the function
>> as "egpio", APPS releases the ownership to remote io and in process
>> cannot use it for any other function.
>>
>> Add a driver specific pinconf parameter enabling the "qcom,remote-owned"
>> dt property support. pinconf-generic falls back to the default value of
>> 1 whenever the property carries no value, and an absent property is
>> skipped entirely. Since pinconf-generic emits the mux mapping ahead of
>> the config mapping, this is applied after msm_pinmux_set_mux() has
>> set the pin ownership, giving the intended result for a state that
>> specifies both a function and remote-owned.
>>
>> The hardware programming guide(hpg) explicitly mentions that the egpio
>> enable bit can be set independently of whatever the function select bits
>> are set to on targets which require shared ownership while the APPS
>> continues to use it as normal mux function.
>>
>> msm_gpio_dbg_show_one() printed "egpio" and returned early whenever the
>> enable bit was clear, which was sufficient while that state could only be
>> reached by muxing to the egpio function. Ownership is no longer tied to
>> the mux, so report it as a suffix on the regular line and keep the
>> direction, value, mux, drive strength and bias visible. Pins muxed to the
>> egpio function reach the same register state and so print the full line
>> too; their mux field reflects the previously selected function.
>>
>> Fixes: bebc49c1e5f6 ("pinctrl: qcom: Add egpio feature support")
>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>> ---
>>  drivers/pinctrl/qcom/pinctrl-msm.c | 81 ++++++++++++++++++++++++++++++++++----
>>  1 file changed, 73 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
>> index 32aa7b919e24..4d96260f9909 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
>> @@ -48,6 +48,31 @@ struct msm_pin_state {
>>  	bool saved;
>>  };
>>  
>> +/*
>> + * Driver specific pinconf parameter to hand a pin over to its eGPIO owner
>> + * without muxing the TLMM away to the virtual eGPIO function. The eGPIO
>> + * present bit only describes whether a pin is capable of being owned
>> + * remotely; ownership itself is independent of the selected mux function,
>> + * so a pin can keep its normal function selected while being owned by the
>> + * remote subsystem.
>> + *
>> + * The "remote-owned" property is a boolean flag: its mere presence releases
>> + * the pin to the remote owner. The default value below is what makes a
>> + * valueless property come out as "release", as pinconf-generic falls back to
>> + * it whenever the property carries no value.
>> + */
>> +#define PIN_CONFIG_REMOTE_OWNED	(PIN_CONFIG_END + 1)
>> +
>> +static const struct pinconf_generic_params msm_gpio_bindings[] = {
>> +	{ "qcom,remote-owned", PIN_CONFIG_REMOTE_OWNED, 1 },
>> +};
>> +
>> +#ifdef CONFIG_DEBUG_FS
>> +static const struct pin_config_item msm_conf_items[] = {
>> +	PCONFDUMP(PIN_CONFIG_REMOTE_OWNED, "qcom,remote-owned", NULL, false),
>> +};
>> +#endif
>> +
>>  /**
>>   * struct msm_pinctrl - state for a pinctrl-msm device
>>   * @dev:            device handle.
>> @@ -328,6 +353,10 @@ static int msm_config_reg(struct msm_pinctrl *pctrl,
>>  		*bit = g->oe_bit;
>>  		*mask = 1;
>>  		break;
>> +	case PIN_CONFIG_REMOTE_OWNED:
>> +		*bit = g->egpio_enable;
>> +		*mask = 1;
>> +		break;
>>  	default:
>>  		return -ENOTSUPP;
>>  	}
>> @@ -424,6 +453,17 @@ static int msm_config_group_get(struct pinctrl_dev *pctldev,
>>  		if (!arg)
>>  			return -EINVAL;
>>  		break;
>> +	case PIN_CONFIG_REMOTE_OWNED:
>> +		/* Pin is not eGPIO capable */
>> +		if (!pctrl->soc->egpio_func || !(val & BIT(g->egpio_present)))
>> +			return -ENOTSUPP;
>> +
>> +		/* The enable bit is cleared when the remote owns the pin */
>> +		if (arg)
>> +			return -EINVAL;
>> +
>> +		arg = 1;
>> +		break;
>>  	default:
>>  		return -ENOTSUPP;
>>  	}
>> @@ -536,6 +576,29 @@ static int msm_config_group_set(struct pinctrl_dev *pctldev,
>>  		case PIN_CONFIG_OUTPUT_ENABLE:
>>  			arg = !!arg;
>>  			break;
>> +		case PIN_CONFIG_REMOTE_OWNED:
>> +			if (!pctrl->soc->egpio_func)
>> +				return -ENOTSUPP;
>> +
>> +			/*
>> +			 * Ownership may only be handed over on eGPIO capable
>> +			 * pins and is released by clearing the enable bit, so
>> +			 * this is applied here rather than through the generic
>> +			 * read-modify-write below.
>> +			 */
>> +			raw_spin_lock_irqsave(&pctrl->lock, flags);
>> +			val = msm_readl_ctl(pctrl, g);
>> +			if (!(val & BIT(g->egpio_present))) {
>> +				raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>> +				dev_err(pctrl->dev, "%s is not eGPIO capable\n",
>> +					g->grp.name);
>> +				return -ENOTSUPP;
>> +			}
>> +
>> +			val &= ~BIT(g->egpio_enable);
>> +			msm_writel_ctl(val, pctrl, g);
>> +			raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>> +			continue;
>>  		default:
>>  			dev_err(pctrl->dev, "Unsupported config parameter: %x\n",
>>  				param);
> 
> Sashiko didn't spot it but eGPIO functions are now defined as
> MSM_GPIO_PIN_FUNCTION() so pins configured as eGPIO can be used via GPIOLIB.
> 
> When you call:
>   gpiod_get()
>     msm_pinmux_request_gpio()
>       msm_pinmux_set_mux()
> 
> You'll end up clamining the pin again by setting the egpio_enable bit
> unconditionally.
> 
> Bart

Understood,
I'll post a v2 to handle this in msm_pinmux_set_mux()

