Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787929;
	b=G4k17fj9liRutJY/oDezMUvf/pcYFjopidsKE/9WeC+rWg/us8onLzgid6UDDhR+wws+
	 ho6OKnrj+PZERfLx9S85c25gII1hp6sBKkFaVr+JNi3YffYrZSB/sBYxIn2NbxjuyMbMp
	 /telJ6HZnvCETXpmKZgx1JjubQzn9so/VVRJQTXdfiir4KULPkRuyGkekDOusqlTBE7hH
	 no26CroSgzh9gZOkkOKfwl4Gp+7fscYwIqsh2tzB6sEnX/dYrC9VhZWYaIeNJli8Elh1y
	 lZz6VQInrVdkrDoTJDSxwvtJ2bPKWwGstvR8RGBbYt3a+kZ3XWQyfo506RhppL+dJew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787929;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1v7qWyLIaLArgF+vLRv6x7RBzzWwcYRuKaCCg84dQ9A=;
	b=kPy7x4Q6h3XcYffTW2o4Ss5LZTInWRKAtWg5UuBHkpgdAnJk6sSY5cybcf1pzrm86ZJu
	 2KVE42a5iEk/j4BmE3cI3WnDITdtT+9y0sy16AUrsMTIdA0n78fZ/JTC+xFWQuLgBzZO1
	 I6VWMRhPPlTcjoxsY6x1KA6qGxoRRNYkH/qZ07hoU9KarpI+cJUxpwFwzpD27YYVnnOa8
	 CzpBu2iYVu9zZ34TA4S/c37m6v0PYdzBsGd3Fr4n2S1iT6YuIDBVT7zNmIGkw+g71QtVY
	 qwpYPCN4FhfSeJzOE2OjbkpheZM+gG0wBeAOnZSjDJ4M32VXkJWuHGtICd3FU0v9Xug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TOjcsKcu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FORsxwKQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF04606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AF04606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TOjcsKcu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FORsxwKQ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARDuC1Z1779650
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1v7qWyLIaLArgF+vLRv6x7RBzzWwcYRuKaCCg84dQ9A=; b=TOjcsKcuDkQqhKEM
	pY+66B0jBD0y+w2WuxCnqNyxwYqmtuMoZrTl0cJPLd/mTTklLplbhyMHb4TC5Wtq
	Ji2Qk2dzyLEh2cMIRuDPdYHqZpE/N6fX61D4TPWfBAqekwTKIPscpXnW+mrJEX1g
	T67dFtRLf4IjNGcPXVhIvoHFM1MztDlxyVpCMHvcXvYw2hHwPLywFmqnznbL2nOM
	sz22SEUOUEnjiVdwNO2bgpnoMVFCLggMv5jNCcGehEEubP3PBl+8lUty7whgbc4y
	8od1uEnUK+wQdjbAqIyVdpYI0rzoM6UghTNlC4hv0RttWqdHeAoj6pqD+rHn22WG
	zHDzIQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru3atnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:58:47 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ecf0967947so334129e0c.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795787926; x=1796392726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1v7qWyLIaLArgF+vLRv6x7RBzzWwcYRuKaCCg84dQ9A=;
        b=FORsxwKQO9IHATmRZuwnt/wzNKkR76nev4Im041FDN08XKsqjU4h+VVpkDoGm21N+f
         /oeDWC7HpwU5XAoQlfBoTZucLYqP2da14CrW2L7LXHltK8zA6hgd3FYjFMBJlh7gJTB+
         iD8G6N06MrZc/leeTgaSqm4ZRHGiVGyc5hvVqtkhQ6fAsP6PylP1sFZdxlR6y/biVyvP
         6suhILDhV7T7nlzNeWh9Z9G2sijUqJBTrC7KBxzn3QJYNhf6maSKO2w+9AfKYUiOWpje
         Gc72E6kLMJgBTCsCygQSVhizKDh/Je5Hnx9bL55FUerD2pHWiPV3arEFgvFuAb+dBxTF
         OYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787926; x=1796392726;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1v7qWyLIaLArgF+vLRv6x7RBzzWwcYRuKaCCg84dQ9A=;
        b=03o8jLJUPR1/xg+zd1jPcWTx54XN9ArJzt6UxJsL8Mur4iHChGwDtB7O4nQ/MCILZB
         DWFJi+P9YAAnM2WtjuTI/K+L9HEVfAzQglwr/ft7oe+sD/Q7EzsHko8Btsed8r+2y6Fu
         w2WvFbkc4x9pZau6aDRGjz3zJMgnlk199qgoDBgzVcPCMTmcoUHFNUQwoXcwbDkkJzvQ
         BYK85Wl1O9DlPTpHG8wleMsBV8+C0nEA0/qv1HLoWoiFR3Rrcvu2dWyDQrOFhx0s2JzV
         iGajhMCajud7n5N7mFna9Bu6i1MagkNwto+e5DL/bHXLnGbT4PT9r0ZAd0exP31UiKzP
         tSAw==
X-Forwarded-Encrypted: i=1; AL+hErGkzLrJGG2rgOeNIx+NybGbI5O6etjwYdAjqL80yBo4txsxWGFCk4mXO/e2sORXXej/0URzOmh0Rh2L67Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uXGjAjhFnw3SaaxMevTDLsKSeHs+H9UYJoWndx4T7GTZt7SJ9
	GBY2fU2h/L5KpkMEUpyMoeiqyiyNRWRdzaVAgdD9YQBvRu7r6YG/MVTPt2guSeRXrOUwA8BvmuJ
	jL9EWnYgRjYT5GJA0cwVDCaaUKGb6lN5CgU14IEVbhThOE74AgJYAh4qORxCtNYvcUR0=
X-Gm-Gg: AZFdTZeRCN92QiIwR2jkog0EniTjTirwDItWdyaZczqVheEpBFT5fW5wQCe44S/tFiV
	dstbnAOmQ5xBnPQnrSImUOgK9yF1vtVy2GkVf+0+d3GdQzsQwToTOZEglEFCI80Elu9aurAJgks
	X8zVIUEA2z04aHg/e+2R5rtHlL/N55jtDFfjvL+hDRu8N7JZwvz8dLY7SFGK4dHy1pDXlQFbJZT
	EpVkameApqZTuuSFtnM//CnIgCnFqrqGxR3CHYNxIg/fT+Bnre50OdhHGvB77GdcGKACfBURRRR
	pltNco1WCjoFzHfVbuev+nJR2qBED4+yWFhAY0YXPLjLuyY3NrZ5/egyCCsb/V4Oe/0sPP2jwNz
	X22dviqFtD6XxSLElR63KL6v+khoXFl9xOHSLWbC7Qv9nd+wYp3gFCh0694+tnqwZlQ9hOXc=
X-Received: by 2002:a05:6122:c2c2:10b0:5ec:b706:37e0 with SMTP id 71dfb90a1353d-5ee8ae3e277mr16434851e0c.1.1795787926311;
        Fri, 27 Nov 2026 05:58:46 -0800 (PST)
X-Received: by 2002:a05:6122:c2c2:10b0:5ec:b706:37e0 with SMTP id 71dfb90a1353d-5ee8ae3e277mr16434775e0c.1.1795787925770;
        Fri, 27 Nov 2026 05:58:45 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37109b55sm10578803a12.32.2026.11.27.05.58.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:58:45 -0800 (PST)
Message-ID: <87280d80-9047-405b-8dcc-11276d34d2dd@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:58:40 +0100
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
Subject: Re: [PATCH v3 14/14] arm64: dts: qcom: Add Samsung Galaxy XR
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Jhu <stanleyjhu@google.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-pm@vger.kernel.org
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
 <20261125-halliday-dts-v3-14-5c8311c0b70b@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125-halliday-dts-v3-14-5c8311c0b70b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b098c97 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=pIfNyjNAQl_vEFP8Sf4A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: o-_xxSLlUyUf3gbcEHIsTeQKLlQnRZKS
X-Proofpoint-ORIG-GUID: o-_xxSLlUyUf3gbcEHIsTeQKLlQnRZKS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NSBTYWx0ZWRfX5sfO2gOEGSVK
 QIE2FOBwi4HuY/a3hp4XzeZgNpEXKU3vIN3ctYCuOCwy5EyfCkQ6aJubEYJWe1HfwY5XasUfJbf
 kELyY5zmlSp2jf74IdRFIWQYhIvDuFQnd8sdpjDeok84lvyPs9ENtPTyTeaF8ws7TX2P1OKkDM+
 yQUDCIuO69dHsszI7eNcH+6I0ix+1Sk9xukOS76MLdXBIQx//gDFpKQ0fMrpqRgPPfPcDwAGFjN
 ea77BlQkb/OxbUME+PRC8T4/+XOfo4BmIVa4M9qXxTs8dlDGTSnxN6sdBVA0L+bkJa3tICypEov
 xkAyG0xb0fsaQuOiK12I/mYcjs7zebBuxwCOZlY6buCWdLY1l2Ii/moSLucslMNPOOGzc/rRbet
 d5rHVMbpE+Ss2crz2xW7Yj7zz6jv2jUSyaJQKi2aVEZEKGkyF1chSEc03htm7TEPVLollKY6+b/
 KJQiYkQtxfQ1ggx9AQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NSBTYWx0ZWRfX8H5zyZVsKILb
 pwEosiUZN9RsIlalRyjGkatCdCirV97RKh0pDFhzElrsHSyjfYhdQzKE84RBis7wOvRmFWnEDtY
 73HvIxVgzKtkGGmNPGOeFUA2UD5PmR8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270055

On 11/25/26 4:43 AM, Stanislav Aleksandrov wrote:
> Add the device tree for the Samsung Galaxy XR headset, which is based on
> the Qualcomm Halliday SoC (SXR2250P).
> 
> Supported so far: the PMICs and their regulators, the power and volume
> down keys, USB in high-speed peripheral mode and UFS storage.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
