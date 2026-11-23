Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448335;
	b=abfL9TdF+8Uf4OnO7AQgm/ArPlU042B1yo0TJ62jQAmyHlXRKC8kcoB9ElSv9V1gFtYR
	 eIpKZMDd4meuNt0WrXTWIhYaao3WkfI2WkCOMzJU8zUuKTvImeT0+GqH5C+joFhuySy4l
	 PnvzJLbALEYBELX+8ILaOgicUQRiBWaGLBvH+VaUP2y/xB4x7y/FP/Snmq6EfdEwtVEbC
	 cR+d+S9vY7F8prRQE2AhPacx1vii9RCYRlfwWtpXFj451/h9PNM8Di4j0v2ltp9sQu1O4
	 G4nun6lqSfX5WeWpcde3qVGToEo6jLzgflQxRQRcNH/FqJHfcDaE8wuMZlYE8SXqbCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448335;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nwDysrxowIrcL6nfomWCriBbdPh4cWHD6+FT8Zt6pqY=;
	b=eavA1uoCwooP2wH+XMH8ZH5EY/715ogF/k5uOnusWLBgqfJKR0/vhdXdKUCnNdfPIEfc
	 RfBdVGSAyixfDM9dcq3udBaw/5DbwWsgaLFY5+CcmOnnFPkyPYct/DoJ6Ik+3XlnUiETY
	 7mdHyYnuNFxx3oyS63aikq6pMCWSovaxjfUE1vyzTBaLB4sLvK9+H5gLJOkY82UI/62Fn
	 FA05lfovG5hbow2V+gDCveziHyEi1lhcTRijf0X5FuxU/V7i3eszfmerpQQ6hkToPwWIg
	 ZvvvyGLgvfYNl0oX3YzBw0jw3uodEMaw3nOGCzoMU7CMxFiZtVcacgCxOv5/NISSrIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="etiSRN/Z";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WT3oz5rQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B73606A681
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25B73606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=etiSRN/Z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WT3oz5rQ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL19v3072458
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nwDysrxowIrcL6nfomWCriBbdPh4cWHD6+FT8Zt6pqY=; b=etiSRN/ZbBaGQPfE
	PqfRvVxzdf8I7UEJpZ95lYWONGlz2JsFbKdHzfBUlUXKEjec85yz8hBhWOcomrTF
	y37JW0So8DEWJsxGF0cipPSqiVX09gBwWww4iyjJ+90vgzEJcSFvLgq6eSVF1iYD
	z1fDYSoSGOlOr5tBQmAxpfLjSV8aI+kOxausb+34GHglWm7fTelZU2YiWDrY5LwP
	zJfR/QD2+wXLZAdu+jMzGoQNantoQJYhNTG3Y2UcmYmACqoW9LvUzCPmpwx6PVhM
	bUpTBkoJrZGe8WZ7Dxy77gHADmSVE4eflJKJxCIi6h9z8yfsTkjWyJN5JxRCoHGa
	yOm07A==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7srdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:38:54 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ee002e05f9so100234e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795448333; x=1796053133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nwDysrxowIrcL6nfomWCriBbdPh4cWHD6+FT8Zt6pqY=;
        b=WT3oz5rQ7gZbeAz44zHnkk6iVJXeK3DmzpH8P/CO9zx+F/I0hwXuL50IO7BWGxxx4W
         u46zO4eoBXlJH+t7X4co4f6Z8vNwWaYBqN8nCoiQJCqOyh5BM0DzjFvLrqdMTN9V0PS2
         HEvohFS9CFqFnEXVyVsjIjUDzrb9Fzl1I/n6ghiy7S1/TdZjXsOJVeDI3T+uG2ZrNV6Z
         dC4DCsPlvD4UsXL5jgFLwR3jW1DIjOgnK7Ylzkt+i0slmZNfZi2qGwHORpWXekimZkpM
         Zf9OlFN25XH8G2v4Lo+PE4IJANJ6CAIR3bY+YrgBkSrWR10f8HqzRM/Bz0oCd9lAg14d
         zneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448333; x=1796053133;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwDysrxowIrcL6nfomWCriBbdPh4cWHD6+FT8Zt6pqY=;
        b=y6K4q/D4iVb1+Ra+qIdvPwj0LFc52QnYo5Z5FlNQLCksenXwkMZWzvzg+dkwL3XrNl
         9sUPivW2HF83jZKp5nzJpSSpfCHMy0awZAV+lE0t3VImG2ngtZaxzNNZaH6NJa6eBO1u
         tDfp/4IbRD7rHXIMfAXZuEzAJHv6PBbbJaN52K0Xk/3B75XRi/fUUdA9Kr48DXB0E9LF
         jyz7ma3Uim8+d81CZ9EDSpe43T/qXvEHdHI5Pib/xB8mnxu/lfwwftgtGZpJ65UUA5le
         GmtNBwzfMjCedqWL7nOJK2wY/+KT0IM2RYd+IezpY3hTcKYVGS/IdbapR+mx1bE42mIB
         wJfg==
X-Forwarded-Encrypted: i=1; AL+hErF2TqRJdY6GspdY9wUpN4gJFotsxPtDWxcvNhCRu0yQ/LVM+53aqJAmdIeXWpbS35i2vF95VclZ7MSzdxY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EcBdWUO7Ws3YjIWLDKN+DzDhmopCYRnEuuNd+jfwLJbEq5HQ+
	Vtopg/ByCkFFQ2b4kKTx+zN8MIAObSo3kKwQX2hOMLqDCTT/ThcQ8ZRY2FU9pItipN/85zVQ8gv
	WJOBI4G8Hi4S1QJuBMUSH9+wZDgv2+c74skbPY4kyAXZCnOqhL6soqhe1nTld33IE2QU=
X-Gm-Gg: AZFdTZcbL4zlhL3VVrRClrGCIlzIEh5ZZvIFalXLw9hAu9rcB7A3l4wdcyBd/eixL/6
	04Mgb6pTRLXgSwVW4LHaN3NEyorqZz18pvUptyMm6aO/RGN9qMp7uky0jJdxMG4AgyCGOv8q0Dj
	irfqFFrkbOVLXbk9Ax2T87P7wdTXstzw4WAH8XL3ucuFDd01R+a5jVlsZTDJjUWd+T2qa1UFgWY
	eLr8x0m03TMVOVVDTe2Kh8sVDpCzzPY48/SyZsW0w16KIZTwEUnARLDX1RP8dZ+L3ynPHRJ7Gn5
	/Xlm+9A4AGwwOGGHlPPeoh2Pj+SEAId7HYrzvB7R7daeulZtyHMKCq6ScrBFnBV9swo2uifwSlm
	CiyxPvUq5AJRFqYZ378vea0cEoTJbigJAbsBWiK7RZE9rJm+xdqZznOvui7EbEkd/m6giuUY=
X-Received: by 2002:a05:6122:6107:b0:5ec:e6be:d626 with SMTP id 71dfb90a1353d-5ee8ae0f76bmr6871890e0c.2.1795448333417;
        Mon, 23 Nov 2026 07:38:53 -0800 (PST)
X-Received: by 2002:a05:6122:6107:b0:5ec:e6be:d626 with SMTP id 71dfb90a1353d-5ee8ae0f76bmr6871835e0c.2.1795448332884;
        Mon, 23 Nov 2026 07:38:52 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba7b9570e9sm3621677a12.36.2026.11.23.07.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:38:51 -0800 (PST)
Message-ID: <f6eec0d4-1d37-4bdc-b09f-8bec0dcb8dec@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:38:47 +0100
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
Subject: Re: [PATCH v2 1/3] ARM: dts: qcom: msm8974: Fix WCNSS wifi interrupt
 trigger type
To: arapaille@atlr-engineering.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Luca Weiss
 <luca@lucaweiss.eu>,
        Eugene Krasnikov <k.eugene.e@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, wcn36xx@lists.infradead.org,
        linux-wireless@vger.kernel.org, stable@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
References: <20261120-wcnss-series-v1-v2-0-3fed518decfb@atlr-engineering.com>
 <20261120-wcnss-series-v1-v2-1-3fed518decfb@atlr-engineering.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261120-wcnss-series-v1-v2-1-3fed518decfb@atlr-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b045e0e cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Knk3v0qlAAAA:8 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=wt33j95wQlzQpC1BO6QA:9
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22 a=L2g3GqtBoyQv0ocsUjqh:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MiBTYWx0ZWRfX3iHrGojr4KX9
 CckEACJOcOoXvYieOAeXSTPac2fI19TXJ6mAE7YO4ilHKfCd88+IGbZAY/camL0Ha9RtZ79hT+7
 syVjri/aKgkGSoVn/yWqjT4ZEWr8UtwS9F08HujZByqydU2rUxWn9XEknF9LYrioVyh2ZqxHi9y
 fVfW4bwJsWLPZD5s+sxZ++WMhlJMlwA4ps1uL916tJPpA7XgiFTszsM2KXxj/rV56FKEw0fRYNR
 SNG7iuxcYJuPu+5noULeGC7IGkrE5kl46qUyzhhXAekhsz4+mZFxMGcmIVcEC3UcwEhXhjblPPk
 C4VPSF70joM2qgknFkN0dn4Ubi0di/3er4Uca9ajAlubIeDO6K1WeEbkq6W/XUC8jmCBRad+H3f
 gTC2x3j/+eoigVxiIfYm9gMkV4hkFQS5fMded2kZ0ttpKcQ0CODAITTBMGmP4Z5CNoPzMmPCBQu
 lCRLjnQw//dSGerHiPA==
X-Proofpoint-GUID: IDBXav2gEuWjqXOJJffVGdxmQ_pVUo4c
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MiBTYWx0ZWRfX2YuRSRu3acLH
 /+dsO1kwFMGY1CCR+WDFTjrPnMJif1VdQKgUF0d0Bqu9WOeF2+6u9e5pf50l2bhXjRRds8A3kqr
 omAXZKvJA80lNzU5MPFXsb52UliDX/Y=
X-Proofpoint-ORIG-GUID: IDBXav2gEuWjqXOJJffVGdxmQ_pVUo4c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230062

On 11/20/26 9:05 AM, Alexandre Rapaille via B4 Relay wrote:
> From: Alexandre Rapaille <arapaille@atlr-engineering.com>
> 
> wcn36xx requests tx/rx as IRQF_TRIGGER_HIGH, overriding this edge type, so
> the re-probe after a WCNSS restart fails ("type mismatch, failed to map
> hwirq-177") and wlan0 never returns. Use level high like other WCNSS SoCs.
> 
> Fixes: c7c0edecfba8 ("ARM: dts: msm8974: Introduce the wcnss remoteproc node")
> Cc: stable@vger.kernel.org
> Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Alexandre Rapaille <arapaille@atlr-engineering.com>
> ---

Docs say this is really a rising-edge interrupt - perhaps the driver
is wrong here?

Konrad
