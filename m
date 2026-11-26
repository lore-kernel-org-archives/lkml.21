Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681916;
	b=FdDgFv+2DJRPw97i6G00+PHYCdZZPuCysP9Oo8sTITmJmkdBYueYbmEqrtUMNV+ln2+N
	 F5nbd1BqS/UzaS/0A6O2Vp/gJPglUM829IaP5oh6iELB5yylEwou15cB4qQgq0c1nnugd
	 HiyuterAk6fqlSv/VfwG4vQSvByvlEWSr+NnXWf/iUfCrrPUva1Jl0UaUBUL9kQqXBw+g
	 6h9s8zmYG6sl4agASpLV+ZkZUyowJf7Z7zeQu2fKyCGStv5nJCHjQ3TSmTAUdm3Oz6AJ1
	 BAjYeXNctRz0KG+RrFiFcA8FYCSY3XEcElTnrrn1jdo7Ais1qsRIP+xNH2vvtfW75CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681916;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bsFyyn4glzVRtAEYcoWdywoe9cNyQJ0bI+XLL83v7f4=;
	b=OTXgoWoRO2zXftLKVIcQkZRjbQmr7P6EVCbi+vRsO4wQPuCOr5hU+B3+AbnQ+7gdPNeO
	 WiBVFNEoxuCvPDmY/rBLzy0QPlghSz/aovsf7JEK0U8dXxqbeAyOeTImr0EMnuTxx5J4h
	 eyBJdVsEVzpWQbUVD9OnZfXdzACFSV2qhqG98ImFDLJAQuXWnrUxhNgmlsKHxYhpMvyp0
	 faTlLJ9baNJZ8rpZeWVFp4S12rCZKlOpjXWhs6Gxi7Hg7Yxe7muyIP5ez4C7HAk1Dojqb
	 VTABdtSy4pjOD50ZEjR2BshbNkTsBlOBYMX8ADG6v86FMrJyb0PwkmqLlzfjRBHoBRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VHNHPIPJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Cb/6fMKG";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DEB606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70DEB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VHNHPIPJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cb/6fMKG
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ8JvDP849322
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bsFyyn4glzVRtAEYcoWdywoe9cNyQJ0bI+XLL83v7f4=; b=VHNHPIPJMFTm2FRU
	Ec47rd255jdGakFPiT7uMNt5jTPVQ1FicYqYVdwYenErQFi/LL0zxANpIH0/9R2v
	CaxDDGSgDdEcY4K7pleWjKTGOdAK1Mgtb9oWb9GOnAt87/eEaslWMZupabxh2sff
	xUNxi0+qDzGW8vT5hvGc5/mnnJBo0P1zdev6DavGVL6ePh1vfaa9UMWb+YbMWPLF
	N/D03OTZ47kaP4nP+BaIawczseyDP8EAkW6AUV4edvJDPvf9WvUFnn0BEYBP0oHk
	eOYrTAnda0Uudxk4Ns8q0cZI5VUeC7BX+R1th+ME8biWt1JXuc403hEXPY5wTB3i
	Mv6H0A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7rbyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:31:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94993a54a73so58403385a.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795681914; x=1796286714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bsFyyn4glzVRtAEYcoWdywoe9cNyQJ0bI+XLL83v7f4=;
        b=Cb/6fMKGaXX7DeYORLnDNyi3KQ7pSbCueISIgAOKLZ0XvQwJNqf7BCJ+IyQGOVk+j3
         Yrq92XewJDVlfY8pqCfDNNWgfwpeuugtyd282Yjt89bYHzCmTeRYq7fPgFt7pYJiVjr+
         TBwYweLjnrwglRFQlStNM5uDZh2k8tI7ZdXqjDDQ1X7FPBVPMfDV7OpXrdD8YgDrcXW0
         EdG5yLY7LOxMnuqmxODqhwU30glmLUDuZOF7sUZt6ZkzUJD8ksDFXR0FthrLBfLkectR
         5mE/89HFzREN74TEcb6sYjFQAkvC7f+dVZxQ9JU9VL7WRX/zFi/2kzSl9DjNURU9qPdN
         1EAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795681914; x=1796286714;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bsFyyn4glzVRtAEYcoWdywoe9cNyQJ0bI+XLL83v7f4=;
        b=jVsxIPaTqOsmUhPqFsqwnCkMJN3+P5nmcpLXlNc8fw98RTMxvoreZZxXmxUkgDWqMD
         UpJL2T36znwniJ+ZDnuMxGB16aI+Ax/edv949ybKzHsX3AZ57ea+5O0PBIn8nAvjPYJT
         fl9iwpRQjgdUGl6G4rFlLE7/rXXSb1FOgKsV3XW7eWSMeXERosE7p5zmT/zgl5rwpZPF
         skMKE9BIszlrTqlw1sMAKPPq31h8Iuft6K46xEkw6WZnVSgH1JilaIV2egA/diszAjjr
         nZzWekHpDPi4PqVqMXlxxAbXLVBienn8vgyHkGYu1yavrZY+oxVSiJQam0Porhi/yEh5
         tZgg==
X-Forwarded-Encrypted: i=1; AL+hErF8Wz1PqSb/BBkWWUJ8fpR6bc92ibLGXL6Wzdr1+8jY9lMSZeXc/HQZnNYKjsy47dOmKNRXvKnbobCTVto=@vger.kernel.org
X-Gm-Message-State: APuU4Z8K2UEvb4ImslBNs+AOgxamWSMiytDOvdcs3fqtlIv2hc4cmaWL
	39cj60lr9QIf3r8rW4uMjFCnUKRJkZMCEWNv0cgnzaoAGsSxt52MH9wvwnArxZeRCcOUPYKgEkw
	vPhDpRhkq60/QCtE+1TT4A8NrzRAN0UArW/AP8zO71+zk/MYgYl4YuLQM/Mnd2AL6VBo=
X-Gm-Gg: AZFdTZfq6oDW7N6ZERdde6wymdt9tacC2DzRL3EDZHVLfyVmoetRiI7qC5I5rW9MyJv
	t9GWAFstHamKeJC0Naw2l0eLpq/KuzXtfZG+sqB5Dc3xD5ZmNdTPPWL0J9wv9/IPT98+p7perqU
	fZnIB2Dcc8UHZstMerTP6XCQ+WjjE+aoM6oxOAjSzjzuBo8p9ZC+A6nWs3ITgWN48z4liLdTg6C
	6BLBenAEEnvq3oKcuUP9C+Xf0qPJKWo1MhbAz2LNUsv+Vh4M+ir+Mtcqmmz+MtH4EwkKRAwrs24
	L+3/Q8C/xahVBz9eetSnGquw0/khXkqg4S6i3XEKOxBAVRjGdCijhjQq8v4UaqnAx9PShlHppw8
	8WnJybbQtiPBjhYoPT2S7fTJlfUtHBiHy+pc7ttzFROXlwGB/lJJB46wjIdML+/tf8Sxv6MY=
X-Received: by 2002:a05:622a:e2cc:10b0:535:f9db:3b86 with SMTP id d75a77b69052e-55d769f824dmr343746021cf.3.1795681914149;
        Thu, 26 Nov 2026 00:31:54 -0800 (PST)
X-Received: by 2002:a05:622a:e2cc:10b0:535:f9db:3b86 with SMTP id d75a77b69052e-55d769f824dmr343745661cf.3.1795681913644;
        Thu, 26 Nov 2026 00:31:53 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e8adbsm9286795a12.17.2026.11.26.00.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:31:52 -0800 (PST)
Message-ID: <c1ec2f35-955f-4131-85f4-bae78d016c98@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 09:31:47 +0100
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
Subject: Re: [PATCH v4 5/9] drm/panel: s6e3ha8: Correct the polarity logic
 within
To: david@ixit.cz, Dzmitry Sankouski <dsankouski@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Marco Mattiolo <marco.mattiolo@hotmail.it>,
        Petr Vorel <petr.vorel@gmail.com>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20261125-crosshatch-panel-v4-0-120adc58e737@ixit.cz>
 <20261125-crosshatch-panel-v4-5-120adc58e737@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125-crosshatch-panel-v4-5-120adc58e737@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMiBTYWx0ZWRfXynds0PYdfU1B
 vRF3pqGHR2Bm13lGe1wOQvKqPhaPruBpa8Qfk0pFNfpJLQJmB/vJWVXjiYOo0aEr5dKoWR/RroA
 ng4rT976aSlbXiRQXH0P5Xyf+yPwHZM=
X-Proofpoint-GUID: VQGKyPq4KdqdS8-b3RLyDgQvdVujeCAd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMiBTYWx0ZWRfX7PrmkA+h5osS
 CoQcWjPfcVGB+KubDrbX77O4VEvS4N9CxlmSRrcxIBEkZqKH4J01Gq7biToTUryyclkzf/PJohc
 lC0ztIM9EX/Oxec7Jgp1OuRwSij9/cV9j+X1VhYV1x3+A00ZCL5xX9ln3TbGt2eQTqzcL2ThWZ3
 Kd/egAo4Y5y8dISeZFRGWcpW/lmeknu+jrp1L8nXoBHY30qfFW1Ez8GnFehmR3HfMb0wQVaHL3d
 BnIc8WXGTrYmL+ayx0NvRilP0tmfSvVBJeUNb+BcW4X/CZnVI5h4HGlE50UcLh6O3uZe87beQzb
 jbGXI3fIVJyOrJ+GERnpKCLOIq/nZnsPbW+WlhQn07LorJIfam3XSPOpwTYt2QJysFRpw43bkXi
 PbLYjZlFVJOpo2Ek6uoUr1+svqxq7c6Uf2FOHmsbXqekG0+NGt9J5aVwAX/nLL4ExV00vam23Al
 vRWuZqGA9JZPuNvsVzg==
X-Proofpoint-ORIG-GUID: VQGKyPq4KdqdS8-b3RLyDgQvdVujeCAd
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b07ee7a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7BbI1mFHGmmar5m0u5AA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260032

On 11/25/26 7:12 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The reset was introduced with wrong polarity. Correct for the future
> compatibles and keep current with reverted logic.
> 
> Old DTs keep GPIO_ACTIVE_HIGH and are fixed up via
> gpiod_toggle_active_low() on the deprecated compatible.

738455858a2d ("ASoC: codecs: wsa881x: Use proper shutdown GPIO polarity")

made it work with one compatible

Konrad
