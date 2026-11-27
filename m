Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770675;
	b=NzMgwQI0ntBdo8HVwCBq8x4BxpUa83z33NrA8RMnfKOj4DXNADzl99G3qTOy0DEYW/z7
	 /R/tgmlau+IrqL2NCRRq6jOoGUqWcmNyCYPou7Pp7d6GOJJH5jI35a8JH8MTmqJzIcv1w
	 iuGn3mrAJm6he+hC7orrZm2ID6GS+qqueWURQjdw5Zs5UrrkvRLwj6PrFCZAwjc6sc3p/
	 b5DB/XrnCmIH8NwKyuG4sTCWZdl4/g7cDVqpcSgxIEb+yF0pCHBJ8BmBQwjOyC9EA1UkO
	 m3/MukaaOLki3x02ZlSUKSG8q7AvzQhIBA7rjRlzHcI82ur+TxnyFyHj4ycPmbQvRkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770675;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IgUsGcjyfX3pn/47na2rOFgHRHCfaEjUCpn+6VJ9aDM=;
	b=Uw1RfpOqKY6m6xABjF1ulnnK/B664ZTa6pI2opTbPh4qqXCOlJlEn9Dh0J0F4UTfVW5l
	 UeMkuKWwgMxHHXtalkuWSig5ufyCvPQli6l4JXDX0Qc1UPTpgfDGhs8PyNj/x1vEF+8vK
	 B0eMSbMf0AetbOqhJSfyHbml1W/zfaAQA9gCAgL1xNnOzSQa9cVCkR12QBPxsCYuS30Rm
	 tad+5/3O75W0EU5PFnXgGiHZ3HIPtUZSsam9aUX+wqXRG7+hKr3j783SXE6CSHmBm1JAx
	 Rqa9CmobYP+J+sSsumjdUFyKV2uxIVadd7OIksAlHq/kBJo5MExCPyeqJeEFJER261Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xj3Z3Cob;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dg3gabwE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51708606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51708606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xj3Z3Cob;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dg3gabwE
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GdSc1564750
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IgUsGcjyfX3pn/47na2rOFgHRHCfaEjUCpn+6VJ9aDM=; b=Xj3Z3CobRIVJY8WD
	UnqJ/SMwLSCDazOFshwsUrN0xRwkHhr/r4mDo3e7WQJJDpap8dala8XgfPLQcu4l
	7JveU0dyBEKXzdu20o/kTIBkkMTpVKEVif1pQOP6EimGKAd+9HhXbAsKKw+reOm9
	QYzVXhA+WGtmpv4M+pZnkfyFMJHKUaix8RktRRjjk3YsdINu7rF1/yeI21Xa2GGe
	isBrxxB51PZ3014BEUdRdaGRn/SpLuim55rihyMQUZFATtQQtsJFmXWr/Rqu/EH2
	7aw1jPQn2yxIl4pA6sZFmEfIvfjMv1OlVf997L7NZZrCRvgAS6b58ls4fu3t4tzP
	lkgx7g==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74garnj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:11:14 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ecba171914so361711e0c.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795770674; x=1796375474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IgUsGcjyfX3pn/47na2rOFgHRHCfaEjUCpn+6VJ9aDM=;
        b=Dg3gabwEdKUkP3EOyQ9CIwrWhvehyo6R/TaFvLvI8kr9MF24rz00/5I/l9MgSszTJ/
         vrmKcyq1QevEn3fuTzA7h0KWOntjgmqBs1kPDpwgoWhnraNuL2JgabZkzRDEtK2he/p2
         eIxjh07LcfE6ckdINs1ef/dGss2o4TQLoUhI4yyjnMfHZY0mKDkFKvKhRLcuGdV1L254
         lx7FKjEtjvCstpUB5zTlnQ5a8gkvFwxHtPissX3Qw3WwTIlJhmSIwZC4f8WnBoC09iQp
         TF2vPsSx6K5ysMeUYa6D0VqbnSqvRaA2De7qmoYFaWsu9I3wWfdTIWIpZO/KigUAtb2p
         mUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770674; x=1796375474;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IgUsGcjyfX3pn/47na2rOFgHRHCfaEjUCpn+6VJ9aDM=;
        b=PLdwBAhAVnFO4jyGP0d9cVdigYiY9c8mvtenDvI1y3iZKADW2d6kT6kOvGJHDNLwz2
         f51mhRzI6xv2pffhAE99lj1unGHxW4CFdGaUStH8wNzepJrED3DN0Nl+6vLRw983FLN1
         cIgJRQaLLVUL2H+li2IRo5vS2tIWghc+GM7L5o2HPAVlX8hLkQjKkz1HUo2SmrfIcZB/
         6epRK27TykxiVhJyfNyhKjMRis6kT2LZlmN/7zDSOMMZG0SJo0buE9kWmZkLIvVSFxTC
         CGekoDiUVj28VTg1fPq7n0Xc9I7ZJRb4EpBP7wKHcsPQhT7b6EQoOo3qpfpxK0BGA1mV
         Em0g==
X-Forwarded-Encrypted: i=1; AL+hErGMnhOxFlYdBg0371pSFkrvzDvPXtB/hnYon0CfjUKJYNtj74v8/cj3hvsVk5zyEr282QelyYq2/g7M3Fc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Mt13sVhSu9LTt63yIQnXVH2FiK6tZu2OcZa9WsDg5wvTrYF6P
	a27cR4dPA4hmZEXSJk9Fx2XuvjkT9XTWDmVTzpPNPKwzbcveSyc72g+zEb78P18SW+uTBjD0wyu
	PJpZNovrW7UHeza4PoG6KMWZWynKvSiDo9rDdJ6m5gwo44AaY64EJr13BYev3Q8vSjOY=
X-Gm-Gg: AZFdTZeSJYWunebXDrugfQ1jH5XFF+GKg8FDEh4qEzKGBXZlcLeTj4WPpGuQPD536FR
	2PW7XDf9EaGVhOoOXu/xhzMursb8pyO92QVKp9RVwF0rfNDuAtiU/VTBbZngdvGllW878fnJzha
	E8TDO8Q3aiwgg2cmdQlg6jjGnFiVtzdGcIpQDiCwWTkOcJdGmgI+rBIfRAwlci2RbaJpqk+5rEj
	jRP9Nab0rYECDOarvEuVGOPFgKLKJ++KqnTfYsnfzVcp1qH8KHiyHmMkhFVKt88UwNRVXfzafgb
	h9Gj/DxpVxUSwKmuEk6n/wYQNXycCP8DUU6pMq4wDIDFUKotKuImgpLQmV+Zt3wnMt1pFYMPTEn
	KLjufjRwUCFSA5yGLd0QC87Pe1EGKdEG2JQ51NugrcbZs4IvXnkiVCiTir1r/UyK8NliGgF0=
X-Received: by 2002:a05:6122:4a01:10b0:5ef:d97b:2867 with SMTP id 71dfb90a1353d-5efd97b3b39mr322682e0c.0.1795770673507;
        Fri, 27 Nov 2026 01:11:13 -0800 (PST)
X-Received: by 2002:a05:6122:4a01:10b0:5ef:d97b:2867 with SMTP id 71dfb90a1353d-5efd97b3b39mr322603e0c.0.1795770668162;
        Fri, 27 Nov 2026 01:11:08 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b03723bsm840417766b.87.2026.11.27.01.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:11:07 -0800 (PST)
Message-ID: <4aa25716-37ab-43ba-b3d1-b0b48671dfc5@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 10:11:04 +0100
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
Subject: Re: [PATCH v5 2/2] pinctrl: qcom: Add Molokai TLMM driver
To: venkat.yadlapati@yahoo.com, Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20261126-molokai-tlmm-v5-0-ada44435bdd3@yahoo.com>
 <20261126-molokai-tlmm-v5-2-ada44435bdd3@yahoo.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261126-molokai-tlmm-v5-2-ada44435bdd3@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VkSO6wSnxdM6Fw6mQSrrRvnE5BhSVn0n
X-Proofpoint-GUID: VkSO6wSnxdM6Fw6mQSrrRvnE5BhSVn0n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNiBTYWx0ZWRfX9a2jDDi6z1B4
 UMr/UMRNeHgpvspXJObMOH0Mp+muYkdA90hWz5DvW4BRTbZ1q8XmNUL+UIyC8AbKWDMgs0dHC/+
 Tsc8x9r4BQqXQ0Gnb6tdX9TlUmlc1x/XwTFi5SwpxEDFlt50X6xQHdU1gRZnIPsviI6RsLTnz8z
 2/Smh0Y9CNwP7hhX8DKZ07l+OPhyNlreNWWoQEiaUwsRCajN9tx/zIGnf/65PbMg4gsaZq2QtL9
 Ox9yNMmYfaAjI5Fjhl/1lWsin/0oH7ZUy2CqPaKIr0XSmbSJaRjUa/ktd61bIDQq84+Wxz8sctq
 7pz2jHNX4/4FSJ4Yk0X6c2soMweoWsOfQ10WTWvNWBx/l/wtVyaZH2tbpidK3Nn1XUzYjyxduDy
 sNjMnmtfpkZzoogOIxK7tuNkB1RwISQOJL2MwVEPTyQ3Pg/sIqeMJOUqF/ORCy7zJG0nRRU8Aun
 Xn6osKWD3FjIu2pMcGA==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b094932 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=CjxXgO3LAAAA:8 a=EUspDBNiAAAA:8 a=tfEBk67aE7w0iaTIDxoA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNiBTYWx0ZWRfX6o6UG75VF//u
 FR45dIkmeMXiQe0rKuRuxf81FSWOph2zgzC21eGhakNBR2JSt+UmL+EQtgrGWh9MCzIwNoeHQdK
 4zAQLT1xCH2LBcUlp+mgRgecDd4wN0o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270036

On 11/26/26 5:51 PM, Venkat Yadlapati via B4 Relay wrote:
> From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
> 
> Add the pin controller driver for the TLMM block of the Qualcomm Molokai
> (SM8845) SoC.
> 
> The register layout is the one of Kaanapali, but only 29 of the 205 pins
> have the Kaanapali pin functions and the GPIO to PDC wakeup interrupt map
> has no entry in common with Kaanapali, so the Kaanapali driver cannot be
> reused: with its tables, a wake-capable GPIO interrupt on Molokai is
> routed to the wrong PDC input and never fires.
> 
> Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
