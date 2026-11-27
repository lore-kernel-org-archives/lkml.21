Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779165;
	b=NGlxSphBDe3BGTcEa6fj3nYVIDHEbeDqLc3aERxZ2OblNHZTL7cipmj+HSxfHxIaKeFi
	 kbZ8ekd80qMTuwAnQdNRTerG1IHqZ/qWseS/yOQ1pT7/zNHqbxITSabptcgs2vCnyN5U7
	 P9JRfHgVnvnDRDnycFQ8NZwNjMb4oUAczquyZLAtXE7OgyyC+abeg3ib5hL+sMQQAgy0n
	 lsZqoUnnsjn2Rcx5AOXOWwWgsBwTtS/MzYnirS7j+faeeQD7yDk2Wxzi87FCYFQ7QkLIO
	 mcyyW0j5l1KTi2V7RglnvEmGHX8y1Ot+vw9+t7zGobKMeSyfGnToa+4Kr4M31vwWDNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779165;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wNNDTMtedEII8GWbR4YeAz1zkI0o7kg6R+YCF+Z2AS4=;
	b=AOud7HCJy3qnd8akR8XYbie7tUqnmTbXxIe4imBXT0JHUsKWJjg34v1yMspKkHUjjeXQ
	 z3L7jqWttoUAj0B3T+t21mxV9syB//RPv4sbV97qpzylvX86tAUpH8UlvXVPLVIZKqsM0
	 0dKDNN1ck+2FcGpZ6Dm/M4THp98veoh9AYaUYio1h47RvJ9FUxzhhqB1sN1m2b8inOPtb
	 3rWO4Ii4FHHbGnkLqFhyaF6WkkuXApjEtl2/GrRmxHF7WBS8uLv4jfDRBGaqy2agyVRQZ
	 JfAxd97NlB9BqE4MqPAyAxpXSrE2s2/RbPOrJt6vkhj4rTgYRAdXNpRqFBNMMdUIY5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dxIfQMlm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K1S7Dw0W;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89938606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89938606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dxIfQMlm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K1S7Dw0W
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApZsp2058174
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:32:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wNNDTMtedEII8GWbR4YeAz1zkI0o7kg6R+YCF+Z2AS4=; b=dxIfQMlm2Yh8EP9/
	VQScG+IoCxTduN6xSeNmkE8g3kg7nHoxkCiPT+9hVCVux5oJ/Oa0rZVbIDOZeCt4
	BP4LU/wHTnxji77Qx3X2723GjOIJAKvLWGGg3Qq/U4G6yNFciK7D6uciyISptdF2
	hRfxBJizb9qAuUp2WP8FvOrg7ZeeJAXjQpe6q7E+rmg4h2Jz1rCN+v7XusoS+P7b
	YZX98M/wscRHSinV1vUFTfcbx1fwfQvw1T7O1EfNc0R1to89+r1/CEwQPc3STK8T
	ll4D0zdiLXfXOiREJiZnlDJ7poiV7Urq6jyo5sKgEmRS1vv+6dqKwiw5qIgOq5yS
	H2xDiw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gas7jc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:32:43 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5edfa7703ffso366206e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779163; x=1796383963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wNNDTMtedEII8GWbR4YeAz1zkI0o7kg6R+YCF+Z2AS4=;
        b=K1S7Dw0WiX/sqsAUf29x65I1lbFYJ5zTMQP3R73ZVp9KdTt7+ycdnNJv2/VZNl66PZ
         65psBtSkjQt4D37plip1pQOGCbkzbcKiGAQWGfCkl+bNhSpVWqJwk2JvCraCNYAyfdmX
         NHE1kWMrt3BApxEp3WmOlbEsLYK18OtFtxkOYSu6wy0ZE2eRDvRc/v4JLJF0HU3Su4nf
         7lutw2ZcU0DLL70YpBCDwk272L4WtdjblYBkVQoPdxpT0IjHkx2FztF4p5jMtM6OSW+N
         QldjJe/RgWlizQG59/RT8K1CT1CR6RceDvjZ/e7ibrNyTe4u+iIWyzUkwSv6vnSfhQtG
         1a4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779163; x=1796383963;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNNDTMtedEII8GWbR4YeAz1zkI0o7kg6R+YCF+Z2AS4=;
        b=reQGDBlGY0WmKOfT9W/6uikM+4jRQoNAltELLMzd1AOyV28PKfa9/d0hrmjWOtJ32+
         k1G6GgvGTHKV9y6HwxLgBKKpP7v6d4E++uriUfd4sDmCoothEeoR0KjDIAZXvHhBCCo6
         I5C2a0mFHPjwShOjU5Q0uvGVQgOHPZcozJ/fZN6DGsuvdn8Su2tvr6fL7do2jEVkKgSu
         2F2zmGC2OuE5QsyJoCJISgsfmtRskTTcIv2RO+BNpaxw4bPysrTeb3L91WYk6vtg9OuX
         L0mK8Eqi8KSduktQf5luSSxqi9aFUbvNS0wG+8ZCjTRN4xDwBkVyvATNXrC23IbcdLsw
         CTcw==
X-Forwarded-Encrypted: i=1; AL+hErFumc0sCGLIwWNdcsJBpXmRpHP1TbwBEw20ljvkdffscKWQCVXNxrWqEsAcfFUQVu+9/uJWc5uMu+4r0Cg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RH6VxvbFtbjomaIunkw/gK0W0bEJ/fBmQtp9qkArNXl+oQtcI
	SQ31XacLfr+on+BNGKNyzFNW9OI4CaO9j5VDNohuH90PGj0mz5t4yMn5Kl17Up3gBDghiSFjPjx
	JMqxD0jpb9PDLKA+1TN52loVXrOMd4hARSjlqmFPK740q323w8t1rQ1mHc606qqxdJMY=
X-Gm-Gg: AZFdTZcRsQwCYzyl4ZrGIhStbFUHx0gsxffvfim2ZIIdNAtn7qslqlbk/JdgeROEEi0
	hUEgT/G8FSwwwoxpD3R/b9LTXhIQY7j33P290S4HNkggptLBA0fvLwMAk3KqgxMSfyOlV8zUzlj
	kxpPcYgwN789uo5w0/z67hlONPEIF0JEACTx99z6n1ZLKREwqQXNdeCwIIm2M7w4jlqiZnoBI6j
	LQeJmM2Dl5k165N1atP81YeWNzY64TwIP02pFAj3V+5hjTZhwPceSmXucAitqu4PpIKuzKg4sID
	t5SFdvcTXgpxcIu4Z9WIdKz+rjuJFHsnhljAtdOMnuktWHtLUmJBl2kd7MTqDrAxiP/1cUwYLw1
	bDzOU6ehEl7lH61LaVR34kDu6rKdzXr9JYCW3F5cqxz5VbHg1Jjg/moomiuynq5FJA9BtPHA=
X-Received: by 2002:a05:6122:4a01:10b0:5ef:d97b:2867 with SMTP id 71dfb90a1353d-5efd97b3b39mr544181e0c.0.1795779162793;
        Fri, 27 Nov 2026 03:32:42 -0800 (PST)
X-Received: by 2002:a05:6122:4a01:10b0:5ef:d97b:2867 with SMTP id 71dfb90a1353d-5efd97b3b39mr544142e0c.0.1795779162302;
        Fri, 27 Nov 2026 03:32:42 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm901356166b.6.2026.11.27.03.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:32:41 -0800 (PST)
Message-ID: <541df6c2-2b98-415d-a57a-2650f03cc495@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:32:39 +0100
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm630: Power the ADSP from the SSC
 CX rail
To: fabricioakio@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Martin Botka <martin.botka1@gmail.com>,
        Alexey Minnekhanov <alexeymin@minlexx.ru>
References: <20261125-sdm660-adsp-proxy-rail-v1-0-b91784c69623@gmail.com>
 <20261125-sdm660-adsp-proxy-rail-v1-2-b91784c69623@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125-sdm660-adsp-proxy-rail-v1-2-b91784c69623@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nd6Av4ni1QBUWgDAVTl4b-cWnogjiMnC
X-Proofpoint-GUID: nd6Av4ni1QBUWgDAVTl4b-cWnogjiMnC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NSBTYWx0ZWRfX1PkWhDhiBLjt
 0juWwLA0eEI6AFJxevHpiOspLEQbsZM/AqxT+H8fjOMZQJluRQ5MDsr/rEFezWpmjBAs2lwHySz
 JIvKK41+y3MiH8A2gEm58Yi1ubrtAhmuYraOj9UUO5Mx/vc2BCIacX5zqaTVjRHHxQPlvnNwjTG
 7+fGPrF3apPkeMNIhwGt74IdTUMkiGzpBUtztpDOSm9McIvfEUjaHv26OyW7q1XP2hq2wNnn5RO
 Tpc2BEhAzaZh2aFN48EGYOrfGTHdqgb0TkDukES7avN4QBI8STUcnhduUem+tDINy1oVtl5qg+X
 qOENHyuWoEr2tBj2nhPZp35P5M8QWt2rKlVOXicI4hNJB1GRrygvV0in5G/QReb03HtFlEMEyXG
 yvYoA+dPb8P3CCRyUM9kZwAxjfkJf9M5I/Hv2dRQoBsczqeu7lpE6t2hMD2MLc2OuliY8z40Lme
 +mnr+UMf6QeC85u+khw==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b096a5b cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=JrArOcoNHQKtsS5ItqMA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NSBTYWx0ZWRfX+otCSzHn3l7z
 XhHXhRiyNRAxKS1QV67KE5ELAK+3sbmTgSemcY/cQoWlLvxTunpGzziPQ7Q47CZQdM+YNTnD6gt
 S45le7x3Ifi2MAYpVzvy7vXsK21UmFo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270045

On 11/26/26 3:20 AM, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> The ADSP node names RPMPD_VDDCX as its power domain. The rail the ADSP
> needs to boot is the RPM's "rwlc" resource, PM660L LDO9, which is
> RPMPD_SSCCX: with it voted the DSP starts again after a stop, and with
> VDDCX voted it does not.
> 
> Fixes: 7ca2ebc90a46 ("arm64: dts: qcom: sdm630: Add ADSP remoteproc configuration")
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
