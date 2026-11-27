Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782531;
	b=hvxza5ljPbthJuj4NjQTm52djPCZwJkXvgkH3VvI6J58frsqb6JlPFD8LZTARaAlhlAg
	 gwzRWtXmOMzQfiKE/WSUhrPAIFsq99SwK1IQ6Bbb8iH+54EJc/Y2tAK5xGbm83LfvnWMH
	 Wzf78ooHRsWvKu5ShT9/gTr12j/88JsM4iVhNN3idewhrWZao7O8OvXb2+Kwftf6SGGuC
	 UICihf0tnq9Ji36m6IxpKZDZwAjgyFZM7rXrYciyMo2wFvcb5ZMVEb2UH+HHIDmcB82Qa
	 6Owtd/tfa6JuSfz9I929KMr53bslsdr6Azh6+3iYNYG3RKgPbSeLYjmBRK2w+hqnqcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782531;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j1mcJVFc3LBFkwpNjcl6Lr7eJPs7s5utsPTpUn92RiU=;
	b=EKJA1GpgVeSXew7vuGLhUvqrm5hY8Z1VXWRze2oWSC/NfTPqJQxpYgfOLtnghAhKrymF
	 PzTuWC2cTFv32XaSggzCXUnpvWFKhQtmgvdqZFNrJFcCsaPdtKe24i5JH1ogM3k110PkC
	 bnY3Lln+sPXtu56kx44+I1TiJqxs32VaFTWR8q2tNjKTvspY3uOrA5u7oLk5Vtmu+JW6S
	 /im3kOsMBv2R5WmpDUjL2iuW5eRXoN7kXRxR9Tav6gG7mCrBMCuszRDT+v5uZt1XgM02y
	 +Rb/vTr7K5BpY1eaNxRq20Alvui5sm/DEGDjPOehenlQV3DEA+M32367E8f4xDcIlGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zv9m3Clx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="glmhuuR/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FE1606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05FE1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zv9m3Clx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=glmhuuR/
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAp2uB1961901
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j1mcJVFc3LBFkwpNjcl6Lr7eJPs7s5utsPTpUn92RiU=; b=Zv9m3Clxqmz/Cqtx
	Q/IVh4TuzILwMSHl6w9U+e4JyLLb0nhMGMiwPozvnzrTNXRTHyxRWkzad3zWnhjq
	soPF3+oMqjhQzWoYm3GYgpKZSQOEVH7QBHAL60LNkOQCzQLZPq2BuhgXkmJwp8U2
	Ox04DHwNmQD/9Lem8Vyl7ziOZo2CoLAfFklsfxXnQNoCTM3LKPRAs+wd1LVz3ry9
	ilvtVvqfAYY/oGD/8D4yR4NmDMV7jWy1j26M43MmcrLmlqYh9wM++97Hd2oW1aND
	afkSdVE4QeaDMXMBv+0EebupUYt/nFCaeYtqF6W5Z0pEx93uXktpd90ID71XADy/
	6xQctA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4hu0eu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:28:50 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ee4ca14454so315262e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795782529; x=1796387329; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j1mcJVFc3LBFkwpNjcl6Lr7eJPs7s5utsPTpUn92RiU=;
        b=glmhuuR/7laWGTqjj6FoQsqHJbVD/biTGl8qIMvq00RB3VCTxW+HLcE5Mb4umKjqL2
         QdRXMXCwWhkMRT9D3PqQh/x2lqSG5Mznrqf/pfi3MctIcmOFOp4qTV2W/VBp1Kj8Amgf
         KSTjCarTSne1NjBO8vRPkDap2PhWnX6ycdkBbtbdCpz6ofNcLzyw8YnSayGrbhGEjQET
         cq1cavPuozTA9d9mOUZw5hqCBoxSpWxT7pfMj3T2T1KQZj/ymzuyFHNBs+up81B8Kt3I
         aeiDgstsoIMpRJgEgCM4OUpASoluAz3FbWPgHmVurWLnlcxXhxnort40/eB5Z+Sj0Wh0
         B9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782529; x=1796387329;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j1mcJVFc3LBFkwpNjcl6Lr7eJPs7s5utsPTpUn92RiU=;
        b=fzXoq2Nr3y+hWzHntK1jZCuRwU8iyiIceaeBUY2DWFYrMb05A7zSIofs9R2DqdZKWk
         nvv+Da449C3gN2AzLrkspwVCVJwI/hU7BLpkRQBpQ4KsAorPtVcRKfHJom2KgU3QPUSm
         W3g4ETU7nub4ePu6u2w3h7Dhpyq2aFWAp+Io+eBishdNMhuFHRMO+jZZof0Z6CJJbKxW
         rDhm6zDsN/GMm025lvIm+CJrS6VCzHyhSIWU9mivcBelhmOgYOnOGv0cTTpOpvT9HIer
         EO08Vs2xkS6WTJa1VrpgTUDVzrBBuddqdK0lhrSOKJOf3S4bUKGwCWf8+1L648ZKBiZR
         XD9Q==
X-Forwarded-Encrypted: i=1; AL+hErEHZlSurnkAFvQKgab8LK9unqIfxCbleqIE6Mexxzg8G5vl5uQiLAcRnTSzklKz7elcKY9gncuZkUbRfeU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eGWiibnYF8ckWt6/R7lHAlojF7mkwSdQc+As1wcbUqOj2o5eW
	+acuoe8zLsWi/UCcfbgYUcoS6nh1Iw4PKuw9vRWR6MK4J2WrsKfzjvPwfoNV1H4L1G2u3RkCgqe
	oejGV7c8qk390Cfzzj9N8W4uQbYqxredEwjMSn0DGqIY/vnwTeO8oSIrTXg2lVkvDLI8=
X-Gm-Gg: AZFdTZduvpF1yzthIuTKtTPVNZXzFLskj5srpH7HafmimFBBAW/3+LkKyyqWSF0BYrY
	z+S97DyV2Ske7cQFGy83mQvvA3LcGvPIHW2Ul6lLmO9DJf3qPuc1YxibJrOUOkXRSkQ9csGOlyS
	N3E4W9iVYxOHjkNy3DXz9B4UA87SShQMI9c8qArbbDAwNKJJUBOAJBFrTPuqkmzacafmrVfYwkf
	iTqRZtN/zL+QUg1iZTUQFP6bjyoAfW/dtluA/fn7uRsbpDdwRp/rqRgVft4E6Ko+DJjD7/9wajO
	+2DavDbHB4rEVcnT4h87A8gVCLIJHth6yIn/J5wCRNj4ptM6xCaMXbyVz0AlO1axUvjRREr0hd3
	he89kkHX9Y94QZ0mmkCMmNv7prRAERW9uWgShU2eWs/c25DEtd1OliQ7t/q1ANyq0PSvDYuE=
X-Received: by 2002:a05:6122:650b:b0:5ec:abdc:bb72 with SMTP id 71dfb90a1353d-5ee8ae6b2a2mr16223771e0c.2.1795782529328;
        Fri, 27 Nov 2026 04:28:49 -0800 (PST)
X-Received: by 2002:a05:6122:650b:b0:5ec:abdc:bb72 with SMTP id 71dfb90a1353d-5ee8ae6b2a2mr16223725e0c.2.1795782528834;
        Fri, 27 Nov 2026 04:28:48 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae6872asm840358166b.13.2026.11.27.04.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:28:48 -0800 (PST)
Message-ID: <1066c962-089d-47f2-b658-76ccc627f257@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 13:28:46 +0100
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
Subject: Re: [PATCH v3 1/5] soc: qcom: pd-mapper: Add support for Nord
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20261111073121.3707030-1-shengchao.guo@oss.qualcomm.com>
 <20261111073121.3707030-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111073121.3707030-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfX+7O+M7Ekx+oB
 H/fpG3UI4mGBdP8JqW7R6lurSnUNgnvQiOEIOMlzEBspLqZspd74QgJppxiGgn7hqjfYXNA/Yq7
 JNyQFA9GDZ38b9nQ7xNfGIkB1bCicxo=
X-Proofpoint-GUID: 898du7fHXdIz2SZaGxOJVQM7g5W5xSnA
X-Proofpoint-ORIG-GUID: 898du7fHXdIz2SZaGxOJVQM7g5W5xSnA
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b097782 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=iSz2WJSI46T3I7h2rz4A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfX9OiYHYot7/6j
 mZVIwJqkM94xcSo4Y1q6YmkFJXWM5WThQe+fhviCVYBRhIMUTHw7G10gz+ucxMkKAoROwRmPFoE
 9EVmrsdNEaAZU8SUVR7GdZgVbb/p7/M/hNEHFH5I3YT26lrgl9FcKpMTsM1+fJaOFgZPyK0z94y
 gYoMZ1wZYq7XPhumYSrwKcj0k69F51ah1d7K6VFiG8ind9eZs+Gw3DIUY+dQV9cXJ09gLSqJ5/k
 R2zlBXcuPJXQi/bhUj2dAxlS0o8orxV1ah4xTTaA05efkjia3f9ZpFnodMwq8QgR+9HmrwZUhC9
 51LkU/8FZhQxr/5GVqRqpR1L/YFa5FmCNQSKuk9jv2y17W+uklZYmh6z+gd6WYKvyvRxyJA2Wx+
 VkgA0+lPpVUIzIQJaklTBureYO6TADzaO0OiheZw/OHqlx3qQEUP2ssT70bD8FFH7SrIaFLDu5d
 UbPRmUtQzyDnNjj5kBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270049

On 11/11/26 8:31 AM, Shawn Guo wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Add support for the Qualcomm Nord SoC to the protection domain mapper.
> 
> Besides the audio and root domains on ADSP, Nord has two more ADSPs,
> each with its own root domain: msm/adsp1/root_pd (instance ID 123) and
> msm/adsp2/root_pd (instance ID 124). Nord also has four CDSPs, but they
> all share the same instance ID and root domain, so a single
> msm/cdsp/root_pd entry covers them.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
