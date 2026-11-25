Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601335;
	b=4Nda4hwOaZM5u0c/V22IG5/PrEUjt/tkQjJNJxksZNcvit9Am45U2BtEn4LJobqTQmqO
	 FD+g4wIAxRn50HlHw8zg92J0+fhwU+5EVHNxXYN83kXitrGRed2gSs3fYMzpicpbuUeRL
	 ELixTZJC5JkOOaJnhlHItCHUn/uHDOLkYrSCKwzY66qhenNYyMn3go+noUNkQy/b0jwkE
	 Fb93pslnn2N/9/cw3d6bxszIHY0ozh3ZPLdlt6tC4wPyhy2wZ8P5gmFdXolqnZKA9Lwlj
	 RFGUwaHhtZkuy5YZds33sfz/NBljWPpwm83m+hbovdL5cmVPce8x5e8bFpSQlhpcR0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601335;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qp6vADU/yM8NDboyiV7Ep4k2hL9dQro074+dlKU7H6g=;
	b=V9blloze4I3TxmlVdUi1H2wDF6XUZ690P2IpBhuTLURwXajk9sbabBxs63dQXdRa9iOG
	 skS6PlaaN9nita77SKoOG9MOAVltc5FkMkxbJSHKvKCjKHjRqH+D27N8XMMrR3j5OHRe5
	 USL2EXDRXspSTQ/PK2PwOvKEySYy33durFmz95TXG8oW07wQZ8yPdiTRI1pigWpgGoZhW
	 p8E97vTl8qj1zbXXJP/FhxxxYpnr+e9ddZefEL4pAXKzxLHdY8QTjDNpQL/0u5vpQ34Df
	 vnSrNGPvU9FtGhQbfleeHHmG7GLFeHzGK5k8YLgzG+Q5kpSzfc7gacgsNUtsH+sI3VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QnrnNWlW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PEey4Gzh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA295606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA295606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QnrnNWlW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PEey4Gzh
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mCSK3763926
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qp6vADU/yM8NDboyiV7Ep4k2hL9dQro074+dlKU7H6g=; b=QnrnNWlWhHnupilf
	OCjw8Db2iEHVxnhXqK+UQbGt+FscGxJMWXm49viFDvklzFkquTgNIHQYR/hniIj0
	aNqHINAan7Ipu7luju+b5oSeh7iugs9CqoZ3rHSwgd769VlGPDJ7OQXwX3JXDEqL
	RXxMZvGaRNTBonZb8xbDOyaVYVysKUZBoTtt5TYg6d7qLBk6/YS2YEEceTjO8029
	eVzX20ZA53mierDKMDTf5VsG1F/j26tJ9rNPVY3Th9gjetN0LTofl/o6hWO72HQm
	SxaqH1oKKTq2Z9FtxDqhef0wZCSNz7QAPxWKervOc+lyqwIItkK6u/t1JuixXzSn
	ttpvyg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vv2r8rr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:08:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5360b8cf8f5so11816101cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601332; x=1796206132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qp6vADU/yM8NDboyiV7Ep4k2hL9dQro074+dlKU7H6g=;
        b=PEey4Gzhuymafp0uZJvcyRKsYjCvjeRUZAJ+BBZxSiF5H11E0zWd8H2krelTIdn7OS
         I43bsofAUMki+IH7Z8/3UCamrtWKrkREK37+b5wJG8T463jaIzXWDDzuIb6QNZILUyVs
         gBJ6DD2B5D4izEn9tCTJ8KKzRpKwbzqCHJTAotuaRjA6HFCOLFZ5opdjhcM4ZBzg3Rb4
         T6xR/4N8MYgH4a5rfwGhjKFEtHDoWvxOV5SOvFBEUW4sNtgOtgX1FSZi+keRQbAZ+5m9
         sMHT5ZdYsy/6IxzVScYFVBtvWJ3SlCRwMqyIVmuG8S2xfr/rZuKpHvgrWWKweJhGdK+8
         Orfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601332; x=1796206132;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qp6vADU/yM8NDboyiV7Ep4k2hL9dQro074+dlKU7H6g=;
        b=XKuMUF6Pjf0lTtalUCWsc6TZkzHSrKPzKAL7WpZs4ylYsZY6kYJfm3SUJDJN8CL80k
         RwYt8ScQwn2D9iwTpT1lC35TmDVCRXcFqobkj7+mFIX+/Kx1CosWs8lj/wZNwk+PvwKX
         yyhKoqT4YT7k3uhfstmzY/egi2B+3zFvLhy1BMeq5+Rwy0n1eO0dUeuE9iviSMT7SFBw
         HhP9rZOFweLCLbjdicFO3EWzfnMhUcfQW2xLhmSrYu8J+rwwDKmKgjLG5innvACfMHTg
         W7m7eNbm7NZ9VXbb1gStgNj7hG2uSotNBhadUwWJJs5b09xBP/yKnn/tBVenDNgIWQEX
         dotw==
X-Forwarded-Encrypted: i=1; AL+hErHyNcgwWSYJXYdmEtQVnF30yn/bRy9SR0d/ROzX+olrLVYzcNEIaPE1XnNP1Hv4XofD01wqE1BvA/t6p6Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+U4huRvPSP3+E2WmQzY4/dcEo7kKxUr4leH3dVZpVCuNNUoc94
	oEOoZSmtEmKXGlDAGLYZNGPU8UxWApCROZ1SZS9C3qP0C4ElKsxHYXvkirZya2bbFj+GIGVSYAH
	zwhjlZLLvvRJ1cp70JPoLewVsxqda5f9bUTPgtT+GVw/UdBeV3zVpswnskF5+LnNJfaY=
X-Gm-Gg: AZFdTZd40M9THlF+3GyUvtQHeRy9S3nM3n6h1BsKY54s4dwEkRx16zwi4SJR4bKy1wy
	yuKXjQCWNVNZm9vVfRHuCJ1bFJSymGkYPAeRsMzRH7lHGrW1012+HscAtgHgb2654+EkK5gNZc1
	6Kdb0K26R6dPKTuYrchkV7TL8l7TNRg8W+6o78ic6YKegFSklJ8UPSZggtoAiKq9L5IwzaNkVvD
	/1RVvG64k2ZrEXC/xl/iIMYt/m28p7FiAEylRClQz4h2eQ2m08Am+edtqJn4+UJnMTLWhEJA2m7
	fWbue61ixBgk54o5cu4s20dmbe7ZSoivcUB+KadfEEPwBVF6H/v3FIKck6lgqaJvGOqSkX5YdG6
	cIxShv3uGLjrpPqPSndNjnppVcogOtyin0KVIlR324jpnkgvuW/t5v1nEMxvn/VoAxIMprd8=
X-Received: by 2002:ac8:7488:0:b0:54f:7ca7:1292 with SMTP id d75a77b69052e-55d76aba659mr331522941cf.5.1795601332179;
        Wed, 25 Nov 2026 02:08:52 -0800 (PST)
X-Received: by 2002:ac8:7488:0:b0:54f:7ca7:1292 with SMTP id d75a77b69052e-55d76aba659mr331522561cf.5.1795601331660;
        Wed, 25 Nov 2026 02:08:51 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea6e29sm604969866b.43.2026.11.25.02.08.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:08:50 -0800 (PST)
Message-ID: <929364c0-9c21-48d2-88a2-caf02e2fb15b@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:08:48 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: sm8650-valve-deckard: add more reboot
 modes
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118-topic-sm8650-deckard-reboot-modes-v1-1-a214636f248e@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261118-topic-sm8650-deckard-reboot-modes-v1-1-a214636f248e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfXzL+Oc3SdcPGJ
 uO83VUtnW2nTiyKVlfWl+tXP1KV1xqvCYTRkLE/EzAwor1Pby42Na6ik10JMUxCz3A6HaloGKuY
 rFt6GsIJ/UYrGBVxPNC7nMf8lGd7lFg=
X-Proofpoint-GUID: DfYAyaBBUNk4a7a0pf-jNlmFf4Jkptw-
X-Proofpoint-ORIG-GUID: DfYAyaBBUNk4a7a0pf-jNlmFf4Jkptw-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX/JDzORf76Fy9
 i00ppER1EjTgakwEj78xL71x20BCeoJY7OoPsQsiByXI2HqjxFZRyc1Pu7uuTfyoA0lj/KHEd6c
 7bdErtEUtJlK0B8xQiR88S4aZHbEpzuUDeJSzms6qAqJDtrHu2vkWOlym570sZ2+xoVEx7PnOwM
 lCunGyv0R20XyFjNYl5yv8sZlcpxgd54bVx046dPg/rVNnC7w3DQqaLTRXv7XdQ4YjsxNxSjYYs
 1KXvmwC8JMpPUeSSSJ/RqiugYSGC4XMy+LSAZ1+G+XyWXrtCN31YtBiALHAwWGBrcFunKQdh5V8
 LVA0/TSscQ4+dKV/+s4TQWu1Km3wRvR/fTPl7ZQ+wiowNIEtZkTTmce7TwEQNHh+ejyWZRMCIAY
 qmEjNgGdHEr99CSIdF5AXK2arKp2hc2s5xHCATyGuN1kwHkTKnolTtD+jZlCgYKSKqeW3YaDI7u
 Gr1DTEgn9O9G2ql6cKg==
X-Authority-Analysis: v=2.4 cv=A/z5rKWG c=1 sm=1 tr=0 ts=6b06b3b4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=QM-UIIi6bNSMVGtDbtgA:9 a=QEXdDO2ut3YA:10
 a=3Q3lADbaBCgA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250040

On 11/18/26 10:46 AM, Neil Armstrong wrote:
> Add the supplementary reboot modes supported by the Deckard bootloader.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
